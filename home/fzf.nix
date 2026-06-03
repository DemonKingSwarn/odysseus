{ lib, ... }:

{
  programs.fzf = {
    enable = true;
    colors = lib.mkForce {
      bg       = "#2E3440";
      "bg+"    = "#3B4252";
      fg       = "#D8DEE9";
      "fg+"    = "#ECEFF4";
      hl       = "#BF616A";
      "hl+"    = "#BF616A";
      header   = "#BF616A";
      info     = "#B48EAD";
      marker   = "#88C0D0";
      pointer  = "#E5E9F0";
      prompt   = "#B48EAD";
      spinner  = "#E5E9F0";
      selected-bg = "#434C5E";
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
