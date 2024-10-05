return {
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local function indexOf(array, value)
        for i, v in ipairs(array) do
          if v.name == value then
            return i
          end
        end
        return nil
      end

      local snippets_index = indexOf(opts.sources, "snippets")
      if snippets_index ~= nil then
        opts.sources[snippets_index] = {
          name = "snippets",
          priority = 150,
        }
      end

      local codeium_index = indexOf(opts.sources, "codeium")
      if codeium_index ~= nil then
        opts.sources[codeium_index] = {
          name = "codeium",
          priority = 90,
        }
      end

      local lsp_index = indexOf(opts.sources, "nvim_lsp")
      if lsp_index ~= nil then
        opts.sources[lsp_index] = {
          name = "nvim_lsp",
          priority = 100,
        }
      end
    end,
  },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   version = false, -- last release is way too old
  --   event = "InsertEnter",
  --   dependencies = {
  --     "hrsh7th/cmp-nvim-lsp",
  --     "hrsh7th/cmp-buffer",
  --     "hrsh7th/cmp-path",
  --     "onsails/lspkind.nvim",
  --     -- "saadparwaiz1/cmp_luasnip",
  --     "SergioRibera/cmp-dotenv",
  --   },
  --   enabled = true,
  --   opts = function()
  --     vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
  --     local cmp = require("cmp")
  --     local defaults = require("cmp.config.default")()
  --     local lspkind_status_ok, lspkind = pcall(require, "lspkind")
  --     local snip_status_ok, luasnip = pcall(require, "luasnip")
  --     return {
  --       completion = {
  --         completeopt = "menu,menuone,noinsert",
  --       },
  --       mapping = cmp.mapping.preset.insert({
  --         ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
  --         ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
  --         ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  --         ["<C-f>"] = cmp.mapping.scroll_docs(4),
  --         ["<C-Space>"] = cmp.mapping.complete(),
  --         ["<C-e>"] = cmp.mapping.abort(),
  --         ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  --         ["<S-CR>"] = cmp.mapping.confirm({
  --           behavior = cmp.ConfirmBehavior.Replace,
  --           select = true,
  --         }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  --         ["<C-CR>"] = function(fallback)
  --           cmp.abort()
  --           fallback()
  --         end,
  --       }),
  --       sources = cmp.config.sources({
  --         { name = "codeium", priority = 1000 },
  --         {
  --           name = "nvim_lsp",
  --           priority = 1500,
  --           entry_filter = function(entry)
  --             local type = require("cmp.types").lsp.CompletionItemKind[entry:get_kind()]
  --             return type ~= "Text" or type ~= "Snippet"
  --           end,
  --         },
  --         -- { name = "luasnip", priority = 750 },
  --         { name = "path" },
  --         { name = "buffer" },
  --         { name = "nvim_lsp_signature_help" },
  --         { name = "dotenv" },
  --         { name = "snippets" },
  --       }),
  --       formatting = {
  --         fields = { "abbr", "kind", "menu" },
  --         format = lspkind_status_ok and lspkind.cmp_format({
  --           before = require("tailwind-tools.cmp").lspkind_format,
  --           mode = "symbol_text",
  --           show_labelDetails = true,
  --           symbol_map = { Codeium = "" },
  --           width = 100,
  --         }) or nil,
  --       },
  --       snippet = {
  --         expand = function(args)
  --           luasnip.lsp_expand(args.body)
  --         end,
  --       },
  --       experimental = {
  --         ghost_text = {
  --           hl_group = "CmpGhostText",
  --         },
  --       },
  --       sorting = defaults.sorting,
  --     }
  --   end,
  -- },
}
