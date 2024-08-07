{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./modules/dev.nix
    # ./modules/k8s.nix
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

    thunderbird
    telegram-desktop
    gimp
    kdenlive
    obsidian
    stow
    qbittorrent
    obs-studio easyeffects
    gnome.gnome-boxes

    ### CLI UTILS
    # archives
    zip unzip rar p7zip
    # wayland clipboard
    wl-clipboard
    # nixos
    nh nurl
    # search
    ripgrep fzf zoxide
  ];
}
