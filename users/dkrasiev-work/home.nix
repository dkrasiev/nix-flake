{
  imports = [
    ../dkrasiev-base/configuration.nix

    ./modules/git.nix
  ];
  
  home.username = "dkrasiev-work";
  home.homeDirectory = "/home/dkrasiev-work";
}
