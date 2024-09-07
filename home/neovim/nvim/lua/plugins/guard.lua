return {
  {
    "nvimdev/guard.nvim",
    -- Builtin configuration, optional
    enabled = false,
    dependencies = {
      "nvimdev/guard-collection",
    },
    init = function()
      local ft = require("guard.filetype")
      ft("lua"):fmt("lsp"):append("stylua"):lint("luacheck")
      ft("rb"):fmt("lsp")
      require("guard").setup({
        fmt_on_save = false,
      })
    end,
  },
}
