// ******************************************************************
// C_NpcIsSeelenpeiniger
// -------------
// überprüft anhand der gilden ob slf Seelenpeiniger ist
// ******************************************************************

func int C_NpcIsSeelenpeiniger(var C_NPC slf)
{
     	if (slf.guild == GIL_DMT)
	&& (slf.id >= 13000)
	&& (slf.id < 14000)
     	{
     		return TRUE;
     	};
     
     	return FALSE;
};

