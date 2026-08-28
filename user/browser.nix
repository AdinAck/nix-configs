{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    policies = {
      Preferences = {
        "browser.gnome-search-provider.enabled" = {
          Value = true;
          Status = "default";
        };
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
