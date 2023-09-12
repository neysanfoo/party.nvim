# party.nvim

Are you tired of being productive? Need a break from the monotony of standard syntax highlighting? Well say hello to `party.nvim`! This plugin will turn your code editor into a party 🎉 by making your text glow like a neon dance floor 🕺💃! Get `party.nvim` and confuse your co-workers today!

![PartyToggleDemo](https://github.com/neysanfoo/party.nvim/assets/20664939/e93cf4a0-31de-468c-a852-2ea970baa510)

## Instsallation

- Using [lazy.nvim](https://github.com/folke/lazy.nvim)
```lua
{
    'neysanfoo/party.nvim',
    config = true
}
```

- Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use 'neysanfoo/party.nvim'
```

## Usage:

`:PartyToggle` - Toggle the party mode.

## Configuration:

You can configure the plugin by adding these settings to your configuration:

```lua
require('party').setup({
  background = 'current', -- 'current' (uses the background color of your current colorscheme) or 'default' (uses default Neovim background color)
	colors = {  -- These are the default colors
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
  interval = 500 -- Set the interval (in milliseconds) for changing colors. Lowest possible value is 200.
})
```

### For Terminals Without GUI Colors (`termguicolors` is not set)
If you wish to use custom colors, you must be running in an environment with `termguicolors` enabled. Otherwise, the plugin will default to the predefined terminal color set.

## Recommended Keybinding:

You can easily toggle the party on and off using this recommended keybinding:

```lua
vim.api.nvim_set_keymap('n', '<leader>lol', ':PartyToggle<CR>', { noremap = true, silent = true })
```


Enjoy the party! 🎉🌈🕺💃🎶
