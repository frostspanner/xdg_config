local s = { "-test", "+scratch" }

local m = {
	["+scratch"] = true,
}

for k, v in ipairs(s) do
	print(m[v])
end
