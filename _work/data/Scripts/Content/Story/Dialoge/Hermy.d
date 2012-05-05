INSTANCE Info_Mod_Hermy_Hi (C_INFO)
{
	npc		= Mod_4020_VMG_Hermy_MT;
	nr		= 1;
	condition	= Info_Mod_Hermy_Hi_Condition;
	information	= Info_Mod_Hermy_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hi. Ich bin neu hier.";
};

FUNC INT Info_Mod_Hermy_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hermy_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Hermy_Hi_15_00"); //Hi. Ich bin neu hier.
	AI_Output(self, hero, "Info_Mod_Hermy_Hi_05_01"); //Sei mir gegrüßt. Endlich bin ich hier nicht mehr der Neue. (lacht)
	AI_Output(self, hero, "Info_Mod_Hermy_Hi_05_02"); //Mein Name ist Hermann, aber alle hier nennen mit Hermy.
	AI_Output(hero, self, "Info_Mod_Hermy_Hi_15_03"); //Was machst du hier?
	AI_Output(self, hero, "Info_Mod_Hermy_Hi_05_04"); //Ich handle mit Verwandlungsspruchrollen. Ich kann dir ein paar einfache Rollen anbieten, aber die wertvollen Sprüche verkaufe ich nur an Mitglieder.
	AI_Output(hero, self, "Info_Mod_Hermy_Hi_15_05"); //Ich komm darauf zurück.
	AI_Output(self, hero, "Info_Mod_Hermy_Hi_05_06"); //Bei mir bist du immer wollkommen.
};

INSTANCE Info_Mod_Hermy_QuestHermy (C_INFO)
{
	npc		= Mod_4020_VMG_Hermy_MT;
	nr		= 1;
	condition	= Info_Mod_Hermy_QuestHermy_Condition;
	information	= Info_Mod_Hermy_QuestHermy_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hermy_QuestHermy_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Faice_QuestHermy))
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hermy_QuestHermy_Info()
{
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_05_00"); //Du musst der Neue sein. Ich bin Hermann, aber nenn' mich doch bitte Hermy.
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_05_01"); //Faice schickt dich, hab' ich Recht?

	Info_ClearChoices	(Info_Mod_Hermy_QuestHermy);

	Info_AddChoice	(Info_Mod_Hermy_QuestHermy, "Du bist aber ein ganz Schlauer.", Info_Mod_Hermy_QuestHermy_B);
	Info_AddChoice	(Info_Mod_Hermy_QuestHermy, "So ist es.", Info_Mod_Hermy_QuestHermy_A);
};

FUNC VOID Info_Mod_Hermy_QuestHermy_B()
{
	AI_Output(hero, self, "Info_Mod_Hermy_QuestHermy_B_15_00"); //Du bist aber ein ganz Schlauer.
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_B_05_01"); //Hey, ich merke es, wenn man mich verarschen will.

	Info_ClearChoices	(Info_Mod_Hermy_QuestHermy);

	Info_AddChoice	(Info_Mod_Hermy_QuestHermy, "Und was sagt dir dein Gefühl?", Info_Mod_Hermy_QuestHermy_D);
	Info_AddChoice	(Info_Mod_Hermy_QuestHermy, "Ich wollte dich ja nicht verarschen.", Info_Mod_Hermy_QuestHermy_C);
};

FUNC VOID Info_Mod_Hermy_QuestHermy_E()
{
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_E_05_00"); //Also es ist so, dass es einer Studie zufolge unter der Alten Bibliothek, dort wo sich diese stinkenden Orks niedergelassen haben, einen Stollen geben soll.
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_E_05_01"); //Dort sollen noch ein paar Spruchrollen "Verwandlung Harpie" zu finden sein.

	Info_ClearChoices	(Info_Mod_Hermy_QuestHermy);

	Info_AddChoice	(Info_Mod_Hermy_QuestHermy, "Was habe ich mit dem Ganzen zu tun?", Info_Mod_Hermy_QuestHermy_G);
	Info_AddChoice	(Info_Mod_Hermy_QuestHermy, "Und ich soll sie holen, habe ich Recht?", Info_Mod_Hermy_QuestHermy_F);
};

FUNC VOID Info_Mod_Hermy_QuestHermy_A()
{
	AI_Output(hero, self, "Info_Mod_Hermy_QuestHermy_A_15_00"); //So ist es.

	Info_Mod_Hermy_QuestHermy_E();
};

FUNC VOID Info_Mod_Hermy_QuestHermy_D()
{
	AI_Output(hero, self, "Info_Mod_Hermy_QuestHermy_D_15_00"); //Und was sagt dir dein Gefühl?
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_D_05_01"); //Du wolltest mich nicht verarschen.
	AI_Output(hero, self, "Info_Mod_Hermy_QuestHermy_D_15_02"); //Richtig. Was gibt es denn jetzt so wichtiges?

	Info_Mod_Hermy_QuestHermy_E();
};

FUNC VOID Info_Mod_Hermy_QuestHermy_C()
{
	AI_Output(hero, self, "Info_Mod_Hermy_QuestHermy_C_15_00"); //Ich wollte dich ja nicht verarschen.
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_C_05_01"); //Das habe ich gemerkt.

	Info_Mod_Hermy_QuestHermy_E();
};

FUNC VOID Info_Mod_Hermy_QuestHermy_H()
{
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_H_05_00"); //Es wäre unheimlich nett, wenn du dich für uns dorthin begibst.
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_H_05_01"); //Außerdem bringt es dich bei deiner Aufnahme voran.

	Info_ClearChoices	(Info_Mod_Hermy_QuestHermy);

	Info_AddChoice	(Info_Mod_Hermy_QuestHermy, "Ich bin aber nicht interessiert.", Info_Mod_Hermy_QuestHermy_J);
	Info_AddChoice	(Info_Mod_Hermy_QuestHermy, "Okay, ich mach's.", Info_Mod_Hermy_QuestHermy_I);
};

FUNC VOID Info_Mod_Hermy_QuestHermy_G()
{
	AI_Output(hero, self, "Info_Mod_Hermy_QuestHermy_G_15_00"); //Was habe ich mit dem Ganzen zu tun?

	Info_Mod_Hermy_QuestHermy_H();
};

FUNC VOID Info_Mod_Hermy_QuestHermy_F()
{
	AI_Output(hero, self, "Info_Mod_Hermy_QuestHermy_F_15_00"); //Und ich soll sie holen, habe ich Recht?
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_F_05_01"); //Richtig. Wir sind zur Zeit leider sehr beschäftigt.

	Info_Mod_Hermy_QuestHermy_H();
};

FUNC VOID Info_Mod_Hermy_QuestHermy_J()
{
	AI_Output(hero, self, "Info_Mod_Hermy_QuestHermy_J_15_00"); //Ich bin aber nicht interessiert.
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_J_05_01"); //Das ist sehr schade. Aber du kannst jederzeit wiederkommen, falls du dich anders entscheidest.

	Info_ClearChoices	(Info_Mod_Hermy_QuestHermy);
};

FUNC VOID Info_Mod_Hermy_QuestHermy_I()
{
	AI_Output(hero, self, "Info_Mod_Hermy_QuestHermy_I_15_00"); //Okay, ich mach's.
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_I_05_01"); //Sehr gut. Begib dich zur Alten Bibliothek und sprich dort mit diesen stinkenden Kreaturen.
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_I_05_02"); //Sie können dir hoffentlich mehr sagen als unsere alten Schriftrollen.

	B_LogEntry	(TOPIC_MOD_FAICE_HARPIE, "Ich habe den Auftrag, zur Felsenfestung zu gehen und dort die Orks nach einem möglichen Stollen zu befragen, da sich dort der Verwandlungszauber zur Harpie befinden soll.");

	Mod_Hermy_KnowsQuest = 1;

	Wld_SendTrigger	("EVT_OW_MOUNTAINRUIN_01");

	Info_ClearChoices	(Info_Mod_Hermy_QuestHermy);
};

INSTANCE Info_Mod_Hermy_QuestHermyDoch (C_INFO)
{
	npc		= Mod_4020_VMG_Hermy_MT;
	nr		= 1;
	condition	= Info_Mod_Hermy_QuestHermyDoch_Condition;
	information	= Info_Mod_Hermy_QuestHermyDoch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich werde doch zu den Orks gehen.";
};

FUNC INT Info_Mod_Hermy_QuestHermyDoch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hermy_QuestHermy))
	&& (Mod_Hermy_KnowsQuest == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hermy_QuestHermyDoch_Info()
{
	AI_Output(hero, self, "Info_Mod_Hermy_QuestHermyDoch_15_00"); //Ich werde doch zu den Orks gehen.
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermyDoch_05_01"); //Prima. Dann geh zur Bergfestung und Rede dort mit den Orks.

	B_LogEntry	(TOPIC_MOD_FAICE_HARPIE, "Ich habe den Auftrag, zur Felsenfestung zu gehen und dort die Orks nach einem möglichen Stollen zu befragen, da sich dort der Verwandlungszauber zur Harpie befinden soll.");

	Mod_Hermy_KnowsQuest = 1;

	Wld_SendTrigger	("EVT_OW_MOUNTAINRUIN_01");
};

INSTANCE Info_Mod_Hermy_Harpie (C_INFO)
{
	npc		= Mod_4020_VMG_Hermy_MT;
	nr		= 1;
	condition	= Info_Mod_Hermy_Harpie_Condition;
	information	= Info_Mod_Hermy_Harpie_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hermy_Harpie_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Grubuz_Emerin))
	&& (Mod_Hermy_KnowsQuest == 9)
	&& (Npc_HasItems(hero, ItSc_TrfHarpie) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hermy_Harpie_Info()
{
	AI_Output(self, hero, "Info_Mod_Hermy_Harpie_05_00"); //Und? Wie sieht's aus? Hast du den Zauber?
	AI_Output(hero, self, "Info_Mod_Hermy_Harpie_15_01"); //Selbstverständlich.
	AI_Output(self, hero, "Info_Mod_Hermy_Harpie_05_02"); //Kann ich ihn sehen? Ich werde ihn anschließend zu Faice bringen.

	Info_ClearChoices	(Info_Mod_Hermy_Harpie);

	Info_AddChoice	(Info_Mod_Hermy_Harpie, "Hier hast du ihn.", Info_Mod_Hermy_Harpie_B);
	Info_AddChoice	(Info_Mod_Hermy_Harpie, "Und den ganzen Ruhm einheimsen? Nein danke, ich gehe selbst.", Info_Mod_Hermy_Harpie_A);
};

FUNC VOID Info_Mod_Hermy_Harpie_B()
{
	AI_Output(hero, self, "Info_Mod_Hermy_Harpie_B_15_00"); //Hier hast du ihn.

	B_GiveInvItems	(hero, self, ItSc_TrfHarpie, 1);

	AI_Output(self, hero, "Info_Mod_Hermy_Harpie_B_05_01"); //Danke, du kannst gehen.

	Info_ClearChoices	(Info_Mod_Hermy_Harpie);

	Info_AddChoice	(Info_Mod_Hermy_Harpie, "Okay, wir sehen uns.", Info_Mod_Hermy_Harpie_D);
	Info_AddChoice	(Info_Mod_Hermy_Harpie, "Das war ein ganz schön hartes Abenteuer ...", Info_Mod_Hermy_Harpie_E);
};

FUNC VOID Info_Mod_Hermy_Harpie_E()
{
	AI_Output(hero, self, "Info_Mod_Hermy_Harpie_E_15_00"); //Das war ein ganz schön hartes Abenteuer ...
	AI_Output(self, hero, "Info_Mod_Hermy_Harpie_E_05_01"); //Hier hast du 500 Goldmünzen. Mehr gibt es nicht.

	B_GiveInvItems	(self, hero, ItMi_Gold, 500);

	AI_Output(hero, self, "Info_Mod_Hermy_Harpie_E_15_02"); //Vielen Dank.
	AI_Output(self, hero, "Info_Mod_Hermy_Harpie_E_05_03"); //Pass auf dich auf.

	Info_ClearChoices	(Info_Mod_Hermy_Harpie);

	B_SetTopicStatus	(TOPIC_MOD_FAICE_HARPIE, LOG_SUCCESS);

	B_GivePlayerXP	(750);

	Mod_Hermy_KnowsQuest = 10;
};

FUNC VOID Info_Mod_Hermy_Harpie_A()
{
	AI_Output(hero, self, "Info_Mod_Hermy_Harpie_A_15_00"); //Und den ganzen Ruhm einheimsen? Nein danke, ich gehe selbst.
	AI_Output(self, hero, "Info_Mod_Hermy_Harpie_A_05_01"); //Es geht hier nicht um Ruhm. Jetzt sei vernünftig und gib mir die Spruchrolle.

	Info_ClearChoices	(Info_Mod_Hermy_Harpie);

	Info_AddChoice	(Info_Mod_Hermy_Harpie, "Hier hast du ihn.", Info_Mod_Hermy_Harpie_B);
	Info_AddChoice	(Info_Mod_Hermy_Harpie, "Ich denke gar nicht daran.", Info_Mod_Hermy_Harpie_C);
};

FUNC VOID Info_Mod_Hermy_Harpie_D()
{
	AI_Output(hero, self, "Info_Mod_Hermy_Harpie_D_15_00"); //Okay, wir sehen uns.
	AI_Output(self, hero, "Info_Mod_Hermy_Harpie_D_05_01"); //Pass auf dich auf.

	Info_ClearChoices	(Info_Mod_Hermy_Harpie);

	B_SetTopicStatus	(TOPIC_MOD_FAICE_HARPIE, LOG_SUCCESS);

	B_GivePlayerXP	(750);

	Mod_Hermy_KnowsQuest = 10;
};

FUNC VOID Info_Mod_Hermy_Harpie_C()
{
	AI_Output(hero, self, "Info_Mod_Hermy_Harpie_C_15_00"); //Ich denke gar nicht daran.
	AI_Output(self, hero, "Info_Mod_Hermy_Harpie_C_05_01"); //Sei doch vernünftig. Willst du Gold?
	AI_Output(hero, self, "Info_Mod_Hermy_Harpie_C_15_02"); //Besser als nichts.
	AI_Output(self, hero, "Info_Mod_Hermy_Harpie_C_05_03"); //Hier hast du 500 Goldmünzen. Mehr gibt es nicht.

	B_GiveInvItems	(self, hero, ItMi_Gold, 500);

	AI_Output(self, hero, "Info_Mod_Hermy_Harpie_C_05_04"); //Bekomme ich jetzt den Zauber?
	AI_Output(hero, self, "Info_Mod_Hermy_Harpie_C_15_05"); //Hier hast du ihn.

	B_GiveInvItems	(hero, self, ItSc_TrfHarpie, 1);

	AI_Output(self, hero, "Info_Mod_Hermy_Harpie_C_05_06"); //Danke. Du kannst gehen.

	Info_ClearChoices	(Info_Mod_Hermy_Harpie);

	B_SetTopicStatus	(TOPIC_MOD_FAICE_HARPIE, LOG_SUCCESS);

	B_GivePlayerXP	(750);

	Mod_Hermy_KnowsQuest = 10;
};

INSTANCE Info_Mod_Hermy_Faice01 (C_INFO)
{
	npc		= Mod_4020_VMG_Hermy_MT;
	nr		= 1;
	condition	= Info_Mod_Hermy_Faice01_Condition;
	information	= Info_Mod_Hermy_Faice01_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du in letzter Zeit irgendetwas Verdächtiges beobachtet?";
};

FUNC INT Info_Mod_Hermy_Faice01_Condition()
{
	if (!Npc_KnowsInfo(hero, Info_Mod_Furt_Faice02))
	&& (Mod_VMG_FaiceGifty_Gift == 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hermy_Faice01_Info()
{
	AI_Output(hero, self, "Info_Mod_Hermy_Faice01_15_00"); //Hast du in letzter Zeit irgendetwas Verdächtiges beobachtet?
	AI_Output(self, hero, "Info_Mod_Hermy_Faice01_05_01"); //Hm, jetzt, da du es sagst. Furt benimmt sich in letzter Zeit etwas komisch.
};

INSTANCE Info_Mod_Hermy_Faice02 (C_INFO)
{
	npc		= Mod_4020_VMG_Hermy_MT;
	nr		= 1;
	condition	= Info_Mod_Hermy_Faice02_Condition;
	information	= Info_Mod_Hermy_Faice02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Weißt du etwas über die Vergiftung der Spruchrolle von Faice?";
};

FUNC INT Info_Mod_Hermy_Faice02_Condition()
{
	if (!Npc_KnowsInfo(hero, Info_Mod_Furt_Faice02))
	&& (Mod_VMG_FaiceGifty_Gift == 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hermy_Faice02_Info()
{
	AI_Output(hero, self, "Info_Mod_Hermy_Faice02_15_00"); //Weißt du etwas über die Vergiftung der Spruchrolle von Faice?
	AI_Output(self, hero, "Info_Mod_Hermy_Faice02_05_01"); //Nicht mehr als du, schätze ich.
};

INSTANCE Info_Mod_Hermy_Faice03 (C_INFO)
{
	npc		= Mod_4020_VMG_Hermy_MT;
	nr		= 1;
	condition	= Info_Mod_Hermy_Faice03_Condition;
	information	= Info_Mod_Hermy_Faice03_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ist dir an irgendjemandem etwas aufgefallen?";
};

FUNC INT Info_Mod_Hermy_Faice03_Condition()
{
	if (!Npc_KnowsInfo(hero, Info_Mod_Furt_Faice02))
	&& (Mod_VMG_FaiceGifty_Gift == 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hermy_Faice03_Info()
{
	AI_Output(hero, self, "Info_Mod_Hermy_Faice03_15_00"); //Ist dir an irgendjemandem etwas aufgefallen?
	AI_Output(self, hero, "Info_Mod_Hermy_Faice03_05_01"); //Sprich mal mit Furt. Er könnte vielleicht mehr wissen.
};

INSTANCE Info_Mod_Hermy_Trade (C_INFO)
{
	npc		= Mod_4020_VMG_Hermy_MT;
	nr		= 1;
	condition	= Info_Mod_Hermy_Trade_Condition;
	information	= Info_Mod_Hermy_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Hermy_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hermy_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hermy_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Hermy_Pickpocket (C_INFO)
{
	npc		= Mod_4020_VMG_Hermy_MT;
	nr		= 1;
	condition	= Info_Mod_Hermy_Pickpocket_Condition;
	information	= Info_Mod_Hermy_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Hermy_Pickpocket_Condition()
{
	C_Beklauen	(87, ItSc_TrfHarpie, 1);
};

FUNC VOID Info_Mod_Hermy_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Hermy_Pickpocket);

	Info_AddChoice	(Info_Mod_Hermy_Pickpocket, DIALOG_BACK, Info_Mod_Hermy_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Hermy_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Hermy_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Hermy_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Hermy_Pickpocket);
};

FUNC VOID Info_Mod_Hermy_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Hermy_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Hermy_Pickpocket);

		Info_AddChoice	(Info_Mod_Hermy_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Hermy_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Hermy_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Hermy_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Hermy_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Hermy_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Hermy_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Hermy_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Hermy_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Hermy_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Hermy_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Hermy_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Hermy_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Hermy_EXIT (C_INFO)
{
	npc		= Mod_4020_VMG_Hermy_MT;
	nr		= 1;
	condition	= Info_Mod_Hermy_EXIT_Condition;
	information	= Info_Mod_Hermy_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Hermy_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hermy_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};