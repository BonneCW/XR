INSTANCE ItAr_FinsternisPanzerhandschuh (C_Item)
{
	name					=	"Finsternis-Panzerhandschuhe";
	
	mainflag				=	ITEM_KAT_MAGIC;
	flags					=	ITEM_BELT;
	
	protection [PROT_EDGE]	=	40000;
	protection [PROT_BLUNT] = 	40000;
	protection [PROT_POINT] = 	40000;
	protection [PROT_FIRE] 	= 	5;
	protection [PROT_MAGIC] = 	20;

	value					=	0;

	visual					=	"Panzerhandschuhe.3ds";
	visual_skin				=	0;
	material				=	MAT_METAL;

	on_equip	= Equip_FinsternisPanzerhandschuh;
	on_unequip	= UnEquip_FinsternisPanzerhandschuh;

	description				=	name;

	TEXT[0]					=	"Diese Panzerhandschuhe sind durchtränkt von schwarzer Magie.";	

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

FUNC VOID Equip_FinsternisPanzerhandschuh()
{
	FinsternisPanzerhandschuh_Equipped = 1;
};

FUNC VOID UnEquip_FinsternisPanzerhandschuh()
{
	FinsternisPanzerhandschuh_Equipped = 0;
};