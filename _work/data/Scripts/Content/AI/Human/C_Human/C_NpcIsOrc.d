func int C_NpcIsOrc(var C_NPC slf)
{
	PrintDebugNpc		(PD_ZS_DETAIL,"C_NpcIsOrc");
	
	if (slf.guild == GIL_ORC)
	|| (self.aivar[AIV_MM_REAL_ID] == ID_ORCDOG)
	|| (self.aivar[AIV_MM_REAL_ID] == ID_ORCBITER)	
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