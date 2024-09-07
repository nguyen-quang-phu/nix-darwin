return {
  {
    "folke/noice.nvim",
    opts = {
      notify = {
        enabled = true,
      },
      message = {
        view_error = false,
      },
      lsp = {
        message = {
          enabled = false,
        },
      },
    },
  },
  { "rcarriga/nvim-notify", enabled = true },
}
