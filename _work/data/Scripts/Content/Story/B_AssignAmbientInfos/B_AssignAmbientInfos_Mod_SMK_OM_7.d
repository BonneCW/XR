// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Mod_SMK_OM_7_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_grd_7 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Mod_SMK_OM_7_EXIT_Condition;
	information	= Info_Mod_SMK_OM_7_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
};                       

FUNC INT Info_Mod_SMK_OM_7_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_SMK_OM_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 							Mine
// *************************************************************************

INSTANCE Info_Mod_SMK_OM_7_Mine (C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mod_SMK_OM_7_Mine_Condition;
	information	= Info_Mod_SMK_OM_7_Mine_Info;
	permanent	= 1;
	description = "Erzähl mir von der Mine";
};                       

FUNC INT Info_Mod_SMK_OM_7_Mine_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_SMK_OM_7_Mine_Info()
{
	AI_Output(other,self,"Info_Mod_SMK_OM_7_Mine_15_00"); //Erzähl mir von der Mine
	AI_Output(self,other,"Info_Mod_SMK_OM_7_Mine_07_01"); //Die Buddler schürfen das Erz und wir passen auf, dass sie nicht abhauen.
	
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Mod_SMK_OM_7_WichtigePersonen(C_INFO)
{
	nr			= 1;
	condition	= Info_Mod_SMK_OM_7_WichtigePersonen_Condition;
	information	= Info_Mod_SMK_OM_7_WichtigePersonen_Info;
	permanent	= 1;
	description = "Wer hat hier das Sagen?";
};                       

FUNC INT Info_Mod_SMK_OM_7_WichtigePersonen_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_SMK_OM_7_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mod_SMK_OM_7_WichtigePersonen_15_00"); //Wer hat hier das Sagen?
	AI_Output(self,other,"Info_Mod_SMK_OM_7_WichtigePersonen_07_01"); //Kurgan. Wende dich an ihn, wenn du was willst.
	
};
// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Mod_SMK_OM_7_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mod_SMK_OM_7_DieLage_Condition;
	information	= Info_Mod_SMK_OM_7_DieLage_Info;
	permanent	= 1;
	description = "Wie steht's?";
};                       

FUNC INT Info_Mod_SMK_OM_7_DieLage_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_SMK_OM_7_DieLage_Info()
{
	AI_Output(other,self,"Info_Mod_SMK_OM_7_DieLage_15_00"); //Wie steht's?
	AI_Output(self,other,"Info_Mod_SMK_OM_7_DieLage_07_01"); //Mann, geh mir nicht auf den Sack!
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Mod_SMK_OM_7(var c_NPC slf)
{
	
	
	Info_Mod_SMK_OM_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Mod_SMK_OM_7_Mine.npc	= Hlp_GetInstanceID(slf);
	Info_Mod_SMK_OM_7_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Mod_SMK_OM_7_DieLage.npc				= Hlp_GetInstanceID(slf);
};
