--
--  HACK: Keymaps
--

local map = vim.keymap -- Keymaps

-----------------------------------------------------------

-- Disable the spacebar key's default behavior in Normal and Visual modes
map.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-----------------------------------------------------------
--  INFO: Code (file) actions
-----------------------------------------------------------
local function message(msg, icon)
	local file = vim.fn.expand("%:t")
	return icon .. file .. msg
end

map.set("n", "<leader>cs", function()
	vim.cmd("w")
	vim.notify(message(" Saved ", " 󰆓 "), "", {
		title = "VIM",
	}) -- Save
end, opts)

map.set("n", "<leader>cn", function()
	vim.cmd("noautocmd w")
	vim.notify(message(" Saved (no format)", " 󰽂 "), "", {
		title = "VIM",
	}) -- Save without formatting
end, opts)

map.set({ "n" }, "<leader>cf", function()
	require("conform").format({
		lsp_fallback = true,
		async = true,
		timeout_ms = 500,
	})
	vim.notify(message(" Code formatted!", " 󰆓 "), "", {
		title = "VIM",
	})
end)

-----------------------------------------------------------
--  INFO: Find and center
-----------------------------------------------------------
map.set("n", "n", "nzzzv", opts)
map.set("n", "N", "Nzzzv", opts)

-----------------------------------------------------------
--  INFO: Resize with arrows
-----------------------------------------------------------
map.set("n", "<Up>", ":resize -2<CR>", opts)
map.set("n", "<Down>", ":resize +2<CR>", opts)
map.set("n", "<Left>", ":vertical resize -2<CR>", opts)
map.set("n", "<Right>", ":vertical resize +2<CR>", opts)

-----------------------------------------------------------
--  INFO: Buffers
-----------------------------------------------------------
map.set("n", "<Tab>", ":bnext<CR>", opts)
map.set("n", "<S-Tab>", ":bprevious<CR>", opts)
map.set("n", "<leader>bx", ":lua MiniBufremove.delete()<CR>", opts) -- close buffer
map.set("n", "<leader>bb", "<cmd> enew <CR>", opts) -- new buffer

-----------------------------------------------------------
--  INFO: Split
-----------------------------------------------------------
map.set("n", "<leader>sv", "<C-w>v", opts) -- split window vertically
map.set("n", "<leader>sh", "<C-w>s", opts) -- split window horizontally
map.set("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
map.set("n", "<leader>sx", ":close<CR>", opts) -- close current split window

-----------------------------------------------------------
--  INFO: Navigate between splits
-----------------------------------------------------------
map.set("n", "<C-k>", ":wincmd k<CR>", opts)
map.set("n", "<C-j>", ":wincmd j<CR>", opts)
map.set("n", "<C-h>", ":wincmd h<CR>", opts)
map.set("n", "<C-l>", ":wincmd l<CR>", opts)

-----------------------------------------------------------
--  INFO: Tabs
-----------------------------------------------------------
map.set("n", "<leader>To", ":tabnew<CR>", opts) -- open new tab
map.set("n", "<leader>Tx", ":tabclose<CR>", opts) -- close current tab
map.set("n", "<leader>Tn", ":tabn<CR>", opts) --  go to next tab
map.set("n", "<leader>Tp", ":tabp<CR>", opts) --  go to previous tab

-----------------------------------------------------------
--  INFO: Indent lines
-----------------------------------------------------------
map.set("v", "<", "<gv", opts)
map.set("v", ">", ">gv", opts)

-----------------------------------------------------------
--  INFO: Actions
-----------------------------------------------------------
map.set("v", "p", '"_dP', opts) -- Keep last yanked when pasting

-----------------------------------------------------------
--  INFO: Diagnostic
-----------------------------------------------------------
map.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" }) -- Previous Diagnostic
map.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" }) -- Next Diagnostic
map.set("n", "<leader>df", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" }) -- Floating Diagnostic
map.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Open diagnostics list" }) -- Diagnostic list
map.set("n", "<leader>dt", "<Cmd>lua require('tiny-inline-diagnostic').toggle()<CR>") -- Toggle diagnostic

-----------------------------------------------------------
--  INFO: Neotree
-----------------------------------------------------------
map.set("n", "<leader>n", "<Cmd>Neotree toggle position=left<CR>", { desc = "Explorer Neoree (Toggle)" })

-- Search
map.set("n", "<C-c>", "<Cmd>noh<CR>", opts)

-----------------------------------------------------------
--  INFO: Telescope
-----------------------------------------------------------
local builtin = require("telescope.builtin")
map.set("n", "<leader><space>", builtin.find_files, { desc = "Telescope find files" })
map.set("n", "<leader>G", builtin.live_grep, { desc = "Telescope live grep" })
map.set("n", "<leader>bf", builtin.buffers, { desc = "Telescope buffers" })
map.set("n", "<leader>h", builtin.help_tags, { desc = "Telescope help tags" })

-----------------------------------------------------------
--  INFO: Quit
-----------------------------------------------------------
map.set("n", "<leader>qq", "<Cmd>qa<CR>") -- Quit without saving!
map.set("n", "<leader>qw", "<Cmd>xa<CR>") -- Quit and save
map.set("n", "<C-q>", "<cmd> q <CR>", opts) -- Quit current

-----------------------------------------------------------
--  INFO: Lazy
-----------------------------------------------------------
map.set("n", "<leader>l", "<Cmd>Lazy<CR>", { desc = "Lazy" }) -- Call Lazy

-----------------------------------------------------------
--  INFO: Mason
-----------------------------------------------------------
map.set("n", "<leader>m", "<Cmd>Mason<CR>") -- Call Mason

-----------------------------------------------------------
--  INFO: Deleting
-----------------------------------------------------------
map.set({ "n", "v" }, "<leader>x", '"_d') -- "Delete without copy it"
map.set("n", "x", '"_x', opts) -- Delete single character without copying into register

-----------------------------------------------------------
--  INFO: TODO Comments
-----------------------------------------------------------
map.set("n", "]t", function()
	require("todo-comments").jump_next() -- Next todo comment
end, { desc = "Next todo comment" })

map.set("n", "[t", function()
	require("todo-comments").jump_prev() -- Previous todo comment
end, { desc = "Previous todo comment" })

-----------------------------------------------------------
--  INFO: Projects
-----------------------------------------------------------
local projects = require("plugins.custom.projects")

map.set("n", "<leader>p", function()
	projects.setup()
end, { desc = "Projects" })

-----------------------------------------------------------
-- INFO: Theme Switcher
-----------------------------------------------------------
local themeSwitcher = require("plugins.custom.theme-switcher")

map.set("n", "<leader>v", function()
	themeSwitcher.setup()
end, { desc = "Theme switcher" })

-----------------------------------------------------------
--  INFO: Lorem Ipsum
-----------------------------------------------------------
map.set("n", "<leader>Lw", function()
	vim.cmd("LoremIpsum words " .. vim.fn.input("Number of words")) -- Words
end, { desc = "Words" })

map.set("n", "<leader>Lp", function()
	vim.cmd("LoremIpsum paragraphs " .. vim.fn.input("Number of paragraphs")) -- Paragraphs
end, { desc = "Paragraphs" })

-----------------------------------------------------------
--  INFO: Comment Header
-----------------------------------------------------------
local inscom = require("plugins.custom.inscom")

map.set("n", "<leader>C1", function()
	inscom.setup({
		style = "style-1", -- style 1
	})
end, { desc = "Header 1" })

map.set("n", "<leader>C2", function()
	inscom.setup({
		style = "style-2", -- style 2
	})
end, { desc = "Header 2" })

map.set("n", "<leader>C3", function()
	inscom.setup({
		style = "style-3", -- style 3
	})
end, { desc = "Header 3" })

-----------------------------------------------------------
--  INFO: Transparency
-----------------------------------------------------------
map.set("n", "<leader>o", function()
	vim.cmd("TransparentToggle")

	local themify = require("themify.api")

	themify.set_current(themify.get_current().colorscheme_id, themify.get_current().theme)
end)

-----------------------------------------------------------
--  INFO: Renamer
-----------------------------------------------------------
map.set("n", "<leader>r", ":Renamer ")

-----------------------------------------------------------
--  INFO: Yanky
-----------------------------------------------------------
map.set("n", "<leader>y", ":YankyRingHistory<CR>")

-----------------------------------------------------------
--  INFO: Exit "insert" mode
-----------------------------------------------------------
map.set("i", "jj", "<Esc>", { noremap = false })

-----------------------------------------------------------
--  INFO: Live server
-----------------------------------------------------------
map.set("n", "<leader>S", ":LiveServerToggle<CR>")

-----------------------------------------------------------
--  INFO: Copilot
-----------------------------------------------------------
map.set("i", "<S-Tab>", 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true

map.set("n", "<leader>Oe", ":Copilot enable<CR>", { desc = "Enable" })
map.set("n", "<leader>Od", ":Copilot disable<CR>", { desc = "Disable" })

-----------------------------------------------------------
--  INFO: Render Markdown
-----------------------------------------------------------
map.set("n", "<leader>M", ":RenderMarkdown toggle<CR>")
