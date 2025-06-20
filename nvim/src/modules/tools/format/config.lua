local later = MiniDeps.later
local langs = Config.modules.lang

local lspmap = {
	lua = { "stylua" },
}

local formattermap = {}

for k, _ in pairs(langs) do
	formattermap[k] = lspmap[k]
end

later(function()
	require("conform").setup({
		formatters_by_ft = formattermap,
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	})
end)
