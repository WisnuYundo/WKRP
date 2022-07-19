//==[ Variable ]==

enum vCore
{
	vehFuel,
};
new VehCore[MAX_VEHICLES][vCore];

enum vData
{
	vID,
	vOwner,
	vColor[2],
	vModel,
	vLocked,
	vInsurance,
	vInsuTime,
	vPlate[16],
	Float:vHealth,
	Float:vPos[4],
	vWorld,
	vInterior,
	vFuel,
	vVehicle,
	vDamage[4],
	bool:vExists,
	vRental,
	vRentTime,
};
new VehicleData[MAX_PLAYER_VEHICLE][vData];

//==[ Function ]==


stock Vehicle_GetID(vehicleid)
{
	forex(i, MAX_PLAYER_VEHICLE) if (VehicleData[i][vExists] && VehicleData[i][vVehicle] == vehicleid)
	{
	    return i;
	}
	return -1;
}

stock Vehicle_Count(playerid)
{
	new count = 0;
	forex(i, MAX_PLAYER_VEHICLE) if(VehicleData[i][vExists] && VehicleData[i][vOwner] == PlayerData[playerid][pID])
	{
	    count++;
	}
	return count;
}

stock VehicleRental_Count(playerid)
{
	new count = 0;
	forex(i, MAX_PLAYER_VEHICLE) if(VehicleData[i][vExists] && VehicleData[i][vRental] != -1 && VehicleData[i][vOwner] == PlayerData[playerid][pID])
	{
	    count++;
	}
	return count;
}

stock Vehicle_Inside(playerid)
{
	new carid;

	if (IsPlayerInAnyVehicle(playerid) && (carid = Vehicle_GetID(GetPlayerVehicleID(playerid))) != -1)
	    return carid;

	return -1;
}

FUNC::OnPlayerVehicleCreated(carid)
{
	if (carid == -1 || !VehicleData[carid][vExists])
	    return 0;

	VehicleData[carid][vID] = cache_insert_id();
	VehicleData[carid][vExists] = true;
	SaveVehicle(carid);
	return 1;
}

FUNC::Vehicle_GetStatus(carid)
{
	if(VehicleData[carid][vVehicle] != INVALID_VEHICLE_ID)
	{
		GetVehicleDamageStatus(VehicleData[carid][vVehicle], VehicleData[carid][vDamage][0], VehicleData[carid][vDamage][1], VehicleData[carid][vDamage][2], VehicleData[carid][vDamage][3]);

		GetVehicleHealth(VehicleData[carid][vVehicle], VehicleData[carid][vHealth]);
		VehicleData[carid][vFuel] = VehCore[VehicleData[carid][vVehicle]][vehFuel];
		VehicleData[carid][vWorld] = GetVehicleVirtualWorld(VehicleData[carid][vVehicle]);

		GetVehiclePos(VehicleData[carid][vVehicle], VehicleData[carid][vPos][0], VehicleData[carid][vPos][1], VehicleData[carid][vPos][2]);
		GetVehicleZAngle(VehicleData[carid][vVehicle],VehicleData[carid][vPos][3]);

	}
	return 1;
}

stock Vehicle_IsOwner(playerid, carid)
{
	if(PlayerData[playerid][pID] == -1)
		return 0;

	if(VehicleData[carid][vExists] && VehicleData[carid][vOwner] == PlayerData[playerid][pID])
		return 1;

	return 0;
}

stock Vehicle_HaveAccess(playerid, carid)
{
	if(PlayerData[playerid][pID] == -1)
		return 0;

	if(VehicleData[carid][vExists] && VehicleData[carid][vOwner] == PlayerData[playerid][pID] || PlayerData[playerid][pVehKey] == VehicleData[carid][vID])
		return 1;

	return 0;
}
FUNC::UnloadPlayerVehicle(playerid)
{
 	forex(i,MAX_PLAYER_VEHICLE) if(VehicleData[i][vExists])
	{
		if(VehicleData[i][vOwner] == PlayerData[playerid][pID])
		{
		    Vehicle_GetStatus(i);
		    
			new cQuery[2512];
			mysql_format(sqlcon, cQuery, sizeof(cQuery), "UPDATE `vehicle` SET ");
			mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehX`='%f', ", cQuery, VehicleData[i][vPos][0]);
			mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehY`='%f', ", cQuery, VehicleData[i][vPos][1]);
			mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehZ`='%f', ", cQuery, VehicleData[i][vPos][2]+0.1);
			mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehA`='%f', ", cQuery, VehicleData[i][vPos][3]);
			mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehOwner`='%d', ", cQuery, VehicleData[i][vOwner]);
			mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehModel`='%d', ", cQuery, VehicleData[i][vModel]);
            mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehColor1`='%d', ", cQuery, VehicleData[i][vColor][0]);
            mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehColor2`='%d', ", cQuery, VehicleData[i][vColor][1]);
            mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehHealth`='%f', ", cQuery, VehicleData[i][vHealth]);
            mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehDamage1`='%d', ", cQuery, VehicleData[i][vDamage][0]);
            mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehDamage2`='%d', ", cQuery, VehicleData[i][vDamage][1]);
            mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehDamage3`='%d', ", cQuery, VehicleData[i][vDamage][2]);
            mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehDamage4`='%d', ", cQuery, VehicleData[i][vDamage][3]);
            mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehInterior`='%d', ", cQuery, VehicleData[i][vInterior]);
            mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehWorld`='%d', ", cQuery, VehicleData[i][vWorld]);
            mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehFuel`='%d', ", cQuery, VehicleData[i][vFuel]);
            mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehPlate`='%s', ", cQuery, VehicleData[i][vPlate]);
		    mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehRental`='%d', ", cQuery, VehicleData[i][vRental]);
		    mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehRentalTime`='%d', ", cQuery, VehicleData[i][vRentTime]);
            mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehLocked`='%d', ", cQuery, VehicleData[i][vLocked]);
            mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehInsurance`='%d', ", cQuery, VehicleData[i][vInsurance]);
            mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehInsuTime`='%d' ", cQuery, VehicleData[i][vInsuTime]);
			mysql_format(sqlcon, cQuery, sizeof(cQuery), "%sWHERE `vehID` = %d", cQuery, VehicleData[i][vID]);
			mysql_query(sqlcon, cQuery, true);


			if(VehicleData[i][vVehicle] != INVALID_VEHICLE_ID)
			{
				DestroyVehicle(VehicleData[i][vVehicle]);
			}
			VehicleData[i][vExists] = false;
			
		}
	}
	return 1;
}

stock VehicleRental_Create(ownerid, modelid, Float:x, Float:y, Float:z, Float:angle, time, rentid)
{
    forex(i, MAX_PLAYER_VEHICLE)
	{
		if (!VehicleData[i][vExists])
   		{
   		    VehicleData[i][vExists] = true;

            VehicleData[i][vModel] = modelid;
            VehicleData[i][vOwner] = ownerid;

			format(VehicleData[i][vPlate], 16, "RENTAL");

            VehicleData[i][vPos][0] = x;
            VehicleData[i][vPos][1] = y;
            VehicleData[i][vPos][2] = z;
            VehicleData[i][vPos][3] = angle;

			VehicleData[i][vInsurance] = 0;
			VehicleData[i][vInsuTime] = 0;

            VehicleData[i][vColor][0] = random(126);

            VehicleData[i][vColor][1] = random(126);

            VehicleData[i][vLocked] = false;

			VehicleData[i][vFuel] = 100;
			VehicleData[i][vHealth] = 1000.0;

			VehicleData[i][vRental] = rentid;
			VehicleData[i][vRentTime] = time;
			
			VehicleData[i][vVehicle] = CreateVehicle(VehicleData[i][vModel], VehicleData[i][vPos][0], VehicleData[i][vPos][1], VehicleData[i][vPos][2], VehicleData[i][vPos][3], VehicleData[i][vColor][0], VehicleData[i][vColor][1], 60000);
		    VehCore[VehicleData[i][vVehicle]][vehFuel] = VehicleData[i][vFuel];
		    SetVehicleNumberPlate(VehicleData[i][vVehicle], VehicleData[i][vPlate]);

            mysql_tquery(sqlcon, "INSERT INTO `vehicle` (`vehModel`) VALUES(0)", "OnPlayerVehicleCreated", "d", i);
            return i;
		}
	}
	return -1;
}

stock Vehicle_Delete(carid)
{
    if (carid != -1 && VehicleData[carid][vExists])
	{
	    new
	        string[64];

		format(string, sizeof(string), "DELETE FROM `vehicle` WHERE `vehID` = '%d'", VehicleData[carid][vID]);
		mysql_tquery(sqlcon, string);

		if (IsValidVehicle(VehicleData[carid][vVehicle]))
			DestroyVehicle(VehicleData[carid][vVehicle]);

        VehicleData[carid][vExists] = false;
	    VehicleData[carid][vID] = 0;
	    VehicleData[carid][vOwner] = -1;
	    VehicleData[carid][vVehicle] = INVALID_VEHICLE_ID;
	    VehicleData[carid][vRental] = -1;
	}
	return 1;
}

stock Vehicle_Create(ownerid, modelid, Float:x, Float:y, Float:z, Float:angle, color1, color2)
{
    forex(i, MAX_PLAYER_VEHICLE)
	{
		if (!VehicleData[i][vExists])
   		{
   		    VehicleData[i][vExists] = true;
   		    
            VehicleData[i][vModel] = modelid;
            VehicleData[i][vOwner] = ownerid;

			
			format(VehicleData[i][vPlate], 16, "NONE");
			
            VehicleData[i][vPos][0] = x;
            VehicleData[i][vPos][1] = y;
            VehicleData[i][vPos][2] = z;
            VehicleData[i][vPos][3] = angle;

			VehicleData[i][vInsurance] = 3;
			VehicleData[i][vInsuTime] = 0;
			
            VehicleData[i][vColor][0] = color1;

            VehicleData[i][vColor][1] = color2;
            
            VehicleData[i][vLocked] = false;

			VehicleData[i][vFuel] = 100;
			VehicleData[i][vHealth] = 1000.0;
			VehicleData[i][vRentTime] = 0;
			VehicleData[i][vRental] = -1;
			VehicleData[i][vVehicle] = CreateVehicle(VehicleData[i][vModel], VehicleData[i][vPos][0], VehicleData[i][vPos][1], VehicleData[i][vPos][2], VehicleData[i][vPos][3], VehicleData[i][vColor][0], VehicleData[i][vColor][1], 60000);
		    VehCore[VehicleData[i][vVehicle]][vehFuel] = VehicleData[i][vFuel];
		    SetVehicleNumberPlate(VehicleData[i][vVehicle], VehicleData[i][vPlate]);

            mysql_tquery(sqlcon, "INSERT INTO `vehicle` (`vehModel`) VALUES(0)", "OnPlayerVehicleCreated", "d", i);
            return i;
		}
	}
	return -1;
}


stock GetFreeVehicleID()
{
	forex(x,MAX_PLAYER_VEHICLE)
	{
		if(!VehicleData[x][vExists]) return x;
	}
	return -1;
}

FUNC::LoadPlayerVehicle(playerid)
{
	new query[128];
	mysql_format(sqlcon, query, sizeof(query), "SELECT * FROM `vehicle` WHERE `vehOwner` = %d", PlayerData[playerid][pID]);
	mysql_query(sqlcon, query, true);
	new count = cache_num_rows();
	if(count > 0)
	{
		forex(z,count)
		{
		    new i = GetFreeVehicleID();
		    
			VehicleData[i][vExists] = true;
			cache_get_value_name_int(z, "vehID", VehicleData[i][vID]);
			cache_get_value_name_int(z, "vehOwner", VehicleData[i][vOwner]);
			cache_get_value_name_int(z, "vehLocked", VehicleData[i][vLocked]);
			cache_get_value_name_float(z, "vehX", VehicleData[i][vPos][0]);
			cache_get_value_name_float(z, "vehY", VehicleData[i][vPos][1]);
			cache_get_value_name_float(z, "vehZ", VehicleData[i][vPos][2]);
			cache_get_value_name_float(z, "vehA", VehicleData[i][vPos][3]);
            cache_get_value_name_float(z, "vehHealth", VehicleData[i][vHealth]);
            cache_get_value_name_int(z, "vehModel", VehicleData[i][vModel]);
            cache_get_value_name_int(z, "vehDamage1", VehicleData[i][vDamage][0]);
            cache_get_value_name_int(z, "vehDamage2", VehicleData[i][vDamage][1]);
            cache_get_value_name_int(z, "vehDamage3", VehicleData[i][vDamage][2]);
            cache_get_value_name_int(z, "vehDamage4", VehicleData[i][vDamage][3]);
            cache_get_value_name_int(z, "vehInterior", VehicleData[i][vInterior]);
            cache_get_value_name_int(z, "vehWorld", VehicleData[i][vWorld]);
            cache_get_value_name_int(z, "vehColor1", VehicleData[i][vColor][0]);
            cache_get_value_name_int(z, "vehColor2", VehicleData[i][vColor][1]);
            cache_get_value_name_int(z, "vehFuel", VehicleData[i][vFuel]);
            cache_get_value_name_int(z, "vehInsurance", VehicleData[i][vInsurance]);
            cache_get_value_name_int(z, "vehInsuTime", VehicleData[i][vInsuTime]);
            cache_get_value_name(z, "vehPlate", VehicleData[i][vPlate]);
            cache_get_value_name_int(z, "vehRental", VehicleData[i][vRental]);
            cache_get_value_name_int(z, "vehRentalTime", VehicleData[i][vRentTime]);
            
			if(VehicleData[i][vInsuTime] == 0)
			{
			   // printf("PosX: %.1f | PosY: %.1f |  PosZ: %.1f | Model: %d", VehicleData[i][vPos][0], VehicleData[i][vPos][1], VehicleData[i][vPos][2], VehicleData[i][vModel]);
			    printf("[VEHICLE] Loaded %d player vehicle from: %s(%d)", count, GetName(playerid), playerid);

				VehicleData[i][vVehicle] = CreateVehicle(VehicleData[i][vModel], VehicleData[i][vPos][0], VehicleData[i][vPos][1], VehicleData[i][vPos][2], VehicleData[i][vPos][3], VehicleData[i][vColor][0], VehicleData[i][vColor][1], 60000);
				SetVehicleNumberPlate(VehicleData[i][vVehicle], VehicleData[i][vPlate]);
				SetVehicleVirtualWorld(VehicleData[i][vVehicle], VehicleData[i][vWorld]);
				LinkVehicleToInterior(VehicleData[i][vVehicle], VehicleData[i][vInterior]);
				VehCore[VehicleData[i][vVehicle]][vehFuel] = VehicleData[i][vFuel];

				if(VehicleData[i][vHealth] < 350.0)
				{
					SetVehicleHealth(VehicleData[i][vVehicle], 350.0);
				}
				else
				{
					SetVehicleHealth(VehicleData[i][vVehicle], VehicleData[i][vHealth]);
				}
				UpdateVehicleDamageStatus(VehicleData[i][vVehicle], VehicleData[i][vDamage][0], VehicleData[i][vDamage][1], VehicleData[i][vDamage][2], VehicleData[i][vDamage][3]);
				if(VehicleData[i][vVehicle] != INVALID_VEHICLE_ID)
				{
					if(VehicleData[i][vLocked] == 1)
					{
						SwitchVehicleDoors(VehicleData[i][vVehicle], true);
					}
					else
					{
						SwitchVehicleDoors(VehicleData[i][vVehicle], false);
					}
				}
			}
		}
	}
	return 1;
}

FUNC::OnPlayerVehicleRespawn(i)
{
	VehicleData[i][vVehicle] = CreateVehicle(VehicleData[i][vModel], VehicleData[i][vPos][0], VehicleData[i][vPos][1], VehicleData[i][vPos][2], VehicleData[i][vPos][3], VehicleData[i][vColor][0], VehicleData[i][vColor][1], 60000);
	SetVehicleNumberPlate(VehicleData[i][vVehicle], VehicleData[i][vPlate]);
	SetVehicleVirtualWorld(VehicleData[i][vVehicle], VehicleData[i][vWorld]);
	LinkVehicleToInterior(VehicleData[i][vVehicle], VehicleData[i][vInterior]);
	VehCore[VehicleData[i][vVehicle]][vehFuel] = VehicleData[i][vFuel];

	if(VehicleData[i][vHealth] < 350.0)
	{
		SetVehicleHealth(VehicleData[i][vVehicle], 350.0);
	}
	else
	{
		SetVehicleHealth(VehicleData[i][vVehicle], VehicleData[i][vHealth]);
	}
	UpdateVehicleDamageStatus(VehicleData[i][vVehicle], VehicleData[i][vDamage][0], VehicleData[i][vDamage][1], VehicleData[i][vDamage][2], VehicleData[i][vDamage][3]);
	if(VehicleData[i][vVehicle] != INVALID_VEHICLE_ID)
	{
		if(VehicleData[i][vLocked] == 1)
		{
			SwitchVehicleDoors(VehicleData[i][vVehicle], true);
		}
		else
		{
			SwitchVehicleDoors(VehicleData[i][vVehicle], false);
		}
	}
    return 1;
}

stock SaveVehicle(i)
{
	Vehicle_GetStatus(i);

	new cQuery[2512];
	mysql_format(sqlcon, cQuery, sizeof(cQuery), "UPDATE `vehicle` SET ");
	mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehX`='%f', ", cQuery, VehicleData[i][vPos][0]);
	mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehY`='%f', ", cQuery, VehicleData[i][vPos][1]);
	mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehZ`='%f', ", cQuery, VehicleData[i][vPos][2]+0.1);
	mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehA`='%f', ", cQuery, VehicleData[i][vPos][3]);
	mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehOwner`='%d', ", cQuery, VehicleData[i][vOwner]);
    mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehColor1`='%d', ", cQuery, VehicleData[i][vColor][0]);
    mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehColor2`='%d', ", cQuery, VehicleData[i][vColor][1]);
    mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehModel`='%d', ", cQuery, VehicleData[i][vModel]);
    mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehHealth`='%f', ", cQuery, VehicleData[i][vHealth]);
    mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehDamage1`='%d', ", cQuery, VehicleData[i][vDamage][0]);
    mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehDamage2`='%d', ", cQuery, VehicleData[i][vDamage][1]);
    mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehDamage3`='%d', ", cQuery, VehicleData[i][vDamage][2]);
    mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehDamage4`='%d', ", cQuery, VehicleData[i][vDamage][3]);
    mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehInterior`='%d', ", cQuery, VehicleData[i][vInterior]);
    mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehWorld`='%d', ", cQuery, VehicleData[i][vWorld]);
    mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehFuel`='%d', ", cQuery, VehicleData[i][vFuel]);
    mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehLocked`='%d', ", cQuery, VehicleData[i][vLocked]);
    mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehPlate`='%s', ", cQuery, VehicleData[i][vPlate]);
    mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehRental`='%d', ", cQuery, VehicleData[i][vRental]);
    mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehRentalTime`='%d', ", cQuery, VehicleData[i][vRentTime]);
    mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehInsurance`='%d', ", cQuery, VehicleData[i][vInsurance]);
    mysql_format(sqlcon, cQuery, sizeof(cQuery), "%s`vehInsuTime`='%d' ", cQuery, VehicleData[i][vInsuTime]);
	mysql_format(sqlcon, cQuery, sizeof(cQuery), "%sWHERE `vehID` = %d", cQuery, VehicleData[i][vID]);
	mysql_query(sqlcon, cQuery, true);
	
	return 1;
}

//==[ Command ]==

CMD:vcreate(playerid, params[])
{
	new model;
	if(sscanf(params, "d", model))
		return SendSyntaxMessage(playerid, "/vcreate [model]");
		
	new Float:pos[4];
	GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
	GetPlayerFacingAngle(playerid, pos[3]);
    Vehicle_Create(PlayerData[playerid][pID], model, pos[0], pos[1], pos[2], pos[3], 6, 6);
    SendServerMessage(playerid, "Vehicle created!");
	return 1;
}

CMD:veh(playerid, params[])
{
	new
	    model[32],
		color1,
		color2;

	if (sscanf(params, "s[32]I(-1)I(-1)", model, color1, color2))
	    return SendSyntaxMessage(playerid, "/veh [model id/name] <color 1> <color 2>");

	if ((model[0] = GetVehicleModelByName(model)) == 0)
	    return SendErrorMessage(playerid, "Invalid model ID.");

	new
	    Float:x,
	    Float:y,
	    Float:z,
	    Float:a,
		vehicleid;

	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, a);

	vehicleid = CreateVehicle(model[0], x, y + 2, z, a, color1, color2, 0);

	if (GetPlayerInterior(playerid) != 0)
	    LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));

	if (GetPlayerVirtualWorld(playerid) != 0)
		SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));

	PutPlayerInVehicle(playerid, vehicleid, 0);
	SwitchVehicleEngine(vehicleid, true);
	VehCore[vehicleid][vehFuel] = 100;
	SendServerMessage(playerid, "You have spawned a %s.", ReturnVehicleModelName(model[0]));
	return 1;
}

CMD:v(playerid, params[])
{
	new
	    type[24],
	    string[128],
		vehicleid = GetPlayerVehicleID(playerid),
		pvid = Vehicle_Inside(playerid);

	if (sscanf(params, "s[24]S()[128]", type, string))
	{
	    SendSyntaxMessage(playerid, "/v [name]");
	    SendClientMessage(playerid, COLOR_SERVER, "Names:{FFFFFF} list, lock, engine");
	    return 1;
	}
	if(!strcmp(type, "engine", true))
	{
		if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			if(!IsEngineVehicle(vehicleid))
				return SendErrorMessage(playerid, "You're not inside of any engine vehicle!");

			if(pvid != -1 && !Vehicle_HaveAccess(playerid, pvid))
				return ShowMessage(playerid, "~r~ERROR ~w~Kamu tidak memiliki kunci kendaraan ini!", 2);
				
			if(GetEngineStatus(vehicleid))
			{
			    SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s inserts the key into the ignition and stops the engine.", ReturnName(playerid));
				EngineStatus(playerid, vehicleid);
			}
			else
			{
			    ShowText(playerid, "Turning on the engine....", 3);
				SetTimerEx("EngineStatus", 3000, false, "id", playerid, vehicleid);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s inserts the key into the ignition and starts the engine.", ReturnName(playerid));
			}
		}
	}
	else if(!strcmp(type, "list", true))
	{
	    new bool:have, str[512];
	    format(str, sizeof(str), "Model\tPlate\tInsurance\n");
		forex(i, MAX_PLAYER_VEHICLE) if(VehicleData[i][vExists])
		{
		    if(Vehicle_IsOwner(playerid, i))
		    {
		        if(VehicleData[i][vInsuTime] != 0)
		        {
		            format(str, sizeof(str), "%s%s(Insurance)\t%s\t%d Left\n", str, GetVehicleModelName(VehicleData[i][vModel]), VehicleData[i][vPlate], VehicleData[i][vInsurance]);
				}
				else if(VehicleData[i][vRental] != -1)
		        {
		            format(str, sizeof(str), "%s%s(Rental)\t%s\tN/A\n", str, GetVehicleModelName(VehicleData[i][vModel]), VehicleData[i][vPlate]);
				}
				else
				{
		            format(str, sizeof(str), "%s%s(ID: %d)\t%s\t%d Left\n", str, GetVehicleModelName(VehicleData[i][vModel]), VehicleData[i][vVehicle], VehicleData[i][vPlate], VehicleData[i][vInsurance]);
				}
			}
			have = true;
		}
		if(have)
		    ShowPlayerDialog(playerid, DIALOG_NONE, DIALOG_STYLE_TABLIST_HEADERS, "Vehicle List", str, "Close", "");
		else
			SendErrorMessage(playerid, "You don't have any Vehicles!");
	}
	return 1;
}
