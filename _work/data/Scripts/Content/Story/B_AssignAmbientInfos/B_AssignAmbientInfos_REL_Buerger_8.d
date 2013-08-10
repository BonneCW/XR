// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_REL_Buerger_8_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_REL_Buerger_8_EXIT_Condition;
	information	= DIA_REL_Buerger_8_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_REL_Buerger_8_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_REL_Buerger_8_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

INSTANCE Info_REL_Buerger_8_Rundschreiben (C_INFO) // E1
{
	nr			= 5;
	condition	= Info_REL_Buerger_8_Rundschreiben_Condition;
	information	= Info_REL_Buerger_8_Rundschreiben_Info;
	permanent	= 1;
	description = "Ich hab hier ein Rundschreiben für dich.";
};                       

FUNC INT Info_REL_Buerger_8_Rundschreiben_Condition()
{
	if (Npc_HasItems(hero, ItWr_AnselmRundschreiben) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID Info_REL_Buerger_8_Rundschreiben_Info()
{
	AI_Output(hero, self, "Info_Mod_REL_Buerger_8_Rundschreiben_15_00"); //Ich hab hier ein Rundschreiben für dich.

	B_GiveInvItems	(hero, self, ItWr_AnselmRundschreiben, 1);

	if (Npc_HasItems(hero, ItWr_AnselmRundschreiben) == 0)
	{
		B_GivePlayerXP	(100);
	};
};

INSTANCE Info_REL_Buerger_8_FreudenspenderMachtBlind (C_INFO) // E1
{
	nr			= 6;
	condition	= Info_REL_Buerger_8_FreudenspenderMachtBlind_Condition;
	information	= Info_REL_Buerger_8_FreudenspenderMachtBlind_Info;
	permanent	= 1;
	description = "Du nimmst doch kein Freudenspender?!";
};                       

FUNC INT Info_REL_Buerger_8_FreudenspenderMachtBlind_Condition()
{
	if (Mod_SL_PartBlind == 1)
	&& (self.aivar[AIV_FLUGBLATTVERTEILT] < Wld_GetDay())
	&& (Npc_GetDistToWP(self, "REL_CITY_107") < 3500)
	{
		return TRUE;
	};
};

FUNC VOID Info_REL_Buerger_8_FreudenspenderMachtBlind_Info()
{
	AI_Output(hero, self, "Info_Mod_REL_Buerger_8_FreudenspenderMachtBlind_15_00"); //Du nimmst doch kein Freudenspender?!
	AI_Output(self, hero, "Info_Mod_REL_Buerger_8_FreudenspenderMachtBlind_08_01"); //Doch, natürlich, warum?
	AI_Output(hero, self, "Info_Mod_REL_Buerger_8_FreudenspenderMachtBlind_15_02"); //Von Freudenspender wird man blind.
	AI_Output(self, hero, "Info_Mod_REL_Buerger_8_FreudenspenderMachtBlind_08_03"); //Sind doch nur Gerüchte.
	AI_Output(hero, self, "Info_Mod_REL_Buerger_8_FreudenspenderMachtBlind_15_04"); //Nein wirklich, ich kannte einen, der einen kannte, dessen Schwester kannte einen und von seinem Schwager der Cousin ist durch Freudenspender blind geworden!
	AI_Output(self, hero, "Info_Mod_REL_Buerger_8_FreudenspenderMachtBlind_08_05"); //Ach du Scheiße, ich rühr das Zeug nicht mehr an.

	self.aivar[AIV_FLUGBLATTVERTEILT] = Wld_GetDay();

	Mod_SL_PartBlind_Counter += 1;
};

INSTANCE Info_Mod_REL_Buerger_8_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_REL_Buerger_8_Pickpocket_Condition;
	information	= Info_Mod_REL_Buerger_8_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_REL_Buerger_8_Pickpocket_Condition()
{
	C_Beklauen	(30 + r_max(30), ItMi_Gold, 15 + r_max(5));
};

FUNC VOID Info_Mod_REL_Buerger_8_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_REL_Buerger_8_Pickpocket);

	Info_AddChoice	(Info_Mod_REL_Buerger_8_Pickpocket, DIALOG_BACK, Info_Mod_REL_Buerger_8_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_REL_Buerger_8_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_REL_Buerger_8_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_REL_Buerger_8_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_REL_Buerger_8_Pickpocket);
};

FUNC VOID Info_Mod_REL_Buerger_8_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_REL_Buerger_8_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_REL_Buerger_8_Pickpocket);

		Info_AddChoice	(Info_Mod_REL_Buerger_8_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_REL_Buerger_8_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_REL_Buerger_8_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_REL_Buerger_8_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_REL_Buerger_8_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_REL_Buerger_8_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_REL_Buerger_8_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_REL_Buerger_8_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_REL_Buerger_8_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_REL_Buerger_8_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_REL_Buerger_8_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_REL_Buerger_8_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_REL_Buerger_8_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_REL_Buerger_8 (var c_NPC slf)
{
	DIA_REL_Buerger_8_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_REL_Buerger_8_FreudenspenderMachtBlind.npc				= Hlp_GetInstanceID(slf);
	Info_REL_Buerger_8_Rundschreiben.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_REL_Buerger_8_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
