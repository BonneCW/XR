INSTANCE ItMi_Alchemy_Alcohol_01 (C_Item)
{
	name 				=	"Reiner Alkohol";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	25;

	visual 				=	"ItMi_Alchemy_Alcohol_01.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE ItMi_Stuff_Gearwheel_01(C_Item)
{	
	name 				=	"Zahnrad";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;	

	value 				=	0;

	visual 				=	"ItMi_Stuff_Gearwheel_01.3ds";
	material 			=	MAT_METAL;
	description			=	name;
};

INSTANCE ItMi_Stuff_Barbknife_01 (C_Item)
{
	name 				=	"Rasiermesser";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	25;

	visual 				=	"ItMi_Stuff_Barbknife_01.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE ItMi_Ast (C_Item)
{
	name 				=	"Ast";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	1;

	visual 				=	"Ast.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE ItMi_Schmelzschwert (C_Item)
{
	name 				=	"geschmolzenes Schwert";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_SHOW;

	value 				=	0;

	visual 				=	"ItMi_SleeperKey_01.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE  ItMi_OrcTalisman(C_Item)
{
	name 			= "orkischer Talisman";

	mainflag 		= ITEM_KAT_MAGIC;
	flags 			= ITEM_AMULET|ITEM_MISSION;

	value 			= 1000;

	visual 			= "ItMi_Amulet_UluMulu_01.3ds";

	visual_skin 	= 0;
	material 		= MAT_METAL;

	on_equip		= Equip_OrcTalisman;
	on_unequip		= UnEquip_OrcTalisman;

	description		= name;
	TEXT[2]			= NAME_Prot_Fire;
	COUNT[2]		= 20;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

FUNC VOID Equip_OrcTalisman()
{
 	self.protection [PROT_FIRE] += 20;
};


FUNC VOID UnEquip_OrcTalisman()
{
	self.protection [PROT_FIRE] -= 20;
};

INSTANCE ItFo_SwampSharkFleisch (C_Item)
{	
	name 				=	"Sumpfhaifleisch";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	6;
	
	visual 				=	"ItFoMuttonRaw.3DS";
	material 			=	MAT_LEATHER;
	scemename			=	"VERTEILEN";
	on_state[0]			=	Use_SwampSharkFleisch;

	description			= 	name;
	TEXT[1]				=	"Zum Füttern der Weibchen im Grenzgebiet benutzen";
	
	TEXT[5]				= 	NAME_Value;			
	COUNT[5]			= 	value;

};

	FUNC VOID Use_SwampSharkFleisch()
	{
		if (Mod_ImGrenzgebiet == 1)
		{
			Mod_EchsenQuest_01_FleischAbgelegt += 1;

			Print ("Sumpfhaifleisch fallen gelassen");

			if (Mod_EchsenQuest_01_FleischAbgelegt == 5)
			{
				Mod_EchsenQuest_01 = 2;

				B_LogEntry	(TOPIC_MOD_ECHSEN_WEIBCHENFUETTERUNG, "Gut, das Fleisch wäre dann schonmal im Grenzgebiet. Die nächsten fünf Sumpfhaie soll ich schwächen und dann ins Grenzgebiet locken.");

				Wld_InsertNpc	(Swampshark_Fuetterung_02_01,	"ADW_BANDIT_VP3_05");
				Wld_InsertNpc	(Swampshark_Fuetterung_02_02,	"ADW_BANDIT_VP3_05");
				Wld_InsertNpc	(Swampshark_Fuetterung_02_03,	"ADW_BANDIT_VP3_03");
				Wld_InsertNpc	(Swampshark_Fuetterung_02_04,	"ADW_SHARK_02");
				Wld_InsertNpc	(Swampshark_Fuetterung_02_05,	"ADW_SHARK_01");
			};
		}
		else
		{
			CreateInvItems	(hero, ItFo_SwampSharkFleisch, 1);

			Print ("Das geht hier nicht!");
		};
	};


INSTANCE IR_BlueLight_01 (C_Item)
{
	name 				=	"";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Aquamarine;

	visual 				=	"Luftblase_Invisible.3ds";
	material 			=	MAT_STONE;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_BLUELIGHT"; 

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC_STANDARD;
	
};
INSTANCE IR_BlueLight_02 (C_Item)
{
	name 				=	"";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Aquamarine;

	visual 				=	"Luftblase_Invisible.3ds";
	material 			=	MAT_STONE;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_BLUELIGHT"; 

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC_STANDARD;
	
};
INSTANCE IR_BlueLight_03 (C_Item)
{
	name 				=	"";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Aquamarine;

	visual 				=	"Luftblase_Invisible.3ds";
	material 			=	MAT_STONE;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_BLUELIGHT"; 

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC_STANDARD;
	
};
INSTANCE IR_BlueLight_04 (C_Item)
{
	name 				=	"";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Aquamarine;

	visual 				=	"Luftblase_Invisible.3ds";
	material 			=	MAT_STONE;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_BLUELIGHT"; 

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC_STANDARD;
	
};
INSTANCE IR_BlueLight_05 (C_Item)
{
	name 				=	"";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Aquamarine;

	visual 				=	"Luftblase_Invisible.3ds";
	material 			=	MAT_STONE;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_BLUELIGHT"; 

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC_STANDARD;
	
};
INSTANCE IR_BlueLight_06 (C_Item)
{
	name 				=	"";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Aquamarine;

	visual 				=	"Luftblase_Invisible.3ds";
	material 			=	MAT_STONE;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_BLUELIGHT"; 

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC_STANDARD;
	
};
INSTANCE IR_BlueLight_07 (C_Item)
{
	name 				=	"";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Aquamarine;

	visual 				=	"Luftblase_Invisible.3ds";
	material 			=	MAT_STONE;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_BLUELIGHT"; 

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC_STANDARD;
	
};
INSTANCE IR_BlueLight_08 (C_Item)
{
	name 				=	"";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Aquamarine;

	visual 				=	"Luftblase_Invisible.3ds";
	material 			=	MAT_STONE;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_BLUELIGHT"; 

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC_STANDARD;
	
};


INSTANCE IR_RedLight_01 (C_Item)
{
	name 				=	"";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Aquamarine;

	visual 				=	"Luftblase_Invisible.3ds";
	material 			=	MAT_STONE;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_REDLIGHT"; 

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC_STANDARD;
	
};
INSTANCE IR_RedLight_02 (C_Item)
{
	name 				=	"";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Aquamarine;

	visual 				=	"Luftblase_Invisible.3ds";
	material 			=	MAT_STONE;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_REDLIGHT"; 

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC_STANDARD;
	
};
INSTANCE IR_RedLight_03 (C_Item)
{
	name 				=	"";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Aquamarine;

	visual 				=	"Luftblase_Invisible.3ds";
	material 			=	MAT_STONE;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_REDLIGHT"; 

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC_STANDARD;
	
};
INSTANCE IR_RedLight_04 (C_Item)
{
	name 				=	"";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Aquamarine;

	visual 				=	"Luftblase_Invisible.3ds";
	material 			=	MAT_STONE;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_REDLIGHT"; 

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC_STANDARD;
	
};
INSTANCE IR_RedLight_05 (C_Item)
{
	name 				=	"";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Aquamarine;

	visual 				=	"Luftblase_Invisible.3ds";
	material 			=	MAT_STONE;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_REDLIGHT"; 

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC_STANDARD;
	
};
INSTANCE IR_RedLight_06 (C_Item)
{
	name 				=	"";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Aquamarine;

	visual 				=	"Luftblase_Invisible.3ds";
	material 			=	MAT_STONE;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_REDLIGHT"; 

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC_STANDARD;
	
};
INSTANCE IR_RedLight_07 (C_Item)
{
	name 				=	"";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Aquamarine;

	visual 				=	"Luftblase_Invisible.3ds";
	material 			=	MAT_STONE;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_REDLIGHT"; 

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC_STANDARD;
	
};
INSTANCE IR_RedLight_08 (C_Item)
{
	name 				=	"";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Aquamarine;

	visual 				=	"Luftblase_Invisible.3ds";
	material 			=	MAT_STONE;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_REDLIGHT"; 

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC_STANDARD;
	
};

INSTANCE ItMw_HolzAxt (C_Item)
{	
	name 				=	"Holzfälleraxt";  
	
	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;
	material 			=	MAT_WOOD;
	
	value 				=	0;
	
	visual 				=	"itmw_holzaxt.3ds";
	
	description			= name;
	TEXT[1]				= NAME_Value;					COUNT[1]	= value;
};


INSTANCE ItMw_HolzAxt_h (C_Item)
{	
	name 				=	"Holzfälleraxt";  
	
	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;
	material 			=	MAT_WOOD;
	
	value 				=	0;
	
	visual 				=	"ItMw_HolzAxt_H.3ds";
	
	description			= name;
	TEXT[1]				= NAME_Value;					COUNT[1]	= value;
};