const int SPL_Cost_Zaehmen	=	50;

INSTANCE Spell_Zaehmen (C_Spell_Proto)
{
	time_per_mana	=	0;
	spelltype	=	SPELL_NEUTRAL;
	targetCollectAlgo	=	TARGET_COLLECT_FOCUS;
	targetCollectRange	=	2000;
};

FUNC INT Spell_Logic_Zaehmen	(var int manaInvested)
{
	if (other.aivar[AIV_Zaehmen] == FALSE)
	&& (other.guild > GIL_SEPERATOR_HUM)
	&& (Monster_Gezaehmt == FALSE)
	{
		if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
		{	
			return SPL_SENDCAST;
		}
		else if (self.attribute[ATR_MANA] >= SPL_Cost_Zaehmen)
		{	
			return SPL_SENDCAST;
		}
		else
		{
			return SPL_SENDSTOP;
		};
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

FUNC VOID Spell_Cast_Zaehmen()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA]	=	self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA]	=	self.attribute[ATR_MANA] - SPL_Cost_Zaehmen;
	};

	if (other.aivar[AIV_Zaehmen]	==	FALSE)
	{
		Npc_ClearAIQueue	(other);
		B_ClearPerceptions	(other);
		B_SetAttitude	(self, ATT_FRIENDLY);
		other.aivar[AIV_Zaehmen]	=	TRUE;
		other.aivar[AIV_Partymember]	=	TRUE;
		Monster_Gezaehmt	= TRUE;
	};

	Npc_ClearAIQueue(self);
	AI_StandUp	(self);

	self.start_aistate	= ZS_MM_RTN_Zaehmen;

	AI_StartState	(other, ZS_MM_RTn_Zaehmen, 1, "");

	self.aivar[AIV_SelectSpell] + 1;
};