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
