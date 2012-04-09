// ******************
// SPL_Zerfleischen	K3
// ******************

const int SPL_Cost_Zerfleischen 				= 16;
const int SPL_Damage_Zerfleischen 			= 150; 


INSTANCE Spell_Zerfleischen	(C_Spell_Proto)
{							
	time_per_mana			= 0;
	damage_per_level		= SPL_Damage_Zerfleischen;
	damageType				= DAM_MAGIC;
};

func int Spell_Logic_Zerfleischen (var int manaInvested) //Parameter wird hier nicht gebraucht
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Zerfleischen)
	{		
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Zerfleischen()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Zerfleischen;
	};

	B_PrismaAdd(SPL_Damage_Zerfleischen);
	
	self.aivar[AIV_SelectSpell] += 1;
};
