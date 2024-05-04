{
  imports = [
    ./modules/programs
    ./modules/dotfiles.nix
    ./modules/packages.nix
    ./modules/variables.nix
    ./modules/plasma.nix
    ./modules/qt.nix
  ];

  home.username = "dkrasiev";
  home.homeDirectory = "/home/dkrasiev";

  home.stateVersion = "23.11"; # Please read the comment before changing.
}
