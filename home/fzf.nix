{ lib, ... }:

{


  programs.fzf = {
    enable = true;
    colors = lib.mkForce {
      bg       = "#1e1e2e";
      "bg+"    = "#313244";
      fg       = "#cdd6f4";
      "fg+"    = "#cdd6f4";
      hl       = "#f38ba8";
      "hl+"    = "#f38ba8";
      header   = "#f38ba8";
      info     = "#cba6f7";
      marker   = "#b4befe";
      pointer  = "#f5e0dc";
      prompt   = "#cba6f7";
      spinner  = "#f5e0dc";
      selected-bg = "#45475a";
    };

    defaultOptions = [
      "--height 40%"
      "--reverse"
      "--border"
      "--color=16"
    ];

    defaultCommand = "rg --files --hidden --glob=!.git/";
  };
}
