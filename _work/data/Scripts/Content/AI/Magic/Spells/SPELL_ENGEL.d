// ************
// SPL_Engel
// ************

const int SPL_Cost_Engel	= 150;
const int SPL_Damage_Engel	= 500;


INSTANCE Spell_Engel (C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= 0;							
	damageType				= DAM_MAGIC;			
	targetCollectAlgo		= TARGET_COLLECT_NONE;
	canTurnDuringInvest     = TRUE;
};

func int Spell_Logic_Engel	(var int manaInvested)
{	
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Engel)
	{		
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Engel()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Engel;
	};
	
	Wld_PlayEffect ("FX_EarthQuake", hero, hero, 0, 0, 0, FALSE);
	
	Wld_SpawnNpcRange (self, engel, 1, 500);

	self.aivar[AIV_SelectSpell] += 1;
};




