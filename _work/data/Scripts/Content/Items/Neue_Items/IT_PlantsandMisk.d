// ************************************************************************************************
// Zwei Pflazen für das Moor von Relendel
//
// 
// 
// ************************************************************************************************



/******************************************************************************************/
INSTANCE ItPl_Sumpfbeeren_XR (C_Item)
{	
	name 				=	"Sumpfbeeren";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Blueplant;

	visual 				=	"Sumpfbeere.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_Blueplant;
	scemeName			=	"FOOD";

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		
	COUNT[1]			= 	HP_Blueplant;
	TEXT[2]				= 	NAME_Bonus_Mana;		
	COUNT[2]			= 	Mana_Blueplant;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Blueplant;
};

	func void Use_Sumpfbeeren_XR ()
	{			
		Npc_ChangeAttribute	(self,	ATR_MANA,	    Mana_Blueplant);
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Blueplant);
	};

/******************************************************************************************/
INSTANCE ItPl_Mondauge_XR (C_Item)
{	
	name 				=	"Mondauge";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Blueplant;

	visual 				=	"Mondauge.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_Blueplant;
	scemeName			=	"FOOD";

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		
	COUNT[1]			= 	HP_Blueplant;
	TEXT[2]				= 	NAME_Bonus_Mana;		
	COUNT[2]			= 	Mana_Blueplant;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Blueplant;
};

	func void Use_Mondauge_XR ()
	{			
		Npc_ChangeAttribute	(self,	ATR_MANA,	    Mana_Blueplant);
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Blueplant);
	};






//---------------------------------------------------------------------
//	Kleiner Golddrache braucht noch ihrgendwo im Moor seinen Platz.
//---------------------------------------------------------------------
INSTANCE ItMi_GoldDrache(C_Item)
{
	name 		=	"Goldener Drache";

	mainflag 	=	ITEM_KAT_NONE;
	flags 		=	ITEM_MULTI;

	value 		=	2000;

	visual 		=	"Golddrache.3DS";
	material 	=	MAT_STONE;

	description	= 	name;
	
	TEXT[5]		= 	NAME_Value;	
	COUNT[5]	=	value;
	
	INV_ZBIAS	= INVCAM_ENTF_MISC2_STANDARD;
	
};



