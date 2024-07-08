return {
  {
    "gbprod/substitute.nvim",
    lazy = false,
    opts = {
      on_substitute = require("yanky.integration").substitute(),
    },
    keys = {
      {
        "gr",
        function()
          require("substitute").operator()
        end,
        mode = "n",
        silent = true,
        remap = false,
        desc = "SUBSTITUTE: operator",
      },
      {
        "grr",
        function()
          require("substitute").line()
        end,
        mode = "n",
        desc = "SUBSTITUTE: line",
      },
      {
        "gr",
        function()
          require("substitute").visual()
        end,
        mode = "v",
        desc = "SUBSTITUTE: visual",
      },
    },
  },
  -- {
  --   "kylechui/nvim-surround",
  --   version = "*", -- Use for stability; omit to use `main` branch for the latest features
  --   event = "VeryLazy",
  --   opts = {},
  -- },
  {
    "michaeljsmith/vim-indent-object",
    event = "VeryLazy",
  },
}
