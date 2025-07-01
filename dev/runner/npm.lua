local name = "NPM RUNNER"

local logger = classLogger:new(name)

function Prepare(path, args)
	if args and path then
		os.execute("cd " .. path .. " ; npm install &")
	end
	return true
end

function Run(path, args)
	if path then
		local r = io.popen("cd " .. path .. " ; npm start &", "r")
		if r then
			for l in r:lines("*l") do
				logger.log(l)
			end
		end
	end
end
