-----------------------------------------------------------
-- Theme
-----------------------------------------------------------
-- vim.o.background = "dark"
-- vim.cmd([[colorscheme gruvbox]])
-- hello

-----------------------------------------------------------
-- Config
-----------------------------------------------------------
local g = vim.g -- Global variables
local opt = vim.opt -- Set options (global/buffer/windows-scoped)

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = "a" -- Enable mouse support
opt.clipboard = "unnamedplus" -- Copy/paste to system clipboard
opt.swapfile = false -- Don't use swapfile
opt.completeopt = "menuone,noinsert,noselect" -- Autocomplete options

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true -- Show line number
opt.relativenumber = true -- Set relative numbered lines
opt.showmatch = true -- Highlight matching parenthesis
opt.foldmethod = "marker" -- Enable folding (default 'foldmarker')
-- opt.colorcolumn = "10" -- Line lenght marker at 80 columns
opt.splitright = true -- Vertical split to the right
opt.splitbelow = true -- Horizontal split to the bottom
opt.ignorecase = true -- Ignore case letters when search
opt.smartcase = true -- Ignore lowercase for the whole pattern
opt.linebreak = true -- Wrap on word boundary
opt.termguicolors = true -- Enable 24-bit RGB colors
opt.laststatus = 3 -- Set global statusline

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 4 -- Shift 4 spaces when tab
opt.tabstop = 4 -- 1 tab == 4 spaces
opt.smartindent = true -- Autoindent new lines

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true -- Enable background buffers
opt.history = 100 -- Remember N lines in history
opt.lazyredraw = true -- Faster scrolling
opt.synmaxcol = 240 -- Max column for syntax highlight
opt.updatetime = 250 -- ms to wait for trigger an event

-- Show diagnostic beside line
vim.diagnostic.config({
	underline = false,
	virtual_text = {
		spacing = 2,
		prefix = "󱓻",
	},
	update_in_insert = false,
	severity_sort = true,
	signs = {
		text = {
			-- Alas nerdfont icons don't render properly on Medium!
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = " ",
			[vim.diagnostic.severity.INFO] = " ",
		},
	},
})

-- Show diagnostic under line
-- vim.diagnostic.config({
-- 	underline = false,
-- 	virtual_text = false,
-- 	update_in_insert = false,
-- 	severity_sort = true,
-- 	virtual_lines = {
-- 		current_line = true,
-- 	},
-- 	signs = {
-- 		text = {
-- 			-- Alas nerdfont icons don't render properly on Medium!
-- 			[vim.diagnostic.severity.ERROR] = " ",
-- 			[vim.diagnostic.severity.WARN] = " ",
-- 			[vim.diagnostic.severity.HINT] = " ",
-- 			[vim.diagnostic.severity.INFO] = " ",
-- 		},
-- 	},
-- })
