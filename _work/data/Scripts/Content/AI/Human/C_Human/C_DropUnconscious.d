// **************************************************************
// C_DropUnconscious
// -----------------
// self und other hier vom Programm initialisiert:
// self ist immer der NPC, für den diese Funktion den Check macht
// other ist immer der Täter (der den Treffer gelandet hat)
// **************************************************************

func int C_DropUnconscious()
{
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7106_ASS_Ramsi_NW))
	{
		Npc_RemoveInvItems	(self, ItFo_MuttonRaw, Npc_HasItems(self, ItFo_MuttonRaw));
		return TRUE;
	};
	if (Mod_PolochTretor == 2)
	&& (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{		
		return TRUE;
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7189_OUT_Antonius_MT))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7190_OUT_Hortensius_MT))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7191_OUT_Florentius_MT))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_4076_VLK_Haendler_MT))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_4077_VLK_Haendler_MT))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7236_GUR_Guru_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7266_GUR_BaalLukor_OGY))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(GardeBeliars_1994_Frowin))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(GardeBeliars_1993_Gunram))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(GardeBeliars_1992_Reinhold))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(GardeBeliars_1991_Fantrek))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(GardeBeliars_1990_Jorjo))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7214_OUT_Halunke_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7215_OUT_Halunke_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7216_OUT_Halunke_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7218_BDT_Bandit_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7217_BDT_Bandit_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7219_BDT_Bandit_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7026_OUT_Entfuehrer_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7027_OUT_Entfuehrer_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7028_OUT_Entfuehrer_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7029_OUT_Entfuehrer_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7030_OUT_Entfuehrer_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7031_OUT_Entfuehrer_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7032_OUT_Entfuehrer_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7435_NOV_Novize_MT))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7033_OUT_Allievo_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7034_OUT_Bruno_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7035_OUT_Grima_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Kakos_11006_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7299_OUT_Hel_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1942_Ryan_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1951_Priester_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1943_Waechter_01_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1952_Waechter_08_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1944_Waechter_02_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1945_Waechter_03_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1946_Waechter_04_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1947_Waechter_05_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1948_Waechter_06_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1949_Waechter_07_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7329_HS_Raufbold_HAL))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7387_Signalfeuer_AW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7388_Signalfeuer_AW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7389_Signalfeuer_AW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7390_Signalfeuer_AW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7203_BK_Straschiduo_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7244_BlutkultKrieger_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1876_EBR_Bloodwyn_MT))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1895_GRD_Gardist_MT))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7352_OUT_Trador_TUG))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7038_VMK_Soeren_TUG))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Lich_11008_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7592_OUT_Handlanger_TUG))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7593_OUT_Handlanger_TUG))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1289_SLD_Bruce_MT))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_4018_EIS_Buck_EIS))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_4017_EIS_Rico_EIS))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7716_OUT_Ausgestossener_EIS))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7717_OUT_Ausgestossener_EIS))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7718_OUT_Ausgestossener_EIS))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_4016_NOV_Akahasch_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_500_PAL_Garond_NW))
	|| (self.npctype == NPCTYPE_PAT_HEXE)
	|| (self.id == 11011)
	|| (self.id == 11019)
	|| (self.id == 11020)
	|| (self.id == 11021)
	|| (self.id == 11022)
	|| (self.guild == GIL_STRF)
	|| ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_544_NONE_Wilfried_NW))
	&& (Npc_KnowsInfo(hero, Info_Mod_Wilfried_Hoehle)))
	|| ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7290_PAL_Athos_NW))
	&& (Mod_NL_PalasLich == 6))
	|| ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7291_PAL_Aramis_NW))
	&& (Mod_NL_PalasLich == 6))
	|| ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7292_PAL_Porthos_NW))
	&& (Mod_NL_PalasLich == 6))
	|| ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_591_NONE_Larius_NW))
	&& (Npc_KnowsInfo(hero, Info_Mod_Larius_Hi)))
	|| ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1730_MIL_Lawrence_NW))
	&& (Npc_KnowsInfo(hero, Info_Mod_Larius_Hi)))
	|| ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_594_NONE_Lutero_NW))
	&& (Npc_KnowsInfo(hero, Info_Mod_Larius_Hi)))
	|| ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7374_OUT_Gerichtswache_01))
	&& (Mod_AnnaQuest == 8))
	|| ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7375_OUT_Gerichtswache_02))
	&& (Mod_AnnaQuest == 8))
	|| ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7372_OUT_Schoeppe_REL))
	&& (Mod_AnnaQuest == 8))
	|| ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7373_OUT_Schoeppe_REL))
	&& (Mod_AnnaQuest == 8))
	|| ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7371_OUT_Richter_REL))
	&& (Mod_AnnaQuest == 8))
	|| ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7370_OUT_Ulrich_REL))
	&& (Mod_AnnaQuest == 8))
	|| ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1248_RIT_Ritter_NW))
	&& (Mod_HQ_BrianDaemonisch == 2))
	|| ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1249_RIT_Ritter_NW))
	&& (Mod_HQ_BrianDaemonisch == 2))
	|| ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1250_RIT_Ritter_NW))
	&& (Mod_HQ_BrianDaemonisch == 2))
	|| ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_797_SLD_Sylvio_MT))
	&& (Npc_KnowsInfo(hero, Info_Mod_Sylvio_AtStonehenge)))
	|| ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7245_SLD_Orkjaeger_MT))
	&& (Npc_KnowsInfo(hero, Info_Mod_Orkjaeger_MT_GetZombie_Hi)))
	|| ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7246_SLD_Orkjaeger_MT))
	&& (Npc_KnowsInfo(hero, Info_Mod_Orkjaeger_MT_GetZombie_Hi)))
	|| ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7258_TPL_Templer_OGY))
	&& (Npc_KnowsInfo(hero, Info_Mod_Rod_OGY_GetZombie)))
	|| ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7259_SLD_Orkjaeger_OGY))
	&& (Npc_KnowsInfo(hero, Info_Mod_Rod_OGY_GetZombie)))
	|| ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7260_SLD_Orkjaeger_OGY))
	&& (Npc_KnowsInfo(hero, Info_Mod_Rod_OGY_GetZombie)))
	|| ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7533_SLD_Rod_OGY))
	&& (Npc_KnowsInfo(hero, Info_Mod_Rod_OGY_GetZombie)))
	|| ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_185_NONE_Alvro_NW))
	&& (Npc_KnowsInfo(hero, Info_Mod_Alvro_Melasse)))
	|| ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_577_NONE_Garvell_NW))
	&& (Mod_GarvellDa == 1))
	|| ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_595_MIL_Mario_NW))
	&& (Mod_Mario == 6))
	|| ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7654_OUT_Alkor_REL))
	&& (Npc_KnowsInfo(hero, Info_Mod_Alkor_Wasserleichen)))
	|| (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(GardeBeliars_1989_Drach))
	{
		return FALSE;
	};

	if (CurrentLevel == NEWWORLD_ZEN)
	{
		if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_783_BAU_Elena_NW))
		&& (Npc_GetDistToWP(self, "NW_BIGFARM_FOREST_08") < 800))
		|| ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_104_BAU_Rega_NW))
		&& (Npc_GetDistToWP(self, "NW_BIGFARM_FOREST_08") < 800))
		|| ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1403_BAU_Baeuerin_NW))
		&& (Npc_GetDistToWP(self, "NW_BIGFARM_FOREST_08") < 800))
		{
			return FALSE;
		};
	};

	if (CurrentLevel == MINENTAL_ZEN)
	{
		if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7024_OUT_Sabitsch_MT))
		&& (Npc_GetDistToWP(hero, "OCR_HUT_31") < 500))
		{
			return FALSE;
		};
	};
	
	// ------ Folgende NSCs töten immer ------
	if ((other.guild > GIL_SEPERATOR_HUM)
	|| (other.aivar[AIV_DropDeadAndKill] == TRUE))
	&& (self.aivar[AIV_Partymember] == FALSE)
	{
		return FALSE;
	};

	// ------ nur echte Humans können Unconscious werden ------
	if (self.guild < GIL_SEPERATOR_HUM)
	{
		if (self.aivar[AIV_DropDeadAndKill] == FALSE)
		|| (self.aivar[AIV_Partymember] == TRUE)
		{
			return TRUE;
		};
	};

	if (Npc_IsInFightMode(self, FMODE_FAR))
	{
		var C_ITEM rwp;
		rwp = Npc_GetReadiedWeapon(self);

		if (rwp.munition == ItRw_SchmetterArrow)
		|| (rwp.munition == ItRw_SchmetterBolt)
		{
			return TRUE;
		};
	};
			
	return FALSE;
};

func int C_DropUnconscious2(var C_NPC slf, var C_NPC oth)
{
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7106_ASS_Ramsi_NW))
	{
		Npc_RemoveInvItems	(slf, ItFo_MuttonRaw, Npc_HasItems(slf, ItFo_MuttonRaw));
		return TRUE;
	};
	if (Mod_PolochTretor == 2)
	&& (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(hero))
	{		
		return TRUE;
	};

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(oth))
	{
		return FALSE;
	};

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7189_OUT_Antonius_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7190_OUT_Hortensius_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7191_OUT_Florentius_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_4076_VLK_Haendler_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_4077_VLK_Haendler_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7236_GUR_Guru_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7266_GUR_BaalLukor_OGY))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(GardeBeliars_1994_Frowin))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(GardeBeliars_1993_Gunram))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(GardeBeliars_1992_Reinhold))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(GardeBeliars_1991_Fantrek))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(GardeBeliars_1990_Jorjo))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7214_OUT_Halunke_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7215_OUT_Halunke_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7216_OUT_Halunke_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7218_BDT_Bandit_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7217_BDT_Bandit_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7219_BDT_Bandit_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7026_OUT_Entfuehrer_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7027_OUT_Entfuehrer_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7028_OUT_Entfuehrer_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7029_OUT_Entfuehrer_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7030_OUT_Entfuehrer_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7031_OUT_Entfuehrer_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7032_OUT_Entfuehrer_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7435_NOV_Novize_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7033_OUT_Allievo_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7034_OUT_Bruno_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7035_OUT_Grima_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Kakos_11006_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7299_OUT_Hel_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1942_Ryan_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1951_Priester_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1943_Waechter_01_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1952_Waechter_08_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1944_Waechter_02_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1945_Waechter_03_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1946_Waechter_04_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1947_Waechter_05_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1948_Waechter_06_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1949_Waechter_07_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7329_HS_Raufbold_HAL))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7387_Signalfeuer_AW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7388_Signalfeuer_AW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7389_Signalfeuer_AW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7390_Signalfeuer_AW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7203_BK_Straschiduo_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7244_BlutkultKrieger_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1876_EBR_Bloodwyn_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1895_GRD_Gardist_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7352_OUT_Trador_TUG))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7038_VMK_Soeren_TUG))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Lich_11008_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7592_OUT_Handlanger_TUG))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7593_OUT_Handlanger_TUG))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1289_SLD_Bruce_MT))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_4018_EIS_Buck_EIS))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_4017_EIS_Rico_EIS))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7716_OUT_Ausgestossener_EIS))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7717_OUT_Ausgestossener_EIS))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7718_OUT_Ausgestossener_EIS))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_4016_NOV_Akahasch_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_500_PAL_Garond_NW))
	|| (slf.npctype == NPCTYPE_PAT_HEXE)
	|| (slf.id == 11011)
	|| (slf.id == 11019)
	|| (slf.id == 11020)
	|| (slf.id == 11021)
	|| (slf.id == 11022)
	|| (slf.guild == GIL_STRF)
	|| ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_544_NONE_Wilfried_NW))
	&& (Npc_KnowsInfo(hero, Info_Mod_Wilfried_Hoehle)))
	|| ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7290_PAL_Athos_NW))
	&& (Mod_NL_PalasLich == 6))
	|| ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7291_PAL_Aramis_NW))
	&& (Mod_NL_PalasLich == 6))
	|| ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7292_PAL_Porthos_NW))
	&& (Mod_NL_PalasLich == 6))
	|| ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_591_NONE_Larius_NW))
	&& (Npc_KnowsInfo(hero, Info_Mod_Larius_Hi)))
	|| ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1730_MIL_Lawrence_NW))
	&& (Npc_KnowsInfo(hero, Info_Mod_Larius_Hi)))
	|| ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_594_NONE_Lutero_NW))
	&& (Npc_KnowsInfo(hero, Info_Mod_Larius_Hi)))
	|| ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7374_OUT_Gerichtswache_01))
	&& (Mod_AnnaQuest == 8))
	|| ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7375_OUT_Gerichtswache_02))
	&& (Mod_AnnaQuest == 8))
	|| ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7372_OUT_Schoeppe_REL))
	&& (Mod_AnnaQuest == 8))
	|| ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7373_OUT_Schoeppe_REL))
	&& (Mod_AnnaQuest == 8))
	|| ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7371_OUT_Richter_REL))
	&& (Mod_AnnaQuest == 8))
	|| ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7370_OUT_Ulrich_REL))
	&& (Mod_AnnaQuest == 8))
	|| ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1248_RIT_Ritter_NW))
	&& (Mod_HQ_BrianDaemonisch == 2))
	|| ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1249_RIT_Ritter_NW))
	&& (Mod_HQ_BrianDaemonisch == 2))
	|| ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1250_RIT_Ritter_NW))
	&& (Mod_HQ_BrianDaemonisch == 2))
	|| ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_797_SLD_Sylvio_MT))
	&& (Npc_KnowsInfo(hero, Info_Mod_Sylvio_AtStonehenge)))
	|| ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7245_SLD_Orkjaeger_MT))
	&& (Npc_KnowsInfo(hero, Info_Mod_Orkjaeger_MT_GetZombie_Hi)))
	|| ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7246_SLD_Orkjaeger_MT))
	&& (Npc_KnowsInfo(hero, Info_Mod_Orkjaeger_MT_GetZombie_Hi)))
	|| ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7258_TPL_Templer_OGY))
	&& (Npc_KnowsInfo(hero, Info_Mod_Rod_OGY_GetZombie)))
	|| ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7259_SLD_Orkjaeger_OGY))
	&& (Npc_KnowsInfo(hero, Info_Mod_Rod_OGY_GetZombie)))
	|| ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7260_SLD_Orkjaeger_OGY))
	&& (Npc_KnowsInfo(hero, Info_Mod_Rod_OGY_GetZombie)))
	|| ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7533_SLD_Rod_OGY))
	&& (Npc_KnowsInfo(hero, Info_Mod_Rod_OGY_GetZombie)))
	|| ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_185_NONE_Alvro_NW))
	&& (Npc_KnowsInfo(hero, Info_Mod_Alvro_Melasse)))
	|| ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_577_NONE_Garvell_NW))
	&& (Mod_GarvellDa == 1))
	|| ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_595_MIL_Mario_NW))
	&& (Mod_Mario == 6))
	|| ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7654_OUT_Alkor_REL))
	&& (Npc_KnowsInfo(hero, Info_Mod_Alkor_Wasserleichen)))
	|| (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(GardeBeliars_1989_Drach))
	{
		return FALSE;
	};

	if (CurrentLevel == NEWWORLD_ZEN)
	{
		if ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_783_BAU_Elena_NW))
		&& (Npc_GetDistToWP(slf, "NW_BIGFARM_FOREST_08") < 800))
		|| ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_104_BAU_Rega_NW))
		&& (Npc_GetDistToWP(slf, "NW_BIGFARM_FOREST_08") < 800))
		|| ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1403_BAU_Baeuerin_NW))
		&& (Npc_GetDistToWP(slf, "NW_BIGFARM_FOREST_08") < 800))
		{
			return FALSE;
		};
	};

	if (CurrentLevel == MINENTAL_ZEN)
	{
		if ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7024_OUT_Sabitsch_MT))
		&& (Npc_GetDistToWP(hero, "OCR_HUT_31") < 500))
		{
			return FALSE;
		};
	};

	if (Npc_IsInFightMode(slf, FMODE_FAR))
	{
		var C_ITEM rwp;
		rwp = Npc_GetReadiedWeapon(slf);

		if (rwp.munition == ItRw_SchmetterArrow)
		|| (rwp.munition == ItRw_SchmetterBolt)
		{
			return TRUE;
		};
	};

	if (Npc_IsInFightMode(oth, FMODE_FAR))
	|| (Npc_IsInFightMode(oth, FMODE_MAGIC))
	{
		return FALSE;
	};
	
	// ------ Folgende NSCs töten immer ------
	if ((oth.guild > GIL_SEPERATOR_HUM)
	|| (oth.aivar[AIV_DropDeadAndKill] == TRUE))
	&& (slf.aivar[AIV_Partymember] == FALSE)
	{
		return FALSE;
	};

	// ------ nur echte Humans können Unconscious werden ------
	if (slf.guild < GIL_SEPERATOR_HUM)
	{
		if (slf.aivar[AIV_DropDeadAndKill] == FALSE)
		|| (slf.aivar[AIV_Partymember] == TRUE)
		{
			return TRUE;
		};
	};
			
	return FALSE;
};