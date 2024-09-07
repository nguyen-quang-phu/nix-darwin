return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "RRethy/nvim-treesitter-endwise" },
  opts = {
    -- ensure_installed = { "kdl" },
    endwise = { enable = true },
    autotag = {
      enable = true,
      enable_rename = true,
      enable_close = true,
    },
  },
}
