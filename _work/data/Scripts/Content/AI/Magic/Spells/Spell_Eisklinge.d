// *********
// SPL_Eisklinge
// *********

const int SPL_Cost_Eisklinge				= 20;	
const int SPL_TIME_Eisklinge				= 2;	// in ZS_MagicEisklinge


instance Spell_Eisklinge (C_Spell_Proto)
{
	time_per_mana			= 0;					//Wert wird nicht gebraucht - Spell wirkt INSTANT
	spelltype 				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_CASTER;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
	canTurnDuringInvest     = TRUE;
};

func int Spell_Logic_Eisklinge (var int manaInvested) //Parameter manaInvested wird hier nicht benutzt
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_Eisklinge)
	{
		if (Npc_GetActiveSpellIsScroll(self))
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
		}
		else
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Eisklinge;
		};

		Mod_WM_Eisklinge_Counter = 60*SPL_TIME_EISKLINGE;

		Mod_WM_Eisklinge = TRUE;		
		
	
		return SPL_SENDCAST; //Spell wird auch gecasted, wenn keine Auswirkungen (other geht nicht in ZS) Mana is dann weg - Pech gehabt! (soll so sein!)
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};


func void Spell_Cast_Eisklinge()
{
	//self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Eisklinge;			// nicht drin, wegen Kommentar oben
	
	self.aivar[AIV_SelectSpell] += 1;
};






