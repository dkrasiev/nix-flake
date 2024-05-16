{
  imports = [
    ./modules/docker.nix
    ./modules/fish.nix
    ./modules/lazygit.nix
    # not working (environment variables hadn't set)
    # ./modules/prisma.nix
  ];
}
