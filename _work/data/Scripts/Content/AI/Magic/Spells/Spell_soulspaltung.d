// ***************
// SPL_SummonDemon
// ***************

const int SPL_Cost_soulsplit		= 100;


INSTANCE Spell_soulsplit (C_Spell_Proto)	
{
	time_per_mana			= 0;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
};

func int Spell_Logic_soulsplit(var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
		
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_soulsplit)
	{		
		return SPL_SENDCAST;
		
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
		
	};
};

func void Spell_Cast_soulsplit()
{

	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_soulsplit;
		
	};

	if (Npc_IsPlayer(self)) 
	{		
		Wld_SpawnNpcRange (self, PC_seele, 1, 500);
		
		Seele_unterwegs = TRUE;		
	}
	else
	{
		Wld_SpawnNpcRange (self, Demon, 1, 1000);
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};


