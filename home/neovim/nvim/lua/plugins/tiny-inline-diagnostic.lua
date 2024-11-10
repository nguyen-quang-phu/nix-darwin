return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach", -- Or `LspAttach`
    config = function()
      require("tiny-inline-diagnostic").setup()
    end,
  },
}
