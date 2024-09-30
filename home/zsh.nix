{...}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    oh-my-zsh.enable = true;
    syntaxHighlighting.enable = true;
    initExtra = "
    source ${./dotfiles/zsh/extra.zsh}
    ";
  };
}
