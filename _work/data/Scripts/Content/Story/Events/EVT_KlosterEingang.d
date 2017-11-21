FUNC INT CheckKlosterPermission() {
	var C_Item itm;
	itm = Npc_GetEquippedArmor(hero);

	if (((Hlp_IsItem(itm, ITAR_NOV_L) == TRUE)
	|| (Hlp_IsItem(itm, ITAR_NOV_M) == TRUE)
	|| (Hlp_IsItem(itm, ITAR_KDF_L) == TRUE)
	|| (Hlp_IsItem(itm, ITAR_KDF_H) == TRUE)
	|| (Hlp_IsItem(itm, ITAR_KDF_L_FEUER) == TRUE)
	|| (Hlp_IsItem(itm, ITAR_KDF_VERYHIGH) == TRUE)
	|| (Hlp_IsItem(itm, ITAR_FAKE_NOV_L) == TRUE))
	|| ((Npc_KnowsInfo(hero, Info_Mod_Daron_InsKloster))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Daron_ImKloster)))
	|| ((Mod_Gottstatus == 9)
	|| (Mod_Gottstatus == 10)
	|| (Mod_GottStatus == 11)
	|| (Mod_Gottstatus == 12)))
	{
		return TRUE;
	}
	else if (Hlp_IsItem(itm, ITAR_NOV_L) == FALSE)
	&& (Hlp_IsItem(itm, ITAR_NOV_M) == FALSE)
	&& (Hlp_IsItem(itm, ITAR_KDF_L) == FALSE)
	&& (Hlp_IsItem(itm, ITAR_KDF_H) == FALSE)
	&& (Hlp_IsItem(itm, ITAR_KDF_L_FEUER) == FALSE)
	&& (Hlp_IsItem(itm, ITAR_KDF_VERYHIGH) == FALSE)
	&& (Hlp_IsItem(itm, ITAR_FAKE_NOV_L) == FALSE)
	//&& ((Npc_KnowsInfo(hero, Info_Mod_Daron_ImKloster))
	&& ((Mod_Gottstatus == 1)
	|| (Mod_Gottstatus == 2)
	|| (Mod_GottStatus == 3)
	|| (Mod_Gottstatus == 4)
	|| (Mod_Gottstatus == 5)
	|| (Mod_GottStatus == 6)
	|| (Mod_Gottstatus == 7)
	|| (Mod_Gottstatus == 8))
	{
		return FALSE;
	};
	return TRUE;
};

FUNC VOID EVT_KLOSTEREINGANG()
{
	if (Npc_GetDistToWP(hero, "NW_MONASTERY_ENTRY_02") > 200)
	{
		return;
	};

	if (!CheckKlosterPermission()) {
		hero.attribute[ATR_HITPOINTS] = 0;
	};
};

FUNC VOID EVT_KLOSTEREINGANG2()
{
	if (hero.guild != GIL_PAL)
	|| ((Mod_Gilde != 2)
	&& (Mod_Gilde != 3))
	{
		hero.attribute[ATR_HITPOINTS] = 0;
	};
};

FUNC VOID EVT_KLOSTEREINGANG_WARNING()
{
	if (!CheckKlosterPermission()) {
		PrintScreen ("Du bist nicht würdig die Pforte zu durchschreiten. Kehre um!", -1, YPOS_LevelUp, FONT_Screen, 3);
	};
};
