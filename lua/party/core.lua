local M = {}

local function set_party_colors(config)
	local all_groups = vim.fn.getcompletion("", "highlight")
	local colors = config.colors
	for _, hl_group in ipairs(all_groups) do
		local bg_color = config.background == 'current' and vim.api.nvim_get_hl_by_name(hl_group, true).background or nil
		local index = math.random(1, #colors)
		local fg_color = colors[index]
		pcall(function()
			vim.api.nvim_set_hl(0, hl_group, { foreground = fg_color, background = bg_color })
		end)
	end
end

local function capture_original_colors()
	M.original_colorscheme = vim.g.colors_name
end

local function restore_original_colors()
	vim.cmd("colorscheme " .. M.original_colorscheme)
end

M.toggle_party = function(config)
	if not M.timer then
		-- Capture original colors
		capture_original_colors()

		-- Create a timer to change colors at an interval
		set_party_colors(config)
		M.timer = vim.loop.new_timer()
		M.timer:start(
			0,
			config.interval,
			vim.schedule_wrap(function()
				set_party_colors(config)
			end)
		)
	else
		M.timer:stop()
		M.timer:close()
		M.timer = nil

		-- Restore original colors
		vim.defer_fn(restore_original_colors, 10)
	end
end

return M


