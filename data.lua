--[[ Tried adding heating energy to various entities that don't do anything, but it seems none of them work, so I decided to use an assembler instead.
data.raw["heat-pipe"]["heat-pipe"].heating_energy = "10MW" -- Doesn't work.
data.raw.wall["stone-wall"].heating_energy = "10MW" -- Also doesn't do anything.
data.raw["simple-entity-with-force"]["textplate-large-concrete"].heating_energy = "10MW" -- Also doesn't do anything. (Must be in dff, not data.)
data.raw["solar-panel"]["solar-panel"].heating_energy = "10MW" -- Still nothing.
]]

local heatingEnergyPerTileKW = settings.startup["HeatDissipation-kw-per-tile"].value

-- Create a dummy assembling machine that just exists to suck heat out of the heat pipes.
---@type data.AssemblingMachinePrototype
local heatSinkTimes2 = {
	type = "assembling-machine",
	name = "heat-sink-dummy-assembler-2x",
	icon = data.raw["heat-pipe"]["heat-pipe"].icon,
	icon_size = data.raw["heat-pipe"]["heat-pipe"].icon_size,
	crafting_categories = {"heat-sink-dummy-crafting-category"},
	flags = {"not-on-map", "not-in-kill-statistics", "not-deconstructable", "not-flammable"},
	collision_box = {{0, 0}, {0, 0}},
	selection_box = {{0, 0}, {0, 0}},
	tile_height = 1,
	tile_width = 1,
	heating_energy = (2 * heatingEnergyPerTileKW) .. "kW",
	energy_usage = "1W",
	crafting_speed = 1,
	energy_source = {type = "void"},
	hidden = true,
	show_recipe_icon = false,
	show_recipe_icon_on_map = false,
	selectable_in_game = false,
	collision_mask = {layers = {}},
}

-- 10 step "lookup table" for T^4 since prototypes are immutable at runtime
-- meaning I can't just change the heating_energy variable for each heat pipe.

local heatSink50 = table.deepcopy(heatSinkTimes2)
heatSink50.name = "heat-sink-dummy-50c"
heatSink50.heating_energy = (0.02 * heatingEnergyPerTileKW) .. "kW"

local heatSink150 = table.deepcopy(heatSinkTimes2)
heatSink150.name = "heat-sink-dummy-150c"
heatSink150.heating_energy = (0.06 * heatingEnergyPerTileKW) .. "kW"

local heatSink250 = table.deepcopy(heatSinkTimes2)
heatSink250.name = "heat-sink-dummy-250c"
heatSink250.heating_energy = (0.15 * heatingEnergyPerTileKW) .. "kW"

local heatSink350 = table.deepcopy(heatSinkTimes2)
heatSink350.name = "heat-sink-dummy-350c"
heatSink350.heating_energy = (0.32 * heatingEnergyPerTileKW) .. "kW"

local heatSink450 = table.deepcopy(heatSinkTimes2)
heatSink450.name = "heat-sink-dummy-450c"
heatSink450.heating_energy = (0.59 * heatingEnergyPerTileKW) .. "kW"

local heatSink550 = table.deepcopy(heatSinkTimes2)
heatSink550.name = "heat-sink-dummy-550c"
heatSink550.heating_energy = (heatingEnergyPerTileKW) .. "kW"

local heatSink650 = table.deepcopy(heatSinkTimes2)
heatSink650.name = "heat-sink-dummy-650c"
heatSink650.heating_energy = (1.6 * heatingEnergyPerTileKW) .. "kW"

local heatSink750 = table.deepcopy(heatSinkTimes2)
heatSink750.name = "heat-sink-dummy-750c"
heatSink750.heating_energy = (2.44 * heatingEnergyPerTileKW) .. "kW"

local heatSink850 = table.deepcopy(heatSinkTimes2)
heatSink850.name = "heat-sink-dummy-850c"
heatSink850.heating_energy = (3.57 * heatingEnergyPerTileKW) .. "kW"

local heatSink950 = table.deepcopy(heatSinkTimes2)
heatSink950.name = "heat-sink-dummy-950c"
heatSink950.heating_energy = (5.06 * heatingEnergyPerTileKW) .. "kW"

-- Create dummy crafting category. Probably not really necessary but seems prudent, might avoid some issues, IDK.
local heatSinkCraftingCategory = {
	type = "recipe-category",
	name = "heat-sink-dummy-crafting-category"
}



data:extend{heatSinkTimes2, heatSink50, heatSink150, heatSink250, heatSink350, heatSink450, heatSink550, heatSink650, heatSink750, heatSink850, heatSink950, heatSinkCraftingCategory}
