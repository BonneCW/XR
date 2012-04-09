const int	Value_MegaBerry		=	10;		const int	HP_MegaBerry		=	-60;
const int	Mana_MegaBerry		=	20;		const int	ManaMax_MegaBerry	=	3;
INSTANCE ItFo_MegaBerry (C_Item)
{	
	name 				=	"Flammenbeere";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_MegaBerry;
	
	visual 				=	"ItFo_Plants_Flameberry_01.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOOD";
	on_state[0]			=	Use_MegaBerry;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		
	COUNT[1]			= 	HP_MegaBerry;
	
	TEXT[3]				=    "Eine seltsame Beere";
	TEXT[4]				=    "";
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_MegaBerry;

};

	FUNC VOID Use_MegaBerry()
	{

		B_SetEsspunkte	(30);
		if (Npc_IsPlayer (self))
		{
			Npc_ChangeAttribute	(self, ATR_HITPOINTS,	HP_MegaBerry);
			B_RaiseAttribute	(self, ATR_STRENGTH, 2);
			B_RaiseAttribute	(self, ATR_DEXTERITY, 1);
			B_RaiseAttribute	(self, ATR_MANA_MAX, ManaMax_MegaBerry);
			Npc_ChangeAttribute	(self, ATR_MANA, Mana_MegaBerry);
		};

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		B_HealGift (0, HP_MegaBerry*-2);
	};