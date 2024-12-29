return {
  {
    "saghen/blink.cmp",
    lazy = false, -- lazy loading handled internally
    -- optional: provides snippets for the snippet source
    dependencies = "rafamadriz/friendly-snippets",

    -- use a release tag to download pre-built binaries
    version = "v0.*",
    -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- see the "default configuration" section below for full documentation on how to define
      -- your own keymap.
      -- keymap = { preset = "default" },
      completion = {
        menu = {
          draw = {
            columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
            -- components = {
            --   kind_icon = {
            --     ellipsis = false,
            --     text = function(ctx)
            --       local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
            --       return ctx.kind .. " " .. kind_icon
            --     end,
            --     -- Optionally, you may also use the highlights from mini.icons
            --     highlight = function(ctx)
            --       local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
            --       return hl
            --     end,
            --   },
            -- },
          },
        },
      },
      -- enable completion sources
      -- 'path' for file system paths
    },
    -- allows extending the enabled_providers array elsewhere in your config
    -- without having to redefine it
    opts_extend = { "sources.completion.enabled_providers" },
  },
}
