#!/bin/sh

nix flake lock --update-input dotfiles
nh home switch
