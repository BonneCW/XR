// ***************
// SPL_Giftteppich
// ***************

const int SPL_Cost_Giftteppich		= 250;


INSTANCE Spell_Giftteppich (C_Spell_Proto)	//ehem. Spell_Geist
{
	time_per_mana			= 0;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
};

func int Spell_Logic_Giftteppich(var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Giftteppich)
	{	
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Giftteppich()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Giftteppich;
	};

	Mod_XW_Kap6 = 10;

	Wld_SendTrigger	("GIFTTEPPICH");

	Mdl_ApplyOverlayMds	(hero, "HUMANS_FLEE.MDS");

	AI_GotoWP	(hero, "ARENA_12");
	
	self.aivar[AIV_SelectSpell] += 1;
};