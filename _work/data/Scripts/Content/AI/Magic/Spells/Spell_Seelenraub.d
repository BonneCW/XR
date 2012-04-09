// **************
// SPL_Seelenraub
// **************

const int SPL_Cost_Seelenraub			= 45;
const int SPL_TIME_Seelenraub                   = 60; //60 Sekunden unter dem Einfluss des Zaubers

INSTANCE Spell_Seelenraub (C_Spell_Proto)
{
	time_per_mana			= 0;					//Wert wird nicht gebraucht - Spell wirkt INSTANT
	spelltype				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS;
	targetCollectRange		= 2000;					//20m
};

func int Spell_Logic_Seelenraub	(var int manaInvested) 	//Parameter manaInvested wird hier nicht benutzt
{
  	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)) || (self.attribute[ATR_MANA] >= SPL_Cost_Seelenraub))
    	{
      		if (!C_BodyStateContains(other, BS_SWIM))
		&& (!C_BodyStateContains(other, BS_DIVE))
	  	&& (!C_NpcIsDown(other))
	  	&& (Npc_GetDistToNpc (self,other) <= 2000) //max. 20m Abstand
	  	{		
	  		Npc_ClearAIQueue	(other);
	  		B_ClearPerceptions	(other);
	  		Npc_SetTempAttitude   (other, ATT_FRIENDLY);
	  		AI_StartState		(other, ZS_Seelenraub, 0, "");
		};
      		return SPL_SENDCAST; //Spell wird auch gecasted, wenn keine Auswirkungen (other geht nicht in ZS) Mana is dann weg - Pech gehabt! (soll so sein!)
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Seelenraub)
	{
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Seelenraub()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Seelenraub;
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};




