// *************
// SPL_Spucke	/k4
// *************

const int SPL_Cost_Spucke	= 0;
const int SPL_Damage_Spucke	= 125;


INSTANCE Spell_Spucke	(C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= SPL_Damage_Spucke;
	damageType			= DAM_MAGIC;
};

func int Spell_Logic_Spucke	(var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Spucke)
	{		
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Spucke()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Spucke;
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};
