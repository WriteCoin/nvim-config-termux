return {
	{
		-- Конфигурация LSP
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "mason-org/mason.nvim", config = true },
			"mason-org/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			local servers = {
				-- "clangd", -- [Termux] Закомментировано, Mason не поддерживает установку на ARM64, используйте системный clangd
				-- "lua_ls",
				-- "tinymist",
				-- "ts_ls",
				-- "eslint",
				-- "racket_langserver", -- ручная установка
			}

			require("mason").setup()

			local ensure_installed = vim.deepcopy(servers)
			-- for i, name in ipairs(ensure_installed) do
			-- 	if name == "racket_langserver" then
			-- 		table.remove(ensure_installed, i)
			-- 		break
			-- 	end
			-- end
			vim.list_extend(ensure_installed, {
				-- "stylua",
				"typstyle",
				-- "prettier",
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				-- [Termux] Отключить автоматическое включение для clangd, избежать конфликта с системным clangd
				automatic_enable = {
					exclude = {
						"clangd",
						"lua_ls",
						"tinymist",
						"racket-langserver",
						"ts_ls",
						"eslint",
						"rust_analyzer",
					},
				},
			})

			-- [Termux] Вручную включить системный clangd
			-- Предварительно необходимо выполнить: pkg install clang
			vim.lsp.enable("clangd")

			vim.lsp.enable("lua_ls")

			-- Ручная активация Racket LSP
			-- vim.lsp.enable("racket_langserver")
			vim.lsp.enable("tinymist")

			vim.lsp.enable("rust_analyzer")

			vim.lsp.enable("ts_ls")
		end,
	},
}
