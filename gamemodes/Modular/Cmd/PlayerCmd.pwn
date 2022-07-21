//==[ Command Player ]==

CMD:rentinfo(playerid, params[])
{
	new bool:have, str[512], time[3];
	format(str, sizeof(str), "Model(ID)\tDuration\n");
	forex(i, MAX_PLAYER_VEHICLE) if(VehicleData[i][vExists])
	{
		if(Vehicle_IsOwner(playerid, i) && IsValidVehicle(VehicleData[i][vVehicle]) && VehicleData[i][vRental] != -1)
		{
		    GetElapsedTime(VehicleData[i][vRentTime], time[0], time[1], time[2]);
		    format(str, sizeof(str), "%s%s(%d)\t%02d:%02d:%02d\n", str, GetVehicleModelName(VehicleData[i][vModel]),VehicleData[i][vVehicle], time[0], time[1], time[2]);
			have = true;
		}
	}
	if(have)
		ShowPlayerDialog(playerid, DIALOG_NONE, DIALOG_STYLE_TABLIST_HEADERS, "Rental Information", str, "Close", "");
	else
		SendErrorMessage(playerid, "Kamu tidak memiliki kendaraan Rental!");
	return 1;
}

CMD:help(playerid, params[])
{
	if(!PlayerData[playerid][pSpawned])
		return SendErrorMessage(playerid, "You're not spawned!");

	ShowPlayerDialog(playerid, DIALOG_HELP, DIALOG_STYLE_LIST, "Help Menu", "General Commands\nChat Commands\nJob Commands\nFaction Commands\nBusiness Commands\nHouse Commands\nBank Commands\nDealership Commands\nWorkshop Commands\nPrivate Farm Commands", "Select", "Close");
	return 1;
}

CMD:inventory(playerid, params[])
{
	PlayerData[playerid][pStorageSelect] = 0;
	OpenInventory(playerid);
	return 1;
}


CMD:enter(playerid, params[])
{
	new id;
	if(!IsPlayerInAnyVehicle(playerid))
	{
		forex(bid, MAX_BUSINESS) if(BizData[bid][bizExists])
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.8, BizData[bid][bizExt][0], BizData[bid][bizExt][1], BizData[bid][bizExt][2]))
			{
				if(BizData[bid][bizLocked])
					return SendErrorMessage(playerid, "This business is Locked by the Owner!");

				PlayerData[playerid][pInBiz] = bid;
				SetPlayerPosEx(playerid, BizData[bid][bizInt][0], BizData[bid][bizInt][1], BizData[bid][bizInt][2]);

				SetPlayerInterior(playerid, BizData[bid][bizInterior]);
				SetPlayerVirtualWorld(playerid, BizData[bid][bizWorld]);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, 0);
			}
	    }
		new inbiz = PlayerData[playerid][pInBiz];
		if(PlayerData[playerid][pInBiz] != -1 && IsPlayerInRangeOfPoint(playerid, 2.8, BizData[inbiz][bizInt][0], BizData[inbiz][bizInt][1], BizData[inbiz][bizInt][2]))
		{
			SetPlayerPos(playerid, BizData[inbiz][bizExt][0], BizData[inbiz][bizExt][1], BizData[inbiz][bizExt][2]);

			PlayerData[playerid][pInBiz] = -1;
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetCameraBehindPlayer(playerid);
		}
		if ((id = House_Nearest(playerid)) != -1)
	    {
	        if (HouseData[id][houseLocked])
	            return ShowText(playerid, "~r~Locked", 2);

			SetPlayerPos(playerid, HouseData[id][houseInt][0], HouseData[id][houseInt][1], HouseData[id][houseInt][2]);
			SetPlayerFacingAngle(playerid, HouseData[id][houseInt][3]);

			SetPlayerInterior(playerid, HouseData[id][houseInterior]);
			SetPlayerVirtualWorld(playerid, HouseData[id][houseID] + 5000);

			SetCameraBehindPlayer(playerid);
			PlayerData[playerid][pInHouse] = HouseData[id][houseID];
			return 1;
		}
		if ((id = House_Inside(playerid)) != -1 && IsPlayerInRangeOfPoint(playerid, 2.5, HouseData[id][houseInt][0], HouseData[id][houseInt][1], HouseData[id][houseInt][2]))
	    {
			SetPlayerPos(playerid, HouseData[id][housePos][0], HouseData[id][housePos][1], HouseData[id][housePos][2]);
			SetPlayerFacingAngle(playerid, HouseData[id][housePos][3] - 180.0);

			SetPlayerInterior(playerid, HouseData[id][houseExterior]);
			SetPlayerVirtualWorld(playerid, HouseData[id][houseExteriorVW]);

			SetCameraBehindPlayer(playerid);
			PlayerData[playerid][pInHouse] = -1;
			return 1;
		}
	}
	return 1;
}