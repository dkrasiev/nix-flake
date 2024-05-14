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
    "nixos-upgrade" = "nixos-update && nixos-switch && home-switch";
    "nixos-switch" = "nh os switch";
    "nixos-boot" = "nh os boot";
    "home-switch" = "nh home switch";

    "nvchad" = "NVIM_APPNAME=nvchad nvim";
    "lazynvim" = "NVIM_APPNAME=lazynvim nvim";
  };
}
