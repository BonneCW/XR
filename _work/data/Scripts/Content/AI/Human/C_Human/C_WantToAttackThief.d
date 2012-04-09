// *******************
// C_WantToAttackThief
// *******************

func int C_WantToAttackThief (var C_NPC slf, var C_NPC oth)
{
	// ------ ausgenommeme Gilden ------
	// ------ NSC ignoriert Diebstahl ------
	if (slf.aivar[AIV_IGNORE_Theft] == TRUE)
	{
		return FALSE;
	};
	
	if (slf.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		return FALSE;
	};
	
	// ------ Täter war Player und ich bin NPCType_Friend ------
	if ( Npc_IsPlayer(oth) && (slf.npctype == NPCTYPE_FRIEND) )
	{
		return FALSE;
	};
	
	// ------ Torwachen bleiben stehen, memorizen aber Theft ------
	if (C_NpcIsGateGuard(slf))
	{
		return FALSE;
	};
	
	return TRUE;
};
