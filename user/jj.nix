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

  home = {
    packages = [ pkgs.difftastic ];
    shellAliases = {
      jjst = "jj status";
      jjn = "jj new";
      jje = "jj edit";
      jjc = "jj commit";
      jja = "jj abandon";
      jjl = "jj log";
      jjd = "jj diff";
      jjde = "jj describe";
      jjsq = "jj squash";
      jjgf = "jj git fetch";
      jjgp = "jj git push";
      jjrb = "jj rebase";
      jjb = "jj bookmark";
      jjbc = "jj bookmark create";
      jjbm = "jj bookmark move";
      jjbt = "jj bookmark track";
      jjbs = "jj bookmark set";
    };
  };
}
