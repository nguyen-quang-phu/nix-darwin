_: {
  programs.alacritty = {
    enable = false;
  };
  xdg.configFile."alacritty".source = ./dotfiles/alacritty;
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    theme = "Catppuccin-Mocha";
    shellIntegration.mode = "no-title no-cursor";
    font.name = "JetBrainsMono Nerd Font";
    font.size = 14;
    keybindings = {
      "cmd+1" = "send_text all \\x021";
      "cmd+2" = "send_text all \\x022";
      "cmd+3" = "send_text all \\x023";
      "cmd+4" = "send_text all \\x024";
      "cmd+5" = "send_text all \\x025";
      "cmd+6" = "send_text all \\x026";
      "cmd+7" = "send_text all \\x027";
      "cmd+8" = "send_text all \\x028";
      "cmd+9" = "send_text all \\x029";
      "cmd+t" = "send_text all \\x02c";
      "cmd+h" = "send_text all \\x02h";
      "cmd+j" = "send_text all \\x02j";
      "cmd+k" = "send_text all \\x02k";
      "cmd+l" = "send_text all \\x02l";
      "cmd+enter" = "send_text all \\x02z";
    };
    extraConfig = "";
    settings = {
      hide_window_decorations = true;
      macos_option_as_alt = true;
    };
  };
}
