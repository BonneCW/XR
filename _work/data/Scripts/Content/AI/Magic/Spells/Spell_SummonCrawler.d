// ******************
// SPL_SummonCrawler	/k3
// ******************

const int SPL_Cost_SummonCrawler			= 60;


INSTANCE Spell_SummonCrawler (C_Spell_Proto)	
{
	time_per_mana			= 0;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
};

func int Spell_Logic_SummonCrawler(var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_SummonCrawler / 2))
	&& (Npc_GetDistToWP(hero, "REL_HS_007") < 500)
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_SummonCrawler)
	{	
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_SummonCrawler()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_SummonCrawler / 2;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_SummonCrawler;
	};
	
	self.aivar[AIV_SelectSpell] = (self.aivar[AIV_SelectSpell] + 1);
	
	if (Npc_IsPlayer(self)) 
	{		
		Wld_SendTrigger	("EVT_CRAWLERLOCH");

		AI_Teleport	(hero, "REL_302");

		AI_Teleport	(Mod_7011_HS_Alex_REL, "REL_302");
		B_StartOtherRoutine	(Mod_7011_HS_Alex_REL, "CRAWLERLOCH");

		Wld_PlayEffect("BLACK_SCREEN", hero, hero, 0, 0, 0, TRUE);

		Mod_SL_PartLochgraeber = 1;
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};
