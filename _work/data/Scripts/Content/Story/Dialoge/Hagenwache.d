instance Info_Mod_HagenWache_Larius (C_INFO)
{
	npc		= Mod_1236_RIT_Torwache_NW;
	nr		= 1;
	condition	= Info_Mod_HagenWache_Larius_Condition;
	information	= Info_Mod_HagenWache_Larius_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich muss dringend zu Larius.";
};                       

func int Info_Mod_HagenWache_Larius_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Nefarius_VierErbauer))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Larius_Ornament))
	{
		return TRUE;
	};
};

func void Info_Mod_HagenWache_Larius_Info()
{
	AI_Output (hero, self, "Info_Mod_HagenWache_Larius_15_00"); //Ich muss dringend zu Larius.
	AI_Output (self, hero, "Info_Mod_HagenWache_Larius_09_01"); //Läuft hier im Viertel rum. Aber weiß nicht, wo. Musste gucken.
};

const string HagenWache_Checkpoint	= "NW_CITY_CITYHALL_IN";	//WP hinter City-Tor vom Spielstart aus!

instance Info_Mod_HagenWache_FirstWarn (C_INFO)
{
	npc		= Mod_1236_RIT_Torwache_NW;
	nr		= 1;
	condition	= Info_Mod_HagenWache_FirstWarn_Condition;
	information	= Info_Mod_HagenWache_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int Info_Mod_HagenWache_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(hero, HagenWache_Checkpoint) <= 500) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};

	if (Kapitel >= 2) {
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

func void Info_Mod_HagenWache_FirstWarn_Info()
{
	AI_Output (self, hero, "Info_Mod_HagenWache_FirstWarn_09_00"); //(lispelt) Hier kein Zugang!
	AI_Output (hero, self, "Info_Mod_HagenWache_FirstWarn_15_01"); //Was ist das für ein Gebäude?
	AI_Output (self, hero, "Info_Mod_HagenWache_FirstWarn_09_02"); //(lispelt) Ist Lord Hagen drinne. Nur Ritter und Paladine dürfen zu ihm.
	AI_Output (hero, self, "Info_Mod_HagenWache_FirstWarn_15_03"); //Kannst du keine Ausnahme machen?
	AI_Output (self, hero, "Info_Mod_HagenWache_FirstWarn_09_04"); //(entschuldigend) Nee, geht nicht. Nur wenn Lord Hagen sagt, kann ich Ausnahme machen.

	hero.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(hero, HagenWache_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE Info_Mod_HagenWache_SecondWarn (C_INFO)
{
	npc		= Mod_1236_RIT_Torwache_NW;
	nr		= 1;
	condition	= Info_Mod_HagenWache_SecondWarn_Condition;
	information	= Info_Mod_HagenWache_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT Info_Mod_HagenWache_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE) 
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)	== TRUE)
	&& (Npc_GetDistToWP(hero, HagenWache_Checkpoint) < (hero.aivar[AIV_LastDistToWP]-50))) 
	{
		return TRUE;
	};
};

func void Info_Mod_HagenWache_SecondWarn_Info()
{
	AI_Output (self, hero,"Info_Mod_HagenWache_SecondWarn_09_00"); //He! Nicht nett! Geh wieder weg!

	hero.aivar[AIV_LastDistToWP] = Npc_GetDistToWP (hero,HagenWache_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE Info_Mod_HagenWache_Attack (C_INFO)
{
	npc		= Mod_1236_RIT_Torwache_NW;
	nr		= 1;
	condition	= Info_Mod_HagenWache_Attack_Condition;
	information	= Info_Mod_HagenWache_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT Info_Mod_HagenWache_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE) 
	&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE)
	&& (Npc_GetDistToWP(hero,HagenWache_Checkpoint) < (hero.aivar[AIV_LastDistToWP]-50)))
	{
		return TRUE;
	};
};

func void Info_Mod_HagenWache_Attack_Info()
{
	hero.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, hero,"Info_Mod_HagenWache_Attack_09_00"); //(lispelt) Das darfst du nicht. Ich muss dich jetzt verhauen.

	AI_StopProcessInfos	(self);	

	B_Attack (self, hero, AR_GuardStopsIntruder, 0); 
};

INSTANCE Info_Mod_HagenWache_Pickpocket (C_INFO)
{
	npc		= Mod_1236_RIT_Torwache_NW;
	nr		= 1;
	condition	= Info_Mod_HagenWache_Pickpocket_Condition;
	information	= Info_Mod_HagenWache_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_HagenWache_Pickpocket_Condition()
{
	C_Beklauen	(57, ItMi_Gold, 17);
};

FUNC VOID Info_Mod_HagenWache_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_HagenWache_Pickpocket);

	Info_AddChoice	(Info_Mod_HagenWache_Pickpocket, DIALOG_BACK, Info_Mod_HagenWache_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_HagenWache_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_HagenWache_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_HagenWache_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_HagenWache_Pickpocket);
};

FUNC VOID Info_Mod_HagenWache_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_HagenWache_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_HagenWache_Pickpocket);

		Info_AddChoice	(Info_Mod_HagenWache_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_HagenWache_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_HagenWache_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_HagenWache_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_HagenWache_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_HagenWache_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_HagenWache_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_HagenWache_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_HagenWache_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_HagenWache_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_HagenWache_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_HagenWache_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_HagenWache_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_HagenWache_EXIT (C_INFO)
{
	npc		= Mod_1236_RIT_Torwache_NW;
	nr		= 1;
	condition	= Info_Mod_HagenWache_EXIT_Condition;
	information	= Info_Mod_HagenWache_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_HagenWache_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HagenWache_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};