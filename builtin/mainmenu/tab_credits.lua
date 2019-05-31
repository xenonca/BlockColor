--Minetest
--Copyright (C) 2013 sapier
--
--This program is free software; you can redistribute it and/or modify
--it under the terms of the GNU Lesser General Public License as published by
--the Free Software Foundation; either version 2.1 of the License, or
--(at your option) any later version.
--
--This program is distributed in the hope that it will be useful,
--but WITHOUT ANY WARRANTY; without even the implied warranty of
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--GNU Lesser General Public License for more details.
--
--You should have received a copy of the GNU Lesser General Public License along
--with this program; if not, write to the Free Software Foundation, Inc.,
--51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

--------------------------------------------------------------------------------

local core_developers = {
	"Mrchiantos",
}

local active_contributors = {
}

local previous_core_developers = {
}

local previous_contributors = {
}

local function buildCreditList(source)
	local ret = {}
	for i = 1, #source do
		ret[i] = core.formspec_escape(source[i])
	end
	return table.concat(ret, ",,")
end

return {
	name = "credits",
	caption = fgettext("Credits"),
	cbf_formspec = function(tabview, name, tabdata)
		local logofile = defaulttexturedir .. "logo.png"
		local version = core.get_version()
		return "image[0.5,1;" .. core.formspec_escape(logofile) .. "]" ..
			"label[1,4;BlockColor is based on Minetest 0.4.17 which is developed by a number of contributors.]" ..
			"tablecolumns[color;text]" ..
			"tableoptions[background=#00000000;highlight=#00000000;border=false]" ..
			"table[3.5,1;8.5,6.05;list_credits;" ..
			"#FFFF00," .. fgettext("Core Developers") .. ",," ..
			buildCreditList(core_developers) .. ","
			..";1]"
	end
}
