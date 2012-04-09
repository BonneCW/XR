// *******************
// SPL_InstantIceball
// *******************

const int SPL_Cost_InstantIceball			= 7;
const int SPL_TEXT_Damage_InstantIceball 		= 75;


INSTANCE Spell_InstantIceball (C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= SPL_DAMAGE_InstantIceball;
	damageType				= DAM_MAGIC;									// war vorher DAM_Ice
};

func int Spell_Logic_InstantIceball (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_InstantIceball)
	{		
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};


func void Spell_Cast_InstantIceball()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_InstantIceball;
	};

	B_PrismaAdd(SPL_Damage_InstantIceball);
	
	self.aivar[AIV_SelectSpell] += 1;
};
