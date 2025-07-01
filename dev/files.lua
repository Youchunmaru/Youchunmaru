local P = {}

files = P

function P.ls()
	local ls = io.popen("ls", "r")
	local ls_files = {}
	if ls then
		local c = 0
		for l in ls:lines("*l") do
			ls_files[c] = l
			c = c + 1
		end
	end
	return ls_files
end

return files
