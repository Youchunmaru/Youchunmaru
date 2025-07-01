local name = "DOCKER RUNNER"

function dockerstart(name, args)
	os.execute("docker start " .. name)
end

function dockerstop(name, args)
	os.execute("docker stop " .. name)
end

function Prepare(path, args)
	return true
end

function Run(path, args)
	dockerstart(path, args)
end
