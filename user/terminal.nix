{
  programs.ghostty = {
    enable = true;

    settings = {
      font-family = "MesloLGLDZ Nerd Font Mono";
      font-size = 10;
      cursor-style = "bar";
      theme = "graphene";
    };
  };

  xdg.configFile."ghostty/themes/graphene".text = ''
    background = #1e1e1e
    foreground = #d4d4d4
    cursor-color = #808080
    cursor-text = #1e1e1e
    selection-background = #404040
    selection-foreground = #d4d4d4
    palette = 0=#303030
    palette = 1=#d16969
    palette = 2=#58cc27
    palette = 3=#d7da7d
    palette = 4=#285dc7
    palette = 5=#c586c0
    palette = 6=#4ec9b0
    palette = 7=#d4d4d4
    palette = 8=#808080
    palette = 9=#e64545
    palette = 10=#b5cea8
    palette = 11=#ce9178
    palette = 12=#9cdcfe
    palette = 13=#c586c0
    palette = 14=#4ec9b0
    palette = 15=#d4d4d4
  '';
}
