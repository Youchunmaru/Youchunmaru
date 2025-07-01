local P = {}

console = P

function P.execWithOutput(exec)
	local r = io.popen(exec .. " &", "r")
	for l in r:lines("*l") do
		--print(line)
	end
end

return console
