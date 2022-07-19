#if defined _performance_included
    #endinput
#endif
#define _performance_included

#if defined COLANDREAS
	static pUpdateSoldSurf[MAX_PLAYERS char];
#endif
static pCheckPaused[MAX_PLAYERS];
static pGetVehicleID[MAX_PLAYERS];
static pUpdateTimer200ms[MAX_PLAYERS];
static pKeySendType[MAX_PLAYERS char];
static vEngineMode[MAX_VEHICLES char];
static vEngineState[MAX_VEHICLES char];
static vEngineDefault = 1;

#define pressed(%0) (((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))
#define holding(%0) (((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))

static gMaxSpeed[212] =
{
	157, 147, 186, 110, 133, 164, 110, 148, 100, 158, 129, 221, 168, 110,
	105, 192, 154, 270, 115, 149, 145, 154, 140, 99, 135, 270, 173, 165,
	157, 201, 190, 130, 94, 110, 167, 0, 149, 158, 142, 168, 136, 145, 139,
	126, 110, 164, 270, 270, 111, 0, 0, 193, 270, 60, 135, 157, 106, 95, 157,
	136, 270, 160, 111, 142, 145, 145, 147, 140, 144, 270, 157, 110, 190, 190,
	149, 173, 270, 186, 117, 140, 184, 73, 156, 122, 190, 99, 64, 270, 270, 139,
	157, 149, 140, 270, 214, 176, 162, 270, 108, 123, 140, 145, 216, 216, 173,
	140, 179, 166, 108, 79, 101, 270, 270, 270, 120, 142, 157, 157, 164, 270,
	270, 160, 176, 151, 130, 160, 158, 149, 176, 149, 60, 70, 110, 167,
	168, 158, 173, 0, 0, 270, 149, 203, 164, 151, 150, 147, 149, 142, 270,
	153, 145, 157, 121, 270, 144, 158, 113, 113, 156, 178, 169, 154, 178,
	270, 145, 165, 160, 173, 146, 0, 0, 93, 60, 110, 60, 158, 158, 270, 130,
	158, 153, 151, 136, 85, 0, 153, 142, 165, 108, 162, 0, 0, 270, 270, 130,
	190, 175, 175, 175, 158, 151, 110, 169, 171, 148, 152, 0, 0, 0, 108, 0, 0
};

public OnPlayerConnect(playerid)
{
    pKeySendType{playerid} = 0;
    pGetVehicleID[playerid] = 0;
	#if defined pt_OnPlayerConnect
		return pt_OnPlayerConnect(playerid);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerConnect
    #undef OnPlayerConnect
#else
    #define _ALS_OnPlayerConnect
#endif
#if defined pt_OnPlayerConnect
	forward pt_OnPlayerConnect(playerid);
#endif
#define	OnPlayerConnect pt_OnPlayerConnect

public OnPlayerDisconnect(playerid, reason)
{
	if(pUpdateTimer200ms[playerid])
	{
		KillTimer(pUpdateTimer200ms[playerid]);
		pUpdateTimer200ms[playerid] = 0;
	}
    #if defined pt_OnPlayerDisconnect
		return pt_OnPlayerDisconnect(playerid, reason);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerDisconnect
    #undef OnPlayerDisconnect
#else
    #define _ALS_OnPlayerDisconnect
#endif
#if defined pt_OnPlayerDisconnect
	forward pt_OnPlayerDisconnect(playerid, reason);
#endif
#define	OnPlayerDisconnect pt_OnPlayerDisconnect

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(pressed(KEY_SPRINT)) pKeySendType{playerid} = 1;
    else if(pressed(KEY_JUMP)) pKeySendType{playerid} = 2;
	else if(holding(KEY_SPRINT) || holding(KEY_JUMP)) pKeySendType{playerid} = 0;
	#if defined pt_OnPlayerKeyStateChange
		return pt_OnPlayerKeyStateChange(playerid, newkeys, oldkeys);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerKeyStateChange
    #undef OnPlayerKeyStateChange
#else
    #define _ALS_OnPlayerKeyStateChange
#endif
#if defined pt_OnPlayerKeyStateChange
	forward pt_OnPlayerKeyStateChange(playerid, newkeys, oldkeys);
#endif
#define	OnPlayerKeyStateChange pt_OnPlayerKeyStateChange

public OnPlayerUpdate(playerid)
{
    pCheckPaused[playerid] = 0;
	#if defined pt_OnPlayerUpdate
		return pt_OnPlayerUpdate(playerid);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerUpdate
    #undef OnPlayerUpdate
#else
    #define _ALS_OnPlayerUpdate
#endif
#if defined pt_OnPlayerUpdate
	forward pt_OnPlayerUpdate(playerid);
#endif
#define	OnPlayerUpdate pt_OnPlayerUpdate

public OnPlayerStateChange(playerid, newstate, oldstate)
{
    if(newstate == PLAYER_STATE_DRIVER)
    {
        new vehid = pGetVehicleID[playerid] = GetPlayerVehicleID(playerid);
    	if(vehid && vEngineMode{vehid})
    	{
	    	if(pUpdateTimer200ms[playerid]) KillTimer(pUpdateTimer200ms[playerid]);
	    	pUpdateTimer200ms[playerid] = SetTimerEx("pt_UpdateTimer200ms", 200, 1, "i", playerid);
  		}
    }
    else
	{
		if(pUpdateTimer200ms[playerid])
		{
			KillTimer(pUpdateTimer200ms[playerid]);
			pUpdateTimer200ms[playerid] = 0;
		}
	}
	#if defined pt_OnPlayerStateChange
		return pt_OnPlayerStateChange(playerid, newstate, oldstate);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerStateChange
    #undef OnPlayerStateChange
#else
    #define _ALS_OnPlayerStateChange
#endif
#if defined pt_OnPlayerStateChange
	forward pt_OnPlayerStateChange(playerid, newstate, oldstate);
#endif
#define	OnPlayerStateChange pt_OnPlayerStateChange

forward pt_UpdateTimer200ms(playerid);
public pt_UpdateTimer200ms(playerid) if(++pCheckPaused[playerid] < 3 && pGetVehicleID[playerid])
{
    new vehid = pGetVehicleID[playerid];
    #if defined COLANDREAS
	if(++pUpdateSoldSurf{playerid} >= 5)
	{
	    pUpdateSoldSurf{playerid} = 0;
	    new panic;
		#if defined GetKernelPanicAC
		    panic = GetKernelPanicAC();
		#endif
		if(!panic && vEngineMode{vehid})
		{
		    if(!GetSoldSurf(playerid)) return;
		}
	}
	#endif
    if(vEngineState{vehid} && vEngineMode{vehid} && pKeySendType{playerid})
	{
	    new Float:rot_x, Float:rot_y, Float:rot_z, model = GetVehicleModel(vehid);
	    GetVehRot(vehid, rot_x, rot_y, rot_z);
	    if(model && (-40.0 < rot_x < 40.0) && (-40.0 < rot_y < 40.0))
		{
		    new speed = GetVehSpeed(vehid), spmax = gMaxSpeed[model - 400];
		    if(pKeySendType{playerid} == 1) { if(2 < speed < (spmax + floatround(20 * vEngineMode{vehid}))) SetVehSpeed(vehid, (vEngineMode{vehid} / 100.0)); }
		    else { if(speed > 20 && !GetVehGoesBack(vehid)) SetVehSpeed(vehid, -((vEngineMode{vehid} / 4500.0) * speed)); }
		}
	}
}

static stock GetVehRot(vehid, &Float:rx, &Float:ry, &Float:rz)
{
	new Float:qw, Float:qx, Float:qy, Float:qz;
	GetVehicleRotationQuat(vehid, qw, qx, qy, qz);
	rx = asin(2.0 * qy * qz - 2.0 * qx * qw);
	ry = -atan2(qx * qz + qy * qw, 0.5 - qx * qx - qy * qy);
	rz = -atan2(qx * qy + qz * qw, 0.5 - qx * qx - qz * qz);
}

#if defined COLANDREAS
static stock GetSoldSurf(playerid)
{
	new Float:pos_x, Float:pos_y, Float:pos_z;
    GetPlayerPos(playerid, pos_x, pos_y, pos_z);

    new Float:pos_gx[40], Float:pos_gy[40], Float:pos_gz[40], Float:trash0[40], trash1[40], count;
	count = CA_RayCastMultiLine(pos_x, pos_y, 4000.0, pos_x, pos_y, -4000.0, pos_gx, pos_gy, pos_gz, trash0, trash1);
	for(new id; id < count; id++) if(pos_gz[id] < pos_z < (pos_gz[id] + 3.0)) return 1;
	return 0;
}
#endif

static stock GetVehGoesBack(vehid)
{
    new Float:pos_x, Float:pos_y, Float:pos_z, Float:pos_a, Float:vel_x, Float:vel_y, Float:vel_z, Float:npos_x, Float:npos_y;
    GetVehiclePos(vehid, pos_x, pos_y, pos_z);
	GetVehicleZAngle(vehid, pos_a);
    GetVehicleVelocity(vehid, vel_x, vel_y, vel_z);
    npos_x = pos_x - (-10.0 * floatsin(pos_a, degrees));
	npos_y = pos_y - (10.0 * floatcos(pos_a, degrees));
	pos_x += vel_x;
	pos_y += vel_y;
	if(VectorSize((pos_x - npos_x), (pos_y - npos_y), 0.0) < 10.0) return 1;
	return 0;
}

static stock GetVehSpeed(vehid)
{
    new Float:vel_x, Float:vel_y, Float:vel_z;
    GetVehicleVelocity(vehid, vel_x, vel_y, vel_z);
	return floatround(VectorSize(vel_x, vel_y, vel_z) * 170.0);
}

static stock SetVehSpeed(vehid, Float:speed)
{
    new Float:vel_x, Float:vel_y, Float:vel_z, Float:pos_a;
    GetVehicleZAngle(vehid, pos_a);
    GetVehicleVelocity(vehid, vel_x, vel_y, vel_z);
    SetVehicleVelocity(vehid, vel_x + (speed * floatsin(-pos_a, degrees)), vel_y + (speed * floatcos(-pos_a, degrees)), vel_z);
}

stock GetVehicleEngineState(vehid)
{
	return vEngineMode{vehid};
}
		
stock SetVehicleEngineState(vehid, estate)
{
	if(!(0 <= estate <= 5) || !GetVehicleModel(vehid)) return 0;
	vEngineMode{vehid} = estate;
	if(!estate)
    {
    	foreach(Player, playerid) if(IsPlayerInVehicle(playerid, vehid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
        {
			if(pUpdateTimer200ms[playerid])
			{
				KillTimer(pUpdateTimer200ms[playerid]);
				pUpdateTimer200ms[playerid] = 0;
			}
		}
	}
	else
    {
    	foreach(Player, playerid) if(IsPlayerInVehicle(playerid, vehid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
        {
	    	if(pUpdateTimer200ms[playerid]) KillTimer(pUpdateTimer200ms[playerid]);
	    	pUpdateTimer200ms[playerid] = SetTimerEx("pt_UpdateTimer200ms", 200, 1, "i", playerid);
		}
    }
	return 1;
}
	
stock pt_ManualVehicleEngineLights()
{
	vEngineDefault = 0;
	return ManualVehicleEngineAndLights();
}
#if defined _ALS_ManualVehicleEngineLights
    #undef ManualVehicleEngineLights
#else
    #define _ALS_ManualVehicleEngineLights
#endif
#define	ManualVehicleEngineAndLights pt_ManualVehicleEngineLights

stock pt_SetVehicleParamsEx(vehid, engine, lights, alarm, doors, bonnet, boot, objective)
{
    vEngineState{vehid} = engine;
    return SetVehicleParamsEx(vehid, engine, lights, alarm, doors, bonnet, boot, objective);
}
#if defined _ALS_SetVehicleParamsEx
    #undef SetVehicleParamsEx
#else
    #define _ALS_SetVehicleParamsEx
#endif
#define	SetVehicleParamsEx pt_SetVehicleParamsEx

stock pt_CreateVehicle(model, Float:pos_x, Float:pos_y, Float:pos_z, Float:pos_r, col1, col2, respawn, siren = 0)
{
	new vehid = CreateVehicle(model, pos_x, pos_y, pos_z, pos_r, col1, col2, respawn, siren);
    if(vehid != INVALID_VEHICLE_ID)
	{
		vEngineState{vehid} = vEngineDefault;
		vEngineMode{vehid} = 0;
	}
	return vehid;
}
#if defined _ALS_CreateVehicle
    #undef CreateVehicle
#else
    #define _ALS_CreateVehicle
#endif
#define	CreateVehicle pt_CreateVehicle

stock pt_AddStaticVehicle(model, Float:pos_x, Float:pos_y, Float:pos_z, Float:pos_r, col1, col2)
{
	new vehid = AddStaticVehicle(model, pos_x, pos_y, pos_z, pos_r, col1, col2);
	if(vehid != INVALID_VEHICLE_ID)
	{
		vEngineState{vehid} = vEngineDefault;
		vEngineMode{vehid} = 0;
	}
	return vehid;
}
#if defined _ALS_AddStaticVehicle
    #undef AddStaticVehicle
#else
    #define _ALS_AddStaticVehicle
#endif
#define	AddStaticVehicle pt_AddStaticVehicle

stock pt_AddStaticVehicleEx(model, Float:pos_x, Float:pos_y, Float:pos_z, Float:pos_r, col1, col2, respawn, siren = 0)
{
	new vehid = AddStaticVehicleEx(model, pos_x, pos_y, pos_z, pos_r, col1, col2, respawn, siren);
	if(vehid != INVALID_VEHICLE_ID)
	{
		vEngineState{vehid} = vEngineDefault;
		vEngineMode{vehid} = 0;
	}
	return vehid;
}
#if defined _ALS_AddStaticVehicleEx
    #undef AddStaticVehicleEx
#else
    #define _ALS_AddStaticVehicleEx
#endif
#define	AddStaticVehicleEx pt_AddStaticVehicleEx
