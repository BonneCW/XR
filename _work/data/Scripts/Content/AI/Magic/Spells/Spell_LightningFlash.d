// ******************
// SPL_LightningFlash
// ******************

const int SPL_Cost_LightningFlash 		= 100;
const int SPL_Damage_LightningFlash 	= 150;
const int SPL_ZAPPED_DAMAGE_PER_SEC 	= 2;
const int SPL_TIME_SHORTZAPPED			= 2;


INSTANCE Spell_LightningFlash (C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= SPL_Damage_LightningFlash;
	damageType				= DAM_MAGIC;
};

func int Spell_Logic_LightningFlash (var int manaInvested) //Parameter wird hier nicht gebraucht
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_LightningFlash)
	{
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_LightningFlash()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_LightningFlash;
	};

	if (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Mod_7314_Ziel_AW))
	&& (Npc_KnowsInfo(hero, Info_Mod_PlattformAWBeliar_Erzbrocken))
	&& (Npc_KnowsInfo(hero, Info_Mod_PlattformAWBeliar_Weihwasser))
	{
		Mod_BEL_PortalAktiv = 1;

		Mod_BEL_PortalCounter = 3;

		Wld_SendTrigger	("EVT_AW_PORTAL_PFX");
	};

	B_PrismaAdd(SPL_Damage_LightningFlash);

	self.aivar[AIV_SelectSpell] += 1;
};
