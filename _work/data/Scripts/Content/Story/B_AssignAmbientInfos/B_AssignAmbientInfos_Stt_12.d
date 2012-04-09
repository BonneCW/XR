// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Stt_12_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Stt_12 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Stt_12_EXIT_Condition;
	information	= Info_Stt_12_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
};                       

FUNC INT Info_Stt_12_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Stt_12_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Stt_12_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Stt_12_EinerVonEuchWerden_Condition;
	information	= Info_Stt_12_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Ich würde mich gerne den Schatten anschliessen.";
};                       

FUNC INT Info_Stt_12_EinerVonEuchWerden_Condition()
{
	if (Schatten_Dabei == FALSE)
	&& (Gardist_Dabei == FALSE)
	&& (Erzbaron_Dabei == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Stt_12_EinerVonEuchWerden_Info()
{
	AI_Output(hero,self,"Info_Stt_12_EinerVonEuchWerden_15_00"); //Ich würde mich gerne den Schatten anschließen.
	AI_Output(self,hero,"Info_Stt_12_EinerVonEuchWerden_12_01"); //So? Dann solltest du wissen, dass Thorus kein Versagen duldet. Wenn du einer von uns werden willst, musst du für ihn durchs Feuer gehen!
	AI_Output(self,hero,"Info_Stt_12_EinerVonEuchWerden_12_02"); //Nur die Hälfte derer, die es versucht haben, sind aufgenommen worden.
	AI_Output(hero,self,"Info_Stt_12_EinerVonEuchWerden_15_03"); //Was ist mit dem Rest passiert?
	AI_Output(self,hero,"Info_Stt_12_EinerVonEuchWerden_12_04"); //Vermutlich sitzen die im Neuen Lager und fressen Reis. He he he.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Stt_12_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Stt_12_WichtigePersonen_Condition;
	information	= Info_Stt_12_WichtigePersonen_Info;
	permanent	= 1;
	description = "Wer ist hier der Boss?";
};                       

FUNC INT Info_Stt_12_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Stt_12_WichtigePersonen_Info()
{
	AI_Output(hero,self,"Info_Stt_12_WichtigePersonen_15_00"); //Wer ist hier der Boss?
	AI_Output(self,hero,"Info_Stt_12_WichtigePersonen_12_01"); //Thorus ist unser Boss.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Stt_12_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Stt_12_DasLager_Condition;
	information	= Info_Stt_12_DasLager_Info;
	permanent	= 1;
	description = "Ich will wissen, was es hier im Lager alles gibt.";
};                       

FUNC INT Info_Stt_12_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Stt_12_DasLager_Info()
{
	AI_Output(hero,self,"Info_Stt_12_DasLager_15_00"); //Ich will wissen, was es hier im Lager alles gibt.
	AI_Output(self,hero,"Info_Stt_12_DasLager_12_01"); //Frag am besten die Buddler. Die haben sowieso den ganzen Tag nichts zu tun.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Stt_12_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Stt_12_DieLage_Condition;
	information	= Info_Stt_12_DieLage_Info;
	permanent	= 1;
	description = "Na, wie steht's?";
};                       

FUNC INT Info_Stt_12_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Stt_12_DieLage_Info()
{
	AI_Output(hero,self,"Info_Stt_12_DieLage_15_00"); //Na, wie steht's?
	AI_Output(self,hero,"Info_Stt_12_DieLage_12_01"); //Was genau willst du von mir?
};

INSTANCE Info_Mod_STT_12_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_STT_12_Pickpocket_Condition;
	information	= Info_Mod_STT_12_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_STT_12_Pickpocket_Condition()
{
	C_Beklauen	(49, ItMi_Gold, 110);
};

FUNC VOID Info_Mod_STT_12_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_STT_12_Pickpocket);

	Info_AddChoice	(Info_Mod_STT_12_Pickpocket, DIALOG_BACK, Info_Mod_STT_12_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_STT_12_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_STT_12_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_STT_12_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_STT_12_Pickpocket);
};

FUNC VOID Info_Mod_STT_12_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_STT_12_Pickpocket);
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Stt_12(var c_NPC slf)
{
	Info_Stt_12_EXIT.npc				= Hlp_GetInstanceID(slf);
	Info_Stt_12_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Stt_12_WichtigePersonen.npc	= Hlp_GetInstanceID(slf);
	Info_Stt_12_DasLager.npc			= Hlp_GetInstanceID(slf);
	Info_Stt_12_DieLage.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_STT_12_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
