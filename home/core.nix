{ pkgs, ... }:

{
  home.packages = with pkgs; [
  ];

  programs = {
    # modern vim
    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
    };
  };
}
