{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # nix
    nil
    nixd
    nh
    alejandra

    # rust
    lldb
    clang
    rustup
    just
    cargo-expand

    # networking
    netscanner
  ];

}
