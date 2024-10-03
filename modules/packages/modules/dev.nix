{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # git stuff
    git lazygit gh

    # compilers
    gnumake cmake gcc

    # rust
    rustc cargo

    # package managers / languages
    luarocks
    nodejs
    python3
    # maven jre

    # terminal
    kitty

    # tmux
    tmux tmuxinator

    # editors
    neovim vscode

    # shell
    zsh oh-my-posh

    # gui stuff
    # postman
    # insomnia
    # dbeaver-bin
    # burpsuite
    # soapui
    # charles
  ];
}
