INSTANCE ITAR_PAL_H3 (C_Item)
{
	name 					=	"Paladinrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	150000;
	protection [PROT_BLUNT] = 	150000;
	protection [PROT_POINT] = 	150000;
	protection [PROT_FIRE] 	= 	100;
	protection [PROT_MAGIC] = 	50;

	value 					=	20000;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Pal_H3.3ds";
	visual_change 			=	"Armor_Pal_H3.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};