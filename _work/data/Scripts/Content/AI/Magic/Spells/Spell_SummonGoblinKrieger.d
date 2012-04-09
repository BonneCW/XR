// ************************
// SPL_SummonGoblinKrieger
// ************************

const int SPL_Cost_SummonGoblinKrieger		= 20;


INSTANCE Spell_SummonGoblinKrieger (C_Spell_Proto)	//ehem. Spell_Skeleton
{
	time_per_mana			= 0;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
};

func int Spell_Logic_SummonGoblinKrieger (var int manaInvested)
{	
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_SummonGoblinKrieger)
	{	
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_SummonGoblinKrieger()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_SummonGoblinKrieger;
	};
	
	if (Npc_IsPlayer(self)) 
	{		
		Wld_SpawnNpcRange	(self,	SUMMONED_GOBBO_WARRIOR,	1,	500);
	}
	else
	{
		Wld_SpawnNpcRange	(self,	GOBBO_WARRIOR,	1,	500);
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};
