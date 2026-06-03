{ pkgs, ... }:
{
  xdg.enable = true;

  programs.tmux = {
    enable = true;
    prefix = "C-s";
    mouse = true;
    baseIndex = 0;

    plugins = with pkgs.tmuxPlugins; [
      sensible
      vim-tmux-navigator
      yank
    ];

    extraConfig = ''
      set-option -g status-position top
      set -g focus-events on

      unbind r
      bind r source-file ~/.config/tmux/tmux.conf \; display-message "tmux.conf reloaded."

      bind-key d detach
      bind-key p display-popup
      bind-key f run-shell "~/.dots/.local/bin/tmux-sessionizer"

      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      # Nord colors
      # nord0=#2E3440 nord1=#3B4252 nord2=#434C5E nord3=#4C566A
      # nord4=#D8DEE9 nord5=#E5E9F0 nord6=#ECEFF4
      # nord7=#8FBCBB nord8=#88C0D0 nord9=#81A1C1 nord10=#5E81AC
      # nord11=#BF616A nord12=#D08770 nord13=#EBCB8B nord14=#A3BE8C nord15=#B48EAD

      set -g pane-border-style fg=#3B4252
      set -g pane-active-border-style fg=#B48EAD

      set -g message-style fg=#D8DEE9,bg=#3B4252

      set -g status-style fg=#D8DEE9,bg=#2E3440
      set -g status-justify left

      set -g window-status-format "#[fg=#2E3440,bg=#3B4252,nobold,noitalics,nounderscore] #[fg=#D8DEE9,bg=#3B4252]#I #[fg=#3B4252,bg=#434C5E,nobold,noitalics,nounderscore] #[fg=#D8DEE9,bg=#434C5E]#W #F #[fg=#434C5E,bg=#2E3440,nobold,noitalics,nounderscore]"
      set -g window-status-current-format "#[fg=#2E3440,bg=#B48EAD,nobold,noitalics,nounderscore] #[fg=#2E3440,bg=#B48EAD]#I #[fg=#B48EAD,bg=#81A1C1,nobold,noitalics,nounderscore] #[fg=#2E3440,bg=#81A1C1]#W #F #[fg=#81A1C1,bg=#2E3440,nobold,noitalics,nounderscore]"
      set -g window-status-separator ""

      set -g status-left "#[fg=#2E3440,bg=#B48EAD,bold] #S #[fg=#B48EAD,bg=#2E3440,nobold,noitalics,nounderscore]"
      set -g status-right "#[fg=#3B4252,bg=#2E3440,nobold,noitalics,nounderscore]#[fg=#D8DEE9,bg=#3B4252] #{pane_current_path} #[fg=#434C5E,bg=#3B4252,nobold,noitalics,nounderscore]#[fg=#D8DEE9,bg=#434C5E] #(whoami)@#H #[fg=#B48EAD,bg=#434C5E,nobold,noitalics,nounderscore]#[fg=#2E3440,bg=#B48EAD,bold] #S "
      set -g status-right-length 150
    '';
  };
}
