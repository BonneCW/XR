// **************
// SPL_SummonKrautschaf
// **************

const int SPL_Cost_SummonKrautschaf			= 40;


INSTANCE Spell_SummonKrautschaf (C_Spell_Proto)
{
	time_per_mana			= 0;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
};

func int Spell_Logic_SummonKrautschaf (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_SummonKrautschaf / 2))	
	&& (Npc_GetDistToWP(hero, "SPAWNOW_PATH_190_MOVMENT") < 500)
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_SummonKrautschaf)
	{	
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
	
};

func void Spell_Cast_SummonKrautschaf()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_SummonKrautschaf / 2;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_SummonKrautschaf;
	};
	
	Wld_InsertNpc	(Krautschaf, "SPAWNOW_PATH_190_MOVMENT");
	Wld_InsertNpc	(Krauttroll,	"LOCATION_12_01");

	Mod_Leichengase_Kraut = 5;
	
	self.aivar[AIV_SelectSpell] += 1;
};
