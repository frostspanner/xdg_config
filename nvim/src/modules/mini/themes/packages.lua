local flags = Config.modules.mini.themes
local pkgs = Config.packages
local utils = require("halo.functions")

local M = {
	["base"] = {},
	["+classic"] = {
		--gruvbox
		--dracula
		--solarized
		--	solarized-osaka
		--	selenized
		--nord gbprod
		--	nordic
		--	nordern
		--jellybeans
		--zenburn
		--monokai
		--	ofirkai
		--	nightasty
		--	ronny
		--	monokai-pro
		--	sonokai
		--onedarkpro
		--	onedarker
		--	navarasu onedark
		--	edge
	},
	["+starry"] = {
		--tokyonight
		--	kyotonight
		--	tokyodark
		--catppuccin
		--gruvbox-material
		--everforest
		--material
		--github
		--rose-pine
		--kanagawa
		--	kanagawa-paper
		--nightfox
	},
	["+warm"] = {
		--gruvbox
		-- srcery
		--gruvbox-material
		--melange
		--miasma
		--chocaltier
		--squirrelbox
		--kimbox
		--mellifluous
		--darkearth
		--evergarden
		--nvim-deus
		--moonbow
	},
	["+blue"] = {
		-- monet
		-- solarized
		-- selenized
		-- oceanicnext
		-- nightfly
		-- night owl
		-- winter is coming
		-- cobalt2
	},
	["+cold"] = {
		--tundra
		--iceberg
		--nord
		--rasmus
		--poimandres
		--embark
		--aquarium
		--substrata
		--blue moon
		--winter is coming
		--nord
	},
	["+ide"] = {
		--gruber darker
		--vscode dark
		--	arctic
		--	visual_studio_code
		--	darkplus
		--vscode dark modern
		--darcula
		--fleet
		--juliana
		--winter is coming
		--night owl
		--xcode
	},
	["+calm"] = {
		-- hybrid
		-- vague
		-- obscure
		-- aylin
		-- minimal
		-- nightcity?
		-- oh-lucy
		-- everblush
		-- mellow
		-- oldworld
		-- sherbet
		-- sweetie
		-- lavi
		-- adwaita
		-- caret
		-- bamboo
	},
	["+vibrant"] = {
		-- bluloco
		-- flow
		--eldritch
		--nightfall
		--neofusion
		--spaceduck
		--mellow
		--sweetie
		--witch
		--distinct
		--spaceduck
		--ayu
		--vn-night
		--aurora
		--midnight
		--dark_flat
		--omni
		--calvera
		--zephyr
	},
	["+quiet"] = {
		--lackluster
		--darkvoid
		-- zenbones
		-- flexoki
		-- mellifluous
		-- newpaper
		-- alabaster
		-- nano
		-- boo
		-- no clown fiesta
		--
	},
	["+base16"] = {},
	["+synth"] = {
		--fluoromachine
		--nvmgelion
		--synthweave
		--kurayami
		--nvim-srcerite
		--nvimgelion
		--eldritch
		--neofusion
	},
	["+hc"] = {
		--hyper
		--oxocarbon
		--citruszest
		--github
		--nightfly
		--moonfly
		--modus
		--cyberdream
		--deepwhite
	},
	["+esoteric"] = {
		--templeos
		--fakedonalds
	},
}

utils.registerPackage({ "base" }, M)
util.modpackages(mod, M)
