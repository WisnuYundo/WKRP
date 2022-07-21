//Textdraw
//==[ Variable ]==

//Editor Object
new PlayerText:TDEDIT[MAX_PLAYERS][7];
new PlayerText:PLUSX[MAX_PLAYERS];
new PlayerText:MINX[MAX_PLAYERS];
new PlayerText:PLUSY[MAX_PLAYERS];
new PlayerText:MINY[MAX_PLAYERS];
new PlayerText:PLUSZ[MAX_PLAYERS];
new PlayerText:MINZ[MAX_PLAYERS];
new PlayerText:PLUSRX[MAX_PLAYERS];
new PlayerText:MINRX[MAX_PLAYERS];
new PlayerText:PLUSRY[MAX_PLAYERS];
new PlayerText:MINRY[MAX_PLAYERS];
new PlayerText:PLUSRZ[MAX_PLAYERS];
new PlayerText:MINRZ[MAX_PLAYERS];
new PlayerText:FINISHEDIT[MAX_PLAYERS];
new PlayerText:DONEJOB[MAX_PLAYERS];

//Hunger Bar
new PlayerText:ENERGYTD[MAX_PLAYERS][2];
new PlayerBar:ENERGYBAR[MAX_PLAYERS];

//Speedometer
new PlayerText:SPEEDOTD[MAX_PLAYERS][4];
new PlayerBar:FUELBAR[MAX_PLAYERS];
new PlayerText:HEALTHTD[MAX_PLAYERS];
new PlayerText:KMHTD[MAX_PLAYERS];
new PlayerText:VEHNAMETD[MAX_PLAYERS];
new PlayerText:MSGTD[MAX_PLAYERS];


//==[ Textdraw Code ]==

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

	PLUSX[playerid] = CreatePlayerTextDraw(playerid, 158.000000, 181.000000, "ld_beat:left");
	PlayerTextDrawFont(playerid, PLUSX[playerid], 4);
	PlayerTextDrawLetterSize(playerid, PLUSX[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PLUSX[playerid], 27.000000, 27.000000);
	PlayerTextDrawSetOutline(playerid, PLUSX[playerid], 1);
	PlayerTextDrawSetShadow(playerid, PLUSX[playerid], 0);
	PlayerTextDrawAlignment(playerid, PLUSX[playerid], 1);
	PlayerTextDrawColor(playerid, PLUSX[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, PLUSX[playerid], 255);
	PlayerTextDrawBoxColor(playerid, PLUSX[playerid], 50);
	PlayerTextDrawUseBox(playerid, PLUSX[playerid], 1);
	PlayerTextDrawSetProportional(playerid, PLUSX[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, PLUSX[playerid], 1);

	MINX[playerid] = CreatePlayerTextDraw(playerid, 202.000000, 181.000000, "ld_beat:right");
	PlayerTextDrawFont(playerid, MINX[playerid], 4);
	PlayerTextDrawLetterSize(playerid, MINX[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, MINX[playerid], 27.000000, 27.000000);
	PlayerTextDrawSetOutline(playerid, MINX[playerid], 1);
	PlayerTextDrawSetShadow(playerid, MINX[playerid], 0);
	PlayerTextDrawAlignment(playerid, MINX[playerid], 1);
	PlayerTextDrawColor(playerid, MINX[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, MINX[playerid], 255);
	PlayerTextDrawBoxColor(playerid, MINX[playerid], 50);
	PlayerTextDrawUseBox(playerid, MINX[playerid], 1);
	PlayerTextDrawSetProportional(playerid, MINX[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, MINX[playerid], 1);

	TDEDIT[playerid][0] = CreatePlayerTextDraw(playerid, 187.000000, 170.000000, "X");
	PlayerTextDrawFont(playerid, TDEDIT[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, TDEDIT[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TDEDIT[playerid][0], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TDEDIT[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, TDEDIT[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, TDEDIT[playerid][0], 1);
	PlayerTextDrawColor(playerid, TDEDIT[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, TDEDIT[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, TDEDIT[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, TDEDIT[playerid][0], 0);
	PlayerTextDrawSetProportional(playerid, TDEDIT[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, TDEDIT[playerid][0], 0);

	PLUSY[playerid] = CreatePlayerTextDraw(playerid, 158.000000, 222.000000, "ld_beat:left");
	PlayerTextDrawFont(playerid, PLUSY[playerid], 4);
	PlayerTextDrawLetterSize(playerid, PLUSY[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PLUSY[playerid], 27.000000, 27.000000);
	PlayerTextDrawSetOutline(playerid, PLUSY[playerid], 1);
	PlayerTextDrawSetShadow(playerid, PLUSY[playerid], 0);
	PlayerTextDrawAlignment(playerid, PLUSY[playerid], 1);
	PlayerTextDrawColor(playerid, PLUSY[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, PLUSY[playerid], 255);
	PlayerTextDrawBoxColor(playerid, PLUSY[playerid], 50);
	PlayerTextDrawUseBox(playerid, PLUSY[playerid], 1);
	PlayerTextDrawSetProportional(playerid, PLUSY[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, PLUSY[playerid], 1);

	MINY[playerid] = CreatePlayerTextDraw(playerid, 202.000000, 221.000000, "ld_beat:right");
	PlayerTextDrawFont(playerid, MINY[playerid], 4);
	PlayerTextDrawLetterSize(playerid, MINY[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, MINY[playerid], 27.000000, 27.000000);
	PlayerTextDrawSetOutline(playerid, MINY[playerid], 1);
	PlayerTextDrawSetShadow(playerid, MINY[playerid], 0);
	PlayerTextDrawAlignment(playerid, MINY[playerid], 1);
	PlayerTextDrawColor(playerid, MINY[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, MINY[playerid], 255);
	PlayerTextDrawBoxColor(playerid, MINY[playerid], 50);
	PlayerTextDrawUseBox(playerid, MINY[playerid], 1);
	PlayerTextDrawSetProportional(playerid, MINY[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, MINY[playerid], 1);

	TDEDIT[playerid][1] = CreatePlayerTextDraw(playerid, 187.000000, 210.000000, "Y");
	PlayerTextDrawFont(playerid, TDEDIT[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, TDEDIT[playerid][1], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TDEDIT[playerid][1], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TDEDIT[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, TDEDIT[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, TDEDIT[playerid][1], 1);
	PlayerTextDrawColor(playerid, TDEDIT[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, TDEDIT[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, TDEDIT[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, TDEDIT[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, TDEDIT[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, TDEDIT[playerid][1], 0);

	PLUSZ[playerid] = CreatePlayerTextDraw(playerid, 158.000000, 258.000000, "ld_beat:left");
	PlayerTextDrawFont(playerid, PLUSZ[playerid], 4);
	PlayerTextDrawLetterSize(playerid, PLUSZ[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PLUSZ[playerid], 27.000000, 27.000000);
	PlayerTextDrawSetOutline(playerid, PLUSZ[playerid], 1);
	PlayerTextDrawSetShadow(playerid, PLUSZ[playerid], 0);
	PlayerTextDrawAlignment(playerid, PLUSZ[playerid], 1);
	PlayerTextDrawColor(playerid, PLUSZ[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, PLUSZ[playerid], 255);
	PlayerTextDrawBoxColor(playerid, PLUSZ[playerid], 50);
	PlayerTextDrawUseBox(playerid, PLUSZ[playerid], 1);
	PlayerTextDrawSetProportional(playerid, PLUSZ[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, PLUSZ[playerid], 1);

	MINZ[playerid] = CreatePlayerTextDraw(playerid, 202.000000, 257.000000, "ld_beat:right");
	PlayerTextDrawFont(playerid, MINZ[playerid], 4);
	PlayerTextDrawLetterSize(playerid, MINZ[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, MINZ[playerid], 27.000000, 27.000000);
	PlayerTextDrawSetOutline(playerid, MINZ[playerid], 1);
	PlayerTextDrawSetShadow(playerid, MINZ[playerid], 0);
	PlayerTextDrawAlignment(playerid, MINZ[playerid], 1);
	PlayerTextDrawColor(playerid, MINZ[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, MINZ[playerid], 255);
	PlayerTextDrawBoxColor(playerid, MINZ[playerid], 50);
	PlayerTextDrawUseBox(playerid, MINZ[playerid], 1);
	PlayerTextDrawSetProportional(playerid, MINZ[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, MINZ[playerid], 1);

	TDEDIT[playerid][2] = CreatePlayerTextDraw(playerid, 187.000000, 245.000000, "Z");
	PlayerTextDrawFont(playerid, TDEDIT[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, TDEDIT[playerid][2], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, TDEDIT[playerid][2], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TDEDIT[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, TDEDIT[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, TDEDIT[playerid][2], 1);
	PlayerTextDrawColor(playerid, TDEDIT[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, TDEDIT[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, TDEDIT[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, TDEDIT[playerid][2], 0);
	PlayerTextDrawSetProportional(playerid, TDEDIT[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, TDEDIT[playerid][2], 0);

	PLUSRX[playerid] = CreatePlayerTextDraw(playerid, 402.000000, 246.000000, "ld_beat:left");
	PlayerTextDrawFont(playerid, PLUSRX[playerid], 4);
	PlayerTextDrawLetterSize(playerid, PLUSRX[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PLUSRX[playerid], 27.000000, 27.000000);
	PlayerTextDrawSetOutline(playerid, PLUSRX[playerid], 1);
	PlayerTextDrawSetShadow(playerid, PLUSRX[playerid], 0);
	PlayerTextDrawAlignment(playerid, PLUSRX[playerid], 1);
	PlayerTextDrawColor(playerid, PLUSRX[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, PLUSRX[playerid], 255);
	PlayerTextDrawBoxColor(playerid, PLUSRX[playerid], 50);
	PlayerTextDrawUseBox(playerid, PLUSRX[playerid], 1);
	PlayerTextDrawSetProportional(playerid, PLUSRX[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, PLUSRX[playerid], 1);

	MINRX[playerid] = CreatePlayerTextDraw(playerid, 444.000000, 246.000000, "ld_beat:right");
	PlayerTextDrawFont(playerid, MINRX[playerid], 4);
	PlayerTextDrawLetterSize(playerid, MINRX[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, MINRX[playerid], 27.000000, 27.000000);
	PlayerTextDrawSetOutline(playerid, MINRX[playerid], 1);
	PlayerTextDrawSetShadow(playerid, MINRX[playerid], 0);
	PlayerTextDrawAlignment(playerid, MINRX[playerid], 1);
	PlayerTextDrawColor(playerid, MINRX[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, MINRX[playerid], 255);
	PlayerTextDrawBoxColor(playerid, MINRX[playerid], 50);
	PlayerTextDrawUseBox(playerid, MINRX[playerid], 1);
	PlayerTextDrawSetProportional(playerid, MINRX[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, MINRX[playerid], 1);

	TDEDIT[playerid][3] = CreatePlayerTextDraw(playerid, 429.000000, 230.000000, "RX");
	PlayerTextDrawFont(playerid, TDEDIT[playerid][3], 1);
	PlayerTextDrawLetterSize(playerid, TDEDIT[playerid][3], 0.379166, 2.099998);
	PlayerTextDrawTextSize(playerid, TDEDIT[playerid][3], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TDEDIT[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, TDEDIT[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, TDEDIT[playerid][3], 1);
	PlayerTextDrawColor(playerid, TDEDIT[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, TDEDIT[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, TDEDIT[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, TDEDIT[playerid][3], 0);
	PlayerTextDrawSetProportional(playerid, TDEDIT[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, TDEDIT[playerid][3], 0);

	PLUSRY[playerid] = CreatePlayerTextDraw(playerid, 402.000000, 292.000000, "ld_beat:left");
	PlayerTextDrawFont(playerid, PLUSRY[playerid], 4);
	PlayerTextDrawLetterSize(playerid, PLUSRY[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PLUSRY[playerid], 27.000000, 27.000000);
	PlayerTextDrawSetOutline(playerid, PLUSRY[playerid], 1);
	PlayerTextDrawSetShadow(playerid, PLUSRY[playerid], 0);
	PlayerTextDrawAlignment(playerid, PLUSRY[playerid], 1);
	PlayerTextDrawColor(playerid, PLUSRY[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, PLUSRY[playerid], 255);
	PlayerTextDrawBoxColor(playerid, PLUSRY[playerid], 50);
	PlayerTextDrawUseBox(playerid, PLUSRY[playerid], 1);
	PlayerTextDrawSetProportional(playerid, PLUSRY[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, PLUSRY[playerid], 1);

	TDEDIT[playerid][4] = CreatePlayerTextDraw(playerid, 429.000000, 277.000000, "RY");
	PlayerTextDrawFont(playerid, TDEDIT[playerid][4], 1);
	PlayerTextDrawLetterSize(playerid, TDEDIT[playerid][4], 0.379166, 2.099998);
	PlayerTextDrawTextSize(playerid, TDEDIT[playerid][4], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TDEDIT[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, TDEDIT[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, TDEDIT[playerid][4], 1);
	PlayerTextDrawColor(playerid, TDEDIT[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, TDEDIT[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, TDEDIT[playerid][4], 50);
	PlayerTextDrawUseBox(playerid, TDEDIT[playerid][4], 0);
	PlayerTextDrawSetProportional(playerid, TDEDIT[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, TDEDIT[playerid][4], 0);

	MINRY[playerid] = CreatePlayerTextDraw(playerid, 444.000000, 291.000000, "ld_beat:right");
	PlayerTextDrawFont(playerid, MINRY[playerid], 4);
	PlayerTextDrawLetterSize(playerid, MINRY[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, MINRY[playerid], 27.000000, 27.000000);
	PlayerTextDrawSetOutline(playerid, MINRY[playerid], 1);
	PlayerTextDrawSetShadow(playerid, MINRY[playerid], 0);
	PlayerTextDrawAlignment(playerid, MINRY[playerid], 1);
	PlayerTextDrawColor(playerid, MINRY[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, MINRY[playerid], 255);
	PlayerTextDrawBoxColor(playerid, MINRY[playerid], 50);
	PlayerTextDrawUseBox(playerid, MINRY[playerid], 1);
	PlayerTextDrawSetProportional(playerid, MINRY[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, MINRY[playerid], 1);

	PLUSRZ[playerid] = CreatePlayerTextDraw(playerid, 402.000000, 329.000000, "ld_beat:left");
	PlayerTextDrawFont(playerid, PLUSRZ[playerid], 4);
	PlayerTextDrawLetterSize(playerid, PLUSRZ[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PLUSRZ[playerid], 27.000000, 27.000000);
	PlayerTextDrawSetOutline(playerid, PLUSRZ[playerid], 1);
	PlayerTextDrawSetShadow(playerid, PLUSRZ[playerid], 0);
	PlayerTextDrawAlignment(playerid, PLUSRZ[playerid], 1);
	PlayerTextDrawColor(playerid, PLUSRZ[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, PLUSRZ[playerid], 255);
	PlayerTextDrawBoxColor(playerid, PLUSRZ[playerid], 50);
	PlayerTextDrawUseBox(playerid, PLUSRZ[playerid], 1);
	PlayerTextDrawSetProportional(playerid, PLUSRZ[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, PLUSRZ[playerid], 1);

	TDEDIT[playerid][5] = CreatePlayerTextDraw(playerid, 429.000000, 316.000000, "RZ");
	PlayerTextDrawFont(playerid, TDEDIT[playerid][5], 1);
	PlayerTextDrawLetterSize(playerid, TDEDIT[playerid][5], 0.379166, 2.099998);
	PlayerTextDrawTextSize(playerid, TDEDIT[playerid][5], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TDEDIT[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, TDEDIT[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, TDEDIT[playerid][5], 1);
	PlayerTextDrawColor(playerid, TDEDIT[playerid][5], -1);
	PlayerTextDrawBackgroundColor(playerid, TDEDIT[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, TDEDIT[playerid][5], 50);
	PlayerTextDrawUseBox(playerid, TDEDIT[playerid][5], 0);
	PlayerTextDrawSetProportional(playerid, TDEDIT[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, TDEDIT[playerid][5], 0);

	MINRZ[playerid] = CreatePlayerTextDraw(playerid, 444.000000, 328.000000, "ld_beat:right");
	PlayerTextDrawFont(playerid, MINRZ[playerid], 4);
	PlayerTextDrawLetterSize(playerid, MINRZ[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, MINRZ[playerid], 27.000000, 27.000000);
	PlayerTextDrawSetOutline(playerid, MINRZ[playerid], 1);
	PlayerTextDrawSetShadow(playerid, MINRZ[playerid], 0);
	PlayerTextDrawAlignment(playerid, MINRZ[playerid], 1);
	PlayerTextDrawColor(playerid, MINRZ[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, MINRZ[playerid], 255);
	PlayerTextDrawBoxColor(playerid, MINRZ[playerid], 50);
	PlayerTextDrawUseBox(playerid, MINRZ[playerid], 1);
	PlayerTextDrawSetProportional(playerid, MINRZ[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, MINRZ[playerid], 1);

	FINISHEDIT[playerid] = CreatePlayerTextDraw(playerid, 237.000000, 366.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, FINISHEDIT[playerid], 4);
	PlayerTextDrawLetterSize(playerid, FINISHEDIT[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, FINISHEDIT[playerid], 43.000000, 21.000000);
	PlayerTextDrawSetOutline(playerid, FINISHEDIT[playerid], 1);
	PlayerTextDrawSetShadow(playerid, FINISHEDIT[playerid], 0);
	PlayerTextDrawAlignment(playerid, FINISHEDIT[playerid], 1);
	PlayerTextDrawColor(playerid, FINISHEDIT[playerid], -16776961);
	PlayerTextDrawBackgroundColor(playerid, FINISHEDIT[playerid], 255);
	PlayerTextDrawBoxColor(playerid, FINISHEDIT[playerid], 50);
	PlayerTextDrawUseBox(playerid, FINISHEDIT[playerid], 1);
	PlayerTextDrawSetProportional(playerid, FINISHEDIT[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, FINISHEDIT[playerid], 1);

	TDEDIT[playerid][6] = CreatePlayerTextDraw(playerid, 238.000000, 368.000000, "FINISH");
	PlayerTextDrawFont(playerid, TDEDIT[playerid][6], 1);
	PlayerTextDrawLetterSize(playerid, TDEDIT[playerid][6], 0.354166, 1.849998);
	PlayerTextDrawTextSize(playerid, TDEDIT[playerid][6], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TDEDIT[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, TDEDIT[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, TDEDIT[playerid][6], 1);
	PlayerTextDrawColor(playerid, TDEDIT[playerid][6], -1);
	PlayerTextDrawBackgroundColor(playerid, TDEDIT[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, TDEDIT[playerid][6], 50);
	PlayerTextDrawUseBox(playerid, TDEDIT[playerid][6], 0);
	PlayerTextDrawSetProportional(playerid, TDEDIT[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, TDEDIT[playerid][6], 0);

	DONEJOB[playerid] = CreatePlayerTextDraw(playerid, 364.000000, 384.000000, "ld_dual:white");
	PlayerTextDrawFont(playerid, DONEJOB[playerid], 4);
	PlayerTextDrawLetterSize(playerid, DONEJOB[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, DONEJOB[playerid], 32.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, DONEJOB[playerid], 1);
	PlayerTextDrawSetShadow(playerid, DONEJOB[playerid], 0);
	PlayerTextDrawAlignment(playerid, DONEJOB[playerid], 1);
	PlayerTextDrawColor(playerid, DONEJOB[playerid], 16711935);
	PlayerTextDrawBackgroundColor(playerid, DONEJOB[playerid], 255);
	PlayerTextDrawBoxColor(playerid, DONEJOB[playerid], 50);
	PlayerTextDrawUseBox(playerid, DONEJOB[playerid], 1);
	PlayerTextDrawSetProportional(playerid, DONEJOB[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, DONEJOB[playerid], 1);
}

stock CreateGlobalTextDraw()
{

}
//==[ Function ]==


stock ShowEditTextDraw(playerid)
{
	for(new i; i < 7; i++)
	{
	    PlayerTextDrawShow(playerid, TDEDIT[playerid][i]);
	}
	PlayerTextDrawShow(playerid, PLUSX[playerid]);
	PlayerTextDrawShow(playerid, MINX[playerid]);
	PlayerTextDrawShow(playerid, PLUSY[playerid]);
	PlayerTextDrawShow(playerid, MINY[playerid]);
	PlayerTextDrawShow(playerid, PLUSZ[playerid]);
	PlayerTextDrawShow(playerid, MINZ[playerid]);
	PlayerTextDrawShow(playerid, PLUSRX[playerid]);
	PlayerTextDrawShow(playerid, MINRX[playerid]);
	PlayerTextDrawShow(playerid, PLUSRY[playerid]);
	PlayerTextDrawShow(playerid, MINRY[playerid]);
	PlayerTextDrawShow(playerid, PLUSRZ[playerid]);
	PlayerTextDrawShow(playerid, MINRZ[playerid]);
	PlayerTextDrawShow(playerid, FINISHEDIT[playerid]);
	SelectTextDraw(playerid, COLOR_YELLOW);
	return 1;
}

stock HideEditTextDraw(playerid)
{
	for(new i; i < 7; i++)
	{
	    PlayerTextDrawHide(playerid, TDEDIT[playerid][i]);
	}
	PlayerTextDrawHide(playerid, PLUSX[playerid]);
	PlayerTextDrawHide(playerid, MINX[playerid]);
	PlayerTextDrawHide(playerid, PLUSY[playerid]);
	PlayerTextDrawHide(playerid, MINY[playerid]);
	PlayerTextDrawHide(playerid, PLUSZ[playerid]);
	PlayerTextDrawHide(playerid, MINZ[playerid]);
	PlayerTextDrawHide(playerid, PLUSRX[playerid]);
	PlayerTextDrawHide(playerid, MINRX[playerid]);
	PlayerTextDrawHide(playerid, PLUSRY[playerid]);
	PlayerTextDrawHide(playerid, MINRY[playerid]);
	PlayerTextDrawHide(playerid, PLUSRZ[playerid]);
	PlayerTextDrawHide(playerid, MINRZ[playerid]);
	PlayerTextDrawHide(playerid, FINISHEDIT[playerid]);
	CancelSelectTextDraw(playerid);
	return 1;
}