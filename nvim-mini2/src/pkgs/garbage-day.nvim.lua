local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
local opts = {}

add({ source = "zeioth/garbage-day.nvim" })
later(function()
	require("garbage-day").setup(opts)
end)
