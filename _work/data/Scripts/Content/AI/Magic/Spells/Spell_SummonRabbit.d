// **************
// SPL_SummonRabbit
// **************

const int SPL_Cost_SummonRabbit			= 40;


INSTANCE Spell_SummonRabbit (C_Spell_Proto)
{
	time_per_mana			= 0;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
};

func int Spell_Logic_SummonRabbit (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))	
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_SummonRabbit)
	{	
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
	
};

func void Spell_Cast_SummonRabbit()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_SummonRabbit;
	};
	
	Wld_SpawnNpcRange	(self,	Rabbit,				7,	300);
	
	self.aivar[AIV_SelectSpell] += 1;
};
