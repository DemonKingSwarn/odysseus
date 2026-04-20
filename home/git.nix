{ ... }:
{
  xdg.enable = true;

  programs.git = {
    enable = true;
    
    settings = {
      user = { 
        name = "DemonKingSwarn";
        email = "rockingswarn@gmail.com";
      };

      init = {
        defaultBranch = "master";
      };

      core = {
        compression = 4;
        whitespace = "error";
        preloadIndex = true;
      };

      advice = {
        addEmptyPathspec = false;
        pushNonFastForward = false;
        statusHints = false;
      };

      status = {
        branch = true;
        showStash = true;
        showUntrackedFiles = "all";
      };

      diff = {
        context = 3;
        renames = "copies";
        interHunkContext = 10;
      };

      push = {
        autoSetupRemote = true;
        default = "current";
        followTags = true;
      };

      pull = {
        rebase = true;
      };

      rebase = {
        autoStash = true;
        missingCommitsCheck = "warn";
      };

      http = {
        sslVerify = false;
        version = "HTTP/1.1";
      };

      gpg.format = "ssh";

      url = {
        "git@github.com:demonkingswarn/" = {
          insteadOf = "dks:/";
        };
        "git@github.com:" = {
          insteadOf = "gh:";
        };
      };

      credential = {
        "https://github.com".helper = [ "" "!/usr/bin/gh auth git-credential" ];
        "https://gist.github.com".helper = [ "" "!/usr/bin/gh auth git-credential" ];
      };

    };
  };
}
