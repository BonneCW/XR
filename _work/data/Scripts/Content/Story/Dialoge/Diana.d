INSTANCE Info_Mod_Diana_Hi (C_INFO)
{
	npc		= Mod_7637_OUT_Diana_REL;
	nr		= 1;
	condition	= Info_Mod_Diana_Hi_Condition;
	information	= Info_Mod_Diana_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Alles in Ordnung?";
};

FUNC INT Info_Mod_Diana_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Diana_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Diana_Hi_15_00"); //Alles in Ordnung?
	AI_Output(self, hero, "Info_Mod_Diana_Hi_43_01"); //Ich hoffe es, aber langsam mache ich mir Sorgen.
	AI_Output(hero, self, "Info_Mod_Diana_Hi_15_02"); //Vermisst du jemanden?
	AI_Output(self, hero, "Info_Mod_Diana_Hi_43_03"); //Unsere Tochter ist heute Morgen zum Pilzesammeln aufgebrochen, aber bisher nicht zurückgekehrt.
	AI_Output(self, hero, "Info_Mod_Diana_Hi_43_04"); //Nicht, dass sie nicht alt genug wäre, um selbst auf sich aufpassen zu können, aber es lässt mir doch keine Ruhe, nichts von ihr zu hören.
	AI_Output(self, hero, "Info_Mod_Diana_Hi_43_05"); //Wenn du ihr begegnest, sag ihr ruhig Bescheid, dass sie sich langsam mal wieder auf den Rückweg machen könnte.
	AI_Output(self, hero, "Info_Mod_Diana_Hi_43_06"); //Du kannst sie an ihrer eigenwilligen roten Mütze erkennen.
	
	Log_CreateTopic	(TOPIC_MOD_ROTKAEPPCHEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ROTKAEPPCHEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ROTKAEPPCHEN, "Diana vermisst ihre Tochter, die heute morgen zum Pilzesammeln aufgebrochen ist. Ich kann sie an ihrer roten Mütze erkennen.");
};

INSTANCE Info_Mod_Diana_Eintopf (C_INFO)
{
	npc		= Mod_7637_OUT_Diana_REL;
	nr		= 1;
	condition	= Info_Mod_Diana_Eintopf_Condition;
	information	= Info_Mod_Diana_Eintopf_Info;
	permanent	= 0;
	important	= 0;
	description	= "Machst du auch leckere Eintöpfe?";
};

FUNC INT Info_Mod_Diana_Eintopf_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Diana_Eintopf_Info()
{
	AI_Output(hero, self, "Info_Mod_Diana_Eintopf_15_00"); //Machst du auch leckere Eintöpfe?
	AI_Output(self, hero, "Info_Mod_Diana_Eintopf_43_01"); //Sieh dir doch die gutgenährten Buben auf dem Hof an! Das Fleischwanzenragout reißen sie mir förmlich aus den Händen.
	AI_Output(self, hero, "Info_Mod_Diana_Eintopf_43_02"); //(verschwörerisch) Mein Geheimnis sind kleine Melonenstückchen.
	AI_Output(hero, self, "Info_Mod_Diana_Eintopf_15_03"); //Aha. Ist ja interessant.
};

INSTANCE Info_Mod_Diana_Pickpocket (C_INFO)
{
	npc		= Mod_7637_OUT_Diana_REL;
	nr		= 1;
	condition	= Info_Mod_Diana_Pickpocket_Condition;
	information	= Info_Mod_Diana_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Diana_Pickpocket_Condition()
{
	C_Beklauen	(87, ItFo_Stew, 3);
};

FUNC VOID Info_Mod_Diana_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Diana_Pickpocket);

	Info_AddChoice	(Info_Mod_Diana_Pickpocket, DIALOG_BACK, Info_Mod_Diana_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Diana_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Diana_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Diana_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Diana_Pickpocket);
};

FUNC VOID Info_Mod_Diana_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Diana_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Diana_Pickpocket);

		Info_AddChoice	(Info_Mod_Diana_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Diana_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Diana_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Diana_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Diana_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Diana_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Diana_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Diana_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Diana_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Diana_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Diana_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Diana_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Diana_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Diana_EXIT (C_INFO)
{
	npc		= Mod_7637_OUT_Diana_REL;
	nr		= 1;
	condition	= Info_Mod_Diana_EXIT_Condition;
	information	= Info_Mod_Diana_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Diana_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Diana_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};