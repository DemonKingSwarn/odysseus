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
    ./home/mime-apps.nix
    ./home/xdg-user-dirs.nix
    ./home/editorconfig.nix
  ];

  home = {
    username = "swarn";
    homeDirectory = "/home/swarn";

    stateVersion = "25.11";

    sessionPath = [
      "${config.home.homeDirectory}/.local/bin"
      "${config.home.homeDirectory}/.local/bin/statusbar"
      "${config.home.homeDirectory}/.local/share/cargo/bin"
      "${config.home.homeDirectory}/Applications"
      "${config.home.homeDirectory}/dox/jai/bin"
    ];

    sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "helium-browser";
      TERMINAL = "ghostty";

      ZDOTDIR = "${config.home.homeDirectory}/.config/zsh";
    };

    packages = with pkgs; [
      zsh
      zinit
      bat
      eza
      fzf
      git
      duf
      zoxide
      starship
      tmux
      ripgrep
      inputs.hypr-wellbeing.packages.${pkgs.system}.default
      inputs.luffy.packages.${system}.luffy
    ];
  };

  programs = {
    home-manager.enable = true;
  };

  systemd.user.startServices = "sd-switch";
}
