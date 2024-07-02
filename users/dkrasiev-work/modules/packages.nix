{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ../../../packages/firefox45.nix
  ];
}
