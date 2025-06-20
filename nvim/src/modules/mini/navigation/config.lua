-- local flags = Config.modules.mini.finder
local utils = require("halo.functions")

local M = {}

M = {
	["base"] = {
		later = function()
			require("mini.bracketed").setup()
			require("mini.jump").setup()
			require("mini.jump2d").setup()
			require("mini.visits").setup()
		end,
		now = function() end,
	},
}

utils.flagsConfig({ "base" }, M)
-- utils.flagsConfig(flags, M)
