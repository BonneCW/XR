FUNC VOID EquipAxtDesUntergangs() {
	CreateInvItems	(hero, ItMw_AxtDesUntergangs, 1);
	Npc_RemoveInvItems	(hero, ItMw_AxtDesUntergangs, 1);
	EquipWeapon(hero, ItMw_AxtDesUntergangs);
};

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

		AI_Function(hero, EquipAxtDesUntergangs);
	};
	
	if (Npc_HasItems(hero, ItMw_AxtDesUntergangs) > 1) {
		Npc_RemoveInvItems(hero, ItMw_AxtDesUntergangs, Npc_HasItems(hero, ItMw_AxtDesUntergangs) - 1);
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
	
	if (Npc_HasReadiedMeleeWeapon(hero))
	&& (Mod_Tiergift > 0 || Mod_Gewaechsgift > 0) {
		PrintScreen("Waffe vergiftet", 10, 80, FONT_ScreenSmall, 2);
	};
};