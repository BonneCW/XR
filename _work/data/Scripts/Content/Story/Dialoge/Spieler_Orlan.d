INSTANCE Info_Mod_Spieler_Orlan_Hi (C_INFO)
{
	npc		= Mod_7804_VLK_Spieler_NW;
	nr		= 1;
	condition	= Info_Mod_Spieler_Orlan_Hi_Condition;
	information	= Info_Mod_Spieler_Orlan_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was ist das für ein Spiel vor dir auf dem Tisch?";
};

FUNC INT Info_Mod_Spieler_Orlan_Hi_Condition()
{
	if (!Npc_KnowsInfo(hero, Info_Mod_Ruediger_HabKeineFiguren))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Spieler_Orlan_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Spieler_Orlan_Hi_15_00"); //Was ist das für ein Spiel vor dir auf dem Tisch?
	AI_Output(self, hero, "Info_Mod_Spieler_Orlan_Hi_16_01"); //(mürrisch) Du willst wohl andeuten, du kennst Schagby nicht?
	AI_Output(hero, self, "Info_Mod_Spieler_Orlan_Hi_15_02"); //Gespielt habe ich's noch nicht, nein. Kannst du mir die Regeln erklären?
	AI_Output(self, hero, "Info_Mod_Spieler_Orlan_Hi_16_03"); //Jetzt nicht. Ich spiele nur mit erfahrenen Spielern.
};

INSTANCE Info_Mod_Spieler_Orlan_RuedigerBesiegt (C_INFO)
{
	npc		= Mod_7804_VLK_Spieler_NW;
	nr		= 1;
	condition	= Info_Mod_Spieler_Orlan_RuedigerBesiegt_Condition;
	information	= Info_Mod_Spieler_Orlan_RuedigerBesiegt_Info;
	permanent	= 0;
	important	= 0;
	description	= "Lust auf eine Partie Schagby?";
};

FUNC INT Info_Mod_Spieler_Orlan_RuedigerBesiegt_Condition()
{
	if (MG_Ruediger_Runde >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Spieler_Orlan_RuedigerBesiegt_Info()
{
	AI_Output(hero, self, "Info_Mod_Spieler_Orlan_RuedigerBesiegt_15_00"); //Lust auf eine Partie Schagby?
	AI_Output(self, hero, "Info_Mod_Spieler_Orlan_RuedigerBesiegt_16_01"); //Du kennst das Spiel?
	AI_Output(hero, self, "Info_Mod_Spieler_Orlan_RuedigerBesiegt_15_02"); //Klar. Ich habe schon Rüdiger besiegt.
	AI_Output(self, hero, "Info_Mod_Spieler_Orlan_RuedigerBesiegt_16_03"); //(lacht) Rüdiger, die Pfeife. Hat dir sein unglaublicher Steinwächter Angst gemacht?
	AI_Output(hero, self, "Info_Mod_Spieler_Orlan_RuedigerBesiegt_15_04"); //Ging so.
	AI_Output(self, hero, "Info_Mod_Spieler_Orlan_RuedigerBesiegt_16_05"); //Mit meiner Kreation kann er sich jedenfalls nicht messen.
	AI_Output(hero, self, "Info_Mod_Spieler_Orlan_RuedigerBesiegt_15_06"); //Du bist auch einer der Meister?
	AI_Output(self, hero, "Info_Mod_Spieler_Orlan_RuedigerBesiegt_16_07"); //Oh ja. Mein Hase schafft dem Spieler durch seine Wendigkeit ganz neue taktische Möglichkeiten.
	AI_Output(self, hero, "Info_Mod_Spieler_Orlan_RuedigerBesiegt_16_08"); //Wenn du dich immer noch traust, werde ich ihn dir vorführen. Der Einsatz beträgt 15 Goldmünzen.
};

FUNC VOID B_MG_Start_Spieler_Orlan()
{
	MG_CurrentOpp = MG_GEGNER_SPIELER_ORLAN;

	FF_Apply(B_MG_GameLoop);
};

INSTANCE Info_Mod_Spieler_Orlan_Spielstart01 (C_INFO)
{
	npc		= Mod_7804_VLK_Spieler_NW;
	nr		= 1;
	condition	= Info_Mod_Spieler_Orlan_Spielstart01_Condition;
	information	= Info_Mod_Spieler_Orlan_Spielstart01_Info;
	permanent	= 1;
	important	= 0;
	description	= "Lass uns spielen.";
};

FUNC INT Info_Mod_Spieler_Orlan_Spielstart01_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Spieler_Orlan_RuedigerBesiegt))
	&& (MG_Spieler_Orlan_Runde == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Spieler_Orlan_Spielstart01_Info()
{
	AI_Output(hero, self, "Info_Mod_Spieler_Orlan_Spielstart01_15_00"); //Lass uns spielen.

	AI_StopProcessInfos	(self);

	AI_Function (self, B_MG_Start_Spieler_Orlan);
};

INSTANCE Info_Mod_Spieler_Orlan_Spielende01 (C_INFO)
{
	npc		= Mod_7804_VLK_Spieler_NW;
	nr		= 1;
	condition	= Info_Mod_Spieler_Orlan_Spielende01_Condition;
	information	= Info_Mod_Spieler_Orlan_Spielende01_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Spieler_Orlan_Spielende01_Condition()
{
	if (MG_SiegState > 0)
	&& (MG_CurrentOpp == MG_GEGNER_Spieler_Orlan)
	&& (MG_Spieler_Orlan_Runde == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Spieler_Orlan_Spielende01_Info()
{
	if (MG_SiegState == 2)
	{
		AI_Output(self, hero, "Info_Mod_Spieler_Orlan_Spielende01_16_00"); //Was soll man auch erwarten, wenn Rüdiger dein Lehrmeister war?

		B_GiveInvItems	(hero, self, ItMi_Gold, 15);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Spieler_Orlan_Spielende01_16_01"); //Ach, so ein Mist! Das hab ich ja ganz übersehen!
		AI_Output(self, hero, "Info_Mod_Spieler_Orlan_Spielende01_16_02"); //Das passiert mir doch sonst nie.

		B_GiveInvItems	(self, hero, ItMi_Gold, 15);

		AI_Output(hero, hero, "Info_Mod_Spieler_Orlan_Spielende01_15_03"); //Jetzt schuldest du mir noch den Hasenspielstein, oder irre ich mich da?

		AI_Output(self, hero, "Info_Mod_Spieler_Orlan_Spielende01_16_04"); //Den kann ich dir nach diesem reinen Glückstreffer doch nicht guten Gewissens geben.
		AI_Output(self, hero, "Info_Mod_Spieler_Orlan_Spielende01_16_05"); //Vorher musst du mir erst noch beweisen, dass du auch wirklich was drauf hast. Und zwar mit verdoppeltem Einsatz.

		B_GivePlayerXP	(100);

		MG_Spieler_Orlan_Runde = 1;
	};

	MG_SiegState = 0;
	MG_CurrentOpp = 0;
};

INSTANCE Info_Mod_Spieler_Orlan_Spielstart02 (C_INFO)
{
	npc		= Mod_7804_VLK_Spieler_NW;
	nr		= 1;
	condition	= Info_Mod_Spieler_Orlan_Spielstart02_Condition;
	information	= Info_Mod_Spieler_Orlan_Spielstart02_Info;
	permanent	= 1;
	important	= 0;
	description	= "Lass uns eine weitere Partie mit verdoppeltem Einsatz spielen.";
};

FUNC INT Info_Mod_Spieler_Orlan_Spielstart02_Condition()
{
	if (MG_Spieler_Orlan_Runde >= 1)
	&& (MG_Spieler_Orlan_Runde < 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Spieler_Orlan_Spielstart02_Info()
{
	AI_Output(hero, self, "Info_Mod_Spieler_Orlan_Spielstart02_15_00"); //Lass uns eine weitere Partie mit verdoppeltem Einsatz spielen.
	AI_Output(self, hero, "DEFAULT"); //

	AI_StopProcessInfos	(self);

	AI_Function (self, B_MG_Start_Spieler_Orlan);
};

INSTANCE Info_Mod_Spieler_Orlan_Spielende02 (C_INFO)
{
	npc		= Mod_7804_VLK_Spieler_NW;
	nr		= 1;
	condition	= Info_Mod_Spieler_Orlan_Spielende02_Condition;
	information	= Info_Mod_Spieler_Orlan_Spielende02_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Spieler_Orlan_Spielende02_Condition()
{
	if (MG_SiegState > 0)
	&& (MG_CurrentOpp == MG_GEGNER_Spieler_Orlan)
	&& (MG_Spieler_Orlan_Runde >= 1)
	&& (MG_Spieler_Orlan_Runde < 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Spieler_Orlan_Spielende02_Info()
{
	if (MG_SiegState == 2)
	{
		AI_Output(self, hero, "Info_Mod_Spieler_Orlan_Spielende02_16_00"); //Auf diese Tour brauchst du mir gar nicht kommen.

		if (MG_Spieler_Orlan_Runde == 1)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 30);
		}
		else if (MG_Spieler_Orlan_Runde == 2)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 60);
		}
		else if (MG_Spieler_Orlan_Runde == 3)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 120);
		}
		else if (MG_Spieler_Orlan_Runde == 4)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 240);
		};
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Spieler_Orlan_Spielende02_16_01"); //Was für eine Schmach! An besseren Tagen wäre mir das nicht passiert.

		if (MG_Spieler_Orlan_Runde == 1)
		{
			B_GiveInvItems	(self, hero, ItMi_Gold, 30);

			B_ShowGivenThings	("Hasen-Figur erhalten");

			PlayerHas_Hase = 1;
		}
		else if (MG_Spieler_Orlan_Runde == 2)
		{
			B_GiveInvItems	(self, hero, ItMi_Gold, 60);
		}
		else if (MG_Spieler_Orlan_Runde == 3)
		{
			B_GiveInvItems	(self, hero, ItMi_Gold, 120);
		}
		else if (MG_Spieler_Orlan_Runde == 4)
		{
			B_GiveInvItems	(self, hero, ItMi_Gold, 240);
		};

		if (MG_Spieler_Orlan_Runde == 4)
		{
			AI_Output(self, hero, "Info_Mod_Spieler_Orlan_Spielende02_16_02"); //(erschöpft) Alles klar, alles klar, du bist der besser von uns beiden.
			AI_Output(self, hero, "Info_Mod_Spieler_Orlan_Spielende02_16_03"); //Bevor ich mit dir wieder um Geld spiele, muss ich dem Bauerngesocks erst mal wieder was aus der Tasche ziehen.
		};

		B_GivePlayerXP	(50);

		MG_Spieler_Orlan_Runde += 1;
	};

	MG_SiegState = 0;
	MG_CurrentOpp = 0;
};

INSTANCE Info_Mod_Spieler_Orlan_Spielstart03 (C_INFO)
{
	npc		= Mod_7804_VLK_Spieler_NW;
	nr		= 1;
	condition	= Info_Mod_Spieler_Orlan_Spielstart03_Condition;
	information	= Info_Mod_Spieler_Orlan_Spielstart03_Info;
	permanent	= 1;
	important	= 0;
	description	= "Lass uns eine weitere Partie spielen.";
};

FUNC INT Info_Mod_Spieler_Orlan_Spielstart03_Condition()
{
	if (MG_Spieler_Orlan_Runde >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Spieler_Orlan_Spielstart03_Info()
{
	AI_Output(hero, self, "Info_Mod_Spieler_Orlan_Spielstart03_15_00"); //Lass uns eine weitere Partie spielen.
	AI_Output(self, hero, "DEFAULT"); //

	Info_ClearChoices	(Info_Mod_Spieler_Orlan_Spielstart03);

	AI_StopProcessInfos	(self);

	AI_Function (self, B_MG_Start_Spieler_Orlan);
};

INSTANCE Info_Mod_Spieler_Orlan_Spielende03 (C_INFO)
{
	npc		= Mod_7804_VLK_Spieler_NW;
	nr		= 1;
	condition	= Info_Mod_Spieler_Orlan_Spielende03_Condition;
	information	= Info_Mod_Spieler_Orlan_Spielende03_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Spieler_Orlan_Spielende03_Condition()
{
	if (MG_SiegState > 0)
	&& (MG_CurrentOpp == MG_GEGNER_Spieler_Orlan)
	&& (MG_Spieler_Orlan_Runde >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Spieler_Orlan_Spielende03_Info()
{
	if (MG_SiegState == 2)
	{
		AI_Output(self, hero, "Info_Mod_Spieler_Orlan_Spielende03_16_00"); //Auf diese Tour brauchst du mir gar nicht kommen.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Spieler_Orlan_Spielende03_16_01"); //Was für eine Schmach! An besseren Tagen wäre mir das nicht passiert.

		MG_Spieler_Orlan_Runde += 1;
	};

	MG_SiegState = 0;
	MG_CurrentOpp = 0;
};

INSTANCE Info_Mod_Spieler_Orlan_Pickpocket (C_INFO)
{
	npc		= Mod_7804_VLK_Spieler_NW;
	nr		= 1;
	condition	= Info_Mod_Spieler_Orlan_Pickpocket_Condition;
	information	= Info_Mod_Spieler_Orlan_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Spieler_Orlan_Pickpocket_Condition()
{
	C_Beklauen	(86, ItMi_Gold, 27);
};

FUNC VOID Info_Mod_Spieler_Orlan_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Spieler_Orlan_Pickpocket);

	Info_AddChoice	(Info_Mod_Spieler_Orlan_Pickpocket, DIALOG_BACK, Info_Mod_Spieler_Orlan_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Spieler_Orlan_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Spieler_Orlan_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Spieler_Orlan_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Spieler_Orlan_Pickpocket);
};

FUNC VOID Info_Mod_Spieler_Orlan_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Spieler_Orlan_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Spieler_Orlan_Pickpocket);

		Info_AddChoice	(Info_Mod_Spieler_Orlan_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Spieler_Orlan_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Spieler_Orlan_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Spieler_Orlan_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Spieler_Orlan_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Spieler_Orlan_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Spieler_Orlan_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Spieler_Orlan_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Spieler_Orlan_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Spieler_Orlan_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Spieler_Orlan_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Spieler_Orlan_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Spieler_Orlan_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Spieler_Orlan_EXIT (C_INFO)
{
	npc		= Mod_7804_VLK_Spieler_NW;
	nr		= 1;
	condition	= Info_Mod_Spieler_Orlan_EXIT_Condition;
	information	= Info_Mod_Spieler_Orlan_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Spieler_Orlan_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Spieler_Orlan_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};