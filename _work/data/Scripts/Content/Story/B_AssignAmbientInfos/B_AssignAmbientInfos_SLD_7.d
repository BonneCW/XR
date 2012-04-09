// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_SLD_7_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_SLD_7_EXIT_Condition;
	information	= DIA_SLD_7_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_SLD_7_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SLD_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_SLD_7_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_SLD_7_JOIN_Condition;
	information	= DIA_SLD_7_JOIN_Info;
	permanent	= TRUE;
	description = "Ich will mich euch anschließen!";
};                       

FUNC INT DIA_SLD_7_JOIN_Condition()
{
	if (Mod_Gilde == 0)
	{
		return TRUE;
	};
};

FUNC VOID DIA_SLD_7_JOIN_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_JOIN_15_00"); //Ich will mich euch anschließen!
	AI_Output(self, hero, "DIA_SLD_7_JOIN_07_01"); //Dann geh zu Lares, er kümmert sich um die Neuen.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_SLD_7_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_SLD_7_PEOPLE_Condition;
	information	= DIA_SLD_7_PEOPLE_Info;
	permanent	= TRUE;
	description = "Wer hat hier das Sagen?";
};                       

FUNC INT DIA_SLD_7_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SLD_7_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_PEOPLE_15_00"); //Wer hat hier das Sagen?
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_01"); //Lee ist unser Anführer. Lares ist seine rechte Hand. Die meisten Männer folgen ihm, denn er hat sie schon damals in der Kolonie angeführt.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_SLD_7_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_SLD_7_LOCATION_Condition;
	information	= DIA_SLD_7_LOCATION_Info;
	permanent	= TRUE;
	description = "Erzähl mir was über den Hof.";
};                       

FUNC INT DIA_SLD_7_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SLD_7_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_LOCATION_15_00"); //Erzähl mir was über den Hof.
	AI_Output (self, other, "DIA_SLD_7_LOCATION_07_01"); //Hier gibts ne Menge Bauern, aber mit denen haben wir nicht so viel zu tun. Wir passen zwar auf sie auf solange wir hier sind, aber eigentlich suchen wir nach neuen Mitgliedern.
};

INSTANCE Info_Mod_SLD_7_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_SLD_7_Pickpocket_Condition;
	information	= Info_Mod_SLD_7_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_SLD_7_Pickpocket_Condition()
{
	C_Beklauen	(70, ItMi_Gold, 300);
};

FUNC VOID Info_Mod_SLD_7_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_SLD_7_Pickpocket);

	Info_AddChoice	(Info_Mod_SLD_7_Pickpocket, DIALOG_BACK, Info_Mod_SLD_7_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_SLD_7_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_SLD_7_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_SLD_7_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_SLD_7_Pickpocket);
};

FUNC VOID Info_Mod_SLD_7_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_SLD_7_Pickpocket);
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_SLD_7 (var c_NPC slf)
{
	DIA_SLD_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_SLD_7_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_SLD_7_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_SLD_7_LOCATION.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_SLD_7_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
