{
  programs.firefox = {
    enable = true;
    enableGnomeExtensions = true;
  };

  home.sessionVariables = {
    BROWSER = "firefox";
  };
}
