INSTANCE ItRu_Altern	(C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	1500;

	visual				=	"ItRu_Beliar01.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_Altern;
	mag_circle 			=	5;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Altern";
	
	TEXT	[0]			=	NAME_Mag_Circle;
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_Altern;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};