{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ripgrep
    nil
    nixd
    nh
    alejandra
  ];
}
