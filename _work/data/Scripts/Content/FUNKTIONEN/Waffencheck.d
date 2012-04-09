FUNC VOID WaffenCheck()
{
	var C_Item Waffentest;

	Waffentest = Npc_GetEquippedMeleeWeapon(hero);

	if (!Hlp_IsValidItem(Waffentest))
	{
		return;
	};

	if (Hlp_IsItem(Waffentest, ItMw_AxtDesUntergangs))
	&& (Npc_IsInFightMode(hero, FMODE_NONE))
	&& (AxtUpgrade == 0)
	{
		AI_UnequipWeapons	(hero);

		if (AxtDamage == 0)
		{
			AxtDamage = 10;
		};

		AxtUpgrade = 1;

		Npc_RemoveInvItems	(hero, ItMw_AxtDesUntergangs, 1);

		CreateInvItems	(hero, ItMw_AxtDesUntergangs, 1);
		AI_EquipBestMeleeWeapon	(hero);
	};

	if ((Hlp_IsItem(Waffentest, ItMw_Avaquar))
	|| (Hlp_IsItem(Waffentest, ItMw_Avaquar_Geschaerft))
	|| (Hlp_IsItem(Waffentest, ItMw_1h_Vlk_Dagger))
	|| (Hlp_IsItem(Waffentest, ItMw_1h_Vlk_Dagger_Geschaerft)))
	&& (DolchkampfAn == 0)
	&& (Delirium_Perk == TRUE)
	{
		DolchkampfAn = 1;

		Mdl_ApplyOverlayMDS	(hero, "HUMANS_DOLCH.MDS");
	}
	else if ((!Hlp_IsItem(Waffentest, ItMw_Avaquar))
	&& (!Hlp_IsItem(Waffentest, ItMw_Avaquar_Geschaerft))
	&& (!Hlp_IsItem(Waffentest, ItMw_1h_Vlk_Dagger))
	&& (!Hlp_IsItem(Waffentest, ItMw_1h_Vlk_Dagger_Geschaerft)))
	&& (DolchkampfAn == 1)
	&& (Npc_IsInFightMode(hero, FMODE_NONE))
	{
		DolchkampfAn = 0;

		Mdl_RemoveOverlayMDS	(hero, "HUMANS_DOLCH.MDS");
	};

	if (DolchkampfAn == 1)
	{
		/*if (C_BodyStateContains(hero, BS_SNEAK))
		&& (Dolchkampf_Sneak == 0)
		{
			Dolchkampf_Sneak = 1;

			Mdl_ApplyOverlayMDS	(hero, "HUMANS_DOLCH_SNEAK.MDS");
		}
		else if (C_BodyStateContains(hero, BS_HIT))
		&& (Dolchkampf_Sneak == 1)
		{
		}
		else if (!C_BodyStateContains(hero, BS_SNEAK))
		&& (!C_BodyStateContains(hero, BS_HIT))
		&& (Dolchkampf_Sneak == 1)
		{
			Dolchkampf_Sneak = 0;

			Mdl_RemoveOverlayMDS	(hero, "HUMANS_DOLCH_SNEAK.MDS");
		};

		AI_PrintScreen	(IntToString(Dolchkampf_Sneak), -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);*/
	};

	if (Hlp_IsItem(Waffentest, ItMw_Zweiklinge))
	|| (Hlp_IsItem(Waffentest, ItMw_Zweiklinge_Geschaerft))
	{
		if (Npc_IsInFightMode(hero, FMODE_MELEE))
		{
			Waffentest.flags = ITEM_SWD;
		}
		else
		{
			Waffentest.flags = ITEM_2HD_SWD;
		};
	};	
};