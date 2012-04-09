// ************************
// SPL_SummonGoblinSkeleton
// ************************

const int SPL_Cost_SummonGoblinSkeleton		= 30;


INSTANCE Spell_SummonGoblinSkeleton (C_Spell_Proto)	//ehem. Spell_Skeleton
{
	time_per_mana			= 0;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
};

func int Spell_Logic_SummonGoblinSkeleton (var int manaInvested)
{	
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_SummonGoblinSkeleton)
	&& (Mod_GottStatus < 5)
	{	
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_SummonGoblinSkeleton()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_SummonGoblinSkeleton;
	};
	
	if (Npc_IsPlayer(self)) 
	{		
		Wld_SpawnNpcRange	(self,	SUMMONED_GOBBO_SKELETON,	1,	500);
	}
	else
	{
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1625_VMG_Neol_MT))
		{
			Wld_SpawnNpcRange	(self,	Gobbo_Skeleton_Neol,			1,	500);
		}
		else if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1628_VMG_Anor_MT))
		{
			Wld_SpawnNpcRange	(self,	Gobbo_Skeleton_Anor,			1,	500);
		}
		else
		{
			Wld_SpawnNpcRange	(self,	Gobbo_Skeleton,			1,	500);
		};
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};
