// *******************
// Spell_ArgezVision
// *******************

const int SPL_Cost_ArgezVision	= 0;
const int SPL_Damage_ArgezVision  = 99999;


INSTANCE Spell_ArgezVision(C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= SPL_Damage_ArgezVision;	
	targetCollectRange		= 2000;
};

func int Spell_Logic_ArgezVision(var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_ArgezVision)
	{	
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};


func void Spell_Cast_ArgezVision(var int spellLevel)
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_ArgezVision;
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};


