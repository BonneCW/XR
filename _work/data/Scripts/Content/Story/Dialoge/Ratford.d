INSTANCE Info_Mod_Ratford_Hi (C_INFO)
{
	npc		= Mod_1120_BDT_Ratford_MT;
	nr		= 1;
	condition	= Info_Mod_Ratford_Hi_Condition;
	information	= Info_Mod_Ratford_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was macht ihr hier draußen?";
};

FUNC INT Info_Mod_Ratford_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ratford_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Ratford_Hi_15_00"); //Was macht ihr hier draußen?
	AI_Output(self, hero, "Info_Mod_Ratford_Hi_36_01"); //Ich habe gerade so eine trockene Kehle. Wenn du mir ...
	AI_Output(hero, self, "Info_Mod_Ratford_Hi_15_02"); //Ja, ich weiß, ein Schluck Bier.
};

INSTANCE Info_Mod_Ratford_Fokus (C_INFO)
{
	npc		= Mod_1120_BDT_Ratford_MT;
	nr		= 1;
	condition	= Info_Mod_Ratford_Fokus_Condition;
	information	= Info_Mod_Ratford_Fokus_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ratford_Fokus_Condition()
{
	if (Kapitel == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ratford_Fokus_Info()
{
	AI_Output(self, hero, "Info_Mod_Ratford_Fokus_36_00"); //Scheiße, dich kenn ich doch, Mann! Kannst du mir sagen, was das hier soll?
	AI_Output(hero, self, "Info_Mod_Ratford_Fokus_15_01"); //Seh ich etwa so aus? Was ist denn passiert?
	AI_Output(self, hero, "Info_Mod_Ratford_Fokus_36_02"); //Gute Frage! Drax und ich waren hier gerade am Jagen, da tauchte hinter uns diese Horde Warge auf und hält direkt auf uns zu.
	AI_Output(self, hero, "Info_Mod_Ratford_Fokus_36_03"); //Wir haben also sofort unsere Pfeile gezückt und den Biestern ordentlich in die Fresse gegeben, aber es waren verdammt noch mal viel zu viele.
	AI_Output(self, hero, "Info_Mod_Ratford_Fokus_36_04"); //Anstatt aber über uns herzufallen, laufen sie an uns vorbei zu diesem komischen Kreis da drüben, schnappen sich ein kleines eckiges Ding, das obendrauf liegt, und hauen ab.
	AI_Output(self, hero, "Info_Mod_Ratford_Fokus_36_05"); //So was Verrücktes hab ich noch nie erlebt. (lacht unsicher)
	AI_Output(hero, self, "Info_Mod_Ratford_Fokus_15_06"); //Wohin sind die Warge verschwunden?
	AI_Output(self, hero, "Info_Mod_Ratford_Fokus_36_07"); //Direkt in die Hölle, wenn du mich fragst.
	AI_Output(self, hero, "Info_Mod_Ratford_Fokus_36_08"); //Drax ist ihnen hinterher, sie sind landeinwärts im Wald verschwunden.
	AI_Output(hero, self, "Info_Mod_Ratford_Fokus_15_09"); //Und du hältst hier die Stellung.
	AI_Output(self, hero, "Info_Mod_Ratford_Fokus_36_10"); //Na ja, die Puste macht nicht mehr mit. Ich hoffe bloß, Drax ist nicht doch noch zerfleischt worden.

	B_LogEntry	(TOPIC_MOD_FOKUSSUCHE, "Beim Fokus an den Klippen ist mir eine Wargrotte zuvorgekommen. Während sie von Ratford und Drax unter Beschuss genommen wurde, hat sie sich den Fokus geschnappt und ist im Wald landeinwärts verschwunden. Drax ist hinterhergelaufen.");

	B_StartOtherRoutine	(Mod_1121_BDT_Drax_MT, "FOKUS");

	Wld_InsertNpc	(Warg_RatfordDrax_09, "FP_WARGLEICHE_FOKUS_09");
	Wld_InsertNpc	(Warg_RatfordDrax_10, "FP_WARGLEICHE_FOKUS_10");
	Wld_InsertNpc	(Warg_RatfordDrax_11, "FP_WARGLEICHE_FOKUS_11");
	Wld_InsertNpc	(Warg_RatfordDrax_12, "FP_WARGLEICHE_FOKUS_12");
	Wld_InsertNpc	(Warg_RatfordDrax_13, "FP_WARGLEICHE_FOKUS_13");
	Wld_InsertNpc	(Warg_RatfordDrax_14, "FP_WARGLEICHE_FOKUS_14");
	Wld_InsertNpc	(Warg_RatfordDrax_15, "FP_WARGLEICHE_FOKUS_15");
	Wld_InsertNpc	(Warg_RatfordDrax_16, "FP_WARGLEICHE_FOKUS_16");
	Wld_InsertNpc	(Warg_RatfordDrax_17, "FP_WARGLEICHE_FOKUS_17");
	Wld_InsertNpc	(Warg_RatfordDrax_18, "FP_WARGLEICHE_FOKUS_18");
	Wld_InsertNpc	(Warg_RatfordDrax_19, "FP_WARGLEICHE_FOKUS_19");
	Wld_InsertNpc	(Warg_RatfordDrax_20, "FP_WARGLEICHE_FOKUS_20");
	Wld_InsertNpc	(Warg_RatfordDrax_21, "FP_WARGLEICHE_FOKUS_21");
	Wld_InsertNpc	(Warg_RatfordDrax_22, "FP_WARGLEICHE_FOKUS_22");

	B_KillNpc	(Warg_RatfordDrax_09);
	B_KillNpc	(Warg_RatfordDrax_10);
	B_KillNpc	(Warg_RatfordDrax_11);
	B_KillNpc	(Warg_RatfordDrax_12);
	B_KillNpc	(Warg_RatfordDrax_13);
	B_KillNpc	(Warg_RatfordDrax_14);
	B_KillNpc	(Warg_RatfordDrax_15);
	B_KillNpc	(Warg_RatfordDrax_16);
	B_KillNpc	(Warg_RatfordDrax_17);
	B_KillNpc	(Warg_RatfordDrax_18);
	B_KillNpc	(Warg_RatfordDrax_19);
	B_KillNpc	(Warg_RatfordDrax_20);
	B_KillNpc	(Warg_RatfordDrax_21);
	B_KillNpc	(Warg_RatfordDrax_22);
};

INSTANCE Info_Mod_Ratford_Infos (C_INFO)
{
	npc		= Mod_1120_BDT_Ratford_MT;
	nr		= 1;
	condition	= Info_Mod_Ratford_Infos_Condition;
	information	= Info_Mod_Ratford_Infos_Info;
	permanent	= 0;
	important	= 0;
	description	= "(Bier geben)";
};

FUNC INT Info_Mod_Ratford_Infos_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ratford_Hi))
	&& (Npc_HasItems(hero, ItFo_Beer) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ratford_Infos_Info()
{
	B_GiveInvItems	(hero, self, ItFo_Beer, 1);

	B_UseItem	(self, ItFo_Beer);

	AI_Output(self, hero, "Info_Mod_Ratford_Infos_36_00"); //Nun gut, wir beobachten hier ein wenig die Gegend für das Banditenlager.
	AI_Output(self, hero, "Info_Mod_Ratford_Infos_36_01"); //Außerdem jagen wir auch hin und wieder, um das Lager mit frischem Fleisch zu versorgen.

	if (Banditen_Dabei == FALSE)
	{
		AI_Output(hero, self, "Info_Mod_Ratford_Infos_15_02"); //Wo ist euer Lager?
		AI_Output(self, hero, "Info_Mod_Ratford_Infos_36_03"); //Du musst einfach nur immer an der Felswand entlanggehen, zuerst Richtung Wald, dann bergauf.
	};
};

INSTANCE Info_Mod_Ratford_Pickpocket (C_INFO)
{
	npc		= Mod_1120_BDT_Ratford_MT;
	nr		= 1;
	condition	= Info_Mod_Ratford_Pickpocket_Condition;
	information	= Info_Mod_Ratford_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Ratford_Pickpocket_Condition()
{
	C_Beklauen	(85, ItFo_MuttonRaw, 11);
};

FUNC VOID Info_Mod_Ratford_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Ratford_Pickpocket);

	Info_AddChoice	(Info_Mod_Ratford_Pickpocket, DIALOG_BACK, Info_Mod_Ratford_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Ratford_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Ratford_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Ratford_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Ratford_Pickpocket);
};

FUNC VOID Info_Mod_Ratford_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Ratford_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Ratford_Pickpocket);

		Info_AddChoice	(Info_Mod_Ratford_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Ratford_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Ratford_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Ratford_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Ratford_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Ratford_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Ratford_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Ratford_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Ratford_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Ratford_Pickpocket);

		AI_StopProcessInfos	(self);

		B_Attack (self, hero, AR_Theft, 1);
	}
	else
	{
		if (rnd >= 75)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 200);
		}
		else if (rnd >= 50)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 100);
		}
		else if (rnd >= 25)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 50);
		};

		B_Say	(self, hero, "$PICKPOCKET_BESTECHUNG_01");

		Info_ClearChoices	(Info_Mod_Ratford_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Ratford_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Ratford_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Ratford_EXIT (C_INFO)
{
	npc		= Mod_1120_BDT_Ratford_MT;
	nr		= 1;
	condition	= Info_Mod_Ratford_EXIT_Condition;
	information	= Info_Mod_Ratford_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Ratford_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ratford_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};