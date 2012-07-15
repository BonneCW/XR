INSTANCE Info_Mod_Herek_REL_Hi (C_INFO)
{
	npc		= Mod_7670_STT_Herek_REL;
	nr		= 1;
	condition	= Info_Mod_Herek_REL_Hi_Condition;
	information	= Info_Mod_Herek_REL_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Herek_REL_Hi_Condition()
{
	if (Npc_HasItems(hero, ItMi_Gold) >= 100)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Herek_REL_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Herek_REL_Hi_01_00"); //Hey, warte mal.
	AI_Output(self, hero, "Info_Mod_Herek_REL_Hi_01_01"); //Du siehst aus wie jemand, der sich eine gute Gelegenheit nicht durch die Lappen gehen lassen würde.
	AI_Output(hero, self, "Info_Mod_Herek_REL_Hi_15_02"); //Was willst du?
	AI_Output(self, hero, "Info_Mod_Herek_REL_Hi_01_03"); //Nun, ich könnte dir erzählen – sagen wir für nur 100 Goldmünzen – wo du einen Schatz findest.

	Info_ClearChoices	(Info_Mod_Herek_REL_Hi);

	Info_AddChoice	(Info_Mod_Herek_REL_Hi, "Vergiss es. Ich behalte mein Gold.", Info_Mod_Herek_REL_Hi_B);
	Info_AddChoice	(Info_Mod_Herek_REL_Hi, "Ok, hier. Leg los.", Info_Mod_Herek_REL_Hi_A);
};

FUNC VOID Info_Mod_Herek_REL_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Herek_REL_Hi_B_15_00"); //Vergiss es. Ich behalte mein Gold.
	AI_Output(self, hero, "Info_Mod_Herek_REL_Hi_B_01_01"); //Okey, dir entgeht damit zwar einiges an Gold ... aber andere Abenteurer lassem sich diese Gelegenheit bestimmt nicht entgehen.
};

FUNC VOID Info_Mod_Herek_REL_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Herek_REL_Hi_A_15_00"); //Ok, hier. Leg los.

	B_GiveInvItems	(hero, self, ItMi_Gold, 100);

	AI_Output(self, hero, "Info_Mod_Herek_REL_Hi_A_01_01"); //Gut, dann hör zu. In einem der verfallenen Gebäude vor dem Moor läuft ein verendeter Abenteurer herum.
	AI_Output(self, hero, "Info_Mod_Herek_REL_Hi_A_01_02"); //Wie ich nun mitbekommen habe, fand er vor seinem Tod viel Gold und einige wertvolle Artefakte ...
	AI_Output(self, hero, "Info_Mod_Herek_REL_Hi_A_01_03"); //Die muss er noch bei sich haben. Kapiert?

	Info_ClearChoices	(Info_Mod_Herek_REL_Hi);

	Log_CreateTopic	(TOPIC_MOD_HEREK_GOLD, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_HEREK_GOLD, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_HEREK_GOLD, "Für 100 Münzen habe ich von Herek erfahren, dass bei den verfallenen Gebäuden vor dem Moor ein verendeter Abenteurer als Untoter herumwandelt, der noch einiges an Gold und Schätzen bei sich haben muss.");

	Wld_InsertNpc	(Zombie_Herek,	"FP_ROAM_ZOMBIE_HEREK");
};

INSTANCE Info_Mod_Herek_REL_AtZombie (C_INFO)
{
	npc		= Mod_7670_STT_Herek_REL;
	nr		= 1;
	condition	= Info_Mod_Herek_REL_AtZombie_Condition;
	information	= Info_Mod_Herek_REL_AtZombie_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Herek_REL_AtZombie_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Herek_REL_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Harlok_HerekZombie))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Herek_REL_AtZombie_Info()
{
	AI_Output(self, hero, "Info_Mod_Herek_REL_AtZombie_01_00"); //(zu sich selbst) Hähä, jetzt kann ich hier ungestört buddeln. (bemerkt den Helden) Was, du?!
	AI_Output(hero, self, "Info_Mod_Herek_REL_AtZombie_15_01"); //Ja, ich! Du Schwein hast mich reingelegt.
	AI_Output(self, hero, "Info_Mod_Herek_REL_AtZombie_01_02"); //(hämisch) Und, was willst du jetzt machen?

	Info_ClearChoices	(Info_Mod_Herek_REL_AtZombie);

	Info_AddChoice	(Info_Mod_Herek_REL_AtZombie, "Mir mein Gold wiederholen.", Info_Mod_Herek_REL_AtZombie_B);
	Info_AddChoice	(Info_Mod_Herek_REL_AtZombie, "Mein Gold zurückverlangen.", Info_Mod_Herek_REL_AtZombie_A);
};

FUNC VOID Info_Mod_Herek_REL_AtZombie_C()
{
	AI_Output(self, hero, "Info_Mod_Herek_REL_AtZombie_C_01_00"); //Ja?! Kannst es ja mal versuchen!

	Info_ClearChoices	(Info_Mod_Herek_REL_AtZombie);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_NONE, 0);
};

FUNC VOID Info_Mod_Herek_REL_AtZombie_B()
{
	AI_Output(hero, self, "Info_Mod_Herek_REL_AtZombie_B_15_00"); //Mir mein Gold wiederholen.

	Info_Mod_Herek_REL_AtZombie_C();
};

FUNC VOID Info_Mod_Herek_REL_AtZombie_A()
{
	AI_Output(hero, self, "Info_Mod_Herek_REL_AtZombie_A_15_00"); //Mein Gold zurückverlangen.
	AI_Output(self, hero, "Info_Mod_Herek_REL_AtZombie_A_01_01"); //Ohh, mir kommen gleich die Tränen.
	AI_Output(self, hero, "Info_Mod_Herek_REL_AtZombie_A_01_02"); //Wenn du dich reinlegen lässt, bist du selbst schuld. Jeder muss mal sein Lehrgeld zahlen.
	AI_Output(self, hero, "Info_Mod_Herek_REL_AtZombie_A_01_03"); //Solltest mir eigentlich noch dankbar sein für die Lektion.
	AI_Output(hero, self, "Info_Mod_Herek_REL_AtZombie_A_15_04"); //Ich glaube ich muss DIR gleich eine Lektion beibringen.

	Info_Mod_Herek_REL_AtZombie_C();
};

INSTANCE Info_Mod_Herek_REL_Umgehauen (C_INFO)
{
	npc		= Mod_7670_STT_Herek_REL;
	nr		= 1;
	condition	= Info_Mod_Herek_REL_Umgehauen_Condition;
	information	= Info_Mod_Herek_REL_Umgehauen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Herek_REL_Umgehauen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Herek_REL_AtZombie))
	&& (B_GetAivar(self, AIV_LastFightAgainstPlayer) == FIGHT_LOST)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Herek_REL_Umgehauen_Info()
{
	AI_Output(self, hero, "Info_Mod_Herek_REL_Umgehauen_04_00"); //Du Mistkerl, meine Knochen.
							
	// ------ In jedem Fall: Arena-Kampf abgeschlossen ------
	self.aivar[AIV_ArenaFight] = AF_NONE;
		
	// ------ AIVAR resetten! ------	
	self.aivar[AIV_LastFightComment] = TRUE;

	CreateInvItems	(self, ItPo_Health_Addon_04, 1);

	B_UseItem	(self, ItPo_Health_Addon_04);
};

INSTANCE Info_Mod_Herek_REL_AtZombie2 (C_INFO)
{
	npc		= Mod_7670_STT_Herek_REL;
	nr		= 1;
	condition	= Info_Mod_Herek_REL_AtZombie2_Condition;
	information	= Info_Mod_Herek_REL_AtZombie2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wo ist der Rest meines Goldes?";
};

FUNC INT Info_Mod_Herek_REL_AtZombie2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Herek_REL_Umgehauen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Herek_REL_AtZombie2_Info()
{
	AI_Output(hero, self, "Info_Mod_Herek_REL_AtZombie2_15_00"); //Wo ist der Rest meines Goldes?
	AI_Output(self, hero, "Info_Mod_Herek_REL_AtZombie2_01_01"); //Hä, das wüsstest du wohl gerne. Aber ich sag nichts!

	Info_ClearChoices	(Info_Mod_Herek_REL_AtZombie2);

	Info_AddChoice	(Info_Mod_Herek_REL_AtZombie2, "Dann muss ich deine Zunge mit einer weiteren Tracht Prügel lockern.", Info_Mod_Herek_REL_AtZombie2_B);
	Info_AddChoice	(Info_Mod_Herek_REL_AtZombie2, "Dann mach, dass du weg kommst.", Info_Mod_Herek_REL_AtZombie2_A);
};

FUNC VOID Info_Mod_Herek_REL_AtZombie2_B()
{
	AI_Output(hero, self, "Info_Mod_Herek_REL_AtZombie2_B_15_00"); //Dann muss ich deine Zunge mit einer weiteren Tracht Prügel lockern.

	AI_PlayAni	(hero, "T_FISTATTACKMOVE");

	AI_Output(self, hero, "Info_Mod_Herek_REL_AtZombie2_B_01_01"); //Ahh, meine Knochen.
	AI_Output(hero, self, "Info_Mod_Herek_REL_AtZombie2_B_15_02"); //Das hatten wir schon mal.
	AI_Output(self, hero, "Info_Mod_Herek_REL_AtZombie2_B_01_03"); //(nachgebend) Ok. Ich zeig dir ja, wo es funkelt. (impulsiv) Hier!

	AI_PlayAni	(hero, "T_FISTATTACKMOVE");

	AI_Output(self, hero, "Info_Mod_Herek_REL_AtZombie2_B_01_04"); //(stöhnt) Ahh ... ich kann nicht mehr.
	AI_Output(hero, self, "Info_Mod_Herek_REL_AtZombie2_B_15_05"); //Wir können das Spiel gerne so weitertreiben.
	AI_Output(self, hero, "Info_Mod_Herek_REL_AtZombie2_B_01_06"); //Jaja ... ich hab genug.
	AI_Output(self, hero, "Info_Mod_Herek_REL_AtZombie2_B_01_07"); //Das Gold liegt auf dem Dach der verfallenen Hütte, die am weitesten vom Moor entfernt liegt.
	AI_Output(hero, self, "Info_Mod_Herek_REL_AtZombie2_B_15_08"); //Ok, ich schaue nach ... und wehe du hast mich belogen.
	AI_Output(self, hero, "DEFAULT"); //

	Info_ClearChoices	(Info_Mod_Herek_REL_AtZombie2);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");

	Wld_InsertItem	(ItMi_HerekBeutel,	"FP_ITEM_HEREKBEUTEL");

	B_LogEntry	(TOPIC_MOD_HEREK_GOLD, "Es hat einige Überredungskunst gekostet, aber endlich hat Herek ausgespuckt, wo er den Rest meines Goldes versteckt hat… zumindest hoffe ich das. Es liegt auf dem Dach der zerfallenen Hütte, die am weitsteten vom Moor entfernt liegt.");
	B_SetTopicStatus	(TOPIC_MOD_HEREK_GOLD, LOG_SUCCESS);

	B_GivePlayerXP	(300);
};

FUNC VOID Info_Mod_Herek_REL_AtZombie2_A()
{
	AI_Output(hero, self, "Info_Mod_Herek_REL_AtZombie2_A_15_00"); //Dann mach, dass du weg kommst.
	AI_Output(self, hero, "DEFAULT"); //

	Info_ClearChoices	(Info_Mod_Herek_REL_AtZombie2);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");

	B_SetTopicStatus	(TOPIC_MOD_HEREK_GOLD, LOG_FAILED);

	Wld_InsertItem	(ItMi_HerekBeutel,	"FP_ITEM_HEREKBEUTEL");

	B_Göttergefallen (1, 1);
};

INSTANCE Info_Mod_Herek_REL_Trade (C_INFO)
{
	npc		= Mod_7670_STT_Herek_REL;
	nr		= 1;
	condition	= Info_Mod_Herek_REL_Trade_Condition;
	information	= Info_Mod_Herek_REL_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Herek_REL_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Herek_REL_AtZombie2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Herek_REL_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Herek_REL_Pickpocket (C_INFO)
{
	npc		= Mod_7670_STT_Herek_REL;
	nr		= 1;
	condition	= Info_Mod_Herek_REL_Pickpocket_Condition;
	information	= Info_Mod_Herek_REL_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Herek_REL_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_GoldCup, 2);
};

FUNC VOID Info_Mod_Herek_REL_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Herek_REL_Pickpocket);

	Info_AddChoice	(Info_Mod_Herek_REL_Pickpocket, DIALOG_BACK, Info_Mod_Herek_REL_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Herek_REL_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Herek_REL_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Herek_REL_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Herek_REL_Pickpocket);
};

FUNC VOID Info_Mod_Herek_REL_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Herek_REL_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Herek_REL_Pickpocket);

		Info_AddChoice	(Info_Mod_Herek_REL_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Herek_REL_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Herek_REL_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Herek_REL_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Herek_REL_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Herek_REL_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Herek_REL_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Herek_REL_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Herek_REL_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Herek_REL_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Herek_REL_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Herek_REL_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Herek_REL_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Herek_REL_EXIT (C_INFO)
{
	npc		= Mod_7670_STT_Herek_REL;
	nr		= 1;
	condition	= Info_Mod_Herek_REL_EXIT_Condition;
	information	= Info_Mod_Herek_REL_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Herek_REL_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Herek_REL_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};