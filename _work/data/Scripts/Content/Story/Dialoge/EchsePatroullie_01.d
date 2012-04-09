INSTANCE Info_Mod_EchsePatroullie_01_Hi (C_INFO)
{
	npc		= Mod_12002_DRA_Patroullie_AW;
	nr		= 1;
	condition	= Info_Mod_EchsePatroullie_01_Hi_Condition;
	information	= Info_Mod_EchsePatroullie_01_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_EchsePatroullie_01_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_EchsePatroullie_01_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_EchsePatroullie_01_Hi_23_00"); //Schhhhhhhhhhhhhhhhhhhhhhhhhzzz.

	Info_ClearChoices	(Info_Mod_EchsePatroullie_01_Hi);

	Info_AddChoice	(Info_Mod_EchsePatroullie_01_Hi, "Mitgehen.", Info_Mod_EchsePatroullie_01_Hi_B);
	Info_AddChoice	(Info_Mod_EchsePatroullie_01_Hi, "Waffe ziehen.", Info_Mod_EchsePatroullie_01_Hi_A);
};

FUNC VOID Info_Mod_EchsePatroullie_01_Hi_B()
{
	Info_ClearChoices	(Info_Mod_EchsePatroullie_01_Hi);

	AI_StopProcessInfos	(self);

	Wld_PlayEffect("BLACK_SCREEN", hero, hero, 0, 0, 0, TRUE);

	B_TransferInventory_All (hero, PC_Itemholder);

	Mob_CreateItems	("ECHSENTRUHE", ItSe_HeroPocket, 1);

	Mod_Echsis = 2;

	Log_CreateTopic	(TOPIC_MOD_ECHSEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ECHSEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ECHSEN, "Ich hab mich der Echse ergeben, die mich nach meiner Verwandlung erwischt hat. Sie hat mich in die Stadt gebracht und mir alles abgenommen, was ich dabei hatte.");
};

FUNC VOID Info_Mod_EchsePatroullie_01_Hi_A()
{
	AI_DrawWeapon	(hero);

	Info_ClearChoices	(Info_Mod_EchsePatroullie_01_Hi);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_GuildEnemy, 0);

	Mod_Echsis = 1;
};

INSTANCE Info_Mod_EchsePatroullie_01_EXIT (C_INFO)
{
	npc		= Mod_12002_DRA_Patroullie_AW;
	nr		= 1;
	condition	= Info_Mod_EchsePatroullie_01_EXIT_Condition;
	information	= Info_Mod_EchsePatroullie_01_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_EchsePatroullie_01_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_EchsePatroullie_01_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};