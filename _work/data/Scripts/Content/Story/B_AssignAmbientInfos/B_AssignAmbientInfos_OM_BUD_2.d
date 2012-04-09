// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_OM_BUD_2_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_2 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_OM_BUD_2_EXIT_Condition;
	information	= Info_OM_BUD_2_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
};                       

FUNC INT Info_OM_BUD_2_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_OM_BUD_2_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Mine
// *************************************************************************

INSTANCE Info_OM_BUD_2_Mine (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_OM_BUD_2_Mine_Condition;
	information	= Info_OM_BUD_2_Mine_Info;
	permanent	= 1;
	description = "Erzähl mir was von der Mine";
};                       

FUNC INT Info_OM_BUD_2_Mine_Condition()
{
	return 1;
};

FUNC VOID Info_OM_BUD_2_Mine_Info()
{
	AI_Output(other,self,"Info_OM_BUD_2_Mine_15_00"); //Erzähl mir was von der Mine
	AI_Output(self,other,"Info_OM_BUD_2_Mine_01_01"); //Es gibt einen ganzen Haufen Höhlen, in denen auch noch Erz zu holen ist. Aber die Crawler, machen die Arbeit darin unmöglich.
	AI_Output(self,other,"Info_OM_BUD_2_Mine_01_02"); //Zu viele Angriffe, zu viele Verluste.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_OM_BUD_2_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_OM_BUD_2_WichtigePersonen_Condition;
	information	= Info_OM_BUD_2_WichtigePersonen_Info;
	permanent	= 1;
	description = "Wer hat hier was zu Sagen?";
};                       

FUNC INT Info_OM_BUD_2_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_OM_BUD_2_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_OM_BUD_2_WichtigePersonen_15_00"); //Wer hat hier was zu sagen?
	AI_Output(self,other,"Info_OM_BUD_2_WichtigePersonen_01_01"); //Viper ist der Schmelzer. Er kennt sich mit dem Ofen aus. Er hat einen Körper aus Stahl. Ihm macht die Hitze nichts aus. Den ganzen Tag schmilzt er das Erz ein.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_OM_BUD_2_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_OM_BUD_2_DieLage_Condition;
	information	= Info_OM_BUD_2_DieLage_Info;
	permanent	= 1;
	description = "Wie sieht's aus?";
};                       

FUNC INT Info_OM_BUD_2_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_OM_BUD_2_DieLage_Info()
{
	AI_Output(other,self,"Info_OM_BUD_2_DieLage_15_00"); //Wie sieht's aus?
	AI_Output(self,other,"Info_OM_BUD_2_DieLage_01_01"); //Ich muss arbeiten. Wenn die Wachen sehen, dass ich rede, dann kürzen sie meine Ration oder töten mich gleich.
};

INSTANCE Info_Mod_OM_BUD_2_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_OM_BUD_2_Pickpocket_Condition;
	information	= Info_Mod_OM_BUD_2_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20;
};

FUNC INT Info_Mod_OM_BUD_2_Pickpocket_Condition()
{
	C_Beklauen	(14, ItMi_Gold, 10);
};

FUNC VOID Info_Mod_OM_BUD_2_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_OM_BUD_2_Pickpocket);

	Info_AddChoice	(Info_Mod_OM_BUD_2_Pickpocket, DIALOG_BACK, Info_Mod_OM_BUD_2_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_OM_BUD_2_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_OM_BUD_2_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_OM_BUD_2_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_OM_BUD_2_Pickpocket);
};

FUNC VOID Info_Mod_OM_BUD_2_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_OM_BUD_2_Pickpocket);
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_OM_BUD_2(var c_NPC slf)
{
	Info_OM_BUD_2_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_OM_BUD_2_Mine.npc					= Hlp_GetInstanceID(slf);
	Info_OM_BUD_2_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_OM_BUD_2_DieLage.npc					= Hlp_GetInstanceID(slf);
	Info_Mod_OM_BUD_2_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
