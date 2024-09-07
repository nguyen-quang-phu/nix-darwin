return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      path_display = { "truncate" },
      sorting_strategy = "ascending",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
        },
        vertical = {
          mirror = false,
        },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120,
      },
    },
  },
  keys = {
    -- {
    --   "<leader><space>",
    --   function()
    --     require("telescope.builtin").live_grep()
    --   end,
    --   mode = "n",
    --   desc = "TELESCOPE: Find Word in Project",
    -- },

    {
      "<leader>fw",
      function()
        require("telescope.builtin").live_grep()
      end,
      mode = "n",
      desc = "TELESCOPE: Find Word in Project",
    },
    {
      "<leader>fW",
      function()
        require("telescope.builtin").live_grep({
          additional_args = function(args)
            return vim.list_extend(args, { "--hidden", "--no-ignore" })
          end,
        })
      end,
      mode = "n",
      desc = "TELESCOPE: Find All Word in Project",
    },
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files()
      end,
      mode = "n",
      desc = "TELESCOPE: Find File in Project",
    },
    {
      "<leader>fF",
      function()
        require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
      end,
      mode = "n",
      desc = "TELESCOPE: Find All File in Project",
    },
  },
}
