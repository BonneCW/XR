// *********
// SPL_BeliarCity
// *********

const int SPL_Cost_BeliarCity			= 20;

const int SPL_Duration_BeliarCity		= 5;	//fester Wert wird nur für die IT_Runenverwendet (Zeit in Minuten)	
const int SPL_TIME_BeliarCity		= 300;


INSTANCE Spell_BeliarCity (C_Spell_Proto)
{
	time_per_mana			= 500;
	spelltype 				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS;
};

// ------ SPL_BeliarCity ------
func int Spell_Logic_BeliarCity(var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_BeliarCity)
	{		
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_BeliarCity()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_BeliarCity;
	};

	Mod_Spell_BeliarCity = TRUE;

	Npc_SetStateTime(self, 0);

	ZS_BeliarCity();

	//AI_StartState	(self, ZS_BeliarCity, 0, "");

	self.aivar[AIV_SelectSpell] += 1;
};