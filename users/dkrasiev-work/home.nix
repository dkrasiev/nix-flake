{
  imports = [
    ../dkrasiev/home.nix
  ];
  
  home.username = "dkrasiev-work";
  home.homeDirectory = "/home/dkrasiev-work";

  programs.git.userName = "Dmitry Krasiev";
  programs.git.userEmail = "dkrasiev@datafire.ru";
}
