{
  imports = [
    ../default/configuration.nix
    ./hardware-configuration.nix

    ./modules/syncthing.nix
  ];
}
