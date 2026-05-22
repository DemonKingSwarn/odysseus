{ config, pkgs, inputs, ... }:

{
  imports = [
    ./home/nix.nix
    ./home/git.nix
    ./home/bat.nix
    ./home/eza.nix
    ./home/fzf.nix
    ./home/zsh.nix
    ./home/gpg.nix
    ./home/tmux.nix
    ./home/starship.nix
    ./home/ghostty.nix
    ./home/wezterm.nix
    ./home/mime-apps.nix
    ./home/xdg-user-dirs.nix
    ./home/editorconfig.nix
  ];

  targets.genericLinux.enable = true;

  xdg = {
    enable = true;
    mime.enable = true;
  };

  home = {
    username = "swarn";
    homeDirectory = "/home/swarn";

    stateVersion = "25.11";



    sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "helium-browser";
      TERMINAL = "ghostty";
      TERM = "xterm-256color";

      ANDROID_SDK = "/opt/android-sdk";

      ZDOTDIR = "${config.home.homeDirectory}/.config/zsh";
    };

    sessionPath = [
      "${config.home.homeDirectory}/.local/bin"
      "${config.home.homeDirectory}/.local/bin/statusbar"
      "${config.home.homeDirectory}/.local/share/cargo/bin"
      "${config.home.homeDirectory}/.local/share/go/bin"
      "${config.home.homeDirectory}/Applications"
      "${config.home.homeDirectory}/opt/jai/bin"
      "/opt/android-sdk/platform-tools"
    ];

    packages = with pkgs; [
      zinit
      duf
      zoxide
      rm-improved
      ripgrep
      yazi
      aria2
      figlet
      lazygit
      atuin
      inputs.hypr-wellbeing.packages.${pkgs.system}.default
      inputs.luffy.packages.${system}.luffy
    ];
  };

  programs = {
    home-manager.enable = true;
  };

  systemd.user.startServices = "sd-switch";
}
