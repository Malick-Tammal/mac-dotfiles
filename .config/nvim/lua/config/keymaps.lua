-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- -- Code actions
-- Save
vim.keymap.set("n", "<leader>cs", "<cmd> w <CR>", opts)

-- Save without formatting
vim.keymap.set("n", "<leader>cn", "<cmd>noautocmd w <CR>", opts)

-- Format
vim.keymap.set({ "n", "v" }, "<leader>cf", function()
	require("conform").format({
		lsp_fallback = true,
		async = true,
		timeout_ms = 500,
	})
	vim.cmd("echo 'Code formatted!'")
end)

-- quit file
vim.keymap.set("n", "<C-q>", "<cmd> q <CR>", opts)

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- Resize with arrows
vim.keymap.set("n", "<Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>", opts)

-- Buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>bx", ":bdelete!<CR>", opts) -- close buffer
vim.keymap.set("n", "<leader>bb", "<cmd> enew <CR>", opts) -- new buffer

-- Window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", opts) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", opts) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", ":close<CR>", opts) -- close current split window

-- Navigate between splits
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

-- Tabs
vim.keymap.set("n", "<leader>To", ":tabnew<CR>", opts) -- open new tab
vim.keymap.set("n", "<leader>Tx", ":tabclose<CR>", opts) -- close current tab
vim.keymap.set("n", "<leader>Tn", ":tabn<CR>", opts) --  go to next tab
vim.keymap.set("n", "<leader>Tp", ":tabp<CR>", opts) --  go to previous tab

-- Toggle line wrapping
-- vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', opts)

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Neotree
vim.keymap.set("n", "<leader>n", "<Cmd>Neotree toggle position=left<CR>", { desc = "Explorer Neoree (Toggle)" })

-- Search
vim.keymap.set("n", "<C-c>", "<Cmd>noh<CR>", opts)

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader><space>", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>G", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>bf", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>h", builtin.help_tags, { desc = "Telescope help tags" })

-- Quit
vim.keymap.set("n", "<leader>qq", "<Cmd>qa!<CR>") -- Exit without saving!
vim.keymap.set("n", "<leader>qw", "<Cmd>xa<CR>") -- Exit and save

-- Lazy
vim.keymap.set("n", "<leader>l", "<Cmd>Lazy<CR>", { desc = "Lazy" }) -- Call Lazy

-- Mason
vim.keymap.set("n", "<leader>m", "<Cmd>Mason<CR>") -- Call Mason

-- Delete
vim.keymap.set("n", "<leader>x", '"_d') -- Black hole "Delete without copy it"

-- Todo comments
vim.keymap.set("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- Diagnostics
vim.keymap.set(
	"n",
	"<leader>dt",
	"<Cmd>lua require('tiny-inline-diagnostic').toggle()<CR>",
	{ desc = "Toggle diagnostics" }
)

-- Disabling letter "s" keymap
vim.keymap.set("n", "s", "")

-- Projects
local projects = require("plugins.custom.projects")

vim.keymap.set("n", "<leader>p", function()
	projects.setup()
end, { desc = "Projects" })
