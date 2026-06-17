{
  description = "Various user and system configs.";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    {
      system-aspects = {
        nix = import ./system/nix.nix;
        shell = import ./system/shell.nix;
        gnome = import ./system/gnome.nix;
        ssh = import ./system/ssh.nix;
        mdns = import ./system/mdns.nix;
        docker = import ./system/docker.nix;

        packages = import ./system/packages.nix;
      };

      user-aspects = {
        shell = import ./user/shell.nix;
        prompt = import ./user/prompt.nix;
        nerd-font = import ./user/nerd-font.nix;
        gnome = import ./user/gnome.nix;
        git = import ./user/git.nix;
        gh = import ./user/gh.nix;
        jj = import ./user/jj.nix;
        editor = import ./user/editor.nix;
        zed = import ./user/zed.nix;

        browser = import ./user/browser.nix;
        discord = import ./user/discord.nix;

        embedded = import ./user/embedded.nix;

        packages = import ./user/packages.nix;
      };

      lib.makeHost =
        {
          hostname,
          system,
          system-aspects ? [ ],
          user-aspects ? { },
          # specialArgs ? { },
        }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./system-configuration.nix
            home-manager.nixosModules.home-manager
            {
              networking.hostName = hostname;
              system.stateVersion = "26.05";

              users.users = nixpkgs.lib.mapAttrs (user: _: {
                isNormalUser = true;
                initialPassword = "1234";
                extraGroups = [ "wheel" ];
              }) user-aspects;

              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                sharedModules = [
                  {
                    programs.home-manager.enable = true;
                    home.stateVersion = "26.05";
                  }
                ];
                users = nixpkgs.lib.mapAttrs (user: aspects: {
                  imports = aspects;
                }) user-aspects;
              };
            }
          ]
          ++ system-aspects;
        };
    };
}
