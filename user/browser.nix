{ pkgs, config, ... }:
{
  programs.firefox = {
    enable = true;
    profiles.default = {
      id = 0;
      path = config.home.username;
      settings = {
        "browser.gnome-search-provider.enabled" = true;
      };
    };
  };

  home.sessionVariables = {
    BROWSER = "firefox";
  };

  home.packages = [
    (pkgs.writeTextDir "share/gnome-shell/search-providers/firefox-search-provider.ini" ''
      [Shell Search Provider]
      DesktopId=firefox.desktop
      BusName=org.mozilla.firefox.SearchProvider
      ObjectPath=/org/mozilla/firefox/SearchProvider
      Version=2
    '')
  ];
}
