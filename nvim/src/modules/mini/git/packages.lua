--[[
local flags = Config.modules.mini.finder
local pkgs = Config.packages
local utils = require("halo.functions")

local M = {
	["base"] = {},
	["+fzf"] = {},
	["+telescope"] = {},
	["^fzf"] = {},
	["^telescope"] = {},
}

utils.registerPackage({ "base" }, M)
util.modpackages(mod, M)
--]]
