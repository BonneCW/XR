INSTANCE Info_Mod_Khaled_Hi (C_INFO)
{
	npc		= Mod_788_SLD_Khaled_MT;
	nr		= 1;
	condition	= Info_Mod_Khaled_Hi_Condition;
	information	= Info_Mod_Khaled_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Khaled_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Khaled_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Khaled_Hi_11_00"); //Halt, nur Söldner und Schürfer dürfen hinein.

	hero.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(hero, Khaled_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};

INSTANCE Info_Mod_Khaled_Sumpfi (C_INFO)
{
	npc		= Mod_788_SLD_Khaled_MT;
	nr		= 1;
	condition	= Info_Mod_Khaled_Sumpfi_Condition;
	information	= Info_Mod_Khaled_Sumpfi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Da drinnen sitzt aber einer vom Sumpflager.";
};

FUNC INT Info_Mod_Khaled_Sumpfi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Khaled_Sumpfi_Info()
{
	AI_Output(hero, self, "Info_Mod_Khaled_Sumpfi_15_00"); //Da drinnen sitzt aber einer vom Sumpflager.
	AI_Output(self, hero, "Info_Mod_Khaled_Sumpfi_11_01"); //Ist mir doch egal, ich bin nur dafür zuständig aufzupassen, dass nur Leute hineinkommen, die auch hineindürfen.
	AI_Output(hero, self, "Info_Mod_Khaled_Sumpfi_15_02"); //Aber wie ...
	AI_Output(self, hero, "Info_Mod_Khaled_Sumpfi_11_03"); //Interessiert mich nicht. Seitdem ich hier Wache schiebe, ist keiner reingekommen, der nicht auch hinein dürfte.
};

INSTANCE Info_Mod_Khaled_Soeldner (C_INFO)
{
	npc		= Mod_788_SLD_Khaled_MT;
	nr		= 1;
	condition	= Info_Mod_Khaled_Soeldner_Condition;
	information	= Info_Mod_Khaled_Soeldner_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich bin Söldner.";
};

FUNC INT Info_Mod_Khaled_Soeldner_Condition()
{
	if (hero.guild == GIL_MIL)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Khaled_Soeldner_Info()
{
	AI_Output(hero, self, "Info_Mod_Khaled_Soeldner_15_00"); //Ich bin Söldner.
	AI_Output(self, hero, "Info_Mod_Khaled_Soeldner_11_01"); //Ist ok, du darfst hinein.

	self.aivar[AIV_PASSGATE] = TRUE;
};

INSTANCE Info_Mod_Khaled_KenneLee (C_INFO)
{
	npc		= Mod_788_SLD_Khaled_MT;
	nr		= 1;
	condition	= Info_Mod_Khaled_KenneLee_Condition;
	information	= Info_Mod_Khaled_KenneLee_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich kenne Lee von früher.";
};

FUNC INT Info_Mod_Khaled_KenneLee_Condition()
{
	if (hero.guild != GIL_MIL)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Khaled_KenneLee_Info()
{
	AI_Output(hero, self, "Info_Mod_Khaled_KenneLee_15_00"); //Ich kenne Lee von früher.
	AI_Output(self, hero, "Info_Mod_Khaled_KenneLee_11_01"); //Klar, das kann ja jeder sagen. Ohne seine ausdrückliche Erlaubnis kommst du hier nicht rein.

	Log_CreateTopic	(TOPIC_MOD_NLINKNEIPE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_NLINKNEIPE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_NLINKNEIPE, "Solange ich nicht Söldner oder Schürfer bin, brauche ich die ausdrückliche Erlaubnis von Lee, um in die Kneipe des Neuen Lagers zu kommen.");
};

INSTANCE Info_Mod_Khaled_KenneLee2 (C_INFO)
{
	npc		= Mod_788_SLD_Khaled_MT;
	nr		= 1;
	condition	= Info_Mod_Khaled_KenneLee2_Condition;
	information	= Info_Mod_Khaled_KenneLee2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich bin nun Schürfer. Hier der Nachweis.";
};

FUNC INT Info_Mod_Khaled_KenneLee2_Condition()
{
	if (Npc_HasItems(hero, ItWr_LeeInKneipe) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Khaled_KenneLee2_Info()
{
	AI_Output(hero, self, "Info_Mod_Khaled_KenneLee2_15_00"); //Ich bin nun Schürfer. Hier der Nachweis.
	AI_Output(self, hero, "Info_Mod_Khaled_KenneLee2_11_01"); //Lass mal sehen.

	B_GiveInvItems	(hero, self, ItWr_LeeInKneipe, 1);

	B_USEFAKESCROLL();

	AI_Output(self, hero, "Info_Mod_Khaled_KenneLee2_11_02"); //Hmm, tatsächlich, du hast deine Spitzhacke für uns geschwungen.
	AI_Output(self, hero, "Info_Mod_Khaled_KenneLee2_11_03"); //Okey, du darfst rein. Viel Spaß.

	B_SetTopicStatus	(TOPIC_MOD_NLINKNEIPE, LOG_SUCCESS);

	B_GivePlayerXP	(50);

	self.aivar[AIV_PASSGATE] = TRUE;
};

const string Khaled_Checkpoint	= "NC_TAVERN_IN";	//WP hinter City-Tor vom Spielstart aus!

instance Info_Mod_Khaled_FirstWarn (C_INFO)
{
	npc		= Mod_788_SLD_Khaled_MT;
	nr		= 1;
	condition	= Info_Mod_Khaled_FirstWarn_Condition;
	information	= Info_Mod_Khaled_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int Info_Mod_Khaled_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(hero, Khaled_Checkpoint) <= 700) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	
	if ((self.aivar[AIV_Guardpassage_Status] == GP_NONE)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)	== TRUE)
	&& (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void Info_Mod_Khaled_FirstWarn_Info()
{
	AI_Output (self, hero,"Info_Mod_Khaled_FirstWarn_11_00"); //HALT!

	hero.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(hero, Khaled_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE Info_Mod_Khaled_SecondWarn (C_INFO)
{
	npc		= Mod_788_SLD_Khaled_MT;
	nr		= 1;
	condition	= Info_Mod_Khaled_SecondWarn_Condition;
	information	= Info_Mod_Khaled_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT Info_Mod_Khaled_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE) 
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)	== TRUE)
	&& (Npc_GetDistToWP(hero, Khaled_Checkpoint) < (hero.aivar[AIV_LastDistToWP]-50))) 
	{
		return TRUE;
	};
};

func void Info_Mod_Khaled_SecondWarn_Info()
{
	AI_Output (self, hero,"Info_Mod_Khaled_SecondWarn_11_00"); //Ich sag's dir zum letzten Mal. Einen Schritt weiter und du begibst dich in die Welt des Schmerzes!

	hero.aivar[AIV_LastDistToWP] = Npc_GetDistToWP (hero,Khaled_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE Info_Mod_Khaled_Attack (C_INFO)
{
	npc		= Mod_788_SLD_Khaled_MT;
	nr		= 1;
	condition	= Info_Mod_Khaled_Attack_Condition;
	information	= Info_Mod_Khaled_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT Info_Mod_Khaled_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE) 
	&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE)
	&& (Npc_GetDistToWP(hero,Khaled_Checkpoint) < (hero.aivar[AIV_LastDistToWP]-50)))
	{
		return TRUE;
	};
};

func void Info_Mod_Khaled_Attack_Info()
{
	hero.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, hero,"Info_Mod_Khaled_Attack_11_00"); //Du hast es so gewollt ...

	AI_StopProcessInfos	(self);	

	B_Attack (self, hero, AR_GuardStopsIntruder, 0); 
};

INSTANCE Info_Mod_Khaled_Pickpocket (C_INFO)
{
	npc		= Mod_788_SLD_Khaled_MT;
	nr		= 1;
	condition	= Info_Mod_Khaled_Pickpocket_Condition;
	information	= Info_Mod_Khaled_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Khaled_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 430);
};

FUNC VOID Info_Mod_Khaled_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Khaled_Pickpocket);

	Info_AddChoice	(Info_Mod_Khaled_Pickpocket, DIALOG_BACK, Info_Mod_Khaled_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Khaled_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Khaled_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Khaled_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Khaled_Pickpocket);
};

FUNC VOID Info_Mod_Khaled_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Khaled_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Khaled_Pickpocket);

		Info_AddChoice	(Info_Mod_Khaled_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Khaled_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Khaled_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Khaled_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Khaled_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Khaled_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Khaled_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Khaled_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Khaled_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Khaled_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Khaled_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Khaled_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Khaled_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Khaled_EXIT (C_INFO)
{
	npc		= Mod_788_SLD_Khaled_MT;
	nr		= 1;
	condition	= Info_Mod_Khaled_EXIT_Condition;
	information	= Info_Mod_Khaled_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Khaled_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Khaled_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};