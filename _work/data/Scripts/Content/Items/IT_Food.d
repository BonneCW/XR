// ************************************************************************************************
// Heilwirkung und Kosten von Nahrung
// ************************************************************************************************

const int	Value_Apple		=	8;		const int	HP_Apple		=	3;
const int	Value_Cheese	=	30;		const int	HP_Cheese		=	15;
const int	Value_Bacon		=	50;		const int	HP_Bacon		=	20;
const int	Value_PfefferBacon		=	80;		const int	HP_PfefferBacon		=	30;
const int	Value_Bread		=	20;		const int	HP_Bread		=	10;
const int	Value_Fish		=	15;		const int	HP_Fish			=	5;
const int	Value_Fish_Gebraten		=	23;		const int	HP_Fish_Gebraten			=	8;
const int	Value_StockFish		=	31;		const int	HP_StockFish			=	11;
const int	Value_Rawmeat	=	3;		const int	HP_RawMeat		=	6;
const int	Value_Meat		=	6;		const int	HP_Meat			=	12;
const int	Value_Stew		=	8;		const int	HP_Stew			=	20;
const int	Value_Fleischeintopf		=	16;		const int	HP_Fleischeintopf			=	40;
const int	Value_FishSoup	=	20;		const int	HP_FishSoup		=	10;
const int	Value_FishRagout	=	50;		const int	HP_FishRagout		=	25;
const int	Value_Sausage	=	30;		const int	HP_Sausage		=	12;
const int	Value_Honey		=	30;		const int	HP_Honey		=	12;

const int	Value_Water		=	10;		const int	HP_Water		=	8;
const int	Value_Beer		=	20;		const int	HP_Beer			=	3;	const int	Mana_Beer		=	1;
const int	Value_Orkbier		=	200;		const int	HP_Orkbier			=	40;	const int	Mana_Orkbier		=	5;
const int	Value_Booze		=	15;		const int	HP_Booze		=	4;	const int	Mana_Booze		=	1;
const int	Value_Wine		=	20;		const int	HP_Wine			=	2;	const int	Mana_Wine		=	1;
const int	Value_Milk		=	15; 	const int	HP_Milk			=	5;	const int	Mana_Milk		=	1;	// Joly: Wenn diese Werte geändert werden passt Lobarts Auftrag holMilch nicht mehr!!!!!!
const int	Value_Carrot		=	20;		const int	HP_Carrot		=	10;

const int HP_Kuerbis = 15;


// ************************************************************************************************
//	Essbares				                                          				
// ************************************************************************************************


INSTANCE ItFo_Apple (C_Item)
{	
	name 				=	"Apfel";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Apple;
	
	visual 				=	"ItFo_Apple.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOOD";
	on_state[0]			=	Use_Apple;

	description			= 	name;
	
	if (Mod_ItFo_Apple_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Apple;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};
	
	TEXT[3]				=    "Ein frischer Apfel";
	TEXT[4]				=    "knackig und saftig";
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Apple;

};

	FUNC VOID Use_Apple()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Apple);

		self.aivar[AIV_Damage] += HP_Apple;

		if (self.aivar[AIV_Damage] > self.attribute[ATR_HITPOINTS_MAX])
		{
			self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
		};

		B_SetEsspunkte	(25);

		if (Mod_ItFo_Apple_Right == 0)
		&& (Npc_IsPlayer(self))
		{

			Mod_ItFo_Apple_Right = 1;

			Mod_ItFo_Apple_Anzahl = Npc_HasItems(hero, ItFo_Apple);
			Npc_RemoveInvItems (hero, ItFo_Apple, Mod_ItFo_Apple_Anzahl);
			CreateInvItems	(hero, ItFo_Apple, Mod_ItFo_Apple_Anzahl);
		};
		
		if (Npc_IsPlayer (self))
		{
			Apple_Bonus = Apple_Bonus + 1;

			Erkaeltungsdauer += 200;
			
			if (Apple_Bonus == 7)  
			{
				Print	(PRINT_Eat1);
			};
			if (Apple_Bonus == 15)  
			{
				Print (PRINT_Eat2);
			};
			if (Apple_Bonus >= 25)  
			{
				Print (PRINT_Eat3);
				B_RaiseAttribute_Rest (self,	ATR_STRENGTH, 1);
				Snd_Play	("LevelUp");
				Apple_Bonus -= 25;
			};
		};

		B_HealGift (0, 180);
	};

INSTANCE ItFo_AppleErika (C_Item)
{	
	name 				=	"Erikas Apfel";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Apple;
	
	visual 				=	"ItFo_Apple.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOOD";
	on_state[0]			=	Use_AppleErika;

	description			= 	name;
	
	if (Mod_ItFo_Apple_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Apple;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};
	
	TEXT[3]				=    "Ein frischer Apfel";
	TEXT[4]				=    "knackig und saftig";
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Apple;

};

	FUNC VOID Use_AppleErika()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Apple);

		self.aivar[AIV_Damage] += HP_Apple;

		if (self.aivar[AIV_Damage] > self.attribute[ATR_HITPOINTS_MAX])
		{
			self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
		};

		B_SetEsspunkte	(25);

		if (Mod_ItFo_Apple_Right == 0)
		&& (Npc_IsPlayer(self))
		{

			Mod_ItFo_Apple_Right = 1;

			Mod_ItFo_Apple_Anzahl = Npc_HasItems(hero, ItFo_Apple);
			Npc_RemoveInvItems (hero, ItFo_Apple, Mod_ItFo_Apple_Anzahl);
			CreateInvItems	(hero, ItFo_Apple, Mod_ItFo_Apple_Anzahl);
		};

		B_RaiseAttribute_Rest (self, ATR_STRENGTH, 2);

		B_HealGift (0, 180);
	};

INSTANCE ItFo_Apple_Matteo (C_Item)
{	
	name 				=	"Apfel";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Apple;
	
	visual 				=	"ItFo_Apple.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Apple;

};

INSTANCE ItFo_Apple_Matteo_Gut (C_Item)
{	
	name 				=	"knackiger Apfel";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Apple;
	
	visual 				=	"ItFo_Apple.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Apple;

};

INSTANCE ItFo_Apple_Matteo_Schlecht (C_Item)
{	
	name 				=	"fauler Apfel";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Apple;
	
	visual 				=	"ItFo_Apple.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Apple;

};

INSTANCE ItFo_Kuerbis (C_Item)
{	
	name 				=	"Kürbis";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	30;
	
	visual 				=	"Kuerbis_Klein.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOOD";
	on_state[0]			=	Use_Kuerbis;

	description			= 	name;
	
	if (Mod_ItFo_Kuerbis_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Kuerbis;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	30;

};

	FUNC VOID Use_Kuerbis()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Kuerbis);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		B_SetEsspunkte	(20);

		if (Mod_ItFo_Kuerbis_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItFo_Kuerbis_Right = 1;

			Mod_ItFo_Kuerbis_Anzahl = Npc_HasItems(hero, ItFo_Kuerbis);
			Npc_RemoveInvItems (hero, ItFo_Kuerbis, Mod_ItFo_Kuerbis_Anzahl);
			CreateInvItems	(hero, ItFo_Kuerbis, Mod_ItFo_Kuerbis_Anzahl);
		};

		B_HealGift (0, HP_Kuerbis*2);
	};

INSTANCE ItFo_Cheese (C_Item)
{	
	name 				=	"Käse";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Cheese;
	
	visual 				=	"ItFo_Cheese.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOODHUGE";
	on_state[0]			=	Use_Cheese;

	description			= 	name;
	
	if (Mod_ItFo_Cheese_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Cheese;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Cheese;

};

	FUNC VOID Use_Cheese()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Cheese);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		B_SetEsspunkte	(25);

		if (Mod_ItFo_Cheese_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItFo_Cheese_Right = 1;

			Mod_ItFo_Cheese_Anzahl = Npc_HasItems(hero, ItFo_Cheese);
			Npc_RemoveInvItems (hero, ItFo_Cheese, Mod_ItFo_Cheese_Anzahl);
			CreateInvItems	(hero, ItFo_Cheese, Mod_ItFo_Cheese_Anzahl);
		};

		B_HealGift (0, HP_Cheese*2);
	};


INSTANCE ItFo_Bacon (C_Item)
{	
	name 				=	"Schinken";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Bacon;
	
	visual 				=	"ItFo_Bacon.3ds";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOODHUGE";
	on_state[0]			=	Use_Bacon;

	description			= 	name;
	
	if (Mod_ItFo_Bacon_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Bacon;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Bacon;

};

	FUNC VOID Use_Bacon()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Bacon);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		B_SetEsspunkte	(40);

		if (Mod_ItFo_Bacon_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItFo_Bacon_Right = 1;

			Mod_ItFo_Bacon_Anzahl = Npc_HasItems(hero, ItFo_Bacon);
			Npc_RemoveInvItems (hero, ItFo_Bacon, Mod_ItFo_Bacon_Anzahl);
			CreateInvItems	(hero, ItFo_Bacon, Mod_ItFo_Bacon_Anzahl);
		};

		B_HealGift (0, HP_Bacon*2);
	};


INSTANCE ItFo_PfefferBacon (C_Item)
{	
	name 				=	"gepfefferter Schinken";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_PfefferBacon;
	
	visual 				=	"ItFo_Bacon.3ds";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOODHUGE";
	on_state[0]			=	Use_PfefferBacon;

	description			= 	name;
	
	if (Mod_ItFo_PfefferBacon_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_PfefferBacon;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_PfefferBacon;

};

	FUNC VOID Use_PfefferBacon()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_PfefferBacon);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		B_SetEsspunkte	(40);

		if (Mod_ItFo_PfefferBacon_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItFo_PfefferBacon_Right = 1;

			Mod_ItFo_PfefferBacon_Anzahl = Npc_HasItems(hero, ItFo_PfefferBacon);
			Npc_RemoveInvItems (hero, ItFo_PfefferBacon, Mod_ItFo_PfefferBacon_Anzahl);
			CreateInvItems	(hero, ItFo_PfefferBacon, Mod_ItFo_PfefferBacon_Anzahl);
		};

		B_HealGift (0, HP_PfefferBacon*2);
	};



INSTANCE ItFo_Bread (C_Item)
{	
	name 				=	"Brot";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Bread;
	
	visual 				=	"ItFo_Bread.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOODHUGE";
	on_state[0]			=	Use_Bread;

	description			= 	name;
	
	if (Mod_ItFo_Bread_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Bread;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Bread;

};

	FUNC VOID Use_Bread()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Bread);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		B_SetEsspunkte	(75);

		if (Mod_ItFo_Bread_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItFo_Bread_Right = 1;

			Mod_ItFo_Bread_Anzahl = Npc_HasItems(hero, ItFo_Bread);
			Npc_RemoveInvItems (hero, ItFo_Bread, Mod_ItFo_Bread_Anzahl);
			CreateInvItems	(hero, ItFo_Bread, Mod_ItFo_Bread_Anzahl);
		};

		B_HealGift (0, HP_Bread*2);
	};


INSTANCE ItFo_Fladenbrot (C_Item)
{	
	name 				=	"Fladenbrot";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	10;
	
	visual 				=	"ItFo_Fladenbrot.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOODHUGE";
	on_state[0]			=	Use_Fladenbrot;

	description			= 	name;
	
	if (Mod_ItFo_Fladenbrot_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Bread;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		COUNT[5]	= 10;

};

	FUNC VOID Use_Fladenbrot()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Bread);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		B_SetEsspunkte	(75);

		if (Mod_ItFo_Fladenbrot_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItFo_Fladenbrot_Right = 1;

			Mod_ItFo_Fladenbrot_Anzahl = Npc_HasItems(hero, ItFo_Fladenbrot);
			Npc_RemoveInvItems (hero, ItFo_Fladenbrot, Mod_ItFo_Fladenbrot_Anzahl);
			CreateInvItems	(hero, ItFo_Fladenbrot, Mod_ItFo_Fladenbrot_Anzahl);
		};

		B_HealGift (0, HP_Bread*2);
	};




INSTANCE ItFo_Fish (C_Item)
{	
	name 				=	"Fisch";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Fish;
	
	visual 				=	"ItFo_Fish.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOODHUGE";
	on_state[0]			=	Use_Fish;

	description			= 	name;
	
	if (Mod_ItFo_Fish_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Fish;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Fish;

};

	FUNC VOID Use_Fish()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Fish);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		B_SetEsspunkte	(50);

		if (Mod_ItFo_Fish_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItFo_Fish_Right = 1;

			Mod_ItFo_Fish_Anzahl = Npc_HasItems(hero, ItFo_Fish);
			Npc_RemoveInvItems (hero, ItFo_Fish, Mod_ItFo_Fish_Anzahl);
			CreateInvItems	(hero, ItFo_Fish, Mod_ItFo_Fish_Anzahl);
		};

		B_HealGift (0, HP_Fish*2);

		Mod_Fisch_Counter += 1;

		if (Mod_Fisch_Counter == 80)
		{
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS_MAX,	3);
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	3);

			Npc_ChangeAttribute	(self,	ATR_MANA_MAX,	1);
			Npc_ChangeAttribute	(self,	ATR_MANA,	1);

			self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
		}
		else if (Mod_Fisch_Counter == 200)
		{
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS_MAX,	10);
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	10);

			Npc_ChangeAttribute	(self,	ATR_MANA_MAX,	5);
			Npc_ChangeAttribute	(self,	ATR_MANA,	5);

			self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
		};
	};


INSTANCE ItFo_Fish_Gebraten (C_Item)
{	
	name 				=	"Gebratener Fisch";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Fish_Gebraten;
	
	visual 				=	"ItFo_Fish.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOODHUGE";
	on_state[0]			=	Use_Fish_Gebraten;

	description			= 	name;
	
	if (Mod_ItFo_Fish_Gebraten_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Fish_Gebraten;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Fish_Gebraten;

};

	FUNC VOID Use_Fish_Gebraten()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Fish_Gebraten);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		B_SetEsspunkte	(60);

		if (Mod_ItFo_Fish_Gebraten_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItFo_Fish_Gebraten_Right = 1;

			Mod_ItFo_Fish_Gebraten_Anzahl = Npc_HasItems(hero, ItFo_Fish_Gebraten);
			Npc_RemoveInvItems (hero, ItFo_Fish_Gebraten, Mod_ItFo_Fish_Gebraten_Anzahl);
			CreateInvItems	(hero, ItFo_Fish_Gebraten, Mod_ItFo_Fish_Gebraten_Anzahl);
		};

		B_HealGift (0, HP_Fish_Gebraten*2);

		Mod_Fisch_Counter += 1;

		if (Mod_Fisch_Counter == 80)
		{
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS_MAX,	3);
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	3);

			Npc_ChangeAttribute	(self,	ATR_MANA_MAX,	1);
			Npc_ChangeAttribute	(self,	ATR_MANA,	1);

			self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
		}
		else if (Mod_Fisch_Counter == 200)
		{
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS_MAX,	10);
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	10);

			Npc_ChangeAttribute	(self,	ATR_MANA_MAX,	5);
			Npc_ChangeAttribute	(self,	ATR_MANA,	5);

			self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
		};
	};


INSTANCE ItFo_StockFish (C_Item)
{	
	name 				=	"Stockfisch";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_StockFish;
	
	visual 				=	"ItFo_Fish.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOODHUGE";
	on_state[0]			=	Use_StockFish;

	description			= 	name;
	
	if (Mod_ItFo_StockFish_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_StockFish;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_StockFish;

};

	FUNC VOID Use_StockFish()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_StockFish);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		B_SetEsspunkte	(60);

		if (Mod_ItFo_StockFish_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItFo_StockFish_Right = 1;

			Mod_ItFo_StockFish_Anzahl = Npc_HasItems(hero, ItFo_StockFish);
			Npc_RemoveInvItems (hero, ItFo_StockFish, Mod_ItFo_StockFish_Anzahl);
			CreateInvItems	(hero, ItFo_StockFish, Mod_ItFo_StockFish_Anzahl);
		};

		B_HealGift (0, HP_StockFish*2);

		Mod_Fisch_Counter += 1;

		if (Mod_Fisch_Counter == 80)
		{
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS_MAX,	3);
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	3);

			Npc_ChangeAttribute	(self,	ATR_MANA_MAX,	1);
			Npc_ChangeAttribute	(self,	ATR_MANA,	1);

			self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
		}
		else if (Mod_Fisch_Counter == 200)
		{
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS_MAX,	10);
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	10);

			Npc_ChangeAttribute	(self,	ATR_MANA_MAX,	5);
			Npc_ChangeAttribute	(self,	ATR_MANA,	5);

			self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
		};
	};

INSTANCE ItFoMuttonZombie (C_Item)	//kommt aus Bratpfannen-Mobsi !!!
{	
	name 				=	"Zombiefleisch";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Meat;
	
	visual 				=	"ItFoMutton.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"MEAT";
	on_state[0]			=	Use_MuttonZombie;

	description			= 	name;
	
	if (Mod_ItFo_Zombiefleisch_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	

		if (HEROISTKEINZOMBIE)
		{
			COUNT[1]			= 	-HP_Meat;
		}
		else
		{
			COUNT[1]			= 	HP_Meat;
		};
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Meat;

};

	FUNC VOID Use_MuttonZombie()
	{
		if (HEROISTKEINZOMBIE)
		{
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	-HP_Meat);
		}
		else
		{
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Meat);
		};

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		if (Mod_ItFo_Zombiefleisch_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItFo_Zombiefleisch_Right = 1;

			Mod_ItFo_Zombiefleisch_Anzahl = Npc_HasItems(hero, ItFoMuttonZombie);
			Npc_RemoveInvItems (hero, ItFoMuttonZombie, Mod_ItFo_Zombiefleisch_Anzahl);
			CreateInvItems	(hero, ItFoMuttonZombie, Mod_ItFo_Zombiefleisch_Anzahl);
		};
	};


INSTANCE ItFo_Stew (C_Item)
{	
	name 				=	"Eintopf";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Stew;
	
	visual 				=	"ItFo_Stew.3ds";
	material 			=	MAT_WOOD;
	scemeName			=	"RICE";
	on_state[0]			=	Use_Stew;

	description			= 	name;
	
	if (Mod_ItFo_Stew_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Stew;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Stew;

};

	FUNC VOID Use_Stew()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Stew);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		B_SetEsspunkte	(90);

		if (Mod_ItFo_Stew_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItFo_Stew_Right = 1;

			Mod_ItFo_Stew_Anzahl = Npc_HasItems(hero, ItFo_Stew);
			Npc_RemoveInvItems (hero, ItFo_Stew, Mod_ItFo_Stew_Anzahl);
			CreateInvItems	(hero, ItFo_Stew, Mod_ItFo_Stew_Anzahl);
		};

		B_HealGift (0, HP_Stew*2);
	};


INSTANCE ItFo_Blutkult (C_Item)
{	
	name 				=	"Dämoneneintopf der Verdammnis";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	100;
	
	visual 				=	"ItFo_Stew.3ds";
	material 			=	MAT_WOOD;
	scemeName			=	"RICE";
	on_state[0]			=	Use_Blutkult;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= 100;

};

	FUNC VOID Use_Blutkult()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	-100);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		B_SetEsspunkte	(90);

		if (Npc_IsPlayer(self))
		{
			hero.attribute[ATR_STRENGTH] += 100;
			hero.attribute[ATR_DEXTERITY] -= 70;
			hero.attribute[ATR_HITPOINTS_MAX] += 400;
			hero.attribute[ATR_HITPOINTS] += 400;

			hero.protection[PROT_EDGE] += 100000;
			hero.protection[PROT_BLUNT] += 100000;
			hero.protection[PROT_POINT] += 100000;
			hero.protection[PROT_FIRE] += 100;
			hero.protection[PROT_MAGIC] += 100;

			self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

			hero.damagetype = DAM_FIRE;

			AI_UnequipArmor	(hero);

			Mdl_SetVisualBody (self, "hum_body_naked0", 18,				0,			"Hum_Head_Fighter", 	207,	0, 			NO_Armor);

			Mod_HeroIstDemon = TRUE;
			Mod_HeroDemonCounter = 600;
			Mod_WM_HeroHatDaemonInSich = 1;

			Mdl_RemoveOverlayMds	(hero, "HUMANS_BABE.MDS");
		};
	};


INSTANCE ItFo_Fleischeintopf (C_Item)
{	
	name 				=	"Fleischeintopf";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Fleischeintopf;
	
	visual 				=	"ItFo_Stew.3ds";
	material 			=	MAT_WOOD;
	scemeName			=	"RICE";
	on_state[0]			=	Use_Fleischeintopf;

	description			= 	name;
	
	if (Mod_ItFo_Fleischeintopf_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Fleischeintopf;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Fleischeintopf;

};

	FUNC VOID Use_Fleischeintopf()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Fleischeintopf);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		B_SetEsspunkte	(90);

		if (Mod_ItFo_Fleischeintopf_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItFo_Fleischeintopf_Right = 1;

			Mod_ItFo_Fleischeintopf_Anzahl = Npc_HasItems(hero, ItFo_Fleischeintopf);
			Npc_RemoveInvItems (hero, ItFo_Fleischeintopf, Mod_ItFo_Fleischeintopf_Anzahl);
			CreateInvItems	(hero, ItFo_Fleischeintopf, Mod_ItFo_Fleischeintopf_Anzahl);
		};

		B_HealGift (0, HP_Fleischeintopf*2);
	};



INSTANCE ItFo_XPStew (C_Item)
{	
	name 				=	"Theklas Eintopf";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Stew;
	
	visual 				=	"ItFo_Stew.3ds";
	material 			=	MAT_WOOD;
	scemeName			=	"RICE";
	on_state[0]			=	Use_XPStew;

	description			= 	name;
	
	if (Mod_ItFo_XPStew_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Stew;
		TEXT[2]	=	NAME_Bonus_Str;
		COUNT[2]	=	1;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;			COUNT[5]	= Value_Stew;

};

	FUNC VOID Use_XPStew()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Stew);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		Snd_Play	("LEVELUP");
		B_RaiseAttribute_Rest	(self, ATR_STRENGTH, 1);

		B_SetEsspunkte	(100);

		if (Mod_ItFo_XPStew_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItFo_XPStew_Right = 1;

			Mod_ItFo_XPStew_Anzahl = Npc_HasItems(hero, ItFo_XPStew);
			Npc_RemoveInvItems (hero, ItFo_XPStew, Mod_ItFo_XPStew_Anzahl);
			CreateInvItems	(hero, ItFo_XPStew, Mod_ItFo_XPStew_Anzahl);
		};

		B_HealGift (0, HP_Stew*2);
	};



INSTANCE ItFo_CoragonsBeer (C_Item)
{	
	name 				=	"Bier";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Beer;
	
	visual 				=	"ItFo_Beer.3DS";
	material 			=	MAT_GLAS;
	scemeName			=	"POTIONFAST";
	on_state[0]			=	Use_CoragonsBeerBeer;

	description			= 	name;
	
	if (Mod_ItFo_CoragonsBeer_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Beer;
		TEXT[2]	=	NAME_Bonus_Mana;
		COUNT[2]	=	Mana_Beer;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	
	TEXT[4]				= 	"Coragons Spezialbier";		
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Beer;

};

	FUNC VOID Use_CoragonsBeerBeer()
	{			
		B_RaiseAttribute_Rest	(self,	ATR_MANA_MAX,	Mana_Beer);
		Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Beer);	 
		
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS_MAX,	HP_Beer);
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Beer);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
		var string concatText;
		concatText = ConcatStrings(PRINT_Learnhitpoints_MAX, IntToString(HP_Beer));
		PrintScreen	(concatText, 55, -1, FONT_Screen, 2);

		if (Mod_ItFo_CoragonsBeer_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItFo_CoragonsBeer_Right = 1;

			Mod_ItFo_CoragonsBeer_Anzahl = Npc_HasItems(hero, ItFo_CoragonsBeer);
			Npc_RemoveInvItems (hero, ItFo_CoragonsBeer, Mod_ItFo_CoragonsBeer_Anzahl);
			CreateInvItems	(hero, ItFo_CoragonsBeer, Mod_ItFo_CoragonsBeer_Anzahl);
		};

		if (Npc_IsPlayer(self))
		{
			HatGetrunken += 1;

			B_Betrunken();
		};

		B_HealGift (10, HP_Beer*2);
	};

INSTANCE ItFo_Beer_Khorata (C_Item)
{	
	name 				=	"Khorataer Lagerbier";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	100;
	
	visual 				=	"ItFo_Beer.3DS";
	material 			=	MAT_GLAS;
	scemeName			=	"POTIONFAST";
	on_state[0]			=	Use_Beer_Khorata;

	description			= 	name;
	
	if (Mod_ItFo_Beer_Khorata_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	15;
		TEXT[2]	=	NAME_Bonus_Mana;
		COUNT[2]	=	10;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	
	TEXT[4]				= 	"Kühles Lagerbier, herrlich würzig";		
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= 100;

};

	FUNC VOID Use_Beer_Khorata()
	{			
		Npc_ChangeAttribute	(self,	ATR_MANA,	10);	 
		
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	15);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		if (Mod_ItFo_Beer_Khorata_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItFo_Beer_Khorata_Right = 1;

			Mod_ItFo_Beer_Khorata_Anzahl = Npc_HasItems(hero, ItFo_Beer_Khorata);
			Npc_RemoveInvItems (hero, ItFo_Beer_Khorata, Mod_ItFo_Beer_Khorata_Anzahl);
			CreateInvItems	(hero, ItFo_Beer_Khorata, Mod_ItFo_Beer_Khorata_Anzahl);
		};

		if (Npc_IsPlayer(self))
		{
			HatGetrunken += 1;

			B_Betrunken();
		};

		B_HealGift (10, 30);
	};

INSTANCE ItFo_Dunkelbier (C_Item)
{	
	name 				=	"Dunkelbier";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Beer*2;
	
	visual 				=	"ItFo_Beer.3DS";
	material 			=	MAT_GLAS;
	scemeName			=	"POTIONFAST";
	on_state[0]			=	Use_Dunkelbier;

	description			= 	name;
	
	if (Mod_ItFo_Dunkelbier_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Beer;
		TEXT[2]	=	NAME_Bonus_Mana;
		COUNT[2]	=	Mana_Beer;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	
	TEXT[4]				= 	"vom Brauer in Khorata";		
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Beer;

};

	FUNC VOID Use_Dunkelbier()
	{			
		Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Beer);	 
		
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Beer);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		if (Mod_ItFo_Dunkelbier_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItFo_Dunkelbier_Right = 1;

			Mod_ItFo_Dunkelbier_Anzahl = Npc_HasItems(hero, ItFo_Dunkelbier);
			Npc_RemoveInvItems (hero, ItFo_Dunkelbier, Mod_ItFo_Dunkelbier_Anzahl);
			CreateInvItems	(hero, ItFo_Dunkelbier, Mod_ItFo_Dunkelbier_Anzahl);
		};

		if (Npc_IsPlayer(self))
		{
			HatGetrunken += 4;

			B_Betrunken();
		};

		B_HealGift (10, HP_Beer*2);
	};


INSTANCE ItFo_Trunken (C_Item)
{	
	name 				=	"Trunken";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	75;
	
	visual 				=	"ItAt_DragonBlood.3DS";
	material 			=	MAT_GLAS;
	scemeName			=	"POTIONFAST";
	on_state[0]			=	Use_TrunkenBeer;

	description			= 	name;
	
	
		
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= value;

};

	FUNC VOID Use_TrunkenBeer()
	{			
		if (Npc_IsPlayer(self))
		{
			HatGetrunken += 3;

			B_Betrunken();
		};

		B_HealGift (10, 0);
	};


INSTANCE ItFo_Orkbier (C_Item)
{	
	name 				=	"Orkbier";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Orkbier;
	
	visual 				=	"ItFo_Beer.3DS";
	material 			=	MAT_GLAS;
	scemeName			=	"POTIONFAST";
	on_state[0]			=	Use_Orkbier;

	description			= 	name;
	
	if (Mod_ItFo_Orkbier_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Orkbier;
		TEXT[2]	=	NAME_Bonus_Mana;
		COUNT[2]	=	Mana_Orkbier;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	
	TEXT[4]				= 	"Coragons Spezial Bier";		
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Orkbier;

};

	FUNC VOID Use_Orkbier()
	{			
		B_RaiseAttribute_Rest	(self,	ATR_MANA_MAX,	Mana_Orkbier);
		Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Orkbier);	 
		
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS_MAX,	HP_Orkbier);
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Orkbier);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		var string concatText;
		concatText = ConcatStrings(PRINT_Learnhitpoints_MAX, IntToString(HP_Orkbier));
		PrintScreen	(concatText, 55, -1, FONT_Screen, 2);

		if (Mod_ItFo_Orkbier_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItFo_Orkbier_Right = 1;

			Mod_ItFo_Orkbier_Anzahl = Npc_HasItems(hero, ItFo_Orkbier);
			Npc_RemoveInvItems (hero, ItFo_Orkbier, Mod_ItFo_Orkbier_Anzahl);
			CreateInvItems	(hero, ItFo_Orkbier, Mod_ItFo_Orkbier_Anzahl);
		};

		if (Npc_IsPlayer(self))
		{
			HatGetrunken += 4;

			B_Betrunken();
		};

		B_HealGift (10, HP_Orkbier*2);
	};



INSTANCE ItFo_FishSoup (C_Item)
{	
	name 				=	"Fischsuppe";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_FishSoup;
	
	visual 				=	"ItFo_FishSoup.3ds";
	material 			=	MAT_WOOD;
	scemeName			=	"RICE";
	on_state[0]			=	Use_FishSoup;

	description			= 	name;
	
	if (Mod_ItFo_FishSoup_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_FishSoup;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_FishSoup;

};

	FUNC VOID Use_FishSoup()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_FishSoup);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		B_SetEsspunkte	(70);

		if (Mod_ItFo_FishSoup_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItFo_FishSoup_Right = 1;

			Mod_ItFo_FishSoup_Anzahl = Npc_HasItems(hero, ItFo_FishSoup);
			Npc_RemoveInvItems (hero, ItFo_FishSoup, Mod_ItFo_FishSoup_Anzahl);
			CreateInvItems	(hero, ItFo_FishSoup, Mod_ItFo_FishSoup_Anzahl);
		};

		B_HealGift (10, HP_FishSoup*2);

		Mod_Fisch_Counter += 1;

		if (Mod_Fisch_Counter == 80)
		{
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS_MAX,	3);
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	3);

			Npc_ChangeAttribute	(self,	ATR_MANA_MAX,	1);
			Npc_ChangeAttribute	(self,	ATR_MANA,	1);

			self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
		}
		else if (Mod_Fisch_Counter == 200)
		{
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS_MAX,	10);
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	10);

			Npc_ChangeAttribute	(self,	ATR_MANA_MAX,	5);
			Npc_ChangeAttribute	(self,	ATR_MANA,	5);

			self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
		};
	};



INSTANCE ItFo_FishRagout (C_Item)
{	
	name 				=	"Fischragout";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_FishRagout;
	
	visual 				=	"ItFo_FishSoup.3ds";
	material 			=	MAT_WOOD;
	scemeName			=	"RICE";
	on_state[0]			=	Use_FishRagout;

	description			= 	name;
	
	if (Mod_ItFo_FishRagout_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_FishRagout;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_FishRagout;

};

	FUNC VOID Use_FishRagout()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_FishRagout);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		B_SetEsspunkte	(80);

		if (Mod_ItFo_FishRagout_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItFo_FishRagout_Right = 1;

			Mod_ItFo_FishRagout_Anzahl = Npc_HasItems(hero, ItFo_FishRagout);
			Npc_RemoveInvItems (hero, ItFo_FishRagout, Mod_ItFo_FishRagout_Anzahl);
			CreateInvItems	(hero, ItFo_FishRagout, Mod_ItFo_FishRagout_Anzahl);
		};

		B_HealGift (0, HP_FishRagout*2);

		Mod_Fisch_Counter += 1;

		if (Mod_Fisch_Counter == 80)
		{
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS_MAX,	3);
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	3);

			Npc_ChangeAttribute	(self,	ATR_MANA_MAX,	1);
			Npc_ChangeAttribute	(self,	ATR_MANA,	1);

			self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
		}
		else if (Mod_Fisch_Counter == 200)
		{
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS_MAX,	10);
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	10);

			Npc_ChangeAttribute	(self,	ATR_MANA_MAX,	5);
			Npc_ChangeAttribute	(self,	ATR_MANA,	5);

			self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
		};
	};




INSTANCE ItFo_Sausage (C_Item)
{	
	name 				=	"Wurst";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Sausage;
	
	visual 				=	"ItFo_Sausage.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOODHUGE";
	on_state[0]			=	Use_Sausage;

	description			= 	name;
	
	if (Mod_ItFo_Sausage_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Sausage;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Sausage;

};

	FUNC VOID Use_Sausage()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Sausage);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		B_SetEsspunkte	(35);

		if (Mod_ItFo_Sausage_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItFo_Sausage_Right = 1;

			Mod_ItFo_Sausage_Anzahl = Npc_HasItems(hero, ItFo_Sausage);
			Npc_RemoveInvItems (hero, ItFo_Sausage, Mod_ItFo_Sausage_Anzahl);
			CreateInvItems	(hero, ItFo_Sausage, Mod_ItFo_Sausage_Anzahl);
		};

		B_HealGift (0, HP_Sausage*2);
	};


INSTANCE ItFo_Honey (C_Item)
{	
	name 				=	"Honig";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Honey;
	
	visual 				=	"ItFo_Honey.3DS";
	material 			=	MAT_STONE;
	scemeName			=	"FOODHUGE";
	on_state[0]			=	Use_Honey;

	description			= 	name;
	
	if (Mod_ItFo_Honey_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Honey;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Honey;

};

	FUNC VOID Use_Honey()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Honey);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		B_SetEsspunkte	(20);

		if (Mod_ItFo_Honey_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItFo_Honey_Right = 1;

			Mod_ItFo_Honey_Anzahl = Npc_HasItems(hero, ItFo_Honey);
			Npc_RemoveInvItems (hero, ItFo_Honey, Mod_ItFo_Honey_Anzahl);
			CreateInvItems	(hero, ItFo_Honey, Mod_ItFo_Honey_Anzahl);
		};
		
		if (Npc_IsPlayer (self))
		{
			Honey_Bonus += 1;

			Erkaeltungsdauer += 200;
			
			if (Honey_Bonus == 7)  
			{
				Print	(PRINT_Eat21);
			};
			if (Honey_Bonus == 15)  
			{
				Print (PRINT_Eat22);
			};
			if (Honey_Bonus >= 25)  
			{
				Print (PRINT_Eat23);
				B_RaiseAttribute_Rest (self, ATR_DEXTERITY, 1);
				Snd_Play	("LevelUp");
				Honey_Bonus -= 25;
			};
		};

		B_HealGift (0, HP_Honey*2);
	};

INSTANCE ItFo_Melasse (C_Item)
{	
	name 				=	"Melasse";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Honey;
	
	visual 				=	"ItFo_Honey.3DS";
	material 			=	MAT_STONE;
	
	description			= 	name;
};
// ************************************************************************************************
//	Trinkbares
// ************************************************************************************************



INSTANCE ItFo_Water (C_Item)
{	
	name 				=	"Wasser";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Water;
	
	visual 				=	"ItFo_Water.3ds";
	material 			=	MAT_GLAS;
	scemeName			=	"POTION";
	on_state[0]			=	Use_Water;

	description			= 	name;
	
	if (Mod_ItFo_Water_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Water;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= Value_Water;

};

	FUNC VOID Use_Water()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Water);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		if (Mod_ItFo_Water_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItFo_Water_Right = 1;

			Mod_ItFo_Water_Anzahl = Npc_HasItems(hero, ItFo_Water);
			Npc_RemoveInvItems (hero, ItFo_Water, Mod_ItFo_Water_Anzahl);
			CreateInvItems	(hero, ItFo_Water, Mod_ItFo_Water_Anzahl);
		};

		B_HealGift (10, HP_Water*2);
	};

INSTANCE ItMi_Salzwasser (C_Item)
{	
	name 				=	"Salzwasser";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Water;
	
	visual 				=	"ItFo_Water.3ds";
	material 			=	MAT_GLAS;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= Value_Water;

};



INSTANCE ItFo_Beer (C_Item)
{	
	name 				=	"Bier";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Beer;
	
	visual 				=	"ItFo_Beer.3DS";
	material 			=	MAT_GLAS;
	scemeName			=	"POTIONFAST";
	on_state[0]			=	Use_Beer;

	description			= 	name;
	
	if (Mod_ItFo_Beer_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Beer;
		TEXT[2]	=	NAME_Bonus_Mana;
		COUNT[2]	=	Mana_Beer;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};
	
	TEXT[4]				= 	"Dunkles Paladiner";		
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Beer;

};

	FUNC VOID Use_Beer()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Beer);
		Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Beer);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		if (Mod_ItFo_Beer_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItFo_Beer_Right = 1;

			Mod_ItFo_Beer_Anzahl = Npc_HasItems(hero, ItFo_Beer);
			Npc_RemoveInvItems (hero, ItFo_Beer, Mod_ItFo_Beer_Anzahl);
			CreateInvItems	(hero, ItFo_Beer, Mod_ItFo_Beer_Anzahl);
		};

		if (Npc_IsPlayer(self))
		{
			HatGetrunken += 1;

			B_Betrunken();
		};

		B_HealGift (10, HP_Beer*2);
	};


INSTANCE ItFo_Booze (C_Item)
{	
	name 				=	"Wacholder";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Booze;
	
	visual 				=	"ItFo_Booze.3DS";
	material 			=	MAT_GLAS;
	scemeName			=	"POTION";
	on_state[0]			=	Use_Booze;

	description			= 	name;
	
	if (Mod_ItFo_Booze_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Booze;
		TEXT[2]	=	NAME_Bonus_Mana;
		COUNT[2]	=	Mana_Booze;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Booze;

};

	FUNC VOID Use_Booze()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Booze);
		Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Booze);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		if (Mod_ItFo_Booze_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItFo_Booze_Right = 1;

			Mod_ItFo_Booze_Anzahl = Npc_HasItems(hero, ItFo_Booze);
			Npc_RemoveInvItems (hero, ItFo_Booze, Mod_ItFo_Booze_Anzahl);
			CreateInvItems	(hero, ItFo_Booze, Mod_ItFo_Booze_Anzahl);
		};

		if (Npc_IsPlayer(self))
		{
			HatGetrunken += 2;

			B_Betrunken();
		};	

		B_HealGift (10, HP_Booze*2); 
	};


INSTANCE ItFo_Apfelmost (C_Item)
{	
	name 				=	"Apfelmost";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Booze;
	
	visual 				=	"ItFo_Booze.3DS";
	material 			=	MAT_GLAS;
	scemeName			=	"POTION";
	on_state[0]			=	Use_Apfelmost;

	description			= 	name;

	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Booze;

};

	FUNC VOID Use_Apfelmost()
	{			
		if (Npc_IsPlayer(self))
		{
			HatGetrunken += 1;

			B_Betrunken();
		};	

		B_HealGift (10, 10); 

		B_RaiseAttribute_Rest (self, ATR_STRENGTH, 1);
		B_RaiseAttribute_Rest (self, ATR_MANA_MAX, 1);
	};


INSTANCE ItFo_BoozeRudolf (C_Item)
{	
	name 				=	"Rudolfs Schnaps";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Booze;
	
	visual 				=	"ItFo_Booze.3DS";
	material 			=	MAT_GLAS;
	scemeName			=	"POTION";
	on_state[0]			=	Use_BoozeRudolf;

	description			= 	name;
	
	if (Mod_ItFo_Booze_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Booze;
		TEXT[2]	=	NAME_Bonus_Mana;
		COUNT[2]	=	Mana_Booze;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Booze;

};

	FUNC VOID Use_BoozeRudolf()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Booze);
		Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Booze);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7338_OUT_Lebensmittelhaendler_REL))
		{
			//B_SetNpcVisual 	(self, MALE, "Hum_Head_FatBald", 222, BodyTex_N, KhorataHaendler_01);

			Mdl_SetVisualBody (self,	"hum_body_Naked0", 	BodyTex_N,	0,			"Hum_Head_FatBald", 	222,	0, 			KhorataHaendler_01);

			Mod_RudolfSchnaps = 1;
		};

		if (Npc_IsPlayer(self))
		{
			HatGetrunken += 5;

			B_Betrunken();
		};

		B_HealGift (10, HP_Booze*2);	 
	};


INSTANCE ItFo_HubertBooze (C_Item)
{	
	name 				=	"Hubert's Spezialtrunk";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Booze;
	
	visual 				=	"ItFo_Booze.3DS";
	material 			=	MAT_GLAS;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Booze;

};

INSTANCE ItFo_GiftBooze (C_Item)
{	
	name 				=	"vergifteter Wacholder";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Booze;
	
	visual 				=	"ItFo_Booze.3DS";
	material 			=	MAT_GLAS;

	description			= 	name;

	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Booze;

};


INSTANCE ItFo_Spezialtrunken (C_Item)
{	
	name 				=	"Spezialtrunken";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Booze;
	
	visual 				=	"ItFo_Booze.3DS";
	material 			=	MAT_GLAS;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Booze;

};


INSTANCE ItFo_Wine (C_Item)
{	
	name 				=	"Wein";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Wine;
	
	visual 				=	"ItFo_Wine.3ds";
	material 			=	MAT_GLAS;
	scemeName			=	"POTION";
	on_state[0]			=	Use_Wine;

	description			= 	name;
	
	if (Mod_ItFo_Wine_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Wine;
		TEXT[2]	=	NAME_Bonus_Mana;
		COUNT[2]	=	Mana_Wine;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Wine;

};

	FUNC VOID Use_Wine()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Wine);
		Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Wine);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		if (Mod_ItFo_Wine_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItFo_Wine_Right = 1;

			Mod_ItFo_Wine_Anzahl = Npc_HasItems(hero, ItFo_Wine);
			Npc_RemoveInvItems (hero, ItFo_Wine, Mod_ItFo_Wine_Anzahl);
			CreateInvItems	(hero, ItFo_Wine, Mod_ItFo_Wine_Anzahl);
		};

		if (Npc_IsPlayer(self))
		{
			HatGetrunken += 2;

			B_Betrunken();
		};

		B_HealGift (10, HP_Wine*2);
	};


INSTANCE ItFo_KWine (C_Item)
{	
	name 				=	"Klosterwein";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Wine+5;
	
	visual 				=	"ItFo_Wine.3ds";
	material 			=	MAT_GLAS;
	scemeName			=	"POTION";
	on_state[0]			=	Use_KWine;

	description			= 	name;
	
	if (Mod_ItFo_KWine_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	5;
		TEXT[2]	=	NAME_Bonus_Mana;
		COUNT[2]	=	2;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		COUNT[5]	= value;

};

	FUNC VOID Use_KWine()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	5);
		Npc_ChangeAttribute	(self,	ATR_MANA,	2);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		if (Mod_ItFo_KWine_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItFo_KWine_Right = 1;

			Mod_ItFo_KWine_Anzahl = Npc_HasItems(hero, ItFo_KWine);
			Npc_RemoveInvItems (hero, ItFo_KWine, Mod_ItFo_KWine_Anzahl);
			CreateInvItems	(hero, ItFo_KWine, Mod_ItFo_KWine_Anzahl);
		};

		if (Npc_IsPlayer(self))
		{
			HatGetrunken += 3;

			B_Betrunken();

			if (Mod_WM_HeroHatDaemonInSich)
			{
				if (hero.attribute[ATR_HITPOINTS] > hero.attribute[ATR_HITPOINTS_MAX]/2)
				{
					hero.attribute[ATR_HITPOINTS] -= hero.attribute[ATR_HITPOINTS_MAX]/2;
				}
				else
				{
					hero.attribute[ATR_HITPOINTS] = 1;
				};
			};
		};

		B_HealGift (10, 5*2);
	};

INSTANCE ItFo_Milk (C_Item)
{	
	name 				=	"Milch";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Milk;
	
	visual 				=	"ItFo_Milk.3DS";
	material 			=	MAT_GLAS;
	scemeName			=	"POTION";
	on_state[0]			=	Use_Milk;

	description			= 	name;
	
	if (Mod_ItFo_Milk_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Milk;
		TEXT[2]	=	NAME_Bonus_Mana;
		COUNT[2]	=	Mana_Milk;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Milk;

};

	FUNC VOID Use_Milk()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Milk);
		Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Milk);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		if (Mod_ItFo_Milk_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItFo_Milk_Right = 1;

			Mod_ItFo_Milk_Anzahl = Npc_HasItems(hero, ItFo_Milk);
			Npc_RemoveInvItems (hero, ItFo_Milk, Mod_ItFo_Milk_Anzahl);
			CreateInvItems	(hero, ItFo_Milk, Mod_ItFo_Milk_Anzahl);
		}; 

		B_HealGift (10, HP_Milk*2);
	};

INSTANCE ItFo_Tee (C_Item)
{	
	name 				=	"Tee";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Milk;
	
	visual 				=	"ItFo_Milk.3DS";
	material 			=	MAT_GLAS;
	scemeName			=	"POTION";
	on_state[0]			=	Use_Tee;

	description			= 	name;
	
	if (Mod_ItFo_Tee_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Milk;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Milk;

};

	FUNC VOID Use_Tee()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Milk);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		if (Mod_ItFo_Tee_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItFo_Tee_Right = 1;

			Mod_ItFo_Tee_Anzahl = Npc_HasItems(hero, ItFo_Tee);
			Npc_RemoveInvItems (hero, ItFo_Tee, Mod_ItFo_Tee_Anzahl);
			CreateInvItems	(hero, ItFo_Tee, Mod_ItFo_Tee_Anzahl);
		}; 

		B_HealGift (10, HP_Milk*2);
	};

INSTANCE ItMi_SteinDerWeisen (C_Item)
{	
	name 				=	"Bruchteil vom Stein der Weisen";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	1000;
	
	visual 				=	"ItMi_DarkPearl.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOOD";
	on_state[0]			=	Use_SteinDerWeisen;

	description			= 	name;
	
	TEXT[1]				= 	"Mann, bin ich froh, nicht den ganzen Stein zu haben ...";	
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	1000;

};

	FUNC VOID Use_SteinDerWeisen()
	{			
		B_RaiseAttribute_Rest (self, ATR_HITPOINTS_MAX, ATR_HITPOINTS_MAX/10);
		B_RaiseAttribute_Rest (self, ATR_MANA_MAX, ATR_MANA_MAX/10);
	};

// Möhre
INSTANCE ItFo_Karotte (C_Item)
{	
	name 				=	"Möhre";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Carrot;
	 
	visual 				=	"ItFo_Carrot.3DS";
	material 			=	MAT_GLAS;
	scemeName			=	"FOOD";
	on_state[0]			=	Use_Carrot;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		
	COUNT[1]			= 	HP_Carrot;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Carrot;

};
	FUNC VOID Use_Carrot()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Carrot);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		if (Mod_ItFo_Karotte_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItFo_Karotte_Right = 1;

			Mod_ItFo_Karotte_Anzahl = Npc_HasItems(hero, ItFo_Karotte);
			Npc_RemoveInvItems (hero, ItFo_Karotte, Mod_ItFo_Karotte_Anzahl);
			CreateInvItems	(hero, ItFo_Karotte, Mod_ItFo_Karotte_Anzahl);
		}; 

		B_HealGift (10, HP_Carrot*2);
	};