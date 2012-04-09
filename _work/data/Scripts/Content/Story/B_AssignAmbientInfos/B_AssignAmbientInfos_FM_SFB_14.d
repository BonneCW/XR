// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									Vor Gespräch
// *************************************************************************

INSTANCE Info_FM_SFB_14_Pre(C_INFO)
{
	nr			= 1;
	condition	= Info_FM_SFB_14_Pre_Condition;
	information	= Info_FM_SFB_14_Pre_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT Info_FM_SFB_14_Pre_Condition()
{
	return 1;
};

FUNC VOID Info_FM_SFB_14_Pre_Info()
{	
	AI_Output(self,hero,"Info_FM_SFB_14_EinerVonEuchWerden_14_00"); //Was willst du hier. Ich habe keine Lust, irgendwelchen Ärger zu bekommen.
};

// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_FM_SFB_14_EXIT(C_INFO)
{
	
	nr			= 999;
	condition	= Info_FM_SFB_14_EXIT_Condition;
	information	= Info_FM_SFB_14_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
};                       

FUNC INT Info_FM_SFB_14_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_FM_SFB_14_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_FM_SFB_14_EinerVonEuchWerden (C_INFO) 
{
	nr			= 4;
	condition	= Info_FM_SFB_14_EinerVonEuchWerden_Condition;
	information	= Info_FM_SFB_14_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Was muss ich tun, um bei euch mitzumachen?";
};                       

FUNC INT Info_FM_SFB_14_EinerVonEuchWerden_Condition()
{
	return TRUE;
};

FUNC VOID Info_FM_SFB_14_EinerVonEuchWerden_Info()
{
	AI_Output(hero,self,"Info_FM_SFB_14_EinerVonEuchWerden_15_00"); //Was muss ich tun, um bei euch mitzumachen?
	AI_Output(self,hero,"Info_FM_SFB_14_EinerVonEuchWerden_14_01"); //Ich kann dir da nicht weiterhelfen. Ich bin hier nur 'ne kleine Nummer.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_FM_SFB_14_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_FM_SFB_14_WichtigePersonen_Condition;
	information	= Info_FM_SFB_14_WichtigePersonen_Info;
	permanent	= 1;
	description = "Wer hat hier was zu sagen?";
};                       

FUNC INT Info_FM_SFB_14_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_FM_SFB_14_WichtigePersonen_Info()
{
	AI_Output(hero,self,"Info_FM_SFB_14_WichtigePersonen_15_00"); //Wer hat hier was zu sagen?
	AI_Output(self,hero,"Info_FM_SFB_14_WichtigePersonen_14_01"); //Hier in der Mine hat eigentlich niemand das Sagen.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_FM_SFB_14_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_FM_SFB_14_DasLager_Condition;
	information	= Info_FM_SFB_14_DasLager_Info;
	permanent	= 1;
	description = "Ich will mehr über diese Mine erfahren.";
};                       

FUNC INT Info_FM_SFB_14_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_FM_SFB_14_DasLager_Info()
{
	AI_Output(hero,self,"Info_FM_SFB_14_DasLager_15_00"); //Ich will mehr über dieses Mine erfahren.
	AI_Output(self,hero,"Info_FM_SFB_14_DasLager_14_01"); //Ich weiß nicht, ob ich dir da weiterhelfen kann, sprich am besten mit den Söldnern.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_FM_SFB_14_DieLage(C_INFO) 
{
	nr			= 1;
	condition	= Info_FM_SFB_14_DieLage_Condition;
	information	= Info_FM_SFB_14_DieLage_Info;
	permanent	= 1;
	description = "Wie ist das Leben hier?";
};                       

FUNC INT Info_FM_SFB_14_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_FM_SFB_14_DieLage_Info()
{
	AI_Output(hero,self,"Info_FM_SFB_14_DieLage_15_00"); //Wie ist das Leben hier?
	AI_Output(self,hero,"Info_FM_SFB_14_DieLage_14_01"); //Ich will mich nicht beklagen. Wir haben alle unseren Teil zu tragen.
	AI_Output(self,hero,"Info_FM_SFB_14_DieLage_14_02"); //Aber zumindest ist es hier besser als im Alten Lager.
	AI_Output(self,hero,"Info_FM_SFB_14_DieLage_14_03"); //Kommst du aus dem Alten Lager?
	AI_Output(self,hero,"Info_FM_SFB_14_DieLage_14_04"); //Wenn du aus dem Alten Lager kommst, ich will keinen Ärger!
	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_FM_SFB_14_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_FM_SFB_14_Pickpocket_Condition;
	information	= Info_Mod_FM_SFB_14_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20;
};

FUNC INT Info_Mod_FM_SFB_14_Pickpocket_Condition()
{
	C_Beklauen	(15, ItMi_Gold, 10);
};

FUNC VOID Info_Mod_FM_SFB_14_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_FM_SFB_14_Pickpocket);

	Info_AddChoice	(Info_Mod_FM_SFB_14_Pickpocket, DIALOG_BACK, Info_Mod_FM_SFB_14_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_FM_SFB_14_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_FM_SFB_14_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_FM_SFB_14_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_FM_SFB_14_Pickpocket);
};

FUNC VOID Info_Mod_FM_SFB_14_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_FM_SFB_14_Pickpocket);
};	
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_FM_SFB_14(var c_NPC slf)
{

	Info_FM_SFB_14_Pre.npc					= Hlp_GetInstanceID(slf);
	
	Info_FM_SFB_14_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_FM_SFB_14_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_FM_SFB_14_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_FM_SFB_14_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_FM_SFB_14_DieLage.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_FM_SFB_14_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
