local severity_map = {
  ["fatal"] = vim.diagnostic.severity.ERROR,
  ["error"] = vim.diagnostic.severity.ERROR,
  ["warning"] = vim.diagnostic.severity.WARN,
  ["convention"] = vim.diagnostic.severity.HINT,
  ["refactor"] = vim.diagnostic.severity.INFO,
  ["info"] = vim.diagnostic.severity.INFO,
}

return {
  "mfussenegger/nvim-lint",
  enabled = true,
  opts = {
    linters_by_ft = {
      nix = { "statix","deadnix" },
      lua = { "luacheck" },
      ruby = { "rubocop", "reek" },
      eruby = { "erb_lint" },
      slim = { "slimlint" },
      -- javascript = { "eslint" },
      -- javascriptreact = { "eslint" },
      -- typescript = { "eslint" },
      -- typescriptreact = { "eslint" },
      -- vue = { "eslint" },
    },
    linters = {
      rubocop = {
        cmd = "bundle",
        args = {
          "exec",
          "rubocop",
          "--format",
          "json",
          "--force-exclusion",
          "--server",
          "--stdin",
          function()
            return vim.api.nvim_buf_get_name(0)
          end,
        },
        ignore_exitcode = true,
        parser = function(output)
          local diagnostics = {}
          local decoded = vim.json.decode(output)

          if not decoded.files[1] then
            return diagnostics
          end

          local offences = decoded.files[1].offenses

          for _, off in pairs(offences) do
            table.insert(diagnostics, {
              source = "rubocop",
              lnum = off.location.start_line - 1,
              col = off.location.start_column - 1,
              end_lnum = off.location.last_line - 1,
              end_col = off.location.last_column,
              severity = severity_map[off.severity],
              message = off.message,
              code = off.cop_name,
            })
          end

          return diagnostics
        end,
      },
      reek = {
        cmd = "bundle",
        args = {
          "exec",
          "reek",
          "--format",
          "json",
          "--force-exclusion",
        },
        append_fname = true,
        stream = "stdout",
        stdin = false,
        ignore_exitcode = true,
        parser = function(output)
          local diagnostics = {}
          local offences = vim.json.decode(output)

          for _, off in pairs(offences) do
            local col = string.len(vim.api.nvim_buf_get_lines(0, off.lines[1] - 1, off.lines[1], true)[1])
            table.insert(diagnostics, {
              source = "[reek]",
              lnum = off.lines[1] - 1,
              end_lnum = off.lines[1] - 1,
              col = col,
              end_col = col,
              severity = severity_map["warning"],
              message = off.message,
              code = off.smell_type,
            })
          end

          return diagnostics
        end,
      },
      slimlint = {
        cmd = "bundle",
        args = {
          "exec",
          "slim-lint",
          "--reporter",
          "json",
        },
        ignore_exitcode = true,
        append_fname = true,
        stream = "stdout",
        stdin = false,
        parser = function(output)
          local diagnostics = {}
          local decoded = vim.json.decode(output)

          if not decoded.files[1] then
            return diagnostics
          end

          local offences = decoded.files[1].offenses

          for _, off in pairs(offences) do
            local col = string.len(vim.api.nvim_buf_get_lines(0, off.location.line - 1, off.location.line, true)[1])
            table.insert(diagnostics, {
              source = "slim-lint",
              lnum = off.location.line - 1,
              end_lnum = off.location.line - 1,
              col = col + 1,
              end_col = col + 1,
              severity = severity_map[off.severity],
              message = off.message,
              code = off.linter,
            })
          end

          return diagnostics
        end,
        --   local diagnostics = {}
        --   local decoded = vim.json.decode(output)
        --
        --   if not decoded.files[1] then
        --     return diagnostics
        --   end
        --
        --   local offences = decoded.files[1].offenses
        --
        --   for _, off in pairs(offences) do
        --     table.insert(diagnostics, {
        --       source = "custom slim lint",
        --       lnum = off.location.start_line - 1,
        --       col = off.location.start_column - 1,
        --       end_lnum = off.location.last_line - 1,
        --       end_col = off.location.last_column,
        --       severity = severity_map[off.severity],
        --       message = off.message,
        --       code = off.cop_name,
        --     })
        --   end
        --
        --   return diagnostics
        -- end,
      },
    },
  },
}
