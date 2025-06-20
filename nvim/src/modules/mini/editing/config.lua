-- local flags = Config.modules.mini.finder
local utils = require("halo.functions")

local M = {}

M = {
	["base"] = {
		later = function()
			require("mini.ai").setup()
			require("mini.align").setup()
			-- require('mini.comment').setup()
			require("mini.move").setup()
			require("mini.operators").setup()
			require("mini.splitjoin").setup()
			require("mini.surround").setup()
			require("mini.trailspace").setup()
		end,
		now = function() end,
	},
}

utils.flagsConfig({ "base" }, M)
-- utils.flagsConfig(flags, M)
