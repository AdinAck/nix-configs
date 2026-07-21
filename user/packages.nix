{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # nix
    nil
    nixd
    nh
    alejandra

    # rust
    clang
    rustup
    just

    # networking
    netscanner

    # misc
    bat
  ];
}
