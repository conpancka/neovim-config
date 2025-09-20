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

			formatters = {
				clang_format = {
					prepend_args = {
						-- Use LLVM style as base, tabs, 4-space width, and do not sort includes
						"-style={BasedOnStyle: LLVM, UseTab: Always, IndentWidth: 4, TabWidth: 4, SortIncludes: false}"
					},
				},
				stylua = {
					prepend_args = { "--indent-type", "Tabs", "--indent-width", "4" },
				},
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
