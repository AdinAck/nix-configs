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
	shell = import ./system/shell.nix;
        gnome = import ./system/gnome.nix;

	packages = import ./system/packages.nix;
      };

      user-aspects = {
        shell = import ./user/shell.nix;
        prompt = import ./user/prompt.nix;
        git = import ./user/git.nix;
        gh = import ./user/gh.nix;
        jj = import ./user/jj.nix;
        zed = import ./user/zed.nix;

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
              system.stateVersion = "25.11";

              users.users = nixpkgs.lib.mapAttrs (user: _: {
                isNormalUser = true;
                initialPassword = "1234";
		extraGroups = [ "wheel"  ];
              }) user-aspects;

              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                sharedModules = [
                  {
                    programs.home-manager.enable = true;
                    home.stateVersion = "25.11";
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
