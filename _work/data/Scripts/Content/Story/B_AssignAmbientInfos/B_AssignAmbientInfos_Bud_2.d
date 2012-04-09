// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Bud_2_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Bud_2 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Bud_2_EXIT_Condition;
	information	= Info_Bud_2_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
};                       

FUNC INT Info_Bud_2_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Bud_2_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Bud_2_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Bud_2_EinerVonEuchWerden_Condition;
	information	= Info_Bud_2_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Ich will bei euch mitmachen.";
};                       

FUNC INT Info_Bud_2_EinerVonEuchWerden_Condition()
{
	if (Schatten_Dabei == FALSE)
	&& (Gardist_Dabei == FALSE)
	&& (Erzbaron_Dabei == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Bud_2_EinerVonEuchWerden_Info()
{
	AI_Output(hero,self,"Info_Bud_2_EinerVonEuchWerden_15_00"); //Ich will bei euch mitmachen.
	AI_Output(self,hero,"Info_Bud_2_EinerVonEuchWerden_02_01"); //Einer wie du kann schon bald in der Burg leben.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Bud_2_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Bud_2_WichtigePersonen_Condition;
	information	= Info_Bud_2_WichtigePersonen_Info;
	permanent	= 1;
	description = "Wer hat hier das Sagen?";
};                       

FUNC INT Info_Bud_2_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Bud_2_WichtigePersonen_Info()
{
	AI_Output(hero,self,"Info_Bud_2_WichtigePersonen_15_00"); //Wer hat hier das Sagen?
	AI_Output(self,hero,"Info_Bud_2_WichtigePersonen_02_01"); //Hier im äußeren Ring treiben Fletcher und Bloodwyn das Schutzgeld ein. Jedem gehört eine Hälfte.
	AI_Output(self,hero,"Info_Bud_2_WichtigePersonen_02_02"); //Wenn du dich mit ihnen gut stellst, kann dir nichts passieren.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Bud_2_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Bud_2_DasLager_Condition;
	information	= Info_Bud_2_DasLager_Info;
	permanent	= 1;
	description = "Ich will mehr über dieses Lager erfahren.";
};                       

FUNC INT Info_Bud_2_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Bud_2_DasLager_Info()
{
	AI_Output(hero,self,"Info_Bud_2_DasLager_15_00"); //Ich will mehr über dieses Lager erfahren.
	AI_Output(self,hero,"Info_Bud_2_DasLager_02_01"); //Dann solltest du mit den Schatten reden, sie können dir noch am ehesten sagen, was du wissen willst. Aber sei vorsichtig. Den meisten von ihnen kannst du nicht trauen.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Bud_2_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Bud_2_DieLage_Condition;
	information	= Info_Bud_2_DieLage_Info;
	permanent	= 1;
	description = "Wie ist das Leben hier?";
};                       

FUNC INT Info_Bud_2_DieLage_Condition()
{
	if (Schatten_Dabei == FALSE)
	&& (Gardist_Dabei == FALSE)
	&& (Erzbaron_Dabei == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Bud_2_DieLage_Info()
{
	AI_Output(hero,self,"Info_Bud_2_DieLage_15_00"); //Wie ist das Leben hier?
	AI_Output(self,hero,"Info_Bud_2_DieLage_02_01"); //Wenn die Erzbarone dich schicken, sag ihnen, ich will keinen Ärger. Von mir bekommt keiner was zu hören.
	AI_Output(self,hero,"Info_Bud_2_DieLage_02_02"); //Ich bin zufrieden mit dem, was sie uns geben.
	AI_Output(hero,self,"Info_Bud_2_DieLage_15_03"); //Niemand schickt mich. Ich bin neu hier.
	AI_Output(self,hero,"Info_Bud_2_DieLage_02_04"); //Ein Neuer ... Neue kriegen hier immer schnell Ärger. Ich will in nichts reingezogen werden, klar?
};	

INSTANCE Info_Mod_BUD_2_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_BUD_2_Pickpocket_Condition;
	information	= Info_Mod_BUD_2_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20;
};

FUNC INT Info_Mod_BUD_2_Pickpocket_Condition()
{
	C_Beklauen	(10, ItMi_Gold, 10);
};

FUNC VOID Info_Mod_BUD_2_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_BUD_2_Pickpocket);

	Info_AddChoice	(Info_Mod_BUD_2_Pickpocket, DIALOG_BACK, Info_Mod_BUD_2_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_BUD_2_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_BUD_2_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_BUD_2_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_BUD_2_Pickpocket);
};

FUNC VOID Info_Mod_BUD_2_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_BUD_2_Pickpocket);
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Bud_2(var c_NPC slf)
{
	Info_Bud_2_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Bud_2_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Bud_2_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Bud_2_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Bud_2_DieLage.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_BUD_2_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
