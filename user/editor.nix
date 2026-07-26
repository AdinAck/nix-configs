{
  programs.micro = {
    enable = true;
    settings = {
      colorscheme = "graphene";
    };
  };

  home.sessionVariables = {
    EDITOR = "micro";
  };

  xdg.configFile."micro/colorschemes/graphene.micro".text = ''
    color-link default "#d4d4d4,#1e1e1e"
    color-link comment "#808080"
    color-link identifier "#fbcb00"
    color-link constant.string "#98bb05"
    color-link constant.number "#d3869b"
    color-link constant "#fa9d0e"
    color-link statement "#fb4833"
    color-link symbol "#d5c4a1"
    color-link preproc "#8ec07c"
    color-link type "#fabd2e"
    color-link special "#fbcb00"
    color-link error "bold #fb4833"
    color-link statusline "#d4d4d4,#303030"
    color-link tabbar "#d4d4d4,#303030"
    color-link indent-char "#404040"
    color-link line-number "#808080,#1e1e1e"
    color-link current-line-number "#d4d4d4,#1e1e1e"
    color-link cursor-line "#303030"
  '';
}
