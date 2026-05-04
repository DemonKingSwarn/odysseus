{ config, ... }:

let
  inherit (config.home) homeDirectory;
in
{
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;

      templates = null;
      publicShare = null;

      desktop = homeDirectory;
      download = "${homeDirectory}/dl";
      documents = "${homeDirectory}/dox";
      music = "${homeDirectory}/media/musics";
      pictures = "${homeDirectory}/media/pix";
      videos = "${homeDirectory}/media/vids";
      projects = "${homeDirectory}/dox/code";
    };

    configFile."user-dirs.locale".text = "en_IN";
  };
}
