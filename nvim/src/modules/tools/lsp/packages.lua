local flags = Config.modules.tools.lsp
local pkgs = Config.packages
local utils = require('halo.functions')

local M = {
	["base"] = {
		["zeioth/garbage-day.nvim"] = {
			enabled = true,
			spec = { source = "zeioth/garbage-day.nvim" },
		},
	},
	["+lspconfig"] = {
		["neovim/nvim-lspconfig"] = {
			enabled = true,
			spec = { source = "neovim/nvim-lspconfig" },
		},
	}
}

utils.registerPackage({"base"}, M)
utils.registerPackage(flags, M)
