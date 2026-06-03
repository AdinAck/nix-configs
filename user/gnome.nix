{ lib, ... }:
with lib.hm.gvariant;
{
  dconf.settings = {
    "org/gnome/Console" = {
      custom-font = "MesloLGLDZ Nerd Font Mono 10";
      theme = "night";
      use-system-font = false;
    };

    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/tubes-l.jxl";
      picture-uri-dark = "file:///run/current-system/sw/share/backgrounds/gnome/tubes-d.jxl";
      primary-color = "#000000";
      secondary-color = "#000000";
    };

    "org/gnome/desktop/interface" = {
      accent-color = "orange";
      color-scheme = "prefer-dark";
    };

    "org/gnome/desktop/screensaver" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/tubes-l.jxl";
      primary-color = "#000000";
      secondary-color = "#000000";
    };

    "org/gnome/desktop/session" = {
      idle-delay = mkUint32 0;
    };

    "org/gnome/mutter" = {
      workspaces-only-on-primary = false;
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-schedule-automatic = false;
    };

    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "nothing";
    };
  };
}
