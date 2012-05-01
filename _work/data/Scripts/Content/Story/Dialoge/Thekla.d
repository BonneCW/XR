INSTANCE Info_Mod_Thekla_Hi (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_Hi_Condition;
	information	= Info_Mod_Thekla_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thekla_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Thekla_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Thekla_Hi_17_00"); //Hallo Fremder. Wenn du einen Ort suchst an dem du etwas zu Essen bekommst, dann bist du hier richtig.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_ONAR, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_ONAR, "Thekla kann mir etwas zu Essen verkaufen.");
};

INSTANCE Info_Mod_Thekla_Daemonisch (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_Daemonisch_Condition;
	information	= Info_Mod_Thekla_Daemonisch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thekla_Daemonisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Milten_Daemonisch))	
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thekla_Daemonisch_Info()
{
	AI_Output(self, hero, "Info_Mod_Thekla_Daemonisch_17_00"); //(wütend) Was ist, willst du auch noch was zu fressen?
	AI_Output(hero, self, "Info_Mod_Thekla_Daemonisch_15_01"); //Nein, ich wollte nur mal hallo sagen.
	AI_Output(self, hero, "Info_Mod_Thekla_Daemonisch_17_02"); //(wieder ruhiger) Ach, entschuldige meinen Tonfall.
	AI_Output(self, hero, "Info_Mod_Thekla_Daemonisch_17_03"); //Lares schickt paar seiner Söldner in den Wald zum Wölfe jagen und jetzt meinen sie mir deswegen alles leer fressen zu müssen.
	AI_Output(self, hero, "Info_Mod_Thekla_Daemonisch_17_04"); //Wenn es nur etwas gäbe, was ihren unbändigen Appetit endlich stillen könnte.

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Thekla flucht darüber, dass einige Söldner, die Lares zum Wölfejagen in den Wald geschickt hatte, ihr seit dem die Küche leer fressen.");
};

INSTANCE Info_Mod_Thekla_Daemonisch2 (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_Daemonisch2_Condition;
	information	= Info_Mod_Thekla_Daemonisch2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du wolltest doch, dass die Söldner nicht mehr so viel fressen.";
};

FUNC INT Info_Mod_Thekla_Daemonisch2_Condition()
{
	if (Mod_HQ_Daemonisch == 1)
	&& ((Npc_HasItems(hero, ItFo_KWine) >= 1)
	|| (Npc_HasItems(hero, ItPo_HealBesessenheit) >= 1))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thekla_Daemonisch2_Info()
{
	AI_Output(hero, self, "Info_Mod_Thekla_Daemonisch2_15_00"); //Du wolltest doch, dass die Söldner nicht mehr so viel fressen. Ich habe da was für dich ...
	AI_Output(self, hero, "Info_Mod_Thekla_Daemonisch2_17_01"); //Ja, in Innos Namen was?

	Info_ClearChoices	(Info_Mod_Thekla_Daemonisch2);

	if (Npc_HasItems(hero, ItPo_HealBesessenheit) >= 1)
	{
		Info_AddChoice	(Info_Mod_Thekla_Daemonisch2, "Heilung von Besessenheit", Info_Mod_Thekla_Daemonisch2_B);
	};
	if (Npc_HasItems(hero, ItFo_KWine) >= 1)
	{
		Info_AddChoice	(Info_Mod_Thekla_Daemonisch2, "Klosterwein", Info_Mod_Thekla_Daemonisch2_A);
	};
};

FUNC VOID Info_Mod_Thekla_Daemonisch2_C()
{
	AI_Output(hero, self, "Info_Mod_Thekla_Daemonisch2_C_15_00"); //Hier, dieses Wässerchen sollte ihren Appetit wieder in normale Bahnen lenken. Misch es einfach ins Essen.
	AI_Output(self, hero, "Info_Mod_Thekla_Daemonisch2_C_17_01"); //Ja, ich will auch gar nicht wissen was es ist.

	Info_ClearChoices	(Info_Mod_Thekla_Daemonisch2);
};

FUNC VOID Info_Mod_Thekla_Daemonisch2_B()
{
	B_GiveInvItems	(hero, self, ItPo_HealBesessenheit, 1);

	Info_Mod_Thekla_Daemonisch2_C();
};

FUNC VOID Info_Mod_Thekla_Daemonisch2_A()
{
	B_GiveInvItems	(hero, self, ItFo_KWine, 1);

	Info_Mod_Thekla_Daemonisch2_C();
};

INSTANCE Info_Mod_Thekla_Daemonisch3 (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_Daemonisch3_Condition;
	information	= Info_Mod_Thekla_Daemonisch3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thekla_Daemonisch3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_SoeldnerBeiThekla_Daemonisch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thekla_Daemonisch3_Info()
{
	AI_Output(self, hero, "Info_Mod_Thekla_Daemonisch3_17_00"); //Es hat geklappt. Hier, nimm etwas von meinem Eintopf zum Dank.

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "So, Onar's Hof wäre erledigt.");

	B_GivePlayerXP	(250);
};

INSTANCE Info_Mod_Thekla_Dung (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_Dung_Condition;
	information	= Info_Mod_Thekla_Dung_Info;
	permanent	= 0;
	important	= 0;
	description	= "(Thekla weglocken versuchen)";
};

FUNC INT Info_Mod_Thekla_Dung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thekla_Hi))
	&& (Npc_HasItems(hero, ItMi_Scavengerdung) == 1)	
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thekla_Dung_Info()
{
	Info_ClearChoices	(Info_Mod_Thekla_Dung);

	Info_AddChoice	(Info_Mod_Thekla_Dung, "Ich möchte den Söldnern nur einen kleinen Streich spielen.", Info_Mod_Thekla_Dung_04);
	Info_AddChoice	(Info_Mod_Thekla_Dung, "Habe ich da nicht gerade jemanden in der Vorratskammer gesehen?", Info_Mod_Thekla_Dung_03);
	Info_AddChoice	(Info_Mod_Thekla_Dung, "Einer der Knechte hat gerade einen Teller mitgehen lassen.", Info_Mod_Thekla_Dung_02);
	Info_AddChoice	(Info_Mod_Thekla_Dung, "Onar möchte was von dir.", Info_Mod_Thekla_Dung_01);
};

FUNC VOID Info_Mod_Thekla_Dung_01()
{
	AI_Output(hero, self, "Info_Mod_Thekla_Dung_01_15_00"); //Onar möchte was von dir. Er erwartet dich im Gutshaus.
	AI_Output(self, hero, "Info_Mod_Thekla_Dung_01_17_01"); //Der fette Kerl soll ruhig herkommen, wenn er was will. Der wird langsam genauso faul wie diese verkommenen Söldner.

	Info_ClearChoices	(Info_Mod_Thekla_Dung);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Thekla_Dung_02()
{
	AI_Output(hero, self, "Info_Mod_Thekla_Dung_02_15_00"); //Einer der Knechte hat gerade einen Teller mitgehen lassen. Er ist gerade rausgegangen.
	AI_Output(self, hero, "Info_Mod_Thekla_Dung_02_17_01"); //Welche Teller? Ich habe doch überhaupt keine Teller verteilt. Willst du mich veralbern?

	Info_ClearChoices	(Info_Mod_Thekla_Dung);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Thekla_Dung_03()
{
	AI_Output(hero, self, "Info_Mod_Thekla_Dung_03_15_00"); //Habe ich da nicht gerade jemanden in der Vorratskammer gesehen?
	AI_Output(self, hero, "Info_Mod_Thekla_Dung_03_17_01"); //Was? Die Strolche! Na wartet ...

	Info_ClearChoices	(Info_Mod_Thekla_Dung);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "VORRATSKAMMER");

	Mod_Suppenwuerze_Thekla = 1;
};

FUNC VOID Info_Mod_Thekla_Dung_04()
{
	AI_Output(hero, self, "Info_Mod_Thekla_Dung_04_15_00"); //Ich möchte den Söldnern nur einen kleinen Streich spielen. Schau mal bitte kurz weg.
	AI_Output(self, hero, "Info_Mod_Thekla_Dung_04_17_01"); //Lieber nicht, Jungchen. Die Kerle verstehen bei sowas absolut keinen Spaß.

	Info_ClearChoices	(Info_Mod_Thekla_Dung);

	AI_StopProcessInfos	(self);

	Mod_Suppenwuerze_Thekla = 2;
};

INSTANCE Info_Mod_Thekla_Dung2 (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_Dung2_Condition;
	information	= Info_Mod_Thekla_Dung2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thekla_Dung2_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Herd_Scavengerdung))
	&& (Mod_Suppenwuerze_Thekla == 1)	
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thekla_Dung2_Info()
{
	AI_Output(self, hero, "Info_Mod_Thekla_Dung2_17_00"); //Du hast mich angelogen! Tu das nie wieder.
	AI_Output(self, hero, "Info_Mod_Thekla_Dung2_17_01"); //Wenn es um meine Vorräte geht, versteh ich keine Spaß.
};

INSTANCE Info_Mod_Thekla_Dung3 (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_Dung3_Condition;
	information	= Info_Mod_Thekla_Dung3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thekla_Dung3_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Herd_Scavengerdung))
	&& (Mod_Suppenwuerze_Thekla == 2)
	&& (Mod_Scavengerdung_Tag > Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thekla_Dung3_Info()
{
	AI_Output(self, hero, "Info_Mod_Thekla_Dung3_17_00"); //Sag mal, hast du was mit den Bauchschmerzen der Söldner zu tun?
	AI_Output(hero, self, "Info_Mod_Thekla_Dung3_15_01"); //Wie kommst du darauf?
	AI_Output(self, hero, "Info_Mod_Thekla_Dung3_17_02"); //Du hast, bevor sie angefangen haben zu jammern, doch von einem Streich gesprochen, den du ihnen spielen wolltest.
	AI_Output(hero, self, "Info_Mod_Thekla_Dung3_15_03"); //Ähm ...
	AI_Output(self, hero, "Info_Mod_Thekla_Dung3_17_04"); //Mir ist egal, was mit den Söldnern ist, aber lass die Finger von meinem Herd, merk dir das!
};

INSTANCE Info_Mod_Thekla_Wasili_01 (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_Wasili_01_Condition;
	information	= Info_Mod_Thekla_Wasili_01_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thekla_Wasili_01_Condition()
{
	if (Mod_WM_WasiliQuest == 3)	
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thekla_Wasili_01_Info()
{
	AI_Output(self, hero, "Info_Mod_Thekla_Wasili_01_17_00"); //Ach, dieser arme Wasili. Er wurde von Onar vom Hof verbannt, weil er auf Marias Weisung einem Fremden Geld gegeben hat.
	AI_Output(self, hero, "Info_Mod_Thekla_Wasili_01_17_01"); //Jetzt sitzt er in der Höhle und trinkt den ganzen Tag. Und Maria macht keinen Finger krumm, um Wasili da wieder raus zu helfen.
	AI_Output(self, hero, "Info_Mod_Thekla_Wasili_01_17_02"); //Du bist doch ziemlich viel unterwegs. Könntest du ihm nicht etwas zu Essen von mir bringen?

	Info_ClearChoices	(Info_Mod_Thekla_Wasili_01);

	Info_AddChoice	(Info_Mod_Thekla_Wasili_01, "Nein, dafür habe ich keine Zeit.", Info_Mod_Thekla_Wasili_01_B);
	Info_AddChoice	(Info_Mod_Thekla_Wasili_01, "Klar, ich helfe gern.", Info_Mod_Thekla_Wasili_01_A);
};

FUNC VOID Info_Mod_Thekla_Wasili_01_B()
{
	AI_Output(hero, self, "Info_Mod_Thekla_Wasili_01_B_15_00"); //Nein, dafür habe ich keine Zeit.
	AI_Output(self, hero, "Info_Mod_Thekla_Wasili_01_B_17_01"); //Schade. Dann muss ich später selbst gehen.

	Info_ClearChoices	(Info_Mod_Thekla_Wasili_01);
};

FUNC VOID Info_Mod_Thekla_Wasili_01_A()
{
	AI_Output(hero, self, "Info_Mod_Thekla_Wasili_01_A_15_00"); //Klar, ich helfe gern.
	AI_Output(self, hero, "Info_Mod_Thekla_Wasili_01_A_17_01"); //Vielen Dank, dafür kriegst du auch später etwas von meinem Eintopf, den ich gerade zubereite.

	B_GiveInvItems	(self, hero, ItMi_EsspaketWasili, 1);

	B_LogEntry	(TOPIC_MOD_ADANOS_WASILI, "Thekla bat mich darum Wasili etwas zu Essen zu bringen.");

	Info_ClearChoices	(Info_Mod_Thekla_Wasili_01);
};

INSTANCE Info_Mod_Thekla_Wasili_02 (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_Wasili_02_Condition;
	information	= Info_Mod_Thekla_Wasili_02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe Wasili sein Essen gebracht.";
};

FUNC INT Info_Mod_Thekla_Wasili_02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wasili_Verbannt_02))	
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thekla_Wasili_02_Info()
{
	AI_Output(hero, self, "Info_Mod_Thekla_Wasili_02_15_00"); //Ich habe Wasili sein Essen gebracht.
	AI_Output(self, hero, "Info_Mod_Thekla_Wasili_02_17_01"); //Dankeschön. Hier ist der versprochene Eintopf, mit dem ich gerade fertig geworden bin. Lass es dir schmecken.

	B_GiveInvItems	(self, hero, ItFo_XPStew, 1);

	B_LogEntry	(TOPIC_MOD_ADANOS_WASILI, "Ich habe Wasili sein Essen gebracht und den Eintopf bekommen.");
};

INSTANCE Info_Mod_Thekla_Zauberwasser (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_Zauberwasser_Condition;
	information	= Info_Mod_Thekla_Zauberwasser_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab hier eine Lieferung Zauberwasser.";
};

FUNC INT Info_Mod_Thekla_Zauberwasser_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thekla_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Constantino_Zauberwasser))
	&& (Npc_HasItems(hero, ItMi_Zauberwasser_MIS) > 7)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thekla_Zauberwasser_Info()
{
	AI_Output(hero, self, "Info_Mod_Thekla_Zauberwasser_15_00"); //Ich hab hier eine Lieferung Zauberwasser.

	B_GiveInvItems	(hero, self, ItMi_Zauberwasser_MIS, 8);

	AI_Output(self, hero, "Info_Mod_Thekla_Zauberwasser_17_01"); //Wird auch langsam Zeit.
};

INSTANCE Info_Mod_Thekla_Trade (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_Trade_Condition;
	information	= Info_Mod_Thekla_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Thekla_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thekla_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thekla_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv	(self);
	B_Say	(hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Thekla_Pickpocket (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_Pickpocket_Condition;
	information	= Info_Mod_Thekla_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60_Female;
};

FUNC INT Info_Mod_Thekla_Pickpocket_Condition()
{
	C_Beklauen	(52, ItMi_Gold, 150);
};

FUNC VOID Info_Mod_Thekla_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Thekla_Pickpocket);

	Info_AddChoice	(Info_Mod_Thekla_Pickpocket, DIALOG_BACK, Info_Mod_Thekla_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Thekla_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Thekla_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Thekla_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Thekla_Pickpocket);
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

INSTANCE Info_Mod_Thekla_EXIT (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_EXIT_Condition;
	information	= Info_Mod_Thekla_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Thekla_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Thekla_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};