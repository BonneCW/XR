const int	Value_SwampBerry		=	15;		const int	HP_SwampBerry		=	10;

INSTANCE  ItFo_Beere_01 (C_Item)
{	
	name 				=	"Sumpfbeere";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_SwampBerry;
	
	visual 				=	"ItFo_Plants_Trollberrys_01.3ds";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOOD";
	on_state[0]			=	Use_SwampBerry;

	description			= 	name;
	
	if (Mod_ItPl_Sumpfbeere_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	HP_Swampberry;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};
	
	TEXT[3]				=    "Eine Beere";
	TEXT[4]				=    "die nach Sumpfkraut riecht";
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_SwampBerry;

};

	FUNC VOID Use_SwampBerry()
	{

		B_SetEsspunkte	(30);
		if (Npc_IsPlayer (self))
		{
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_SwampBerry);
			Wld_PlayEffect ("SLOW_TIME", self, self, 0, 0, 0, FALSE);
		};

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		B_HealGift (0, HP_SwampBerry*2);

		if (Mod_ItPl_Sumpfbeere_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItPl_Sumpfbeere_Right = 1;

			Mod_ItPl_Sumpfbeere_Anzahl = Npc_HasItems(hero, ItFo_Beere_01);
			Npc_RemoveInvItems (hero, ItFo_Beere_01, Mod_ItPl_Sumpfbeere_Anzahl);
			CreateInvItems	(hero, ItFo_Beere_01, Mod_ItPl_Sumpfbeere_Anzahl);
		};
	};