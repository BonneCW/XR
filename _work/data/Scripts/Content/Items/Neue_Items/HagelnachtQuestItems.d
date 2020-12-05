INSTANCE Packet_Lise (C_Item)
{
	name 				=	"a full package of goods";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION |ITEM_MULTI;

	value 				=	30;

	visual 				=	"ItMi_Packet.3ds";
	scemename			=	"MAPSEALED";
	material 			=	MAT_LEATHER;
	on_state[0]			=       Use_Packet_Lise;
	description			= 	"the goods package of a retailer";
	text[0]                         =       "A pack that must have been sold to a retailer";
	text[1]                         =       "was robbed. I found them directly";
	text[2]                         =       "under the east gate of the city.";
	text[3]                         =       "Should I give it back or keep it...?";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID Use_Packet_Lise () {
	CreateInvItems (hero,ItMi_Stuff_Idol_Sleeper_01 ,1);
	CreateInvItems (hero,ItMi_Gold ,250);
	CreateInvItems (hero,ItPl_Speed_Herb_01 ,3);
	CreateInvItems (hero,ItWr_GolemBook1 ,1);
	
	B_SetTopicStatus(TOPIC_MOD_LISELOTTESBEUTEL, LOG_FAILED);
};

INSTANCE Mod_RumPaket (C_Item)
{
	name 				=	"core package";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION |ITEM_MULTI;

	value 				=	500;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	description			= 	"a packet of rum";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE Mod_GrogPaket (C_Item)
{
	name 				=	"grog packet";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION |ITEM_MULTI;

	value 				=	500;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	description			= 	"groggy package";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE Mod_KleinodPaket (C_Item)
{
	name 				=	"small package";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION |ITEM_MULTI;

	value 				=	500;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	description			= 	"jewelry package";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_Pat_Trank (C_Item)
{
	name 				=	"Package full of potions";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION |ITEM_MULTI;

	value 				=	5000;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_Pat_Nahrung (C_Item)
{
	name 				=	"Package with food";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION |ITEM_MULTI;

	value 				=	5000;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};	
