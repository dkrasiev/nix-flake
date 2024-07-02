{ pkgs, ... }:

{
  home.pointerCursor = {
    package = pkgs.vanilla-dmz;
    name = "Vanilla-DMZ";

    gtk.enable = true;
    x11.enable = true;
  };
}
