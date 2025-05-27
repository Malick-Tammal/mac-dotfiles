local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local projects = {}

local getFiles = function(path)
	local files = {}
	for dir in io.popen("ls " .. path .. " | grep -v /"):lines() do
		local dirWithIcon = "󰉋 " .. dir
		table.insert(files, dirWithIcon)
	end
	return files
end

local listProjects = function(opts)
	opts = opts or {}
	local path = "~/Projects/"
	pickers
		.new(opts, {
			finder = finders.new_table({
				results = getFiles(path),
			}),
			sorter = conf.generic_sorter(opts),
			attach_mappings = function(bufnr, map)
				actions.select_default:replace(function()
					actions.close(bufnr)
					local selection = action_state.get_selected_entry()
					local selName = string.sub(selection[1], 6, -1)
					print("Project " .. "~" .. selName .. "~" .. " selected!")
					vim.cmd("edit" .. path .. selName)
					vim.cmd("cd" .. path .. selName)
				end)
				return true
			end,
		})
		:find()
end

local config = {
	prompt_title = "Project name",
	results_title = "󰅨 Projects",
	prompt_prefix = " ",
}

projects.setup = function()
	listProjects(config)
end

return projects
