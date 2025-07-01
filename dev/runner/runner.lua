local upper = string.upper
local runnerpath = "./runner/"

local logger = classLogger:new("runner")

function Runner(runner, path, args)
	require(runnerpath .. runner)
	local name = upper(runner or "") .. "RUNNER"
	if runner then
		if Prepare(path, args) then
			logger.log("Starting " .. runner .. "runner")
			Run(path, args)
		else
			logger.error("Build Fail")
		end
	else
		logger.warn("Usage lua runner.lua [runner]")
	end
end
