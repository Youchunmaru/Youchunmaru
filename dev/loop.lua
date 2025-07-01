for i = 0, 1000, 1 do
	os.execute("echo " .. i)
end

local test = io.read()

for i = 0, 10, 1 do
	os.execute("echo " .. test)
end
