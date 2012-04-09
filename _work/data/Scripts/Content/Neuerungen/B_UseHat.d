FUNC VOID B_UseHat (var C_NPC slf)
{
	// Wollmützen (Männer)

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1968_EIS_Dorfbewohner_EIS))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1953_EIS_Gellit_EIS))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_4017_EIS_Rico_EIS))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_4018_EIS_Buck_EIS))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7563_OUT_Brutus_EIS))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7564_OUT_Knatus_EIS))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7647_OUT_Strewak_EIS))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7674_OUT_Aldaro_EIS))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7729_OUT_Baro_EIS))
	{
		if (Npc_HasItems(slf, ItAr_Wollmuetze_Male) == 0)
		{
			CreateInvItems	(slf, ItAr_Wollmuetze_Male, 1);

			AI_EquipArmor	(slf, ItAr_Wollmuetze_Male);
		};
	};

	// Wollmützen (Frauen)

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7410_OUT_Frau_EIS))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7559_OUT_Serra_EIS))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7560_OUT_Malfama_EIS))
	{
		if (Npc_HasItems(slf, ItAr_Wollmuetze_Female) == 0)
		{
			CreateInvItems	(slf, ItAr_Wollmuetze_Female, 1);

			AI_EquipArmor	(slf, ItAr_Wollmuetze_Female);
		};
	};

	// Bart

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7498_WM_Idrico_REL))
	{
		if (Npc_HasItems(slf, ItAr_Bart) == 0)
		{
			CreateInvItems	(slf, ItAr_Bart, 1);

			AI_EquipArmor	(slf, ItAr_Bart);
		};
	};
};