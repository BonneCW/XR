INSTANCE Info_Mod_Ruga_Hi (C_INFO)
{
	npc		= Mod_749_MIL_Ruga_NW;
	nr		= 1;
	condition	= Info_Mod_Ruga_Hi_Condition;
	information	= Info_Mod_Ruga_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was tust du hier? Solltest du nicht in der Kaserne sein?";
};

FUNC INT Info_Mod_Ruga_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ruga_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Ruga_Hi_15_00"); //Was tust du hier? Solltest du nicht in der Kaserne sein?
	AI_Output(self, hero, "Info_Mod_Ruga_Hi_11_01"); //Nein! Sollte ich nicht. Hab die Schnauze voll.
	AI_Output(hero, self, "Info_Mod_Ruga_Hi_15_02"); //Aber warum ...?
	AI_Output(self, hero, "Info_Mod_Ruga_Hi_11_03"); //Den ganzen Tag gammle ich am Schießstand rum und steh mir die Beine in den Bauch. Jeden Tag!
	AI_Output(hero, self, "Info_Mod_Ruga_Hi_15_04"); //Da bist du doch nicht der Einzige.
	AI_Output(self, hero, "Info_Mod_Ruga_Hi_11_05"); //Hör auf! Die Milizen, dieser ignorante Haufen! Nicht Einer will bei mir Armbrust lernen. Keiner!

	if (Mod_Schwierigkeit != 4)
	{
		AI_Output(hero, self, "Info_Mod_Ruga_Hi_15_06"); //Und was ist mit mir?
		AI_Output(self, hero, "Info_Mod_Ruga_Hi_11_07"); //Die erste Einheit ist kostenlos. Weil du der Erste bist.

		B_RaiseFightTalent (hero, NPC_TALENT_CROSSBOW, 5);

		Log_CreateTopic	(TOPIC_MOD_LEHRER_KHORINIS, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_LEHRER_KHORINIS, "Ruga kann mir den Umgang mit der Armbrust zeigen.");
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Ruga_Hi_15_08"); //Tja, da kann man nichts machen.
	};
};

INSTANCE Info_Mod_Ruga_Lernen_Armbrust (C_INFO)
{
	npc		= Mod_749_MIL_Ruga_NW;
	nr		= 1;
	condition	= Info_Mod_Ruga_Lernen_Armbrust_Condition;
	information	= Info_Mod_Ruga_Lernen_Armbrust_Info;
	permanent	= 1;
	important	= 0;
	description	= "Bring mir Armbrustschießen bei.";
};

FUNC INT Info_Mod_Ruga_Lernen_Armbrust_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ruga_Hi))
	&& (hero.hitchance[NPC_TALENT_CrossBow] < 50)
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ruga_Lernen_Armbrust_Info()
{
	AI_Output(hero, self, "Info_Mod_Ruga_Lernen_Armbrust_15_00"); //Bring mir Armbrustschießen bei.

	Info_ClearChoices	(Info_Mod_Ruga_Lernen_Armbrust);
	
	Info_AddChoice	(Info_Mod_Ruga_Lernen_Armbrust, "Zurück.", Info_Mod_Ruga_Lernen_Armbrust_BACK);
	Info_AddChoice	(Info_Mod_Ruga_Lernen_Armbrust, B_BuildLearnString(PRINT_LearnCrossBow5, B_GetLearnCostTalent_New(hero, NPC_TALENT_CrossBow)), Info_Mod_Ruga_Lernen_Armbrust_5);
	Info_AddChoice	(Info_Mod_Ruga_Lernen_Armbrust, B_BuildLearnString(PRINT_LearnCrossBow1, B_GetLearnCostTalent(hero, NPC_TALENT_CrossBow, 1)), Info_Mod_Ruga_Lernen_Armbrust_1);
};

FUNC VOID Info_Mod_Ruga_Lernen_Armbrust_BACK()
{
	Info_ClearChoices	(Info_Mod_Ruga_Lernen_Armbrust);
};

FUNC VOID Info_Mod_Ruga_Lernen_Armbrust_5()
{
	B_TeachFightTalentPercent_New (self, hero, NPC_TALENT_CrossBow, 5, 60);

	Info_ClearChoices	(Info_Mod_Ruga_Lernen_Armbrust);

	Info_AddChoice	(Info_Mod_Ruga_Lernen_Armbrust, "Zurück.", Info_Mod_Ruga_Lernen_Armbrust_BACK);
	Info_AddChoice	(Info_Mod_Ruga_Lernen_Armbrust, B_BuildLearnString(PRINT_LearnCrossBow5, B_GetLearnCostTalent_New(hero, NPC_TALENT_CrossBow)), Info_Mod_Ruga_Lernen_Armbrust_5);
	Info_AddChoice	(Info_Mod_Ruga_Lernen_Armbrust, B_BuildLearnString(PRINT_LearnCrossBow1, B_GetLearnCostTalent(hero, NPC_TALENT_CrossBow, 1)), Info_Mod_Ruga_Lernen_Armbrust_1);
};

FUNC VOID Info_Mod_Ruga_Lernen_Armbrust_1()
{
	B_TeachFightTalentPercent (self, hero, NPC_TALENT_CrossBow, 1, 60);

	Info_ClearChoices	(Info_Mod_Ruga_Lernen_Armbrust);

	Info_AddChoice	(Info_Mod_Ruga_Lernen_Armbrust, "Zurück.", Info_Mod_Ruga_Lernen_Armbrust_BACK);
	Info_AddChoice	(Info_Mod_Ruga_Lernen_Armbrust, B_BuildLearnString(PRINT_LearnCrossBow5, B_GetLearnCostTalent_New(hero, NPC_TALENT_CrossBow)), Info_Mod_Ruga_Lernen_Armbrust_5);
	Info_AddChoice	(Info_Mod_Ruga_Lernen_Armbrust, B_BuildLearnString(PRINT_LearnCrossBow1, B_GetLearnCostTalent(hero, NPC_TALENT_CrossBow, 1)), Info_Mod_Ruga_Lernen_Armbrust_1);
};

INSTANCE Info_Mod_Ruga_Pickpocket (C_INFO)
{
	npc		= Mod_749_MIL_Ruga_NW;
	nr		= 1;
	condition	= Info_Mod_Ruga_Pickpocket_Condition;
	information	= Info_Mod_Ruga_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Ruga_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_Ruga_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Ruga_Pickpocket);

	Info_AddChoice	(Info_Mod_Ruga_Pickpocket, DIALOG_BACK, Info_Mod_Ruga_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Ruga_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Ruga_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Ruga_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Ruga_Pickpocket);
};

FUNC VOID Info_Mod_Ruga_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Ruga_Pickpocket);
};

INSTANCE Info_Mod_Ruga_EXIT (C_INFO)
{
	npc		= Mod_749_MIL_Ruga_NW;
	nr		= 1;
	condition	= Info_Mod_Ruga_EXIT_Condition;
	information	= Info_Mod_Ruga_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Ruga_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ruga_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};