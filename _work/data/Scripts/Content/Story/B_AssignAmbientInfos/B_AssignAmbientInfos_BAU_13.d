// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_BAU_13_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_BAU_13_EXIT_Condition;
	information	= DIA_BAU_13_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BAU_13_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_13_EXIT_Info()
{	
	AI_Output(self, hero, "DIA_BAU_13_EXIT_13_00"); //Saftiges Korn solle auf deinen Feldern wachsen.

	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_BAU_13_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_BAU_13_JOIN_Condition;
	information	= DIA_BAU_13_JOIN_Info;
	permanent	= TRUE;
	description = "Ich will mehr über die Söldner wissen!";
};                       

FUNC INT DIA_BAU_13_JOIN_Condition()
{
	if (Npc_GetDistToWP(self, "BIGFARM") < 10000)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_13_JOIN_Info()
{	
	AI_Output (hero, self, "DIA_BAU_13_JOIN_15_00"); //Ich will mehr über die Söldner wissen!
	AI_Output (self, hero, "DIA_BAU_13_JOIN_13_01"); //Wenn du mal Ärger mit ihnen hast, geh zu Lares. Das machen wir Bauern auch so. Er ist sehr hart zu seinen Leuten.
	AI_Output (self, hero, "DIA_BAU_13_JOIN_13_02"); //Wenn sich einer von ihnen nicht benimmt, nimmt er ihn sich zur Brust.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_BAU_13_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_BAU_13_PEOPLE_Condition;
	information	= DIA_BAU_13_PEOPLE_Info;
	permanent	= TRUE;
	description = "Wer hat hier das Sagen?";
};                       

FUNC INT DIA_BAU_13_PEOPLE_Condition()
{
	if (Npc_GetDistToWP(self, "BIGFARM") < 10000)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_13_PEOPLE_Info()
{	
	AI_Output (hero, self, "DIA_BAU_13_PEOPLE_15_00"); //Wer hat hier das Sagen?
	AI_Output (self, hero, "DIA_BAU_13_PEOPLE_13_01"); //Onar ist der Boss.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_BAU_13_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_BAU_13_LOCATION_Condition;
	information	= DIA_BAU_13_LOCATION_Info;
	permanent	= TRUE;
	description = "Was kannst du mir über die Gegend hier erzählen?";
};                       

FUNC INT DIA_BAU_13_LOCATION_Condition()
{
	if (Npc_GetDistToWP(self, "BIGFARM") < 10000)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_13_LOCATION_Info()
{	
	AI_Output (hero, self, "DIA_BAU_13_LOCATION_15_00"); //Was kannst du mir über die Gegend hier erzählen?
	AI_Output (self, hero, "DIA_BAU_13_LOCATION_13_01"); //Es gibt drei Höfe hier. Onars im Osten und Sekobs im Norden das Tals.
	AI_Output (self, hero, "DIA_BAU_13_LOCATION_13_02"); //Im Südwesten gibt es einen Aufgang zur Hochebene. Dort liegt Bengars Hof.
};

INSTANCE Info_Mod_BAU_13_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_BAU_13_Pickpocket_Condition;
	information	= Info_Mod_BAU_13_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20;
};

FUNC INT Info_Mod_BAU_13_Pickpocket_Condition()
{
	C_Beklauen	(15, ItMi_Gold, 30);
};

FUNC VOID Info_Mod_BAU_13_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_BAU_13_Pickpocket);

	Info_AddChoice	(Info_Mod_BAU_13_Pickpocket, DIALOG_BACK, Info_Mod_BAU_13_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_BAU_13_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_BAU_13_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_BAU_13_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_BAU_13_Pickpocket);
};

FUNC VOID Info_Mod_BAU_13_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_BAU_13_Pickpocket);
};

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_BAU_13 (var c_NPC slf)
{
	DIA_BAU_13_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_13_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_13_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_13_LOCATION.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_BAU_13_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
