{ pkgs, ... }:

{
  programs.fish.enable = true;
  programs.fish.plugins = [
    { name = "pure"; src = pkgs.fishPlugins.pure.src; }
    { name = "done"; src = pkgs.fishPlugins.done.src; }
  ];
}
