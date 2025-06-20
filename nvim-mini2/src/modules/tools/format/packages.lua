local mod = Config.modules.tools.format
local util = require("halo.functions")

mod[#mod + 1] = "base"

local M = {
	["base"] = {
		pkgs = {
			["conform.nvim"] = true,
		},
	},
}

util.pkgupdate(mod, M)
