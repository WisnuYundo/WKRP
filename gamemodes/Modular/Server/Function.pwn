/* Functions */

stock GetElapsedTime(time, &hours, &minutes, &seconds)
{
	hours = 0;
	minutes = 0;
	seconds = 0;

	if (time >= 3600)
	{
		hours = (time / 3600);
		time -= (hours * 3600);
	}
	while (time >= 60)
	{
	    minutes++;
	    time -= 60;
	}
	return (seconds = time);
}

stock ShowMessage(playerid, string[], time)//Time in Sec.
{
	new validtime = time*1000;

	PlayerTextDrawSetString(playerid, MSGTD[playerid], string);
	PlayerTextDrawShow(playerid, MSGTD[playerid]);
	SetTimerEx("HideMessage", validtime, false, "d", playerid);
	return 1;
}

FUNC::HideMessage(playerid)
{
	return PlayerTextDrawHide(playerid, MSGTD[playerid]);
}



stock RandomEx(min, max)
{
	new rand = random(max-min)+min;
	return rand;
}

stock UpdatePlayerSkin(playerid, skinid)
{
	SetPlayerSkin(playerid, skinid);
	PlayerData[playerid][pSkin] = skinid;
}

stock StreamerConfig()
{
	Streamer_MaxItems(STREAMER_TYPE_OBJECT, 990000);
	Streamer_MaxItems(STREAMER_TYPE_MAP_ICON, 2000);
	Streamer_MaxItems(STREAMER_TYPE_PICKUP, 2000);
	for(new playerid = (GetMaxPlayers() - 1); playerid != -1; playerid--)
	{
		Streamer_DestroyAllVisibleItems(playerid, 0);
	}
	Streamer_VisibleItems(STREAMER_TYPE_OBJECT, 1000);
	return 1;
}

GiveMoney(playerid, amount)
{
	PlayerData[playerid][pMoney] += amount;
	GivePlayerMoney(playerid, amount);
	return 1;
}

stock GetEnergy(playerid)
	return PlayerData[playerid][pEnergy];
	
stock GetMoney(playerid)
{
	return PlayerData[playerid][pMoney];
}

stock SetPlayerPosEx(playerid, Float:x, Float:y, Float:z)
{
	TogglePlayerControllable(playerid, false);
	SetPlayerPos(playerid, x, y, z);
	SetTimerEx("UnFreeze", 2000, false, "d", playerid);
}

FUNC::UnFreeze(playerid)
{
    TogglePlayerControllable(playerid, true);
}
stock ConvertHBEColor(value)
{
    new color;
    if(value >= 90 && value <= 100)
        color = 0x15a014FF;
    else if(value >= 80 && value < 90)
        color = 0x1b9913FF;
    else if(value >= 70 && value < 80)
        color = 0x1a7f08FF;
    else if(value >= 60 && value < 70)
        color = 0x326305FF;
    else if(value >= 50 && value < 60)
        color = 0x375d04FF;
    else if(value >= 40 && value < 50)
        color = 0x603304FF;
    else if(value >= 30 && value < 40)
        color = 0xd72800FF;
    else if(value >= 10 && value < 30)
        color = 0xfb3508FF;
    else if(value >= 0 && value < 10)
        color = 0xFF0000FF;
    else
        color = 0x15a014FF;

    return color;
}

stock ShowText(playerid, text[], time)
{
	new total = time * 1000;
	new str[256];
	format(str, sizeof(str), "%s", text);
	GameTextForPlayer(playerid, str, total, 5);
	return 1;
}

IsNumeric(const str[])
{
	for (new i = 0, l = strlen(str); i != l; i ++)
	{
	    if (i == 0 && str[0] == '-')
			continue;

	    else if (str[i] < '0' || str[i] > '9')
			return 0;
	}
	return 1;
}

new static g_arrVehicleNames[][] = {
    "Landstalker", "Bravura", "Buffalo", "Linerunner", "Perrenial", "Sentinel", "Dumper", "Firetruck", "Trashmaster",
    "Stretch", "Manana", "Infernus", "Voodoo", "Pony", "Mule", "Cheetah", "Ambulance", "Leviathan", "Moonbeam",
    "Esperanto", "Taxi", "Washington", "Bobcat", "Whoopee", "BF Injection", "Hunter", "Premier", "Enforcer",
    "Securicar", "Banshee", "Predator", "Bus", "Rhino", "Barracks", "Hotknife", "Trailer", "Previon", "Coach",
    "Cabbie", "Stallion", "Rumpo", "RC Bandit", "Romero", "Packer", "Monster", "Admiral", "Squalo", "Seasparrow",
    "Pizzaboy", "Tram", "Trailer", "Turismo", "Speeder", "Reefer", "Tropic", "Flatbed", "Yankee", "Caddy", "Solair",
    "Berkley's RC Van", "Skimmer", "PCJ-600", "Faggio", "Freeway", "RC Baron", "RC Raider", "Glendale", "Oceanic",
    "Sanchez", "Sparrow", "Patriot", "Quad", "Coastguard", "Dinghy", "Hermes", "Sabre", "Rustler", "ZR-350", "Walton",
    "Regina", "Comet", "BMX", "Burrito", "Camper", "Marquis", "Baggage", "Dozer", "Maverick", "News Chopper", "Rancher",
    "FBI Rancher", "Virgo", "Greenwood", "Jetmax", "Hotring", "Sandking", "Blista Compact", "Police Maverick",
    "Boxville", "Benson", "Mesa", "RC Goblin", "Hotring Racer A", "Hotring Racer B", "Bloodring Banger", "Rancher",
    "Super GT", "Elegant", "Journey", "Bike", "Mountain Bike", "Beagle", "Cropduster", "Stunt", "Tanker", "Roadtrain",
    "Nebula", "Majestic", "Buccaneer", "Shamal", "Hydra", "FCR-900", "NRG-500", "HPV1000", "Cement Truck", "Tow Truck",
    "Fortune", "Cadrona", "SWAT Truck", "Willard", "Forklift", "Tractor", "Combine", "Feltzer", "Remington", "Slamvan",
    "Blade", "Streak", "Freight", "Vortex", "Vincent", "Bullet", "Clover", "Sadler", "Firetruck", "Hustler", "Intruder",
    "Primo", "Cargobob", "Tampa", "Sunrise", "Merit", "Utility", "Nevada", "Yosemite", "Windsor", "Monster", "Monster",
    "Uranus", "Jester", "Sultan", "Stratum", "Elegy", "Raindance", "RC Tiger", "Flash", "Tahoma", "Savanna", "Bandito",
    "Freight Flat", "Streak Carriage", "Kart", "Mower", "Dune", "Sweeper", "Broadway", "Tornado", "AT-400", "DFT-30",
    "Huntley", "Stafford", "BF-400", "News Van", "Tug", "Trailer", "Emperor", "Wayfarer", "Euros", "Hotdog", "Club",
    "Freight Box", "Trailer", "Andromada", "Dodo", "RC Cam", "Launch", "LSPD", "SFPD", "LVPD",
    "Police Rancher", "Picador", "S.W.A.T", "Alpha", "Phoenix", "Glendale", "Sadler", "Luggage", "Luggage", "Stairs",
    "Boxville", "Tiller", "Utility Trailer"
};


GetVehicleModelByName(const name[])
{
	if(IsNumeric(name) && (strval(name) >= 400 && strval(name) <= 611))
		return strval(name);

	for (new i = 0; i < sizeof(g_arrVehicleNames); i ++)
	{
		if(strfind(g_arrVehicleNames[i], name, true) != -1)
		{
			return i + 400;
		}
	}
	return 0;
}

ReturnVehicleModelName(model)
{
	new
	    name[32] = "None";

    if (model < 400 || model > 611)
	    return name;

	format(name, sizeof(name), g_arrVehicleNames[model - 400]);
	return name;
}

stock GetVehicleSpeedKMH(vehicleid)
{
	new Float:speed_x, Float:speed_y, Float:speed_z, Float:temp_speed, round_speed;
	GetVehicleVelocity(vehicleid, speed_x, speed_y, speed_z);

	temp_speed = temp_speed = floatsqroot(((speed_x*speed_x) + (speed_y*speed_y)) + (speed_z*speed_z)) * 136.666667;

	round_speed = floatround(temp_speed);
	return round_speed;
}

stock GetFuel(vehicleid)
{
	return VehCore[vehicleid][vehFuel];
}
GetEngineStatus(vehicleid)
{
	static
	engine,
	lights,
	alarm,
	doors,
	bonnet,
	boot,
	objective;

	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);

	if(engine != 1)
		return 0;

	return 1;
}

stock CreatePlayerHUD(playerid)
{
	/* Energy */
	ENERGYTD[playerid][0] = CreatePlayerTextDraw(playerid, 571.000000, 134.000000, "_");
	PlayerTextDrawFont(playerid, ENERGYTD[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, ENERGYTD[playerid][0], 0.595833, 4.250002);
	PlayerTextDrawTextSize(playerid, ENERGYTD[playerid][0], 298.500000, 75.000000);
	PlayerTextDrawSetOutline(playerid, ENERGYTD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, ENERGYTD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, ENERGYTD[playerid][0], 2);
	PlayerTextDrawColor(playerid, ENERGYTD[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, ENERGYTD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, ENERGYTD[playerid][0], 135);
	PlayerTextDrawUseBox(playerid, ENERGYTD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, ENERGYTD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, ENERGYTD[playerid][0], 0);

	ENERGYTD[playerid][1] = CreatePlayerTextDraw(playerid, 547.000000, 136.000000, "ENERGY");
	PlayerTextDrawFont(playerid, ENERGYTD[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, ENERGYTD[playerid][1], 0.412499, 1.549999);
	PlayerTextDrawTextSize(playerid, ENERGYTD[playerid][1], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, ENERGYTD[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, ENERGYTD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, ENERGYTD[playerid][1], 1);
	PlayerTextDrawColor(playerid, ENERGYTD[playerid][1], -168436481);
	PlayerTextDrawBackgroundColor(playerid, ENERGYTD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, ENERGYTD[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, ENERGYTD[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, ENERGYTD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, ENERGYTD[playerid][1], 0);
	
	/* Speedometer */
	SPEEDOTD[playerid][0] = CreatePlayerTextDraw(playerid, 572.000000, 372.000000, "_");
	PlayerTextDrawFont(playerid, SPEEDOTD[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, SPEEDOTD[playerid][0], 0.600000, 8.300003);
	PlayerTextDrawTextSize(playerid, SPEEDOTD[playerid][0], 298.500000, 135.000000);
	PlayerTextDrawSetOutline(playerid, SPEEDOTD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, SPEEDOTD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, SPEEDOTD[playerid][0], 2);
	PlayerTextDrawColor(playerid, SPEEDOTD[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, SPEEDOTD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, SPEEDOTD[playerid][0], 135);
	PlayerTextDrawUseBox(playerid, SPEEDOTD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, SPEEDOTD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, SPEEDOTD[playerid][0], 0);

	SPEEDOTD[playerid][1] = CreatePlayerTextDraw(playerid, 519.000000, 412.000000, "FUEL:");
	PlayerTextDrawFont(playerid, SPEEDOTD[playerid][1], 2);
	PlayerTextDrawLetterSize(playerid, SPEEDOTD[playerid][1], 0.287500, 1.350000);
	PlayerTextDrawTextSize(playerid, SPEEDOTD[playerid][1], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, SPEEDOTD[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, SPEEDOTD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, SPEEDOTD[playerid][1], 1);
	PlayerTextDrawColor(playerid, SPEEDOTD[playerid][1], -1061109505);
	PlayerTextDrawBackgroundColor(playerid, SPEEDOTD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, SPEEDOTD[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, SPEEDOTD[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, SPEEDOTD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, SPEEDOTD[playerid][1], 0);

	SPEEDOTD[playerid][2] = CreatePlayerTextDraw(playerid, 519.000000, 396.000000, "HEALTH:");
	PlayerTextDrawFont(playerid, SPEEDOTD[playerid][2], 2);
	PlayerTextDrawLetterSize(playerid, SPEEDOTD[playerid][2], 0.287500, 1.350000);
	PlayerTextDrawTextSize(playerid, SPEEDOTD[playerid][2], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, SPEEDOTD[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, SPEEDOTD[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, SPEEDOTD[playerid][2], 1);
	PlayerTextDrawColor(playerid, SPEEDOTD[playerid][2], -1061109505);
	PlayerTextDrawBackgroundColor(playerid, SPEEDOTD[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, SPEEDOTD[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, SPEEDOTD[playerid][2], 0);
	PlayerTextDrawSetProportional(playerid, SPEEDOTD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, SPEEDOTD[playerid][2], 0);

	HEALTHTD[playerid] = CreatePlayerTextDraw(playerid, 572.000000, 396.000000, "--");
	PlayerTextDrawFont(playerid, HEALTHTD[playerid], 2);
	PlayerTextDrawLetterSize(playerid, HEALTHTD[playerid], 0.287500, 1.350000);
	PlayerTextDrawTextSize(playerid, HEALTHTD[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, HEALTHTD[playerid], 0);
	PlayerTextDrawSetShadow(playerid, HEALTHTD[playerid], 0);
	PlayerTextDrawAlignment(playerid, HEALTHTD[playerid], 1);
	PlayerTextDrawColor(playerid, HEALTHTD[playerid], -1061109505);
	PlayerTextDrawBackgroundColor(playerid, HEALTHTD[playerid], 255);
	PlayerTextDrawBoxColor(playerid, HEALTHTD[playerid], 50);
	PlayerTextDrawUseBox(playerid, HEALTHTD[playerid], 0);
	PlayerTextDrawSetProportional(playerid, HEALTHTD[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, HEALTHTD[playerid], 0);

	SPEEDOTD[playerid][3] = CreatePlayerTextDraw(playerid, 519.000000, 380.000000, "SPEED:");
	PlayerTextDrawFont(playerid, SPEEDOTD[playerid][3], 2);
	PlayerTextDrawLetterSize(playerid, SPEEDOTD[playerid][3], 0.287500, 1.350000);
	PlayerTextDrawTextSize(playerid, SPEEDOTD[playerid][3], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, SPEEDOTD[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, SPEEDOTD[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, SPEEDOTD[playerid][3], 1);
	PlayerTextDrawColor(playerid, SPEEDOTD[playerid][3], -1061109505);
	PlayerTextDrawBackgroundColor(playerid, SPEEDOTD[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, SPEEDOTD[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, SPEEDOTD[playerid][3], 0);
	PlayerTextDrawSetProportional(playerid, SPEEDOTD[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, SPEEDOTD[playerid][3], 0);

	KMHTD[playerid] = CreatePlayerTextDraw(playerid, 572.000000, 379.000000, "--");
	PlayerTextDrawFont(playerid, KMHTD[playerid], 2);
	PlayerTextDrawLetterSize(playerid, KMHTD[playerid], 0.287500, 1.350000);
	PlayerTextDrawTextSize(playerid, KMHTD[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, KMHTD[playerid], 0);
	PlayerTextDrawSetShadow(playerid, KMHTD[playerid], 0);
	PlayerTextDrawAlignment(playerid, KMHTD[playerid], 1);
	PlayerTextDrawColor(playerid, KMHTD[playerid], -1061109505);
	PlayerTextDrawBackgroundColor(playerid, KMHTD[playerid], 255);
	PlayerTextDrawBoxColor(playerid, KMHTD[playerid], 50);
	PlayerTextDrawUseBox(playerid, KMHTD[playerid], 0);
	PlayerTextDrawSetProportional(playerid, KMHTD[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, KMHTD[playerid], 0);

	VEHNAMETD[playerid] = CreatePlayerTextDraw(playerid, 519.000000, 362.000000, "--");
	PlayerTextDrawFont(playerid, VEHNAMETD[playerid], 0);
	PlayerTextDrawLetterSize(playerid, VEHNAMETD[playerid], 0.408333, 1.500000);
	PlayerTextDrawTextSize(playerid, VEHNAMETD[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, VEHNAMETD[playerid], 1);
	PlayerTextDrawSetShadow(playerid, VEHNAMETD[playerid], 0);
	PlayerTextDrawAlignment(playerid, VEHNAMETD[playerid], 1);
	PlayerTextDrawColor(playerid, VEHNAMETD[playerid], -1061109505);
	PlayerTextDrawBackgroundColor(playerid, VEHNAMETD[playerid], 255);
	PlayerTextDrawBoxColor(playerid, VEHNAMETD[playerid], 50);
	PlayerTextDrawUseBox(playerid, VEHNAMETD[playerid], 0);
	PlayerTextDrawSetProportional(playerid, VEHNAMETD[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, VEHNAMETD[playerid], 0);
}

stock CreateGlobalTextDraw()
{

}
FormatNumber(number, prefix[] = "$")
{
	static
		value[32],
		length;

	format(value, sizeof(value), "%d", (number < 0) ? (-number) : (number));

	if ((length = strlen(value)) > 3)
	{
		for (new i = length, l = 0; --i >= 0; l ++) {
		    if ((l > 0) && (l % 3 == 0)) strins(value, ",", i + 1);
		}
	}
	if (prefix[0] != 0)
	    strins(value, prefix, 0);

	if (number < 0)
		strins(value, "-", 0);

	return value;
}

stock KickEx(playerid)
{
	SaveData(playerid);
	SetTimerEx("KickTimer", 1000, false, "d", playerid);
}

FUNC::KickTimer(playerid)
{
	Kick(playerid);
}


ReturnName(playerid)
{
    static
        name[MAX_PLAYER_NAME + 1];

    GetPlayerName(playerid, name, sizeof(name));
    if(PlayerData[playerid][pMaskOn])
    {
        format(name, sizeof(name), "Mask_#%d", PlayerData[playerid][pMaskID]);
	}
	else
	{
	    for (new i = 0, len = strlen(name); i < len; i ++)
		{
	        if (name[i] == '_') name[i] = ' ';
		}
	}
    return name;
}

stock GetName(playerid)
{
	new name[MAX_PLAYER_NAME];
 	GetPlayerName(playerid,name,sizeof(name));
	return name;
}

Database_Connect()
{
	sqlcon = mysql_connect(DATABASE_ADDRESS,DATABASE_USERNAME,DATABASE_PASSWORD,DATABASE_NAME);

	if(mysql_errno(sqlcon) != 0)
	{
	    print("[MySQL] - Connection Failed!");
	    SetGameModeText("Xyronite | Connection Failed!");
	}
	else
	{
		print("[MySQL] - Connection Estabilished!");
		SetGameModeText("Xyronite | UCP System");
	}
}

stock IsRoleplayName(player[])
{
    forex(n,strlen(player))
    {
        if (player[n] == '_' && player[n+1] >= 'A' && player[n+1] <= 'Z') return 1;
        if (player[n] == ']' || player[n] == '[') return 0;
	}
    return 0;
}

stock IsPlayerNearPlayer(playerid, targetid, Float:radius)
{
	static
		Float:fX,
		Float:fY,
		Float:fZ;

	GetPlayerPos(targetid, fX, fY, fZ);

	return (GetPlayerInterior(playerid) == GetPlayerInterior(targetid) && GetPlayerVirtualWorld(playerid) == GetPlayerVirtualWorld(targetid)) && IsPlayerInRangeOfPoint(playerid, radius, fX, fY, fZ);
}

stock SendNearbyMessage(playerid, Float:radius, color, const str[], {Float,_}:...)
{
	static
	    args,
	    start,
	    end,
	    string[144]
	;
	#emit LOAD.S.pri 8
	#emit STOR.pri args

	if (args > 16)
	{
		#emit ADDR.pri str
		#emit STOR.pri start

	    for (end = start + (args - 16); end > start; end -= 4)
		{
	        #emit LREF.pri end
	        #emit PUSH.pri
		}
		#emit PUSH.S str
		#emit PUSH.C 144
		#emit PUSH.C string

		#emit LOAD.S.pri 8
		#emit CONST.alt 4
		#emit SUB
		#emit PUSH.pri

		#emit SYSREQ.C format
		#emit LCTRL 5
		#emit SCTRL 4

        foreach (new i : Player)
		{
			if (IsPlayerNearPlayer(i, playerid, radius) && PlayerData[i][pSpawned])
			{
  				SendClientMessage(i, color, string);
			}
		}
		return 1;
	}
	foreach (new i : Player)
	{
		if (IsPlayerNearPlayer(i, playerid, radius) && PlayerData[i][pSpawned])
		{
			SendClientMessage(i, color, str);
		}
	}
	return 1;
}

stock SendClientMessageEx(playerid, colour, const text[], va_args<>)
{
    new str[145];
    va_format(str, sizeof(str), text, va_start<3>);
    return SendClientMessage(playerid, colour, str);
}

stock CheckAccount(playerid)
{
	new query[256];
	new str[256];
	if(strfind(GetName(playerid), "_") == -1)
	{
		format(query, sizeof(query), "SELECT * FROM `PlayerUCP` WHERE `UCP` = '%s' LIMIT 1;", GetName(playerid));
		mysql_tquery(sqlcon, query, "CheckPlayerUCP", "d", playerid);
	}
	else
	{
		format(str, sizeof(str), "{FFFFFF}UCP Account: {00FFFF}%s\n{FFFFFF}Belum terdaftar\nSilahkan login ulang menggunakan non rp name untuk register", GetName(playerid));
		ShowPlayerDialog(playerid, DIALOG_NONE, DIALOG_STYLE_MSGBOX, "UCP", str, "", "Exit");
		KickEx(playerid);
	}
	return 1;
}

FUNC::PlayerCheck(playerid, rcc)
{
	if(rcc != g_RaceCheck{playerid})
	    return Kick(playerid);
	    
	CheckAccount(playerid);
	return true;
}

FUNC::CheckPlayerData(playerid)
{
	new rows = cache_num_rows();
	new str[256];
	if(rows)
	{
		new query[256];
		format(query, sizeof(query), "SELECT * FROM `characters` WHERE `UCP` = '%s' LIMIT 1;", PlayerData[playerid][pUCP]);
		SetPlayerName(playerid, PlayerData[playerid][pUCP]);
		mysql_tquery(sqlcon, query, "CheckPlayerUCP", "d", playerid);
	}
	else
	{
		format(str, sizeof(str), "{FFFFFF}UCP Account: {00FFFF}%s\n{FFFFFF}Belum terdaftar\nSilahkan login ulang menggunakan non rp name untuk register", GetName(playerid));
		ShowPlayerDialog(playerid, DIALOG_NONE, DIALOG_STYLE_MSGBOX, "UCP", str, "", "Exit");
		KickEx(playerid);
	}
	return 1;
}

FUNC::CheckPlayerUCP(playerid)
{
	new rows = cache_num_rows();
	new str[256];
	if (rows)
	{
	    cache_get_value_name(0, "UCP", tempUCP[playerid]);
	    format(str, sizeof(str), "{FFFFFF}UCP Account: {00FFFF}%s\n{FFFFFF}Attempts: {00FFFF}%d/5\n{FFFFFF}Password: {FF00FF}(Input Below)", GetName(playerid), PlayerData[playerid][pAttempt]);
		ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Login to Xyronite", str, "Login", "Exit");
	}
	else
	{
	    format(str, sizeof(str), "{FFFFFF}UCP Account: {00FFFF}%s\n{FFFFFF}Attempts: {00FFFF}%d/5\n{FFFFFF}Create Password: {FF00FF}(Input Below)", GetName(playerid), PlayerData[playerid][pAttempt]);
		ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, "Register to Xyronite", str, "Register", "Exit");
	}
	return 1;
}

stock SetupPlayerData(playerid)
{
    SetSpawnInfo(playerid, 0, PlayerData[playerid][pSkin], 1642.1681, -2333.3689, 13.5469, 0.0, 0, 0, 0, 0, 0, 0);
    SpawnPlayer(playerid);
    GiveMoney(playerid, 150);
    return 1;
}

stock SaveData(playerid)
{
	new query[2512];
	if(PlayerData[playerid][pSpawned])
	{
		GetPlayerHealth(playerid, PlayerData[playerid][pHealth]);
		GetPlayerPos(playerid, PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2]);

		mysql_format(sqlcon, query, sizeof(query), "UPDATE `characters` SET ");
		mysql_format(sqlcon, query, sizeof(query), "%s`PosX`='%f', ", query, PlayerData[playerid][pPos][0]);
        mysql_format(sqlcon, query, sizeof(query), "%s`PosY`='%f', ", query, PlayerData[playerid][pPos][1]);
        mysql_format(sqlcon, query, sizeof(query), "%s`PosZ`='%f', ", query, PlayerData[playerid][pPos][2]);
	    mysql_format(sqlcon, query, sizeof(query), "%s`Health`='%f', ", query, PlayerData[playerid][pHealth]);
	    mysql_format(sqlcon, query, sizeof(query), "%s`World`='%d', ", query, GetPlayerVirtualWorld(playerid));
	    mysql_format(sqlcon, query, sizeof(query), "%s`Interior`='%d', ", query, GetPlayerInterior(playerid));
	    mysql_format(sqlcon, query, sizeof(query), "%s`Age`='%d', ", query, PlayerData[playerid][pAge]);
	    mysql_format(sqlcon, query, sizeof(query), "%s`Origin`='%s', ", query, PlayerData[playerid][pOrigin]);
	    mysql_format(sqlcon, query, sizeof(query), "%s`Gender`='%d', ", query, PlayerData[playerid][pGender]);
	    mysql_format(sqlcon, query, sizeof(query), "%s`Skin`='%d', ", query, PlayerData[playerid][pSkin]);
	    mysql_format(sqlcon, query, sizeof(query), "%s`Energy`='%d', ", query, PlayerData[playerid][pEnergy]);
	    mysql_format(sqlcon, query, sizeof(query), "%s`AdminLevel`='%d', ", query, PlayerData[playerid][pAdmin]);
	    mysql_format(sqlcon, query, sizeof(query), "%s`InBiz`='%d', ", query, PlayerData[playerid][pInBiz]);
	    mysql_format(sqlcon, query, sizeof(query), "%s`Money`='%d', ", query, PlayerData[playerid][pMoney]);
	    mysql_format(sqlcon, query, sizeof(query), "%s`UCP`='%s' ", query, PlayerData[playerid][pUCP]);
	    mysql_format(sqlcon, query, sizeof(query), "%sWHERE `pID` = %d", query, PlayerData[playerid][pID]);
		mysql_query(sqlcon, query, true);
	}
	return 1;
}

FUNC::LoadCharacterData(playerid)
{
	cache_get_value_name_int(0, "pID", PlayerData[playerid][pID]);
	cache_get_value_name(0, "Name", PlayerData[playerid][pName]);
	cache_get_value_name_float(0, "PosX", PlayerData[playerid][pPos][0]);
	cache_get_value_name_float(0, "PosY", PlayerData[playerid][pPos][1]);
	cache_get_value_name_float(0, "PosZ", PlayerData[playerid][pPos][2]);
	cache_get_value_name_float(0, "Health", PlayerData[playerid][pHealth]);
	cache_get_value_name_int(0, "Interior", PlayerData[playerid][pInterior]);
	cache_get_value_name_int(0, "World", PlayerData[playerid][pWorld]);
	cache_get_value_name_int(0, "Age", PlayerData[playerid][pAge]);
	cache_get_value_name(0, "Origin", PlayerData[playerid][pOrigin]);
	cache_get_value_name_int(0, "Gender", PlayerData[playerid][pGender]);
	cache_get_value_name_int(0, "Skin", PlayerData[playerid][pSkin]);
	cache_get_value_name(0, "UCP", PlayerData[playerid][pUCP]);
	cache_get_value_name_int(0, "Energy", PlayerData[playerid][pEnergy]);
	cache_get_value_name_int(0, "AdminLevel", PlayerData[playerid][pAdmin]);
	cache_get_value_name_int(0, "InBiz", PlayerData[playerid][pInBiz]);
	cache_get_value_name_int(0, "Money", PlayerData[playerid][pMoney]);
	
	new invQuery[256];
    format(invQuery, sizeof(invQuery), "SELECT * FROM `inventory` WHERE `ID` = '%d'", PlayerData[playerid][pID]);
	mysql_tquery(sqlcon, invQuery, "LoadPlayerItems", "d", playerid);
	
    SetSpawnInfo(playerid, 0, PlayerData[playerid][pSkin], PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2], 0.0, 0, 0, 0, 0, 0, 0);
    SpawnPlayer(playerid);
    SendServerMessage(playerid, "Successfully loaded your characters database!");
    LoadPlayerVehicle(playerid);
    return 1;
}

FUNC::HashPlayerPassword(playerid, hashid)
{
	new
		query[256],
		hash[BCRYPT_HASH_LENGTH];

    bcrypt_get_hash(hash, sizeof(hash));

	GetPlayerName(playerid, tempUCP[playerid], MAX_PLAYER_NAME + 1);

	format(query,sizeof(query),"INSERT INTO `PlayerUCP` (`UCP`, `Password`) VALUES ('%s', '%s')", tempUCP[playerid], hash);
	mysql_tquery(sqlcon, query);

    SendServerMessage(playerid, "Your UCP is successfully registered!");
    CheckAccount(playerid);
	return 1;
}

ShowCharacterList(playerid)
{
	new name[256], count, sgstr[128];

	for (new i; i < MAX_CHARS; i ++) if(PlayerChar[playerid][i][0] != EOS)
	{
	    format(sgstr, sizeof(sgstr), "%s\n", PlayerChar[playerid][i]);
		strcat(name, sgstr);
		count++;
	}
	if(count < MAX_CHARS)
		strcat(name, "< Create Character >");

	ShowPlayerDialog(playerid, DIALOG_CHARLIST, DIALOG_STYLE_LIST, "Character List", name, "Select", "Quit");
	return 1;
}

FUNC::LoadCharacter(playerid)
{
	for (new i = 0; i < MAX_CHARS; i ++)
	{
		PlayerChar[playerid][i][0] = EOS;
	}
	for (new i = 0; i < cache_num_rows(); i ++)
	{
		cache_get_value_name(i, "Name", PlayerChar[playerid][i]);
	}
  	ShowCharacterList(playerid);
  	return 1;
}

FUNC::OnPlayerPasswordChecked(playerid, bool:success)
{
	new str[256];
    format(str, sizeof(str), "{FFFFFF}UCP Account: {00FFFF}%s\n{FFFFFF}Attempts: {00FFFF}%d/5\n{FFFFFF}Password: {FF00FF}(Input Below)", GetName(playerid), PlayerData[playerid][pAttempt]);
    
	if(!success)
	{
	    if(PlayerData[playerid][pAttempt] < 5)
	    {
		    PlayerData[playerid][pAttempt]++;
	        ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Login to Xyronite", str, "Login", "Exit");
			return 1;
		}
		else
		{
		    SendServerMessage(playerid, "Kamu telah salah memasukan password sebanyak {FFFF00}5 kali!");
		    KickEx(playerid);
			return 1;
		}
	}
	new query[256];
	format(query, sizeof(query), "SELECT `Name` FROM `characters` WHERE `UCP` = '%s' LIMIT %d;", GetName(playerid), MAX_CHARS);
	mysql_tquery(sqlcon, query, "LoadCharacter", "d", playerid);
	return 1;
}


FUNC::InsertPlayerName(playerid, name[])
{
	new count = cache_num_rows(), query[145], Cache:execute;
	if(count > 0)
	{
        ShowPlayerDialog(playerid, DIALOG_MAKECHAR, DIALOG_STYLE_INPUT, "Create Character", "ERROR: This name is already used by the other player!\nInsert your new Character Name\n\nExample: Finn_Xanderz, Javier_Cooper etc.", "Create", "Back");
	}
	else
	{
		mysql_format(sqlcon,query,sizeof(query),"INSERT INTO `characters` (`Name`,`UCP`) VALUES('%e','%e')",name,GetName(playerid));
		execute = mysql_query(sqlcon, query);
		PlayerData[playerid][pID] = cache_insert_id();
	 	cache_delete(execute);
	 	SetPlayerName(playerid, name);
		format(PlayerData[playerid][pName], MAX_PLAYER_NAME, name);
	 	ShowPlayerDialog(playerid, DIALOG_AGE, DIALOG_STYLE_INPUT, "Character Age", "Please Insert your Character Age", "Continue", "Cancel");
	}
	return 1;
}

stock IsEngineVehicle(vehicleid)
{
	static const g_aEngineStatus[] = {
	    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1,
	    1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	    1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	    1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	    1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1,
	    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	    1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	    1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1,
	    1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0
	};
    new modelid = GetVehicleModel(vehicleid);

    if (modelid < 400 || modelid > 611)
        return 0;

    return (g_aEngineStatus[modelid - 400]);
}

stock IsSpeedoVehicle(vehicleid)
{
	if (GetVehicleModel(vehicleid) == 509 || GetVehicleModel(vehicleid) == 510 || GetVehicleModel(vehicleid) == 481 || !IsEngineVehicle(vehicleid)) {
	    return 0;
	}
	return 1;
}

FUNC::EngineStatus(playerid, vehicleid)
{
	if(!GetEngineStatus(vehicleid))
	{
		new Float: f_vHealth;
		GetVehicleHealth(vehicleid, f_vHealth);
		if(f_vHealth < 350.0)
			return SendErrorMessage(playerid, "This vehicle is damaged!");

		if(VehCore[vehicleid][vehFuel] <= 0)
			return SendErrorMessage(playerid, "There is no fuel on this vehicle!");

		SwitchVehicleEngine(vehicleid, true);
		ShowText(playerid, "Engine turned ~g~ON", 3);
	}
	else
	{
		SwitchVehicleEngine(vehicleid, false);
		ShowText(playerid, "Engine turned ~r~OFF", 3);
		SwitchVehicleLight(vehicleid, false);
	}
	return 1;
}

stock ResetVariable(playerid)
{
	for (new i = 0; i != MAX_INVENTORY; i ++)
	{
	    InventoryData[playerid][i][invExists] = false;
	    InventoryData[playerid][i][invModel] = 0;
	    InventoryData[playerid][i][invQuantity] = 0;
	}
	PlayerData[playerid][pEnergy] = 100;
	PlayerData[playerid][pMoney] = 0;
	PlayerData[playerid][pInBiz] = -1;
	PlayerData[playerid][pListitem] = -1;
	PlayerData[playerid][pAttempt] = 0;
	PlayerData[playerid][pCalling] = INVALID_PLAYER_ID;
	PlayerData[playerid][pSpawned] = false;
	return 1;
}

ProxDetector(Float: f_Radius, playerid, string[],col1,col2,col3,col4,col5)
{
		new
			Float: f_playerPos[3];

		GetPlayerPos(playerid, f_playerPos[0], f_playerPos[1], f_playerPos[2]);
		foreach(new i : Player)
		{
			if(GetPlayerVirtualWorld(i) == GetPlayerVirtualWorld(playerid) && GetPlayerInterior(i) == GetPlayerInterior(playerid))
			{
				if(IsPlayerInRangeOfPoint(i, f_Radius / 16, f_playerPos[0], f_playerPos[1], f_playerPos[2])) {
					SendClientMessage(i, col1, string);
				}
				else if(IsPlayerInRangeOfPoint(i, f_Radius / 8, f_playerPos[0], f_playerPos[1], f_playerPos[2])) {
					SendClientMessage(i, col2, string);
				}
				else if(IsPlayerInRangeOfPoint(i, f_Radius / 4, f_playerPos[0], f_playerPos[1], f_playerPos[2])) {
					SendClientMessage(i, col3, string);
				}
				else if(IsPlayerInRangeOfPoint(i, f_Radius / 2, f_playerPos[0], f_playerPos[1], f_playerPos[2])) {
					SendClientMessage(i, col4, string);
				}
				else if(IsPlayerInRangeOfPoint(i, f_Radius, f_playerPos[0], f_playerPos[1], f_playerPos[2])) {
					SendClientMessage(i, col5, string);
				}
			}
			else SendClientMessage(i, col1, string);
		}
		return 1;
}