config-file := "~/.config/nix-darwin"

default:
  @just --list --justfile {{justfile()}}

build:
  darwin-rebuild switch --flake {{config-file}}
