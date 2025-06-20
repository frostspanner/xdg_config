local flags = Config.modules.mini.ui
local utils = require("halo.functions")

local M = {}

M = {
	["base"] = {
		later = function()
			require("mini.extra").setup()
			local hipatterns = require("mini.hipatterns")
			local hi_words = MiniExtra.gen_highlighter.words
			hipatterns.setup({
				highlighters = {
					fixme = hi_words({ "FIXME", "Fixme", "fixme" }, "MiniHipatternsFixme"),
					hack = hi_words({ "HACK", "Hack", "hack" }, "MiniHipatternsHack"),
					todo = hi_words({ "TODO", "Todo", "todo" }, "MiniHipatternsTodo"),
					note = hi_words({ "NOTE", "Note", "note" }, "MiniHipatternsNote"),

					hex_color = hipatterns.gen_highlighter.hex_color(),
				},
			})
			require("mini.cursorword").setup()
			require("mini.diff").setup()
			require("mini.icons").setup()
			require("mini.indentscope").setup()
		end,
		now = function()
			require("mini.statusline").setup()
			require("mini.tabline").setup()
		end,
	},
	["+animate"] = {
		later = function() end,
		now = function() end,
	},
	["+map"] = {
		later = function() end,
		now = function() end,
	},
}

utils.flagsConfig({ "base" }, M)
utils.flagsConfig(flags, M)
