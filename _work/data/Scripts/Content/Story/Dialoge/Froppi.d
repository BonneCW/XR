INSTANCE Info_Mod_Froppi_Hi (C_INFO)
{
	npc		= Mod_7703_OUT_Froppi_REL;
	nr		= 1;
	condition	= Info_Mod_Froppi_Hi_Condition;
	information	= Info_Mod_Froppi_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Froppi_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Froppi_Hi))
	&& (Npc_GetDistToWP(self, "NW_CITY_HABOUR_KASERN_05_01") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Froppi_Hi_Info()
{
	var c_npc Froppi; Froppi = Hlp_GetNpc(Mod_7703_OUT_Froppi_REL);
	var c_npc Ork; Ork = Hlp_GetNpc(Mod_10042_Orc_Ork_REL);

	TRIA_Invite(Ork);
	TRIA_Start();

	TRIA_Next(Froppi);

	AI_TurnToNpc	(Ork, hero);

	AI_Output(self, hero, "Info_Mod_Froppi_Hi_09_00"); //Aha, wen haben wir denn da?

	TRIA_Next(Ork);

	AI_TurnToNpc	(Ork, Froppi);

	AI_Output(self, hero, "Info_Mod_Froppi_Hi_18_01"); //Ich weiß nicht, Boss. Vielleicht der Oberboss?

	TRIA_Next(Froppi);

	AI_TurnToNpc	(Froppi, Ork);

	AI_Output(self, hero, "Info_Mod_Froppi_Hi_09_02"); //Nein, der ist dicker. Das ist jemand, der ehrlichen Schatzsuchern in die Arbeit pfuschen will.

	TRIA_Next(Ork);

	AI_Output(self, hero, "Info_Mod_Froppi_Hi_18_03"); //Und was machen wir mit dem?

	TRIA_Next(Froppi);

	AI_Output(self, hero, "Info_Mod_Froppi_Hi_09_04"); //Rate mal.

	TRIA_Next(Ork);

	AI_Output(self, hero, "Info_Mod_Froppi_Hi_18_05"); //Ahhhhh, ich verstehe. Wir stellen ihn kalt.

	TRIA_Next(Froppi);

	AI_Output(self, hero, "Info_Mod_Froppi_Hi_09_06"); //Das heißt kalt machen, verstanden?

	TRIA_Next(Ork);

	AI_Output(self, hero, "Info_Mod_Froppi_Hi_18_07"); //Mutter hat immer kalt stellen gesagt.

	TRIA_Next(Froppi);

	AI_Output(self, hero, "Info_Mod_Froppi_Hi_09_08"); //Die hat auch nicht vom Töten gesprochen!

	TRIA_Next(Ork);

	AI_Output(self, hero, "Info_Mod_Froppi_Hi_18_09"); //Du hast natürlich wie immer Recht, Boss. Was machen wir jetzt noch mal?

	TRIA_Next(Froppi);

	AI_Output(self, hero, "Info_Mod_Froppi_Hi_09_10"); //Wir unterziehen den Störer einem Kreuzverhör.
	AI_Output(self, hero, "Info_Mod_Froppi_Hi_09_11"); //Wenn er uns irgendeinen Grund gibt, ihn nicht zu mögen, machen wir ihn kalt.

	AI_TurnToNpc	(Froppi, hero);

	AI_Output(self, hero, "Info_Mod_Froppi_Hi_09_12"); //Hast du gehört, du Held?
	AI_Output(hero, self, "Info_Mod_Froppi_Hi_15_13"); //Ja.

	TRIA_Next(Ork);

	AI_Output(self, hero, "Info_Mod_Froppi_Hi_18_14"); //Magst du Käsekuchen?

	TRIA_Finish();

	Info_ClearChoices	(Info_Mod_Froppi_Hi);

	Info_AddChoice	(Info_Mod_Froppi_Hi, "Nein.", Info_Mod_Froppi_Hi_B);
	Info_AddChoice	(Info_Mod_Froppi_Hi, "Ja.", Info_Mod_Froppi_Hi_A);
};

FUNC VOID Info_Mod_Froppi_Hi_B()
{
	var c_npc Froppi; Froppi = Hlp_GetNpc(Mod_7703_OUT_Froppi_REL);
	var c_npc Ork; Ork = Hlp_GetNpc(Mod_10042_Orc_Ork_REL);

	TRIA_Invite(Ork);
	TRIA_Start();

	TRIA_Next(Ork);

	AI_TurnToNpc	(Ork, hero);
	AI_TurnToNpc	(Froppi, hero);

	AI_Output(hero, self, "Info_Mod_Froppi_Hi_B_15_00"); //Nein.
	AI_Output(self, hero, "Info_Mod_Froppi_Hi_B_18_01"); //Ich auch nicht. Niemand mag Käsekuchen.

	TRIA_Next(Froppi);

	AI_Output(self, hero, "Info_Mod_Froppi_Hi_B_09_02"); //Was war das denn für eine bescheuerte Frage?!
	AI_Output(hero, self, "Info_Mod_Froppi_Hi_B_15_03"); //Darf ich auch mal was sagen?
	AI_Output(self, hero, "Info_Mod_Froppi_Hi_B_09_04"); //Kommt nicht in Frage, ich bin hier der Wortführer.

	TRIA_Next(Ork);

	AI_TurnToNpc	(Ork, Froppi);

	AI_Output(self, hero, "Info_Mod_Froppi_Hi_B_18_05"); //Und ich.

	TRIA_Next(Froppi);

	AI_TurnToNpc	(Froppi, Ork);

	AI_Output(self, hero, "Info_Mod_Froppi_Hi_B_09_06"); //Nein, du bist nur der Führer der Dummköpfe.

	TRIA_Next(Ork);

	AI_Output(self, hero, "Info_Mod_Froppi_Hi_B_18_07"); //Ja, Boss.
	AI_Output(hero, self, "Info_Mod_Froppi_Hi_B_15_08"); //Wieso lässt du dir das Gehabe von diesem aufgeblasenen Zwerg eigentlich gefallen?
	AI_Output(hero, self, "Info_Mod_Froppi_Hi_B_15_09"); //Würdest du ihn nicht viel lieber verhauen?

	AI_TurnToNpc	(Ork, hero);

	AI_Output(self, hero, "Info_Mod_Froppi_Hi_B_18_10"); //Das stimmt, aber er ist ja mein Vater.

	TRIA_Next(Froppi);

	AI_TurnToNpc	(Froppi, Ork);

	AI_Output(self, hero, "Info_Mod_Froppi_Hi_B_09_11"); //Genug gelabert. Jetzt hört ihr wieder auf mich!

	TRIA_Next(Ork);

	AI_TurnToNpc	(Ork, Froppi);

	AI_Output(self, hero, "Info_Mod_Froppi_Hi_B_18_12"); //Nein, Boss, jetzt reicht es wirklich.
	AI_Output(self, hero, "Info_Mod_Froppi_Hi_B_18_13"); //Ich glaube, diese Person ist nett und ich kann mich mit ihr unterhalten.
	AI_Output(self, hero, "Info_Mod_Froppi_Hi_B_18_14"); //Geh doch und such deine blöden Schätze allein.

	TRIA_Next(Froppi);

	AI_Output(self, hero, "Info_Mod_Froppi_Hi_B_09_15"); //Was?! Du wirst aufmüpfig? Das gibt eine Tracht Prügel!

	TRIA_Next(Ork);

	AI_Output(self, hero, "Info_Mod_Froppi_Hi_B_18_16"); //Ich glaube nicht, dass du dich das trauen würdest.
	AI_Output(self, hero, "Info_Mod_Froppi_Hi_B_18_17"); //Du brauchst mich ja bloß als Leibwache, weil du selbst zu schwach bist.
	AI_Output(self, hero, "Info_Mod_Froppi_Hi_B_18_18"); //Du hast wohl gedacht, ich merke das nicht, was?

	TRIA_Next(Froppi);

	AI_Output(self, hero, "Info_Mod_Froppi_Hi_B_09_19"); //Du ungezogener Bengel! Warte nur!

	Froppi.guild = GIL_STRF;
	Npc_SetTrueGuild (Froppi, GIL_STRF);

	TRIA_Finish();

	Info_ClearChoices	(Info_Mod_Froppi_Hi);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Froppi_Hi_A()
{
	var c_npc Froppi; Froppi = Hlp_GetNpc(Mod_7703_OUT_Froppi_REL);
	var c_npc Ork; Ork = Hlp_GetNpc(Mod_10042_Orc_Ork_REL);

	TRIA_Invite(Ork);
	TRIA_Start();

	TRIA_Next(Froppi);

	AI_TurnToNpc	(Froppi, hero);

	AI_Output(hero, self, "Info_Mod_Froppi_Hi_A_15_00"); //Ja.
	AI_Output(self, hero, "Info_Mod_Froppi_Hi_A_09_01"); //Was war das denn für eine bescheuerte Frage? Wer mag schon Käsekuchen?
	AI_Output(self, hero, "Info_Mod_Froppi_Hi_A_09_02"); //Den Kerl würde ich glatt umbringen!
	AI_Output(self, hero, "Info_Mod_Froppi_Hi_A_09_03"); //(Pause, ruft) Scheiße, ja!

	TRIA_Finish();

	Info_ClearChoices	(Info_Mod_Froppi_Hi);

	AI_StopProcessInfos	(self);

	B_SetAttitude (Froppi, ATT_HOSTILE);
	B_SetAttitude (Ork, ATT_HOSTILE);
};

INSTANCE Info_Mod_Froppi_Pickpocket (C_INFO)
{
	npc		= Mod_7703_OUT_Froppi_REL;
	nr		= 1;
	condition	= Info_Mod_Froppi_Pickpocket_Condition;
	information	= Info_Mod_Froppi_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Froppi_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Froppi_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Froppi_Pickpocket);

	Info_AddChoice	(Info_Mod_Froppi_Pickpocket, DIALOG_BACK, Info_Mod_Froppi_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Froppi_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Froppi_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Froppi_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Froppi_Pickpocket);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Aabid_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Aabid_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Aabid_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Froppi_EXIT (C_INFO)
{
	npc		= Mod_7703_OUT_Froppi_REL;
	nr		= 1;
	condition	= Info_Mod_Froppi_EXIT_Condition;
	information	= Info_Mod_Froppi_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Froppi_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Froppi_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};