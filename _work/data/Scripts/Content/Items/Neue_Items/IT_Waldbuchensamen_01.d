instance ItFo_Plants_Bloodwood_01 (C_ITEM)
{	
	name 					=	"Waldbuchensamen";

	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MULTI;	

	value 					=	5;

	visual 					=	"ItFo_Plants_Bloodwood_01.3ds";
	material 				=	MAT_WOOD;
	on_state[0]				=  Useblood;
	scemeName				=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_Mana;				COUNT[1]	= 5;
	TEXT[5]				= NAME_Value;					COUNT[5]	= 5;                          	
};
                                       
		func void Useblood ()
		{

		B_SetEsspunkte	(10);
			Npc_ChangeAttribute	(self,	ATR_MANA,	5);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Blutbuchensamen");
		};   
		
instance ItMi_SojaSchote (C_ITEM)
{	
	name 					=	"So-Ja-Schote";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	ITEM_MULTI;	

	value 					=	5;

	visual 					=	"ItFo_Plants_Bloodwood_01.3ds";
	material 				=	MAT_WOOD;

	description			= name;
	TEXT[5]				= NAME_Value;					COUNT[5]	= 5;                          	
};