local flags = Config.modules.mini.finder
local utils = require("halo.functions")

local M = {}

M = {
	["base"] = {
		later = function()
			require("mini.files").setup({
				mappings = {
					-- allows macros
					close = "<Esc>",
				},
			})
		end,
		now = function() end,
	},
	["+nvimtree"] = {},
	["^nvimtree"] = {},
	["+neotree"] = {},
	["^neotree"] = {},
}

utils.flagsConfig({ "base" }, M)
utils.flagsConfig(flags, M)
