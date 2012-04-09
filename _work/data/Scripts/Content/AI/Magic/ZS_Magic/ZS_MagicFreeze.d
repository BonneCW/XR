// *****************
// B_StopMagicFreeze
// *****************

func void B_RestartFreeze()
{
	if (Npc_GetLastHitSpellID(self) == SPL_IceCube)
	|| (Npc_GetLastHitSpellID(self) == SPL_IceWave)		
	|| (Npc_GetLastHitSpellID(self) == SPL_IceRain)
	{
		Npc_SetStateTime(self,0);
	};
};


func void B_StopMagicFreeze()
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
// ZS_MagicFreeze
// **************

func int ZS_MagicFreeze()
{
	Npc_PercEnable		(self, PERC_ASSESSMAGIC, B_RestartFreeze); 		// falls ein NSC nochmal von einem Freezespell getroffen wurde, so muss die State Time reseted werden

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		Npc_PercEnable  	(self, PERC_ASSESSDAMAGE, B_AssessDamage_Hero);
	};
	
	Npc_StopAni(self, "S_FIRE_VICTIM");										// falls der NSC am Zappeln ist, brich die Ani ab

	// Opfer wird in Bodystate Unconscious versetzt
	if (!C_BodyStateContains(self, BS_UNCONSCIOUS)) 
	{
		AI_PlayAniBS 		(self, "T_STAND_2_FREEZE_VICTIM", BS_UNCONSCIOUS);
	};
	self.aivar[AIV_FreezeStateTime] = 0;
};



func int ZS_MagicFreeze_Loop ()
{	
	// EXIT LOOP IF...
	
	if (Npc_GetStateTime(self) > SPL_TIME_FREEZE)
	{
		B_StopMagicFreeze();
		return LOOP_END;
	};
	
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PC_Hero))
	&& (Npc_GetDistToWP(PC_Hero, "OCC_MERCS_RIGHT_ROOM_BACK") < 500)
	{
		B_StopMagicFreeze();
		return LOOP_END;
	};
	
	// LOOP FUNC
	if (Npc_GetStateTime(self) != self.aivar[AIV_FreezeStateTime])
	{
		self.aivar[AIV_FreezeStateTime] = Npc_GetStateTime(self);
	
		// ------ Damage abziehen, aber NICHT sterben (immer mindeststens 1 LE behalten) ------
		if (self.attribute[ATR_HITPOINTS]+1 > SPL_FREEZE_DAMAGE)
		{
			if (Npc_KnowsInfo(hero, Info_Mod_Xeres_Hi))
			&& (!Mod_Xeres_Kampf01)
			{
				return LOOP_CONTINUE;
			};

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
	
	return LOOP_CONTINUE;
};


func void ZS_MagicFreeze_End()
{

	if (Npc_IsPlayer(self))
	{
		Npc_ClearAIQueue(self);

		AI_StandUP	(self);

		AI_Teleport	(self, "PC_HERO");

		return;		//Spieler bekommt Kontrolle wieder
	};
};