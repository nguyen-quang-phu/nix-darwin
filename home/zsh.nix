{...}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    oh-my-zsh.enable = false;
    syntaxHighlighting.enable = true;
    initExtra = "source ${./dotfiles/zsh/extra.zsh}";
  };
}
