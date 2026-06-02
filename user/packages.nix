{pkgs, ...}: {
  home.packages = with pkgs; [
    ripgrep
    nil
    alejandra
  ];
}
