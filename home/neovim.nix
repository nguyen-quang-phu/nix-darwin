{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    withNodeJs = true;
    withRuby = true;
    withPython3 = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;
  };
  xdg.configFile.nvim.source = ./dotfiles/nvim;
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
