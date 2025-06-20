local flags = Config.modules.mini.completion
local pkgs = Config.packages
local utils = require('halo.functions')

local M = {
	["base"] = {
		["kawre/neotab.nvim"] = {
			enabled = true,
			spec = { source = "kawre/neotab.nvim" },
		},
	},
}

utils.registerPackage({ "base" }, M)
-- util.modpackages(mod, M)
