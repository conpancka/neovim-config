return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		opts = {
			ensure_installed = {
				-- add new here
				"lua_ls",
				"clangd",
				"zls",
				"marksman",
				"rust_analyzer",
			},
			automatic_installation = true,
		},
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			local mlsp = require("mason-lspconfig")
			local servers = mlsp.get_installed_servers()

			for _, server in ipairs(servers) do
				-- default config for every server
				vim.lsp.config(server, {
					capabilities = capabilities,
				})
			end

			-- for lua_ls
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
					},
				},
			})

			vim.lsp.enable(servers)

			-- keymaps
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
