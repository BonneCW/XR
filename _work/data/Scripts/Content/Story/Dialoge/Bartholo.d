INSTANCE Info_Mod_Bartholo_Hi (C_INFO)
{
	npc		= Mod_1106_EBR_Bartholo_MT;
	nr		= 1;
	condition	= Info_Mod_Bartholo_Hi_Condition;
	information	= Info_Mod_Bartholo_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bartholo_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bartholo_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Bartholo_Hi_12_00"); //Dich kenne ich doch! Wie war noch mal dein Name?
	AI_Output(hero, self, "Info_Mod_Bartholo_Hi_15_01"); //Ähm... Na ja ...
	AI_Output(self, hero, "Info_Mod_Bartholo_Hi_12_02"); //Was gibt's da herumzudrucksen?
	AI_Output(hero, self, "Info_Mod_Bartholo_Hi_15_03"); //Früher nannte man mich häufig, äh, Rü...
	AI_Output(self, hero, "Info_Mod_Bartholo_Hi_12_04"); //Wie dem auch sei. Was hast du hier verloren?
};

INSTANCE Info_Mod_Bartholo_Laber (C_INFO)
{
	npc		= Mod_1106_EBR_Bartholo_MT;
	nr		= 1;
	condition	= Info_Mod_Bartholo_Laber_Condition;
	information	= Info_Mod_Bartholo_Laber_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bartholo_Laber_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bartholo_Hi))
	&& (Mod_TemplerBeiThorus < 5)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bartholo_Laber_Info()
{
	AI_Output(self, hero, "Info_Mod_Bartholo_Laber_12_00"); //Verschwinde!
	
	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Bartholo_Verrat (C_INFO)
{
	npc		= Mod_1106_EBR_Bartholo_MT;
	nr		= 1;
	condition	= Info_Mod_Bartholo_Verrat_Condition;
	information	= Info_Mod_Bartholo_Verrat_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bartholo_Verrat_Condition()
{
	if (Mod_TemplerBeiThorus == 5)
	&& (Npc_GetDistToWP(hero, "WP_MT_AL_HEROLERNTFLIEGEN") < 200)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bartholo_Verrat_Info()
{
	AI_Output(self, hero, "Info_Mod_Bartholo_Verrat_12_00"); //Du hättest schon lange sterben müssen und jetzt, wo du uns gefährlich wirst, hast du dein Recht auf Leben verwirkt.

	B_LogEntry	(TOPIC_MOD_AL_SCHMUGGLER, "Es scheint als wäre Bartholo der Hintermann.");

	AI_StopProcessInfos	(self);

	AI_StartState	(hero, ZS_MagicFreeze, 0, "");

	Mod_TemplerBeiThorus = 6;

	hero.flags = 2;

	B_Attack	(self, hero, AR_NONE, 0);

	//Wld_InsertNpc	(Mod_1874_HMG_Makanius_MT, "OC1");

	B_StartOtherRoutine	(Mod_966_GRD_Thorus_MT, "FALLE");
	B_KillNpc	(Mod_966_GRD_Thorus_MT);
	B_StartOtherRoutine	(Mod_1870_EBR_Alissandro_MT, "FALLE");
	B_StartOtherRoutine	(Mod_1105_EBR_Arto_MT, "KASTELL");
};

INSTANCE Info_Mod_Bartholo_KillBuddler (C_INFO)
{
	npc		= Mod_1106_EBR_Bartholo_MT;
	nr		= 1;
	condition	= Info_Mod_Bartholo_KillBuddler_Condition;
	information	= Info_Mod_Bartholo_KillBuddler_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bartholo_KillBuddler_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bloodwyn_EBR_Belauscht))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bartholo_KillBuddler_Info()
{
	AI_TurnToNpc	(self, Mod_1440_BUD_Buddler_MT);

	AI_Output(self, hero, "Info_Mod_Bartholo_KillBuddler_12_00"); //Du dreckiger Bastard meinst wohl, du könntest dich unbemerkt mit Alissandro in Verbindung setzen?
	AI_Output(self, hero, "Info_Mod_Bartholo_KillBuddler_12_01"); //Doch ich merke alles, und deshalb bekommst du auch deine Strafe.

	AI_StopProcessInfos	(self);

	B_RemoveNpc	(Mod_1440_BUD_Buddler_MT);
};

INSTANCE Info_Mod_Bartholo_Sumpfkraut (C_INFO)
{
	npc		= Mod_1106_EBR_Bartholo_MT;
	nr		= 1;
	condition	= Info_Mod_Bartholo_Sumpfkraut_Condition;
	information	= Info_Mod_Bartholo_Sumpfkraut_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bartholo_Sumpfkraut_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_GorNaKar_Torwache_01))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bartholo_Sumpfkraut_Info()
{
	AI_Output(self, hero, "Info_Mod_Bartholo_Sumpfkraut_12_00"); //Ihr bringt mir sicher das Sumpfkraut.

	Snd_Play	("THRILLJINGLE_03.WAV");

	AI_TurnToNpc	(self, Mod_1874_HMG_Makanius_MT);

	AI_Output(self, hero, "Info_Mod_Bartholo_Sumpfkraut_12_01"); //Verdammt, was ist jetzt passiert?

	AI_StopProcessInfos	(self);

	AI_Teleport	(Mod_1156_GRD_Gardist_MT, "OCC_BARONS_RIGHT_ROOM_BACK");
	B_StartOtherRoutine	(Mod_1156_GRD_Gardist_MT, "ANGRIFF");

	KillALGardists	();
};

INSTANCE Info_Mod_Bartholo_Eroberung (C_INFO)
{
	npc		= Mod_1106_EBR_Bartholo_MT;
	nr		= 1;
	condition	= Info_Mod_Bartholo_Eroberung_Condition;
	information	= Info_Mod_Bartholo_Eroberung_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bartholo_Eroberung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_GardistFuerEroberung_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bartholo_Eroberung_Info()
{
	AI_TurnToNpc	(self, Mod_1156_GRD_Gardist_MT);

	AI_Output(self, Mod_1156_GRD_Gardist_MT, "Info_Mod_Bartholo_Eroberung_12_00"); //Was? Verdammt, wie konnte das passieren?

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Bartholo_Anschluss (C_INFO)
{
	npc		= Mod_1106_EBR_Bartholo_MT;
	nr		= 1;
	condition	= Info_Mod_Bartholo_Anschluss_Condition;
	information	= Info_Mod_Bartholo_Anschluss_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich will mich euch anschließen.";
};

FUNC INT Info_Mod_Bartholo_Anschluss_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bartholo_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Bartholo_Thorus))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bartholo_Anschluss_Info()
{
	AI_Output(hero, self, "Info_Mod_Bartholo_Anschluss_15_00"); //Ich will mich euch anschließen.
	AI_Output(self, hero, "Info_Mod_Bartholo_Anschluss_12_01"); //Aha! Der verloren geglaubte Sohn kehrt zurück, oder wie?
	AI_Output(self, hero, "Info_Mod_Bartholo_Anschluss_12_02"); //Schön, sprich mit Thorus. Er wird sich zwar nicht freuen, dich zu sehen, aber er hat gerade größere Probleme.
	AI_Output(self, hero, "Info_Mod_Bartholo_Anschluss_12_03"); //Deswegen musst du dir wohl keine Sorgen um dein Leben machen.
	AI_Output(hero, self, "Info_Mod_Bartholo_Anschluss_15_04"); //Das klingt ja vielversprechend ...
	AI_Output(self, hero, "Info_Mod_Bartholo_Anschluss_12_05"); //Das ist mehr, als du erwarten kannst. Dass du dich den Wassermagiern anvertraut hast, hat dir hier keine Sympathiepunkte eingebracht.
	AI_Output(self, hero, "Info_Mod_Bartholo_Anschluss_12_06"); //Denk übrigens dran, deine Waffe stecken zu lassen, wenn du zu Thorus gehst. Solltest du den Fehler begehen und sie zücken, werden wir dir kurzen Prozess machen.
};

INSTANCE Info_Mod_Bartholo_Thorus (C_INFO)
{
	npc		= Mod_1106_EBR_Bartholo_MT;
	nr		= 1;
	condition	= Info_Mod_Bartholo_Thorus_Condition;
	information	= Info_Mod_Bartholo_Thorus_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich will nur mit Thorus sprechen.";
};

FUNC INT Info_Mod_Bartholo_Thorus_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bartholo_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Bartholo_Anschluss))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bartholo_Thorus_Info()
{
	AI_Output(hero, self, "Info_Mod_Bartholo_Thorus_15_00"); //Ich will nur mit Thorus sprechen.
	AI_Output(self, hero, "Info_Mod_Bartholo_Thorus_12_01"); //Wenn er auch mit dir sprechen will, sollte das kein Problem sein.
	AI_Output(self, hero, "Info_Mod_Bartholo_Thorus_12_02"); //Aber sei gewarnt: Wenn du in seiner Gegenwart deine Waffe ziehst, bist du schneller tot, als du dir in die Hose scheißen kannst.
};

INSTANCE Info_Mod_Bartholo_WarumNochHier (C_INFO)
{
	npc		= Mod_1106_EBR_Bartholo_MT;
	nr		= 1;
	condition	= Info_Mod_Bartholo_WarumNochHier_Condition;
	information	= Info_Mod_Bartholo_WarumNochHier_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was machst du noch hier?";
};

FUNC INT Info_Mod_Bartholo_WarumNochHier_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bartholo_Anschluss))
	|| (Npc_KnowsInfo(hero, Info_Mod_Bartholo_Thorus))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bartholo_WarumNochHier_Info()
{
	AI_Output(hero, self, "Info_Mod_Bartholo_WarumNochHier_15_00"); //Was machst du noch hier?
	AI_Output(self, hero, "Info_Mod_Bartholo_WarumNochHier_12_01"); //Ich bin Thorus loyal gegenüber. Bald wird es mit dem Lager wieder bergauf gehen.
	AI_Output(self, hero, "Info_Mod_Bartholo_WarumNochHier_12_02"); //Außerdem will ich nicht so enden wie Stone dort draußen...
};

INSTANCE Info_Mod_Bartholo_Ende (C_INFO)
{
	npc		= Mod_1106_EBR_Bartholo_MT;
	nr		= 1;
	condition	= Info_Mod_Bartholo_Ende_Condition;
	information	= Info_Mod_Bartholo_Ende_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bartholo_Ende_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Makanius_BartholosFlucht))
	&& (Npc_GetDistToWP(self, "WP_MT_OC_BARTHOLO_KERKER") < 300)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bartholo_Ende_Info()
{
	AI_Output(self, hero, "Info_Mod_Bartholo_Ende_12_00"); //Ihr habt mich gefunden, jetzt ist es also zu spät. Aber ich werde nicht kampflos aufgeben.

	AI_StopProcessInfos	(self);

	self.flags = 0;

	B_Attack	(self, hero, AR_GuildEnemy, 0);
};

INSTANCE Info_Mod_Bartholo_Pickpocket (C_INFO)
{
	npc		= Mod_1106_EBR_Bartholo_MT;
	nr		= 1;
	condition	= Info_Mod_Bartholo_Pickpocket_Condition;
	information	= Info_Mod_Bartholo_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Bartholo_Pickpocket_Condition()
{
	C_Beklauen	(100, ItMi_Gold, 800);
};

FUNC VOID Info_Mod_Bartholo_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Bartholo_Pickpocket);

	Info_AddChoice	(Info_Mod_Bartholo_Pickpocket, DIALOG_BACK, Info_Mod_Bartholo_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Bartholo_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Bartholo_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Bartholo_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Bartholo_Pickpocket);
};

FUNC VOID Info_Mod_Bartholo_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Bartholo_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Bartholo_Pickpocket);

		Info_AddChoice	(Info_Mod_Bartholo_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Bartholo_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Bartholo_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Bartholo_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Bartholo_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Bartholo_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Bartholo_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Bartholo_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Bartholo_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Bartholo_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Bartholo_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Bartholo_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Bartholo_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Bartholo_EXIT (C_INFO)
{
	npc		= Mod_1106_EBR_Bartholo_MT;
	nr		= 1;
	condition	= Info_Mod_Bartholo_EXIT_Condition;
	information	= Info_Mod_Bartholo_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Bartholo_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bartholo_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};