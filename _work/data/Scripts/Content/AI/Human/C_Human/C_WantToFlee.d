// ************
// C_WantToFlee
// ************
	
func int C_WantToFlee (var C_NPC slf, var C_NPC oth)
{
 	//***FIXME***
 	//return FALSE;
 	
 	// EXIT IF...

	if ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_803_STT_Mud_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_793_BAU_Pepe_NW)))
	&& (oth.guild > GIL_SEPERATOR_HUM)
	{
		return TRUE;
	};

	if ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1402_BAU_Bauer_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1404_BAU_Baeuerin_NW)))
	&& (Mod_WM_HexenHagel == 1)
	{
		return TRUE;
	};

	return FALSE;

	if (slf.npctype == NPCTYPE_MAIN)
	{
		return FALSE;
	};
 	
 	// ------ Npctype_Friend flieht nie ------
	if (slf.npctype == NPCTYPE_FRIEND)
	{
		return FALSE;
	};
	
 	// ------ Partymember flieht nie ------
	if (slf.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return FALSE;
	};
 	
 	// ------ GateGuards fliehen nie ------
	if (C_NpcIsGateGuard (slf))
	{
		return FALSE;
	};

	if (slf.guild > GIL_SEPERATOR_HUM)
	{
		return FALSE;
	};
	
		
 	// FUNC 
 	
 	// ------ Flucht, wenn other VIEL stärker ist ------
 	if (slf.level < oth.level)
	&& (slf.npctype != NPCTYPE_MAIN)							
 	{
		return TRUE;
 	};
 	
	return FALSE;
};
 	
