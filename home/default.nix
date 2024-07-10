{username, ...}: {
  # import sub modules
  imports = [
    ./alacritty.nix
    ./aws.nix
    ./cli.nix
    ./core.nix
    ./git.nix
    ./neovim.nix
    ./starship.nix
    ./zellij.nix
    ./zsh.nix
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
    file = {
      ".config/alacritty" = {
        source = ./dotfiles/alacritty;
      };
      ".config/zellij" = {
        source = ./dotfiles/zellij;
      };
      ".config/nvim" = {
        source = ./dotfiles/nvim;
      };
      ".config/yazi" = {
        source = ./dotfiles/yazi;
      };
    };
  };
  # Let Home Manager install and manage itself.
  programs = {
    home-manager.enable = true;
  };
}
