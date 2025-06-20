local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
local opts = {}

add({ source = "folke/lazydev.nvim" })
later(function()
	require("lazydev").setup(opts)
end)
