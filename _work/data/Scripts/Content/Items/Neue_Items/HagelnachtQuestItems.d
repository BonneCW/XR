INSTANCE Packet_Lise (C_Item)
{
	name 				=	"ein volles Warenpaket";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION |ITEM_MULTI;

	value 				=	30;

	visual 				=	"ItMi_Packet.3ds";
	scemename			=	"MAPSEALED";
	material 			=	MAT_LEATHER;
	on_state[0]			=       Use_Packet_Lise;
	description			= 	"das Warenpaket eines Händlers";
	text[0]                         =       "Eine Packung, die wohl einem Händler";
	text[1]                         =       "geraubt wurde. Ich fand sie direkt";
	text[2]                         =       "unter dem Osttor der Stadt.";
	text[3]                         =       "Soll ich es zurückgeben oder behalten...?";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

    FUNC VOID Use_Packet_Lise ()
    {
    
	CreateInvItems (hero,ItMi_Stuff_Idol_Sleeper_01 ,1);
	CreateInvItems (hero,ItMi_Gold ,250);
	CreateInvItems (hero,ItPl_Speed_Herb_01 ,3);
	CreateInvItems (hero,ItWr_GolemBook1 ,1);
    };

INSTANCE Mod_RumPaket (C_Item)
{
	name 				=	"Rumpaket";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION |ITEM_MULTI;

	value 				=	500;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	description			= 	"ein Paket voller Rum";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE Mod_GrogPaket (C_Item)
{
	name 				=	"Grogpaket";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION |ITEM_MULTI;

	value 				=	500;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	description			= 	"ein Paket voller Grog";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE Mod_KleinodPaket (C_Item)
{
	name 				=	"Kleinodpaket";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION |ITEM_MULTI;

	value 				=	500;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	description			= 	"ein Paket voller Kleinod";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_Pat_Trank (C_Item)
{
	name 				=	"Paket voller Tränke";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION |ITEM_MULTI;

	value 				=	5000;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_Pat_Nahrung (C_Item)
{
	name 				=	"Paket mit Nahrung";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION |ITEM_MULTI;

	value 				=	5000;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};	