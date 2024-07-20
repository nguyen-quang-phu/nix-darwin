{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    withNodeJs = true;
    withRuby = true;
    withPython3 = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

  };
}
