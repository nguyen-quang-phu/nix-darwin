{ pkgs, ... }:

{
  home.packages = with pkgs; [
    less
  ];

  home.sessionVariables = {
    PAGER = "less";
    CLICOLORS = 1;
    EDITOR = "vim";
  };

  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
