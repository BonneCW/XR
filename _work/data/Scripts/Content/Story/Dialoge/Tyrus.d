INSTANCE Info_Mod_Tyrus_Hi (C_INFO)
{
	npc		= Mod_7519_OUT_Tyrus_REL;
	nr		= 1;
	condition	= Info_Mod_Tyrus_Hi_Condition;
	information	= Info_Mod_Tyrus_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hi.";
};

FUNC INT Info_Mod_Tyrus_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Tyrus_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Tyrus_Hi_15_00"); //Hi.
	AI_Output(self, hero, "Info_Mod_Tyrus_Hi_08_01"); //(mürrisch) Ist was?
};

INSTANCE Info_Mod_Tyrus_AboutYou (C_INFO)
{
	npc		= Mod_7519_OUT_Tyrus_REL;
	nr		= 1;
	condition	= Info_Mod_Tyrus_AboutYou_Condition;
	information	= Info_Mod_Tyrus_AboutYou_Info;
	permanent	= 0;
	important	= 0;
	description	= "Erzähl mir was über dich.";
};

FUNC INT Info_Mod_Tyrus_AboutYou_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Tyrus_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Tyrus_AboutYou_Info()
{
	AI_Output(hero, self, "Info_Mod_Tyrus_AboutYou_15_00"); //Erzähl mir was über dich.
	AI_Output(self, hero, "Info_Mod_Tyrus_AboutYou_08_01"); //Da gibt es nicht viel zu sagen. Ich bin ein Schüler von Friedel, und der Unterricht ist hart genug, dass ich kaum zu etwas anderem komme.
	AI_Output(self, hero, "Info_Mod_Tyrus_AboutYou_08_02"); //Kriechen, Krabbeln, Kraulen ... Pah! Wer braucht das schon?
};

INSTANCE Info_Mod_Tyrus_Wettstreit (C_INFO)
{
	npc		= Mod_7519_OUT_Tyrus_REL;
	nr		= 1;
	condition	= Info_Mod_Tyrus_Wettstreit_Condition;
	information	= Info_Mod_Tyrus_Wettstreit_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was sagst du nun?";
};

FUNC INT Info_Mod_Tyrus_Wettstreit_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Tyrus_AboutYou))
	&& (Npc_GetDistToWP(self, "REL_CITY_381") < 400)
	&& (Mod_REL_Wettstreit_Hero > Mod_REL_Wettstreit_Tyrus)
	&& (Mod_REL_Wettstreit_Hero > Mod_REL_Wettstreit_Davon)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Tyrus_Wettstreit_Info()
{
	AI_Output(hero, self, "Info_Mod_Tyrus_Wettstreit_15_00"); //Was sagst du nun?
	AI_Output(self, hero, "Info_Mod_Tyrus_Wettstreit_08_01"); //Fühlst dich jetzt wohl ganz toll, hä? Und ich darf weiter bei Friedel rumgammeln ...
};

INSTANCE Info_Mod_Tyrus_Freudenspender (C_INFO)
{
	npc		= Mod_7519_OUT_Tyrus_REL;
	nr		= 1;
	condition	= Info_Mod_Tyrus_Freudenspender_Condition;
	information	= Info_Mod_Tyrus_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Ich hätte da bei Interesse Freudenspender für dich ...";
};                       

FUNC INT Info_Mod_Tyrus_Freudenspender_Condition()
{
	if (Npc_HasItems(hero, ItMi_Freudenspender) >= 1)
	&& (Mod_Freudenspender < 5)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Hi))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Tyrus_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Tyrus_Freudenspender_15_00"); //Ich hätte da bei Interesse Freudenspender für dich ...
	AI_Output(self, hero, "Info_Mod_Tyrus_Freudenspender_08_01"); //Schön für dich. Steck's dir meinetwegen in den Arsch.
};

INSTANCE Info_Mod_Tyrus_Pickpocket (C_INFO)
{
	npc		= Mod_7519_OUT_Tyrus_REL;
	nr		= 1;
	condition	= Info_Mod_Tyrus_Pickpocket_Condition;
	information	= Info_Mod_Tyrus_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Tyrus_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Tyrus_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Tyrus_Pickpocket);

	Info_AddChoice	(Info_Mod_Tyrus_Pickpocket, DIALOG_BACK, Info_Mod_Tyrus_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Tyrus_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Tyrus_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Tyrus_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Tyrus_Pickpocket);
};

FUNC VOID Info_Mod_Tyrus_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Tyrus_Pickpocket);
};

INSTANCE Info_Mod_Tyrus_EXIT (C_INFO)
{
	npc		= Mod_7519_OUT_Tyrus_REL;
	nr		= 1;
	condition	= Info_Mod_Tyrus_EXIT_Condition;
	information	= Info_Mod_Tyrus_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Tyrus_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Tyrus_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};