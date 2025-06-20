-- Pull in the wezterm API
local wezterm = require 'wezterm'
local OS = package.config:sub(1,1) == "\\" and "win" or "unix"

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
-- For example, changing the coloruscheme:
config.color_scheme = 'GruvboxDarkHard'
config.colors = {
	-- background = '#ffffff'
	background = '#1d2021'
}
config.window_decorations = 'RESIZE'
config.window_padding = {
  right = 15,
  left = 15,
  top = 15,
  bottom = 15
}

config.window_background_opacity = 1

--[[ config.set_environment_variables = {
  CHERE_INVOKING = '1',
  MSYS2_PATH_TYPE = 'inherit',
  MSYSTEM = 'UCRT64'
} ]]

config.font = wezterm.font_with_fallback {
  {family = 'M PLUS 1 Code'},
  {family = 'Symbols NF'}
}
config.font_size = 9.5
config.line_height = 1
config.hide_tab_bar_if_only_one_tab = true

if OS == "win" then
  config.default_prog = {'powershell.exe', '-NoLogo'}
end

config.color_schemes = {
	['cyberdream'] = {
		foreground = "#ffffff",
		background = "#16181a",

		cursor_bg = "#ffffff",
		cursor_fg = "#16181a",
		cursor_border = "#ffffff",

		selection_fg = "#ffffff",
		selection_bg = "#3c4048",

		scrollbar_thumb = "#16181a",
		split = "#16181a",

		ansi = { "#16181a", "#ff6e5e", "#5eff6c", "#f1ff5e", "#5ea1ff", "#bd5eff", "#5ef1ff", "#ffffff" },
		brights = { "#3c4048", "#ff6e5e", "#5eff6c", "#f1ff5e", "#5ea1ff", "#bd5eff", "#5ef1ff", "#ffffff" },
		indexed = { [16] = "#ffbd5e", [17] = "#ff6e5e" },
	},
	['minischeme dark'] = {
		ansi = {
			'#112641',
			'#ffcfa0',
			'#9ff895',
			'#46a436',
			'#42f7ff',
			'#ffc4ff',
			'#ca6ecf',
			'#e2e98f'
		},
		background = '#112641',
		cursor_bg = '#e2e98f',
		cursor_border = '#e2e98f',
		cursor_fg = '#112641',
		foreground = '#fcffaa',
		brights = {
			'#8691a7',
			'#ffcfa0',
			'#9ff895',
			'#46a436',
			'#42f7ff',
			'#ffc4ff',
			'#ca6ecf',
			'#fcffaa'
		},
	},
	['minischeme light'] = {
		ansi = {
			'#e2e5ca',
			'#5e2200',
			'#004500',
			'#008818',
			'#004b76',
			'#7d0077',
			'#b34aad',
			'#002a83'
		},
		background = '#e2e5ca',
		cursor_bg = '#002a83',
		cursor_border = '#002a83',
		cursor_fg = '#e2e5ca',
		foreground = '#080500',
		brights = {
			'#73765a',
			'#5e2200',
			'#004500',
			'#008818',
			'#004b76',
			'#7d0077',
			'#b34aad',
			'#080500'
		},
	},
	['Mellifluous Tender'] = {
		background = '#282828',
		cursor_bg = '#73cef4',
		cursor_border = '#73cef4',
		cursor_fg = '#282828',
		foreground = '#eeeeee',
		ansi = {
			'#282828',
			'#ff95a1',
			'#c9d05c',
			'#d3b987',
			'#b3deef',
			'#73cef4',
			'#b3deef',
			'#6d6d6d',
		},
		brights = {
			'#313131',
			'#ffc1cd',
			'#f6fe8a',
			'#ffe6b2',
			'#dbffff',
			'#a0fcff',
			'#dbffff',
			'#c1c1c1',
		}
	},
	-- https://github.com/neovim/neovim/pull/26540
	['Nvim Dark'] = {
		ansi = {
			'#9b9ea4',
			'#ffc0b9',
			'#b3f6c0',
			'#fce094',
			'#a6dbff',
			'#ffcaff',
			'#8cf8f7',
			'#e0e2ea'
		},
		background = '#14161b',
		cursor_bg = '#e0e2ea',
		cursor_border = '#e0e2ea',
		cursor_fg = '#14161b',
		foreground = '#e0e2ea',
		brights = {
			'#9b9ea4',
			'#ffc0b9',
			'#b3f6c0',
			'#fce094',
			'#a6dbff',
			'#ffcaff',
			'#8cf8f7',
			'#e0e2ea'
		},
	},
	['Nvim Light'] = {
		ansi = {
			'#4f5258',
			'#590008',
			'#005523',
			'#6b5300',
			'#004373',
			'#470045',
			'#007373',
			'#14161b'
		},
		background = '#e0e2ea',
		cursor_bg = '#004373',
		cursor_border = '#004373',
		cursor_fg = '#e0e2ea',
		foreground = '#14161b',
		brights = {
			'#4f5258',
			'#590008',
			'#005523',
			'#6b5300',
			'#004373',
			'#470045',
			'#007373',
			'#14161b'
		},
	},
	['Melange Dark'] = {
		foreground    = "#ECE1D7",
		background    = "#292522",
		cursor_bg     = "#ECE1D7",
		cursor_border = "#ECE1D7",
		cursor_fg     = "#292522",
		selection_bg  = "#403A36",
		selection_fg  = "#ECE1D7",
		ansi = {
			"#34302C",
			"#BD8183",
			"#78997A",
			"#E49B5D",
			"#7F91B2",
			"#B380B0",
			"#7B9695",
			"#C1A78E"
		},
		brights = {
			"#867462",
			"#D47766",
			"#85B695",
			"#EBC06D",
			"#A3A9CE",
			"#CF9BC2",
			"#89B3B6",
			"#ECE1D7"}
		},
		['Gruvbox Material Dark'] = {
			foreground = '#D4BE98',
			-- background = '#202020',
			-- background = '#292928',
			background = '#221a02',
			-- background = '#32302f',
			cursor_bg = '#52ad70',
			cursor_fg = 'black',
			cursor_border = '#52ad70',
			selection_fg = 'black',
			scrollbar_thumb = '#222222',
			split = '#3a3735',
			ansi = {
				'#665C54',
				'#EA6962',
				'#A9B665',
				'#D8A657',
				'#7DAEA3',
				'#D3869B',
				'#89B482',
				'#D4BE98'
			},
			brights = {
				'#928374',
				'#EA6962',
				'#A9B665',
				'#D8A657',
				'#7DAEA3',
				'#D3869B',
				'#89B482',
				'#D4BE98'
			}
		}
	}

	-- and finally, return the configuration to wezterm
	return config
