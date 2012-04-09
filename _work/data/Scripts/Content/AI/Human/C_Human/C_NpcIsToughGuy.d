// ***********************************************
// C_NpcIsToughGuy
// ---------------
// ist der NSC ein verweichlichter Städter = FALSE 
// oder ein harter Junge, z.B. Bauersknecht = TRUE
// ***********************************************

func int C_NpcIsToughGuy (var C_NPC slf)
{
	// ------ AIVAR ------
	if (slf.aivar[AIV_ToughGuy] == TRUE) 
	{
		return TRUE;
	};

	// ------ ToughGuy-Gilden ------
	if (slf.guild == GIL_MIL)
	|| (slf.guild == GIL_OUT)
	{
		return TRUE;
	};
	
	return FALSE; //Default
};
