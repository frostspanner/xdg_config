local flags = Config.modules.tools.format
local pkgs = Config.packages
local utils = require("halo.functions")


local M = {
	["base"] = {
		["stevearc/conform.nvim"] = {
			enabled = true,
			spec = { source = "stevearc/conform.nvim" },
		},
	},
}

utils.registerPackage({ "base" }, M)
-- util.modpackages(mod, M)
