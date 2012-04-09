INSTANCE ItMi_Kokosnuss (C_Item)
{	
	name 				=	"Kokosnuss";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;
	
	value 				=	6;
	
	visual 				=	"ITMI_KOKOSNUSS01.3ds";
	material 			=	MAT_LEATHER;
	scemeName			=	"MAPSEALED";
	on_state[0]			=	Use_Kokosnuss;

	description			= 	name;
	
	
	
	TEXT[5]				= 	NAME_Value;			
	COUNT[5]			= 	value;

};

	FUNC VOID Use_Kokosnuss()
	{
		CreateInvItems	(self, ItFo_Kokosnussfleisch, 1);
	};

INSTANCE ItFo_Kokosnussfleisch (C_Item)
{	
	name 				=	"Kokosnussfleisch";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	6;
	
	visual 				=	"ITMI_KOKOSFLEISCH01.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"MEAT";
	on_state[0]			=	Use_Kokosnussfleisch;

	description			= 	name;
	
	if (Mod_ItFo_Kokosnussfleisch_Right == 1)
	{
		TEXT[1]				= 	NAME_Bonus_HP;	
		COUNT[1]			= 	6;
	};
	
	TEXT[5]				= 	NAME_Value;			
	COUNT[5]			= 	value;

};

	FUNC VOID Use_Kokosnussfleisch()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	6);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		B_SetEsspunkte	(40);

		if (Mod_ItFo_Kokosnussfleisch_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItFo_Kokosnussfleisch_Right = 1;

			Mod_ItFo_Kokosnussfleisch_Anzahl = Npc_HasItems(hero, ItFo_Kokosnussfleisch);
			Npc_RemoveInvItems (hero, ItFo_Kokosnussfleisch, Mod_ItFo_Kokosnussfleisch_Anzahl);
			CreateInvItems	(hero, ItFo_Kokosnussfleisch, Mod_ItFo_Kokosnussfleisch_Anzahl);
		};
	};