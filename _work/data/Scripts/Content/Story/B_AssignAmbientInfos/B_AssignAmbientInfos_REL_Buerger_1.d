// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_REL_Buerger_1_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_REL_Buerger_1_EXIT_Condition;
	information	= DIA_REL_Buerger_1_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_REL_Buerger_1_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_REL_Buerger_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

INSTANCE Info_REL_Buerger_1_Rundschreiben (C_INFO) // E1
{
	nr			= 5;
	condition	= Info_REL_Buerger_1_Rundschreiben_Condition;
	information	= Info_REL_Buerger_1_Rundschreiben_Info;
	permanent	= 1;
	description = "Ich hab hier ein Rundschreiben für dich.";
};                       

FUNC INT Info_REL_Buerger_1_Rundschreiben_Condition()
{
	if (Npc_HasItems(hero, ItWr_AnselmRundschreiben) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID Info_REL_Buerger_1_Rundschreiben_Info()
{
	AI_Output(hero, self, "Info_Mod_REL_Buerger_1_Rundschreiben_15_00"); //Ich hab hier ein Rundschreiben für dich.

	B_GiveInvItems	(hero, self, ItWr_AnselmRundschreiben, 1);

	if (Npc_HasItems(hero, ItWr_AnselmRundschreiben) == 0)
	{
		B_GivePlayerXP	(100);
	};
};

INSTANCE Info_REL_Buerger_1_FreudenspenderMachtBlind (C_INFO) // E1
{
	nr			= 6;
	condition	= Info_REL_Buerger_1_FreudenspenderMachtBlind_Condition;
	information	= Info_REL_Buerger_1_FreudenspenderMachtBlind_Info;
	permanent	= 1;
	description = "Du nimmst Freudenspender?";
};                       

FUNC INT Info_REL_Buerger_1_FreudenspenderMachtBlind_Condition()
{
	if (Mod_SL_PartBlind == 1)
	&& (self.aivar[AIV_FLUGBLATTVERTEILT] < Wld_GetDay())
	&& (Npc_GetDistToWP(self, "REL_CITY_107") < 3500)
	{
		return TRUE;
	};
};

FUNC VOID Info_REL_Buerger_1_FreudenspenderMachtBlind_Info()
{
	AI_Output(hero, self, "Info_Mod_REL_Buerger_1_FreudenspenderMachtBlind_15_00"); //Du nimmst Freudenspender?
	AI_Output(self, hero, "Info_Mod_REL_Buerger_1_FreudenspenderMachtBlind_01_01"); //Ja ...
	AI_Output(hero, self, "Info_Mod_REL_Buerger_1_FreudenspenderMachtBlind_15_02"); //Hast du keine Angst?
	AI_Output(self, hero, "Info_Mod_REL_Buerger_1_FreudenspenderMachtBlind_01_03"); //Wovor?
	AI_Output(hero, self, "Info_Mod_REL_Buerger_1_FreudenspenderMachtBlind_15_04"); //Na du weißt doch ... Freudenspender macht blind.
	AI_Output(self, hero, "Info_Mod_REL_Buerger_1_FreudenspenderMachtBlind_01_05"); //Was??? Das Scheißzeug!

	self.aivar[AIV_FLUGBLATTVERTEILT] = Wld_GetDay();

	Mod_SL_PartBlind_Counter += 1;
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_REL_Buerger_1_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_REL_Buerger_1_PEOPLE_Condition;
	information	= DIA_REL_Buerger_1_PEOPLE_Info;
	permanent	= TRUE;
	description = "Wer sind hier die wichtigen Persönlichkeiten?";
};                       

FUNC INT DIA_REL_Buerger_1_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_REL_Buerger_1_PEOPLE_Info()
{	
	AI_Output (hero, self, "DIA_REL_Buerger_1_PEOPLE_15_00"); //Wer sind hier die wichtigen Persönlichkeiten?
	AI_Output (self, hero, "DIA_REL_Buerger_1_PEOPLE_01_01"); //Anselm ist hier der Stadthalter. Er sorgt hier auch für Recht und Ordnung.
	AI_Output (self, hero, "DIA_REL_Buerger_1_PEOPLE_01_02"); //Außerdem gibt es noch Robert, den besten Schmied im Lande.
};

INSTANCE Info_Mod_REL_Buerger_1_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_REL_Buerger_1_Pickpocket_Condition;
	information	= Info_Mod_REL_Buerger_1_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_REL_Buerger_1_Pickpocket_Condition()
{
	C_Beklauen	(43, ItMi_Gold, 90);
};

FUNC VOID Info_Mod_REL_Buerger_1_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_REL_Buerger_1_Pickpocket);

	Info_AddChoice	(Info_Mod_REL_Buerger_1_Pickpocket, DIALOG_BACK, Info_Mod_REL_Buerger_1_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_REL_Buerger_1_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_REL_Buerger_1_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_REL_Buerger_1_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_REL_Buerger_1_Pickpocket);
};

FUNC VOID Info_Mod_REL_Buerger_1_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_REL_Buerger_1_Pickpocket);
};

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_REL_Buerger_1 (var c_NPC slf)
{
	DIA_REL_Buerger_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_REL_Buerger_1_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	Info_REL_Buerger_1_FreudenspenderMachtBlind.npc				= Hlp_GetInstanceID(slf);
	Info_REL_Buerger_1_Rundschreiben.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_REL_Buerger_1_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
