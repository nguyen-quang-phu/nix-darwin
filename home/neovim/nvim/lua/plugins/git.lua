return {
  {
    "sindrets/diffview.nvim",
    lazy = false,
    cmd = { "DiffviewOpen" },
    opts = {
      enhanced_diff_hl = true,
      view = {
        default = { winbar_info = true },
        file_history = { winbar_info = true },
        merge_tool = {
          layout = "diff3_mixed",
        },
      },
      hooks = {
        diff_buf_read = function(bufnr)
          vim.b[bufnr].view_activated = false
        end,
      },
    },
  },
  {
    "NeogitOrg/neogit",
    optional = true,
    opts = { integrations = { diffview = true } },
  },
  {
    "f-person/git-blame.nvim",
    lazy = false,
  },
}
