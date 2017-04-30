// ******************
// SPL_SummonSkeleton
// ******************

const int SPL_Cost_SummonSkeleton			= 80;


INSTANCE Spell_SummonSkeleton (C_Spell_Proto)	//ehem. Spell_Skeleton
{
	time_per_mana			= 0;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
};

func int Spell_Logic_SummonSkeleton(var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_SummonSkeleton / 2))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_SummonSkeleton)
	&& (Mod_GottStatus < 5)
	{	
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_SummonSkeleton()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_SummonSkeleton / 2;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_SummonSkeleton;
	};
	
	self.aivar[AIV_SelectSpell] += 1;
	
	if (Npc_IsPlayer(self)) 
	{		
		Wld_SpawnNpcRange	(self,	Summoned_Skeleton,			1,	500);
	}
	else if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7021_GUR_CorKalom_OT))
	&& (self.aivar[AIV_MagicUser] == MAGIC_ALWAYS)
	{
		Wld_SpawnNpcRange	(self,	Gobbo_Skeleton,			6,	500);
		Wld_SpawnNpcRange	(self,	Skeleton,			6,	500);
		Wld_SpawnNpcRange	(self,	Demon,			6,	500);

		self.aivar[AIV_MagicUser] = 0;
	}
	else
	{
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7178_VMG_Albert_OC))
		{
			Wld_SpawnNpcRange	(self,	Skeleton_Albert_OC,			1,	500);
		}
		else if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1958_VMG_Albert_MT))
		{
			Wld_SpawnNpcRange	(self,	Skeleton_Albert_MT,			1,	500);
		}
		else if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1957_VMG_Thorge_MT))
		{
			Wld_SpawnNpcRange	(self,	Skeleton_Thorge_MT,			1,	500);
		}
		else if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1960_VMG_Thorge_TUG))
		{
			Wld_SpawnNpcRange	(self,	Skeleton_Thorge_TUG,			1,	500);

			Mod_Thorge_Skelette += 1;
		}
		else
		{
			Wld_SpawnNpcRange	(self,	Skeleton,			1,	500);
		};
	};
};
