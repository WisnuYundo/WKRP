
/* Variable */

new MySQL:sqlcon;
new g_RaceCheck[MAX_PLAYERS char];
new PlayerChar[MAX_PLAYERS][MAX_CHARS][MAX_PLAYER_NAME + 1];
new tempUCP[64];

new PlayerText:ENERGYTD[MAX_PLAYERS][2];
new PlayerBar:ENERGYBAR[MAX_PLAYERS];

new PlayerText:SPEEDOTD[MAX_PLAYERS][4];
new PlayerBar:FUELBAR[MAX_PLAYERS];
new PlayerText:HEALTHTD[MAX_PLAYERS];
new PlayerText:KMHTD[MAX_PLAYERS];
new PlayerText:VEHNAMETD[MAX_PLAYERS];
new PlayerText:MSGTD[MAX_PLAYERS];

new g_aMaleSkins[] = {
	1, 2, 3, 4, 5, 6, 7, 8, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29,
	30, 32, 33, 34, 35, 36, 37, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 57, 58, 59, 60,
	61, 62, 66, 68, 72, 73, 78, 79, 80, 81, 82, 83, 84, 94, 95, 96, 97, 98, 99, 100, 101, 102,
	103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120,
	121, 122, 123, 124, 125, 126, 127, 128, 132, 133, 134, 135, 136, 137, 142, 143, 144, 146,
	147, 153, 154, 155, 156, 158, 159, 160, 161, 162, 167, 168, 170, 171, 173, 174, 175, 176,
	177, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 200, 202, 203, 204, 206,
	208, 209, 210, 212, 213, 217, 220, 221, 222, 223, 228, 229, 230, 234, 235, 236, 239, 240,
	241, 242, 247, 248, 249, 250, 253, 254, 255, 258, 259, 260, 261, 262, 268, 272, 273, 289,
	290, 291, 292, 293, 294, 295, 296, 297, 299
};

new g_aFemaleSkins[] = {
    9, 10, 11, 12, 13, 31, 38, 39, 40, 41, 53, 54, 55, 56, 63, 64, 65, 69,
    75, 76, 77, 85, 88, 89, 90, 91, 92, 93, 129, 130, 131, 138, 140, 141,
    145, 148, 150, 151, 152, 157, 169, 178, 190, 191, 192, 193, 194, 195,
    196, 197, 198, 199, 201, 205, 207, 211, 214, 215, 216, 219, 224, 225,
    226, 231, 232, 233, 237, 238, 243, 244, 245, 246, 251, 256, 257, 263,
    298
};

/* Enums */

enum
{
	DIALOG_REGISTER,
	DIALOG_LOGIN,
	DIALOG_LOGINCHAR,
	DIALOG_MAKECHAR,
	DIALOG_ORIGIN,
	DIALOG_AGE,
	DIALOG_GENDER,
	DIALOG_CHARLIST,
	DIALOG_HELP,
	DIALOG_HELP_RETURN,
	DIALOG_HELP_JOB,

	DIALOG_NONE,
	DIALOG_BIZBUY,
	DIALOG_INVENTORY,
	DIALOG_GIVEITEM,
	DIALOG_DROPITEM,
	DIALOG_USEITEM,
	DIALOG_GIVEAMOUNT,
	DIALOG_INVACTION,
	DIALOG_BUYSKINS,
	DIALOG_INSURANCE,
	DIALOG_BUYINSURANCE,
	DIALOG_RENTAL,
	DIALOG_RENTTIME,
	DIALOG_BIZMENU,
	DIALOG_BIZNAME,
	DIALOG_BIZPROD,
	DIALOG_BIZPRODSET,
	DIALOG_BIZPRICE,
	DIALOG_BIZPRICESET,
	DIALOG_BIZCARGO
};

enum e_player_data
{
	pID,
	pUCP[22],
	pName[MAX_PLAYER_NAME],
	Float:pPos[3],
	pWorld,
	pInterior,
	pSkin,
	pAge,
	pAttempt,
	pOrigin[32],
	pGender,
	bool:pMaskOn,
	pMaskID,
	bool:pSpawned,
	pChar,
	Float:pHealth,
	pEnergy,
	pMoney,
	pBank,
	pInBiz,
	pListitem,
	pStorageSelect,
	pAdmin,
	pAduty,
	pPhoneNumber,
	pCalline,
	pCredit,
	pCalling,
	pTarget,
	pSkinPrice,
	pVehKey,
	pFaction,
	pRenting,
};

new PlayerData[MAX_PLAYERS][e_player_data];

