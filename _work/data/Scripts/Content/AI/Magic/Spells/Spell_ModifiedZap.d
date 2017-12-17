// ****************
// SPL_ModifiedZap	/K3
// ****************

const int SPL_Cost_ModifiedZap 	= 100;
const int SPL_Damage_ModifiedZap 	= 250;


INSTANCE Spell_ModifiedZap  (C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= SPL_Damage_ModifiedZap; 							
	damageType				= DAM_MAGIC;										
	targetCollectAlgo		= TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	canTurnDuringInvest     = TRUE;
	canChangeTargetDuringInvest      = TRUE;
};

func int Spell_Logic_ModifiedZap	(var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	&& (Npc_GetDistToWP(self, "BL_RAVEN_01") < 500)
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_ModifiedZap)
	&& (Npc_GetDistToWP(self, "BL_RAVEN_01") < 500)
	{		
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_ModifiedZap()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_ModifiedZap;
	};

	Mod_BEL_PortalAktiv = 1;

	Mod_BEL_PortalCounter = 300;

	Wld_SendTrigger	("EVT_AW_PORTAL_PFX");

	B_PrismaAdd(SPL_Damage_ModifiedZap);
	
	self.aivar[AIV_SelectSpell] += 1;
};




