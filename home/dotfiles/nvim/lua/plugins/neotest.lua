return {
  "nvim-neotest/neotest",
  optional = true,
  lazy = false,
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "olimorris/neotest-rspec",
    "marilari88/neotest-vitest",
    "thenbe/neotest-playwright",
  },
  opts = {
    -- adapters = {
    --   ["neotest-rspec"] = {
    --     -- NOTE: By default neotest-rspec uses the system wide rspec gem instead of the one through bundler
    --     rspec_cmd = function()
    --       return vim.tbl_flatten({
    --         "bundle",
    --         "exec",
    --         "rspec",
    --       })
    --     end,
    --   },
    -- },
  },
  config = function(opts)
    require("neotest").setup({
      adapters = {
        require("neotest-playwright").adapter({
          options = {
            persist_project_selection = true,
            enable_dynamic_test_discovery = true,
            is_test_file = function(file_path)
              return string.match(file_path, "e2e")
            end,
          },
        }),
        require("neotest-vitest")({
          filter_dir = function(name, rel_path, root)
            return name ~= "node_modules"
          end,
          is_test_file = function(file_path)
            return string.match(file_path, "__test__")
          end,
        }),
        require("neotest-rspec")({
          rspec_cmd = function()
            return vim.tbl_flatten({
              "bundle",
              "exec",
              "rspec",
            })
          end,
        }),
      },
    })
  end,
}
