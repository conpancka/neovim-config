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

			vim.lsp.inlay_hint.enable()

			-- keymaps
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Goto Definition' })
			vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'Goto References' })
			vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, { desc = 'Goto Implementation' })
			vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, { desc = 'Type Definition' })
			vim.keymap.set('n', '<leader>ds', vim.lsp.buf.document_symbol, { desc = 'Document Symbols' })
			vim.keymap.set('n', '<leader>ws', vim.lsp.buf.workspace_symbol, { desc = 'Workspace Symbols' })
			vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename' })
			vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code Action' })
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
		end,
	},
}
