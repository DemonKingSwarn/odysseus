{ ... }:
{
  programs.jujutsu = {
    enable = false;

    settings = {
      user = {
        name = "DemonKingSwarn";
        email = "swarnaditya.7@proton.me";
      };

      ui = {
        color = "always";
        diff-formatter = ":git";  # or ":color-words"
        # default-command = "log --reversed";
      };

    };
  };
}
