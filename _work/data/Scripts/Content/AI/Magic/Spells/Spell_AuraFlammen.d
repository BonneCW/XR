// ****************
// Alle AuraFlammen Spells
// ****************

const int SPL_Cost_AuraFlammen		= 10;

// ------ Instanz für alle normalen AuraFlammen-Sprüche ------
instance Spell_AuraFlammen (C_Spell_Proto)
{
	time_per_mana			= 0;
	spelltype 				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_CASTER;
	canTurnDuringInvest		= 0;
};

func int Spell_Logic_AuraFlammen (var int manaInvested)
{	
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_AuraFlammen)
	{		
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_AuraFlammen()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_AuraFlammen;
	};

	if (C_NpcIsHero(self))
	{
		Mod_AuraFlammen = 1;
		Mod_AuraFlammen_Counter = 30;
	};

	return;
	
	self.aivar[AIV_SelectSpell] += 1;
};