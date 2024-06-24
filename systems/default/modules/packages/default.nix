{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./modules/dev.nix
  ];

  environment.systemPackages = with pkgs; [
    # disk management
    filelight partition-manager
    # media
    mpv
    # office suite
    libreoffice-qt
    # browsers
    google-chrome firefox

    telegram-desktop
    gimp
    obsidian
    stow
    easyeffects
    qbittorrent
    obs-studio

    ### CLI UTILS
    # archives
    zip unzip
    # wayland clipboard
    wl-clipboard
    # nixos
    nh nurl
    # search
    ripgrep fzf zoxide
  ];
}
