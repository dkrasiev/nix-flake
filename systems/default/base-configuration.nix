{
  imports = [
    ./modules/packages
    ./modules/programs
    ./modules/services
    ./modules/virtualisation

    ./modules/bluetooth.nix
    ./modules/bootloader.nix
    ./modules/networking.nix
    ./modules/nix.nix
    ./modules/polkit.nix
    ./modules/sound.nix
    ./modules/users.nix
    ./modules/zram-swap.nix
  ];
}
