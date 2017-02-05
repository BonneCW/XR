INSTANCE Info_Mod_Marcus_UntoteOrks (C_INFO)
{
	npc		= Mod_7752_OUT_Marcus_EIS;
	nr		= 1;
	condition	= Info_Mod_Marcus_UntoteOrks_Condition;
	information	= Info_Mod_Marcus_UntoteOrks_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du sollst mich zu Melchior bringen.";
};

FUNC INT Info_Mod_Marcus_UntoteOrks_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Willingham_UntoteOrks))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Marcus_UntoteOrks_Info()
{
	AI_Output(hero, self, "Info_Mod_Marcus_UntoteOrks_15_00"); //Du sollst mich zu Melchior bringen und seinen Posten übernehmen.
	AI_Output(self, hero, "Info_Mod_Marcus_UntoteOrks_07_01"); //Willingham schickt dich, oder? Ich bring dich dorthin, aber vorher musst du mir bei einer Kleinigkeit helfen.
	AI_Output(hero, self, "Info_Mod_Marcus_UntoteOrks_15_02"); //Was springt für mich dabei raus?
	AI_Output(self, hero, "Info_Mod_Marcus_UntoteOrks_07_03"); //Sagen wir 150 Gold. Einverstanden?
	AI_Output(hero, self, "Info_Mod_Marcus_UntoteOrks_15_04"); //Gut, ich werde dir helfen, aber wenn ich glaube, dass ich mehr verdient habe, dann müssen wir neu verhandeln.
	AI_Output(self, hero, "Info_Mod_Marcus_UntoteOrks_07_05"); //Damit kann ich leben.

	Log_CreateTopic	(TOPIC_MOD_EIS_MARCUS, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_EIS_MARCUS, LOG_RUNNING);
	B_LogEntry_More	(TOPIC_MOD_EIS_UNTOTEORKS, TOPIC_MOD_EIS_MARCUS, "Bevor mich Marcus zu Melchior führt soll ich ihm noch bei einer Kleinigkeit helfen.", "Bevor mich Marcus zu Melchior führt soll ich ihm noch bei einer Kleinigkeit helfen. Er wird mich dorthin führen.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SENDAK");

	self.aivar[AIV_Partymember] = TRUE;

	Wld_InsertNpc	(Mod_7753_BDT_Sendak_EIS, "EIS_326");
};

INSTANCE Info_Mod_Marcus_UntoteOrks2 (C_INFO)
{
	npc		= Mod_7752_OUT_Marcus_EIS;
	nr		= 1;
	condition	= Info_Mod_Marcus_UntoteOrks2_Condition;
	information	= Info_Mod_Marcus_UntoteOrks2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Marcus_UntoteOrks2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sendak_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Marcus_UntoteOrks2_Info()
{
	AI_Output(hero, self, "Info_Mod_Marcus_UntoteOrks2_15_00"); //Was für eine Kleinigkeit soll denn das gewesen sein? Wer war der Kerl?
	AI_Output(self, hero, "Info_Mod_Marcus_UntoteOrks2_07_01"); //Ich musste dich hier herbringen. Ich hatte ein, zwei Geschäfte mit den Banditen.
	AI_Output(self, hero, "Info_Mod_Marcus_UntoteOrks2_07_02"); //Und als du Aslan getötet hast, wollte der Rest der Bande deinen Kopf.
	AI_Output(self, hero, "Info_Mod_Marcus_UntoteOrks2_07_03"); //Aber ich wusste nicht, dass er auch noch diese Bestien auf uns hetzt.
	AI_Output(hero, self, "Info_Mod_Marcus_UntoteOrks2_15_04"); //Und du wusstest nicht, dass sie dich auch töten wollten.
	AI_Output(self, hero, "Info_Mod_Marcus_UntoteOrks2_07_05"); //Ich werde das wieder gut machen. Ich hoffe, du erzählst Willingham nichts davon.
	AI_Output(hero, self, "Info_Mod_Marcus_UntoteOrks2_15_06"); //Ich sehe die Sache als vergessen an, aber falls du mir nochmal Banditen oder Orks auf den Hals hetzt, endest du so wie sie.
	AI_Output(hero, self, "Info_Mod_Marcus_UntoteOrks2_15_07"); //Nun bring mich aber endlich zu Melchior.
	AI_Output(self, hero, "Info_Mod_Marcus_UntoteOrks2_07_08"); //Folge mir, sein Posten ist nicht mehr weit weg.

	B_SetTopicStatus	(TOPIC_MOD_EIS_MARCUS, LOG_SUCCESS);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "MELCHIOR");

	CurrentNQ += 1;

	B_GivePlayerXP	(150);
};

INSTANCE Info_Mod_Marcus_Heiltrank (C_INFO)
{
	npc		= Mod_7752_OUT_Marcus_EIS;
	nr		= 1;
	condition	= Info_Mod_Marcus_Heiltrank_Condition;
	information	= Info_Mod_Marcus_Heiltrank_Info;
	permanent	= 1;
	important	= 0;
	description	= "(Heiltrank geben)";
};

FUNC INT Info_Mod_Marcus_Heiltrank_Condition()
{
	if (self.aivar[AIV_Partymember] == TRUE)
	&& (Mod_IR_Diego == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Marcus_Heiltrank_Info()
{
	Info_ClearChoices	(Info_Mod_Marcus_Heiltrank);

	Info_AddChoice	(Info_Mod_Marcus_Heiltrank, DIALOG_BACK, Info_Mod_Marcus_Heiltrank_BACK);

	if (Npc_HasItems(hero, ItPo_Health_Addon_04) >= 1)
	{
		Info_AddChoice	(Info_Mod_Marcus_Heiltrank, "Essenz der Heilung", Info_Mod_Marcus_Heiltrank_Health_04);
	};
	if (Npc_HasItems(hero, ItPo_Health_01) >= 1)
	{
		Info_AddChoice	(Info_Mod_Marcus_Heiltrank, "Elixier der Heilung", Info_Mod_Marcus_Heiltrank_Health_03);
	};
	if (Npc_HasItems(hero, ItPo_Health_02) >= 1)
	{
		Info_AddChoice	(Info_Mod_Marcus_Heiltrank, "Extrakt der Heilung", Info_Mod_Marcus_Heiltrank_Health_02);
	};
	if (Npc_HasItems(hero, ItPo_Health_01) >= 1)
	{
		Info_AddChoice	(Info_Mod_Marcus_Heiltrank, "Essenz der Heilung", Info_Mod_Marcus_Heiltrank_Health_01);
	};
	if (Npc_HasItems(hero, ItPo_Health_07) >= 1)
	{
		Info_AddChoice	(Info_Mod_Marcus_Heiltrank, "Trank der leichten Heilung", Info_Mod_Marcus_Heiltrank_Health_07);
	};
	if (Npc_HasItems(hero, ItPo_Health_06) >= 1)
	{
		Info_AddChoice	(Info_Mod_Marcus_Heiltrank, "Leichter Heiltrank", Info_Mod_Marcus_Heiltrank_Health_06);
	};
	if (Npc_HasItems(hero, ItPo_Health_05) >= 1)
	{
		Info_AddChoice	(Info_Mod_Marcus_Heiltrank, "Trank der schnellen Heilung", Info_Mod_Marcus_Heiltrank_Health_05);
	};
};

FUNC VOID Info_Mod_Marcus_Heiltrank_BACK ()
{
	Info_ClearChoices	(Info_Mod_Marcus_Heiltrank);
};

FUNC VOID Info_Mod_Marcus_Heiltrank_Health_04 ()
{
	Info_ClearChoices	(Info_Mod_Marcus_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_Addon_04, 1);

	B_UseItem	(self, ItPo_Health_Addon_04);
};

FUNC VOID Info_Mod_Marcus_Heiltrank_Health_03 ()
{
	Info_ClearChoices	(Info_Mod_Marcus_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_03, 1);

	B_UseItem	(self, ItPo_Health_03);
};

FUNC VOID Info_Mod_Marcus_Heiltrank_Health_02 ()
{
	Info_ClearChoices	(Info_Mod_Marcus_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_02, 1);

	B_UseItem	(self, ItPo_Health_02);
};

FUNC VOID Info_Mod_Marcus_Heiltrank_Health_01 ()
{
	Info_ClearChoices	(Info_Mod_Marcus_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_01, 1);

	B_UseItem	(self, ItPo_Health_01);
};

FUNC VOID Info_Mod_Marcus_Heiltrank_Health_07 ()
{
	Info_ClearChoices	(Info_Mod_Marcus_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_07, 1);

	B_UseItem	(self, ItPo_Health_07);
};

FUNC VOID Info_Mod_Marcus_Heiltrank_Health_06 ()
{
	Info_ClearChoices	(Info_Mod_Marcus_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_06, 1);

	B_UseItem	(self, ItPo_Health_06);
};

FUNC VOID Info_Mod_Marcus_Heiltrank_Health_05 ()
{
	Info_ClearChoices	(Info_Mod_Marcus_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_05, 1);

	B_UseItem	(self, ItPo_Health_05);
};

INSTANCE Info_Mod_Marcus_Pickpocket (C_INFO)
{
	npc		= Mod_7752_OUT_Marcus_EIS;
	nr		= 1;
	condition	= Info_Mod_Marcus_Pickpocket_Condition;
	information	= Info_Mod_Marcus_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_150;
};

FUNC INT Info_Mod_Marcus_Pickpocket_Condition()
{
	C_Beklauen	(137, ItMi_Gold, 60);
};

FUNC VOID Info_Mod_Marcus_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Marcus_Pickpocket);

	Info_AddChoice	(Info_Mod_Marcus_Pickpocket, DIALOG_BACK, Info_Mod_Marcus_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Marcus_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Marcus_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Marcus_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Marcus_Pickpocket);
};

FUNC VOID Info_Mod_Marcus_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Marcus_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Marcus_Pickpocket);

		Info_AddChoice	(Info_Mod_Marcus_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Marcus_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Marcus_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Marcus_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Marcus_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Marcus_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Marcus_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Marcus_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Marcus_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Marcus_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Marcus_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Marcus_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Marcus_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Marcus_EXIT (C_INFO)
{
	npc		= Mod_7752_OUT_Marcus_EIS;
	nr		= 1;
	condition	= Info_Mod_Marcus_EXIT_Condition;
	information	= Info_Mod_Marcus_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Marcus_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Marcus_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};