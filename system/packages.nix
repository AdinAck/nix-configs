{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    inetutils
    net-tools
  ];
}
