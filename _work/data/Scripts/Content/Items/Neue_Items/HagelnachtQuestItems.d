INSTANCE Packet_Lise (C_Item)
{
	name 				=	"pelny pakiet towarów";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION |ITEM_MULTI;

	value 				=	30;

	visual 				=	"ItMi_Packet.3ds";
	scemename			=	"MAPSEALED";
	material 			=	MAT_LEATHER;
	on_state[0]			=       Use_Packet_Lise;
	description			= 	"opakowanie towarowe detalisty";
	text[0]                         =       "Opakowanie, które musialo zostac sprzedane sprzedawcy detalicznemu";
	text[1]                         =       "zostal okradany. Znalazly je bezposrednio";
	text[2]                         =       "pod wschodnia brama miasta.";
	text[3]                         =       "Czy powinienem ja oddac lub zachowac?";
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
	name 				=	"pakiet podstawowy";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION |ITEM_MULTI;

	value 				=	500;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	description			= 	"paczke rumu";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE Mod_GrogPaket (C_Item)
{
	name 				=	"szamot";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION |ITEM_MULTI;

	value 				=	500;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	description			= 	"pakiet srodków ostroznosci";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE Mod_KleinodPaket (C_Item)
{
	name 				=	"maly";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION |ITEM_MULTI;

	value 				=	500;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	description			= 	"pakiet bizuteria";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_Pat_Trank (C_Item)
{
	name 				=	"Pakiet pelen eliksirów";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION |ITEM_MULTI;

	value 				=	5000;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_Pat_Nahrung (C_Item)
{
	name 				=	"Pakowanie z zywnoscia";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION |ITEM_MULTI;

	value 				=	5000;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};	
