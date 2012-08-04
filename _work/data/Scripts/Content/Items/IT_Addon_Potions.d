/******************************************************************************************/
//	Trank der Geistesveränderung (unwissend zusammengebraut)																		//
/******************************************************************************************/
INSTANCE ItPo_Addon_Geist_01(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	300;	

	visual 			=	"ItPo_Perm_STR.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItPo_Geist_01;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= 	"Trank der Geistesveränderung";
	
	TEXT[2]			=   "Vor der Anwendung sollte man sich ABSICHERN!";
	
	TEXT[3]			= 	"Kann den Verstand derbe beeinflußen ";	
	TEXT[4]			= 	"oder den Anwender töten";
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_ManaEssenz;

};

	FUNC VOID UseItPo_Geist_01()
	{
		
		self.attribute[ATR_HITPOINTS] = (self.attribute[ATR_HITPOINTS] -1000);

		self.aivar[AIV_Damage] -= 1000;

		B_HealGift (10, 0);
	};
/******************************************************************************************/
//	Trank der Geistesveränderung (wissend zusammengebraut)																		//
/******************************************************************************************/
INSTANCE ItPo_Addon_Geist_02(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	300;	

	visual 			=	"ItPo_Perm_STR.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItPo_Geist_02;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= 	"Trank der Geistesveränderung";
	
	TEXT[2]			=   "Vor der Anwendung sollte man sich ABSICHERN!";
	
	TEXT[3]			= 	"Kann den Verstand derbe beeinflußen ";	
	TEXT[4]			= 	"oder den Anwender töten";
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_ManaEssenz;

};

	FUNC VOID UseItPo_Geist_02()
	{
		if Npc_IsPlayer (self)
		{
			B_GivePlayerXP (250);
		};

		B_HealGift (10, 0);
	};
/******************************************************************************************/	
INSTANCE ItPo_Health_Addon_04(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_HpTrunk;	

	visual 			=	"ItPo_Health_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItPo_Health_04;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_HEALTHPOTION"; 


	description		= 	"Reine Lebensenergie";
	
	//TEXT[1]			= 	NAME_Bonus_HP;				
	TEXT[2]			= 	"Vollständige Regeneration";
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_HpTrunk;
};

	FUNC VOID UseItPo_Health_04()
	{		
		self.attribute[ATR_HITPOINTS] =  self.attribute[ATR_HITPOINTS_MAX];

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

		if (Npc_IsPlayer(self))
		&& (Seele_unterwegs == TRUE)
		{
			Seele.attribute[ATR_HITPOINTS] =  Seele.attribute[ATR_HITPOINTS_MAX];
		};

		B_HealGift (10, 0);
	};
/******************************************************************************************/
INSTANCE ItPo_Mana_Addon_04(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_ManaTrunk;	

	visual 			=	"ItPo_Mana_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItPo_Mana_04;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_MANAPOTION"; 


	description		= 	"Reines Mana";
	
	//TEXT[1]			= 	NAME_Bonus_Mana;				
	TEXT[2]			= 	"Vollständige Mana - Regeneration";
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_ManaTrunk;
};

	FUNC VOID UseItPo_Mana_04()
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];

		if (Npc_IsPlayer(self))
		&& (Seele_unterwegs == TRUE)
		{
			Seele.attribute[ATR_MANA] =  Seele.attribute[ATR_MANA_MAX];
		};

		B_HealGift (10, 0);
	};
