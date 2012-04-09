// ****************
// Alle AuraDesStehlens Spells
// ****************

const int SPL_Cost_AuraDesStehlens		= 10;

// ------ Instanz für alle normalen AuraDesStehlens-Sprüche ------
instance Spell_AuraDesStehlens (C_Spell_Proto)
{
	time_per_mana			= 0;
	spelltype 				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_CASTER;
	canTurnDuringInvest		= 0;
};

func int Spell_Logic_AuraDesStehlens (var int manaInvested)
{	
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_AuraDesStehlens)
	{		
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_AuraDesStehlens()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_AuraDesStehlens;
	};

	if (C_NpcIsHero(self))
	{
		Mod_AuraDesStehlens = 1;
	};

	return;
	
	self.aivar[AIV_SelectSpell] += 1;
};