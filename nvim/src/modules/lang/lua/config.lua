local later = MiniDeps.later
-- local now = MiniDeps.now
local flags = Config.modules.lang.lua
local utils = require("halo.functions")

local M = {}

M = {
	["base"] = {
		later = function() end,
		now = function() end,
	},
	["+nvim"] = {
		later = function()
			require("lazydev").setup()
			require("mini.doc").setup()
		end,
		now = function() end,
	},
	["+test"] = {
		later = function()
			require("mini.test").setup()
		end,
		now = function() end,
	},
}

utils.flagsConfig({ "base" }, M)
utils.flagsConfig(flags, M)
