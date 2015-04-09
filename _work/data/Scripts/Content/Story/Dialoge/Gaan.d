INSTANCE Info_Mod_Gaan_Hi (C_INFO)
{
	npc		= Mod_763_NONE_Gaan_NW;
	nr		= 1;
	condition	= Info_Mod_Gaan_Hi_Condition;
	information	= Info_Mod_Gaan_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hi.";
};

FUNC INT Info_Mod_Gaan_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gaan_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Gaan_Hi_15_00"); //Hi.
	AI_Output(self, hero, "Info_Mod_Gaan_Hi_03_01"); //Hi.
};

INSTANCE Info_Mod_Gaan_Dragomir (C_INFO)
{
	npc		= Mod_763_NONE_Gaan_NW;
	nr		= 1;
	condition	= Info_Mod_Gaan_Dragomir_Condition;
	information	= Info_Mod_Gaan_Dragomir_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich nehme an du bist Gaan?";
};

FUNC INT Info_Mod_Gaan_Dragomir_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gaan_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Dragomir_Mitmachen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gaan_Dragomir_Info()
{
	AI_Output(hero, self, "Info_Mod_Gaan_Dragomir_15_00"); //Ich nehme an du bist Gaan?
	AI_Output(self, hero, "Info_Mod_Gaan_Dragomir_03_01"); //Da hast du richtig angenommen. Woher kennst du meinen Name?
	AI_Output(hero, self, "Info_Mod_Gaan_Dragomir_15_02"); //Dragomir hat ihn mir gesagt.
	AI_Output(self, hero, "Info_Mod_Gaan_Dragomir_03_03"); //Achso, dann nehme ich an, dass Dragomir wissen will, was ich herausgefunden habe?
	AI_Output(hero, self, "Info_Mod_Gaan_Dragomir_15_04"); //Richtig.
	AI_Output(self, hero, "Info_Mod_Gaan_Dragomir_03_05"); //Also bisher ist mir nichts auffälliges untergekommen. Außerdem ist es hier ein feines Jagdgebiet und man hat von beinahe jedem Punkt aus einen perfekten Blick auf den Pass.
	AI_Output(self, hero, "Info_Mod_Gaan_Dragomir_03_06"); //Da fällt mir gerade ein: Letzte Nacht habe ich ein Rudel Snapper dadurch kommen sehen.
	AI_Output(hero, self, "Info_Mod_Gaan_Dragomir_15_07"); //Und was ist daran besonders?
	AI_Output(self, hero, "Info_Mod_Gaan_Dragomir_03_08"); //Nichts.

	B_LogEntry	(TOPIC_MOD_JG_JAGDGEBIETE, "Gaan sagt, dass beim Pass ein gutes Jagdgebiet ist.");
};

INSTANCE Info_Mod_Gaan_Untier (C_INFO)
{
	npc		= Mod_763_NONE_Gaan_NW;
	nr		= 1;
	condition	= Info_Mod_Gaan_Untier_Condition;
	information	= Info_Mod_Gaan_Untier_Info;
	permanent	= 0;
	important	= 0;
	description	= "Und, in den letzten Tagen irgendwelchen ungewöhnlichen Wildtieren begegnet?";
};

FUNC INT Info_Mod_Gaan_Untier_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gaan_Hi))
	&& (Mod_Cronos_Artefakt == 2)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Cronos_AW_Artefakt_02))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gaan_Untier_Info()
{
	AI_Output(hero, self, "Info_Mod_Gaan_Untier_15_00"); //Und, in den letzten Tagen irgendwelchen ungewöhnlichen Wildtieren begegnet?
	AI_Output(self, hero, "Info_Mod_Gaan_Untier_03_01"); //Nein, nur einige Snapper und das Übliche.
};

INSTANCE Info_Mod_Gaan_Ornament (C_INFO)
{
	npc		= Mod_763_NONE_Gaan_NW;
	nr		= 1;
	condition	= Info_Mod_Gaan_Ornament_Condition;
	information	= Info_Mod_Gaan_Ornament_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gaan_Ornament_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Nefarius_VierErbauer))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gaan_Ornament_Info()
{
	AI_Output(self, hero, "Info_Mod_Gaan_Ornament_03_00"); //Verdammt, da mach ich mir die ganze Mühe und dann kommt dieses Rudel Snapper ...
	AI_Output(hero, self, "Info_Mod_Gaan_Ornament_15_01"); //Was ist geschehen?
	AI_Output(self, hero, "Info_Mod_Gaan_Ornament_03_02"); //Ach, es ist wirklich zum Mäusemelken.
	AI_Output(self, hero, "Info_Mod_Gaan_Ornament_03_03"); //Erst vor kurzem habe ich einige Scavenger erlegt, um an ihr Fleisch zu kommen, und dann tauchen die Snapper auf ...
	AI_Output(hero, self, "Info_Mod_Gaan_Ornament_15_04"); //Der Pass scheint also nicht ganz ungefährlich zu sein, wenn sich so viel Wild herumtreibt.
	AI_Output(self, hero, "Info_Mod_Gaan_Ornament_03_05"); //Ja, das stimmt, so manchem Unvorsichtigen hat er schon das Leben gekostet.
	AI_Output(hero, self, "Info_Mod_Gaan_Ornament_15_06"); //Aha ... Nun, wie dem auch sei, ich bin auf der Suche nach einem steinernen Ornament.
	AI_Output(hero, self, "Info_Mod_Gaan_Ornament_15_07"); //Es könnte sich irgendwo beim Pass befinden. Hast du zufällig ein solches gesehen?
	AI_Output(self, hero, "Info_Mod_Gaan_Ornament_03_08"); //Na du bist mir ja gut. Der ganze Pass ist voll mit Steinen.
	AI_Output(self, hero, "Info_Mod_Gaan_Ornament_03_09"); //Ist ja auch der Grund, warum die Scavenger immer wieder vorbeikommen ...
	AI_Output(hero, self, "Info_Mod_Gaan_Ornament_15_10"); //Wieso das? Was wollen Scavenger mit Steinen.
	AI_Output(self, hero, "Info_Mod_Gaan_Ornament_03_11"); //Sie fressen.
	AI_Output(hero, self, "Info_Mod_Gaan_Ornament_15_12"); //Was?!
	AI_Output(self, hero, "Info_Mod_Gaan_Ornament_03_13"); //Für ihre Verdauung, denn mit einem Schnabel kaut es sich schlecht.
	AI_Output(self, hero, "Info_Mod_Gaan_Ornament_03_14"); //Die Steine im Magen helfen ihnen, die Nahrung zu zerreiben.
	AI_Output(hero, self, "Info_Mod_Gaan_Ornament_15_15"); //Aha, sehr interessant ...
	AI_Output(self, hero, "Info_Mod_Gaan_Ornament_03_16"); //Jemand der sich für die Fauna interessiert, das ist schön.
	AI_Output(self, hero, "Info_Mod_Gaan_Ornament_03_17"); //Nun denn, du weißt ja jetzt, worauf du am Pass achten musst.
	AI_Output(hero, self, "Info_Mod_Gaan_Ornament_15_18"); //(nachdenklich) Ich denke schon ...

	Wld_InsertNpc	(Snapper_Gaan, "NW_PASS_06");
	Wld_InsertNpc	(Snapper_Gaan, "NW_PASS_06");
	Wld_InsertNpc	(Snapper_Gaan, "NW_PASS_06");

	Wld_InsertNpc	(Scavenger_Gaan_01, "NW_PASS_06");
	Wld_InsertNpc	(Scavenger_Gaan_02, "NW_PASS_06");
	Wld_InsertNpc	(Scavenger_Gaan_03, "NW_PASS_06");
	Wld_InsertNpc	(Scavenger_Gaan, "NW_PASS_06");

	B_KillNpc	(Scavenger_Gaan_01);
	B_KillNpc	(Scavenger_Gaan_02);
	B_KillNpc	(Scavenger_Gaan_03);
	B_KillNpc	(Scavenger_Gaan);
};

INSTANCE Info_Mod_Gaan_Ornament_02 (C_INFO)
{
	npc		= Mod_763_NONE_Gaan_NW;
	nr		= 1;
	condition	= Info_Mod_Gaan_Ornament_02_Condition;
	information	= Info_Mod_Gaan_Ornament_02_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gaan_Ornament_02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gaan_Ornament))
	&& (Mod_GaanSnapperOrni == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gaan_Ornament_02_Info()
{
	AI_Output(self, hero, "Info_Mod_Gaan_Ornament_02_03_00"); //Sauber Leistung. Nun komm ich doch noch an das Fleisch.

	AI_GotoNpc	(self, Scavenger_Gaan);

	AI_PlayAni	(self, "T_PLUNDER");


	if (Npc_HasItems(Scavenger_Gaan, ItMi_Ornament_Heiler) == 1)
	{
		AI_TurnToNpc	(self, hero);

		AI_Output(self, hero, "Info_Mod_Gaan_Ornament_02_03_01"); //Na sie mal einer an, was ich da im Magen dieses Scavengers gefunden habe. Ein Ornament aus Stein!
		AI_Output(hero, self, "Info_Mod_Gaan_Ornament_02_15_02"); //Was?! Genau das, wonach ich gesucht hatte ...
		AI_Output(self, hero, "Info_Mod_Gaan_Ornament_02_03_03"); //Hier, nimm.

		B_GiveInvItems	(self, hero, ItMi_Ornament_Heiler, 1);
		Npc_RemoveInvItems	(Scavenger_Gaan, ItMi_Ornament_Heiler, 1);

		AI_Output(self, hero, "Info_Mod_Gaan_Ornament_02_03_04"); //Du hast mir ja geholfen an das Fleisch zu kommen und da versteht es sich von selbst, dass ich das Stück Stein an dich abtrete. Man sieht sich.
	};

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "PRESTART");
};

INSTANCE Info_Mod_Gaan_Pickpocket (C_INFO)
{
	npc		= Mod_763_NONE_Gaan_NW;
	nr		= 1;
	condition	= Info_Mod_Gaan_Pickpocket_Condition;
	information	= Info_Mod_Gaan_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Gaan_Pickpocket_Condition()
{
	C_Beklauen	(77, ItAt_Teeth, 6);
};

FUNC VOID Info_Mod_Gaan_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Gaan_Pickpocket);

	Info_AddChoice	(Info_Mod_Gaan_Pickpocket, DIALOG_BACK, Info_Mod_Gaan_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Gaan_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Gaan_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Gaan_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Gaan_Pickpocket);
};

FUNC VOID Info_Mod_Gaan_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Gaan_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Gaan_Pickpocket);

		Info_AddChoice	(Info_Mod_Gaan_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Gaan_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Gaan_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Gaan_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Gaan_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Gaan_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Gaan_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Gaan_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Gaan_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Gaan_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Gaan_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Gaan_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Gaan_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Gaan_EXIT (C_INFO)
{
	npc		= Mod_763_NONE_Gaan_NW;
	nr		= 1;
	condition	= Info_Mod_Gaan_EXIT_Condition;
	information	= Info_Mod_Gaan_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Gaan_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gaan_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};