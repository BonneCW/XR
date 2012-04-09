const int SPL_Cost_Schwaechen	=	50;

INSTANCE Spell_Schwaechen (C_Spell_Proto)
{
	time_per_mana	=	0;
	spelltype	=	SPELL_NEUTRAL;
	targetCollectAlgo	=	TARGET_COLLECT_FOCUS;
	targetCollectRange	=	2000;
};

FUNC INT Spell_Logic_Schwaechen	(var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	&& (other.guild < GIL_SEPERATOR_HUM)
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Schwaechen)
	&& (other.guild < GIL_SEPERATOR_HUM)
	{	
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

FUNC VOID Spell_Cast_Schwaechen()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA]	=	self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA]	=	self.attribute[ATR_MANA] - SPL_Cost_Schwaechen;
	};

	other.attribute[ATR_HITPOINTS]	=	10;

	Npc_PercEnable	(self, PERC_ASSESSMAGIC, B_AssessMagic);

	Npc_ClearAIQueue(self);
	AI_StandUp	(self);

	Npc_SetTempAttitude	(self, ATT_HOSTILE);

	self.aivar[AIV_SelectSpell] + 1;
};