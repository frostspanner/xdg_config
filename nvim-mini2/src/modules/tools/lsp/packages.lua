local mod = Config.modules.tools.lsp
local util = require("halo.functions")

mod[#mod + 1] = "base"

local M = {
	["base"] = {
		pkgs = {
			["garbage-day.nvim"] = true,
		},
	},
	["+lspconfig"] = {
		pkgs = {
			["nvim-lspconfig"] = true,
		},
	},
}

util.pkgupdate(mod, M)
