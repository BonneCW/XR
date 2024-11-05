INSTANCE Info_Mod_Onar_Hi (C_INFO)
{
	npc		= Mod_791_BAU_Onar_NW;
	nr		= 1;
	condition	= Info_Mod_Onar_Hi_Condition;
	information	= Info_Mod_Onar_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Onar_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Onar_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Onar_Hi_32_00"); //Was hast du hier verloren?
};

INSTANCE Info_Mod_Onar_Ahnenkunde (C_INFO)
{
	npc		= Mod_791_BAU_Onar_NW;
	nr		= 1;
	condition	= Info_Mod_Onar_Ahnenkunde_Condition;
	information	= Info_Mod_Onar_Ahnenkunde_Info;
	permanent	= 0;
	important	= 0;
	description	= "Weißt du etwas von einem Teil eines Ornamentringes?";
};

FUNC INT Info_Mod_Onar_Ahnenkunde_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Nefarius_VierErbauer))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Onar_Ahnenkunde_Info()
{
	AI_Output(hero, self, "Info_Mod_Onar_Ahnenkunde_15_00"); //Weißt du etwas von einem Teil eines Ornamentringes?
	AI_Output(self, hero, "Info_Mod_Onar_Ahnenkunde_32_01"); //Warum sollte ich dir irgendwas verraten?
	AI_Output(hero, self, "Info_Mod_Onar_Ahnenkunde_15_02"); //Ich weiß, dass dein Urahn Onar, der wohl diesen Hof hier gegründet hat, es bei sich hatte.
	AI_Output(self, hero, "Info_Mod_Onar_Ahnenkunde_32_03"); //Du weißt von meinem Urahn? Na gut, ich habe dieses Stück Stein, aber ich werde dir sicher nicht sagen, wo es ist.

	B_LogEntry	(TOPIC_MOD_PORTAL, "Onar hat gesagt, er hätte das Ornamentstück, wollte mir aber nicht verraten, wo es ist. Ich muss wohl sein Haus auf den Kopf stellen. Hoffentlich erwischt mich niemand dabei.");
};

INSTANCE Info_Mod_Onar_BelohnungMaria (C_INFO)
{
	npc		= Mod_791_BAU_Onar_NW;
	nr		= 1;
	condition	= Info_Mod_Onar_BelohnungMaria_Condition;
	information	= Info_Mod_Onar_BelohnungMaria_Info;
	permanent	= 0;
	important	= 0;
	description	= "Maria meinte, ich würde bei dir eine Belohnung von 400 Goldmünzen erhalten.";
};

FUNC INT Info_Mod_Onar_BelohnungMaria_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Onar_Hi))
	&& (Mod_WM_MariaGeheilt == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Onar_BelohnungMaria_Info()
{
	AI_Output(hero, self, "Info_Mod_Onar_BelohnungMaria_15_00"); //Maria meinte, ich würde bei dir eine Belohnung von 400 Goldmünzen erhalten, nachdem ich ihr Heilung von ihrem Leiden verschafft habe.
	AI_Output(self, hero, "Info_Mod_Onar_BelohnungMaria_32_01"); //Was?! 400 Gold?! Soll ich vor die Hunde gehen?! Du kriegst 200 von mir und keine Münze mehr.

	B_GiveInvItems	(self, hero, ItMi_Gold, 200);
};

INSTANCE Info_Mod_Onar_Wasili_01 (C_INFO)
{
	npc		= Mod_791_BAU_Onar_NW;
	nr		= 1;
	condition	= Info_Mod_Onar_Wasili_01_Condition;
	information	= Info_Mod_Onar_Wasili_01_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich möchte, dass Wasili wieder auf den Hof zurück kann.";
};

FUNC INT Info_Mod_Onar_Wasili_01_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Onar_Hi))
	&& (Mod_WM_WasiliQuest == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Onar_Wasili_01_Info()
{
	AI_Output(hero, self, "Info_Mod_Onar_Wasili_01_15_00"); //Ich möchte, dass Wasili wieder auf den Hof zurück kann.
	AI_Output(self, hero, "Info_Mod_Onar_Wasili_01_32_01"); //(gereizt) Was?! Was willst du überhaupt?! Nenne mir einen Grund, warum ich meine Zustimmung dazu geben sollte.

	Info_ClearChoices	(Info_Mod_Onar_Wasili_01);

	if (Npc_KnowsInfo(hero, Info_Mod_Maria_BelohnungWasili))
	{
		Info_AddChoice	(Info_Mod_Onar_Wasili_01, "Weil ich sonst Maria von der Sache mit den Mägden erzähle.", Info_Mod_Onar_Wasili_01_D);
	};

	Info_AddChoice	(Info_Mod_Onar_Wasili_01, "Weil ich dir sonst die Zähne einschlage.", Info_Mod_Onar_Wasili_01_C);

	if (Npc_HasItems(hero, ItMi_Gold) >= 400)
	{
		Info_AddChoice	(Info_Mod_Onar_Wasili_01, "Weil ich dir 400 Goldmünzen gebe.", Info_Mod_Onar_Wasili_01_B);
	};

	Info_AddChoice	(Info_Mod_Onar_Wasili_01, "Einfach so aus Freundlichkeit.", Info_Mod_Onar_Wasili_01_A);
};

FUNC VOID Info_Mod_Onar_Wasili_01_D()
{
	AI_Output(hero, self, "Info_Mod_Onar_Wasili_01_D_15_00"); //Weil ich sonst Maria von der Sache mit den Mägden erzähle.
	AI_Output(self, hero, "Info_Mod_Onar_Wasili_01_D_32_01"); //Was?! Du verdammter Mistkerl, woher weißt du davon. Das zahl ich dir irgendwann heim.
	AI_Output(hero, self, "Info_Mod_Onar_Wasili_01_D_15_02"); //Also, was ist jetzt?
	AI_Output(self, hero, "Info_Mod_Onar_Wasili_01_D_32_03"); //(wütend) Ja, du lässt mir keine andere Wahl. Der Lump darf zurück auf den Hof.

	B_StartOtherRoutine	(Mod_100_BAU_Wasili_NW, "START");

	Mod_WM_WasiliQuest = 4;

	B_GivePlayerXP	(200);

	B_SetTopicStatus	(TOPIC_MOD_ADANOS_WASILI, LOG_SUCCESS);

	Info_ClearChoices	(Info_Mod_Onar_Wasili_01);
};

FUNC VOID Info_Mod_Onar_Wasili_01_C()
{
	AI_Output(hero, self, "Info_Mod_Onar_Wasili_01_C_15_00"); //Weil ich dir sonst die Zähne einschlage.
	AI_Output(self, hero, "Info_Mod_Onar_Wasili_01_C_32_01"); //Was?! Wachen ...!!!

	Mod_WM_WasiliQuest = 5;

	Info_ClearChoices	(Info_Mod_Onar_Wasili_01);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_None, 0);
};

FUNC VOID Info_Mod_Onar_Wasili_01_B()
{
	AI_Output(hero, self, "Info_Mod_Onar_Wasili_01_B_15_00"); //Weil ich dir 400 Goldmünzen gebe.
	AI_Output(self, hero, "Info_Mod_Onar_Wasili_01_B_32_01"); //(etwas beruhigter) Das ist in der Tat ein Grund. In Ordnung, der Lump kann zurück auf den Hof kommen.

	B_GiveInvItems	(hero, self, ItMi_Gold, 400);

	B_StartOtherRoutine	(Mod_100_BAU_Wasili_NW, "START");

	Mod_WM_WasiliQuest = 4;

	B_GivePlayerXP	(200);

	B_SetTopicStatus	(TOPIC_MOD_ADANOS_WASILI, LOG_SUCCESS);

	Info_ClearChoices	(Info_Mod_Onar_Wasili_01);
};

FUNC VOID Info_Mod_Onar_Wasili_01_A()
{
	AI_Output(hero, self, "Info_Mod_Onar_Wasili_01_A_15_00"); //Einfach so aus Freundlichkeit.
	AI_Output(self, hero, "Info_Mod_Onar_Wasili_01_A_32_01"); //(äußerst gereizt) Freundlichkeit?! Umsonst ist nur der Tod. Und jetzt mach, dass du wegkommst.

	Info_ClearChoices	(Info_Mod_Onar_Wasili_01);
};

INSTANCE Info_Mod_Onar_Umgehauen (C_INFO)
{
	npc		= Mod_791_BAU_Onar_NW;
	nr		= 1;
	condition	= Info_Mod_Onar_Umgehauen_Condition;
	information	= Info_Mod_Onar_Umgehauen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Onar_Umgehauen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Onar_Wasili_01))
	&& (Mod_WM_WasiliQuest == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Onar_Umgehauen_Info()
{
	if (self.aivar[AIV_LastPlayerAR] == AR_NONE) //Kampf aus Dialog heraus.
	{
		if (B_GetAivar(self, AIV_LastFightAgainstPlayer) == FIGHT_LOST)
		{
			AI_Output(self, hero, "Info_Mod_Onar_Umgehauen_32_00"); //Du verdammtes Schwein, dafür wirst du bezahlen ...
			AI_Output(hero, self, "Info_Mod_Onar_Umgehauen_15_01"); //Also, was ist jetzt?
			AI_Output(self, hero, "Info_Mod_Onar_Umgehauen_32_02"); //(wütend) Ja, verdammt, er darf zurückkommen, dieser Lump. Und jetzt verschwinde!

			B_StartOtherRoutine	(Mod_100_BAU_Wasili_NW, "START");

			Mod_WM_WasiliQuest = 4;

			B_GivePlayerXP	(200);

			B_SetTopicStatus	(TOPIC_MOD_ADANOS_WASILI, LOG_SUCCESS);
		}
		else if (B_GetAivar(self, AIV_LastFightAgainstPlayer) == FIGHT_WON)
		{
			AI_Output(self, hero, "Info_Mod_Onar_Umgehauen_32_03"); //Tja, das war wohl nichts.
		};

		// ------ In jedem Fall: Arena-Kampf abgeschlossen ------
		self.aivar[AIV_ArenaFight] = AF_NONE;

		// ------ AIVAR resetten! ------
		self.aivar[AIV_LastFightComment] = TRUE;
	};
};

INSTANCE Info_Mod_Onar_Wasili_02 (C_INFO)
{
	npc		= Mod_791_BAU_Onar_NW;
	nr		= 1;
	condition	= Info_Mod_Onar_Wasili_02_Condition;
	information	= Info_Mod_Onar_Wasili_02_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Onar_Wasili_02_Condition()
{
	if (Mod_WM_WasiliSchnaps == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Onar_Wasili_02_Info()
{
	AI_Output(self, hero, "Info_Mod_Onar_Wasili_02_32_00"); //(kläglich) Ohh, verdammt, mein Magen. Diese Schmerzen, dieser Druck und diese Übelkeit.
	AI_Output(self, hero, "Info_Mod_Onar_Wasili_02_32_01"); //Du bist doch viel unterwegs draußen. Du musst mir helfen und mir ein Heilmittel besorgen, zum Beispiel von der alten Kräuterhexe.
	AI_Output(hero, self, "Info_Mod_Onar_Wasili_02_15_02"); //Warum sollte ich dir helfen?
	AI_Output(self, hero, "Info_Mod_Onar_Wasili_02_32_03"); //Ja, sag schon, was du willst.

	Info_ClearChoices	(Info_Mod_Onar_Wasili_02);

	if (Mod_WM_WasiliQuest == 3)
	{
		Info_AddChoice	(Info_Mod_Onar_Wasili_02, "Lass Wasili seine alte Position auf dem Hof einnehmen.", Info_Mod_Onar_Wasili_02_B);
	};

	Info_AddChoice	(Info_Mod_Onar_Wasili_02, "400 Gold.", Info_Mod_Onar_Wasili_02_A);
};

FUNC VOID Info_Mod_Onar_Wasili_02_B()
{
	AI_Output(hero, self, "Info_Mod_Onar_Wasili_02_B_15_00"); //Lass Wasili seine alte Position auf dem Hof einnehmen.
	AI_Output(self, hero, "Info_Mod_Onar_Wasili_02_B_32_01"); //Was den Lump wieder zurück auf den Hof ...
	AI_Output(hero, self, "Info_Mod_Onar_Wasili_02_C_15_02"); //Nun gut, dann eben nicht ...
	AI_Output(self, hero, "Info_Mod_Onar_Wasili_02_B_32_03"); //Ist ja schon gut, er darf zurück. Und jetzt beeil dich.

	B_StartOtherRoutine	(Mod_100_BAU_Wasili_NW, "START");

	Mod_WM_WasiliQuest = 4;

	B_GivePlayerXP	(250);

	B_LogEntry	(TOPIC_MOD_ADANOS_WASILI, "Nach dem Genuss des präparierten Schnapses beklagt sich Onar über Magenschmerzen. Ich soll ihm bei Sagitta ein Heilmittel besorgen.");

	B_SetTopicStatus	(TOPIC_MOD_ADANOS_WASILI, LOG_SUCCESS);

	Info_ClearChoices	(Info_Mod_Onar_Wasili_02);
};

FUNC VOID Info_Mod_Onar_Wasili_02_A()
{
	AI_Output(hero, self, "Info_Mod_Onar_Wasili_02_A_15_00"); //400 Gold.
	AI_Output(self, hero, "Info_Mod_Onar_Wasili_02_A_32_01"); //Was?! Du Halsabschn ...
	AI_Output(hero, self, "Info_Mod_Onar_Wasili_02_C_15_02"); //Nun gut, dann eben nicht ...
	AI_Output(self, hero, "Info_Mod_Onar_Wasili_02_A_32_03"); //Ist ja schon gut. Hier hast du das Gold und jetzt beeil dich.

	B_GiveInvItems	(self, hero, ItMi_Gold, 400);

	B_LogEntry	(TOPIC_MOD_ADANOS_WASILI, "Nach dem Genuss des präparierten Schnapses beklagt sich Onar über Magenschmerzen. Ich soll ihm bei Sagitta ein Heilmittel besorgen.");

	Info_ClearChoices	(Info_Mod_Onar_Wasili_02);
};

INSTANCE Info_Mod_Onar_Wasili_03 (C_INFO)
{
	npc		= Mod_791_BAU_Onar_NW;
	nr		= 1;
	condition	= Info_Mod_Onar_Wasili_03_Condition;
	information	= Info_Mod_Onar_Wasili_03_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier, das sollte dir helfen.";
};

FUNC INT Info_Mod_Onar_Wasili_03_Condition()
{
	if (Npc_HasItems(hero, ItPo_OnarsTrank) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Onar_Wasili_03_Info()
{
	AI_Output(hero, self, "Info_Mod_Onar_Wasili_03_15_00"); //Hier, das sollte dir helfen.
	AI_Output(self, hero, "Info_Mod_Onar_Wasili_03_32_01"); //Ahh, endlich. Her damit.

	B_GiveInvItems	(hero, self, ItPo_OnarsTrank, 1);

	B_UseItem	(self, ItPo_OnarsTrank);

	AI_Output(self, hero, "Info_Mod_Onar_Wasili_03_32_02"); //(entspannt) Ahh, jetzt geht es mir schon viel besser. (zu dem Helden) Was stehst du hier noch rum? Hast du nichts zu tun?

	AI_TurnAway	(hero, self);

	AI_Output(hero, self, "Info_Mod_Onar_Wasili_03_15_03"); //(Zu sich selbst) Ja, man merkt, dass es ihm wieder besser geht.

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Onar_Dieb (C_INFO)
{
	npc		= Mod_791_BAU_Onar_NW;
	nr		= 1;
	condition	= Info_Mod_Onar_Dieb_Condition;
	information	= Info_Mod_Onar_Dieb_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Onar_Dieb_Condition()
{
	if (Kapitel >= 2)
	&& (Npc_KnowsInfo(hero, Info_Mod_Onar_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Onar_Dieb_Info()
{
	AI_Output(self, hero, "Info_Mod_Onar_Dieb_32_00"); //Hey du!
	AI_Output(hero, self, "Info_Mod_Onar_Dieb_15_01"); //Was gibt's?
	AI_Output(self, hero, "Info_Mod_Onar_Dieb_32_02"); //Ich hab was zu tun für dich.
	AI_Output(self, hero, "Info_Mod_Onar_Dieb_32_03"); //In letzter Zeit fehlen immer öfter Waren aus dem Lager.
	AI_Output(self, hero, "Info_Mod_Onar_Dieb_32_04"); //Finde den Dieb und bring mir die Sachen zurück.
	AI_Output(self, hero, "Info_Mod_Onar_Dieb_32_05"); //Es fehlen 20 Stücke rohes Fleisch, 6 Stücke Käse und 10 Flaschen Wasser.

	Npc_ExchangeRoutine	(Mod_785_BAU_Gunnar_NW, "DIEB");

	Log_CreateTopic	(TOPIC_MOD_BAUER_DIEB, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BAUER_DIEB, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BAUER_DIEB, "Einer der Bauern stiehlt Waren aus dem Lager von Onar. Ich soll ihn fassen und die Sachen zurückbringen.\nEs fehlen:\n- 20x rohes Fleisch\n- 6x Käse\n- 10x Wasser");
};

INSTANCE Info_Mod_Onar_Dieb_Erwischt (C_INFO)
{
	npc		= Mod_791_BAU_Onar_NW;
	nr		= 1;
	condition	= Info_Mod_Onar_Dieb_Erwischt_Condition;
	information	= Info_Mod_Onar_Dieb_Erwischt_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab die Sachen.";
};

FUNC INT Info_Mod_Onar_Dieb_Erwischt_Condition()
{
	if (Mod_Gunnar_Partner == FALSE)
	&& (Npc_HasItems(hero, ItFo_MuttonRaw) >= 20)
	&& (Npc_HasItems(hero, ItFo_Cheese) >= 6)
	&& (Npc_HasItems(hero, ItFo_Water) >= 10)
	&& (Npc_KnowsInfo(hero, Info_Mod_Gunnar_Flucht))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Onar_Dieb_Erwischt_Info()
{
	AI_Output(hero, self, "Info_Mod_Onar_Dieb_Erwischt_15_00"); //Ich hab die Sachen. Gunnar war der Dieb.
	AI_Output(self, hero, "Info_Mod_Onar_Dieb_Erwischt_32_01"); //Sehr gut. Gib sie mir.

	Npc_RemoveInvItems	(hero, ItFo_MuttonRaw, 20);
	Npc_RemoveInvItems	(hero, ItFo_Cheese, 6);
	Npc_RemoveInvItems	(hero, ItFo_Water, 10);

	B_ShowGivenThings	("20 rohes Fleisch, 6 Käse und 10 Wasser gegeben");

	B_LogEntry	(TOPIC_MOD_BAUER_DIEB, "Ich hab Onar die Sachen gebracht.");

	AI_Output(self, hero, "Info_Mod_Onar_Dieb_Erwischt_32_02"); //Hier ist deine Belohnung.

	B_GivePlayerXP	(100);

	B_Göttergefallen(2, 1);

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	B_SetTopicStatus	(TOPIC_MOD_BAUER_DIEB, LOG_SUCCESS);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Onar_BauernFuerAkil (C_INFO)
{
	npc		= Mod_791_BAU_Onar_NW;
	nr		= 1;
	condition	= Info_Mod_Onar_BauernFuerAkil_Condition;
	information	= Info_Mod_Onar_BauernFuerAkil_Info;
	permanent	= 0;
	important	= 0;
	description	= "Der Bauer Telbor will den Hof von Akil wieder in Betrieb nehmen.";
};

FUNC INT Info_Mod_Onar_BauernFuerAkil_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Onar_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Telbor_PilgerTot))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Onar_BauernFuerAkil_Info()
{
	AI_Output(hero, self, "Info_Mod_Onar_BauernFuerAkil_15_00"); //Der Bauer Telbor will den Hof von Akil wieder in Betrieb nehmen.
	AI_Output(self, hero, "Info_Mod_Onar_BauernFuerAkil_32_01"); //Und was interessiert mich das?
	AI_Output(hero, self, "Info_Mod_Onar_BauernFuerAkil_15_02"); //Er braucht noch zwei Landarbeiter und eine Magd, die ihm dort helfen.
	AI_Output(hero, self, "Info_Mod_Onar_BauernFuerAkil_15_03"); //Du kannst doch sicherlich jemanden für den Hof entbehren.
	AI_Output(self, hero, "Info_Mod_Onar_BauernFuerAkil_32_04"); //Hmm. Na gut, ich schicke drei meiner Leute zu Akil's Hof. Da gibt es sicherlich was zu holen.
};

INSTANCE Info_Mod_Onar_Pickpocket (C_INFO)
{
	npc		= Mod_791_BAU_Onar_NW;
	nr		= 1;
	condition	= Info_Mod_Onar_Pickpocket_Condition;
	information	= Info_Mod_Onar_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Onar_Pickpocket_Condition()
{
	C_Beklauen	(100, ItMi_Gold, 43);
};

FUNC VOID Info_Mod_Onar_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Onar_Pickpocket);

	Info_AddChoice	(Info_Mod_Onar_Pickpocket, DIALOG_BACK, Info_Mod_Onar_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Onar_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Onar_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Onar_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Onar_Pickpocket);
};

FUNC VOID Info_Mod_Onar_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Onar_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Onar_Pickpocket);

		Info_AddChoice	(Info_Mod_Onar_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Onar_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Onar_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Onar_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Onar_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Onar_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Onar_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Onar_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Onar_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Onar_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Onar_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Onar_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Onar_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Onar_EXIT (C_INFO)
{
	npc		= Mod_791_BAU_Onar_NW;
	nr		= 1;
	condition	= Info_Mod_Onar_EXIT_Condition;
	information	= Info_Mod_Onar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Onar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Onar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};