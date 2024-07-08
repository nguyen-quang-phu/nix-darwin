{...}: {
  programs.zsh = {
    enable = false;
    autosuggestion.enable = true;
    enableCompletion = true;
    oh-my-zsh.enable = true;
    syntaxHighlighting.enable = true;
  };
}
