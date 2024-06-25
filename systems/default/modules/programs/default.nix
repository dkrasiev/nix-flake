{
  imports = [
    ./modules/adb.nix
    ./modules/droidcam.nix
    ./modules/docker.nix
    ./modules/lazygit.nix
    # not working (environment variables hadn't set)
    # ./modules/prisma.nix

    # use one
    # ./modules/fish.nix
    ./modules/zsh.nix
  ];
}
