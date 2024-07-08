return {
  "cbochs/portal.nvim",
  cmd = "Portal",
  lazy = false,
  opts = {},
  keys = {
    { "<C-o>", "<cmd>Portal jumplist backward<cr>", desc = "Portal Jump backward" },
    { "<C-i>", "<cmd>Portal jumplist forward<cr>", desc = "Portal Jump forward" },
  },
}
