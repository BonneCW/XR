INSTANCE Info_Mod_Frazer_Hi (C_INFO)
{
	npc		= Mod_7479_OUT_Frazer_REL;
	nr		= 1;
	condition	= Info_Mod_Frazer_Hi_Condition;
	information	= Info_Mod_Frazer_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was machst du hier?";
};

FUNC INT Info_Mod_Frazer_Hi_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Frazer_Hi_Info()
{
	B_Say	(hero, self, "$WASMACHSTDUHIER");

	AI_Output(self, hero, "Info_Mod_Frazer_Hi_13_01"); //Rumstehen, und ab und zu kratz ich mir den Sack. (lacht rau)
	AI_Output(self, hero, "Info_Mod_Frazer_Hi_13_02"); //Naja, eigentlich soll ich ein Auge auf die Jungs hier haben, aber was soll da schon groß passieren? (Pause)
	AI_Output(self, hero, "Info_Mod_Frazer_Hi_13_03"); //Wart mal, wenn du schon hier bist ... nimmste das hier gleich mit zum Boss, oder?
	AI_Output(self, hero, "Info_Mod_Frazer_Hi_13_04"); //Dann muss ich nämlich nicht immer laufen, gibt echt Spannenderes.

	B_GiveInvItems	(self, hero, ItMi_ErzPaketFrazer, 10);

	AI_Output(hero, self, "Info_Mod_Frazer_Hi_15_05"); //Was ... äh ... Wer ist der Boss?
	AI_Output(self, hero, "Info_Mod_Frazer_Hi_13_06"); //Anselm natürlich! Wir brauchen das Zeug für Umbauarbeiten an den Wasserleitungen. Oder so.

	Log_CreateTopic	(TOPIC_MOD_KHORATA_ERZPAKETE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_KHORATA_ERZPAKETE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_KHORATA_ERZPAKETE, "Frazer hat mir unvermittelt 10 Erzpakete in die Arme gedrückt, die ich zu Anselm in Khorata bringen soll.");
};

INSTANCE Info_Mod_Frazer_Endres (C_INFO)
{
	npc		= Mod_7479_OUT_Frazer_REL;
	nr		= 1;
	condition	= Info_Mod_Frazer_Endres_Condition;
	information	= Info_Mod_Frazer_Endres_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du einen Verdacht, wer Endres getötet haben könnte?";
};

FUNC INT Info_Mod_Frazer_Endres_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Frazer_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Heiler_Endres))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Frazer_Endres_Info()
{
	AI_Output(hero, self, "Info_Mod_Frazer_Endres_15_00"); //Hast du einen Verdacht, wer Endres getötet haben könnte?
	AI_Output(self, hero, "Info_Mod_Frazer_Endres_13_01"); //Da kommt eigentlich jeder der Schürfer infrage. Und sonst ... frag mich nicht.
};

INSTANCE Info_Mod_Frazer_Endres02 (C_INFO)
{
	npc		= Mod_7479_OUT_Frazer_REL;
	nr		= 1;
	condition	= Info_Mod_Frazer_Endres02_Condition;
	information	= Info_Mod_Frazer_Endres02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer hat Endres' Arbeit übernommen?";
};

FUNC INT Info_Mod_Frazer_Endres02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Norman_Endres))
	&& (Npc_KnowsInfo(hero, Info_Mod_Roman_Endres))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Frazer_Endres02_Info()
{
	AI_Output(hero, self, "Info_Mod_Frazer_Endres02_15_00"); //Wer hat Endres' Arbeit übernommen?
	AI_Output(self, hero, "Info_Mod_Frazer_Endres02_13_01"); //(misstrauisch) Wieso willst du das wissen? Planst wohl, auch ihn das Zeitliche segnen zu lassen?
	AI_Output(self, hero, "Info_Mod_Frazer_Endres02_13_02"); //Nein, aus Sicherheitsgründen werden wir den neuen Vorsteher nicht verraten.
	AI_Output(hero, self, "Info_Mod_Frazer_Endres02_15_03"); //Was muss ich tun, damit du mir den Namen verrätst?
	AI_Output(self, hero, "Info_Mod_Frazer_Endres02_13_04"); //Ich muss mir sicher sein, dass du ihm keinen Schaden zufügen willst.
	AI_Output(hero, self, "Info_Mod_Frazer_Endres02_15_05"); //Versprechen reicht dir wahrscheinlich nicht?
	AI_Output(self, hero, "Info_Mod_Frazer_Endres02_13_06"); //Haha. Hmm ... ein Nachweis deiner Loyalität ... na schön, da fällt mir was ein: Küss mich!
	AI_Output(hero, self, "Info_Mod_Frazer_Endres02_15_07"); //Was?!
	AI_Output(self, hero, "Info_Mod_Frazer_Endres02_13_08"); //Ahaha, Witz. Ein kleines Zettelchen von Anselm, auf dem er sich für dich verbürgt, würde mir auch reichen.
	AI_Output(hero, self, "Info_Mod_Frazer_Endres02_15_09"); //Ich werde sehen, was sich machen lässt.

	B_LogEntry	(TOPIC_MOD_KHORATA_ENDRES, "Frazer aus der Mine wird mir nur erzählen, wer Endres' Posten geerbt hat, wenn er von Anselm die Versicherung bekommen hat, dass mir zu trauen ist.");
};

INSTANCE Info_Mod_Frazer_Endres03 (C_INFO)
{
	npc		= Mod_7479_OUT_Frazer_REL;
	nr		= 1;
	condition	= Info_Mod_Frazer_Endres03_Condition;
	information	= Info_Mod_Frazer_Endres03_Info;
	permanent	= 0;
	important	= 0;
	description	= "Von Anselm für dich.";
};

FUNC INT Info_Mod_Frazer_Endres03_Condition()
{
	if (Npc_HasItems(hero, ItWr_AnselmForFrazer) == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Frazer_Endres02))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Frazer_Endres03_Info()
{
	AI_Output(hero, self, "Info_Mod_Frazer_Endres03_15_00"); //Von Anselm für dich.

	B_GiveInvItems	(hero, self, ItWr_AnselmForFrazer, 1);

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Frazer_Endres03_13_01"); //Joa, in Ordnung. Dann darf ich dich wohl einweihen.
	AI_Output(self, hero, "Info_Mod_Frazer_Endres03_13_02"); //Also, Wendel hat natürlich Endres' Platz eingenommen. Er ist der einzige, der dafür qualifiziert ist.
	AI_Output(self, hero, "Info_Mod_Frazer_Endres03_13_03"); //Nur eine Frage habe ich noch: Warum willst du das eigentlich wissen?
	AI_Output(hero, self, "Info_Mod_Frazer_Endres03_15_04"); //Wendel steht ab jetzt unter Tatverdacht.
	AI_Output(self, hero, "Info_Mod_Frazer_Endres03_13_05"); //(überrascht) Wendel? Das trau ich dem nicht zu ... (denkt nach) Aber ja doch, das würde Sinn ergeben ...
	AI_Output(hero, self, "Info_Mod_Frazer_Endres03_15_06"); //Wir werden sehen.

	B_LogEntry	(TOPIC_MOD_KHORATA_ENDRES, "Wendel hat von dem Tod Endres' profitiert. Hat er mit dem Mord einen Rivalen aus dem Weg geräumt?");

	B_GivePlayerXP	(50);
};

INSTANCE Info_Mod_Frazer_Pickpocket (C_INFO)
{
	npc		= Mod_7479_OUT_Frazer_REL;
	nr		= 1;
	condition	= Info_Mod_Frazer_Pickpocket_Condition;
	information	= Info_Mod_Frazer_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Frazer_Pickpocket_Condition()
{
	C_Beklauen	(72, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_Frazer_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Frazer_Pickpocket);

	Info_AddChoice	(Info_Mod_Frazer_Pickpocket, DIALOG_BACK, Info_Mod_Frazer_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Frazer_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Frazer_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Frazer_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Frazer_Pickpocket);
};

FUNC VOID Info_Mod_Frazer_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Frazer_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Frazer_Pickpocket);

		Info_AddChoice	(Info_Mod_Frazer_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Frazer_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Frazer_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Frazer_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Frazer_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Frazer_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Frazer_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Frazer_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Frazer_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Frazer_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Frazer_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Frazer_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Frazer_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Frazer_EXIT (C_INFO)
{
	npc		= Mod_7479_OUT_Frazer_REL;
	nr		= 1;
	condition	= Info_Mod_Frazer_EXIT_Condition;
	information	= Info_Mod_Frazer_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Frazer_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Frazer_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};