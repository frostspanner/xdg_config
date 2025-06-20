local later = MiniDeps.later

later(function()
	require("mini.pairs").setup()
	require("mini.completion").setup()
	require("neotab").setup({})
end)
