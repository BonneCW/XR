func void ZS_Drained () 
{
    PrintDebugNpc	(PD_TA_FRAME,	"ZS_Drained");

	B_ClearPerceptions(self);
	
	B_UseHat (self);
	
	AI_PlayAniBS 	(self,	"T_STAND_2_VICTIM_SLE",	BS_LIE);
};

func void ZS_Drained_Loop ()
{
	PrintDebugNpc	(PD_TA_LOOP,	"ZS_Drained_Loop");
		
	AI_Wait			(self,	1);
};

func void ZS_Drained_End ()
{
    PrintDebugNpc	(PD_TA_FRAME,	"ZS_Drained_End");
};


		
		
		
		
		
		
		