{
  imports = [
    ./hardware-configuration.nix

    ../default/base-configuration.nix

    ../default/managers/sddm.nix
    ../default/managers/hyprland.nix
  ];
}
