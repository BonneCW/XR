// ************************************************************************************************
// Heilwirkung und Kosten von Nahrung
// ************************************************************************************************
// Mana_:	Gibt an wieviel Manapunkte das Kraut beim Essen wiedergibt
// HP_:		Gibt an wieviel Lebenspunkte das Kraut beim Essen wiedergibt
// ************************************************************************************************

const int   Value_Weed				= 	0;		
const int	Value_Beet				=	3;		const int	HP_Beet				=	2;
const int	Value_SwampHerb			=	10;
 const int	Value_Mana_Herb_01		=	10;		const int	Mana_Mana_Herb_01	=	10;
 const int	Value_Mana_Herb_02		=	20;		const int	Mana_Mana_Herb_02	=	15;
 const int	Value_Mana_Herb_03		=	40;		const int	Mana_Mana_Herb_03	=	20;
 const int	Value_Health_Herb_01	=	20;		const int	HP_Health_Herb_01	=	10;
 const int	Value_Health_Herb_02	=	40;		const int	HP_Health_Herb_02	=	20;
 const int	Value_Health_Herb_03	=	60;		const int	HP_Health_Herb_03	=	30;
 const int	Value_Dex_Herb_01		=	250;
 const int	Value_Strength_Herb_01	=	500;
 const int	Value_Speed_Herb_01		=	100;	const int  Speed_Boost			= 15000; //15 Sekunden

const int	Value_Mushroom_01		=	10;		const int	HP_Mushroom_01		=	5;
const int	Value_Mushroom_02		=	30;		const int	HP_Mushroom_02		=	15;
const int	HP_Riceplant		=	10;

const int	Value_Forestberry		=	10;		const int	HP_Forestberry		=	5;
const int	Value_Blueplant			=	10;		const int	HP_Blueplant		=	5;
												const int	Mana_Blueplant		=	5;
const int	Value_Planeberry		=	10;		const int	HP_Planeberry		=	5;

 const int	Value_Temp_Herb			=	50;		const int	HP_Temp_Herb		=	5;
 const int	Value_Perm_Herb			=	500;		const int	HP_Perm_Herb		=	5;

const int	Value_Trollkirsche	=	15;		const int	HP_Trollkirsche		=	-20;
const int	Value_Mendulus	=	100;

/******************************************************************************************/

INSTANCE ItPl_Weed(C_Item)
{	
	name 				=	"Unkraut";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Weed;

	visual 				=	"ItPl_Weed.3ds";
	material 			=	MAT_LEATHER;

	scemeName			=	"FOOD";

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Weed;
};

INSTANCE ItPl_Unkraut_Gorax (C_Item)
{	
	name 				=	"Unkraut";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI|ITEM_SHOW;	

	value 				=	Value_Weed;

	visual 				=	"ItPl_Weed.3ds";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Weed;
};

INSTANCE ItPl_Unkraut_Gildo (C_Item)
{	
	name 				=	"Unkraut";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI|ITEM_SHOW;	

	value 				=	Value_Weed;

	visual 				=	"ItPl_Weed.3ds";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Weed;
};

INSTANCE ItPl_Melone(C_Item)
{	
	name 				=	"Melone";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	10;

	visual 				=	"ItFo_Melone.3ds";
	material 			=	MAT_LEATHER;

	scemeName			=	"FOOD";
	on_state[0]			=	Use_Melone;

	description			= 	name;
	
	if (Mod_ItPl_Melone_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	15;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	10;
};

FUNC VOID Use_Melone()
{
	Npc_ChangeAttribute	(self, ATR_HITPOINTS, 15);

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

	B_HealGift (0, 30);

	if (Mod_ItPl_Melone_Right == 0)
	&& (Npc_IsPlayer(self))
	{
		Mod_ItPl_Melone_Right = 1;

		Mod_ItPl_Melone_Anzahl = Npc_HasItems(hero, ItPl_Melone);
		Npc_RemoveInvItems (hero, ItPl_Melone, Mod_ItPl_Melone_Anzahl);
		CreateInvItems	(hero, ItPl_Melone, Mod_ItPl_Melone_Anzahl);
	};
};

INSTANCE ItPl_Herkuleskraut (C_Item)
{	
	name 				=	"Herkuleskraut";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Weed;

	visual 				=	"ItPl_Herkuleskraut.3ds";
	material 			=	MAT_LEATHER;

	scemeName			=	"FOOD";

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Weed;
};

INSTANCE ItPl_Zwillingsdorn (C_Item)
{	
	name 				=	"Zwillingsdorn";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	50;

	visual 				=	"XR_Zwillingsdorn.3ds";
	material 			=	MAT_LEATHER;

	scemeName			=	"FOOD";
	on_state[0]			=	Use_Zwillingsdorn;

	description			= 	name;
	
	if (Mod_ItPl_Zwillingsdorn_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	50;
	
		TEXT[2]				= 	NAME_Bonus_MANA;		
		COUNT[2]			= 	50;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	value;
};

FUNC VOID Use_Zwillingsdorn()
{
	Npc_ChangeAttribute	(self, ATR_HITPOINTS, 50);
	Npc_ChangeAttribute	(self, ATR_MANA, 50);

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

	B_HealGift (0, 100);

	if (Mod_ItPl_Zwillingsdorn_Right == 0)
	&& (Npc_IsPlayer(self))
	{
		Mod_ItPl_Zwillingsdorn_Right = 1;

		Mod_ItPl_Zwillingsdorn_Anzahl = Npc_HasItems(hero, ItPl_Zwillingsdorn);
		Npc_RemoveInvItems (hero, ItPl_Zwillingsdorn, Mod_ItPl_Zwillingsdorn_Anzahl);
		CreateInvItems	(hero, ItPl_Zwillingsdorn, Mod_ItPl_Zwillingsdorn_Anzahl);
	};
};

INSTANCE MyxirsGiftpflanze(C_Item)
{	
	name 				=	"Myxirs Kraut";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI|ITEM_SHOW;	

	value 				=	Value_Weed;

	visual 				=	"ItPl_Weed.3ds";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[2]				=	"Wirkung unbekannt";

	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Weed;
};

/******************************************************************************************/

INSTANCE ItPl_Beet_Lobart_01 (C_Item)
{	
	name 				=	"Feldrübe";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Beet;

	visual 				=	"ItPl_Beet.3ds";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	if (Mod_ItPl_Beet_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Beet;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Beet;
};

INSTANCE ItPl_Beet_Lobart_02 (C_Item)
{	
	name 				=	"Feldrübe";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Beet;

	visual 				=	"ItPl_Beet.3ds";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	if (Mod_ItPl_Beet_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Beet;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Beet;
};

INSTANCE ItPl_Beet_Lobart_03 (C_Item)
{	
	name 				=	"Feldrübe";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Beet;

	visual 				=	"ItPl_Beet.3ds";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	if (Mod_ItPl_Beet_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Beet;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Beet;
};

INSTANCE ItPl_Beet_Lobart_04 (C_Item)
{	
	name 				=	"Feldrübe";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Beet;

	visual 				=	"ItPl_Beet.3ds";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	if (Mod_ItPl_Beet_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Beet;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Beet;
};

INSTANCE ItPl_Beet_Lobart_05 (C_Item)
{	
	name 				=	"Feldrübe";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Beet;

	visual 				=	"ItPl_Beet.3ds";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	if (Mod_ItPl_Beet_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Beet;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Beet;
};

INSTANCE ItPl_Beet_Lobart_06 (C_Item)
{	
	name 				=	"Feldrübe";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Beet;

	visual 				=	"ItPl_Beet.3ds";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	if (Mod_ItPl_Beet_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Beet;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Beet;
};

INSTANCE ItPl_Beet_Lobart_07 (C_Item)
{	
	name 				=	"Feldrübe";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Beet;

	visual 				=	"ItPl_Beet.3ds";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	if (Mod_ItPl_Beet_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Beet;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Beet;
};

INSTANCE ItPl_Beet_Lobart_08 (C_Item)
{	
	name 				=	"Feldrübe";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Beet;

	visual 				=	"ItPl_Beet.3ds";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	if (Mod_ItPl_Beet_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Beet;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Beet;
};

INSTANCE ItPl_Beet_Lobart_09 (C_Item)
{	
	name 				=	"Feldrübe";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Beet;

	visual 				=	"ItPl_Beet.3ds";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	if (Mod_ItPl_Beet_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Beet;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Beet;
};

INSTANCE ItPl_Beet_Lobart_10 (C_Item)
{	
	name 				=	"Feldrübe";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Beet;

	visual 				=	"ItPl_Beet.3ds";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	if (Mod_ItPl_Beet_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Beet;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Beet;
};

INSTANCE ItPl_Beet_Lobart_11 (C_Item)
{	
	name 				=	"Feldrübe";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Beet;

	visual 				=	"ItPl_Beet.3ds";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	if (Mod_ItPl_Beet_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Beet;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Beet;
};

INSTANCE ItPl_Beet_Lobart_12 (C_Item)
{	
	name 				=	"Feldrübe";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Beet;

	visual 				=	"ItPl_Beet.3ds";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	if (Mod_ItPl_Beet_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Beet;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Beet;
};

INSTANCE ItPl_Beet_Lobart_13 (C_Item)
{	
	name 				=	"Feldrübe";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Beet;

	visual 				=	"ItPl_Beet.3ds";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	if (Mod_ItPl_Beet_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Beet;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Beet;
};

INSTANCE ItPl_Beet_Lobart_14 (C_Item)
{	
	name 				=	"Feldrübe";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Beet;

	visual 				=	"ItPl_Beet.3ds";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	if (Mod_ItPl_Beet_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Beet;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Beet;
};

INSTANCE ItPl_Beet_Lobart_15 (C_Item)
{	
	name 				=	"Feldrübe";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Beet;

	visual 				=	"ItPl_Beet.3ds";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	if (Mod_ItPl_Beet_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Beet;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Beet;
};

INSTANCE ItPl_Beet_Lobart_16 (C_Item)
{	
	name 				=	"Feldrübe";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Beet;

	visual 				=	"ItPl_Beet.3ds";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	if (Mod_ItPl_Beet_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Beet;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Beet;
};

INSTANCE ItPl_Beet_Lobart_17 (C_Item)
{	
	name 				=	"Feldrübe";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Beet;

	visual 				=	"ItPl_Beet.3ds";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	if (Mod_ItPl_Beet_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Beet;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Beet;
};

INSTANCE ItPl_Beet_Lobart_18 (C_Item)
{	
	name 				=	"Feldrübe";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Beet;

	visual 				=	"ItPl_Beet.3ds";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	if (Mod_ItPl_Beet_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Beet;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Beet;
};

INSTANCE ItPl_Beet_Lobart_19 (C_Item)
{	
	name 				=	"Feldrübe";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Beet;

	visual 				=	"ItPl_Beet.3ds";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	if (Mod_ItPl_Beet_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Beet;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Beet;
};

INSTANCE ItPl_Beet_Lobart_20 (C_Item)
{	
	name 				=	"Feldrübe";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Beet;

	visual 				=	"ItPl_Beet.3ds";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	if (Mod_ItPl_Beet_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Beet;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Beet;
};

INSTANCE ItPl_Beet (C_Item)
{	
	name 				=	"Feldrübe";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Beet;

	visual 				=	"ItPl_Beet.3ds";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_Beet;
	scemeName			=	"FOOD";

	description			= 	name;
	
	if (Mod_ItPl_Beet_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Beet;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Beet;
};

func void Use_Beet ()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Beet);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		if (Mod_ItPl_Beet_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItPl_Beet_Right = 1;

			Mod_ItPl_Beet_Anzahl = Npc_HasItems(hero, ItPl_Beet);
			Npc_RemoveInvItems (hero, ItPl_Beet, Mod_ItPl_Beet_Anzahl);
			CreateInvItems	(hero, ItPl_Beet, Mod_ItPl_Beet_Anzahl);
		};

		B_HealGift (0, HP_Beet*2);
	};

INSTANCE ItPl_Heilknospe (C_Item)
{	
	name 				=	"Heilknospe";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	100;

	visual 				=	"Napalms_Plant.3ds";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_Heilknospe;
	scemeName			=	"FOOD";

	description			= 	name;
	
	if (Mod_ItPl_Heilknospe_Right == 1)
	{
		TEXT[1]				= 	"Lebensenergie (in %):";	
		COUNT[1]			= 	20;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	value;
};

func void Use_Heilknospe ()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	(hero.attribute[ATR_HITPOINTS_MAX]/5));

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		if (Mod_ItPl_Heilknospe_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItPl_Heilknospe_Right = 1;

			HP_Heilknospe = hero.attribute[ATR_HITPOINTS_MAX] / 5;

			Mod_ItPl_Heilknospe_Anzahl = Npc_HasItems(hero, ItPl_Heilknospe);
			Npc_RemoveInvItems (hero, ItPl_Heilknospe, Mod_ItPl_Heilknospe_Anzahl);
			CreateInvItems	(hero, ItPl_Heilknospe, Mod_ItPl_Heilknospe_Anzahl);
		};

		B_HealGift (-1, 60);
	};
/******************************************************************************************/	
INSTANCE ItPl_SwampHerb(C_Item)
{	
	name 				=	"Sumpfkraut";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_SwampHerb;

	visual 				=	"ItPl_SwampHerb.3ds";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_SwampHerb;
	scemeName			=	"FOOD";

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_SwampHerb;
};
	
	func void Use_SwampHerb ()
	{
		if (Npc_IsPlayer (self))
		{
			Wld_PlayEffect ("SLOW_TIME", self, self, 0, 0, 0, FALSE);
		};
	};
/******************************************************************************************/	
INSTANCE ItPl_Riceplant(C_Item)
{	
	name 				=	"Reispflanze";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_SwampHerb;

	visual 				=	"ItPl_Riceplant.3ds";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_Riceplant;
	scemeName			=	"FOOD";

	description			= 	name;
	
	if (Mod_ItPl_Riceplant_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Riceplant;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_SwampHerb;
};
	
	func void Use_Riceplant ()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Riceplant);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		if (Mod_ItPl_Riceplant_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItPl_Riceplant_Right = 1;

			Mod_ItPl_Riceplant_Anzahl = Npc_HasItems(hero, ItPl_Riceplant);
			Npc_RemoveInvItems (hero, ItPl_Riceplant, Mod_ItPl_Riceplant_Anzahl);
			CreateInvItems	(hero, ItPl_Riceplant, Mod_ItPl_Riceplant_Anzahl);
		};

		B_HealGift (0, HP_Riceplant*2);
	};

/******************************************************************************************/
INSTANCE ItPl_Mana_Herb_01(C_Item)
{	
	name 				=	"Feuernessel";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Mana_Herb_01;

	visual 				=	"ItPl_Mana_Herb_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_Mana_Herb_01;
	scemeName			=	"FOOD";

	description			= 	name;
	
	if (Mod_ItPl_Mana_Herb_01_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_Mana;	
		COUNT[1]			= 	Mana_Mana_Herb_01;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Mana_Herb_01;
};

	func void Use_Mana_Herb_01 ()
	{			
		Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Mana_Herb_01);

		if (Mod_ItPl_Mana_Herb_01_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItPl_Mana_Herb_01_Right = 1;

			Mod_ItPl_Mana_Herb_01_Anzahl = Npc_HasItems(hero, ItPl_Mana_Herb_01);
			Npc_RemoveInvItems (hero, ItPl_Mana_Herb_01, Mod_ItPl_Mana_Herb_01_Anzahl);
			CreateInvItems	(hero, ItPl_Mana_Herb_01, Mod_ItPl_Mana_Herb_01_Anzahl);
		};
	};
/******************************************************************************************/
INSTANCE ItPl_Mana_Herb_02(C_Item)
{	
	name 				=	"Feuerkraut";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Mana_Herb_02;

	visual 				=	"ItPl_Mana_Herb_02.3ds";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_Mana_Herb_02;
	scemeName			=	"FOOD";

	description			= 	name;
	
	if (Mod_ItPl_Mana_Herb_02_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_Mana;	
		COUNT[1]			= 	Mana_Mana_Herb_02;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Mana_Herb_02;
};

	func void Use_Mana_Herb_02 ()
	{			
		Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Mana_Herb_02);

		if (Mod_ItPl_Mana_Herb_02_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItPl_Mana_Herb_02_Right = 1;

			Mod_ItPl_Mana_Herb_02_Anzahl = Npc_HasItems(hero, ItPl_Mana_Herb_02);
			Npc_RemoveInvItems (hero, ItPl_Mana_Herb_02, Mod_ItPl_Mana_Herb_02_Anzahl);
			CreateInvItems	(hero, ItPl_Mana_Herb_02, Mod_ItPl_Mana_Herb_02_Anzahl);
		};
	};
/******************************************************************************************/
INSTANCE ItPl_Mana_Herb_03(C_Item)
{	
	name 				=	"Feuerwurzel";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Mana_Herb_03;

	visual 				=	"ItPl_Mana_Herb_03.3ds";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_Mana_Herb_03;
	scemeName			=	"FOOD";

	description			= 	name;
	
	if (Mod_ItPl_Mana_Herb_03_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_Mana;	
		COUNT[1]			= 	Mana_Mana_Herb_03;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Mana_Herb_03;
};

	func void Use_Mana_Herb_03 ()
	{			
		Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Mana_Herb_03);

		if (Mod_ItPl_Mana_Herb_03_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItPl_Mana_Herb_03_Right = 1;

			Mod_ItPl_Mana_Herb_03_Anzahl = Npc_HasItems(hero, ItPl_Mana_Herb_03);
			Npc_RemoveInvItems (hero, ItPl_Mana_Herb_03, Mod_ItPl_Mana_Herb_03_Anzahl);
			CreateInvItems	(hero, ItPl_Mana_Herb_03, Mod_ItPl_Mana_Herb_03_Anzahl);
		};
	};
/******************************************************************************************/
INSTANCE ItPl_Mendulus(C_Item)
{	
	name 				=	"Menduluskraut";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Mendulus;

	visual 				=	"ItPl_Mendulus.3ds";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_Mendulus;
	scemeName			=	"FOOD";

	description			= 	name;
	
	if (Mod_ItPl_Mendulus_Right == 1)
	{
		TEXT[1]				= 	"Vollständige Regeneration";	
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Mendulus;
};

	func void Use_Mendulus ()
	{			
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		if (Mod_ItPl_Mendulus_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItPl_Mendulus_Right = 1;

			Mod_ItPl_Mendulus_Anzahl = Npc_HasItems(hero, ItPl_Mendulus);
			Npc_RemoveInvItems (hero, ItPl_Mendulus, Mod_ItPl_Mendulus_Anzahl);
			CreateInvItems	(hero, ItPl_Mendulus, Mod_ItPl_Mendulus_Anzahl);
		};
	};
/******************************************************************************************/
INSTANCE ItPl_Health_Herb_01(C_Item)
{	
	name 				=	"Heilpflanze";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Health_Herb_01;

	visual 				=	"ItPl_Health_Herb_01.3DS";

	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_Health_Herb_01;
	scemeName			=	"FOOD";

	description			= 	name;
	
	if (Mod_ItPl_Health_Herb_01_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Health_Herb_01;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Health_Herb_01;
};

	func void Use_Health_Herb_01 ()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Health_Herb_01);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		if (Mod_ItPl_Health_Herb_01_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItPl_Health_Herb_01_Right = 1;

			Mod_ItPl_Health_Herb_01_Anzahl = Npc_HasItems(hero, ItPl_Health_Herb_01);
			Npc_RemoveInvItems (hero, ItPl_Health_Herb_01, Mod_ItPl_Health_Herb_01_Anzahl);
			CreateInvItems	(hero, ItPl_Health_Herb_01, Mod_ItPl_Health_Herb_01_Anzahl);
		};

		B_HealGift (0, 60);
	};


/******************************************************************************************/
INSTANCE ItPl_Health_Herb_01_Reisfresser(C_Item)
{	
	name 				=	"Reisfressende Heilpflanze vom Reislord";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI|ITEM_SHOW;	

	value 				=	Value_Health_Herb_01;

	visual 				=	"ItPl_Health_Herb_01.3DS";

	material 			=	MAT_LEATHER;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Health_Herb_01;
};
/******************************************************************************************/
INSTANCE ItPl_Health_Herb_02(C_Item)
{	
	name 				=	"Heilkraut";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Health_Herb_02;

	visual 				=	"ItPl_Health_Herb_02.3DS";

	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_Health_Herb_02;
	scemeName			=	"FOOD";

	description			= 	name;
	
	if (Mod_ItPl_Health_Herb_02_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Health_Herb_02;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Health_Herb_02;
};

	func void Use_Health_Herb_02 ()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Health_Herb_02);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		if (Mod_ItPl_Health_Herb_02_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItPl_Health_Herb_02_Right = 1;

			Mod_ItPl_Health_Herb_02_Anzahl = Npc_HasItems(hero, ItPl_Health_Herb_02);
			Npc_RemoveInvItems (hero, ItPl_Health_Herb_02, Mod_ItPl_Health_Herb_02_Anzahl);
			CreateInvItems	(hero, ItPl_Health_Herb_02, Mod_ItPl_Health_Herb_02_Anzahl);
		};

		B_HealGift (0, 120);
	};

/******************************************************************************************/
INSTANCE ItPl_Health_Herb_03(C_Item)
{	
	name 				=	"Heilwurzel";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Health_Herb_03;

	visual 				=	"ItPl_Health_Herb_03.3DS";

	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_Health_Herb_03;
	scemeName			=	"FOOD";

	description			= 	name;
	
	if (Mod_ItPl_Health_Herb_03_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Health_Herb_03;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Health_Herb_03;
};

	func void Use_Health_Herb_03 ()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Health_Herb_03);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		if (Mod_ItPl_Health_Herb_03_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItPl_Health_Herb_03_Right = 1;

			Mod_ItPl_Health_Herb_03_Anzahl = Npc_HasItems(hero, ItPl_Health_Herb_03);
			Npc_RemoveInvItems (hero, ItPl_Health_Herb_03, Mod_ItPl_Health_Herb_03_Anzahl);
			CreateInvItems	(hero, ItPl_Health_Herb_03, Mod_ItPl_Health_Herb_03_Anzahl);
		};

		B_HealGift (0, 180);
	};

/******************************************************************************************/
INSTANCE ItPl_Dex_Herb_01(C_Item)
{	
	name 				=	"Goblin-Beeren";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Dex_Herb_01;

	visual 				=	"ItPl_Dex_Herb_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_Dex_Herb_01;
	scemeName			=	"FOOD";

	description			= 	name;
	
	if (Mod_ItPl_Dex_Herb_01_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_Dex;	
		COUNT[1]			= 	1;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};	
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Dex_Herb_01;
};
	FUNC VOID USE_Dex_Herb_01 ()
	{			
		B_RaiseAttribute_Rest	(self,	ATR_DEXTERITY,	1);

		if (Mod_ItPl_Dex_Herb_01_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItPl_Dex_Herb_01_Right = 1;

			Mod_ItPl_Dex_Herb_01_Anzahl = Npc_HasItems(hero, ItPl_Dex_Herb_01);
			Npc_RemoveInvItems (hero, ItPl_Dex_Herb_01, Mod_ItPl_Dex_Herb_01_Anzahl);
			CreateInvItems	(hero, ItPl_Dex_Herb_01, Mod_ItPl_Dex_Herb_01_Anzahl);
		};
	};

/******************************************************************************************/
INSTANCE ItPl_Strength_Herb_01(C_Item)
{	
	name 				=	"Drachenwurzel";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Strength_Herb_01;

	visual 				=	"ItPl_Strength_Herb_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_Strength_Herb_01;
	scemeName			=	"FOOD";

	description			= 	name;
	
	if (Mod_ItPl_Str_Herb_01_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_Str;	
		COUNT[1]			= 	1;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Strength_Herb_01;
};


	FUNC VOID USE_Strength_Herb_01 ()
	{			
		B_RaiseAttribute_Rest	(self,	ATR_STRENGTH,	1);

		if (Mod_ItPl_Str_Herb_01_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItPl_Str_Herb_01_Right = 1;

			Mod_ItPl_Str_Herb_01_Anzahl = Npc_HasItems(hero, ItPl_Strength_Herb_01);
			Npc_RemoveInvItems (hero, ItPl_Strength_Herb_01, Mod_ItPl_Str_Herb_01_Anzahl);
			CreateInvItems	(hero, ItPl_Strength_Herb_01, Mod_ItPl_Str_Herb_01_Anzahl);
		};
	};
	
/******************************************************************************************/
INSTANCE ItPl_Speed_Herb_01(C_Item)
{	
	name 				=	"Snapperkraut";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Speed_Herb_01;

	visual 				=	"ItPl_Speed_Herb_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_Speed_Herb_01;      
	scemeName			=	"FOOD";
	
	description			= 	name;
	
	if (Mod_ItPl_Speed_Herb_01_Right == 1)
	{
		TEXT[3]				= 	NAME_Sec_Duration;	
		COUNT[3]			= 	Speed_Boost;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Speed_Herb_01;
 
	   
};  

	func void Use_Speed_Herb_01 ()                                               
	{			
		Mdl_ApplyOverlayMDSTimed	(self,	"HUMANS_SPRINT.MDS",	Speed_Boost);

		if (Mod_ItPl_Speed_Herb_01_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItPl_Speed_Herb_01_Right = 1;

			Mod_ItPl_Speed_Herb_01_Anzahl = Npc_HasItems(hero, ItPl_Speed_Herb_01);
			Npc_RemoveInvItems (hero, ItPl_Speed_Herb_01, Mod_ItPl_Speed_Herb_01_Anzahl);
			CreateInvItems	(hero, ItPl_Speed_Herb_01, Mod_ItPl_Speed_Herb_01_Anzahl);
		};  
	};	
  	
  	
  	  
/******************************************************************************************/
INSTANCE ItPl_Mushroom_03(C_Item)
{	
	name 				=	"Fliegenpilz";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Mushroom_01;

	visual 				=	"Fliegenpilz.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_Mushroom_03;
	scemeName			=	"FOOD";

	description			= 	name;
	
	if (Mod_ItPl_Fliegenpilz_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	30;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};	
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Mushroom_01;
};

	func void Use_Mushroom_03 ()
	{	
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	30);	

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];	

		if (Pilzgift < 4)
		{
			if (Gift == 0)
			{
				Mod_Fliegenpilzgift = 1;
			}
			else
			{
				if (Hlp_Random(100) < 100-(Gift*25))
				{
					Mod_Fliegenpilzgift = 1;
				};
				
			 };
		};

		Fliegenpilz_Gegessen += 1;

		if (Fliegenpilz_Gegessen == 13)
		{
			PrintScreen	("Deine Widerstandskraft gegen magische Angriffe ist gewachsen.", -1, -1, FONT_SCREEN, 2);

			hero.protection[PROT_MAGIC] += 20;
		};

		B_HealGift (0, 60);

		if (Mod_ItPl_Fliegenpilz_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItPl_Fliegenpilz_Right = 1;

			Mod_ItPl_Fliegenpilz_Anzahl = Npc_HasItems(hero, ItPl_Mushroom_03);
			Npc_RemoveInvItems (hero, ItPl_Mushroom_03, Mod_ItPl_Fliegenpilz_Anzahl);
			CreateInvItems	(hero, ItPl_Mushroom_03, Mod_ItPl_Fliegenpilz_Anzahl);
		};
	};

INSTANCE ItPl_Mushroom_01(C_Item)
{	
	name 				=	"Dunkelpilz";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Mushroom_01;

	visual 				=	"ItPl_Mushroom_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_Mushroom_01;
	scemeName			=	"FOOD";

	description			= 	name;
	
	if (Mod_ItPl_Mushroom_01_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Mushroom_01;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Mushroom_01;
};

	func void Use_Mushroom_01 ()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Mushroom_01);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		B_SetEsspunkte	(35);

		if (Mod_ItPl_Mushroom_01_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItPl_Mushroom_01_Right = 1;

			Mod_ItPl_Mushroom_01_Anzahl = Npc_HasItems(hero, ItPl_Mushroom_01);
			Npc_RemoveInvItems (hero, ItPl_Mushroom_01, Mod_ItPl_Mushroom_01_Anzahl);
			CreateInvItems	(hero, ItPl_Mushroom_01, Mod_ItPl_Mushroom_01_Anzahl);
		};
		
		if (Npc_IsPlayer (self))
		{
			Dunkelpilz_Bonus = Dunkelpilz_Bonus + 1;
		
			if (Dunkelpilz_Bonus >= 100)  
			{
				B_RaiseAttribute_Rest	(self, ATR_MANA_MAX, 1);
				Npc_ChangeAttribute	(self, ATR_MANA, 1);
				Snd_Play	("LevelUp");
				Dunkelpilz_Bonus -= 100;
			};

			B_HealGift (0, HP_Mushroom_01*2);
		};
	};

INSTANCE ItPl_Mushroom_04(C_Item)
{	
	name 				=	"Fungo";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Mushroom_01*2;

	visual 				=	"ItPl_Mushroom_04.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_Mushroom_04;
	scemeName			=	"FOOD";

	description			= 	name;
	
	if (Mod_ItPl_Mushroom_04_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Mushroom_01*2;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Mushroom_01*2;
};

	func void Use_Mushroom_04 ()
	{		
		Mod_FungoGift = 1;

		Mod_FungoGift_Counter = 120;
	};
/******************************************************************************************/
INSTANCE ItPl_Mushroom_02(C_Item)
{	
	name 				=	"Buddlerfleisch";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Mushroom_02;

	visual 				=	"ItPl_Mushroom_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_Mushroom_02;
	scemeName			=	"FOOD";

	description			= 	name;
	
	if (Mod_ItPl_Mushroom_02_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Mushroom_02;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			=	Value_Mushroom_02;
};

	func void Use_Mushroom_02 ()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Mushroom_02);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		B_SetEsspunkte	(65);

		if (Mod_ItPl_Mushroom_02_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItPl_Mushroom_02_Right = 1;

			Mod_ItPl_Mushroom_02_Anzahl = Npc_HasItems(hero, ItPl_Mushroom_02);
			Npc_RemoveInvItems (hero, ItPl_Mushroom_02, Mod_ItPl_Mushroom_02_Anzahl);
			CreateInvItems	(hero, ItPl_Mushroom_02, Mod_ItPl_Mushroom_02_Anzahl);
		};
		
		if (Npc_IsPlayer (self))
		{
			Dunkelpilz_Bonus = Dunkelpilz_Bonus + 2;
		
			if (Dunkelpilz_Bonus >= 100)  
			{
				B_RaiseAttribute_Rest	(self, ATR_MANA_MAX, 1);
				Npc_ChangeAttribute	(self, ATR_MANA, 1);
				Snd_Play	("LevelUp");
				Dunkelpilz_Bonus -= 100;
			};

			B_HealGift (0, HP_Mushroom_02*2);

			Mod_Buddlerfleisch_Counter += 1;

			if (Mod_Buddlerfleisch_Counter == 100)
			{
				hero.protection[PROT_MAGIC] += 2;
			}
			else if (Mod_Buddlerfleisch_Counter == 300)
			{
				hero.protection[PROT_MAGIC] += 3;
			};
		};
	};
/******************************************************************************************/
INSTANCE ItPl_Blueplant(C_Item)
{	
	name 				=	"Blauflieder";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Blueplant;

	visual 				=	"ItPl_Blueplant.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_Blueplant;
	scemeName			=	"FOOD";

	description			= 	name;
	
	if (Mod_ItPl_Blueplant_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Blueplant;
		TEXT[2]				= 	NAME_Bonus_Mana;	
		COUNT[2]			= 	Mana_Blueplant;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Blueplant;
};

	func void Use_Blueplant ()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Blueplant);
		Npc_ChangeAttribute	(self, 	ATR_MANA,	Mana_Blueplant);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		if (Mod_ItPl_Blueplant_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItPl_Blueplant_Right = 1;

			Mod_ItPl_Blueplant_Anzahl = Npc_HasItems(hero, ItPl_Blueplant);
			Npc_RemoveInvItems (hero, ItPl_Blueplant, Mod_ItPl_Blueplant_Anzahl);
			CreateInvItems	(hero, ItPl_Blueplant, Mod_ItPl_Blueplant_Anzahl);
		};

		B_HealGift (0, HP_Blueplant*2);
	};
/******************************************************************************************/
INSTANCE ItPl_Forestberry (C_Item)
{	
	name 				=	"Waldbeere";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Forestberry;
	
	visual 				=	"ItPl_Forestberry.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOOD";
	on_state[0]			=	Use_Forestberry;

	description			= 	name;
	
	if (Mod_ItPl_Forestberry_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Forestberry;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Forestberry;

};

	FUNC VOID Use_Forestberry()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Forestberry);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		if (Mod_ItPl_Forestberry_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItPl_Forestberry_Right = 1;

			Mod_ItPl_Forestberry_Anzahl = Npc_HasItems(hero, ItPl_Forestberry);
			Npc_RemoveInvItems (hero, ItPl_Forestberry, Mod_ItPl_Forestberry_Anzahl);
			CreateInvItems	(hero, ItPl_Forestberry, Mod_ItPl_Forestberry_Anzahl);
		};

		B_HealGift (0, HP_Forestberry*2);

		Mod_Waldbeere_Counter += 1;

		if (Mod_Waldbeere_Counter == 100)
		{
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS_MAX,	3);
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	3);

			self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
		}
		else if (Mod_Waldbeere_Counter == 300)
		{
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS_MAX,	5);
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	5);

			self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
		};
	};
/******************************************************************************************/
INSTANCE ItPl_Mithrida (C_Item)
{	
	name 				=	"Mithrida";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Forestberry;
	
	visual 				=	"ItPl_Mithrida.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOOD";
	on_state[0]			=	Use_Mithrida;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Forestberry;

};

	FUNC VOID Use_Mithrida()
	{			
		Mod_MithridaGift = 1;

		Mod_MithridaGift_Counter = 150;
	};
/******************************************************************************************/
INSTANCE ItPl_Ponzola (C_Item)
{	
	name 				=	"Ponzola";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Forestberry;
	
	visual 				=	"ItPl_Ponzola.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOOD";
	on_state[0]			=	Use_Ponzola;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Forestberry;

};

	FUNC VOID Use_Ponzola()
	{			
		Mod_PonzolaGift = 1;

		Mod_PonzolaGift_Counter = 200;
	};
/******************************************************************************************/
INSTANCE ItPl_Venena (C_Item)
{	
	name 				=	"Venena";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Forestberry;
	
	visual 				=	"ItPl_Venena.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOOD";
	on_state[0]			=	Use_Venena;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Forestberry;

};

	FUNC VOID Use_Venena()
	{			
		Mod_VenenaGift = 1;

		Mod_VenenaGift_Counter = 60;
	};
/******************************************************************************************/
INSTANCE ItPl_Piante (C_Item)
{	
	name 				=	"Piante";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Forestberry;
	
	visual 				=	"ItPl_Piante.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOOD";
	on_state[0]			=	Use_Piante;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Forestberry;

};

	FUNC VOID Use_Piante()
	{			
		Mod_PianteGift = 1;

		Mod_PianteGift_Counter = 90;
	};
/******************************************************************************************/
INSTANCE ItPl_Planeberry (C_Item)
{	
	name 				=	"Weidenbeere";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Planeberry;
	
	visual 				=	"ItPl_Planeberry.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOOD";
	on_state[0]			=	Use_Planeberry;

	description			= 	name;
	
	if (Mod_ItPl_Planeberry_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Planeberry;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Planeberry;

};

	FUNC VOID Use_Planeberry()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Planeberry);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		if (Mod_ItPl_Planeberry_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItPl_Planeberry_Right = 1;

			Mod_ItPl_Planeberry_Anzahl = Npc_HasItems(hero, ItPl_Planeberry);
			Npc_RemoveInvItems (hero, ItPl_Planeberry, Mod_ItPl_Planeberry_Anzahl);
			CreateInvItems	(hero, ItPl_Planeberry, Mod_ItPl_Planeberry_Anzahl);
		};

		B_HealGift (0, HP_Planeberry*2);

		Mod_Weidenbeere_Counter += 1;

		if (Mod_Weidenbeere_Counter == 100)
		{
			Npc_ChangeAttribute	(self,	ATR_DEXTERITY,	1);
		}
		else if (Mod_Weidenbeere_Counter == 300)
		{
			Npc_ChangeAttribute	(self,	ATR_DEXTERITY,	3);
		};
	};
/******************************************************************************************/


//******************************************************************************************
//		Pflanze zum brauen von temporären und permanten Tränken
//******************************************************************************************


INSTANCE ItPl_Temp_Herb(C_Item)
{	
	name 				=	"Feldknöterich";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI|ITEM_MISSION;	

	value 				=	Value_Temp_Herb;

	visual 				=	"ItPl_Temp_Herb.3ds";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOOD";
	on_state[0]			=	Use_Temp_Herb;

	description			= 	name;
	
	if (Mod_ItPl_Temp_Herb_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Temp_Herb;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Temp_Herb;
};
	FUNC VOID Use_Temp_Herb()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Temp_Herb);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		if (Mod_ItPl_Temp_Herb_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItPl_Temp_Herb_Right = 1;

			Mod_ItPl_Temp_Herb_Anzahl = Npc_HasItems(hero, ItPl_Temp_Herb);
			Npc_RemoveInvItems (hero, ItPl_Temp_Herb, Mod_ItPl_Temp_Herb_Anzahl);
			CreateInvItems	(hero, ItPl_Temp_Herb, Mod_ItPl_Temp_Herb_Anzahl);
		};

		B_HealGift (0, HP_Temp_Herb*2);
	};


INSTANCE ItPl_Perm_Herb(C_Item)
{	
	name 				=	"Kronstöckel";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI|ITEM_MISSION;	

	value 				=	Value_Perm_Herb;

	visual 				=	"ItPl_Perm_Herb.3ds";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOOD";
	on_state[0]			=	Use_Perm_Herb;

	description			= 	name;
	
	if (Mod_ItPl_Perm_Herb_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Perm_Herb;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Perm_Herb;
};
	FUNC VOID Use_Perm_Herb()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Perm_Herb);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		if (Mod_ItPl_Perm_Herb_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItPl_Perm_Herb_Right = 1;

			Mod_ItPl_Perm_Herb_Anzahl = Npc_HasItems(hero, ItPl_Perm_Herb);
			Npc_RemoveInvItems (hero, ItPl_Perm_Herb, Mod_ItPl_Perm_Herb_Anzahl);
			CreateInvItems	(hero, ItPl_Perm_Herb, Mod_ItPl_Perm_Herb_Anzahl);
		};

		B_HealGift (0, HP_Perm_Herb*2);
	};


INSTANCE ItPl_Rabenkraut(C_Item)
{	
	name 				=	"Rabenkraut";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI|ITEM_MISSION;	

	value 				=	Value_Health_Herb_03;

	visual 				=	"ItPl_Perm_Herb.3ds";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOOD";
	on_state[0]			=	Use_Rabenkraut;

	description			= 	name;
	
	if (Mod_ItPl_Rabenkraut_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Health_Herb_03;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Health_Herb_03;
};
	FUNC VOID Use_Rabenkraut()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Health_Herb_03);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		B_HealGift (0, HP_Health_Herb_03*2);

		if (Mod_ItPl_Rabenkraut_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItPl_Rabenkraut_Right = 1;

			Mod_ItPl_Rabenkraut_Anzahl = Npc_HasItems(hero, ItPl_Rabenkraut);
			Npc_RemoveInvItems (hero, ItPl_Rabenkraut, Mod_ItPl_Rabenkraut_Anzahl);
			CreateInvItems	(hero, ItPl_Rabenkraut, Mod_ItPl_Rabenkraut_Anzahl);
		};
	};


INSTANCE ItPl_Mondschatten(C_Item)
{	
	name 				=	"Mondschatten";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI|ITEM_MISSION;	

	value 				=	Value_Health_Herb_03;

	visual 				=	"ItPl_Perm_Herb.3ds";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOOD";
	on_state[0]			=	Use_Mondschatten;

	description			= 	name;
	
	if (Mod_ItPl_Mondschatten_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Health_Herb_03;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Health_Herb_03;
};
	FUNC VOID Use_Mondschatten()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Health_Herb_03);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		B_HealGift (0, HP_Health_Herb_03*2);

		if (Mod_ItPl_Mondschatten_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItPl_Mondschatten_Right = 1;

			Mod_ItPl_Mondschatten_Anzahl = Npc_HasItems(hero, ItPl_Mondschatten);
			Npc_RemoveInvItems (hero, ItPl_Mondschatten, Mod_ItPl_Mondschatten_Anzahl);
			CreateInvItems	(hero, ItPl_Mondschatten, Mod_ItPl_Mondschatten_Anzahl);
		};
	};


INSTANCE ItPl_Trollkirsche (C_Item)
{	
	name 					=	"Trollkirsche";

	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MULTI;	

	value 					=	Value_Trollkirsche;

	visual 					=	"ItFo_Plants_Trollberrys_01.3ds";
	material 				=	MAT_WOOD;
	on_state [0]			=   UseTrollberrys;
	scemeName				=	"FOOD";

	description			= name;
	
	if (Mod_ItPl_Trollkirsche_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Trollkirsche;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Trollkirsche;
};

	func void UseTrollberrys ()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Trollkirsche);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		B_HealGift (0, HP_Trollkirsche*2);

		if (Mod_ItPl_Trollkirsche_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItPl_Trollkirsche_Right = 1;

			Mod_ItPl_Trollkirsche_Anzahl = Npc_HasItems(hero, ItPl_Trollkirsche);
			Npc_RemoveInvItems (hero, ItPl_Trollkirsche, Mod_ItPl_Trollkirsche_Anzahl);
			CreateInvItems	(hero, ItPl_Trollkirsche, Mod_ItPl_Trollkirsche_Anzahl);
		};
	};



INSTANCE ItPl_Herkuleskraut_01 (C_Item)
{	
	name 				=	"Herkuleskraut";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Weed;

	visual 				=	"ItPl_Herkuleskraut.3ds";
	material 			=	MAT_LEATHER;

	scemeName			=	"FOOD";

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Weed;
};

INSTANCE ItPl_Herkuleskraut_02 (C_Item)
{	
	name 				=	"Herkuleskraut";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Weed;

	visual 				=	"ItPl_Herkuleskraut.3ds";
	material 			=	MAT_LEATHER;

	scemeName			=	"FOOD";

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Weed;
};

INSTANCE ItPl_Herkuleskraut_03 (C_Item)
{	
	name 				=	"Herkuleskraut";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Weed;

	visual 				=	"ItPl_Herkuleskraut.3ds";
	material 			=	MAT_LEATHER;

	scemeName			=	"FOOD";

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Weed;
};

INSTANCE ItPl_Herkuleskraut_04 (C_Item)
{	
	name 				=	"Herkuleskraut";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Weed;

	visual 				=	"ItPl_Herkuleskraut.3ds";
	material 			=	MAT_LEATHER;

	scemeName			=	"FOOD";

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Weed;
};

INSTANCE ItPl_Herkuleskraut_05 (C_Item)
{	
	name 				=	"Herkuleskraut";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Weed;

	visual 				=	"ItPl_Herkuleskraut.3ds";
	material 			=	MAT_LEATHER;

	scemeName			=	"FOOD";

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Weed;
};

INSTANCE ItPl_Herkuleskraut_06 (C_Item)
{	
	name 				=	"Herkuleskraut";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Weed;

	visual 				=	"ItPl_Herkuleskraut.3ds";
	material 			=	MAT_LEATHER;

	scemeName			=	"FOOD";

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Weed;
};

INSTANCE ItPl_Herkuleskraut_07 (C_Item)
{	
	name 				=	"Herkuleskraut";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Weed;

	visual 				=	"ItPl_Herkuleskraut.3ds";
	material 			=	MAT_LEATHER;

	scemeName			=	"FOOD";

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Weed;
};

INSTANCE ItPl_Herkuleskraut_08 (C_Item)
{	
	name 				=	"Herkuleskraut";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Weed;

	visual 				=	"ItPl_Herkuleskraut.3ds";
	material 			=	MAT_LEATHER;

	scemeName			=	"FOOD";

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Weed;
};

INSTANCE ItPl_Herkuleskraut_09 (C_Item)
{	
	name 				=	"Herkuleskraut";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Weed;

	visual 				=	"ItPl_Herkuleskraut.3ds";
	material 			=	MAT_LEATHER;

	scemeName			=	"FOOD";

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Weed;
};

INSTANCE ItPl_Herkuleskraut_10 (C_Item)
{	
	name 				=	"Herkuleskraut";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Weed;

	visual 				=	"ItPl_Herkuleskraut.3ds";
	material 			=	MAT_LEATHER;

	scemeName			=	"FOOD";

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Weed;
};

INSTANCE ItPl_Herkuleskraut_11 (C_Item)
{	
	name 				=	"Herkuleskraut";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Weed;

	visual 				=	"ItPl_Herkuleskraut.3ds";
	material 			=	MAT_LEATHER;

	scemeName			=	"FOOD";

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Weed;
};

INSTANCE ItPl_Herkuleskraut_12 (C_Item)
{	
	name 				=	"Herkuleskraut";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Weed;

	visual 				=	"ItPl_Herkuleskraut.3ds";
	material 			=	MAT_LEATHER;

	scemeName			=	"FOOD";

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Weed;
};

INSTANCE ItPl_SalzwasserSprießling (C_Item)
{	
	name 				=	"Salzwassersprießling";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	100;

	visual 				=	"ItFo_Plants_Stoneroot_01.3ds";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[5]				= NAME_Value;					COUNT[5]	= 100;
};
/******************************************************************************************/
INSTANCE ItPl_Harpienkralle (C_Item)
{	
	name 				=	"Harpienkralle";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	100;

	visual 				=	"ItPl_Harpienkralle.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			=	100;
};






/******************************************************************************************/
INSTANCE RoterBaron (C_Item)
{	
	name 				=	"Roter Baron";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Mana_Herb_03;

	visual 				=	"Braunkappe.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_RoterBaron;
	scemeName			=	"FOOD";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_MANAPOTION";


	description			= 	name;
	
	if (Mod_ItPl_RoterBaron_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_Mana;	
		COUNT[1]			= 	Mana_Mana_Herb_02;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Mana_Herb_03;
};

func void Use_RoterBaron ()
{			
	Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Mana_Herb_02);

	Wld_PlayEffect("MFX_CHARM_ORIGIN",  self, self, 0, 0, 0, FALSE);
	Snd_Play 	("MFX_BERZERK_CAST" );

	if (Mod_ItPl_RoterBaron_Right == 0)
	&& (Npc_IsPlayer(self))
	{
		Mod_ItPl_RoterBaron_Right = 1;

		Mod_ItPl_RoterBaron_Anzahl = Npc_HasItems(hero, RoterBaron);
		Npc_RemoveInvItems (hero, RoterBaron, Mod_ItPl_RoterBaron_Anzahl);
		CreateInvItems	(hero, RoterBaron, Mod_ItPl_RoterBaron_Anzahl);
	};
};


INSTANCE GelberScherling (C_Item)
{	
	name 				=	"Gelber Scherling";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Health_Herb_03;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_HEALTHPOTION"; 


	visual 				=	"Gelberscherling.3DS";

	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_GelberScherling;
	scemeName			=	"FOOD";

	description			= 	name;
	
	if (Mod_ItPl_GelberScherling_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Health_Herb_02;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Health_Herb_03;
};

func void Use_GelberScherling ()
{			
	Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Health_Herb_02);

	Wld_PlayEffect("MFX_CHARM_ORIGIN",  self, self, 0, 0, 0, FALSE);
	Snd_Play 	("MFX_BERZERK_CAST" );

	if (Mod_ItPl_GelberScherling_Right == 0)
	&& (Npc_IsPlayer(self))
	{
		Mod_ItPl_GelberScherling_Right = 1;

		Mod_ItPl_GelberScherling_Anzahl = Npc_HasItems(hero, GelberScherling);
		Npc_RemoveInvItems (hero, GelberScherling, Mod_ItPl_GelberScherling_Anzahl);
		CreateInvItems	(hero, GelberScherling, Mod_ItPl_GelberScherling_Anzahl);
	};
};


/******************************************************************************************/
INSTANCE ItPl_Winterrute(C_Item)
{	
	name 				=	"Winterrute";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Blueplant;

	visual 				=	"Winterrute.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_Winterrute;
	scemeName			=	"FOOD";
         wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_HEALTHPOTION"; 
	description			= 	name;
	
	if (Mod_ItPl_Winterrute_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Blueplant;

		TEXT[2]				= 	NAME_Bonus_Mana;	
		COUNT[2]			= 	Mana_Blueplant;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Blueplant;
};

	func void Use_Winterrute ()
	{			
		Npc_ChangeAttribute	(self,	ATR_MANA,	    Mana_Blueplant);
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Blueplant);

		if (Mod_ItPl_Winterrute_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItPl_Winterrute_Right = 1;

			Mod_ItPl_Winterrute_Anzahl = Npc_HasItems(hero, ItPl_Winterrute);
			Npc_RemoveInvItems (hero, ItPl_Winterrute, Mod_ItPl_Winterrute_Anzahl);
			CreateInvItems	(hero, ItPl_Winterrute, Mod_ItPl_Winterrute_Anzahl);
		};
	};