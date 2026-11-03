-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Настройка нумерации строк в файле и относительная нумерация
vim.opt.nu = true
vim.opt.relativenumber = true

-- Комфортная прокрутка окна относительно курсора
vim.opt.scrolloff = 5

-- Чтобы лучше отображались цвета
vim.o.termguicolors = true

-- Интеграция системного буфера обмена
vim.o.clipboard = "unnamedplus"

-- Настройки отступов
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Автоматическая расстановка отступов
vim.opt.smartindent = true

-- Скрытые буферы
vim.opt.hidden = true

-- Отображение дополнительных окон (снизу и справа, а не вверху, по умолчанию)
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Поддержка Nerd Font (иконок, для Lualine)
vim.g.have_nerd_font = true

-- Проверка орфографии (по умолчанию отключена; переключение через `<leader>sp`, настроено в keymaps.lua)
vim.opt.spell = true
vim.opt.spelllang = "en_us,ru"

-- Метод отображения парных скобок (в плавающем окне)
vim.g.matchup_matchparen_offscreen = { method = "popup" }
