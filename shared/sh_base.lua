Config = {}

Config.Debug = false

Config.notification = "custom" -- "ox_lib" | "standalone" | "custom"

Config.DefaultTankSize = 65.0

Config.RandomFuel = {
	enabled = true,
	min = 20, -- %
	max = 90 -- %
}

Config.FuelMultiplier = 15.0

Config.BlacklistedClasses = {
	[13] = true, -- Cycles
	[14] = true, -- Boats
	[15] = true, -- Helicopters
	[16] = true, -- Planes
	[21] = true -- Trains
}

Config.BlacklistedVehicles = {
	[`minitank`] = true,
	[`rcbandito`] = true,
	[`envisage`] = true,
}

Config.ElectricVehicles = {
	[`neon`] = true,
	[`raiden`] = true,
	[`cyclone`] = true,
	[`tezeract`] = true,
	[`voltic`] = true,
	[`iwagen`] = true,
	[`vivanite`] = true,
	[`vivanite2`] = true,
	[`buffalo5`] = true,
	[`surge`] = true,
	[`virtue`] = true,
	[`caddy3`] = true,
	[`khamelion`] = true,
	[`powersurge`] = true,
	[`omnisegt`] = true,
	[`voltic2`] = true,
	[`imorgon`] = true,
	[`caddy`] = true,
	[`caddy2`] = true,
	[`coureur`] = true,
	[`airtug`] = true,
	[`cyclone2`] = true,
}

Config.FuelStations = {
	"prop_gas_pump_1a",
	"prop_gas_pump_1b",
	"prop_gas_pump_1c",
	"prop_gas_pump_1d",
	"prop_gas_pump_old2",
	"prop_gas_pump_old3",
	"prop_vintage_pump",
	"amb_rox_caspump_pf",
	"lssdgaspump",
}

Config.EVStations = {
	"amb_globe_evcharger",
}

Config.StationDistance = 5.0

Config.Blips = {
	{ id = 361, x = 49.4187,    y = 2778.793,   z = 58.043,  Name = "Fuel Station", Color = 6,  Scale = 0.6 },
	{ id = 361, x = 263.894,    y = 2606.463,   z = 44.983,  Name = "Fuel Station", Color = 6,  Scale = 0.6 },
	{ id = 361, x = 1039.958,   y = 2671.134,   z = 39.550,  Name = "Fuel Station", Color = 6,  Scale = 0.6 },
	{ id = 361, x = 1207.260,   y = 2660.175,   z = 37.899,  Name = "Fuel Station", Color = 6,  Scale = 0.6 },
	{ id = 361, x = 2539.685,   y = 2594.192,   z = 37.944,  Name = "Fuel Station", Color = 6,  Scale = 0.6 },
	{ id = 361, x = 2679.858,   y = 3263.946,   z = 55.240,  Name = "Fuel Station", Color = 6,  Scale = 0.6 },
	{ id = 361, x = 2005.055,   y = 3773.887,   z = 32.403,  Name = "Fuel Station", Color = 6,  Scale = 0.6 },
	{ id = 361, x = 1687.156,   y = 4929.392,   z = 42.078,  Name = "Fuel Station", Color = 6,  Scale = 0.6 },
	{ id = 361, x = 1701.314,   y = 6416.028,   z = 32.763,  Name = "Fuel Station", Color = 6,  Scale = 0.6 },
	{ id = 361, x = 179.857,    y = -1562.848,  z = 28.263,  Name = "Fuel Station", Color = 6,  Scale = 0.6 },
	{ id = 361, x = -1437.622,  y = -276.747,   z = 46.207,  Name = "Fuel Station", Color = 6,  Scale = 0.6 },
	{ id = 361, x = -2096.243,  y = -320.286,   z = 13.168,  Name = "Fuel Station", Color = 6,  Scale = 0.6 },
	{ id = 361, x = -724.619,   y = -935.163,   z = 19.213,  Name = "Fuel Station", Color = 6,  Scale = 0.6 },
	{ id = 361, x = -526.019,   y = -1211.003,  z = 18.184,  Name = "Fuel Station", Color = 6,  Scale = 0.6 },
	{ id = 361, x = -70.2148,   y = -1761.792,  z = 29.534,  Name = "Fuel Station", Color = 6,  Scale = 0.6 },
	{ id = 361, x = 265.648,    y = -1261.309,  z = 29.292,  Name = "Fuel Station", Color = 6,  Scale = 0.6 },
	{ id = 361, x = 819.653,    y = -1028.846,  z = 26.403,  Name = "Fuel Station", Color = 6,  Scale = 0.6 },
	{ id = 361, x = 1208.951,   y = -1402.567,  z = 35.224,  Name = "Fuel Station", Color = 6,  Scale = 0.6 },
	{ id = 361, x = 1181.381,   y = -330.847,   z = 69.316,  Name = "Fuel Station", Color = 6,  Scale = 0.6 },
	{ id = 361, x = 620.843,    y = 269.100,    z = 103.089, Name = "Fuel Station", Color = 6,  Scale = 0.6 },
	{ id = 361, x = 2581.321,   y = 362.039,    z = 108.468, Name = "Fuel Station", Color = 6,  Scale = 0.6 },
	{ id = 361, x = 1764.151,   y = 3330.307,   z = 41.171,  Name = "Fuel Station", Color = 6,  Scale = 0.6 },
	{ id = 361, x = 49.4187,    y = 2778.793,   z = 58.043,  Name = "Fuel Station", Color = 6,  Scale = 0.6 },
	{ id = 361, x = -2555.1663, y = 2330.4639,  z = 33.06,   Name = "Fuel Station", Color = 6,  Scale = 0.6 },
	{ id = 361, x = -94.4195,   y = 6419.8467,  z = 31.4895, Name = "Fuel Station", Color = 6,  Scale = 0.6 },
	{ id = 361, x = 179.7899,   y = 6602.9053,  z = 31.8681, Name = "Fuel Station", Color = 6,  Scale = 0.6 },
	{ id = 361, x = -496.105,   y = 7567.3672,  z = 12.1735, Name = "Fuel Station", Color = 6,  Scale = 0.6 },
	{ id = 361, x = -1228.8564, y = 6915.104,   z = 20.4651, Name = "Fuel Station", Color = 6,  Scale = 0.6 },
	{ id = 361, x = -2745.4724, y = 7035.0527,  z = 28.6438, Name = "Fuel Station", Color = 6,  Scale = 0.6 },
	{ id = 361, x = -319.2972,  y = -1471.4839, z = 30.5427, Name = "Fuel Station", Color = 6,  Scale = 0.6 },
	{ id = 354, x = -321.06,    y = -1498.41,   z = 29.59,   Name = "EV Station",   Color = 38, Scale = 0.9 },
	{ id = 354, x = -300.73,    y = -1480.96,   z = 29.48,   Name = "EV Station",   Color = 38, Scale = 0.9 },
	{ id = 354, x = -299.44,    y = -1467.56,   z = 29.88,   Name = "EV Station",   Color = 38, Scale = 0.9 },
	{ id = 354, x = 599.84,     y = 263.90,     z = 102.56,  Name = "EV Station",   Color = 38, Scale = 0.9 },
	{ id = 354, x = 599.96,     y = 270.71,     z = 102.51,  Name = "EV Station",   Color = 38, Scale = 0.9 },
	{ id = 354, x = 640.91,     y = 289.36,     z = 102.40,  Name = "EV Station",   Color = 38, Scale = 0.9 },
	{ id = 354, x = 1217.55,    y = 2658.66,    z = 6.76,    Name = "EV Station",   Color = 38, Scale = 0.9 },
	{ id = 354, x = 1709.68,    y = 6424.49,    z = 31.76,   Name = "EV Station",   Color = 38, Scale = 0.9 },
}
