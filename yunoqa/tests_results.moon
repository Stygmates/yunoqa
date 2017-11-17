
tap = require "yunoqa.tap"

Test = require "yunoqa.test"

class
	new: (arg) =>
		@summary = {
			"ok":     0
			"not ok": 0
			"todo":   0
			"skip":   0
		}

	@@from_filename = (fileName) ->
		self = @@!

		date, environmentName, revisionName = fileName\match "/([^/]*)#(.*)#(.*)%.tap$"

		file, reason = io.open fileName, "r"

		unless file
			io.stderr\write "Error opening #{fileName}: #{reason}\n"
			return nil

		content = file\read "*all"
		file\close!

		tapTests = tap.parse content
		for result in *tapTests
			table.insert @, Test result

		@summary = tapTests.summary

		@date = date
		@environmentName = environmentName
		@revisionName = revisionName

		@

	__tostring: =>
		"<yunoqa.TestsResults, #{#@} tests>"

