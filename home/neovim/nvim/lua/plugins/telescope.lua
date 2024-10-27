return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      path_display = { "truncate" },
      sorting_strategy = "ascending",
      file_ignore_patterns = {
        "node_modules",
        ".git",
        ".direnv",
        ".devenv",
        "log",
        "tmp",
      },
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
    {
      "<leader><space>",
      function()
        require("telescope.builtin").live_grep({
          additional_args = function(args)
            return vim.list_extend(args, { "--hidden", "--no-ignore-vcs" })
          end,
        })
      end,
      mode = "n",
      desc = "TELESCOPE: Find Word in Project",
    },
    {
      "<leader>fw",
      function()
        require("telescope.builtin").live_grep({
          additional_args = function(args)
            return vim.list_extend(args, { "--hidden", "--no-ignore" })
          end,
        })
      end,
      mode = "n",
      desc = "TELESCOPE: Find Word in Project",
    },
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
      end,
      mode = "n",
      desc = "TELESCOPE: Find File in Project",
    },
  },
}
