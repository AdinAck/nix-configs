{ pkgs, ... }:
{
  services = {
    xserver.enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    gnome = {
      core-apps.enable = true;
      core-developer-tools.enable = true;
      games.enable = false;
    };
  };

  programs = {
    dconf.enable = true;
  };

  environment.gnome.excludePackages = with pkgs; [
    epiphany
  ];
}
