// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_OM_BUD_4_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_4 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_OM_BUD_4_EXIT_Condition;
	information	= Info_OM_BUD_4_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
};                       

FUNC INT Info_OM_BUD_4_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_OM_BUD_4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Die Mine
// *************************************************************************

INSTANCE Info_OM_BUD_4_Mine (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_OM_BUD_4_Mine_Condition;
	information	= Info_OM_BUD_4_Mine_Info;
	permanent	= 1;
	description = "Erzähl mir was von der Mine";
};                       

FUNC INT Info_OM_BUD_4_Mine_Condition()
{
	return 1;
};

FUNC VOID Info_OM_BUD_4_Mine_Info()
{
	AI_Output(other,self,"Info_OM_BUD_4_Mine_15_00"); //Erzähl mir was von der Mine
	AI_Output(self,other,"Info_OM_BUD_4_Mine_01_01"); //Eine Spitzhacke und Schweiß. Das brauchst du hier drin.
	AI_Output(self,other,"Info_OM_BUD_4_Mine_01_02"); //Aber, wenn du längst weg bist, werde ich hier immer noch das Erz aus dem Berg schlagen. Das ist meine Aufgabe. Das ist mein Leben.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_OM_BUD_4_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_OM_BUD_4_WichtigePersonen_Condition;
	information	= Info_OM_BUD_4_WichtigePersonen_Info;
	permanent	= 1;
	description = "Wer hat hier was zu Sagen?";
};                       

FUNC INT Info_OM_BUD_4_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_OM_BUD_4_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_OM_BUD_4_WichtigePersonen_15_00"); //Wer hat hier was zu sagen?
	AI_Output(self,other,"Info_OM_BUD_4_WichtigePersonen_01_01"); //Kurgan und ein paar andere Beliar-Anhänger haben vor ein paar Wochen die Mine übernommen. Seitdem kommen wir hier nicht mehr raus.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_OM_BUD_4_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_OM_BUD_4_DieLage_Condition;
	information	= Info_OM_BUD_4_DieLage_Info;
	permanent	= 1;
	description = "Wie sieht's aus?";
};                       

FUNC INT Info_OM_BUD_4_DieLage_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_OM_BUD_4_DieLage_Info()
{
	AI_Output(other,self,"Info_OM_BUD_4_DieLage_15_00"); //Wie sieht's aus?
	AI_Output(self,other,"Info_OM_BUD_4_DieLage_01_01"); //Früher war alles besser.
};

INSTANCE Info_Mod_OM_BUD_4_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_OM_BUD_4_Pickpocket_Condition;
	information	= Info_Mod_OM_BUD_4_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20;
};

FUNC INT Info_Mod_OM_BUD_4_Pickpocket_Condition()
{
	C_Beklauen	(10, ItMi_Gold, 5);
};

FUNC VOID Info_Mod_OM_BUD_4_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_OM_BUD_4_Pickpocket);

	Info_AddChoice	(Info_Mod_OM_BUD_4_Pickpocket, DIALOG_BACK, Info_Mod_OM_BUD_4_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_OM_BUD_4_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_OM_BUD_4_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_OM_BUD_4_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_OM_BUD_4_Pickpocket);
};

FUNC VOID Info_Mod_OM_BUD_4_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_OM_BUD_4_Pickpocket);
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_OM_BUD_4(var c_NPC slf)
{
	
	
	Info_OM_BUD_4_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_OM_BUD_4_Mine.npc					= Hlp_GetInstanceID(slf);
	Info_OM_BUD_4_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_OM_BUD_4_DieLage.npc					= Hlp_GetInstanceID(slf);
	Info_Mod_OM_BUD_4_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
