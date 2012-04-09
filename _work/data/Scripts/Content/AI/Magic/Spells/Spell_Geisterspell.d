// *********
// SPL_Geisterspell
// *********

const int SPL_Cost_Geisterspell		= 0;
const int SPL_Damage_Geisterspell 		= 0;


INSTANCE Spell_Geisterspell(C_Spell_Proto)
{
	time_per_mana			= 0;
	spelltype 				= SPELL_NEUTRAL;
	damage_per_level		= SPL_Damage_Geisterspell;
	damageType				= DAM_MAGIC;						// war vorher DAM_FIRE
};

func int Spell_Logic_Geisterspell(var int manaInvested)
{
	if (((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_Geisterspell))
	&& (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Mod_1553_PIR_GEISTERPIRAT_DI))
	{
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Geisterspell()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Geisterspell;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Geisterspell;
	};
	
	other.attribute[ATR_HITPOINTS] -= other.attribute[ATR_HITPOINTS_MAX] / 3;

	if (other.attribute[ATR_HITPOINTS] == 1)
	{
		other.attribute[ATR_HITPOINTS] = 0;
	};

	self.aivar[AIV_SelectSpell] += 1;
};
