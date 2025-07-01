local projectconfig = arg[1]
local args = arg[2]
require("classLogger")
local logger = classLogger:new("start")
require("runner.runner")
local projectconfigspath = "configs."
local name = "START"
require("configs.config")

function config(name)
	local s, v = pcall(require, projectconfigspath .. name)
	if s then
		return s, v
	end
	return s, {}
end

if projectconfig then
	local s, c = config(projectconfig)
	if s then
		logger.log("loaded config " .. projectconfig)
		if c.prerequisites then
			for k, v in pairs(c.prerequisites) do
				logger.log("fullfilling prerequisite " .. v)
				os.execute("lua start.lua " .. v .. " &")
			end
		end
		Runner(c.runnername, c.path, args)
	else
		logger.error("coudnt load config")
	end
else
	logger.warn("usage lua start.lua [config]")
end
