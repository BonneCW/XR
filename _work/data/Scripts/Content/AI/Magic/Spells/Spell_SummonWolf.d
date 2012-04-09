// **************
// SPL_SummonWolf
// **************

const int SPL_Cost_SummonWolf			= 20;


INSTANCE Spell_SummonWolf (C_Spell_Proto)
{
	time_per_mana			= 0;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
};

func int Spell_Logic_SummonWolf (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_SummonWolf)
	{	
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
	
};

func void Spell_Cast_SummonWolf()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_SummonWolf;
	};
	
	if (Npc_IsPlayer(self)) 
	{	
		if (Mod_Gilde == 6)
		|| (Mod_Gilde == 7)
		|| (Mod_Gilde == 8)
		{	
			Wld_SpawnNpcRange	(self,	Summoned_Wolf,		1,	500);
		}
		else if (Mod_Gilde == 9)
		|| (Mod_Gilde == 10)
		|| (Mod_Gilde == 11)
		{
			Wld_SpawnNpcRange	(self, Summoned_Eiswolf,	1,	500);
		}
		else
		{
			Wld_SpawnNpcRange	(self, Summoned_Blackwolf,	1,	500);
		};
	}
	else
	{
		Wld_SpawnNpcRange	(self,	Wolf,				1,	500);
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};
