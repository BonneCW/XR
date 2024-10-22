INSTANCE Info_Mod_HofstaatTuersteher_Hi (C_INFO)
{
	npc		= Mod_7020_HS_Tuersteher_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatTuersteher_Hi_Condition;
	information	= Info_Mod_HofstaatTuersteher_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatTuersteher_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HofstaatTuersteher_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatTuersteher_Hi_05_00"); //Hey! Du kannst hier nicht durch!
	AI_Output(hero, self, "Info_Mod_HofstaatTuersteher_Hi_15_01"); //Warum nicht?
	AI_Output(self, hero, "Info_Mod_HofstaatTuersteher_Hi_05_02"); //Nur Angehörige des Hofstaats dürfen da rein!
	AI_Output(hero, self, "Info_Mod_HofstaatTuersteher_Hi_15_03"); //Hofstaat?
	AI_Output(self, hero, "Info_Mod_HofstaatTuersteher_Hi_05_04"); //Ja, Mann! Der Pöbel hat in der Burg nichts verloren!
	AI_Output(hero, self, "Info_Mod_HofstaatTuersteher_Hi_15_05"); //Und wie werde ich Mitglied des Hofstaates?
	AI_Output(self, hero, "Info_Mod_HofstaatTuersteher_Hi_05_06"); //Da musst du zuerst mal die Staatsbürgerschaft für unser Reich hier erhalten.
	AI_Output(hero, self, "Info_Mod_HofstaatTuersteher_Hi_15_07"); //Wie werde ich Staatsbürger?
	AI_Output(self, hero, "Info_Mod_HofstaatTuersteher_Hi_05_08"); //Du hast zwei Möglichkeiten: Heirate eine aus unserer Mitte oder eröffne einen Laden.
	AI_Output(self, hero, "Info_Mod_HofstaatTuersteher_Hi_05_09"); //Ach ja, falls du vorhast zu heiraten, würd ich mich nicht an die Bauern halten.
	AI_Output(hero, self, "Info_Mod_HofstaatTuersteher_Hi_15_10"); //Warum nicht?
	AI_Output(self, hero, "Info_Mod_HofstaatTuersteher_Hi_05_11"); //Bauern sind nur Pöbel! Du wirst dann zwar als Pöbel angesehen, doch nicht als Mitglied des Staates. Dazu müsstest du mit der Bäuerin in ein Haus ziehen ...

	B_LogEntry	(TOPIC_MOD_SEKTE_FREUDENSPENDER, "Der Türsteher des Schlosses sagt, dass ich es erst betreten darf, wenn ich Mitglied des Hofstaates bin. Um das zu erreichen, hab ich zwei Möglichkeiten: Ich heirate eine Hofstaatlerin oder ich eröffne einen Laden. Sollte ich jedoch eine Bäuerin heiraten, dann muss ich mit ihr noch in die Burg ziehen.");
};

INSTANCE Info_Mod_HofstaatTuersteher_NachFest (C_INFO)
{
	npc		= Mod_7020_HS_Tuersteher_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatTuersteher_NachFest_Condition;
	information	= Info_Mod_HofstaatTuersteher_NachFest_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatTuersteher_NachFest_Condition()
{
	if (Mod_SL_KingAtSwamp == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatTuersteher_NachFest_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatTuersteher_NachFest_05_00"); //Hey, du bist doch der königliche Bademeister? Der König sucht nach dir.

	Log_CreateTopic	(TOPIC_MOD_SEKTE_KING, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SEKTE_KING, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SEKTE_KING, "Der Türsteher meint, dass der König nach mir sucht. Ich sollte mal bei ihm vorbei schauen.");

	AI_StopProcessInfos	(self);
};

const string HofstaatTuersteher_Checkpoint	= "REL_277";	//WP hinter City-Tor vom Spielstart aus!

instance Info_Mod_HofstaatTuersteher_FirstWarn (C_INFO)
{
	npc		= Mod_7020_HS_Tuersteher_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatTuersteher_FirstWarn_Condition;
	information	= Info_Mod_HofstaatTuersteher_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int Info_Mod_HofstaatTuersteher_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(hero, HofstaatTuersteher_Checkpoint) <= 500) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	
	if ((self.aivar[AIV_Guardpassage_Status] == GP_NONE)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)	== TRUE)
	&& (Npc_RefuseTalk(self) == FALSE))
	&& ((!Npc_KnowsInfo(hero, Info_Mod_Esteban_AtVM))
	|| (Npc_KnowsInfo(hero, Info_Mod_Esteban_AtVM4)))
	{
		return TRUE;
	};
};

func void Info_Mod_HofstaatTuersteher_FirstWarn_Info()
{
	AI_Output (self, hero,"Info_Mod_HofstaatTuersteher_FirstWarn_05_00"); //HALT! Du darfst hier noch nicht rein.

	hero.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(hero, HofstaatTuersteher_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE Info_Mod_HofstaatTuersteher_SecondWarn (C_INFO)
{
	npc		= Mod_7020_HS_Tuersteher_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatTuersteher_SecondWarn_Condition;
	information	= Info_Mod_HofstaatTuersteher_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT Info_Mod_HofstaatTuersteher_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE) 
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)	== TRUE)
	&& (Npc_GetDistToWP(hero, HofstaatTuersteher_Checkpoint) < (hero.aivar[AIV_LastDistToWP]-50))) 
	{
		return TRUE;
	};
};

func void Info_Mod_HofstaatTuersteher_SecondWarn_Info()
{
	AI_Output (self, hero,"Info_Mod_HofstaatTuersteher_SecondWarn_05_00"); //Ich sag's dir zum letzten Mal. Einen Schritt weiter und du begibst dich in die Welt des Schmerzes!

	hero.aivar[AIV_LastDistToWP] = Npc_GetDistToWP (hero,HofstaatTuersteher_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE Info_Mod_HofstaatTuersteher_Attack (C_INFO)
{
	npc		= Mod_7020_HS_Tuersteher_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatTuersteher_Attack_Condition;
	information	= Info_Mod_HofstaatTuersteher_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT Info_Mod_HofstaatTuersteher_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE) 
	&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE)
	&& (Npc_GetDistToWP(hero,HofstaatTuersteher_Checkpoint) < (hero.aivar[AIV_LastDistToWP]-50)))
	{
		return TRUE;
	};
};

func void Info_Mod_HofstaatTuersteher_Attack_Info()
{
	hero.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, hero,"Info_Mod_HofstaatTuersteher_Attack_05_00"); //Du hast es so gewollt ...

	AI_StopProcessInfos	(self);	

	B_Attack (self, hero, AR_GuardStopsIntruder, 0); 
};

INSTANCE Info_Mod_HofstaatTuersteher_Pickpocket (C_INFO)
{
	npc		= Mod_7020_HS_Tuersteher_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatTuersteher_Pickpocket_Condition;
	information	= Info_Mod_HofstaatTuersteher_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_HofstaatTuersteher_Pickpocket_Condition()
{
	C_Beklauen	(75, ItMi_Gold, 28);
};

FUNC VOID Info_Mod_HofstaatTuersteher_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_HofstaatTuersteher_Pickpocket);

	Info_AddChoice	(Info_Mod_HofstaatTuersteher_Pickpocket, DIALOG_BACK, Info_Mod_HofstaatTuersteher_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_HofstaatTuersteher_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_HofstaatTuersteher_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_HofstaatTuersteher_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_HofstaatTuersteher_Pickpocket);
};

FUNC VOID Info_Mod_HofstaatTuersteher_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_HofstaatTuersteher_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_HofstaatTuersteher_Pickpocket);

		Info_AddChoice	(Info_Mod_HofstaatTuersteher_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_HofstaatTuersteher_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_HofstaatTuersteher_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_HofstaatTuersteher_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_HofstaatTuersteher_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_HofstaatTuersteher_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_HofstaatTuersteher_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_HofstaatTuersteher_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_HofstaatTuersteher_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_HofstaatTuersteher_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_HofstaatTuersteher_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_HofstaatTuersteher_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_HofstaatTuersteher_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_HofstaatTuersteher_EXIT (C_INFO)
{
	npc		= Mod_7020_HS_Tuersteher_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatTuersteher_EXIT_Condition;
	information	= Info_Mod_HofstaatTuersteher_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_HofstaatTuersteher_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HofstaatTuersteher_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};