{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # git stuff
    git lazygit gh

    # compilers
    gcc rustc

    # package managers / languages
    cargo luarocks nodejs python3

    # terminal
    kitty nerdfonts 

    # tmux
    tmux tmuxinator

    # editors
    neovim vscode

    # shell
    zsh oh-my-posh

    # gui stuff
    postman
    insomnia
    dbeaver-bin
    burpsuite
    soapui
  ];
}
