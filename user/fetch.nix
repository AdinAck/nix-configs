{ pkgs, lib, ... }: {
  programs.fastfetch.enable = true;

  home.shellAliases = {
    fetch = "${lib.getExe pkgs.fastfetch}";
  };
}
