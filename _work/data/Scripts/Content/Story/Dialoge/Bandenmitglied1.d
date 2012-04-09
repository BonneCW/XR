INSTANCE Info_Mod_Bandenmitglied1_Hi (C_INFO)
{
	npc		= Mod_1892_NONE_Bandenmitglied1_NW;
	nr		= 1;
	condition	= Info_Mod_Bandenmitglied1_Hi_Condition;
	information	= Info_Mod_Bandenmitglied1_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Bandenmitglied1_Hi_Condition()
{
	if (!Npc_KnowsInfo(hero, Info_Mod_Bandenchef_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bandenmitglied1_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Bandenmitglied1_Hi_15_00"); //Was macht du hier?
	AI_Output(self, hero, "Info_Mod_Bandenmitglied1_Hi_06_01"); //Was geht dich das an?
	AI_Output(hero, self, "Info_Mod_Bandenmitglied1_Hi_15_02"); //Wo ist dein Chef?
	AI_Output(self, hero, "Info_Mod_Bandenmitglied1_Hi_06_03"); //Ich glaube nicht, dass ich es dir sagen werde.
	AI_Output(hero, self, "Info_Mod_Bandenmitglied1_Hi_15_04"); //Dann muss ich es aus dir rausprügeln.

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_NONE, 0);
};

INSTANCE Info_Mod_Bandenmitglied1_Umgehauen (C_INFO)
{
	npc		= Mod_1892_NONE_Bandenmitglied1_NW;
	nr		= 1;
	condition	= Info_Mod_Bandenmitglied1_Umgehauen_Condition;
	information	= Info_Mod_Bandenmitglied1_Umgehauen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was nun?";
};

FUNC INT Info_Mod_Bandenmitglied1_Umgehauen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bandenmitglied1_Hi))
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bandenmitglied1_Umgehauen_Info()
{
	AI_Output(hero, self, "Info_Mod_Bandenmitglied1_Umgehauen_15_00"); //Was nun?
	AI_Output(self, hero, "Info_Mod_Bandenmitglied1_Umgehauen_06_01"); //Ich sage dir alles, aber lass mich laufen.
	AI_Output(self, hero, "Info_Mod_Bandenmitglied1_Umgehauen_06_02"); //Mein Chef ist zur Roten Laterne gegangen. Du wirst ihn allerdings nur nachts dort antreffen.
	AI_Output(hero, self, "Info_Mod_Bandenmitglied1_Umgehauen_15_03"); //Siehst du, geht doch.

	B_LogEntry	(TOPIC_MOD_RAMIREZ_BANDE, "Ein Bandenmitglied hat mir verraten, dass der Bandenchef nachts bei der Roten Laterne zu finden ist.");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Bandenmitglied1_EXIT (C_INFO)
{
	npc		= Mod_1892_NONE_Bandenmitglied1_NW;
	nr		= 1;
	condition	= Info_Mod_Bandenmitglied1_EXIT_Condition;
	information	= Info_Mod_Bandenmitglied1_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Bandenmitglied1_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bandenmitglied1_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};