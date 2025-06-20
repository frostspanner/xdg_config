local Halo = {}

-- [x]core deps basics misc notify trailspace
--input
--completion completion files fuzzy pairs pick
--ui animate base16 clue colors cursorword hipatterns hues icons indentscope map starter statusline tabline
--editor ai align bracketed bufremove comment jump jump2d move operators splitjoin surround
--emacs
--term
--checkers
--tools diff doc git sessions test visits
--os
--lang
--email
--app
--config

Halo.mini = {
	completion = {}, -- pairs completion
	git = {}, -- git diff
	editing = {}, -- align ai comment(misc)? move operators splitjoin surround trailspace
	explorer = {},
	finder = {}, -- pick fuzzy extras
	navigation = {}, -- bracketed jump jump2d visits
	sessions = {},
	starter = {},
	-- themes = {
	-- classic = {},
	-- starry = {},
	-- warm = {},
	-- cold = {},
	-- ide = {},
	-- vivid = {},
	-- minimal = {},
	-- base16 = {}
	-- }, -- base16 colors hues
	ui = {}, --animate clue cursorword diff hipatterns icons indentscope map statusline tabline
	utils = {}, --bufremove  misc
}
Halo.tools = {
	-- treesitter = {},
	lsp = { "+lspconfig" },
	-- trouble = {},
	-- debug = {},
	format = {},
	-- term = {},
	-- notes = {}
}
Halo.lang = {
	-- cc = {},
	-- csharp = {},
	-- javascript = {},
	-- TODO: add mini.doc, mini.test
	lua = { "+nvim", "+test" },
	-- markdown = {},
	-- nix = {},
	-- python = {},
	-- rust = {},
	-- sql = {},
	-- toml = {},
	-- web = {},
	-- yaml = {}
}

Config.modules = Halo
