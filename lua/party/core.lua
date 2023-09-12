local M = {}

local cterm_colors = {
	1, -- DarkBlue
	2, -- DarkGreen
	3, -- DarkCyan
	4, -- DarkRed
	5, -- DarkMagenta
	6, -- Brown/DarkYellow
	7, -- LightGrey
	9, -- Blue
	10, -- Green
	11, -- Cyan
	12, -- Red
	13, -- Magenta
	14,  -- Yellow
}

local function set_party_colors(config)
	local all_groups = vim.fn.getcompletion("", "highlight")

	local is_gui = vim.o.termguicolors

	for _, hl_group in ipairs(all_groups) do
		local hl_info = vim.api.nvim_get_hl_by_name(hl_group, true)
		local bg_color = config.background == "current" and hl_info.background or nil
		local index = math.random(1, #config.colors) -- Choose a random color

		local attributes
		if is_gui then
			attributes = {
				foreground = config.colors[index],
				background = bg_color,
			}
		else
			attributes = {
				ctermfg = cterm_colors[index],
				ctermbg = bg_color,  -- This assumes the background color is in the cterm colors set or nil
			}
		end

		pcall(function()
			vim.api.nvim_set_hl(0, hl_group, attributes)
		end)
	end
end

local function capture_original_colors()
	M.original_colorscheme = vim.g.colors_name or "default"
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
