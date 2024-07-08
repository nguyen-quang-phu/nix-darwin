return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "RRethy/nvim-treesitter-endwise" },
  opts = {
    endwise = { enable = true },
    autotag = {
      enable = true,
      enable_rename = true,
      enable_close = true,
    },
  },
}
