{ pkgs, pkgs-unstable, ... }:

{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./modules/dev.nix
    ./modules/fonts.nix
    # ./modules/k8s.nix
  ];

  environment.systemPackages = with pkgs; [
    # disk management
    filelight partition-manager gparted
    # media
    mpv
    # office suite
    libreoffice-qt
    # browsers
    google-chrome firefox

    thunderbird
    telegram-desktop
    gimp
    kdenlive
    obsidian
    stow
    # qbittorrent
    obs-studio easyeffects
    # gnome-boxes
    # kdePackages.kcolorpicker epick gpick

    ### CLI UTILS
    # archives
    zip
    unzip
    # rar
    p7zip
    # wayland clipboard
    wl-clipboard
    # nixos
    nh nurl
    # search
    ripgrep fzf zoxide
    # videos
    ffmpeg

    # vpn
    wireguard-tools
    pkgs-unstable.amneziawg-tools
    pkgs-unstable.amneziawg-go
  ];
}
