// *************
// SPL_FireWave
// *************

const int SPL_Cost_FireWave		= 80;
const int SPL_Damage_FireWave 		= 300;


INSTANCE Spell_FireWave (C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= SPL_Damage_FireWave;	
	targetCollectAlgo		= TARGET_COLLECT_NONE;	// Opfer werden aber erst durch Kollision mit dem Effekt getötet
};

func int Spell_Logic_FireWave (var int manaInvested)
{	
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_FireWave)
	{	
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};


func void Spell_Cast_FireWave()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_FireWave;
	};

	B_PrismaAdd(SPL_Damage_Firewave);
	
	self.aivar[AIV_SelectSpell] += 1;
};
