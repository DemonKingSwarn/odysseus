{ ... }:

{
  programs.ghostty = {
    enable = true;

    settings = {
      theme = "Catppuccin Mocha";
      #background = "#282a36";
      background-opacity = 0.90;

      window-vsync = true;

      title = "Ghostty";
      class = "ghostty";

      shell-integration = "zsh";

      quick-terminal-position = "top";
      quick-terminal-autohide = false;

      font-family = "LythMono Nerd Font";
      font-size = 16;

      cursor-style = "block";
      cursor-style-blink = false;
      cursor-opacity = 0.90;
      mouse-hide-while-typing = true;
      shell-integration-features = "no-cursor";

      #gtk-titlebar = false;
      window-decoration = "server";
      confirm-close-surface = false;

      window-theme = "ghostty";

      window-padding-x = 10;
      window-padding-y = 10;
      window-padding-balance = true;

      keybind = [
        "alt+shift+r=reload_config"
        "ctrl+a=toggle_quick_terminal"
        "ctrl+shift+s=new_tab"
      ];
    };
  };
}
