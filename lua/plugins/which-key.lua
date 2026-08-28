return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			delay = 0,
			icons = { mappings = vim.g.have_nerd_font }
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)

			wk.add({
				{ "<leader>f", group = "Find" },
				{ "<leader>c", group = "Code" },
				{ "<leader>t", group = "Terminal / Toggle" },
				{ "<leader>g", group = "Git" },
				{ "<leader>b", group = "Buffer" },
				{ "<leader>w", group = "Window" },
				{ "<leader>q", group = "Quit / Diagnostics" },
			})
		end,
	}
}

