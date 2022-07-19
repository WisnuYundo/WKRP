//==[ Variable ]==

enum
{
	FACTION_NONE,
	FACTION_POLICE,
	FACTION_NEWS,
	FACTION_MEDIC,
	FACTION_GOV,
	FACTION_FAMILY
};

enum factionData 
{
	factionID,
	factionExists,
	factionName[32],
	factionColor,
	factionType,
	factionRanks,
	Float:factionLockerPos[3],
	factionLockerInt,
	factionLockerWorld,
	factionSkins[8],
	factionWeapons[10],
	factionAmmo[10],
	factionDurability[10],
	factionSalary[15],
	STREAMER_TAG_3D_TEXT_LABEL:factionText3D,
	STREAMER_TAG_PICKUP:factionPickup,
	Float:SpawnX,
	Float:SpawnY,
	Float:SpawnZ,
	SpawnInterior,
	SpawnVW
};
new FactionData[MAX_FACTIONS][factionData];

stock GetFactionType(playerid)
{
	if (PlayerData[playerid][pFaction] == -1)
	    return 0;

	return (FactionData[PlayerData[playerid][pFaction]][factionType]);
}