{
  inputs,
  username,
  ...
}: {
  # import sub modules
  imports = [
    ./aws.nix
    ./cli.nix
    ./core.nix
    ./firefox.nix
    ./git.nix
    ./ssh.nix
    ./starship.nix
    ./vscode.nix
    ./zathura.nix
    ./zsh.nix
    ./bat
    ./karabiner
    ./kitty
    ./neovim
    ./pet
    ./spicetify
    ./spotify-player
    ./yazi
    ./zellij
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    inherit username;
    homeDirectory = "/Users/${username}";

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "24.05";
    file = {};

    shellAliases = {
      "..." = "cd ../..";
      "code" = "codium";
      "darwin-build" = "just -f ~/.config/nix-darwin/justfile build";
      "darwin-update" = "just -f ~/.config/nix-darwin/justfile update";
      "ze" = "zellij";
      "zed" = "ze a -c default";
    };
  };
  # Let Home Manager install and manage itself.
  programs = {
    home-manager.enable = true;
  };
}
