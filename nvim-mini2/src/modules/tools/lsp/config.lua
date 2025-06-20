local langs = Config.modules.lang
local flags = Config.modules.tools.lsp

local lspmap = {
	lua = "lua_ls",
}

local function lspconfig(ls, map)
	for k, _ in pairs(ls) do
		require("lspconfig")[map[k]].setup({})
	end
end

local configmap = {
	["+lspconfig"] = lspconfig,
}

for _, v in pairs(flags) do
	if configmap[v] ~= nil then
		configmap[v](langs, lspmap)
	end
end
