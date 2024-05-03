{
  imports = [
    ../dkrasiev/home.nix
  ];
  
  home.username = "dkrasiev-work";
  home.homeDirectory = "/home/dkrasiev-work";

  programs.git.userEmail = "dkrasiev@datafire.ru";
}
