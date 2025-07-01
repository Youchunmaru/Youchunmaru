local r = io.popen("lua loop.lua", r)

print("first")

for l in r:lines("*l") do
	print("test")
	print(l)
end
