FUNC VOID DialogVerteiler()
{
	if (CurrentLevel == NEWWORLD_ZEN)
	{
		// Cassia

		Info_Mod_Cassia_Lernen.npc		= Mod_568_NONE_Cassia_NW;
		Info_Mod_Cassia_Lernen_DEX.npc		= Mod_568_NONE_Cassia_NW;

		// Cronos

		Info_Mod_Cronos_Hi.npc		= Mod_758_KDW_Cronos_NW;
		Info_Mod_Cronos_Trade.npc	= Mod_758_KDW_Cronos_NW;
		Info_Mod_Cronos_EXIT.npc	= Mod_758_KDW_Cronos_NW;

		// Dichter

		Info_Mod_Dichter_EXIT.npc	= Mod_7398_OUT_Dichter_NW;

		// Diego

		Info_Mod_Diego_Lehrer.npc	= Mod_538_RDW_Diego_NW;
		Info_Mod_Diego_Lernen.npc	= Mod_538_RDW_Diego_NW;
		Info_Mod_Diego_Lernen_DEX.npc	= Mod_538_RDW_Diego_NW;
		Info_Mod_Diego_EXIT.npc		= Mod_538_RDW_Diego_NW;

		// Jesper

		Info_Mod_Jesper_Lernen.npc		= Mod_587_NONE_Jesper_NW;

		// Lester

		Info_Mod_Lester_Irdorath.npc	= Mod_557_PSINOV_Lester_NW;
		Info_Mod_Lester_Irdorath2.npc	= Mod_557_PSINOV_Lester_NW;
		Info_Mod_Lester_Goetterwaffen.npc	= Mod_557_PSINOV_Lester_NW;
		Info_Mod_Lester_DefenseBreak.npc	= Mod_557_PSINOV_Lester_NW;
		Info_Mod_Lester_DefenseBreak2.npc	= Mod_557_PSINOV_Lester_NW;
		Info_Mod_Lester_Fanatiker.npc	= Mod_557_PSINOV_Lester_NW;
		Info_Mod_Lester_ZeichenDerBruderschaft.npc	= Mod_557_PSINOV_Lester_NW;
		Info_Mod_Lester_Treffen.npc	= Mod_557_PSINOV_Lester_NW;
		Info_Mod_Lester_Crawlersekret.npc	= Mod_557_PSINOV_Lester_NW;

		// Ramirez

		Info_Mod_Ramirez_Lernen.npc		= Mod_746_NONE_Ramirez_NW;

		// Torlof

		Info_Mod_Torlof_Lernen.npc	= Mod_527_SLD_Torlof_NW;
		Info_Mod_Torlof_EXIT.npc	= Mod_527_SLD_Torlof_NW;

		// Vatras

		Info_Mod_Vatras_Kreis5.npc	= Mod_524_KDW_Vatras_NW;
		Info_Mod_Vatras_Kreis6.npc	= Mod_524_KDW_Vatras_NW;

		// Xardas

		Info_Mod_Xardas_NW_Lich.npc		= Mod_513_DMB_Xardas_NW;
		Info_Mod_Xardas_NW_Gormgniez.npc	= Mod_513_DMB_Xardas_NW;
		Info_Mod_Xardas_NW_Moorhexe.npc		= Mod_513_DMB_Xardas_NW;
		Info_Mod_Xardas_NW_Randolph.npc		= Mod_513_DMB_Xardas_NW;
		Info_Mod_Xardas_NW_RandolphGeheilt.npc		= Mod_513_DMB_Xardas_NW;
		Info_Mod_Xardas_NW_Gidan1.npc		= Mod_513_DMB_Xardas_NW;
		Info_Mod_Xardas_NW_Gidan2.npc		= Mod_513_DMB_Xardas_NW;
		Info_Mod_Xardas_NW_Trent.npc		= Mod_513_DMB_Xardas_NW;
		Info_Mod_Xardas_NW_Trent2.npc		= Mod_513_DMB_Xardas_NW;
		Info_Mod_Xardas_NW_Namib.npc		= Mod_513_DMB_Xardas_NW;
		Info_Mod_Xardas_NW_Lernen_MANA.npc		= Mod_513_DMB_Xardas_NW;
		Info_Mod_Xardas_NW_NachAufnahmeQuest.npc		= Mod_513_DMB_Xardas_NW;
		Info_Mod_Xardas_MT_Befoerderung.npc		= Mod_513_DMB_Xardas_NW;
		Info_Mod_Xardas_MT_BefoerderungKrieger.npc		= Mod_513_DMB_Xardas_NW;

		// Malcom

		Info_Mod_Malcom_NW_Beutel.npc = Mod_963_PIR_Malcom_NW;
	}
	else if (CurrentLevel == ADDONWORLD_ZEN)
	{
		// Cronos

		Info_Mod_Cronos_Hi.npc		= Mod_9001_KDW_Cronos_AW;
		Info_Mod_Cronos_Trade.npc	= Mod_9001_KDW_Cronos_AW;
		Info_Mod_Cronos_EXIT.npc	= Mod_9001_KDW_Cronos_AW;

		// Malcom

		Info_Mod_Malcom_NW_Beutel.npc = Mod_935_PIR_Malcom_AW;
	}
	else if (CurrentLevel == DRAGONISLAND_ZEN)
	{
		// Diego

		Info_Mod_Diego_Lehrer.npc	= Mod_7442_RDW_Diego_IR;
		Info_Mod_Diego_Lernen.npc	= Mod_7442_RDW_Diego_IR;
		Info_Mod_Diego_Lernen_DEX.npc	= Mod_7442_RDW_Diego_IR;
		Info_Mod_Diego_EXIT.npc		= Mod_7442_RDW_Diego_IR;
	}
	else if (CurrentLevel == GDG_WORLD_ZEN)
	{
		// Andokai

		Info_Mod_Andokai_Runen.npc	= Mod_6007_DMB_Andokai_GDG;
		Info_Mod_Andokai_EXIT.npc	= Mod_6007_DMB_Andokai_GDG;

		// Lee

		Info_Mod_Lee_PMSchulden.npc	= Mod_6006_SLD_Lee_GDG;
		Info_Mod_Lee_PETZMASTER.npc	= Mod_6006_SLD_Lee_GDG;
		Info_Mod_Lee_EXIT.npc		= Mod_6006_SLD_Lee_GDG;

		// Torlof

		Info_Mod_Torlof_Lernen.npc	= Mod_7442_SLD_Torlof_GDG;
		Info_Mod_Torlof_EXIT.npc	= Mod_7442_SLD_Torlof_GDG;

		// Vatras

		Info_Mod_Vatras_Kreis5.npc	= Mod_6010_KDW_Vatras_GDG;
		Info_Mod_Vatras_Kreis6.npc	= Mod_6010_KDW_Vatras_GDG;
	}
	else if (CurrentLevel == RELENDEL_ZEN)
	{
		// Cassia

		Info_Mod_Cassia_Lernen.npc		= Mod_7705_OUT_Cassia_REL;
		Info_Mod_Cassia_Lernen_DEX.npc		= Mod_7705_OUT_Cassia_REL;

		// Dichter

		Info_Mod_Dichter_EXIT.npc	= Mod_7346_OUT_Dichter_REL;

		// Jesper

		Info_Mod_Jesper_Lernen.npc		= Mod_7704_OUT_Jesper_REL;

		// Lester

		Info_Mod_Lester_DefenseBreak.npc	= Mod_7612_PSINOV_Lester_REL;
		Info_Mod_Lester_DefenseBreak2.npc	= Mod_7612_PSINOV_Lester_REL;
		Info_Mod_Lester_Fanatiker.npc	= Mod_7612_PSINOV_Lester_REL;
		Info_Mod_Lester_ZeichenDerBruderschaft.npc	= Mod_7612_PSINOV_Lester_REL;
		Info_Mod_Lester_Treffen.npc	= Mod_7612_PSINOV_Lester_REL;
		Info_Mod_Lester_Crawlersekret.npc	= Mod_7612_PSINOV_Lester_REL;

		// Ramirez

		Info_Mod_Ramirez_Lernen.npc		= Mod_7708_OUT_Ramirez_REL;
	}
	else if (CurrentLevel == MINENTAL_ZEN)
	{
		// Andokai

		Info_Mod_Andokai_Runen.npc	= Mod_473_DMB_Andokai_MT;
		Info_Mod_Andokai_EXIT.npc	= Mod_473_DMB_Andokai_MT;

		// Lee

		Info_Mod_Lee_PMSchulden.npc	= Mod_525_SLD_Lee_MT;
		Info_Mod_Lee_PETZMASTER.npc	= Mod_525_SLD_Lee_MT;
		Info_Mod_Lee_EXIT.npc		= Mod_525_SLD_Lee_MT;

		// Lester

		Info_Mod_Lester_Irdorath.npc	= Mod_7268_PSINOV_Lester_MT;
		Info_Mod_Lester_Irdorath2.npc	= Mod_7268_PSINOV_Lester_MT;
		Info_Mod_Lester_Goetterwaffen.npc	= Mod_7268_PSINOV_Lester_MT;
		Info_Mod_Lester_DefenseBreak.npc	= Mod_7268_PSINOV_Lester_MT;
		Info_Mod_Lester_DefenseBreak2.npc	= Mod_7268_PSINOV_Lester_MT;
		Info_Mod_Lester_Fanatiker.npc	= Mod_7268_PSINOV_Lester_MT;
		Info_Mod_Lester_ZeichenDerBruderschaft.npc	= Mod_7268_PSINOV_Lester_MT;

		// Xardas

		Info_Mod_Xardas_NW_Lich.npc		= Mod_680_DMB_Xardas_MT;
		Info_Mod_Xardas_NW_Gormgniez.npc	= Mod_680_DMB_Xardas_MT;
		Info_Mod_Xardas_NW_Moorhexe.npc		= Mod_680_DMB_Xardas_MT;
		Info_Mod_Xardas_NW_Randolph.npc		= Mod_680_DMB_Xardas_MT;
		Info_Mod_Xardas_NW_RandolphGeheilt.npc		= Mod_680_DMB_Xardas_MT;
		Info_Mod_Xardas_NW_Gidan1.npc		= Mod_680_DMB_Xardas_MT;
		Info_Mod_Xardas_NW_Gidan2.npc		= Mod_680_DMB_Xardas_MT;
		Info_Mod_Xardas_NW_Trent.npc		= Mod_680_DMB_Xardas_MT;
		Info_Mod_Xardas_NW_Trent2.npc		= Mod_680_DMB_Xardas_MT;
		Info_Mod_Xardas_NW_Namib.npc		= Mod_680_DMB_Xardas_MT;
		Info_Mod_Xardas_NW_Lernen_MANA.npc		= Mod_680_DMB_Xardas_MT;
		Info_Mod_Xardas_NW_NachAufnahmeQuest.npc		= Mod_680_DMB_Xardas_MT;
		Info_Mod_Xardas_MT_Befoerderung.npc		= Mod_680_DMB_Xardas_MT;
		Info_Mod_Xardas_MT_BefoerderungKrieger.npc		= Mod_680_DMB_Xardas_MT;
	}
	else if (CurrentLevel == DIEINSEL_ZEN)
	{
	};
};