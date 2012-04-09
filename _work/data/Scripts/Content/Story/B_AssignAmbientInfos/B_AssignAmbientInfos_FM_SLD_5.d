// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_FM_SLD_5_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_FM_SLD_5_EXIT_Condition;
	information	= DIA_FM_SLD_5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_FM_SLD_5_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_FM_SLD_5_EXIT_Info()
{	
	AI_Output(self, hero, "DIA_FM_SLD_5_EXIT_05_00"); //Stirb uns nicht weg!

	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_FM_SLD_5_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_FM_SLD_5_JOIN_Condition;
	information	= DIA_FM_SLD_5_JOIN_Info;
	permanent	= TRUE;
	description = "Ich will mich euch anschließen!";
};                       

FUNC INT DIA_FM_SLD_5_JOIN_Condition()
{
	if (Mod_Gilde == 0)
	{
		return TRUE;
	};
};

FUNC VOID DIA_FM_SLD_5_JOIN_Info()
{	
	AI_Output (other, self, "DIA_FM_SLD_5_JOIN_15_00"); //Ich will mich euch anschließen!
	AI_Output(self, hero, "DIA_FM_SLD_5_JOIN_06_01"); //Was sprichst du dann mit mir? Rede mit Lares oder gleich mit den drei Gruppenführern und beweise dich.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_FM_SLD_5_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_FM_SLD_5_PEOPLE_Condition;
	information	= DIA_FM_SLD_5_PEOPLE_Info;
	permanent	= TRUE;
	description = "Wer hat hier das Sagen?";
};                       

FUNC INT DIA_FM_SLD_5_PEOPLE_Condition()
{
	if (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		return TRUE;
	};
};

FUNC VOID DIA_FM_SLD_5_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_FM_SLD_5_PEOPLE_15_00"); //Wer hat hier das Sagen?
	AI_Output (self, other, "DIA_FM_SLD_5_PEOPLE_06_01"); //Hier in der Mine eigentlich niemand, aber das Lager ist unter der Kontrolle von Lee.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_FM_SLD_5_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_FM_SLD_5_LOCATION_Condition;
	information	= DIA_FM_SLD_5_LOCATION_Info;
	permanent	= TRUE;
	description = "Überwacht ihr die Schürfer?";
};                       

FUNC INT DIA_FM_SLD_5_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_FM_SLD_5_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_FM_SLD_5_LOCATION_15_00"); //Überwacht ihr die Schürfer?
	AI_Output (self, other, "DIA_FM_SLD_5_LOCATION_06_01"); //Wir sind nicht hier um jemanden zu überwachen. Wir passen nur auf, dass niemand mit dem ganzen Erz durchbrennt. Außerdem mussten wir nach dem Vorfall letztens die Sicherheitsvorkehrungen erhöhen.
};

INSTANCE Info_Mod_FM_SLD_5_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_FM_SLD_5_Pickpocket_Condition;
	information	= Info_Mod_FM_SLD_5_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_FM_SLD_5_Pickpocket_Condition()
{
	C_Beklauen	(75, ItMi_Gold, 400);
};

FUNC VOID Info_Mod_FM_SLD_5_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_FM_SLD_5_Pickpocket);

	Info_AddChoice	(Info_Mod_FM_SLD_5_Pickpocket, DIALOG_BACK, Info_Mod_FM_SLD_5_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_FM_SLD_5_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_FM_SLD_5_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_FM_SLD_5_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_FM_SLD_5_Pickpocket);
};

FUNC VOID Info_Mod_FM_SLD_5_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_FM_SLD_5_Pickpocket);
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_FM_SLD_5 (var c_NPC slf)
{
	DIA_FM_SLD_5_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_FM_SLD_5_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_FM_SLD_5_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_FM_SLD_5_LOCATION.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_FM_SLD_5_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
