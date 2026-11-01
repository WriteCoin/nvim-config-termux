return {
	{
		"tadmccorkle/markdown.nvim",
		ft = "markdown", -- or 'event = "VeryLazy"'
		opts = {
			-- configuration here or empty for defaults
		},
	},
	{
		"preservim/vim-markdown",
		ft = "markdown", -- загружать только для markdown файлов
		dependencies = { "godlygeek/tabular" }, -- требуется для форматирования таблиц
		config = function()
			-- Отключить складывание (если вы предпочитаете использовать другие плагины для складывания)
			vim.g.vim_markdown_folding_disabled = 1
		end,
	},
}
