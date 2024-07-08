return {
  "mfussenegger/nvim-dap",
  optional = true,
  dependencies = {
    "suketa/nvim-dap-ruby",
    config = function()
      require("dap-ruby").setup()
    end,
  },
}
