INSTANCE Info_Mod_Maleth_Hi (C_INFO)
{
	npc		= Mod_911_BAU_Maleth_NW;
	nr		= 1;
	condition	= Info_Mod_Maleth_Hi_Condition;
	information	= Info_Mod_Maleth_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Maleth_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Maleth_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Maleth_Hi_08_00"); //Hey Fremder, man sieht nicht häufig Wanderer hier vorbeikommen. Bist du auf dem Weg in die Stadt?

	Info_ClearChoices	(Info_Mod_Maleth_Hi);

	Info_AddChoice	(Info_Mod_Maleth_Hi, "Das geht dich nichts an.", Info_Mod_Maleth_Hi_B);
	Info_AddChoice	(Info_Mod_Maleth_Hi, "Ja genau.", Info_Mod_Maleth_Hi_A);
};

FUNC VOID Info_Mod_Maleth_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Maleth_Hi_B_15_00"); //Das geht dich nichts an.

	var C_Item NovArmorOrNot;
	NovArmorOrNot = Npc_GetEquippedArmor(hero);

	if (Hlp_IsItem(NovArmorOrNot, ITAR_FAKE_NOV_L))
	{
		AI_Output(self, hero, "Info_Mod_Maleth_Hi_B_08_01"); //Wie du meinst. Aber erwarte ja nicht, dass du bei uns Unterkunft und Verpflegung erhältst, selbst wenn du ein Novize des Klosters bist.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Maleth_Hi_B_08_02"); //Wie du meinst, Fremder. Aber mach uns hier ja keinen Ärger.
	};

	Info_ClearChoices	(Info_Mod_Maleth_Hi);
};

FUNC VOID Info_Mod_Maleth_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Maleth_Hi_A_15_00"); //Ja genau.
	AI_Output(self, hero, "Info_Mod_Maleth_Hi_A_08_01"); //Da tust du auch gut daran.
	AI_Output(self, hero, "Info_Mod_Maleth_Hi_A_08_02"); //Abgesehen von den wilden Tieren treibt sich seit dem Fall der Barriere auch allerlei unheimliches Gesindel hier herum, wie der sonderbare dunkle Pilger, der vorher hier vorbeikam.
	AI_Output(hero, self, "Info_Mod_Maleth_Hi_A_15_03"); //Ein dunkler Pilger?
	AI_Output(self, hero, "Info_Mod_Maleth_Hi_A_08_04"); //Ja, eine ziemlich finstere Gestalt. Er ist Richtung Stadt gegangen. Zum Glück hat er nicht bei uns um Unterkunft gebeten.
	AI_Output(self, hero, "Info_Mod_Maleth_Hi_A_08_05"); //Naja, unser Bauer hätte ihm sowieso kein Obdach gegeben, sondern ihn in die Stadt verwiesen.
	AI_Output(self, hero, "Info_Mod_Maleth_Hi_A_08_06"); //Genau wie beim letzten Typen, der hier war. Der war mir auch nicht ganz geheuer.
	AI_Output(self, hero, "Info_Mod_Maleth_Hi_A_08_07"); //Hat ganz ruhig gesprochen, sah aber mit seinen Tätowierungen aus, als würde er dir gleich an die Gurgel gehen.
	AI_Output(self, hero, "Info_Mod_Maleth_Hi_A_08_08"); //Den haben sie nicht in die Stadt gelassen. Seitdem lungert er da noch irgendwo rum.

	B_LogEntry	(TOPIC_MOD_DUNKLERPILGER, "Maleth hat den dunklen Pilger Richtung Stadt vorbeigehen sehen. Vielleicht werde ich bei den Torwachen mehr erfahren.");

	B_GivePlayerXP	(50);
	
	Info_ClearChoices	(Info_Mod_Maleth_Hi);
};

INSTANCE Info_Mod_Maleth_Wolfsplage (C_INFO)
{
	npc		= Mod_911_BAU_Maleth_NW;
	nr		= 1;
	condition	= Info_Mod_Maleth_Wolfsplage_Condition;
	information	= Info_Mod_Maleth_Wolfsplage_Info;
	permanent	= 0;
	important	= 0;
	description	= "Warum machst du so ein Gesicht?";
};

FUNC INT Info_Mod_Maleth_Wolfsplage_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Maleth_Hi))
	&& (Kapitel > 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Maleth_Wolfsplage_Info()
{
	AI_Output(hero, self, "Info_Mod_Maleth_Wolfsplage_15_00"); //Warum machst du so ein Gesicht?
	AI_Output(self, hero, "Info_Mod_Maleth_Wolfsplage_08_01"); //(winkt ab) Ach, in letzter Zeit haben wir immer mehr Probleme mit den Wölfen. Die reißen immer mehr Schafe und ich kann sie nicht erwischen.
	AI_Output(hero, self, "Info_Mod_Maleth_Wolfsplage_15_02"); //Wo befinden sich diese Viecher?
	AI_Output(self, hero, "Info_Mod_Maleth_Wolfsplage_08_03"); //(ungläubig) Willst du dich mit den Viechern anlegen!
	AI_Output(hero, self, "Info_Mod_Maleth_Wolfsplage_15_04"); //Das hatte ich im Sinn!
	AI_Output(self, hero, "Info_Mod_Maleth_Wolfsplage_08_05"); //Das würdest du tun. Gut diese Viecher treiben sich immer in der Nähe der Innostatue rum und erscheinen dann, wenn man wegsieht.
	AI_Output(hero, self, "Info_Mod_Maleth_Wolfsplage_15_06"); //Dann werde ich dort mal nachsehen.
	AI_Output(self, hero, "Info_Mod_Maleth_Wolfsplage_08_07"); //Viel Glück!

	Log_CreateTopic	(TOPIC_MOD_MALETH_WOLFSPLAGE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_MALETH_WOLFSPLAGE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_MALETH_WOLFSPLAGE, "Der Schafshirte Maleth hat ein Problem mit Wölfen. Diese verstecken sich in der Nähe des Innosschreines und reißen seine Schafe, wenn er nicht hinsieht. Ich sollte mich darum kümmern.");

	AI_StopProcessInfos	(self);

	Wld_InsertNpc	(Blackwolf_Maleth_01, "NW_FARM1_PATH_SPAWN_07");
	Wld_InsertNpc	(Blackwolf_Maleth_02, "NW_FARM1_PATH_SPAWN_07");
	Wld_InsertNpc	(Blackwolf_Maleth_03, "NW_FARM1_PATH_SPAWN_07");
};

INSTANCE Info_Mod_Maleth_WoelfeTot (C_INFO)
{
	npc		= Mod_911_BAU_Maleth_NW;
	nr		= 1;
	condition	= Info_Mod_Maleth_WoelfeTot_Condition;
	information	= Info_Mod_Maleth_WoelfeTot_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Wölfe werden dir keinen Ärger mehr machen!";
};

FUNC INT Info_Mod_Maleth_WoelfeTot_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Maleth_Wolfsplage))
	&& (Npc_IsDead(Blackwolf_Maleth_01))
	&& (Npc_IsDead(Blackwolf_Maleth_02))
	&& (Npc_IsDead(Blackwolf_Maleth_03))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Maleth_WoelfeTot_Info()
{
	AI_Output(hero, self, "Info_Mod_Maleth_WoelfeTot_15_00"); //Die Wölfe werden dir keinen Ärger mehr machen!
	AI_Output(self, hero, "Info_Mod_Maleth_WoelfeTot_08_01"); //Danke, ich bin dir was schuldig.

	B_LogEntry	(TOPIC_MOD_MALETH_WOLFSPLAGE, "Ich habe die Wölfe getötet und Maleth war glücklich.");
	B_SetTopicStatus	(TOPIC_MOD_MALETH_WOLFSPLAGE, LOG_SUCCESS);

	B_GivePlayerXP	(150);

	B_Göttergefallen(1, 1);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Maleth_Pickpocket (C_INFO)
{
	npc		= Mod_911_BAU_Maleth_NW;
	nr		= 1;
	condition	= Info_Mod_Maleth_Pickpocket_Condition;
	information	= Info_Mod_Maleth_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Maleth_Pickpocket_Condition()
{
	C_Beklauen	(50, ItMi_Gold, 60);
};

FUNC VOID Info_Mod_Maleth_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Maleth_Pickpocket);

	Info_AddChoice	(Info_Mod_Maleth_Pickpocket, DIALOG_BACK, Info_Mod_Maleth_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Maleth_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Maleth_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Maleth_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Maleth_Pickpocket);
};

FUNC VOID Info_Mod_Maleth_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Maleth_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Maleth_Pickpocket);

		Info_AddChoice	(Info_Mod_Maleth_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Maleth_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Maleth_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Maleth_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Maleth_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Maleth_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Maleth_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Maleth_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Maleth_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Maleth_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Maleth_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Maleth_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Maleth_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Maleth_EXIT (C_INFO)
{
	npc		= Mod_911_BAU_Maleth_NW;
	nr		= 1;
	condition	= Info_Mod_Maleth_EXIT_Condition;
	information	= Info_Mod_Maleth_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Maleth_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Maleth_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};