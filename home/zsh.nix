{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    plugins = [
      {
        name = "fzf-tab";
        src = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
      }
      {
        name = "zsh-vi-mode";
        src = "${pkgs.zsh-vi-mode}/share/zsh-vi-mode";
      }
    ];

    history = {
      size = 10000;
      save = 10000;
      path = "${config.xdg.cacheHome}/zsh/history";
      ignoreDups = true;
      ignoreSpace = true;
      share = true;
      expireDuplicatesFirst = true;
    };

    shellAliases = {
      sch = "sudo systemctl set-environment SCX_SCHEDULER_OVERRIDE=scx_lavd && sudo systemctl restart scx";

      ".." = "cd ..";

      zrc = "nvim $HOME/.config/zsh/.zshrc";

      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gu = "git pull";
      gd = "git diff";
      gl = "git log --all --graph --pretty=format:'%C(magenta))%h %C(white) %an  %ar%C(auto) %D%n%s%n'";
      gb = "git branch";
      gi = "git init";
      gcl = "git clone";

      swww = "awww";
      weather = "curl -s 'https://wttr.in/?1n'";
      pacgraph = "pacgraph --show-req-by -b '#232738' -l '#9778d3' -t '#cca9c6' -d '#b8d0eb'";
      grep = "grep --color=auto";
      stow = "stow --ignore='screenshot.png' --ignore='README.org' --ignore='.git' --ignore='.assets' --ignore='deploy.sh'";
      yarn = "yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config";
      diff = "diff --color=auto";
      df = "duf -hide special";
      neofetch = "fastfetch --kitty ~/.config/fastfetch/logos/arch-logo.png --logo-width 45";
      irssi = "irssi --config=$XDG_CONFIG_HOME/irssi/config --home=$XDG_DATA_HOME/irssi";
      cat = "bat --paging=never";
      less = "bat --paging=always";
      x = "exit";
      logout = "pkill -u $USER";
      dir = "dir --color=auto";
      networkusage = "vnstat -i wlo1";
      b = "brightnessctl set";
      hostname = "uname -n";
      wiki = "nvim $XDG_DATA_HOME/vimwiki/index_$(date '+%a-%d-%m-%y-%H:%M').wiki";
      dosbox = "dosbox -conf $XDG_CONFIG_HOME/dosbox/dosbox.conf";
      adb = "HOME=$XDG_DATA_HOME/android adb";
      time = "hyperfine";
      thumb = "yt-dlp --write-thumbnail --skip-download";
      SS = "sudo systemctl";
      j = "sudo journalctl";
      lsusb = "cyme --headings --tree --hide-buses";
      wget = "wcurl";
      open = "xdg-open";
      loc = "~/.local/share/go/bin/scc";
      rtmp = "podman run -d -p 1935:1935 --name nginx docker.io/tiangolo/nginx-rtmp";
      lf = "yazi";
      dfm = "demonfm";

      ls = "eza";
      ll = "eza -lgh";
      la = "eza -lagh";
      tree = "eza -T";

      mv = "mvg -ig";
      rm = "rip -i --graveyard $HOME/.local/share/Trash";
      ln = "ln -i";
      cp = "cpg -ig";

      "scheiße" = "bash";
      e = "$EDITOR";
      edit = "msedit";
      c = "clear";

      xcc = "xclip -selection clipboard";
      xco = "xclip -selection clipboard -o";
      pbcopy = "wl-copy";
      pbpaste = "wl-paste";

      install = "paru -Slq | fzf --multi --preview 'paru -Si {1}' | xargs -ro paru -S";
      uninstall = "paru -Qq | fzf --multi --preview 'paru -Qi {1}' | xargs -ro paru -Rcns";
      update = "paru -Syu --noconfirm";
      garbage = "paru -Rcns $(paru -Qqdtt)";
    };

    initContent = ''
      unset __HM_SESS_VARS_SOURCED
      source ~/.nix-profile/etc/profile.d/hm-session-vars.sh

      # global aliases
      alias -g NE='2>/dev/null'
      alias -g DN='> /dev/null'
      alias -g NUL='>/dev/null 2>&1'
      alias -g JQ='| jq'
      alias -g C='| wl-copy'

      autoload -U compinit && compinit

      # keybindings
      bindkey -v
      bindkey '^f' autosuggest-accept
      bindkey '^p' history-search-backward
      bindkey '^n' history-search-forward
      autoload -Uz edit-command-line
      zle -N edit-command-line
      bindkey '^X^e' edit-command-line
      bindkey ' ' magic-space
      bindkey -s '^o' 'lfcd\n'

      # completion styling
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
      zstyle ':completion:*' menu no
      zstyle ':fzf-tab:complete:cd:*' fzf-preview "eza $realpath"
      zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview "eza $realpath"

      # sourcing
      source "''${XDG_CONFIG_HOME:-''${HOME}/.config}/shell/profile"

      # shell integration
      eval "$(fzf --zsh)"
      eval "$(zoxide init --cmd cd zsh)"
      eval "$(starship init zsh)"
      eval "$(atuin init zsh)"

      # functions
      function help() {
        "$@" --help 2>&1 | bat --plain --language=help
      }
      function chst() {
        [ -z $1 ] && echo "no args provided!" || (curl -s cheat.sh/$1 | bat --style=plain)
      }
      function gdown() {
        agent="Mozilla/5.0 (X11; Linux x86_64; rv:129.0) Gecko/20100101 Firefox/129.0"
        uuid=$(curl -sL "$1" -A "$agent" | sed -nE 's|.*(uuid=[^"]*)".*|\1|p')
        aria2c -x16 -s16 "$1&confirm=t&$uuid" -U "$agent" --summary-interval=0 -d "''${2:-.}"
      }
      function fshow() {
        git log --graph --color=always \
            --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
        fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
            --bind "ctrl-m:execute:
                      (grep -o '[a-f0-9]\{7\}' | head -1 |
                      xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                      {}
                      FZF-EOF"
      }
      function lfcd() {
        tmp="$(mktemp)"
        yazi -last-dir-path="$tmp" "$@"
        if [ -f "$tmp" ]; then
          dir="$(cat "$tmp")"
          /usr/sbin/rm -f "$tmp"
          [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
        fi
      }
      function tm() {
        tmux-sessionizer
      }
      function cheat() {
        lang=$(curl -s cheat.sh/:list | fzf --reverse --height=50%)
        curl -s cheat.sh/$lang | bat --paging=always
      }
      function supercat() {
        if [ "$(printf '%s' "$1" | cut -d '.' -f2)" = "jai" ]; then
          bat -l odin "$1"
        else
          bat "$1"
        fi
      }
      function mkcd() {
        mkdir -p "$1"
        cd "$1"
      }
      function pdfmaker() {
        pandoc --pdf-engine=pdfroff "$1" -o "$2.pdf"
      }

      # greeting
      if [ "$TERM_PROGRAM" = "tmux" ]; then
        figlet "tmux"
      else
        greet
      fi
    '';
  };
}
