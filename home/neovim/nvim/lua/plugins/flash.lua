return {
  "folke/flash.nvim",
  event = "VeryLazy",
  vscode = true,
    opts = {
      modes = {
        char = {
          jump_labels = true,
        },
      },
    },
  keys = {
    {
      "s",
      mode = { "n", "x"},
      function() require("flash").jump() end,
      desc = "Flash",
    },
    {
      "S",
      mode = { "n", "o"},
      function() require("flash").treesitter() end,
      desc = "Flash Treesitter",
    },
    {
      "r",
      mode = "o",
      function() require("flash").remote() end,
      desc = "Remote Flash",
    },
    {
      "R",
      mode = { "o", "x" },
      function() require("flash").treesitter_search() end,
      desc = "Treesitter Search",
    },
  },
}
