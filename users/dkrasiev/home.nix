{ config, pkgs, ... }:

{
  imports = [
    ../dkrasiev-base/configuration.nix

    ./modules/git.nix
  ];
  
  home.username = "dkrasiev";
  home.homeDirectory = "/home/dkrasiev";
}
