local flags = Config.modules.lang.lua
local pgks = Config.packages
local utils = require('halo.functions')

local M = {
	["base"] = {
		["folke/lazydev.nvim"] = {
			enabled = true,
			spec = { source = "folke/lazydev.nvim" },
		},
	},
}

utils.registerPackage({"base"}, M)
-- utils.registerPackage(flags, M)

