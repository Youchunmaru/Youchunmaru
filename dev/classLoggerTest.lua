local classLogger = require("classLogger")

local testLogger = classLogger:new("Test")

local otherLogger = classLogger:new("other")

testLogger.log("log")
otherLogger.log("log")

testLogger.print("", { f = "hidden" })

testLogger.error("error")
testLogger.warn("warn")

testLogger.print("", { f = "hidden" })

otherLogger.print("print", { f = "bold", fg = "green" })
otherLogger.printFull("printFull", { f = "cursiv", bg = "white" })
