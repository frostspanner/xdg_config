pcall(function()
	vim.loader.enable()
end)
-- step 1 mini
--
_G.Config = {
	path_package = vim.fs.joinpath(vim.fn.stdpath("data"), "site"),
	path_modules = vim.fs.joinpath(vim.fn.stdpath("config"), "src", "modules"),
	path_pkgs = vim.fs.joinpath(vim.fn.stdpath("config"), "src", "pkgs"),
	path_halo = vim.fs.joinpath(vim.fn.getenv("Home"), ".config", "halo"),
	modules = {},
	packages = {},
	user_config = {},
}

local path_halo = Config.path_halo

dofile(vim.fs.joinpath(path_halo, "init.lua"))
dofile(vim.fs.joinpath(path_halo, "config.lua"))
vim.opt.rtp:append(vim.fs.joinpath(path_halo, "after"))

local mini_path = vim.fs.joinpath(Config.path_package, "pack/deps/start/mini.nvim")

-- TODO: move to install util
if not vim.uv.fs_stat(mini_path) then
	vim.cmd([[echo "Installing 'mini.nvim'" | redraw]])
	local clone_cmd = { "git", "clone", "--filter=blob:none", "https://github.com/echasnovski/mini.nvim", mini_path }
	vim.fn.system(clone_cmd)
end

require("mini.deps").setup({ path = { package = Config.path_package } })

local source = function(path)
	dofile(path .. ".lua")
end

local modules = Config.modules
local modpath = Config.path_modules

source(vim.fs.joinpath(modpath, "core") .. "/packages")
for k, v in pairs(modules) do
	for h, _ in pairs(v) do
		source(vim.fs.joinpath(modpath, k, h) .. "/packages")
	end
end

local pkgs = Config.packages
local pkgpath = Config.path_pkgs

for k, v in pairs(pkgs) do
	if v == true then
		source(pkgpath .. "/" .. k)
	end
end

source(vim.fs.joinpath(modpath, "core") .. "/config")
for k, v in pairs(modules) do
	for h, _ in pairs(v) do
		source(vim.fs.joinpath(modpath, k, h) .. "/config")
	end
end
-- step 3 completion
