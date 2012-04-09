const int Shield_01_TProtEdge = 20;
const int Shield_01_TProtBlunt = 20;
const int Shield_01_TProtPoint = 20;
const int Shield_01_TProtFire = 20;
const int Shield_01_TProtMagic = 20;

instance ItAr_Shield_01 (C_Item)
{	
	name 				=	"Schild";
	
	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SHIELD;	
	
	value 				=	850;
	
	visual 				=	"schild_01.3DS";
	material 			=	MAT_METAL;
	
	on_equip            =   Shield_Equip_01;
	on_unequip          =   Shield_UnEquip_01;
	
	description			= 	name;
	
	TEXT[1]			= NAME_Prot_Magic;
	COUNT[1]		= Shield_01_TProtMagic;
	TEXT[2]			= NAME_Prot_Fire;
	COUNT[2]		= Shield_01_TProtFire;
	TEXT[3] 		= NAME_Prot_Point;
	COUNT[3]		= Shield_01_TProtPoint;
	TEXT[4]			= NAME_Prot_Edge;
	COUNT[4]		= Shield_01_TProtEdge;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
	
	// Inventar Ansicht an das Schild anpassen
	inv_rotx			=  1;
	inv_roty			=  0;
	inv_rotz			=  90;
	INV_ZBIAS			= 170;
	
};

func void Shield_Equip_01() {
	
	
};

func void Shield_UnEquip_01() {
	
	
};