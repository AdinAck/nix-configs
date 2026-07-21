{ pkgs, ... }:
{
  programs.gh-dash.enable = true;

  programs.gh = {
    enable = true;
    extensions = [ pkgs.gh-dash ];
  };
}
