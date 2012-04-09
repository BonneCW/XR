// ***********
// ZS_Wahnsinn
// ***********

func void ZS_Wahnsinn ()
{
	Npc_PercEnable		(self,	PERC_ASSESSDAMAGE, 		B_AssessDamage);
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC,		B_AssessMagic);

	// ------ Guardpassage resetten ------
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	
	// ------ RefuseTalk Counter resetten -----
	Npc_SetRefuseTalk(self,0);
	
	// ------ Temp_Att (upset) "resetten" ------
	Npc_SetTempAttitude(self, Npc_GetPermAttitude(self,hero));

	// ------ Bewegungs-Overlays resetten ------	
	B_StopLookAt	(self);
	AI_StopPointAt	(self);
	
		
	if (!Npc_HasBodyFlag(self, BS_FLAG_INTERRUPTABLE))
	{
		AI_StandUp (self);
	}
	else
	{
		AI_StandUpQuick (self);
	};
};

func int ZS_Wahnsinn_Loop () //Opfer greift nähesten NSC an
{	
  	NPC_PerceiveAll (self);
  
	if (Wld_DetectNpcEx(self, -1, NOFUNC, -1, 0)) //initialisiert other
    	{
		AI_OutputSVM_Overlay (self, other, "$Berzerk");
      		B_Attack(self, other, AR_Kill, 0);
    	};
  
	return LOOP_CONTINUE;
};

func void ZS_Wahnsinn_End()
{

};

