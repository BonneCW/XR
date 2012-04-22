// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_VLK_6_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_VLK_6_EXIT_Condition;
	information	= DIA_VLK_6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_VLK_6_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_VLK_6_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_VLK_6_JOIN_Condition;
	information	= DIA_VLK_6_JOIN_Info;
	permanent	= TRUE;
	description = "Wie werde ich Bürger dieser Stadt?";
};                       

FUNC INT DIA_VLK_6_JOIN_Condition()
{
	if (Mod_Gilde == 0)
	&& (Mod_IstLehrling == 0)
	{
		return TRUE;
	};
};

FUNC VOID DIA_VLK_6_JOIN_Info()
{	
	AI_Output (hero, self, "DIA_VLK_6_JOIN_15_00"); //Wie werde ich Bürger dieser Stadt?
	AI_Output (self, hero, "DIA_VLK_6_JOIN_06_01"); //Du willst dich hier niederlassen? Jetzt? Wo hier alle Anzeichen auf Weltuntergang stehen?
	AI_Output (hero, self, "DIA_VLK_6_JOIN_15_02"); //Ich hatte nicht vor, ewig zu bleiben.
	AI_Output (self, hero, "DIA_VLK_6_JOIN_06_03"); //Also, ich würde dir raten, dich hier zu verkrümeln, solange du noch kannst, aber wenn du's darauf anlegst, solltest du mit einem der einflussreichen Bürger hier reden.
};

INSTANCE DIA_VLK_6_Skinner(C_INFO)
{
	nr			= 4;
	condition	= DIA_VLK_6_Skinner_Condition;
	information	= DIA_VLK_6_Skinner_Info;
	permanent	= TRUE;
	description = "Ich habe hier etwas, was die Stimmung zu heben vermag.";
};                       

FUNC INT DIA_VLK_6_Skinner_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skinner_Laufbursche))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Skinner_Laufbursche2))
	&& (Npc_KnowsInfo(hero, Info_Mod_Edgor_Skinner))
	&& (Npc_HasItems(hero, ItMi_Addon_Joint_01) >= 5)
	&& (Mod_SkinnerQuest == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_VLK_6_Skinner_Info()
{	
	AI_Output (hero, self, "DIA_VLK_6_Skinner_15_00"); //Ich habe hier etwas, was die Stimmung zu heben vermag.
	AI_Output (self, hero, "DIA_VLK_6_Skinner_06_01"); //Ahh, dieser herrliche Duft. Wirkt intensiver als das, was man hier sonst so bekommt am Hafen. Wie viel soll der Spaß den kosten?

	Mod_SkinnerQuest = 2;

	Info_ClearChoices	(DIA_VLK_6_Skinner);

	Info_AddChoice	(DIA_VLK_6_Skinner, "40 Gold.", DIA_VLK_6_Skinner_C);
	Info_AddChoice	(DIA_VLK_6_Skinner, "30 Gold", DIA_VLK_6_Skinner_B);
	Info_AddChoice	(DIA_VLK_6_Skinner, "20 Gold.", DIA_VLK_6_Skinner_A);
};

FUNC VOID DIA_VLK_6_Skinner_D()
{	
	AI_Output (self, hero, "DIA_VLK_6_Skinner_D_06_00"); //Und auch noch so günstig. Ich nehme alles, was du hast.

	Info_ClearChoices	(DIA_VLK_6_Skinner);
};

FUNC VOID DIA_VLK_6_Skinner_C()
{	
	AI_Output (hero, self, "DIA_VLK_6_Skinner_C_15_00"); //40 Gold.

	DIA_VLK_6_Skinner_D();

	CreateInvItems	(self, ItMi_Gold, 40*Npc_HasItems(hero, ItMi_Addon_Joint_01));
	B_GiveInvItems	(self, hero, ItMi_Gold, 40*Npc_HasItems(hero, ItMi_Addon_Joint_01));

	Npc_RemoveInvItems	(hero, ItMi_Addon_Joint_01, Npc_HasItems(hero, ItMi_Addon_Joint_01));

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_BDT_SKINNER, "So, damit bin ich in der Stadt die ganzen grünen Novizen losgeworden.");

	Info_ClearChoices	(DIA_VLK_6_Skinner);
};

FUNC VOID DIA_VLK_6_Skinner_B()
{	
	AI_Output (hero, self, "DIA_VLK_6_Skinner_B_15_00"); //30 Gold.

	DIA_VLK_6_Skinner_D();

	CreateInvItems	(self, ItMi_Gold, 30*Npc_HasItems(hero, ItMi_Addon_Joint_01));
	B_GiveInvItems	(self, hero, ItMi_Gold, 30*Npc_HasItems(hero, ItMi_Addon_Joint_01));

	Npc_RemoveInvItems	(hero, ItMi_Addon_Joint_01, Npc_HasItems(hero, ItMi_Addon_Joint_01));

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_BDT_SKINNER, "So, damit bin ich in der Stadt die ganzen grünen Novizen losgeworden.");

	Info_ClearChoices	(DIA_VLK_6_Skinner);
};

FUNC VOID DIA_VLK_6_Skinner_A()
{	
	AI_Output (hero, self, "DIA_VLK_6_Skinner_A_15_00"); //20 Gold.

	DIA_VLK_6_Skinner_D();

	CreateInvItems	(self, ItMi_Gold, 20*Npc_HasItems(hero, ItMi_Addon_Joint_01));
	B_GiveInvItems	(self, hero, ItMi_Gold, 20*Npc_HasItems(hero, ItMi_Addon_Joint_01));

	Npc_RemoveInvItems	(hero, ItMi_Addon_Joint_01, Npc_HasItems(hero, ItMi_Addon_Joint_01));

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_BDT_SKINNER, "So, damit bin ich in der Stadt die ganzen grünen Novizen losgeworden.");

	Info_ClearChoices	(DIA_VLK_6_Skinner);
};

INSTANCE Info_VLK_06_Flugblätter (C_INFO) // E1
{
	nr			= 5;
	condition	= Info_VLK_06_Flugblätter_Condition;
	information	= Info_VLK_06_Flugblätter_Info;
	permanent	= 1;
	description = "Ich hab hier ein Flugblatt für dich.";
};                       

FUNC INT Info_VLK_06_Flugblätter_Condition()
{
	if (Npc_HasItems(hero, MatteoFlugblaetter) >= 1)
	&& (Mod_Flugblaetter < 20)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Matteo_Flugblaetter))
	&& (self.aivar[AIV_FLUGBLATTVERTEILT] == 0)
	{
		return TRUE;
	};
};

FUNC VOID Info_VLK_06_Flugblätter_Info()
{
	B_Say (hero, self, "$MATTEOPAPER");

	B_GiveInvItems	(hero, self, MatteoFlugblaetter, 1);

	AI_Output(self, hero, "Info_Mod_VLK_6_Flugblaetter_06_01"); //(gelangweilt) Hmm ...

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_VLK_6_Flugblaetter_06_02"); //Ja, danke, hört sich ganz nett an.

	self.aivar[AIV_FLUGBLATTVERTEILT] = 1;

	Mod_Flugblaetter += 1;
};

INSTANCE Info_VLK_6_Rangar (C_INFO) // E1
{
	nr			= 6;
	condition	= Info_VLK_6_Rangar_Condition;
	information	= Info_VLK_6_Rangar_Info;
	permanent	= 0;
	description = "Wusstest du schon ...";
};                       

FUNC INT Info_VLK_6_Rangar_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Den_Problem))
	&& (!Npc_KnowsInfo(hero, Info_VLK_1_Rangar))
	&& (!Npc_KnowsInfo(hero, Info_VLK_17_Rangar))
	&& (!Npc_KnowsInfo(hero, Info_VLK_8_Rangar))
	&& (!Npc_KnowsInfo(hero, Info_VLK_16_Rangar))
	&& (Mod_DenVerpfiffen == 0)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Andre_Rangar))
	{
		return TRUE;
	};
};

FUNC VOID Info_VLK_6_Rangar_Info()
{
	AI_Output(hero, self, "Info_Mod_VLK_6_Rangar_15_00"); //Wusstest du schon, dass Rangar eine Affäre hat?
	AI_Output(self, hero, "Info_Mod_VLK_6_Rangar_06_01"); //Echt? Mit wem denn?
	AI_Output(hero, self, "Info_Mod_VLK_6_Rangar_15_02"); //Mit einem von Alwins Schafen!
	AI_Output(self, hero, "Info_Mod_VLK_6_Rangar_06_03"); //Bist du sicher? Das muss ich sofort weitererzählen.

	Mod_DensGeruechtVerbreitet = TRUE;

	B_LogEntry	(TOPIC_MOD_DENSPROBLEM, "Ein Gerücht ist im Umlauf, da wird Den zufrieden sein.");
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_VLK_6_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_VLK_6_PEOPLE_Condition;
	information	= DIA_VLK_6_PEOPLE_Info;
	permanent	= TRUE;
	description = "Wer sind die einflussreichen Bürger von Khorinis?";
};                       

FUNC INT DIA_VLK_6_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_6_PEOPLE_Info()
{	
	AI_Output (hero, self, "DIA_VLK_6_PEOPLE_15_00"); //Wer sind die einflussreichen Bürger von Khorinis?
	AI_Output (self, hero, "DIA_VLK_6_PEOPLE_06_01"); //Probier's mal beim Schmied oder beim Tischler in der Unterstadt. Es gibt dort auch noch ein paar andere angesehene Meister.
	AI_Output (self, hero, "DIA_VLK_6_PEOPLE_06_02"); //Wenn hier jemand abgesehen von der Stadtwache und den Paladinen was zu sagen hat, dann diese Männer.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_VLK_6_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_VLK_6_LOCATION_Condition;
	information	= DIA_VLK_6_LOCATION_Info;
	permanent	= TRUE;
	description = "Woran kann ich mich hier in der Stadt am besten orientieren?";
};                       

FUNC INT DIA_VLK_6_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_6_LOCATION_Info()
{	
	AI_Output (hero, self, "DIA_VLK_6_LOCATION_15_00"); //Woran kann ich mich hier in der Stadt am besten orientieren?
	AI_Output (self, hero, "DIA_VLK_6_LOCATION_06_01"); //Ist gar nicht so leicht, sich hier zurechtzufinden, was? Da helfen selbst die Wegweiser nicht immer.
	AI_Output (self, hero, "DIA_VLK_6_LOCATION_06_02"); //Wenn du einen schlechten Orientierungssinn hast, wird es das Beste sein, du gehst zum Hafen - den wirst du ja wohl noch finden - und suchst das Haus des Kartenzeichners.
	AI_Output (self, hero, "DIA_VLK_6_LOCATION_06_03"); //Es ist direkt neben der Kneipe, an der Hafenmauer. Brahim hat bestimmt einen Plan von der Stadt für dich.
};

INSTANCE Info_Mod_VLK_6_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_VLK_6_Pickpocket_Condition;
	information	= Info_Mod_VLK_6_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_VLK_6_Pickpocket_Condition()
{
	C_Beklauen	(53, ItMi_Gold, 120);
};

FUNC VOID Info_Mod_VLK_6_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_VLK_6_Pickpocket);

	Info_AddChoice	(Info_Mod_VLK_6_Pickpocket, DIALOG_BACK, Info_Mod_VLK_6_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_VLK_6_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_VLK_6_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_VLK_6_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_VLK_6_Pickpocket);
};

FUNC VOID Info_Mod_VLK_6_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_VLK_6_Pickpocket);
};

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_VLK_6 (var c_NPC slf)
{
	DIA_VLK_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_6_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_6_Skinner.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_6_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_6_LOCATION.npc				= Hlp_GetInstanceID(slf);
	Info_VLK_06_Flugblätter.npc				= Hlp_GetInstanceID(slf);
	Info_VLK_6_Rangar.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_VLK_6_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
