// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_MIL_6_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_MIL_6_EXIT_Condition;
	information	= DIA_MIL_6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_MIL_6_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_MIL_6_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_MIL_6_JOIN_Condition;
	information	= DIA_MIL_6_JOIN_Info;
	permanent	= TRUE;
	description = "Was muß ich tun, um mich der Miliz anzuschließen?";
};                       

FUNC INT DIA_MIL_6_JOIN_Condition()
{
	if (Mod_Gilde == 0)
	{
		return TRUE;
	};
};

FUNC VOID DIA_MIL_6_JOIN_Info()
{	
	AI_Output (hero, self, "DIA_MIL_6_JOIN_15_00"); //Was muss ich tun, um mich der Miliz anzuschließen?
	AI_Output (self, hero, "DIA_MIL_6_JOIN_06_01"); //Geh zu Lord Andre und rede mit ihm. Er kümmert sich um die Neulinge.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_MIL_6_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_MIL_6_PEOPLE_Condition;
	information	= DIA_MIL_6_PEOPLE_Info;
	permanent	= TRUE;
	description = "Erzähl mir etwas über die Paladine.";
};                       

FUNC INT DIA_MIL_6_PEOPLE_Condition()
{
	if (Mod_Gilde != 3)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_MIL_6_PEOPLE_Info()
{	
	AI_Output (hero, self, "DIA_MIL_6_PEOPLE_15_00"); //Erzähl mir etwas über die Paladine.
	AI_Output (self, hero, "DIA_MIL_6_PEOPLE_06_01"); //Sie kontrollieren die ganze Stadt. Vor allem das obere Viertel wird streng überwacht.
	AI_Output (self, hero, "DIA_MIL_6_PEOPLE_06_02"); //Sie lassen da niemanden mehr rein. Außer die Bürger der Stadt und die Miliz natürlich.
	AI_Output (self, hero, "DIA_MIL_6_PEOPLE_06_03"); //Es gibt auch noch einige Paladine am Hafen, die das Schiff bewachen. Aber die sind alles andere als gesprächig.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_MIL_6_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_MIL_6_LOCATION_Condition;
	information	= DIA_MIL_6_LOCATION_Info;
	permanent	= TRUE;
	description = "Was gibt es über diese Stadt zu wissen?";
};                       

FUNC INT DIA_MIL_6_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_6_LOCATION_Info()
{	
	AI_Output (hero, self, "DIA_MIL_6_LOCATION_15_00"); //Was gibt es über diese Stadt zu wissen?
	AI_Output (self, hero, "DIA_MIL_6_LOCATION_06_01"); //Die Paladine haben die Kontrolle über die ganze Stadt. Die gesamte Miliz untersteht ihnen.
	AI_Output (self, hero, "DIA_MIL_6_LOCATION_06_02"); //Der Kommandant der Miliz ist Lord Andre, er übt auch gleichzeitig das Amt des Richters aus.
	AI_Output (self, hero, "DIA_MIL_6_LOCATION_06_03"); //Wenn du jemals mit dem Gesetz in Konflikt geraten solltest, wirst du dich vor ihm rechtfertigen müssen.
	AI_Output (self, hero, "DIA_MIL_6_LOCATION_06_04"); //Aber er ist recht gnädig, nach allem, was man hört. Die meisten Fälle lässt er mit einer Geldstrafe davonkommen.
	
};

INSTANCE Info_Mod_MIL_6_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_MIL_6_Pickpocket_Condition;
	information	= Info_Mod_MIL_6_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_MIL_6_Pickpocket_Condition()
{
	C_Beklauen	(50, ItMi_Gold, 130);
};

FUNC VOID Info_Mod_MIL_6_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_MIL_6_Pickpocket);

	Info_AddChoice	(Info_Mod_MIL_6_Pickpocket, DIALOG_BACK, Info_Mod_MIL_6_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_MIL_6_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_MIL_6_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_MIL_6_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_MIL_6_Pickpocket);
};

FUNC VOID Info_Mod_ML_6_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_ML_6_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_ML_6_Pickpocket);

		Info_AddChoice	(Info_Mod_ML_6_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_ML_6_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_ML_6_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_ML_6_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_ML_6_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_ML_6_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_ML_6_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_ML_6_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_ML_6_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_ML_6_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_ML_6_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_ML_6_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_ML_6_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_MIL_6 (var c_NPC slf)
{
	DIA_MIL_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_MIL_6_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_MIL_6_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_MIL_6_LOCATION.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_MIL_6_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
