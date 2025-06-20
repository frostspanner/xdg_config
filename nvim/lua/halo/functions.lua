local later, now = MiniDeps.later, MiniDeps.now
local M = {}
local pkgconfig = Config.packages

M.registerPackage = function(flags, packages)
	if flags ~= nil then
		for _, v in pairs(flags) do
			for h, i in pairs(packages[v]) do
				pkgconfig[h] = i
			end
		end
	end
end

M.flagsConfig = function(flags, packages)
	if flags ~= nil then
		for _, v in pairs(flags) do
			later(packages[v].later)
			now(packages[v].now)
		end
	end
end

return M
