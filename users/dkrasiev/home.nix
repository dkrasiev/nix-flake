{
  imports = [
    ./modules/dotfiles/configuration.nix
    ./modules/programs/configuration.nix
    ./modules/packages.nix
    ./modules/variables.nix
    ./modules/plasma.nix
  ];

  home.username = "dkrasiev";
  home.homeDirectory = "/home/dkrasiev";

  home.stateVersion = "23.11"; # Please read the comment before changing.
}
