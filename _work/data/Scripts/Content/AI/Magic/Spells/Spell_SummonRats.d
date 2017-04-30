// **************
// SPL_SummonRats
// **************

const int SPL_Cost_SummonRats			= 40;


INSTANCE Spell_SummonRats (C_Spell_Proto)
{
	time_per_mana			= 0;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
};

func int Spell_Logic_SummonRats (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_SummonRats / 2))	
	&& (Npc_GetDistToWP(self, "NW_PUFF_DANCE") < 500)
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_SummonRats)
	&& (Npc_GetDistToWP(self, "NW_PUFF_DANCE") < 500)
	{	
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
	
};

func void Spell_Cast_SummonRats()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_SummonRats / 2;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_SummonRats;
	};
	
	Wld_SpawnNpcRange	(self,	Rat,				5,	300);

	B_LogEntry	(TOPIC_MOD_AL_LAGERHAUS, "Ich habe es geschafft, jetzt sollte ich wieder zurück ins Lagerhaus gehen.");

	Mod_AL_Rattengespawnt = TRUE;
	
	self.aivar[AIV_SelectSpell] += 1;
};
