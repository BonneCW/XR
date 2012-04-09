INSTANCE Info_Mod_Angus_Befreiung (C_INFO)
{
	npc		= Mod_941_PIR_Angus_AW;
	nr		= 1;
	condition	= Info_Mod_Angus_Befreiung_Condition;
	information	= Info_Mod_Angus_Befreiung_Info;
	permanent	= 0;
	important	= 0;
	description	= "So ihr beiden, die Faulenzzeit ist rum.";
};

FUNC INT Info_Mod_Angus_Befreiung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Francis_Befreiung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angus_Befreiung_Info()
{
	AI_Output(hero, self, "Info_Mod_Angus_Befreiung_15_00"); //So ihr beiden, die Faulenzzeit ist rum. Francis will, dass ihr euch wieder zum Sägen begebt.
	AI_Output(self, hero, "Info_Mod_Angus_Befreiung_06_01"); //(lacht laut) Was? Und er schickt dich, um uns das zu sagen? Richte ihm aus, dass er selber seinen Hintern bewegen soll.
	AI_Output(hero, self, "Info_Mod_Angus_Befreiung_15_02"); //(seufzt) Dann werde ich wohl handgreiflich werden müssen.
	AI_Output(self, hero, "Info_Mod_Angus_Befreiung_06_03"); //(grinst) Achja? Los Hank, den machen wir fertig!
	
	AI_StopProcessInfos	(self);

	//B_Attack	(self, hero, AR_None, 0);
	//B_Attack	(Mod_942_PIR_Hank_AW, hero, AR_None, 0);
};

INSTANCE Info_Mod_Angus_Befreiung2 (C_INFO)
{
	npc		= Mod_941_PIR_Angus_AW;
	nr		= 1;
	condition	= Info_Mod_Angus_Befreiung2_Condition;
	information	= Info_Mod_Angus_Befreiung2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Und? Immern noch keine Lust?";
};

FUNC INT Info_Mod_Angus_Befreiung2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angus_Befreiung))
	&& (Mod_AngusHank_Verbatscht == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angus_Befreiung2_Info()
{
	AI_Output(hero, self, "Info_Mod_Angus_Befreiung2_15_00"); //Und? Immern noch keine Lust?
	AI_Output(self, hero, "Info_Mod_Angus_Befreiung2_06_01"); //(faucht) Nein, schon gut. Wir haben's begriffen.
	AI_Output(self, hero, "Info_Mod_Angus_Befreiung2_06_02"); //(wütend) War ja 'ne richtige Heldentat!
	AI_Output(hero, self, "Info_Mod_Angus_Befreiung2_15_03"); //Also Leute, zurück an die Arbeit!

	B_GivePlayerXP	(200);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SAW");
	B_StartOtherRoutine	(Mod_942_PIR_Hank_AW, "SAW");
	
	B_LogEntry	(TOPIC_MOD_BEL_PIRFRANCIS, "Angus und Hank gehen jetzt wieder zu Francis, um dort Holz zu sägen.");
};

INSTANCE Info_Mod_Angus_Pickpocket (C_INFO)
{
	npc		= Mod_941_PIR_Angus_AW;
	nr		= 1;
	condition	= Info_Mod_Angus_Pickpocket_Condition;
	information	= Info_Mod_Angus_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Angus_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_Angus_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Angus_Pickpocket);

	Info_AddChoice	(Info_Mod_Angus_Pickpocket, DIALOG_BACK, Info_Mod_Angus_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Angus_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Angus_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Angus_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Angus_Pickpocket);
};

FUNC VOID Info_Mod_Angus_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Angus_Pickpocket);
};

INSTANCE Info_Mod_Angus_EXIT (C_INFO)
{
	npc		= Mod_941_PIR_Angus_AW;
	nr		= 1;
	condition	= Info_Mod_Angus_EXIT_Condition;
	information	= Info_Mod_Angus_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Angus_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Angus_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};