// *************************************
// NSC steht mit verschränkten Armen rum
// *************************************

func void ZS_Stand_WP_Troll()
{	
	Perception_Set_Monster_Rtn();
	
	B_UseHat (self);
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};

	AI_SetWalkmode 	(self, NPC_WALK);
	B_MM_DeSynchronize();
	if (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)==FALSE) //damit die Monster beim Inserten nicht immer erst zum WP rennen, sondern nur, wenn sie der Heimat zu fern sind
	{
		AI_GotoWP (self, self.WP);
	};
	
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Stand_WP_Troll_loop()
{

	//ADDON>
	if (self.guild == GIL_STONEGUARDIAN)
	&& (RavenIsDead == TRUE)
	{	
		B_KillNpc (self);
	};
	//ADDON<
	
	
	if (self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		if (Wld_IsFPAvailable(self,	"FP"))
		{
			AI_GotoFP (self, "FP");
		};
		
		if (Npc_IsOnFP(self, "FP"))
		{
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
	}
	else //ISINPOS
	{
		if (Hlp_Random(1000) <= 5)
		{
			var int randomMove;
			randomMove = Hlp_Random(3);
			if (randomMove == 0) {AI_PlayAni(self, "R_ROAM1");};
			if (randomMove == 1) {AI_PlayAni(self, "R_ROAM2");};
			if (randomMove == 2) {AI_PlayAni(self, "R_ROAM3");};
		};
	};
	
	return LOOP_CONTINUE;
};

func void ZS_Stand_WP_Troll_end()
{
    
};