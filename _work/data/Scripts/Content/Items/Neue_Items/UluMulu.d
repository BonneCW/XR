INSTANCE UluMulu(C_Item)
{	
	name 			=	"Ulu-Mulu";

	mainflag 		=	ITEM_KAT_NF;
	flags 			=	ITEM_2HD_AXE|ITEM_MISSION;	

	value 			=	1000;
	
	damageTotal		= 	30;
	damagetype		=	DAM_EDGE;
	range    		=  	140;		
	cond_atr[2]   	= 	ATR_STRENGTH;
	cond_value[2]  	= 	10;

	visual 			=	"ItMi_Amulet_Ulumulu_02.3ds";
	
	visual_skin 	=	0;
	material 		=	MAT_METAL;
	
	on_equip	=	Equip_uluMulu;
	on_unequip	=	UnEquip_UluMulu;

	description		=	name;
	TEXT[0]			=	"Das Ulu-Mulu ist ein Zeichen großer Stärke und";
	TEXT[1]			=	"Würde. Der Träger dieser Standarte hat vor";
	TEXT[2]			=	"Orks nichts zu befürchten!";
	TEXT[3]			=	NAME_Damage;			COUNT[3]	= damageTotal;
	TEXT[4] 		=	NAME_Str_needed;		COUNT[4]	= cond_value[2];
	TEXT[5]			=	NAME_Value; 			COUNT[5]	= value;
};

FUNC VOID Equip_UluMulu()
{
	//Mod_UluMulu = 1;

//	B_InitMonsterAttitudes ();
//	B_InitGuildAttitudes();
};

FUNC VOID UnEquip_UluMulu()
{
//	Mod_UluMulu = 0;

//	B_InitMonsterAttitudes ();
//	B_InitGuildAttitudes();
};