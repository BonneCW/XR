// *****************
// SPL_Laehmen	/k2
// *****************

const int SPL_Cost_Laehmen	= 50;
const int SPL_TIME_Laehmen	= 20;

INSTANCE Spell_Laehmen (C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= 0;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS;
	targetCollectRange		= 1500;
	spelltype 				= SPELL_NEUTRAL;
};

func int Spell_Logic_Laehmen (var int manaInvested)
{	
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Laehmen)
	{		
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};


func void Spell_Cast_Laehmen()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Laehmen;
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7174_DEM_Randolph_NW))
	{
		if (Mod_Randolph_Started == 11)
		{
			Mod_Randolph_Started = 12;

			Wld_SpawnNpcRange (self, DemonLord, 2, 1000);
		};
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};
