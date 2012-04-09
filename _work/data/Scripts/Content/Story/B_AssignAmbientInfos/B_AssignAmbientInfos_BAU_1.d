// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_BAU_1_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_BAU_1_EXIT_Condition;
	information	= DIA_BAU_1_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BAU_1_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_1_EXIT_Info()
{	
	AI_Output(self, hero, "DIA_BAU_1_EXIT_01_00"); //Saftiges Korn solle auf deinen Feldern wachsen.

	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_BAU_1_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_BAU_1_JOIN_Condition;
	information	= DIA_BAU_1_JOIN_Info;
	permanent	= TRUE;
	description = "Ich will mehr über die Söldner wissen.";
};                       

FUNC INT DIA_BAU_1_JOIN_Condition()
{
	if (Npc_GetDistToWP(self, "BIGFARM") < 10000)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_1_JOIN_Info()
{	
	AI_Output (hero, self, "DIA_BAU_1_JOIN_15_00"); //Ich will mehr über die Söldner wissen.
	AI_Output (self, hero, "DIA_BAU_1_JOIN_01_01"); //Ich kann dir nur raten, einen Bogen um die zu machen.
	AI_Output (self, hero, "DIA_BAU_1_JOIN_01_02"); //Wenn einem von ihnen dein Gesicht nicht gefällt, kann es sein, dass er dir mal eben eins auf die Nase gibt.
	AI_Output (self, hero, "DIA_BAU_1_JOIN_01_03"); //Du kannst dich zwar hinterher bei Lares beschweren, aber davon wird deine Nase auch nicht wieder gerade.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_BAU_1_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_BAU_1_PEOPLE_Condition;
	information	= DIA_BAU_1_PEOPLE_Info;
	permanent	= TRUE;
	description = "Wer hat hier das Sagen?";
};                       

FUNC INT DIA_BAU_1_PEOPLE_Condition()
{
	if (Npc_GetDistToWP(self, "BIGFARM") < 10000)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_1_PEOPLE_Info()
{	
	AI_Output (hero, self, "DIA_BAU_1_PEOPLE_15_00"); //Wer hat hier das Sagen?
	AI_Output (self, hero, "DIA_BAU_1_PEOPLE_01_01"); //Das hier ist Onars Hof. Er bestimmt über alles, was hier passiert.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_BAU_1_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_BAU_1_LOCATION_Condition;
	information	= DIA_BAU_1_LOCATION_Info;
	permanent	= TRUE;
	description = "Was gibt es so alles es hier in der Gegend?";
};                       

FUNC INT DIA_BAU_1_LOCATION_Condition()
{
	if (Npc_GetDistToWP(self, "BIGFARM") < 10000)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_1_LOCATION_Info()
{	
	AI_Output (hero, self, "DIA_BAU_1_LOCATION_15_00"); //Was gibt es so alles es hier in der Gegend?
	AI_Output (self, hero, "DIA_BAU_1_LOCATION_01_01"); //Nur Felder und Höfe. Und jede Menge Söldner. Aber die sind fast alle im Osten auf Onars Hof eben.
	AI_Output (self, hero, "DIA_BAU_1_LOCATION_01_02"); //Im Norden ist Sekobs Hof.
	AI_Output (self, hero, "DIA_BAU_1_LOCATION_01_03"); //Und im Südwesten ist der Aufgang zu Bengars Hof.
};

INSTANCE Info_Mod_BAU_1_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_BAU_1_Pickpocket_Condition;
	information	= Info_Mod_BAU_1_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20;
};

FUNC INT Info_Mod_BAU_1_Pickpocket_Condition()
{
	C_Beklauen	(10, ItMi_Gold, 10);
};

FUNC VOID Info_Mod_BAU_1_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_BAU_1_Pickpocket);

	Info_AddChoice	(Info_Mod_BAU_1_Pickpocket, DIALOG_BACK, Info_Mod_BAU_1_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_BAU_1_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_BAU_1_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_BAU_1_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_BAU_1_Pickpocket);
};

FUNC VOID Info_Mod_BAU_1_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_BAU_1_Pickpocket);
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_BAU_1 (var c_NPC slf)
{
	DIA_BAU_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_1_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_1_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_1_LOCATION.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_BAU_1_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
