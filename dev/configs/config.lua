local P = {}
config = P

function P.checkTemplate(conf, template)
	local missing = {}
	local malformed = false
	for k, v in pairs(template) do
		if not conf[k] then
			missing[k] = v
			if v then
				malformed = true
			end
		end
	end
	return not malformed, missing
end

function P.check(name)
	local conf = require(name)
	local baseCheck, baseMissing = P.checkTemplate(conf, P.base())
	local malformed = baseCheck
	local missing = { base = baseMissing }
	if conf["templatetype"] then
		for _, v in pairs(conf["templatetype"]) do
			local templateCheck, templateMissing = P.checkTemplate(conf, P.template(v))
			if not templateCheck then
				malformed = templateCheck
			end
			missing[v] = templateMissing
		end
	end
	return malformed, missing
end

function P.printMissing(missing)
	local function padd(value)
		local length = string.len(value)
		return value .. string.rep(" ", 15 - length)
	end
	print("template  ", "field     ", "required  ")
	for template, fields in pairs(missing) do
		for name, required in pairs(fields) do
			print(padd(template), padd(name), required)
		end
	end
end

function P.checkAll()
	local ls = io.popen("ls", "r")
	for file in ls:lines("*l") do
		if not (file == "config.lua") then
			if string.find(file, ".lua") then
				if not string.find(file, "template_") then
					local b, v = P.check(string.gsub(file, ".lua", ""))
					if b then
						print(file .. " is conform")
					else
						print(file .. " is malformed: ")
						P.printMissing(v)
					end
				end
			end
		end
	end
end

function P.template(name)
	local s, v = pcall(require, "template_" .. name)
	if s then
		return v
	else
		print("template " .. name .. " wasnt found")
	end
	return {}
end

function P.base()
	return P.template("base")
end

return config
