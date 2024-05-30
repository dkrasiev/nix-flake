{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # git/github
    git gh
    # dep for treesiter and many
    gcc
    # main terminal
    kitty
    # main editor
    tmux tmuxinator
    # main editor
    neovim
    # nvim and etc
    nerdfonts ripgrep lazygit fzf
    # archives
    zip unzip
    # wayland clipboard
    wl-clipboard
    # disk management
    filelight partition-manager
    # media
    mpv
    # nixos
    home-manager nh nurl
    # office suite
    libreoffice-qt
    # dev
    python3 postman insomnia dbeaver burpsuite soapui
    # browserns
    google-chrome firefox
    telegram-desktop
    gimp
    obsidian
    vscode
    stow
    easyeffects
    qbittorrent
    obs-studio
  ];
}
