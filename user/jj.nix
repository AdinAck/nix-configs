{ pkgs, ... }:
{
  programs.jujutsu = {
    enable = true;

    settings = {
      user = {
        name = "Adin Ackerman";
        email = "adinackerman@gmail.com";
      };

      ui = {
        default-command = [
          "log"
          "-r"
          "trunk()::"
        ];

        diff-formatter = [
          "difft"
          "--color=always"
          "$left"
          "$right"
        ];
      };

      aliases = {
        # After a squash merge of a PR, main is added as a sibling to changes
        # that were *after* the PR. This alias rebases those changes back onto
        # main where they should be.
        sync = [
          "rebase"
          "-s"
          "((roots((((::trunk()):: ~ ::trunk()) & mutable())..(::trunk()))-)+ & mutable()) ~ ::trunk()"
          "-o"
          "trunk()"
        ];
      };
    };
  };

  # `ui.diff-formatter` above invokes `difft`, so make difftastic available.
  home.packages = [ pkgs.difftastic ];
}
