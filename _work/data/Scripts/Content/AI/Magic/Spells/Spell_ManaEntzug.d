const int SPL_Cost_ManaEntzug	=	10;

INSTANCE Spell_ManaEntzug (C_Spell_Proto)
{
	time_per_mana	=	0;
	spelltype	=	SPELL_NEUTRAL;
	targetCollectAlgo	=	TARGET_COLLECT_FOCUS;
	targetCollectRange	=	2000;
};

FUNC INT Spell_Logic_ManaEntzug	(var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_ManaEntzug)
	{	
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

FUNC VOID Spell_Cast_ManaEntzug()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA]	=	self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA]	=	self.attribute[ATR_MANA] - SPL_Cost_ManaEntzug;
	};

	self.attribute[ATR_MANA] += other.attribute[ATR_MANA];
	other.attribute[ATR_MANA] = 0;

	if (self.attribute[ATR_HITPOINTS] > (self.attribute[ATR_HITPOINTS_MAX] / 10))
	{
		self.attribute[ATR_HITPOINTS] = (self.attribute[ATR_HITPOINTS_MAX] / 10);
	};

	Npc_PercEnable	(self, PERC_ASSESSMAGIC, B_AssessMagic);

	Npc_ClearAIQueue(self);
	AI_StandUp	(self);

	Npc_SetTempAttitude	(self, ATT_HOSTILE);

	self.aivar[AIV_SelectSpell] + 1;
};