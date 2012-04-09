// *************
// SPL_Firelance	/K2
// *************

const int SPL_Cost_Firelance		= 10;
const int SPL_Damage_Firelance	= 100;


INSTANCE Spell_Firelance		(C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= SPL_Damage_Firelance;
	damageType				= DAM_MAGIC;
};

func int Spell_Logic_Firelance	(var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Firelance)
	{	
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Firelance()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Firelance;
	};

	B_PrismaAdd(SPL_Damage_Firelance);
	
	self.aivar[AIV_SelectSpell] += 1;
};
