INSTANCE Info_Mod_Fahim_Hi (C_INFO)
{
	npc		= Mod_1029_SMK_Fahim_MT;
	nr		= 1;
	condition	= Info_Mod_Fahim_Hi_Condition;
	information	= Info_Mod_Fahim_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Fahim_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fahim_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Fahim_Hi_10_01"); //Ich bin Fahim.
};

INSTANCE Info_Mod_Fahim_Belagerung (C_INFO)
{
	npc		= Mod_1029_SMK_Fahim_MT;
	nr		= 1;
	condition	= Info_Mod_Fahim_Belagerung_Condition;
	information	= Info_Mod_Fahim_Belagerung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du etwas zu tun für mich?";
};

FUNC INT Info_Mod_Fahim_Belagerung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fahim_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Raven_Belagerung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fahim_Belagerung_Info()
{
	AI_Output(hero, self, "Info_Mod_Fahim_Belagerung_15_00"); //Hast du etwas zu tun für mich?
	AI_Output(self, hero, "Info_Mod_Fahim_Belagerung_10_01"); //Allerdings!
	AI_Output(hero, self, "Info_Mod_Fahim_Belagerung_15_02"); //Was ist zu machen?
	AI_Output(self, hero, "Info_Mod_Fahim_Belagerung_10_03"); //Beim Angriff wurde die magische Kraft des Beliar Schreins deaktiviert. Somit können wir uns hier nicht wegtelepotieren. Wir müssen den Schrein reparieren.
	AI_Output(hero, self, "Info_Mod_Fahim_Belagerung_15_04"); //Wie soll ich das anstellen?
	AI_Output(self, hero, "Info_Mod_Fahim_Belagerung_10_05"); //Der Beliarschrein hat seine Kraft von einem Stein aus schwarzem Erz bezogen. Dieser ist zerstört. Wir brauchen einen neuen Stein!
	AI_Output(hero, self, "Info_Mod_Fahim_Belagerung_15_06"); //Woher bekommt man einen solchen Stein denn?
	AI_Output(self, hero, "Info_Mod_Fahim_Belagerung_10_07"); //Hinten, in der alten Bibliothek, soll es einen solchen Stein geben. Versuche dein Glück dort!
	AI_Output(hero, self, "Info_Mod_Fahim_Belagerung_15_08"); //Dann werde ich suchen gehen!

	Wld_InsertItem	(ItMi_Beliarstein_Unloaded, "FP_ITEM_GREATPEASANT_STPLATE_05");

	Log_CreateTopic	(TOPIC_MOD_BEL_BELIARSCHREIN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_BELIARSCHREIN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BEL_BELIARSCHREIN, "Der Stein aus schwarzem Erz des Beliarschreins ist zerstört. Ich muss einen Neuen finden, damit wir den Schrein wieder aktivieren können.");
};

INSTANCE Info_Mod_Fahim_HabStein (C_INFO)
{
	npc		= Mod_1029_SMK_Fahim_MT;
	nr		= 1;
	condition	= Info_Mod_Fahim_HabStein_Condition;
	information	= Info_Mod_Fahim_HabStein_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab den Stein gefunden.";
};

FUNC INT Info_Mod_Fahim_HabStein_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fahim_Belagerung))
	&& (Npc_HasItems(hero, ItMi_Beliarstein_Unloaded) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fahim_HabStein_Info()
{
	AI_Output(hero, self, "Info_Mod_Fahim_HabStein_15_00"); //Ich hab den Stein gefunden.

	B_GiveInvItems	(hero, self, ItMi_Beliarstein_Unloaded, 1);

	AI_Output(self, hero, "Info_Mod_Fahim_HabStein_10_01"); //Etwas stimmt nicht damit. Der Stein scheint keine magische Energie mehr zu besitzen!
	AI_Output(hero, self, "Info_Mod_Fahim_HabStein_15_02"); //Das habe ich bereits gemerkt. Was können wir tun?
	AI_Output(self, hero, "Info_Mod_Fahim_HabStein_10_03"); //Der Stein ist aus schwarzem Erz angefertigt. Frag mal Eduard, ob er den Stein reparieren kann.

	B_GiveInvItems	(self, hero, ItMi_Beliarstein_Unloaded, 1);

	AI_Output(hero, self, "Info_Mod_Fahim_HabStein_15_04"); //Dann werde ich mal gehen!

	B_GivePlayerXP	(200);

	B_LogEntry	(TOPIC_MOD_BEL_BELIARSCHREIN, "Der Stein, den ich gefunden habe, hatte keine magische Energie mehr. Jetzt soll ich ihn zu Eduard bringen, in der Hoffnung, dass er ihn reparieren kann.");
};

INSTANCE Info_Mod_Fahim_SteinRepariert (C_INFO)
{
	npc		= Mod_1029_SMK_Fahim_MT;
	nr		= 1;
	condition	= Info_Mod_Fahim_SteinRepariert_Condition;
	information	= Info_Mod_Fahim_SteinRepariert_Info;
	permanent	= 0;
	important	= 0;
	description	= "Der Stein funktioniert wieder prächtig!";
};

FUNC INT Info_Mod_Fahim_SteinRepariert_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eduard_SteinFertig))
	&& (Npc_HasItems(hero, ItMi_Beliarstein) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fahim_SteinRepariert_Info()
{
	AI_Output(hero, self, "Info_Mod_Fahim_SteinRepariert_15_00"); //Der Stein funktioniert wieder prächtig!
	AI_Output(self, hero, "Info_Mod_Fahim_SteinRepariert_10_01"); //Das ist wunderbar!
	AI_Output(hero, self, "Info_Mod_Fahim_SteinRepariert_15_02"); //Was bleibt noch zu tun?
	AI_Output(self, hero, "Info_Mod_Fahim_SteinRepariert_10_03"); //Verbinde den Stein nur noch mit dem Beliarschrein. Dabei fixiere deine magische Kraft vor dem Schrein Beliars und opfere einen Teil.
	AI_Output(self, hero, "Info_Mod_Fahim_SteinRepariert_10_04"); //Nun wird sich der Stein automatisch in den Schrein einfügen und diesen wieder in Gang bringen.
	AI_Output(hero, self, "Info_Mod_Fahim_SteinRepariert_15_05"); //Wenns weiter nichts ist.

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_BEL_BELIARSCHREIN, "Ich soll zum Schrein gehen und dort meine magische Kraft fixieren und einen Teil davon opfern. Der Rest geht von alleine.");
};

INSTANCE Info_Mod_Fahim_SchreinRepariert (C_INFO)
{
	npc		= Mod_1029_SMK_Fahim_MT;
	nr		= 1;
	condition	= Info_Mod_Fahim_SchreinRepariert_Condition;
	information	= Info_Mod_Fahim_SchreinRepariert_Info;
	permanent	= 0;
	important	= 0;
	description	= "Der Schrein ist repariert!";
};

FUNC INT Info_Mod_Fahim_SchreinRepariert_Condition()
{
	if (Npc_KnowsInfo(hero, PC_PrayIdol_SteinEinfuegen))
	&& (Npc_HasItems(hero, ItMi_Beliarstein) == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fahim_SchreinRepariert_Info()
{
	AI_Output(hero, self, "Info_Mod_Fahim_SchreinRepariert_15_00"); //Der Schrein ist repariert!
	AI_Output(self, hero, "Info_Mod_Fahim_SchreinRepariert_10_01"); //(erfreut) Wunderbar! Hier nimm dieses Gold als Belohnung! Ich werde Raven Bericht erstatten!
	
	CreateInvItems	(self, ItMi_Gold, 1000);
	B_GiveInvItems	(self, hero, ItMi_Gold, 1000);

	B_GivePlayerXP	(700);

	B_LogEntry_More	(TOPIC_MOD_BEL_BELIARSCHREIN, TOPIC_MOD_BEL_BELAGERUNG, "Der Schrein ist repariert, Fahim ist informiert und ich habe meine Belohnung erhalten.", "Ich habe Fahim geholfen, den Beliarschrein wieder zu aktivieren.");

	B_SetTopicStatus	(TOPIC_MOD_BEL_BELIARSCHREIN, LOG_SUCCESS);

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Fahim_Lehrer (C_INFO)
{
	npc		= Mod_1029_SMK_Fahim_MT;
	nr		= 1;
	condition	= Info_Mod_Fahim_Lehrer_Condition;
	information	= Info_Mod_Fahim_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir was beibringen?";
};

FUNC INT Info_Mod_Fahim_Lehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fahim_Hi))
	&& ((Mod_Gilde == 12)
	|| (Mod_Gilde == 15)
	|| (Mod_Gilde == 16))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fahim_Lehrer_Info()
{
	B_Say	(hero, self, "$KANNSTDUMIRWASBEIBRINGEN");

	AI_Output(self, hero, "Info_Mod_Fahim_Lehrer_10_00"); //Ich kann dir den Umgang mit Einhändern beibringen.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_DÄMONENRITTER, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_DÄMONENRITTER, "Fahim kann mich im Kampf mit Einhändern unterweisen.");
};

INSTANCE Info_Mod_Fahim_Lernen (C_INFO)
{
	npc		= Mod_1029_SMK_Fahim_MT;
	nr		= 1;
	condition	= Info_Mod_Fahim_Lernen_Condition;
	information	= Info_Mod_Fahim_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will lernen.";
};

FUNC INT Info_Mod_Fahim_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fahim_Lehrer))
	&& ((Mod_Gilde == 12)
	|| (Mod_Gilde == 15)
	|| (Mod_Gilde == 16))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fahim_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Fahim_Lernen_15_00"); //Ich will lernen.

	Info_ClearChoices	(Info_Mod_Fahim_Lernen);

	Info_AddChoice	(Info_Mod_Fahim_Lernen, DIALOG_BACK, Info_Mod_Fahim_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Fahim_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Fahim_Lernen_1H_5);
	Info_AddChoice	(Info_Mod_Fahim_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Fahim_Lernen_1H_1);
};

FUNC VOID Info_Mod_Fahim_Lernen_BACK()
{
	Info_ClearChoices	(Info_Mod_Fahim_Lernen);
};

FUNC VOID Info_Mod_Fahim_Lernen_1H_5()
{
	if B_TeachFightTalentPercent_New	(self, hero, NPC_TALENT_1H, 5, 100)
	{
		Info_ClearChoices	(Info_Mod_Fahim_Lernen);

		Info_AddChoice	(Info_Mod_Fahim_Lernen, DIALOG_BACK, Info_Mod_Fahim_Lernen_BACK);
		Info_AddChoice	(Info_Mod_Fahim_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Fahim_Lernen_1H_5);
		Info_AddChoice	(Info_Mod_Fahim_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Fahim_Lernen_1H_1);
	};
};

FUNC VOID Info_Mod_Fahim_Lernen_1H_1()
{
	if B_TeachFightTalentPercent	(self, hero, NPC_TALENT_1H, 1, 100)
	{
		Info_ClearChoices	(Info_Mod_Fahim_Lernen);

		Info_AddChoice	(Info_Mod_Fahim_Lernen, DIALOG_BACK, Info_Mod_Fahim_Lernen_BACK);
		Info_AddChoice	(Info_Mod_Fahim_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Fahim_Lernen_1H_5);
		Info_AddChoice	(Info_Mod_Fahim_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Fahim_Lernen_1H_1);
	};
};

INSTANCE Info_Mod_Fahim_Pickpocket (C_INFO)
{
	npc		= Mod_1029_SMK_Fahim_MT;
	nr		= 1;
	condition	= Info_Mod_Fahim_Pickpocket_Condition;
	information	= Info_Mod_Fahim_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Fahim_Pickpocket_Condition()
{
	C_Beklauen	(56, ItMi_Gold, 150);
};

FUNC VOID Info_Mod_Fahim_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Fahim_Pickpocket);

	Info_AddChoice	(Info_Mod_Fahim_Pickpocket, DIALOG_BACK, Info_Mod_Fahim_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Fahim_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Fahim_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Fahim_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Fahim_Pickpocket);
};

FUNC VOID Info_Mod_Fahim_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Fahim_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Fahim_Pickpocket);

		Info_AddChoice	(Info_Mod_Fahim_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Fahim_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Fahim_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Fahim_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Fahim_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Fahim_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Fahim_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Fahim_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Fahim_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Fahim_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Fahim_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Fahim_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Fahim_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Fahim_EXIT (C_INFO)
{
	npc		= Mod_1029_SMK_Fahim_MT;
	nr		= 1;
	condition	= Info_Mod_Fahim_EXIT_Condition;
	information	= Info_Mod_Fahim_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Fahim_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fahim_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};