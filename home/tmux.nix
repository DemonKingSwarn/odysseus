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

      # Catppuccin Mocha colors
      # base=#1e1e2e surface0=#313244 surface1=#45475a
      # text=#cdd6f4 subtext0=#a6adc8
      # mauve=#cba6f7 blue=#89b4fa cyan=#89dceb
      # green=#a6e3a1 pink=#f38ba8

      set -g pane-border-style fg=#313244
      set -g pane-active-border-style fg=#cba6f7

      set -g message-style fg=#cdd6f4,bg=#313244

      set -g status-style fg=#cdd6f4,bg=#1e1e2e
      set -g status-justify left

      set -g window-status-format "#[fg=#1e1e2e,bg=#313244,nobold,noitalics,nounderscore] #[fg=#a6adc8,bg=#313244]#I #[fg=#313244,bg=#45475a,nobold,noitalics,nounderscore] #[fg=#cdd6f4,bg=#45475a]#W #F #[fg=#45475a,bg=#1e1e2e,nobold,noitalics,nounderscore]"
      set -g window-status-current-format "#[fg=#1e1e2e,bg=#cba6f7,nobold,noitalics,nounderscore] #[fg=#1e1e2e,bg=#cba6f7]#I #[fg=#cba6f7,bg=#89b4fa,nobold,noitalics,nounderscore] #[fg=#1e1e2e,bg=#89b4fa]#W #F #[fg=#89b4fa,bg=#1e1e2e,nobold,noitalics,nounderscore]"
      set -g window-status-separator ""

      set -g status-left "#[fg=#1e1e2e,bg=#cba6f7,bold] #S #[fg=#cba6f7,bg=#1e1e2e,nobold,noitalics,nounderscore]"
      set -g status-right "#[fg=#313244,bg=#1e1e2e,nobold,noitalics,nounderscore]#[fg=#a6adc8,bg=#313244] #{pane_current_path} #[fg=#45475a,bg=#313244,nobold,noitalics,nounderscore]#[fg=#cdd6f4,bg=#45475a] #(whoami)@#H #[fg=#cba6f7,bg=#45475a,nobold,noitalics,nounderscore]#[fg=#1e1e2e,bg=#cba6f7,bold] #S "
      set -g status-right-length 150
    '';
  };
}
