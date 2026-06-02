{
  programs.gh = {
    enable = true;

    # Enabled by default when gh is on, but set explicitly since pairing it
    # with git is the whole point here.
    gitCredentialHelper.enable = true;

    settings.git_protocol = "https";
  };
}
