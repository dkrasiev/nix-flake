{ pkgs, ... }:

{
  programs.fish.enable = true;

  programs.fish.plugins = [
    { name = "pure"; src = pkgs.fishPlugins.pure.src; }
    { name = "done"; src = pkgs.fishPlugins.done.src; }
  ];

  programs.fish.shellAliases = {
    "emias-shell" = "nix develop ~/nix#emias --command fish";
    "nixos-update" = "nix flake update ~/nix";
    "nixos-switch" = "nh os switch";
    "nixos-boot" = "nh os boot";
  };

  programs.fish.interactiveShellInit = ''
    set --universal pure_enable_single_line_prompt true
  '';
}
