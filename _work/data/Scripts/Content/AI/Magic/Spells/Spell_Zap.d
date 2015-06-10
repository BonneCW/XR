// ***********
// SPL_Daze
// ***********

const int SPL_Cost_Zap		= 3;
const int SPL_Damage_Zap 	= 30;


INSTANCE Spell_Zap (C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= SPL_Damage_Zap;
	damageType				= DAM_MAGIC;
};

func int Spell_Logic_Zap (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Zap)
	{		
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};


func void Spell_Cast_Zap(var int spellLevel)
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Zap;
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_10033_ORC_UndeadShamane_OGY))
	{
		Mod_NL_UOS_Casting += 1;
	};

	if (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Mod_7314_Ziel_AW))
	&& (Npc_KnowsInfo(hero, Info_Mod_PlattformAWBeliar_Erzbrocken))
	&& (Npc_KnowsInfo(hero, Info_Mod_PlattformAWBeliar_Weihwasser))
	{
		Mod_BEL_PortalAktiv = 1;

		Mod_BEL_PortalCounter = 3;

		Wld_SendTrigger	("EVT_AW_PORTAL_PFX");
	};

	B_PrismaAdd(SPL_Damage_Zap);
	
	self.aivar[AIV_SelectSpell] += 1;
};
