// *************
// SPL_HolyWave
// *************

const int SPL_Cost_HolyWave		= 20;
const int SPL_Damage_HolyWave 		= 9999;


INSTANCE Spell_HolyWave (C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= SPL_Damage_HolyWave;	
	targetCollectAlgo		= TARGET_COLLECT_NONE;	// Opfer werden aber erst durch Kollision mit dem Effekt getötet
	targetCollectType		= TARGET_TYPE_ORCS|TARGET_TYPE_UNDEAD;
};

func int Spell_Logic_HolyWave (var int manaInvested)
{	
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	&& (Npc_GetDistToWP(hero, "GRYD_054") < 700)
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_HolyWave)
	&& (Npc_GetDistToWP(hero, "GRYD_054") < 700)
	{	
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};


func void Spell_Cast_HolyWave()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_HolyWave;
	};

	B_PrismaAdd(SPL_Damage_HolyWave);

	Mod_UOS_HolySpell = 1;
	
	self.aivar[AIV_SelectSpell] += 1;
};
