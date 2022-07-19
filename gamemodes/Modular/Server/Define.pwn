/* Define & Macro */

#define forex(%0,%1) for(new %0 = 0; %0 < %1; %0++)

#define FUNC::%0(%1) forward %0(%1); public %0(%1)

#define COLOR_YELLOW 			0xFFFF00FF
#define COLOR_SERVER 			0x00FFFFFF
#define COLOR_GREY   			0xAFAFAFFF
#define COLOR_PURPLE 			0xD0AEEBFF
#define COLOR_CLIENT 			0xC6E2FFFF
#define COLOR_WHITE  			0xFFFFFFFF
#define COLOR_LIGHTRED    		0xFF6347FF

#define MAX_CHARS 3

#define DATABASE_ADDRESS "localhost" //Change this to your Database Address
#define DATABASE_USERNAME "root" // Change this to your database username
#define DATABASE_PASSWORD "" //Change this to your database password
#define DATABASE_NAME "basic"

#if !defined BCRYPT_HASH_LENGTH
	#define BCRYPT_HASH_LENGTH 250
#endif

#if !defined BCRYPT_COST
	#define BCRYPT_COST 12
#endif

#define SendServerMessage(%0,%1) \
	SendClientMessageEx(%0, 0x00FFFFFF, "SERVER:{FFFFFF} "%1)

#define SendSyntaxMessage(%0,%1) \
	SendClientMessageEx(%0, COLOR_GREY, "USAGE:{FFFFFF} "%1)
	
#define SendErrorMessage(%0,%1) \
	SendClientMessageEx(%0, COLOR_GREY, "ERROR: "%1)
	
#define MAX_PLAYER_VEHICLE 			1000
#define MAX_INVENTORY 				20
#define MAX_BUSINESS                100
#define MAX_DROPPED_ITEMS  			1000
#define MAX_RENTAL                  20
#define MAX_FACTIONS				10