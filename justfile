config-file := "~/.config/nix-darwin"
secrets-dir := "~/.config/nix-darwin/serects"
secrets-file := "secrets.yaml"

default:
  @just --list --justfile {{justfile()}}

git-add:
  git add .
update:
  nix flake update
  @just build
build:
  @just git-add
  darwin-rebuild switch --flake {{config-file}} --show-trace
update-home-manager:
  nix flake update home-manager

edit-secrets:
  sops ~/.config/nix-darwin/serects/secrets.yaml
