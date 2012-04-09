// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_BAU_7_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_BAU_7_EXIT_Condition;
	information	= DIA_BAU_7_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BAU_7_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_BAU_7_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_BAU_7_JOIN_Condition;
	information	= DIA_BAU_7_JOIN_Info;
	permanent	= TRUE;
	description = "Was weißt du über die Söldner?";
};                       

FUNC INT DIA_BAU_7_JOIN_Condition()
{
	if (Npc_GetDistToWP(self, "BIGFARM") < 10000)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_7_JOIN_Info()
{	
	AI_Output (hero, self, "DIA_BAU_7_JOIN_15_00"); //Was weißt du über die Söldner?
	AI_Output (self, hero, "DIA_BAU_7_JOIN_07_01"); //Sie sind hier um neue Mitglieder anzuwerben. Nebenbei beschützen sie uns auch noch vor allen möglichen Monstern.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_BAU_7_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_BAU_7_PEOPLE_Condition;
	information	= DIA_BAU_7_PEOPLE_Info;
	permanent	= TRUE;
	description = "Wer hat hier das Sagen?";
};                       

FUNC INT DIA_BAU_7_PEOPLE_Condition()
{
	if (Npc_GetDistToWP(self, "BIGFARM") < 10000)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_7_PEOPLE_Info()
{	
	AI_Output (hero, self, "DIA_BAU_7_PEOPLE_15_00"); //Wer hat hier das Sagen?
	AI_Output (self, hero, "DIA_BAU_7_PEOPLE_07_01"); //Der große Hof gehört Onar. Die kleinen Höfe hier in der Nähe auch. Aber die hat er verpachtet.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_BAU_7_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_BAU_7_LOCATION_Condition;
	information	= DIA_BAU_7_LOCATION_Info;
	permanent	= TRUE;
	description = "Erzähl mir mehr über die Gegend.";
};                       

FUNC INT DIA_BAU_7_LOCATION_Condition()
{
	if (Npc_GetDistToWP(self, "BIGFARM") < 10000)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_7_LOCATION_Info()
{	
	AI_Output (hero, self, "DIA_BAU_7_LOCATION_15_00"); //Erzähl mir mehr über die Gegend.
	AI_Output (self, hero, "DIA_BAU_7_LOCATION_07_01"); //Der große Hof hier im Osten des Tals ist der von Onar, der Hof von Sekob liegt im Norden.
	AI_Output (self, hero, "DIA_BAU_7_LOCATION_07_02"); //Und Bengars Hof liegt auf der Hochebene im Südwesten. Du kannst sie vom Tal aus erreichen - es gibt eine große Steintreppe dorthin.
};

INSTANCE Info_Mod_BAU_7_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_BAU_7_Pickpocket_Condition;
	information	= Info_Mod_BAU_7_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20;
};

FUNC INT Info_Mod_BAU_7_Pickpocket_Condition()
{
	C_Beklauen	(20, ItMi_Gold, 50);
};

FUNC VOID Info_Mod_BAU_7_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_BAU_7_Pickpocket);

	Info_AddChoice	(Info_Mod_BAU_7_Pickpocket, DIALOG_BACK, Info_Mod_BAU_7_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_BAU_7_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_BAU_7_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_BAU_7_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_BAU_7_Pickpocket);
};

FUNC VOID Info_Mod_BAU_7_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_BAU_7_Pickpocket);
};

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_BAU_7 (var c_NPC slf)
{
	DIA_BAU_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_7_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_7_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_7_LOCATION.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_BAU_7_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
