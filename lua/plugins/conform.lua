return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        ["_"] = { "trim_whitespace" },
      },

      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },

      notify_on_error = true,
      notify_no_formatters = true,
    })

    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
