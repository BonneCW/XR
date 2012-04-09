INSTANCE ItFo_Fleischwanzenragout (C_Item)
{
	name 				=	"Fleischwanzenragout";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	50;

	visual 				=	"ItFo_Meatbugragout_01.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"RICE";
	on_state[0]			=	Use_FWRagout;

	description			= 	name;
	TEXT[0]				= 	"Leckeres Fleischwanzenragout";
	TEXT[1]				= 	NAME_Bonus_HP; COUNT[1] = 25;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

	FUNC VOID Use_FWRagout()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS, 25);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
		
		if (Npc_IsPlayer (self))
		{
			B_SetEsspunkte	(16);

			Dunkelpilz_Bonus = Dunkelpilz_Bonus + 2;
		
			if (Dunkelpilz_Bonus >= 100)  
			{
				B_RaiseAttribute_Rest	(self, ATR_MANA_MAX, 1);
				Npc_ChangeAttribute	(self, ATR_MANA, 1);
				Snd_Play	("LevelUp");
				Dunkelpilz_Bonus -= 100;
			};
		};

		B_HealGift (0, 50);
	};

INSTANCE ItFo_Pilzsuppe (C_Item)
{
	name 				=	"Pilzsuppe";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	50;

	visual 				=	"ItFo_Meatbugragout_01.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"RICE";
	on_state[0]			=	Use_Pilzsuppe;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP; COUNT[1] = 34;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

	FUNC VOID Use_Pilzsuppe()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS, 34);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
		
		if (Npc_IsPlayer (self))
		{
			B_SetEsspunkte	(14);

			Dunkelpilz_Bonus = Dunkelpilz_Bonus + 2;
		
			if (Dunkelpilz_Bonus >= 100)  
			{
				B_RaiseAttribute_Rest	(self, ATR_MANA_MAX, 1);
				Npc_ChangeAttribute	(self, ATR_MANA, 1);
				Snd_Play	("LevelUp");
				Dunkelpilz_Bonus -= 100;
			};
		};

		B_HealGift (10, 68);
	};

INSTANCE ItFo_Fangheuschreckensuppe (C_Item)
{
	name 				=	"Fangheuschreckensuppe";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	75;

	visual 				=	"ItFo_Meatbugragout_01.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"RICE";
	on_state[0]			=	Use_Fangheuschreckensuppe;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP; COUNT[1] = 50;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

	FUNC VOID Use_Fangheuschreckensuppe()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS, 50);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		B_SetEsspunkte	(13);

		B_HealGift (10, 100);

	};