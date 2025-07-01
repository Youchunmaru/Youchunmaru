local P = {}

logger = P

local escape = string.char(27)
local apply_code = "[%dm"
local reset_code = "[0m"
local format_codes = {
	bold = 1, -- just bold
	dim = 2, -- is dimmed
	cursiv = 3, -- just cursiv
	underline = 4, -- just underlined
	--blink = 5,
	--blink_fast = 6,
	reverse = 7, -- fg and bg switched
	hidden = 8, -- it is invisable
	cross = 9, -- crossed out
}

local foreground_codes = {
	black = 30,
	red = 31,
	green = 32,
	yellow = 33,
	blue = 34,
	magenta = 35,
	cyan = 36,
	white = 37,
}

local background_codes = {
	black = 40,
	red = 41,
	green = 42,
	yellow = 43,
	blue = 44,
	magenta = 45,
	cyan = 46,
	white = 47,
}

local function replace(code)
	return escape .. apply_code:format(code)
end

local function format(key)
	return replace(format_codes[key])
end

local function foreground(key)
	return replace(foreground_codes[key])
end

local function background(key)
	return replace(background_codes[key])
end

local f = format
local fg = foreground
local bg = background
local r = escape .. reset_code

local function apply(msg, settings)
	if settings.f then
		msg = f(settings.f) .. msg
	end
	if settings.fg then
		msg = fg(settings.fg) .. msg
	end
	if settings.bg then
		msg = bg(settings.bg) .. msg
	end

	return msg .. r
end

local log_settings = {
	default = {},
	info = {
		bg = "blue",
		fg = "black",
		f = "cursiv",
	},
	warn = {
		bg = "yellow",
		fg = "black",
		f = "underline",
	},
	error = {
		bg = "red",
		fg = "white",
		f = "bold",
	},
}

local ls = log_settings

local print_settings = {
	default = {},
	title = {
		bg = "black",
		fg = "white",
		f = "bold",
	},
}

local ps = print_settings

function P.log(msg, type)
	print(apply(msg, ls[type]))
end

function P.print(msg, settings)
	print(apply(msg, settings))
end

function P.printPs(msg, settings)
	print(apply(msg, ps[settings]))
end

function P.printF(msg, format_key)
	print(apply(msg, { f = format_key }))
end

function P.printFg(msg, foreground_key)
	print(apply(msg, { fg = foreground_key }))
end

function P.printBg(msg, background_key)
	print(apply(msg, { bg = background_key }))
end

function P.apply(msg, settings)
	return apply(msg, settings)
end

return logger
