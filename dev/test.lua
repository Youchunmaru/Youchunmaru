local pipe, err = io.popen("ls", "r")

if not pipe then
	print(err)
	os.exit()
end

local out = pipe:read("*l")
local outout = pipe:read("*l")
if not out then
	print("err")
else
	print(out)
	print(outout)
end

print(require("ret").test)
