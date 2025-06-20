local M = {}

M.pkgupdate = function(modflags, pkgtbl)
	for i = 1, #modflags, 1 do
		local pkgs = Config.packages
		for k, v in pairs(pkgtbl[modflags[i]]) do
			for x, y in pairs(v) do
				-- if any module sets a package to true
				-- keep it.
				-- User can override later
				if pkgs[x] == true then
				else
					pkgs[x] = y
				end
			end
		end
	end
end

return M
