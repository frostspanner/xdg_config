local flags = Config.modules.mini.finder
local utils = require("halo.functions")

local M = {}

M = {
	["base"] = {
		later = function()
			require("mini.pick").setup()
			require("mini.extra").setup()
			require("mini.fuzzy").setup()
		end,
		now = function() end,
	},
	["+fzf"] = {},
	["^fzf"] = {},
	["+telescope"] = {},
	["^telescope"] = {},
}

utils.flagsConfig({ "base" }, M)
utils.flagsConfig(flags, M)
