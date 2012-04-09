// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_grd_13_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_grd_13 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_grd_13_EXIT_Condition;
	information	= Info_grd_13_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_grd_13_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_grd_13_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_grd_13_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 1;
	condition	= Info_grd_13_EinerVonEuchWerden_Condition;
	information	= Info_grd_13_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Ich will Gardist werden.";
};                       

FUNC INT Info_grd_13_EinerVonEuchWerden_Condition()
{
	if	(Gardist_Dabei == FALSE)
	&& (Erzbaron_Dabei == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID Info_grd_13_EinerVonEuchWerden_Info()
{
	AI_Output(hero,self,"Info_grd_13_EinerVonEuchWerden_15_00"); //Ich will Gardist werden.
	AI_Output(self,hero,"Info_grd_13_EinerVonEuchWerden_13_01"); //Da hast du aber noch einiges vor dir, Junge!
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_grd_13_WichtigePersonen(C_INFO)
{
	nr			= 1;
	condition	= Info_grd_13_WichtigePersonen_Condition;
	information	= Info_grd_13_WichtigePersonen_Info;
	permanent	= 1;
	description = "Wer hat hier das Sagen?";
};                       

FUNC INT Info_grd_13_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_grd_13_WichtigePersonen_Info()
{
	AI_Output(hero,self,"Info_grd_13_WichtigePersonen_15_00"); //Wer hat hier das Sagen?
	AI_Output(self,hero,"Info_grd_13_WichtigePersonen_13_01"); //Ich hab hier das Sagen. Und ich sage: Sei vorsichtig, was du sagst, Junge!
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_grd_13_DasLager(C_INFO)
{
	nr			= 1;
	condition	= Info_grd_13_DasLager_Condition;
	information	= Info_grd_13_DasLager_Info;
	permanent	= 1;
	description = "Wie komme ich in die Burg?";
};                       

FUNC INT Info_grd_13_DasLager_Condition()
{
	if (Schatten_Dabei == FALSE) 
	&& (Gardist_Dabei == FALSE)
	&& (Erzbaron_Dabei == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_grd_13_DasLager_Info()
{
	AI_Output(hero,self,"Info_grd_13_DasLager_15_00"); //Wie komme ich in die Burg?
	AI_Output(self,hero,"Info_grd_13_DasLager_13_01"); //Das ist nicht so leicht. Dazu musst du nämlich deine Beine benutzen.
	AI_Output(self,hero,"Info_grd_13_DasLager_13_02"); //Dann kommt aber der schwierigere Teil: Durch das Tor gehen.
	AI_Output(hero,self,"Info_grd_13_DasLager_15_03"); //Sehr lustig.
};

INSTANCE Info_Mod_GRD_13_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_GRD_13_Pickpocket_Condition;
	information	= Info_Mod_GRD_13_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_GRD_13_Pickpocket_Condition()
{
	C_Beklauen	(80, ItMi_Gold, 500);
};

FUNC VOID Info_Mod_GRD_13_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_GRD_13_Pickpocket);

	Info_AddChoice	(Info_Mod_GRD_13_Pickpocket, DIALOG_BACK, Info_Mod_GRD_13_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_GRD_13_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_GRD_13_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_GRD_13_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_GRD_13_Pickpocket);
};

FUNC VOID Info_Mod_GRD_13_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_GRD_13_Pickpocket);
};

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_grd_13(var c_NPC slf)
{
	Info_grd_13_EXIT.npc				= Hlp_GetInstanceID(slf);
	Info_grd_13_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_grd_13_WichtigePersonen.npc	= Hlp_GetInstanceID(slf);
	Info_grd_13_DasLager.npc			= Hlp_GetInstanceID(slf);
	Info_Mod_GRD_13_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
