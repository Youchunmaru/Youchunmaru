local name = "DEPLOY RUNNER"

local logger = classLogger:new(name)

function deploystart(path)
	local r = io.popen("cd " .. path .. " ; ./deploy.sh restart &")
	if r then
		for l in r:lines("*l") do
			logger.log(l)
		end
	end
end

function deploybuild(path)
	os.execute("cd " .. path .. " ; ./deploy.sh -a -c -u -r -s -z")
end

function Prepare(path, args)
	return true
end

function Run(path, args)
	deploystart(path)
end
