{ nixos-hardware, ... }:

{
  imports = [
    nixos-hardware.nixosModules.common-cpu-amd
    nixos-hardware.nixosModules.common-gpu-amd
    nixos-hardware.nixosModules.common-pc-ssd

    ../default/configuration.nix
    ./hardware-configuration.nix

    ./modules/syncthing.nix
  ];
}
