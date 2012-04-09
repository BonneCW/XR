INSTANCE ItFo_Plants_mushroom_01(C_Item)
{	
	name 				=	"Höllenpilz";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	5;

	visual 				=	"ItFo_Plants_mushroom_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			= Usemush;
	scemeName			=	"FOOD";

	description			= name;
	
	if (Mod_ItPl_Hoellenpilz_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	10;
	}
	else
	{
		TEXT[1]				= 	"Unbekannte Wirkung";
	};

	TEXT[5]				= NAME_Value;					COUNT[5]	= 5;
};

func void Usemush ()
{
	B_SetEsspunkte	(25);
	Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	10);
	PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Höllenpilz");

	B_HealGift (0, 20);

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

	if (Mod_ItPl_Hoellenpilz_Right == 0)
	&& (Npc_IsPlayer(self))
	{
		Mod_ItPl_Hoellenpilz_Right = 1;

		Mod_ItPl_Hoellenpilz_Anzahl = Npc_HasItems(hero, ItFo_Plants_mushroom_01);
		Npc_RemoveInvItems (hero, ItFo_Plants_mushroom_01, Mod_ItPl_Hoellenpilz_Anzahl);
		CreateInvItems	(hero, ItFo_Plants_mushroom_01, Mod_ItPl_Hoellenpilz_Anzahl);
	};
};