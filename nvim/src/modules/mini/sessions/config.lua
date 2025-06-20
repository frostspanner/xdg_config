-- local flags = Config.modules.mini.finder
local utils = require("halo.functions")

local M = {}

M = {
	["base"] = {
		later = function() end,
		now = function()
			require("mini.sessions").setup()
		end,
	},
}

utils.flagsConfig({ "base" }, M)
-- utils.flagsConfig(flags, M)
