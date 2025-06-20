local mod = Config.modules.lang.lua
local util = require("halo.functions")

mod[#mod + 1] = "base"

local M = {
	["base"] = {
		pkgs = {
			["lazydev.nvim"] = true,
		},
	},
}

util.pkgupdate(mod, M)
