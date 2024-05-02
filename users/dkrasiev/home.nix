{ config, pkgs, settings, ... }:

with settings.user;
{
  imports = [
    ../dkrasiev-base/configuration.nix

    ./modules/git.nix
  ];
  
  home.username = username;
  home.homeDirectory = "/home/${username}";
}
