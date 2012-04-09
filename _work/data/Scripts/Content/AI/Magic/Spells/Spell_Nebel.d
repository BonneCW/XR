// ***************
// SPL_Nebel
// ***************

const int SPL_Cost_Nebel		= 120;


INSTANCE Spell_Nebel (C_Spell_Proto)
{
	time_per_mana			= 0;
	spelltype = SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
};

func int Spell_Logic_Nebel(var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	&& (Npc_GetDistToWP(hero, "OCC_BARONS_UPSTAIRS_LEFT_BACK_ROOM_LEFT_FRONT") < 1000)
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Nebel)
	&& (Npc_GetDistToWP(hero, "OCC_BARONS_UPSTAIRS_LEFT_BACK_ROOM_LEFT_FRONT") < 1000)
	{	
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Nebel()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Nebel;
	};

	Mod_SLD_Nebel = 1;

	Wld_SendTrigger	("MT_NEBEL_01");
	
	self.aivar[AIV_SelectSpell] += 1;
};


