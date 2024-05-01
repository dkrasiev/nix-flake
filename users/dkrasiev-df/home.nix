{
  imports = [
    ../dkrasiev-base/configuration.nix

    ./modules/git.nix
  ];
  
  home.username = "dkrasiev-df";
  home.homeDirectory = "/home/dkrasiev-df";
}
