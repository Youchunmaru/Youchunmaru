local P = {}

classLogger = P

local logger = require("logger")

function P:new(name)
	local className = name
	local O = {}
	function O.log(msg)
		print(
			logger.apply(cn(className), {
				bg = "blue",
				fg = "black",
				f = "cursiv",
			}),
			msg
		)
	end
	function O.warn(msg)
		print(
			logger.apply(cn(className), {
				bg = "yellow",
				fg = "black",
				f = "underline",
			}),
			msg
		)
	end
	function O.error(msg)
		print(
			logger.apply(cn(className), {
				bg = "red",
				fg = "white",
				f = "bold",
			}),
			msg
		)
	end
	function O.print(msg, settings)
		print(logger.apply(cn(className), settings), msg)
	end
	function O.printFull(msg, settings)
		print(logger.apply(cn(className), settings), logger.apply(msg, settings))
	end
	return O
end

function cn(className)
	return "[" .. string.upper(className) .. "]"
end

return classLogger
