{ pkgs, ... }: let binary = "${pkgs.jj-starship}/bin/jj-starship"; in
{
  programs.starship = {
    enable = true;
    settings = {
    	custom.jj = {
    		when = "${binary} detect";
    		shell = ["${binary}" "--id-length" "4" "--no-symbol"];
    		format = "$output ";
    	};
    	git_branch.disabled = true;
    	git_commit.disabled = true;
    	git_status.disabled = true;
    };
  };
}
