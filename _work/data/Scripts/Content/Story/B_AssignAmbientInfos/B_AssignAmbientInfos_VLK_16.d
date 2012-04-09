// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_VLK_16_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_VLK_16_EXIT_Condition;
	information	= DIA_VLK_16_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_VLK_16_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_16_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_VLK_16_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_VLK_16_JOIN_Condition;
	information	= DIA_VLK_16_JOIN_Info;
	permanent	= TRUE;
	description = "Ich will Bürger dieser Stadt werden!";
};                       

FUNC INT DIA_VLK_16_JOIN_Condition()
{
	if (Mod_Gilde == 0)
	&& (Mod_IstLehrling == 0)
	{
		return TRUE;
	};
};

FUNC VOID DIA_VLK_16_JOIN_Info()
{	
	AI_Output (hero, self, "DIA_VLK_16_JOIN_15_00"); //Ich will Bürger dieser Stadt werden!
	AI_Output (self, hero, "DIA_VLK_16_JOIN_16_01"); //Willst du uns helfen, die Stadt gegen die Orks zu verteidigen?
	AI_Output (self, hero, "DIA_VLK_16_JOIN_16_02"); //Wenn du Bürger von Khorinis bist, kannst du der Miliz beitreten - du solltest mit einer der Stadtwachen reden.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_VLK_16_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_VLK_16_PEOPLE_Condition;
	information	= DIA_VLK_16_PEOPLE_Info;
	permanent	= TRUE;
	description = "Wer sind die wichtigen Persönlichkeiten dieser Stadt?";
};                       

FUNC INT DIA_VLK_16_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_16_PEOPLE_Info()
{	
	AI_Output (hero, self, "DIA_VLK_16_PEOPLE_15_00"); //Wer sind die wichtigen Persönlichkeiten dieser Stadt?
	AI_Output (self, hero, "DIA_VLK_16_PEOPLE_16_01"); //Die Paladine im oberen Viertel.
};

INSTANCE Info_VLK_16_Flugblätter (C_INFO) // E1
{
	nr			= 5;
	condition	= Info_VLK_16_Flugblätter_Condition;
	information	= Info_VLK_16_Flugblätter_Info;
	permanent	= 1;
	description = "Ich hab hier ein Flugblatt für dich.";
};                       

FUNC INT Info_VLK_16_Flugblätter_Condition()
{
	if (Npc_HasItems(hero, MatteoFlugblätter) >= 1)
	&& (Mod_Flugblätter	<	20)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Matteo_Flugblätter))
	&& (self.aivar[AIV_FLUGBLATTVERTEILT] == 0)
	{
		return TRUE;
	};
};

FUNC VOID Info_VLK_16_Flugblätter_Info()
{
	B_Say (hero, self, "$MATTEOPAPER");

	B_GiveInvItems	(hero, self, MatteoFlugblätter, 1);

	AI_Output(self, hero, "Info_Mod_VLK_16_Flugblätter_16_01"); //Oh danke. Mal sehen ...

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_VLK_16_Flugblätter_16_02"); //Ah ja. Vielleicht werd ich mal bei Matteo vorbeischauen.

	self.aivar[AIV_FLUGBLATTVERTEILT] = 1;

	Mod_Flugblätter	=	Mod_Flugblätter + 1;
};

INSTANCE Info_VLK_16_Rangar (C_INFO) // E1
{
	nr			= 6;
	condition	= Info_VLK_16_Rangar_Condition;
	information	= Info_VLK_16_Rangar_Info;
	permanent	= 0;
	description = "Wusstest du schon ...";
};                       

FUNC INT Info_VLK_16_Rangar_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Den_Problem))
	&& (!Npc_KnowsInfo(hero, Info_VLK_1_Rangar))
	&& (!Npc_KnowsInfo(hero, Info_VLK_6_Rangar))
	&& (!Npc_KnowsInfo(hero, Info_VLK_8_Rangar))
	&& (!Npc_KnowsInfo(hero, Info_VLK_17_Rangar))
	&& (Mod_DenVerpfiffen == 0)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Andre_Rangar))
	{
		return TRUE;
	};
};

FUNC VOID Info_VLK_16_Rangar_Info()
{
	AI_Output(hero, self, "Info_Mod_VLK_16_Rangar_15_00"); //Wusstest du schon, dass Rangar eine Affäre hat?
	AI_Output(self, hero, "Info_Mod_VLK_16_Rangar_16_01"); //Echt? Mit wem denn?
	AI_Output(hero, self, "Info_Mod_VLK_16_Rangar_15_02"); //Mit einem von Bromors Mädchen!
	AI_Output(self, hero, "Info_Mod_VLK_16_Rangar_16_03"); //Bist du sicher? Das muss ich sofort weitererzählen.

	Mod_DensGeruechtVerbreitet = TRUE;

	B_LogEntry	(TOPIC_MOD_DENSPROBLEM, "Ein Gerücht ist im Umlauf, da wird Den zufrieden sein.");
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_VLK_16_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_VLK_16_LOCATION_Condition;
	information	= DIA_VLK_16_LOCATION_Info;
	permanent	= TRUE;
	description = "Was gibt hier Interessantes zu sehen?";
};                       

FUNC INT DIA_VLK_16_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_16_LOCATION_Info()
{	
	AI_Output (hero, self, "DIA_VLK_16_LOCATION_15_00"); //Was gibt es hier Interessantes zu sehen?
	AI_Output (self, hero, "DIA_VLK_16_LOCATION_16_01"); //Auf dem Marktplatz kannst du alle möglichen Waren ansehen.
};

INSTANCE Info_Mod_VLK_16_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_VLK_16_Pickpocket_Condition;
	information	= Info_Mod_VLK_16_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60_Female;
};

FUNC INT Info_Mod_VLK_16_Pickpocket_Condition()
{
	C_Beklauen	(56, ItMi_Gold, 130);
};

FUNC VOID Info_Mod_VLK_16_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_VLK_16_Pickpocket);

	Info_AddChoice	(Info_Mod_VLK_16_Pickpocket, DIALOG_BACK, Info_Mod_VLK_16_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_VLK_16_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_VLK_16_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_VLK_16_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_VLK_16_Pickpocket);
};

FUNC VOID Info_Mod_VLK_16_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_VLK_16_Pickpocket);
};

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_VLK_16 (var c_NPC slf)
{
	DIA_VLK_16_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_16_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_16_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_16_LOCATION.npc				= Hlp_GetInstanceID(slf);
	Info_VLK_16_Flugblätter.npc				= Hlp_GetInstanceID(slf);
	Info_VLK_16_Rangar.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_VLK_16_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
