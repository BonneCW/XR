FUNC INT C_CanDefenseBreak (var C_NPC slf)
{
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(PC_Hero))
	&& (DefenseBreak_Perk)
	{
		return TRUE;
	};

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_533_SLD_Gorn_NW))
	{
		return TRUE;
	};

	return FALSE;
};