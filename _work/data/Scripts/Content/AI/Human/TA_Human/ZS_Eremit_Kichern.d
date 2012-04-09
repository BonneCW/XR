// ************
// ZS_Eremit_Kichern
// ************

const int Eremit_KichernFreq = 4;

func void ZS_Eremit_Kichern () 
{
	Perception_Set_Normal();
	
	B_UseHat (self);
	
	B_ResetAll (self);
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};

	AI_SetWalkmode 	(self,NPC_WALK);
	 	
	if (Npc_GetDistToWP (self,self.wp) > TA_DIST_SELFWP_MAX) 
	{
		AI_GotoWP	(self, self.wp);
	};
};

func int ZS_Eremit_Kichern_Loop ()
{
	if (Npc_IsOnFP (self, "KICHERN"))
	{	
		if (Npc_GetStateTime(self) >= Eremit_KichernFreq)
		{
			Npc_PerceiveAll (self);
			
			var int rnd;
			rnd = Hlp_Random(3);

			if (rnd == 0)
			{
				AI_Output(self, NULL, "Info_Mod_Eremit_Kichern_04_00"); //(lautes Kichern)
			}
			else if (rnd == 1)
			{
				AI_Output(self, NULL, "Info_Mod_Eremit_Kichern_04_01"); //(lautes Kichern)
			}
			else if (rnd == 2)
			{
				AI_Output(self, NULL, "Info_Mod_Eremit_Kichern_04_02"); //(lautes Kichern)
			};
		
			Npc_SetStateTime (self, 0);
		};
	}
	else if (Wld_IsFPAvailable(self,"KICHERN"))
	{
		AI_GotoFP 		(self, "KICHERN");
		AI_StandUp (self);
		AI_AlignToFP 	(self);
	};
	
	return LOOP_CONTINUE;
};

func void ZS_Eremit_Kichern_End ()
{

};