# nix-darwin
## MacOS 
- Clone config
```
git@github.com:nguyen-quang-phu/nix-darwin.git ~/.config
```
- Install Nix.
```
    sh <(curl -L https://nixos.org/nix/install) --daemon
```
- Build, and switch to the dotfiles
```
nix run --extra-experimental-features 'nix-command flakes' nix-darwin -- switch --flake ~/.config/nix-darwin
```

- Update macos
```
  darwin-build
```
