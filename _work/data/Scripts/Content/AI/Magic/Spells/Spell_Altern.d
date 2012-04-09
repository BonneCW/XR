const int SPL_Cost_Altern	=	50;

INSTANCE Spell_Altern (C_Spell_Proto)
{
	time_per_mana	=	0;
	spelltype	=	SPELL_NEUTRAL;
	targetCollectAlgo	=	TARGET_COLLECT_FOCUS;
	targetCollectRange	=	2000;
};

FUNC INT Spell_Logic_Altern	(var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Altern)
	{	
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

FUNC VOID Spell_Cast_Altern()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA]	=	self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA]	=	self.attribute[ATR_MANA] - SPL_Cost_Altern;
	};

	if (other.aivar[AIV_Altern]	==	FALSE)
	{
		Npc_ClearAIQueue	(other);
		B_ClearPerceptions	(other);
		other.attribute[ATR_HITPOINTS_MAX]	=	(other.attribute[ATR_HITPOINTS_MAX] - (other.attribute[ATR_HITPOINTS_MAX] % 25)) / 2;
		if (other.attribute[ATR_HITPOINTS]	>	other.attribute[ATR_HITPOINTS_MAX])
		{
			other.attribute[ATR_HITPOINTS]	=	other.attribute[ATR_HITPOINTS_MAX];
		};

		other.aivar[AIV_Damage] = other.attribute[ATR_HITPOINTS];

		other.attribute[ATR_STRENGTH]	=	(other.attribute[ATR_STRENGTH] - (other.attribute[ATR_STRENGTH] % 10)) / 2;
		other.aivar[AIV_Altern]	=	TRUE;
		AI_SetWalkmode(other, NPC_WALK);
	};

	Npc_PercEnable	(self, PERC_ASSESSMAGIC, B_AssessMagic);

	Npc_ClearAIQueue(self);
	AI_StandUp	(self);

	Npc_SetTempAttitude	(self, ATT_HOSTILE);

	self.aivar[AIV_SelectSpell] + 1;
};