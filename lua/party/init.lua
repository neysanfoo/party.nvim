local M = {}

local default_config = {
	background = 'current',
	colors = {
		"#FF0000", -- Red
		"#FF7F00", -- Orange
		"#FFFF00", -- Yellow
		"#7FFF00", -- Chartreuse
		"#00FF00", -- Green
		"#00FF7F", -- SpringGreen
		"#00FFFF", -- Cyan
		"#007FFF", -- Azure
		"#0000FF", -- Blue
		"#7F00FF", -- Violet
		"#FF00FF", -- Magenta
		"#FF007F", -- Rose
	},
	interval = 500  -- default interval in milliseconds
}

local core = require('party.core')
vim.cmd("command! PartyToggle M.toggle()")

M.setup = function(user_config)
	if user_config.interval and user_config.interval < 200 then
		user_config.interval = 200
	end
	default_config = vim.tbl_extend('force', default_config, user_config)
end

M.toggle = function()
	core.toggle_party(default_config)
end

vim.api.nvim_create_user_command("PartyToggle", M.toggle, {})

return M
