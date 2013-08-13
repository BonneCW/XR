// ********************
// ZS_Talk
// -------
// wird von Humans
// UND Monstern benutzt
// ********************

// ------------------
var int zsTalkBugfix; 	//s.u.
// ------------------

FUNC void ZS_Talk ()
{
	// --- Keine Wahrnehmungen angemeldet ---

	// Trade-Multiplier setzen

	if (Mod_Verhandlungsgeschick < 30)
	{
		SetSellingValuePercent (15);
	}
	else if (Mod_Verhandlungsgeschick < 50)
	{
		SetSellingValuePercent (30);
	}
	else if (Mod_Verhandlungsgeschick < 75)
	{
		SetSellingValuePercent (45);
	}
	else if (Mod_Verhandlungsgeschick < 100)
	{
		SetSellingValuePercent (60);
	}
	else if (Mod_Verhandlungsgeschick == 100)
	{
		SetSellingValuePercent (75);
	};
	
	// EXIT IF...

	// ------ Spieler spricht schon mit jemand anderem ------
	if (B_GetAivar(other, AIV_INVINCIBLE) == TRUE)
	{
		return;				
	};

	B_ClearPerceptions(self);
	
	
	// FUNC 
	
	// ------ damit kein Dialogteilnehmer angegriffen wird ------
	B_SetAivar(self, AIV_INVINCIBLE, TRUE);
	B_SetAivar(other, AIV_INVINCIBLE, TRUE);
		
	// ------ NUR bei Humans ------
	if (self.guild < GIL_SEPERATOR_HUM)
	{		
		// ------ NSC sieht Spieler an (funzt auch im Sitzen) ------
		if (C_BodyStateContains (self, BS_SIT))
		{
			if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7241_OUT_Anselm_REL)) {
				AI_UseMob (self, "CHAIR", -1);
			};
			var C_NPC target; target = Npc_GetLookAtTarget(self);
			if (!Hlp_IsValidNpc(target))
			{
				AI_LookAtNpc (self, other);
			};
		}
		else
		{
			B_LookAtNpc (self, other);
		};
	
		// ------ NSC steckt ggf. Waffe weg ------
		AI_RemoveWeapon (self);
		AI_RemoveWeapon (hero);
	};
	
	// ------ NSC dreht sich zum Spieler ------------------------------------------
	if (!C_BodystateContains(self, BS_SIT))
	{	
		B_TurnToNpc (self,	other);
	};
	
	// ------ Spieler dreht sich zum Npc ------------------------------------------
	if (!C_BodystateContains(other, BS_SIT))
	{	
		B_TurnToNpc (other, self);
		
		// ------ Spieler zu nah dran ------
		if (Npc_GetDistToNpc(other,self) < 80) 
		{
			AI_Dodge (other);
		};
	};
	
	// ------ NUR bei Humans ------
	if (self.guild < GIL_SEPERATOR_HUM)
	|| (C_NpcIsDog(self))
	{	
		// ------ Set Face Expression ------
		if (Npc_GetAttitude(self, other) == ATT_ANGRY)
		|| (Npc_GetAttitude(self, other) == ATT_HOSTILE)
		{
			if (!C_PlayerIsFakeBandit(self, other))
			|| (self.guild != GIL_BDT)
			{
				Mdl_StartFaceAni	(self,	"S_ANGRY",	1,	-1);
			};
		};
				
		// ------ Ambient Infos zuweisen ------
		if (self.npctype == NPCTYPE_AMBIENT)
		|| (self.npctype == NPCTYPE_MT_BUDDLER)
		|| (self.npctype == NPCTYPE_MT_SCHATTEN)
		|| (self.npctype == NPCTYPE_MT_GARDIST)
		|| (self.npctype == NPCTYPE_MT_SUMPFNOVIZE)
		|| (self.npctype == NPCTYPE_MT_TEMPLER)
		|| (self.npctype == NPCTYPE_MT_REISBAUER)
		|| (self.npctype == NPCTYPE_MT_SOELDNER)
		|| (self.npctype == NPCTYPE_MT_SCHUERFER)
		|| (self.npctype == NPCTYPE_NW_BAUER)
		|| (self.npctype == NPCTYPE_NW_MILIZ)
		|| (self.npctype == NPCTYPE_NW_PALADIN)
		|| (self.npctype == NPCTYPE_NW_FEUERNOVIZE)
		|| (self.npctype == NPCTYPE_NW_SOELDNER)
		|| (self.npctype == NPCTYPE_FM_SOELDNER)
		|| (self.npctype == NPCTYPE_MT_SCHUERFER)
		|| (self.npctype == NPCTYPE_FM_SCHUERFER)
		|| (self.npctype == NPCTYPE_NW_SCHWARZERNOVIZE)
		|| (self.npctype == NPCTYPE_NW_WASSERKRIEGER)
		|| (self.npctype == NPCTYPE_OM_BUDDLER)
		|| (self.npctype == NPCTYPE_PAT_ORDENSPRIESTER_MAUER)
		|| (self.npctype == NPCTYPE_PAT_PALADIN_MAUER)
		|| (self.npctype == NPCTYPE_OM_SCHWARZERKRIEGER)
		|| (self.npctype == NPCTYPE_EIS_BEWOHNER)
		|| (self.npctype == NPCTYPE_MT_BANDIT)
		|| (self.npctype == NPCTYPE_MT_ORKJAGD)
		|| (self.npctype == NPCTYPE_MT_ORKJAEGER)
		|| (self.npctype == NPCTYPE_REL_BUERGER)
		|| (C_NpcIsDog(self))
		{
			B_AssignAmbientInfos	(self);
		};		

		// ------ ToughGuy NEWS zuweisen -------
		if (C_NpcIsToughGuy (self))
		&& (self.aivar[AIV_ToughGuyNewsOverride] == FALSE)
		{			
			B_AssignToughGuyNEWS (self);
		};				
	};		
		
	if (self.guild == GIL_DRAGON)
	|| (self.guild == GIL_FRIENDLY_ORC)
	{
		AI_PlayAni  (self, "T_STAND_2_TALK");
	};
	
	// ------ START Multiple Choice Dialog ------
	AI_ProcessInfos(self);
	
	zsTalkBugfix = FALSE;	//var resetten!
};

func INT ZS_Talk_Loop ()
{
   	if (InfoManager_HasFinished())
   	&& (zsTalkBugfix == TRUE)			//verhindert, daß InfoManager_HasFinished im ERSTEN FRAME der Loop abgefragt wird --> führt sonst bei MOB-SITZENDEN NSCs (kein Scheiss) zu Abbruch der Loop im ERSTEN FRAME! 
   										//(Problem besteht wegen falscher Reihenfolge der Befehle AI_ProcessInfos und InfoManager_HasFinished)
   	{
		B_SetAivar(self, AIV_INVINCIBLE, FALSE);
		B_SetAivar(other, AIV_INVINCIBLE, FALSE);
		B_SetAivar(self, AIV_NpcStartedTalk, FALSE);
		B_SetAivar(self, AIV_TalkedToPlayer, TRUE);
		
		// ------ NUR bei Humans ------
		if (self.guild < GIL_SEPERATOR_HUM)
		{
			B_StopLookAt (self);
			Mdl_StartFaceAni (self, "S_NEUTRAL", 1, -1); //Reset Face Expression
		};	
	
		if (self.guild == GIL_DRAGON)
		|| (self.guild == GIL_FRIENDLY_ORC)
		{
			AI_PlayAni (self, "T_TALK_2_STAND");
		};

		B_SetAivar(self, AIV_INVINCIBLE, FALSE);
		B_SetAivar(other, AIV_INVINCIBLE, FALSE);
		
		return LOOP_END;
  	}
  	else
   	{
   		zsTalkBugfix = TRUE;
   		
   		return LOOP_CONTINUE;
   	};
};

FUNC VOID ZS_Talk_End ()
{
	// ------ damit nicht nach Dialog+Losgehen gegrüßt wird ------
	if (Mod_Talk_Sicherung == FALSE)
	{
		Npc_SetRefuseTalk(other, 10); //BEACHTEN: other ist Spieler!
	};

	Restore_Questitems();

	// ------ wenn Spieler in meinem Raum ------
	if (C_NpcIsBotheredByPlayerRoomGuild(self))
	|| ( (Wld_GetPlayerPortalGuild() == GIL_PUBLIC) && (Npc_GetAttitude(self,other) != ATT_FRIENDLY) )
	{
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_592_PAL_Hagen_NW))
		&& (Mod_HagenKOScene == 0)
		{
		}
		else if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1621_EBR_Velaya_MT))
		&& (Mod_SLD_Nebel == 2)
		{
		}
		else
		{
			AI_StartState(self, ZS_ObservePlayer, 0, "");
		};
	}
	else
	{

	};
};