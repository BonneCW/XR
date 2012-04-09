const int SPL_Cost_Sprint		= 10;

const int SPL_Time_Sprint		= 300000;

instance Spell_Sprint (C_Spell_Proto)
{
	time_per_mana			= 0;
	spelltype 				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_CASTER;
	canTurnDuringInvest		= 0;
};

func int Spell_Logic_Sprint (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Sprint)
	{		
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Sprint()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Sprint;
	};

	Mdl_ApplyOverlayMDSTimed	(self, "HUMANS_SPRINT.MDS", SPL_TIME_SPRINT);

	//Wld_PlayEffect	("SLOW_MOTION_FUN", hero, hero, 0, 0, 0, FALSE);

	if (Mod_Extension_Angelegt == 1)
	&& (CurrentLevel == ORCCITY_ZEN)
	{
		if (!Npc_IsDead(Mod_7179_BDT_Bandit_OC))
		{
			Mdl_ApplyOverlayMDSTimed	(Mod_7179_BDT_Bandit_OC, "HUMANS_SPRINT.MDS", SPL_TIME_SPRINT);
		};
		if (!Npc_IsDead(Mod_7186_BDT_Morgahard_OC))
		{
			Mdl_ApplyOverlayMDSTimed	(Mod_7186_BDT_Morgahard_OC, "HUMANS_SPRINT.MDS", SPL_TIME_SPRINT);
		};
		if (!Npc_IsDead(Mod_7185_BDT_Bandit_OC))
		{
			Mdl_ApplyOverlayMDSTimed	(Mod_7185_BDT_Bandit_OC, "HUMANS_SPRINT.MDS", SPL_TIME_SPRINT);
		};
		if (!Npc_IsDead(Mod_7184_BDT_Esteban_OC))
		{
			Mdl_ApplyOverlayMDSTimed	(Mod_7184_BDT_Esteban_OC, "HUMANS_SPRINT.MDS", SPL_TIME_SPRINT);
		};
		if (!Npc_IsDead(Mod_7183_BDT_Miguel_OC))
		{
			Mdl_ApplyOverlayMDSTimed	(Mod_7183_BDT_Miguel_OC, "HUMANS_SPRINT.MDS", SPL_TIME_SPRINT);
		};
		if (!Npc_IsDead(Mod_7182_BDT_Juan_OC))
		{
			Mdl_ApplyOverlayMDSTimed	(Mod_7182_BDT_Juan_OC, "HUMANS_SPRINT.MDS", SPL_TIME_SPRINT);
		};
		if (!Npc_IsDead(Mod_7181_BDT_Logan_OC))
		{
			Mdl_ApplyOverlayMDSTimed	(Mod_7181_BDT_Logan_OC, "HUMANS_SPRINT.MDS", SPL_TIME_SPRINT);
		};
		if (!Npc_IsDead(Mod_7180_BDT_Skinner_OC))
		{
			Mdl_ApplyOverlayMDSTimed	(Mod_7180_BDT_Skinner_OC, "HUMANS_SPRINT.MDS", SPL_TIME_SPRINT);
		};
	};

	return;
	
	self.aivar[AIV_SelectSpell] += 1;
};
