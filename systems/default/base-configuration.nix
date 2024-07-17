{
  imports = [
    ./modules/packages
    ./modules/programs
    ./modules/services
    ./modules/virtualisation

    ./modules/bootloader.nix
    ./modules/nix.nix
    ./modules/users.nix
    ./modules/bluetooth.nix
    ./modules/networking.nix
    ./modules/sound.nix
    ./modules/zram-swap.nix
  ];
}
