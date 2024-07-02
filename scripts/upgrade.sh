#!/bin/sh

cd ~/nix

nix flake update

mode=$1

nh os $mode .
