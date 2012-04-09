// ****************
// Alle AuraFeuer Spells
// ****************

const int SPL_Cost_AuraFeuer		= 10;

// ------ Instanz für alle normalen AuraFeuer-Sprüche ------
instance Spell_AuraFeuer (C_Spell_Proto)
{
	time_per_mana			= 0;
	spelltype 				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_CASTER;
	canTurnDuringInvest		= 0;
};

func int Spell_Logic_AuraFeuer (var int manaInvested)
{	
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_AuraFeuer)
	{		
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_AuraFeuer()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_AuraFeuer;
	};

	if (C_NpcIsHero(self))
	{
		Mod_AuraFeuer = 1;
		Mod_AuraFeuer_Counter = 30;
	};

	return;
	
	self.aivar[AIV_SelectSpell] += 1;
};