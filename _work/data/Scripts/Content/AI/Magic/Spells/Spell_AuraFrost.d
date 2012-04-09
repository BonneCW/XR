// ****************
// Alle AuraFrost Spells
// ****************

const int SPL_Cost_AuraFrost		= 10;

// ------ Instanz für alle normalen AuraFrost-Sprüche ------
instance Spell_AuraFrost (C_Spell_Proto)
{
	time_per_mana			= 0;
	spelltype 				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_CASTER;
	canTurnDuringInvest		= 0;
};

func int Spell_Logic_AuraFrost (var int manaInvested)
{	
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_AuraFrost)
	{		
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_AuraFrost()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_AuraFrost;
	};

	if (C_NpcIsHero(self))
	{
		Mod_AuraFrost = 1;
		Mod_AuraFrost_Counter = 30;
	};

	return;
	
	self.aivar[AIV_SelectSpell] += 1;
};