// ****************
// Alle AuraHeilung Spells
// ****************

const int SPL_Cost_AuraHeilung		= 10;

// ------ Instanz für alle normalen AuraHeilung-Sprüche ------
instance Spell_AuraHeilung (C_Spell_Proto)
{
	time_per_mana			= 0;
	spelltype 				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_CASTER;
	canTurnDuringInvest		= 0;
};

func int Spell_Logic_AuraHeilung (var int manaInvested)
{	
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_AuraHeilung)
	{		
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_AuraHeilung()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_AuraHeilung;
	};

	if (C_NpcIsHero(self))
	{
		Mod_AuraHeilung = 1;
		Mod_AuraHeilung_Counter = 30;
	};

	return;
	
	self.aivar[AIV_SelectSpell] += 1;
};