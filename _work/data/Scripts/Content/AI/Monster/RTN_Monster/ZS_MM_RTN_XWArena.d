// ************** 
// ZS_MM_Rtn_XWArena
// **************

func void ZS_MM_Rtn_XWArena()  
{
	Perception_Set_Monster_Rtn();
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};

	AI_SetWalkmode 	(self, NPC_WALK);

	B_MM_DeSynchronize();

	self.senses_range = 10000;
	
	self.aivar[AIV_TAPOSITION] = NOTINPOS;

	if (Hlp_StrCmp(Npc_GetNearestWP(self), "ARENA_01")==FALSE)  //damit die Monster beim Inserten nicht immer erst zum WP rennen, sondern nur, wenn sie der Heimat zu fern sind
	{
		AI_GotoWP (self, "ARENA_01");
	};
};

func int ZS_MM_Rtn_XWArena_Loop ()
{
	
	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_XWArena_End ()
{

};







