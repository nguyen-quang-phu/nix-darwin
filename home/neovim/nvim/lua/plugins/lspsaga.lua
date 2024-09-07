return {
  "nvimdev/lspsaga.nvim",
  lazy = false,
  config = function()
    require("lspsaga").setup({
      code_action = {
        show_server_name = true,
      },
      lightbulb = {
        enable = false,
      },
    })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    {
      "<leader>la",
      "<cmd>Lspsaga code_action<CR>",
      mode = "n",
      desc = "LSPSAGA: Code Action",
    },
    {
      "<leader>lr",
      "<cmd>Lspsaga rename<CR>",
      mode = "n",
      desc = "LSPSAGA: Rename",
    },
  },
}
