{...}: {
  programs = {
    kitty = {
      enable = true;
      extraConfig = "";
      font.name = "JetBrainsMono Nerd Font";
      font.size = 14;
      shellIntegration.enableZshIntegration = true;
      shellIntegration.mode = "no-title no-cursor";
      themeFile = "Catppuccin-Mocha";

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
        "cmd+enter" = "send_text all \\x02z";
        "cmd+h" = "send_text all \\x02h";
        "cmd+j" = "send_text all \\x02j";
        "cmd+k" = "send_text all \\x02k";
        "cmd+l" = "send_text all \\x02l";
        "cmd+t" = "send_text all \\x02c";
        "cmd+shift+t" = "send_text all \\x02pw";
      };

      settings = {
        copy_on_select = true;
        cursor_blink_interval = 0;
        cursor_shape = "beam";
        cursor_stop_blinking_after = 0;
        disable_ligatures = "cursor";
        hide_window_decorations = true;
        macos_option_as_alt = true;
        scrollback_lines = -1;
        strip_trailing_spaces = "always";
        startup_session = "./startup.conf";
        allow_remote_control = "socket-only";
        listen_on = "unix:/tmp/kitty";
      };
    };
  };
  xdg.configFile."kitty/startup.conf".source = ./kitty/startup.conf;
}
