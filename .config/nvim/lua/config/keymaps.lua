-----------------------------------------------------------
--  HACK: Keymaps
-----------------------------------------------------------

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-----------------------------------------------------------
--  INFO: Code (file) actions
-----------------------------------------------------------
local function message(msg, icon)
	local file = vim.fn.expand("%:t")
	return icon .. file .. msg
end

vim.keymap.set("n", "<leader>cs", function()
	vim.cmd("w")
	vim.notify(message(" Saved ", " 󰆓 "))
	-- Save
end, opts)

vim.keymap.set("n", "<leader>cn", function()
	vim.cmd("noautocmd w")
	vim.notify(message(" Saved (no format)", " 󰽂 ")) -- Save without formatting
end, opts)

vim.keymap.set({ "n" }, "<leader>cf", function()
	require("conform").format({
		lsp_fallback = true,
		async = true,
		timeout_ms = 500,
	})
	vim.cmd("echo 'Code formatted!'") -- Format
end)

-----------------------------------------------------------
--  INFO: Find and center
-----------------------------------------------------------
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-----------------------------------------------------------
--  INFO: Resize with arrows
-----------------------------------------------------------
vim.keymap.set("n", "<Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>", opts)

-----------------------------------------------------------
--  INFO: Buffers
-----------------------------------------------------------
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>bx", ":lua MiniBufremove.delete()<CR>", opts) -- close buffer
vim.keymap.set("n", "<leader>bb", "<cmd> enew <CR>", opts) -- new buffer

-----------------------------------------------------------
--  INFO: Split
-----------------------------------------------------------
vim.keymap.set("n", "<leader>sv", "<C-w>v", opts) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", opts) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", ":close<CR>", opts) -- close current split window

-----------------------------------------------------------
--  INFO: Navigate between splits
-----------------------------------------------------------
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

-----------------------------------------------------------
--  INFO: Tabs
-----------------------------------------------------------
vim.keymap.set("n", "<leader>To", ":tabnew<CR>", opts) -- open new tab
vim.keymap.set("n", "<leader>Tx", ":tabclose<CR>", opts) -- close current tab
vim.keymap.set("n", "<leader>Tn", ":tabn<CR>", opts) --  go to next tab
vim.keymap.set("n", "<leader>Tp", ":tabp<CR>", opts) --  go to previous tab

-----------------------------------------------------------
--  INFO: Indent lines
-----------------------------------------------------------
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-----------------------------------------------------------
--  INFO: Actions
-----------------------------------------------------------
vim.keymap.set("v", "p", '"_dP', opts) -- Keep last yanked when pasting

-----------------------------------------------------------
--  INFO: Diagnostic
-----------------------------------------------------------
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" }) -- Previous Diagnostic
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" }) -- Next Diagnostic
vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" }) -- Floating Diagnostic
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Open diagnostics list" }) -- Diagnostic list
vim.keymap.set("n", "<leader>dt", "<Cmd>lua require('tiny-inline-diagnostic').toggle()<CR>") -- Toggle diagnostic

-----------------------------------------------------------
--  INFO: Neotree
-----------------------------------------------------------
vim.keymap.set("n", "<leader>n", "<Cmd>Neotree toggle position=left<CR>", { desc = "Explorer Neoree (Toggle)" })

-- Search
vim.keymap.set("n", "<C-c>", "<Cmd>noh<CR>", opts)

-----------------------------------------------------------
--  INFO: Telescope
-----------------------------------------------------------
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader><space>", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>G", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>bf", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>h", builtin.help_tags, { desc = "Telescope help tags" })

-----------------------------------------------------------
--  INFO: Quit
-----------------------------------------------------------
vim.keymap.set("n", "<leader>qq", "<Cmd>qa!<CR>") -- Quit without saving!
vim.keymap.set("n", "<leader>qw", "<Cmd>xa<CR>") -- Quit and save
vim.keymap.set("n", "<C-q>", "<cmd> q <CR>", opts) -- Quit current

-----------------------------------------------------------
--  INFO: Lazy
-----------------------------------------------------------
vim.keymap.set("n", "<leader>l", "<Cmd>Lazy<CR>", { desc = "Lazy" }) -- Call Lazy

-----------------------------------------------------------
--  INFO: Mason
-----------------------------------------------------------
vim.keymap.set("n", "<leader>m", "<Cmd>Mason<CR>") -- Call Mason

-----------------------------------------------------------
--  INFO: Deleting
-----------------------------------------------------------
vim.keymap.set({ "n", "v" }, "<leader>x", '"_d') -- "Delete without copy it"
vim.keymap.set("n", "x", '"_x', opts) -- Delete single character without copying into register

-----------------------------------------------------------
--  INFO: TODO Comments
-----------------------------------------------------------
vim.keymap.set("n", "]t", function()
	require("todo-comments").jump_next() -- Next todo comment
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
	require("todo-comments").jump_prev() -- Previous todo comment
end, { desc = "Previous todo comment" })

-----------------------------------------------------------
--  INFO: Projects
-----------------------------------------------------------
local projects = require("plugins.custom.projects")

vim.keymap.set("n", "<leader>p", function()
	projects.setup()
end, { desc = "Projects" })

-----------------------------------------------------------
-- INFO: Theme Switcher
-----------------------------------------------------------
local themeSwitcher = require("plugins.custom.theme-switcher")

vim.keymap.set("n", "<leader>v", function()
	themeSwitcher.setup()
end, { desc = "Theme switcher" })

-----------------------------------------------------------
--  INFO: Lorem Ipsum
-----------------------------------------------------------
vim.keymap.set("n", "<leader>Lw", function()
	vim.cmd("LoremIpsum words " .. vim.fn.input("Number of words")) -- Words
end, { desc = "Words" })

vim.keymap.set("n", "<leader>Lp", function()
	vim.cmd("LoremIpsum paragraphs " .. vim.fn.input("Number of paragraphs")) -- Paragraphs
end, { desc = "Paragraphs" })

-----------------------------------------------------------
--  INFO: Comment Header
-----------------------------------------------------------
local inscom = require("plugins.custom.inscom")

vim.keymap.set("n", "<leader>C1", function()
	inscom.setup({
		style = "style-1", -- style 1
	})
end, { desc = "Header 1" })

vim.keymap.set("n", "<leader>C2", function()
	inscom.setup({
		style = "style-2", -- style 2
	})
end, { desc = "Header 2" })

vim.keymap.set("n", "<leader>C3", function()
	inscom.setup({
		style = "style-3", -- style 3
	})
end, { desc = "Header 3" })

-----------------------------------------------------------
--  INFO: Transparency
-----------------------------------------------------------

vim.keymap.set("n", "<leader>o", function()
	vim.cmd("TransparentToggle")

	local themify = require("themify.api")

	themify.set_current(themify.get_current().colorscheme_id, themify.get_current().theme)
end)
