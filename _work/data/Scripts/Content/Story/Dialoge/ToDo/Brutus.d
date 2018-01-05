INSTANCE Info_Mod_Brutus_Veronica (C_INFO)
{
	npc		= Mod_7563_OUT_Brutus_EIS;
	nr		= 1;
	condition	= Info_Mod_Brutus_Veronica_Condition;
	information	= Info_Mod_Brutus_Veronica_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brutus_Veronica_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Veronica_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brutus_Veronica_Info()
{
	AI_Output(self, hero, "Info_Mod_Brutus_Veronica_08_00"); //(wütend) Du wagst es meine Frau zu belästigen?! Mach, dass du raus kommst, dreckiger Spanner, sonst mach ich dir Beine ...

	AI_ReadyMeleeWeapon	(self);

	AI_StopProcessInfos	(self);

	AI_GotoWP	(hero, "EIS_DORF_023");
};

INSTANCE Info_Mod_Brutus_AlvarKristall (C_INFO)
{
	npc		= Mod_7563_OUT_Brutus_EIS;
	nr		= 1;
	condition	= Info_Mod_Brutus_AlvarKristall_Condition;
	information	= Info_Mod_Brutus_AlvarKristall_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brutus_AlvarKristall_Condition()
{
	if (Mod_AlvarKristall == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brutus_AlvarKristall_Info()
{
	AI_Output(self, hero, "Info_Mod_Brutus_AlvarKristall_08_00"); //Hey, was hast du vor du Schuft. Erst die Frauen bedrängen und dann noch unglaubliche Lügen verbreiten.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Brutus_AlvarKristall2 (C_INFO)
{
	npc		= Mod_7563_OUT_Brutus_EIS;
	nr		= 1;
	condition	= Info_Mod_Brutus_AlvarKristall2_Condition;
	information	= Info_Mod_Brutus_AlvarKristall2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brutus_AlvarKristall2_Condition()
{
	if (Mod_AlvarKristall == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Thys_AlvarKristall))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brutus_AlvarKristall2_Info()
{
	AI_Output(self, hero, "Info_Mod_Brutus_AlvarKristall2_08_00"); //Magischer Kristall?! Blödsinn. Nur ein dummer Stein, nichts magisches. Alles nur ausgedacht und erfunden.
	AI_Output(hero, self, "Info_Mod_Brutus_AlvarKristall2_15_01"); //Nun, dann sollte ich wohl das Irrlicht noch einmal zum Einsatz bringen.

	AI_StopProcessInfos	(self);

	Mod_AlvarKristall = 2;
};

INSTANCE Info_Mod_Brutus_AlvarKristall3 (C_INFO)
{
	npc		= Mod_7563_OUT_Brutus_EIS;
	nr		= 1;
	condition	= Info_Mod_Brutus_AlvarKristall3_Condition;
	information	= Info_Mod_Brutus_AlvarKristall3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brutus_AlvarKristall3_Condition()
{
	if (Mod_AlvarKristall == 3)
	&& (Npc_KnowsInfo(hero, Info_Mod_Thys_AlvarKristall2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brutus_AlvarKristall3_Info()
{
	AI_Output(self, hero, "Info_Mod_Brutus_AlvarKristall3_08_00"); //Das beweist gar nichts. Alles nur billige Taschenspielertricks des Fremden.
	AI_Output(self, hero, "Info_Mod_Brutus_AlvarKristall3_08_01"); //Will doch ernsthaft behaupten, dass die arme, untadelige Serra zu so etwas schlimmen fähig wäre.
	AI_Output(self, hero, "Info_Mod_Brutus_AlvarKristall3_08_02"); //Der kommt hierher, stiftet Unruhe und verbreitet Lügen.
	AI_Output(self, hero, "Info_Mod_Brutus_AlvarKristall3_08_03"); //Ich sage, wir schmeißen ihn aus dem Dorf.
	AI_Output(hero, self, "Info_Mod_Brutus_AlvarKristall3_15_04"); //Ja, aber es zeigt doch eindeutig ...

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Brutus_AlvarKristall4 (C_INFO)
{
	npc		= Mod_7563_OUT_Brutus_EIS;
	nr		= 1;
	condition	= Info_Mod_Brutus_AlvarKristall4_Condition;
	information	= Info_Mod_Brutus_AlvarKristall4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brutus_AlvarKristall4_Condition()
{
	if (Mod_AlvarKristall == 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brutus_AlvarKristall4_Info()
{
	AI_Output(self, hero, "Info_Mod_Brutus_AlvarKristall4_08_00"); //Ha, habe ich dich doch noch gefunden, du Dreckssack. Du wirst für deine üblen Verleumdungen jetzt bezahlen.
	AI_Output(hero, self, "Info_Mod_Brutus_AlvarKristall4_15_01"); //Warte! Serra und Malfama gehören dem Eriskult an und sie ...
	AI_Output(self, hero, "Info_Mod_Brutus_AlvarKristall4_08_02"); //Halt dein Maul, kein Wort will ich mehr hören! Jetzt wirst du sterben!

	B_LogEntry	(TOPIC_MOD_EIS_UNSCHULDIG, "So ist das also, Serra und Malfama gehören dem trügerischen Eriskult an. Nur mit der Macht des Tränenkristalls werde ich sie entlarven können. Höhle in Nordwestlicher Richtung ... Aber Augenblick ... Brutus ist mir gefolgt.");

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Kill, 0);
};

INSTANCE Info_Mod_Brutus_Pickpocket (C_INFO)
{
	npc		= Mod_7563_OUT_Brutus_EIS;
	nr		= 1;
	condition	= Info_Mod_Brutus_Pickpocket_Condition;
	information	= Info_Mod_Brutus_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Brutus_Pickpocket_Condition()
{
	C_Beklauen	(72, ItMi_Gold, 30);
};

FUNC VOID Info_Mod_Brutus_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Brutus_Pickpocket);

	Info_AddChoice	(Info_Mod_Brutus_Pickpocket, DIALOG_BACK, Info_Mod_Brutus_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Brutus_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Brutus_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Brutus_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Brutus_Pickpocket);
};

FUNC VOID Info_Mod_Brutus_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Brutus_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Brutus_Pickpocket);

		Info_AddChoice	(Info_Mod_Brutus_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Brutus_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Brutus_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Brutus_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Brutus_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Brutus_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Brutus_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Brutus_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Brutus_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Brutus_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Brutus_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Brutus_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Brutus_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Brutus_EXIT (C_INFO)
{
	npc		= Mod_7563_OUT_Brutus_EIS;
	nr		= 1;
	condition	= Info_Mod_Brutus_EXIT_Condition;
	information	= Info_Mod_Brutus_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Brutus_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Brutus_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};