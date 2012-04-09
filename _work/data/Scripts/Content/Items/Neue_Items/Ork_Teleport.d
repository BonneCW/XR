INSTANCE ItArScrollTeleport4 (C_Item)
{
	name 				= NAME_Spruchrolle;

	mainflag 			= ITEM_KAT_RUNE;
	flags 				= ITEM_MULTI;

	visual				= "ItAr_Scroll_39.3DS";	//lila Punkt + gelber Punkt
	material			= MAT_STONE;

	spell				=	SPL_TELEPORT4;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_Cost_Teleport;

	description			= 	"orkischer Teleportzauber";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	0;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_Cost_Teleport;
};

INSTANCE ItArScrollTeleport5 (C_Item)
{
	name 				= NAME_Spruchrolle;

	mainflag 			= ITEM_KAT_RUNE;
	flags 				= ITEM_MULTI;

	visual				= "ItSc_Teleport.3DS";	//lila Punkt + gelber Punkt
	material			= MAT_STONE;

	spell				=	SPL_TELEPORT5;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_Cost_Teleport;

	description			= 	"Andokais Teleportspruchrolle";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	0;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_Cost_Teleport;
};

INSTANCE ItSc_TeleportXD (C_Item)
{
	name 				= NAME_Spruchrolle;

	mainflag 			= ITEM_KAT_RUNE;
	flags 				= ITEM_MULTI;

	visual				= "ItAr_Scroll_39.3DS";	//lila Punkt + gelber Punkt
	material			= MAT_STONE;

	spell				=	SPL_TELEPORTXD;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_Cost_Teleport;

	description			= 	"Vatras' Teleportspruchrolle";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	0;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_Cost_Teleport;
};