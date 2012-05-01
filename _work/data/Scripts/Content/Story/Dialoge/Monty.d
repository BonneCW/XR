INSTANCE Info_Mod_Monty_Hi (C_INFO)
{
	npc		= Mod_741_NONE_Monty_NW;
	nr		= 1;
	condition	= Info_Mod_Monty_Hi_Condition;
	information	= Info_Mod_Monty_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie ich höre, willst du den Schläfer besiegt haben.";
};

FUNC INT Info_Mod_Monty_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Monty_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Monty_Hi_15_00"); //Wie ich höre, willst du den Schläfer besiegt haben.
	AI_Output(self, hero, "Info_Mod_Monty_Hi_08_01"); //(eifrig) Genau! Stell dich zu den anderen, ich erzähle gerade, wie ich es geschafft habe.
};

INSTANCE Info_Mod_Monty_KeinInteresse (C_INFO)
{
	npc		= Mod_741_NONE_Monty_NW;
	nr		= 1;
	condition	= Info_Mod_Monty_KeinInteresse_Condition;
	information	= Info_Mod_Monty_KeinInteresse_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Geschichte interessiert mich nicht.";
};

FUNC INT Info_Mod_Monty_KeinInteresse_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Monty_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Monty_KeinInteresse_Info()
{
	AI_Output(hero, self, "Info_Mod_Monty_KeinInteresse_15_00"); //Die Geschichte interessiert mich nicht.
	AI_Output(self, hero, "Info_Mod_Monty_KeinInteresse_08_01"); //Nein? Was denn dann?
	AI_Output(hero, self, "Info_Mod_Monty_KeinInteresse_15_02"); //Ich war es, der den Schläfer zurück in seine Dimension verbannt hat.
	AI_Output(self, hero, "Info_Mod_Monty_KeinInteresse_08_03"); //(lacht laut) Ah, ein Witzbold! (murmelt) Hey, Kollege, das hier ist mein Revier, in Ordnung?

	Log_CreateTopic	(TOPIC_MOD_MONTY_KONKURRENZKAMPF, LOG_MISSION);

	Info_ClearChoices	(Info_Mod_Monty_KeinInteresse);

	Info_AddChoice	(Info_Mod_Monty_KeinInteresse, "Entweder du verschwindest oder es wird wehtun.", Info_Mod_Monty_KeinInteresse_B);
	Info_AddChoice	(Info_Mod_Monty_KeinInteresse, "Na schön, mach was du willst.", Info_Mod_Monty_KeinInteresse_A);
};

FUNC VOID Info_Mod_Monty_KeinInteresse_B()
{
	AI_Output(hero, self, "Info_Mod_Monty_KeinInteresse_B_15_00"); //Entweder du verschwindest oder es wird wehtun.
	AI_Output(self, hero, "Info_Mod_Monty_KeinInteresse_B_08_01"); //(ängstlich) Bleib mal ruhig! Ich bin ein bisschen knapp bei Kasse, was soll ich tun?

	Info_ClearChoices	(Info_Mod_Monty_KeinInteresse);

	if (Mod_Verhandlungsgeschick > 0)
	{
		Info_AddChoice	(Info_Mod_Monty_KeinInteresse, "(Feilschen) Du gibst mir 50 Gold und wir sind quitt.", Info_Mod_Monty_KeinInteresse_E);
	};

	Info_AddChoice	(Info_Mod_Monty_KeinInteresse, "Du willst es wohl ohne Schmerzen nicht einsehen.", Info_Mod_Monty_KeinInteresse_D);
	Info_AddChoice	(Info_Mod_Monty_KeinInteresse, "Also gut. Mach weiter.", Info_Mod_Monty_KeinInteresse_C);
};

FUNC VOID Info_Mod_Monty_KeinInteresse_A()
{
	AI_Output(hero, self, "Info_Mod_Monty_KeinInteresse_A_15_00"); //Na schön, mach was du willst.
	AI_Output(self, hero, "Info_Mod_Monty_KeinInteresse_A_08_01"); //(leise) Danke für deine Einsicht. Scheiße, ich brauch das Geld.

	B_GivePlayerXP	(50);

	B_LogEntry	(TOPIC_MOD_MONTY_KONKURRENZKAMPF, "Ich lasse Monty seine Geschichte weitererzählen. Ich halte mich da raus.");
	B_SetTopicStatus	(TOPIC_MOD_MONTY_KONKURRENZKAMPF, LOG_SUCCESS);

	Mod_MontyFake = 1;

	CurrentNQ += 1;

	Info_ClearChoices	(Info_Mod_Monty_KeinInteresse);
};

FUNC VOID Info_Mod_Monty_KeinInteresse_E()
{
	AI_Output(hero, self, "Info_Mod_Monty_KeinInteresse_E_15_00"); //Du gibst mir 50 Gold und wir sind quitt.

	if (self.aivar[AIV_Verhandlung] == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_Monty_KeinInteresse_E_08_01"); //Das ist ein guter Kompromiss!

		B_GiveInvItems	(self, hero, ItMi_Gold, 50);

		B_RaiseHandelsgeschick (2);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Monty_KeinInteresse_E_08_02"); //So viel habe ich leider nicht.
	};

	B_GivePlayerXP	(50);

	B_LogEntry	(TOPIC_MOD_MONTY_KONKURRENZKAMPF, "Ich lasse Monty seine Geschichte weitererzählen. Ich halte mich da raus.");
	B_SetTopicStatus	(TOPIC_MOD_MONTY_KONKURRENZKAMPF, LOG_SUCCESS);

	Mod_MontyFake = 1;

	CurrentNQ += 1;

	Info_ClearChoices	(Info_Mod_Monty_KeinInteresse);
};

FUNC VOID Info_Mod_Monty_KeinInteresse_D()
{
	AI_Output(hero, self, "Info_Mod_Monty_KeinInteresse_D_15_00"); //Du willst es wohl ohne Schmerzen nicht einsehen.
	AI_Output(self, hero, "DEFAULT"); //

	Info_ClearChoices	(Info_Mod_Monty_KeinInteresse);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_None, 0);

	Mod_MontyFake = 2;
};

FUNC VOID Info_Mod_Monty_KeinInteresse_C()
{
	AI_Output(hero, self, "Info_Mod_Monty_KeinInteresse_C_15_00"); //Also gut. Mach weiter.
	AI_Output(self, hero, "Info_Mod_Monty_KeinInteresse_C_08_01"); //(leise) Danke für deine Einsicht. Scheiße, ich brauch das Geld.

	B_GivePlayerXP	(50);

	B_LogEntry	(TOPIC_MOD_MONTY_KONKURRENZKAMPF, "Ich lasse Monty seine Geschichte weitererzählen. Ich halte mich da raus.");
	B_SetTopicStatus	(TOPIC_MOD_MONTY_KONKURRENZKAMPF, LOG_SUCCESS);

	Mod_MontyFake = 1;

	CurrentNQ += 1;

	Info_ClearChoices	(Info_Mod_Monty_KeinInteresse);
};

INSTANCE Info_Mod_Monty_Pruegel (C_INFO)
{
	npc		= Mod_741_NONE_Monty_NW;
	nr		= 1;
	condition	= Info_Mod_Monty_Pruegel_Condition;
	information	= Info_Mod_Monty_Pruegel_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Monty_Pruegel_Condition()
{
	if (Mod_MontyFake == 2)
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		return 1;
	}
	else if (Mod_MontyFake == 2)
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		B_SetTopicStatus	(TOPIC_MOD_MONTY_KONKURRENZKAMPF, LOG_FAILED);
	};
};

FUNC VOID Info_Mod_Monty_Pruegel_Info()
{
	AI_Output(self, hero, "Info_Mod_Monty_Pruegel_08_00"); //Ich sag ja schon nichts mehr!

	Mod_MontyFake = 3;

	CurrentNQ += 1;

	B_LogEntry	(TOPIC_MOD_MONTY_KONKURRENZKAMPF, "Ich konnte Monty nicht ungestraft lassen. Das wird ihm eine Lehre sein.");
	B_SetTopicStatus	(TOPIC_MOD_MONTY_KONKURRENZKAMPF, LOG_SUCCESS);

	// ------ In jedem Fall: Arena-Kampf abgeschlossen ------
	self.aivar[AIV_ArenaFight] = AF_NONE;
		
	// ------ AIVAR resetten! ------	
	self.aivar[AIV_LastFightComment] = TRUE;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
	B_StartOtherRoutine	(Mod_1049_VLK_Buerger_NW, "START");
	B_StartOtherRoutine	(Mod_1059_VLK_Buerger_NW, "START");
	B_StartOtherRoutine	(Mod_1055_VLK_Buerger_NW, "START");
	B_StartOtherRoutine	(Mod_1065_VLK_Buergerin_NW, "START");
	B_StartOtherRoutine	(Mod_1073_VLK_Buergerin_NW, "START");
	B_StartOtherRoutine	(Mod_1072_VLK_Buergerin_NW, "START");
	B_StartOtherRoutine	(Mod_1044_VLK_Buerger_NW, "START");
};

INSTANCE Info_Mod_Monty_WieGehts (C_INFO)
{
	npc		= Mod_741_NONE_Monty_NW;
	nr		= 1;
	condition	= Info_Mod_Monty_WieGehts_Condition;
	information	= Info_Mod_Monty_WieGehts_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie läuft's?";
};

FUNC INT Info_Mod_Monty_WieGehts_Condition()
{
	if (Kapitel >= 2)
	&& ((Mod_MontyFake == 1)
	|| (Mod_MontyFake == 3))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Monty_WieGehts_Info()
{
	AI_Output(hero, self, "Info_Mod_Monty_WieGehts_15_00"); //Wie läuft's?

	if (Mod_MontyFake == 1)
	{
		AI_Output(self, hero, "Info_Mod_Monty_WieGehts_08_01"); //Die Leute zahlen für eine gute Geschichte. Solltest du auch mal probieren.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Monty_WieGehts_08_02"); //(lustlos) Halt's Maul. Bin froh, wenn ich was zu beißen kriege.

		Info_ClearChoices	(Info_Mod_Monty_WieGehts);

		Info_AddChoice	(Info_Mod_Monty_WieGehts, "Dann bereichere dich nicht auf Kosten anderer.", Info_Mod_Monty_WieGehts_B);

		if (Npc_HasItems(hero, ItFo_Bread) >= 1)
		{
			Info_AddChoice	(Info_Mod_Monty_WieGehts, "Hier hast du ein wenig Brot.", Info_Mod_Monty_WieGehts_A);
		};
	};
};

FUNC VOID Info_Mod_Monty_WieGehts_B()
{
	AI_Output(hero, self, "Info_Mod_Monty_WieGehts_B_15_00"); //Dann bereichere dich nicht auf Kosten anderer.

	Info_ClearChoices	(Info_Mod_Monty_WieGehts);
};

FUNC VOID Info_Mod_Monty_WieGehts_A()
{
	AI_Output(hero, self, "Info_Mod_Monty_WieGehts_A_15_00"); //Hier hast du ein wenig Brot.

	B_GiveInvItems	(hero, self, ItFo_Bread, 1);

	AI_Output(self, hero, "Info_Mod_Monty_WieGehts_A_08_01"); //Danke. Das wird meinen Tod ein paar Tage hinauszögern.

	B_GivePlayerXP	(30);

	Info_ClearChoices	(Info_Mod_Monty_WieGehts);
};

INSTANCE Info_Mod_Monty_Flugblaetter (C_INFO)
{
	npc		= Mod_741_NONE_Monty_NW;
	nr		= 1;
	condition	= Info_Mod_Monty_Flugblaetter_Condition;
	information	= Info_Mod_Monty_Flugblaetter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab hier ein Flugblatt für dich.";
};

FUNC INT Info_Mod_Monty_Flugblaetter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Auftrag_2))
	&& (Npc_HasItems(hero, MatteoFlugblaetter) >= 1)
	&& (Mod_Flugblaetter < 20)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Matteo_Flugblaetter))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Monty_Flugblaetter_Info()
{
	B_Say (hero, self, "$MATTEOPAPER");

	B_GiveInvItems	(hero, self, MatteoFlugblaetter, 1);

	AI_Output(self, hero, "Info_Mod_Monty_Flugblaetter_08_01"); //Oh danke. Mal sehen ...

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Monty_Flugblaetter_08_02"); //Ah ja. Vielleicht werd ich mal bei Matteo vorbeischauen.

	Mod_Flugblaetter += 1;
};

INSTANCE Info_Mod_Monty_Pickpocket (C_INFO)
{
	npc		= Mod_741_NONE_Monty_NW;
	nr		= 1;
	condition	= Info_Mod_Monty_Pickpocket_Condition;
	information	= Info_Mod_Monty_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_40;
};

FUNC INT Info_Mod_Monty_Pickpocket_Condition()
{
	C_Beklauen	(34, ItMi_Gold, 65);
};

FUNC VOID Info_Mod_Monty_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Monty_Pickpocket);

	Info_AddChoice	(Info_Mod_Monty_Pickpocket, DIALOG_BACK, Info_Mod_Monty_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Monty_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Monty_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Monty_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Monty_Pickpocket);
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

INSTANCE Info_Mod_Monty_EXIT (C_INFO)
{
	npc		= Mod_741_NONE_Monty_NW;
	nr		= 1;
	condition	= Info_Mod_Monty_EXIT_Condition;
	information	= Info_Mod_Monty_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Monty_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Monty_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};