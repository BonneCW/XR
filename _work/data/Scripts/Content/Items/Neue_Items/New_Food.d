INSTANCE ItFo_wineberrys_01(C_Item)
{	
	name 				=	"Weintrauben";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	8;

	visual 				=	"ItFo_wineberrys_01.3ds";
	on_state[0]         = 	Usewineberrys;  
	scemeName			=	"FOOD";

	description			= name;
	
	if (Mod_ItFo_Wineberrys_01_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	8;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= NAME_Value;					COUNT[5]	= 8;
};

	func void Usewineberrys () 
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	8);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		B_SetEsspunkte	(15);

		if (Mod_ItFo_wineberrys_01_Right == 0)
		&& (Npc_IsPlayer(self))
		{

			Mod_ItFo_wineberrys_01_Right = 1;

			Mod_ItFo_wineberrys_01_Anzahl = Npc_HasItems(hero, ItFo_wineberrys_01);
			Npc_RemoveInvItems (hero, ItFo_wineberrys_01, Mod_ItFo_wineberrys_01_Anzahl);
			CreateInvItems	(hero, ItFo_wineberrys_01, Mod_ItFo_wineberrys_01_Anzahl);
		};

		B_HealGift (0, 16);
	};

INSTANCE ItFo_MuttonRaw (C_Item)
{	
	name 				=	"Rohes Fleisch";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	1;
	
	visual 				=	"ItFoMuttonRaw.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"MEAT";
	on_state[0]			=	Use_MuttonRaw;

	description			= 	name;
	
	if (Mod_ItFo_MuttonRaw_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	6;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};
	
	TEXT[5]				= 	NAME_Value;			
	COUNT[5]			= 	value;

};

	FUNC VOID Use_MuttonRaw()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	6);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		B_SetEsspunkte	(35);

		if (Mod_ItFo_MuttonRaw_Right == 0)
		&& (Npc_IsPlayer(self))
		{

			Mod_ItFo_MuttonRaw_Right = 1;

			Mod_ItFo_MuttonRaw_Anzahl = Npc_HasItems(hero, ItFo_MuttonRaw);
			Npc_RemoveInvItems (hero, ItFo_MuttonRaw, Mod_ItFo_MuttonRaw_Anzahl);
			CreateInvItems	(hero, ItFo_MuttonRaw, Mod_ItFo_MuttonRaw_Anzahl);
		};

		B_HealGift (0, 12);
	};

INSTANCE ItFo_MuttonRaw_Scav (C_Item)
{	
	name 				=	"Fleisch eines Scavengers, der nicht aus einem Ei geschlüpft ist";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI|ITEM_SHOW;
	
	value 				=	1;
	
	visual 				=	"ItFoMuttonRaw.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;			
	COUNT[5]			= 	value;

};




INSTANCE ItFo_Mutton (C_Item)	//kommt aus Bratpfannen-Mobsi !!!
{	
	name 				=	"Gebratenes Fleisch";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	2;
	
	visual 				=	"ItFoMutton.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"MEAT";
	on_state[0]			=	Use_Mutton;

	description			= 	name;
	
	if (Mod_ItFo_Mutton_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	12;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		COUNT[5]	= value;

};

	FUNC VOID Use_Mutton()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	12);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		B_SetEsspunkte	(65);

		if (Mod_ItFo_Mutton_Right == 0)
		&& (Npc_IsPlayer(self))
		{

			Mod_ItFo_Mutton_Right = 1;

			Mod_ItFo_Mutton_Anzahl = Npc_HasItems(hero, ItFo_Mutton);
			Npc_RemoveInvItems (hero, ItFo_Mutton, Mod_ItFo_Mutton_Anzahl);
			CreateInvItems	(hero, ItFo_Mutton, Mod_ItFo_Mutton_Anzahl);
		};

		B_HealGift (0, 24);
	};

INSTANCE ItFo_LammPoekelfleisch (C_Item)
{	
	name 				=	"gepökeltes Lammfleisch";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	12;
	
	visual 				=	"ItFoMutton.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"MEAT";
	on_state[0]			=	Use_LammPoekelfleisch;

	description			= 	name;
	
	if (Mod_ItFo_LammPoekelfleisch_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	12;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		COUNT[5]	= value;

};

	FUNC VOID Use_LammPoekelfleisch()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	12);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		B_SetEsspunkte	(65);

		if (Mod_ItFo_LammPoekelfleisch_Right == 0)
		&& (Npc_IsPlayer(self))
		{

			Mod_ItFo_LammPoekelfleisch_Right = 1;

			Mod_ItFo_LammPoekelfleisch_Anzahl = Npc_HasItems(hero, ItFo_LammPoekelfleisch);
			Npc_RemoveInvItems (hero, ItFo_LammPoekelfleisch, Mod_ItFo_LammPoekelfleisch_Anzahl);
			CreateInvItems	(hero, ItFo_LammPoekelfleisch, Mod_ItFo_LammPoekelfleisch_Anzahl);
		};

		B_HealGift (0, 24);
	};


INSTANCE ItFo_Poekelfleisch_Skip (C_Item)
{	
	name 				=	"gepökeltes Fleisch";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	12;
	
	visual 				=	"ItFoMutton.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;

	TEXT[5]				= 	NAME_Value;		COUNT[5]	= value;

};