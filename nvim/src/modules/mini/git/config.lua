-- local flags = Config.modules.mini.finder
local utils = require("halo.functions")

local M = {}

M = {
	["base"] = {
		later = function()
			require("mini.git").setup()
			require("mini.diff").setup()
		end,
		now = function() end,
	},
}

utils.flagsConfig({ "base" }, M)
-- utils.flagsConfig(flags, M)
