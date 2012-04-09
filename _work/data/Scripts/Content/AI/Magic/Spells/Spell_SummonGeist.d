// ***************
// SPL_SummonGeist
// ***************

const int SPL_Cost_SummonGeist		= 250;


INSTANCE Spell_SummonGeist (C_Spell_Proto)	//ehem. Spell_Geist
{
	time_per_mana			= 0;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
};

func int Spell_Logic_SummonGeist(var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_SummonGeist)
	{	
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_SummonGeist()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_SummonGeist;
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Xeres_02))
	{
		Wld_SpawnNpcRange (self, Summoned_Skeleton_Lord_Ghost_Xeres, 1, 1000);

		Mod_Xeres_Geister += 1;
	}
	else
	{
		Wld_SpawnNpcRange (self, Summoned_Skeleton_Lord_Ghost, 1, 1000);
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};