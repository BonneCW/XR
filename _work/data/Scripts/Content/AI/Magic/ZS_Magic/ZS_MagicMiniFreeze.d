// *****************
// B_StopMagicMiniFreeze
// *****************

func void B_RestartMiniFreeze()
{
	Npc_SetStateTime(self,0);
};


func void B_StopMagicMiniFreeze()
{	
	Npc_PercEnable	(self, PERC_ASSESSMAGIC, B_AssessMagic);
	
	Npc_ClearAIQueue(self);
	AI_StandUp		(self);

	if (self.guild < GIL_SEPERATOR_HUM)
	{
		B_AssessDamage();
	}
	else
	{
		Npc_SetTempAttitude (self, ATT_HOSTILE); //falls nicht schon Gilden-Attitüde hostile ist 
	};
	
	// nach Aufruf dieses Befehles wird die Loop über return LOOP_END beendet
};

// **************
// ZS_MagicMiniFreeze
// **************

func int ZS_MagicMiniFreeze()
{
	Npc_PercEnable		(self, PERC_ASSESSMAGIC, B_RestartMiniFreeze); 		// falls ein NSC nochmal von einem Freezespell getroffen wurde, so muss die State Time reseted werden
	
	Npc_StopAni(self, "S_FIRE_VICTIM");										// falls der NSC am Zappeln ist, brich die Ani ab

	// Opfer wird in Bodystate Unconscious versetzt
	if (!C_BodyStateContains(self, BS_UNCONSCIOUS)) 
	{
		AI_PlayAniBS 		(self, "T_STAND_2_FREEZE_VICTIM", BS_UNCONSCIOUS);
	};
	self.aivar[AIV_FreezeStateTime] = 0;
};



func int ZS_MagicMiniFreeze_Loop ()
{	
	// EXIT LOOP IF...
	
	if (Npc_GetStateTime(self) > 1)
	{
		B_StopMagicMiniFreeze();
		return LOOP_END;
	};
	
	// LOOP FUNC
	if (Npc_GetStateTime(self) != self.aivar[AIV_FreezeStateTime])
	{
		self.aivar[AIV_FreezeStateTime] = Npc_GetStateTime(self);
	
		// ------ Damage abziehen, aber NICHT sterben (immer mindeststens 1 LE behalten) ------
		if (self.attribute[ATR_HITPOINTS] > (self.attribute[ATR_HITPOINTS] - SPL_FREEZE_DAMAGE))
		{
			// feuer wesen erhalten doppelten schaden
			if (self.guild == GIL_FIREGOLEM)
			|| (self.aivar[AIV_MM_REAL_ID]	== 	ID_FIREWARAN)
			|| (self.aivar[AIV_MM_REAL_ID]	== 	ID_DRAGON_FIRE)		
			{
				B_MagicHurtNpc 		(other,	self, SPL_FREEZE_DAMAGE*2);
				return LOOP_CONTINUE;
			};
			
			// eis wesen erhalten halben schaden
			if (self.guild == GIL_ICEGOLEM)
			|| (self.aivar[AIV_MM_REAL_ID]==ID_DRAGON_ICE)
			{
				B_MagicHurtNpc 		(other, self, SPL_FREEZE_DAMAGE/2);
				return LOOP_CONTINUE;
			};
	
			// rest ganz normal
			B_MagicHurtNpc 		(other,	self, SPL_FREEZE_DAMAGE);
		};
	};
	
	return				LOOP_CONTINUE;
};


func void ZS_MagicMiniFreeze_End()
{

	if (Npc_IsPlayer(self))
	{
		return;		//Spieler bekommt Kontrolle wieder
	};
};
