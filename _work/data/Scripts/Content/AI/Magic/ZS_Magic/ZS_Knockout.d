func int B_StopKnockout()
{
	Npc_PercDisable	(self,	PERC_ASSESSDAMAGE);

	Mdl_StartFaceAni(self, "S_NEUTRAL", 1, -1);

	Npc_ClearAIQueue(self);
	AI_PlayAni		(self, "T_VICTIM_SLE_2_STAND" );
	AI_StandUp		(self);

	DP_Say("$NachKO", 4); // "Passt auf! Hier treibt sich jemand rum!"

	AI_ContinueRoutine(self);
};		



func void ZS_Knockout()
{
	//Npc_PercEnable		(self,	PERC_ASSESSDAMAGE, 		B_ReactToDamage);
	//Perception_Set_Normal();
	B_ClearPerceptions (self);
	Npc_PercEnable(self, PERC_ASSESSDAMAGE, B_AssessDamage);

// wenn Opfer Schwimmt oder Taucht wird es nicht einschlafen
	if ( C_BodystateContains(self,BS_SWIM) || C_BodystateContains(self,BS_DIVE) )
	{
		AI_ContinueRoutine	( self );
		return;
	};

	if (Npc_WasInState(self, ZS_Unconscious))
	{
		AI_ContinueRoutine	(self);
		return;
	};

	Npc_ClearAIQueue		(self);

	if ( !Npc_HasBodyFlag	(self, BS_FLAG_INTERRUPTABLE) )
	{
		PrintDebugNpc		(PD_MAGIC,	"bodystate not interuptable, standing up...");
		AI_StandUp 			(self);
	};

	DP_Say("$KO", 6); // "uuff!"

	AI_PlayAniBS (self, "T_DEAD", BS_LIE);

	Npc_SetStateTime	(self, 0);
};


func void ZS_Knockout_Loop ()
{
	if (Npc_GetStateTime(self) > 30 ) // ist für 30 Sekunden bewusstlos
	{
		B_StopKnockout();
	};

	AI_Wait	(self,	1);
};


func void ZS_Knockout_End()
{
// nix
};

