{
  imports = [
    ./hardware-configuration.nix

    ./modules/services/configuration.nix
    ./modules/programs/configuration.nix

    ./modules/packages.nix
    ./modules/bootloader.nix
    ./modules/nix.nix
    ./modules/users.nix
    ./modules/networking.nix
    ./modules/bluetooth.nix
    ./modules/sound.nix
    ./modules/zram-swap.nix

    # ./modules/managers/gdm.nix
    # ./modules/managers/gnome.nix
    ./modules/managers/sddm.nix
    ./modules/managers/plasma6.nix
    ./modules/managers/hyprland.nix
  ];

  # Set your time zone.
  time.timeZone = "Europe/Samara";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  system.stateVersion = "23.11"; # Did you read the comment?
}
