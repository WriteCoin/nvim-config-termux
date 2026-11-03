-- Перейти в классический проводник Neovim
vim.keymap.set("n", "<leader>E", vim.cmd.Ex)

-- Настройка для отключения подсветки поиска (?)
vim.keymap.set("n", "<esc>", ":nohlsearch<CR>", { noremap = true, silent = true })

-- (?)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- настройка независимости команд от раскладки клавиатуры
-- Пример для русской раскладки (йцукен -> qwerty)
-- vim.o.langmap = "йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,э;,яz,чx,сc,мv,иb,тn,ьm,б,,ю."
-- Включаем опцию, чтобы langmap работал
-- vim.o.langremap = true

-- Выход из Terminal mode по Esc
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Выйти из Terminal mode" })

-- Навигация по окнам из Terminal mode
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Терминал: Окно влево" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Терминал: Окно вниз" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Терминал: Окно вверх" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Терминал: Окно вправо" })

-- Навигация по окнам
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Окно влево" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Окно вниз" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Окно вверх" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Окно вправо" })

-- Новая вкладка
vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "New tab" })
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<cr>", { desc = "New tab" })

-- Открыть терминал в нижнем сплите
vim.keymap.set("n", "<leader>tt", function()
	vim.cmd("split | terminal")
	vim.cmd("startinsert") -- сразу войти в terminal-mode
end, { desc = "Open terminal" })

-- Открыть терминал в новой вкладке
vim.keymap.set("n", "<leader>tT", "<cmd>tabnew<cr><cmd>terminal<cr>", { desc = "New terminal in new tab" })

-- Орфография
vim.keymap.set(
	"n",
	"<leader>sp",
	":set spell!<CR>",
	{ desc = "Переключить проверку написания" }
)
vim.keymap.set("n", "<leader>se", "]s", { desc = "К следующей опечатке" })
vim.keymap.set("n", "<leader>sf", "z=", { desc = "Предложения по написанию" })

-- Переключение wrap/nowrap по нажатию <leader>w
vim.keymap.set("n", "<leader>w", ":set wrap!<CR>", { noremap = true, silent = true, desc = "Toggle Wrap" })

-- Диагностика и применение действий к коду
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Show diagnostic" })

-- Функция для ручного запуска racket-langserver
local function start_racket_lsp()
	-- Получаем объединённую конфигурацию racket_langserver (включая значения по умолчанию из nvim-lspconfig)
	local config = vim.lsp.config.racket_langserver
	if not config then
		vim.notify("Конфигурация racket_langserver не найдена", vim.log.levels.ERROR)
		return
	end

	-- Вручную запускаем LSP и привязываем к текущему буферу
	vim.lsp.start(config, { bufnr = 0 })
	print("Запуск Racket LSP")
end

-- Пример привязки клавиши: запуск вручную по <leader>ls
vim.keymap.set("n", "<leader>ls", start_racket_lsp, { desc = "Запустить Racket LSP" })

-- Отключить стандартное поведение пробела
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Отключить стандартное действие привязки `gx` для плагина url-open, открытия ссылок под курсором
vim.g.netrw_nogx = 1
