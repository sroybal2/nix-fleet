{ config, ... }:
let
  fleet = "/home/steve/nix-fleet";
in {
  imports = [ ./helix.nix ];

  home.username = "steve";
  home.homeDirectory = "/home/steve";
  home.stateVersion = "25.11";

  xdg.configFile."niri/config.kdl".source =
    config.lib.file.mkOutOfStoreSymlink "${fleet}/niri/config.kdl";

  xdg.configFile."noctalia".source =
    config.lib.file.mkOutOfStoreSymlink "${fleet}/noctalia";
}
