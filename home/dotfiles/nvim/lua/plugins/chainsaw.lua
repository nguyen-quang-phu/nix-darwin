---@type LazySpec
return {
  "chrisgrieser/nvim-chainsaw",
  keys = {
    { "<leader>ll", "<cmd>lua require('chainsaw').variableLog()<CR>" },
    { "<leader>ld", "<cmd>lua require('chainsaw').removeLogs()<CR>" },
    { "<leader>lL", "<cmd>lua require('chainsaw').messageLog()<CR>" },
  },
  opts = {},
}
