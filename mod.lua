function data()
return {
	info = {
	minorVersion = 0, -- minor version, count up from 0
	severityAdd = "NONE", -- OPTIONAL "NONE", "WARNING" or "CRITICAL"
	severityRemove = "NONE", -- OPTIONAL "NONE", "WARNING" or "CRITICAL"
	name = _("Meshlabels"), -- OPTIONAL mod name
	description = _("see description"), -- OPTIONAL description
	authors = { -- OPTIONAL one or multiple authors
		{
			name = "Yung Lenin", -- author name
			role = "CREATOR", -- OPTIONAL "CREATOR", "CO_CREATOR", "TESTER" or "BASED_ON" or "OTHER"
			tfnetId = "" -- OPTIONAL train-fever-net author id
		}
	},
	tags = { "tool", "script" }, -- OPTIONAL "vehicle", "bus", "tram", "train", "steam", "diesel", "electric", "railcar", "wagon", "passenger", "goods", "building", "station", "deco", "town", "depot", "signal", "tool", "pack" or similar tags
	--tfnetId = {}, -- OPTIONAL train-fever.net download id
	--dependencies = { }, -- OPTIONAL list of dependent mod ids
	--url = { }, -- OPTIONAL mod url
	}
}
end
