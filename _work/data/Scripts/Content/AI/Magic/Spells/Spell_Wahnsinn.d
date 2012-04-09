// ************
// SPL_Wahnsinn
// ************

const int SPL_Cost_Wahnsinn				= 100;	


instance Spell_Wahnsinn (C_Spell_Proto)
{
	time_per_mana			= 0;					//Wert wird nicht gebraucht - Spell wirkt INSTANT
	spelltype 				= SPELL_NEUTRAL;
	targetCollectRange = 2000;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS;
};

func int Spell_Logic_Wahnsinn (var int manaInvested) //Parameter manaInvested wird hier nicht benutzt
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_Wahnsinn)
	{
		if (Npc_GetActiveSpellIsScroll(self))
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
		}
		else
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Wahnsinn;
		};
		
		if (!C_BodyStateContains(other, BS_SWIM))
		&& (!C_BodyStateContains(other, BS_DIVE))
		&& (!C_NpcIsDown(other))
		&& (Npc_GetDistToNpc (self,other) <= 2000) //max. 20m Abstand
		{		
			Npc_ClearAIQueue	(other);
			B_ClearPerceptions	(other);
			AI_StartState		(other, ZS_Wahnsinn, 0, "");
		};

		return SPL_SENDCAST; //Spell wird auch gecasted, wenn keine Auswirkungen (other geht nicht in ZS) Mana is dann weg - Pech gehabt! (soll so sein!)
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};


func void Spell_Cast_Wahnsinn()
{
	//self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Wahnsinn;			// nicht drin, wegen Kommentar oben
	
	self.aivar[AIV_SelectSpell] += 1;
};






