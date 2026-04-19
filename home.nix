{ config, pkgs, inputs, ... }:

{
  imports = [
    ./config/zsh.nix
    ./config/ghostty.nix
  ];

  home.username = "swarn";
  home.homeDirectory = "/home/swarn";
  
  home.stateVersion = "25.11";

  home.packages = [
    inputs.hypr-wellbeing.packages.${pkgs.system}.default   
  ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home = {
    sessionPath = [
      "${config.home.homeDirectory}/.local/bin"
      "${config.home.homeDirectory}/.local/bin/statusbar"
      "${config.home.homeDirectory}/.local/share/cargo/bin"
      "${config.home.homeDirectory}/.nix-profile/bin"
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

  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";
}
