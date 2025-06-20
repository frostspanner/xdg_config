-- local flags = Config.modules.mini.finder
local utils = require("halo.functions")

local M = {}

M = {
	["base"] = {
		later = function() end,
		now = function()
			require("mini.starter").setup()
		end,
	},
}

utils.flagsConfig({ "base" }, M)
-- utils.flagsConfig(flags, M)
