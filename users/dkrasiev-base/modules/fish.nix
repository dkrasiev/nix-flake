{ pkgs, ... }:

{
  programs.fish.enable = true;

  programs.fish.plugins = [
    { name = "pure"; src = pkgs.fishPlugins.pure.src; }
    { name = "done"; src = pkgs.fishPlugins.done.src; }
  ];

  # programs.fish.shellAliases = {
  #   "node14" = "nix develop ~/nix#node14 --command fish";
  # };

  programs.fish.interactiveShellInit = ''
    set --universal pure_enable_single_line_prompt true
  '';
}
