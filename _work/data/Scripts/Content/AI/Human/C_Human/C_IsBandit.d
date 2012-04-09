func int C_IsBandit(var C_NPC slf)
{
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_964_BDT_Skinner_MT))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_790_BDT_Morgahard_MT))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_948_BDT_Esteban_MT))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_955_BDT_Juan_MT))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_957_BDT_Logan_MT))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_958_BDT_Miguel_MT))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7022_BDT_Oschust_MT))
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