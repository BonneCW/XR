// *******************
// Spell_EarthquakeNew
// *******************

const int SPL_Cost_EarthquakeNew	= 50;
const int SPL_Damage_EarthquakeNew  = 100;


INSTANCE Spell_EarthquakeNew(C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= SPL_Damage_EarthquakeNew;
	damageType				= DAM_BLUNT;		
	targetCollectRange		= 1000;
};

func int Spell_Logic_EarthquakeNew(var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_EarthquakeNew)
	{	
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};


func void Spell_Cast_EarthquakeNew(var int spellLevel)
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_EarthquakeNew;
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};


