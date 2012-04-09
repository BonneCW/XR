// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_PsiNov_3_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_PsiNov_3 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_PsiNov_3_EXIT_Condition;
	information	= Info_PsiNov_3_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
};                       

FUNC INT Info_PsiNov_3_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_PsiNov_3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_PsiNov_3_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_PsiNov_3_EinerVonEuchWerden_Condition;
	information	= Info_PsiNov_3_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Wie kann ich mich diesem Lager anschliessen?";
};                       

FUNC INT Info_PsiNov_3_EinerVonEuchWerden_Condition()
{
	if (SumpfNovize_Dabei == FALSE)
	&& (Templer_Dabei == FALSE)
	&& (HoherTempler_Dabei == FALSE)
	&& (Guru_Dabei == FALSE)
	&& (HoherGuru_Dabei == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID Info_PsiNov_3_EinerVonEuchWerden_Info()
{
	AI_Output(hero,self,"Info_PsiNov_3_EinerVonEuchWerden_15_00"); //Wie kann ich mich diesem Lager anschließen?
	AI_Output(self,hero,"Info_PsiNov_3_EinerVonEuchWerden_03_01"); //Das ist ganz einfach. Du musst einfach loslassen, Mann.
	AI_Output(self,hero,"Info_PsiNov_3_EinerVonEuchWerden_03_02"); //Sprich mit den Gurus, sie werden dich leiten!
};

INSTANCE Info_PsiNov_3_Sumpfkrautruestung (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_PsiNov_3_Sumpfkrautruestung_Condition;
	information	= Info_PsiNov_3_Sumpfkrautruestung_Info;
	permanent	= 0;
	important = 1;
};                       

FUNC INT Info_PsiNov_3_Sumpfkrautruestung_Condition()
{
	var C_Item RuessiCheck;
	RuessiCheck = Npc_GetEquippedArmor(hero);

	if (Hlp_IsItem(RuessiCheck, ItAr_Sumpfkraut) == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID Info_PsiNov_3_Sumpfkrautruestung_Info()
{
	AI_Output(self,hero,"Info_PsiNov_3_Sumpfkrautruestung_03_00"); //Man, das riecht ja wie ein ganzes Feld voll Sumpfkraut.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_PsiNov_3_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_PsiNov_3_WichtigePersonen_Condition;
	information	= Info_PsiNov_3_WichtigePersonen_Info;
	permanent	= 1;
	description = "Wer ist hier der Boss?";
};                       

FUNC INT Info_PsiNov_3_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_PsiNov_3_WichtigePersonen_Info()
{
	AI_Output(hero,self,"Info_PsiNov_3_WichtigePersonen_15_00"); //Wer ist hier der Boss?
	AI_Output(self,hero,"Info_PsiNov_3_WichtigePersonen_03_01"); //Cor Cadar und Cor Angar!
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_PsiNov_3_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_PsiNov_3_DasLager_Condition;
	information	= Info_PsiNov_3_DasLager_Info;
	permanent	= 1;
	description = "Was gibt es hier für wichtige Orte?";
};                       

FUNC INT Info_PsiNov_3_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_PsiNov_3_DasLager_Info()
{
	AI_Output(hero,self,"Info_PsiNov_3_DasLager_15_00"); //Was gibt es hier für wichtige Orte?
	AI_Output(self,hero,"Info_PsiNov_3_DasLager_03_01"); //Es gibt Fortuno, er verteilt freies Sumpfkraut für alle Anhänger der Sekte.
	AI_Output(self,hero,"Info_PsiNov_3_DasLager_03_02"); //Du findest ihn unter Cor Kaloms altem Alchemielabor.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_PsiNov_3_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_PsiNov_3_DieLage_Condition;
	information	= Info_PsiNov_3_DieLage_Info;
	permanent	= 1;
	description = "Wie steht's?";
};                       

FUNC INT Info_PsiNov_3_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_PsiNov_3_DieLage_Info()
{
	AI_Output(hero,self,"Info_PsiNov_3_DieLage_15_00"); //Wie steht's?
	AI_Output(self,hero,"Info_PsiNov_3_DieLage_03_01"); //Ich bin total high, Mann!
};

INSTANCE Info_Mod_PsiNov_3_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_PsiNov_3_Pickpocket_Condition;
	information	= Info_Mod_PsiNov_3_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_PsiNov_3_Pickpocket_Condition()
{
	C_Beklauen	(60, ItMi_Gold, 200);
};

FUNC VOID Info_Mod_PsiNov_3_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_PsiNov_3_Pickpocket);

	Info_AddChoice	(Info_Mod_PsiNov_3_Pickpocket, DIALOG_BACK, Info_Mod_PsiNov_3_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_PsiNov_3_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_PsiNov_3_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_PsiNov_3_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_PsiNov_3_Pickpocket);
};

FUNC VOID Info_Mod_PsiNov_3_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_PsiNov_3_Pickpocket);
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_PsiNov_3(var c_NPC slf)
{
	Info_PsiNov_3_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_PsiNov_3_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_PsiNov_3_Sumpfkrautruestung.npc	= Hlp_GetInstanceID(slf);
	Info_PsiNov_3_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_PsiNov_3_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_PsiNov_3_DieLage.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_PsiNov_3_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
