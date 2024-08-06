return {
  {
    "chrisgrieser/nvim-scissors",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    }, -- optional
    opts = {
      snippetDir = "~/.config/nix-darwin/home/dotfiles/nvim/snippets",
      jsonFormatter = "jq",
    },
  },
}
