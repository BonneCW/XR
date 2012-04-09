func void B_StopPyrokinesis()
{	
	PrintDebugNpc	(PD_ZS_FRAME,	"B_StopPyrokinesis");

 	Npc_PercDisable	(self,	PERC_ASSESSSTOPMAGIC);
	Npc_PercEnable	(self,	PERC_ASSESSMAGIC,	B_AssessMagic);
	Npc_ClearAIQueue(self);					// alle AI Befehle entfernen
	AI_StandUp		(self);

	if (self.guild < GIL_SEPERATOR_HUM)
	{
		B_AssessDamage();
	}
	else
	{
		AI_StartState	(self,	ZS_MM_Attack, 0, "");
	};

	return;
};	



func int ZS_Pyrokinesis()
{
	PrintDebugNpc		(PD_ZS_FRAME,	"ZS_Pyrokinesis");

	Npc_PercEnable		(self, PERC_ASSESSSTOPMAGIC, B_StopPyrokinesis);
	
	if ( !Npc_HasBodyFlag	( self, BS_FLAG_INTERRUPTABLE) )
	{
		PrintDebugNpc		(PD_MAGIC,	"bodystate not interuptable, standing up...");
		AI_StandUp (self);
	};
	
	if ( !Npc_IsDead(self) && !Npc_IsInState(self, ZS_Unconscious) && !C_BodystateContains(self,BS_SWIM) &&  !C_BodystateContains(self,BS_DIVE) )
	{
		PrintDebugNpc		(PD_MAGIC,	"...NSC ist nicht bewußtlos / tot / schwimmend / tauchend");
		AI_PlayAni			(self, "T_STAND_2_LIGHTNING_VICTIM" );
	};
};


func int ZS_Pyrokinesis_Loop ()
{	
	PrintDebugNpc		(PD_ZS_LOOP, "ZS_Pyrokinesis_Loop" );
	
	B_MagicHurtNpc 		(other, self, SPL_PYROKINESIS_DAMAGE_PER_SEC);

	Npc_SendPassivePerc	(self,	PERC_ASSESSFIGHTSOUND, self, other);

	if (self.attribute[ATR_HITPOINTS] <= 0)
	{
		Npc_ClearAIQueue(self);		// alle AI Befehle entfernen
		AI_StandUp		(self);
	
		return			LOOP_END;
	};

	AI_Wait				(self,	0.5);
	
	return				LOOP_CONTINUE;
};


func void ZS_Pyrokinesis_End()
{
	PrintDebugNpc		( PD_ZS_FRAME, "ZS_Pyrokinesis_End" );
};


	