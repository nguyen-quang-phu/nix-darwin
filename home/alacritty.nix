{...}: {
  programs.alacritty = {
    enable = false;
    settings = {
      font = {
        size = 14;
        normal = {
          font = "JetBrainsMono Nerd Font Mono";
        };
        italic = {
          font = "JetBrainsMono Nerd Font Mono";
        };
      };

      window = {
        decorations = "none";
        padding = {
          x = 0;
          y = 0;
        };
      };
    };
  };
}
