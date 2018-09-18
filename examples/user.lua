local ohm = dofile("./ohm.lua")

return ohm.model("User", {
	
	attributes = {
		"lname",
		"fname",
		"email"
	},

	indices = {
		"full_name"
	},

	uniques = {
		"email"
	},

	tracked = {
		"notes"
	}
})
