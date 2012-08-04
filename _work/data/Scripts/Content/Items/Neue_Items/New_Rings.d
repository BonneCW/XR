instance ItRi_Feuerring_Parlan(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	250;

	visual 					=	"ItRi_Prot_Fire_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;


	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Feuerring von Parlan";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

instance ItRi_DragonRing(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	250;

	visual 					=	"ItRi_Prot_Fire_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;


	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 
	
	on_equip		= Equip_DragonRing;
	on_unequip		= UnEquip_DragonRing;

	description				= "Ring von Dragon";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

FUNC VOID Equip_DragonRing ()
{
	if (CurrentLevel == FREEMINE_ZEN)
	&& (Mod_NL_Dschinn_FM == 0)
	{
		Mod_NL_Dschinn_FM = 1;

		Wld_InsertNpc	(Dschinn_11012_FM, Npc_GetNearestWP(hero));
	}
	else if (CurrentLevel == OLDMINE_ZEN)
	&& (Mod_NL_Dschinn_OM == 0)
	{
		Mod_NL_Dschinn_OM = 1;

		Wld_InsertNpc	(Dschinn_11013_OM, Npc_GetNearestWP(hero));
	}
	else if (CurrentLevel == ABANDONEDMINE_ZEN)
	&& (Mod_NL_Dschinn_VM == 0)
	{
		Mod_NL_Dschinn_VM = 1;

		Wld_InsertNpc	(Dschinn_11014_VM, Npc_GetNearestWP(hero));
	};
};

FUNC VOID UnEquip_DragonRing ()
{
};

instance ItRi_BeliarBosheit(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	250;

	visual 					=	"ItRi_Prot_Fire_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;


	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 
	
	on_equip		= Equip_BeliarBosheit;
	on_unequip		= UnEquip_BeliarBosheit;

	description				= "Beliars Boshiet";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

FUNC VOID Equip_BeliarBosheit ()
{
	RingDerBosheit_Equipped = 1;
};

FUNC VOID UnEquip_BeliarBosheit ()
{
	RingDerBosheit_Equipped = 0;
};

instance ItRi_OrcWarrior_Arena_Ring(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	250;

	visual 					=	"ItRi_Prot_Fire_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;


	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Den Ring hatte der Orkkämpfer bei sich";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

instance Mod_XardasBeamRing(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	250;

	visual 					=	"ItRi_Prot_Fire_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;


	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Dieser Ring bringt mich zum Rat";
	
	on_equip		= Equip_XardasBeamRing;
	on_unequip		= UnEquip_XardasBeamRing;

	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

FUNC VOID Equip_XardasBeamRing()
{
	if (CurrentLevel == NEWWORLD_ZEN)
	&& (Npc_GetDistToWP(hero, "NW_CANTHARINSEL_08") > 10000)
	{
		AI_Teleport	(hero, "NW_KDF_LIBRARY_16");
	}
	else if (CurrentLevel == MINENTAL_ZEN)
	|| (CurrentLevel == ADDONWORLD_ZEN)
	|| (CurrentLevel == RELENDEL_ZEN)
	{
		B_SetLevelchange ("NewWorld\NewWorld.zen", "NW_KDF_LIBRARY_16");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	}
	else
	{
		Print	("Funktioniert hier nicht!");
	};
};

FUNC VOID UnEquip_XardasBeamRing()
{
};

// Spezielle Ringe

instance ItRi_Snapperring(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	250;

	visual 					=	"ItRi_Prot_Fire_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;


	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Snapperkraftring";
	
	on_equip		= Equip_Snapperring;
	on_unequip		= UnEquip_Snapperring;

	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

FUNC VOID Equip_Snapperring()
{
	hero.attribute[ATR_STRENGTH] += 5;
	hero.attribute[ATR_DEXTERITY] += 5;
	hero.attribute[ATR_HITPOINTS_MAX] += 10;
	hero.attribute[ATR_HITPOINTS] += 10;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
};

FUNC VOID UnEquip_Snapperring()
{
	hero.attribute[ATR_STRENGTH] -= 5;
	hero.attribute[ATR_DEXTERITY] -= 5;
	hero.attribute[ATR_HITPOINTS] -= 10;
	hero.attribute[ATR_HITPOINTS_MAX] -= 10;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
};

instance ItRi_Verschlagenheit (C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	250;

	visual 					=	"ItRi_Prot_Fire_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;


	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Ring der Verschlagenheit";
	
	on_equip		= Equip_Verschlagenheit;
	on_unequip		= UnEquip_Verschlagenheit;

	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

FUNC VOID Equip_Verschlagenheit()
{
	hero.attribute[ATR_STRENGTH] += 10;
	hero.attribute[ATR_DEXTERITY] += 10;
	hero.attribute[ATR_MANA_MAX] += 20;
	hero.attribute[ATR_MANA] += 20;

	Mod_Ring_Verschlagenheit_Sneak = Npc_GetTalentSkill(hero, NPC_TALENT_SNEAK);

	Npc_SetTalentSkill	(hero, NPC_TALENT_SNEAK, TRUE);

	Mod_Ring_Verschlagenheit = TRUE;
};

FUNC VOID UnEquip_Verschlagenheit()
{
	hero.attribute[ATR_STRENGTH] -= 10;
	hero.attribute[ATR_DEXTERITY] -= 10;
	hero.attribute[ATR_MANA] -= 20;
	hero.attribute[ATR_MANA_MAX] -= 20;

	Npc_SetTalentSkill	(hero, NPC_TALENT_SNEAK, Mod_Ring_Verschlagenheit_Sneak);

	Mod_Ring_Verschlagenheit = FALSE;
};