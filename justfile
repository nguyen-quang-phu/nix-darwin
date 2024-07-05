config-file := "~/.config/nix-darwin"

default:
  @just --list --justfile {{justfile()}}

git-add:
  git add .

build:
  @just git-add
  darwin-rebuild switch --flake {{config-file}}
