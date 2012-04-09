func int C_NpcIsBossmonster (var C_NPC slf)
{
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Balrog))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DienerDesBoesen_01))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Balrog_Plateau))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DienerDesBoesen_02))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Dragon_11009_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(GigantDerVorzeit))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Lich_11008_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Wasserdrache_11003_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Menschenfresser))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Gobbo_Matrone))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Gobbo_Matrone_01))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Gobbo_Matrone_02))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Gobbo_Matrone_03))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Gobbo_Matrone_04))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(MinecrawlerQueen))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Monster_11067_Talos_EIS))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Monster_11068_Eisriese_EIS))
	|| (slf.aivar[AIV_MM_REAL_ID] == ID_Blutgolem)
	|| (slf.aivar[AIV_MM_REAL_ID] == ID_Erdgigant)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};