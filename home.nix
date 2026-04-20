{ config, pkgs, inputs, ... }:

{
  imports = [
    ./home/git.nix
    ./home/zsh.nix
    ./home/tmux.nix
    ./home/starship.nix
    ./home/ghostty.nix
  ];

  home.username = "swarn";
  home.homeDirectory = "/home/swarn";
  
  home.stateVersion = "25.11";

  home.packages = [
    inputs.hypr-wellbeing.packages.${pkgs.system}.default   
  ];

  home = {
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
  };

  programs = { 
    home-manager.enable = true; 
    git.enable = true;
    bat.enable = true;
    tmux.enable = true;
    starship.enable = true;
  };
  
  systemd.user.startServices = "sd-switch";

  
}
