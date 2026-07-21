{ pkgs, ... }:
{
  home.packages = with pkgs; [
    probe-rs-tools
    flip-link
    cargo-bloat
    cargo-binutils
  ];
}
