// *********
// SPL_Unsichtbarkeit
// *********
const int SPL_Cost_Unsichtbarkeit			= 10;

INSTANCE Spell_Unsichtbarkeit (C_Spell_Proto)
{
	time_per_mana			= 500;
	spelltype 				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
	targetCollectRange		= 0;
	targetCollectAzi		= 0;
	targetCollectElev		= 0;
};

// ------ SPL_Unsichtbarkeit ------
func int Spell_Logic_Unsichtbarkeit(var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Unsichtbarkeit)
	{		
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Unsichtbarkeit()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Unsichtbarkeit;
	};

	if (Unsichtbarkeitsperk == FALSE)
	{
		hero.flags = NPC_FLAG_GHOST;

		Unsichtbarkeitsperk = True;

		AI_Teleport	(hero, "PC_HERO");
	}
	else
	{
		hero.flags = 0;

		Unsichtbarkeitsperk = FALSE;

		AI_Teleport	(hero, "PC_HERO");
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};
