// ***************
// SPL_SummonUDSwampshark
// ***************

const int SPL_Cost_SummonUDSwampshark		= 80;


INSTANCE Spell_SummonUDSwampshark (C_Spell_Proto)	//ehem. Spell_Golem
{
	time_per_mana			= 0;
	spelltype 				= SPELL_BAD;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
};

func int Spell_Logic_SummonUDSwampshark (var int manaInvested)
{	
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_SummonUDSwampshark / 2))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_SummonUDSwampshark)
	{	
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
	
};

func void Spell_Cast_SummonUDSwampshark()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_SummonUDSwampshark / 2;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_SummonUDSwampshark;
	};
	
	if (Npc_IsPlayer(self)) 
	{		
		Wld_SpawnNpcRange( self,Summoned_UndeadSwampshark,1,500);
	}
	else
	{
		Wld_SpawnNpcRange( self,Swampshark_Undead,1,500);
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};
