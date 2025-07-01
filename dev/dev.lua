local classLogger = require("classLogger")
local files = require("files")
local logger = classLogger:new("dev")

local command = arg[1]
local args = {}

function parseArgs()
	for k, v in pairs(arg) do
		if k > 1 then
			args[k] = v
		end
	end
end

parseArgs()

function cmds()
	local ls_files = files.ls()
	local cmds = {}
	for k, v in pairs(ls_files) do
		if string.find(v, "cmd") then
			cmds[k] = v
		end
	end
	return cmds
end

function dev()
	if command then
		local cmd = require(command)
	else
		logger.warn("no command specified")
		for _, v in pairs(cmds()) do
			logger.print(v, {})
		end
	end
end
