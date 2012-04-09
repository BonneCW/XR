INSTANCE Info_Mod_Knatus_AlvarKristall (C_INFO)
{
	npc		= Mod_7564_OUT_Knatus_EIS;
	nr		= 1;
	condition	= Info_Mod_Knatus_AlvarKristall_Condition;
	information	= Info_Mod_Knatus_AlvarKristall_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Knatus_AlvarKristall_Condition()
{
	if (Mod_AlvarKristall == 3)
	&& (Npc_KnowsInfo(hero, Info_Mod_Brutus_AlvarKristall3))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Knatus_AlvarKristall_Info()
{
	AI_Output(self, hero, "Info_Mod_Knatus_AlvarKristall_03_00"); //Ja, weg mit dem Kerl, schmeißt ihn hier raus.

	AI_StopProcessInfos	(self);

	AI_Teleport	(hero, "EIS_40");
};

INSTANCE Info_Mod_Knatus_Traenenkristall (C_INFO)
{
	npc		= Mod_7564_OUT_Knatus_EIS;
	nr		= 1;
	condition	= Info_Mod_Knatus_Traenenkristall_Condition;
	information	= Info_Mod_Knatus_Traenenkristall_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Knatus_Traenenkristall_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Serra_Traenenkristall))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Knatus_Traenenkristall_Info()
{
	AI_Output(self, hero, "Info_Mod_Knatus_Traenenkristall_03_00"); //Was, dass ist nicht möglich. Ja, jetzt auf einmal fällt es mir wie Schuppen von den Augen.
	AI_Output(self, hero, "Info_Mod_Knatus_Traenenkristall_03_01"); //Ihr miesen, trügerischen Weiber.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Knatus_Traenenkristall2 (C_INFO)
{
	npc		= Mod_7564_OUT_Knatus_EIS;
	nr		= 1;
	condition	= Info_Mod_Knatus_Traenenkristall2_Condition;
	information	= Info_Mod_Knatus_Traenenkristall2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Knatus_Traenenkristall2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alvar_Unbekannt2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Knatus_Traenenkristall2_Info()
{
	AI_Output(self, hero, "Info_Mod_Knatus_Traenenkristall2_03_00"); //Alvar? Das kann nicht sein. Wir haben dich tot auf dem Berghang liegen sehen ...

	AI_StopProcessInfos	(self);

	Mod_7561_OUT_Alvar_EIS.name	=	"Alvar";
};

INSTANCE Info_Mod_Knatus_Traenenkristall3 (C_INFO)
{
	npc		= Mod_7564_OUT_Knatus_EIS;
	nr		= 1;
	condition	= Info_Mod_Knatus_Traenenkristall3_Condition;
	information	= Info_Mod_Knatus_Traenenkristall3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Knatus_Traenenkristall3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alvar_Unbekannt3))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Knatus_Traenenkristall3_Info()
{
	AI_Output(self, hero, "Info_Mod_Knatus_Traenenkristall3_03_00"); //Thys scheint wieder zu Bewusstsein zu kommen.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_1954_EIS_Thys_EIS, "ALVAR");
};

INSTANCE Info_Mod_Knatus_Pickpocket (C_INFO)
{
	npc		= Mod_7564_OUT_Knatus_EIS;
	nr		= 1;
	condition	= Info_Mod_Knatus_Pickpocket_Condition;
	information	= Info_Mod_Knatus_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Knatus_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Knatus_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Knatus_Pickpocket);

	Info_AddChoice	(Info_Mod_Knatus_Pickpocket, DIALOG_BACK, Info_Mod_Knatus_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Knatus_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Knatus_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Knatus_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Knatus_Pickpocket);
};

FUNC VOID Info_Mod_Knatus_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Knatus_Pickpocket);
};

INSTANCE Info_Mod_Knatus_EXIT (C_INFO)
{
	npc		= Mod_7564_OUT_Knatus_EIS;
	nr		= 1;
	condition	= Info_Mod_Knatus_EXIT_Condition;
	information	= Info_Mod_Knatus_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Knatus_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Knatus_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};