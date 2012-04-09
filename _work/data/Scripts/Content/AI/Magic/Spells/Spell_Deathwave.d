// *************
// SPL_Deathwave
// *************

const int SPL_Cost_Deathwave		= 20;
const int SPL_Damage_Deathwave 		= 500;


INSTANCE Spell_Deathwave (C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= SPL_Damage_Deathwave;	
	targetCollectAlgo		= TARGET_COLLECT_NONE;	// Opfer werden aber erst durch Kollision mit dem Effekt getötet
};

func int Spell_Logic_Deathwave (var int manaInvested)
{	
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Deathwave)
	&& (Mod_GottStatus < 5)
	{	
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};


func void Spell_Cast_Deathwave()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Deathwave;
	};

	B_PrismaAdd(SPL_Damage_DeathWave);
	
	self.aivar[AIV_SelectSpell] += 1;
};
