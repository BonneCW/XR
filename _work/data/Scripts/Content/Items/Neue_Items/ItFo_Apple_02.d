INSTANCE ItFo_Apple_02 (C_Item)
{	
	name 				=	"Manaapfel";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	20;
	
	visual 				=	"ItFo_Apple.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOOD";
	on_state[0]			=	Use_Apple_02;

	description			= 	name;
	
	TEXT[1]				= 	NAME_Bonus_HP;	
	COUNT[1]			= 	10;
	TEXT[2]				=	NAME_Bonus_ManaMax;
	COUNT[2]			=	5;
	
	
	TEXT[3]				=    "Ein seltener Manaapfel";
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	20;
};

	FUNC VOID Use_Apple_02()
	{

		B_SetEsspunkte	(20);			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	10);
		self.attribute[ATR_MANA_MAX] += 5;
		self.attribute[ATR_MANA] += 5;

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
	};

INSTANCE ItFo_Plants_Berrys_01(C_Item)
{	
	name 				=	"rote Waldbeeren";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	15;

	visual 				=	"ItFo_Plants_Berrys_01.3ds";
	material 			=	MAT_WOOD;
	on_state [0]		=   UseBerrys;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= 7;
	TEXT[5]				= NAME_Value;					COUNT[5]	= 15;
};

		func void UseBerrys ()
		{

		B_SetEsspunkte	(30);
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	7);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Beeren");

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
		};
