func int C_NpcIsDog(var C_NPC slf)
{
	PrintDebugNpc		(PD_ZS_DETAIL,"C_NpcIsDog");
	
	if (slf.aivar[AIV_MM_REAL_ID] == ID_DOG)
	{
		PrintDebugNpc	(PD_ZS_DETAIL,"...true");
		return TRUE;
	}
	else
	{
		PrintDebugNpc	(PD_ZS_DETAIL,"...false");
		return FALSE;
	};
};