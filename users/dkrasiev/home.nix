{
  imports = [
    ./modules/programs
    ./modules/dotfiles.nix
    ./modules/packages.nix
    ./modules/variables.nix
    ./modules/plasma.nix
    ./modules/qt.nix
  ];

  home.stateVersion = "23.11"; # Please read the comment before changing.
}
