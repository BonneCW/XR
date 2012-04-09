var int Newworld_Regen;

FUNC VOID Regencheck()
{
	if (Wld_IsRaining())
	{
		if (CurrentLevel == NEWWORLD_ZEN)
		{
			if (Hlp_IsValidNpc(Mod_536_NONE_Thorben_NW))
			{
				if (Thorben_Regen == FALSE)
				&& (!Npc_IsInState(Mod_536_NONE_Thorben_NW, ZS_Talk))
				{
					B_StartOtherRoutine	(Mod_536_NONE_Thorben_NW, "REGEN");

					Thorben_Regen = TRUE;
				};
			};
		};
	}
	else
	{
		if (CurrentLevel == NEWWORLD_ZEN)
		{
			if (Hlp_IsValidNpc(Mod_536_NONE_Thorben_NW))
			{
				if (Thorben_Regen == TRUE)
				&& (!Npc_IsInState(Mod_536_NONE_Thorben_NW, ZS_Talk))
				{
					B_StartOtherRoutine	(Mod_536_NONE_Thorben_NW, "START");

					Thorben_Regen = FALSE;
				};
			};
		};
	};
};