{pkgs, ...}: {
  home.packages = with pkgs; [
    less
  ];

  home.sessionVariables = {
    PAGER = "less";
    CLICOLORS = 1;
    EDITOR = "vim";
  };
}
