INSTANCE Info_Mod_Bandit_AtXardas_Hi (C_INFO)
{
	npc		= Mod_7772_BDT_Bandit_NW;
	nr		= 1;
	condition	= Info_Mod_Bandit_AtXardas_Hi_Condition;
	information	= Info_Mod_Bandit_AtXardas_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bandit_AtXardas_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bandit_AtXardas_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Bandit_AtXardas_Hi_06_00"); //He! Seit wann verirren sich Schwächlinge hierher?
};

INSTANCE Info_Mod_Bandit_AtXardas_Bereuen (C_INFO)
{
	npc		= Mod_7772_BDT_Bandit_NW;
	nr		= 1;
	condition	= Info_Mod_Bandit_AtXardas_Bereuen_Condition;
	information	= Info_Mod_Bandit_AtXardas_Bereuen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du wirst gleich bereuen, was du gesagt hast.";
};

FUNC INT Info_Mod_Bandit_AtXardas_Bereuen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bandit_AtXardas_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bandit_AtXardas_Bereuen_Info()
{
	AI_Output(hero, self, "Info_Mod_Bandit_AtXardas_Bereuen_15_00"); //Du wirst gleich bereuen, was du gesagt hast.
	AI_Output(self, hero, "Info_Mod_Bandit_AtXardas_Bereuen_06_01"); //(lacht) Das will ich ja sehen.

	AI_StopProcessInfos	(self);

	self.guild = GIL_STRF;
	Npc_SetTrueGuild (self, GIL_STRF);

	B_Attack	(self, hero, AR_GuildEnemy, 0);
};

INSTANCE Info_Mod_Bandit_AtXardas_WiesoHier (C_INFO)
{
	npc		= Mod_7772_BDT_Bandit_NW;
	nr		= 1;
	condition	= Info_Mod_Bandit_AtXardas_WiesoHier_Condition;
	information	= Info_Mod_Bandit_AtXardas_WiesoHier_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wieso seid ihr hier?";
};

FUNC INT Info_Mod_Bandit_AtXardas_WiesoHier_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bandit_AtXardas_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bandit_AtXardas_WiesoHier_Info()
{
	AI_Output(hero, self, "Info_Mod_Bandit_AtXardas_WiesoHier_15_00"); //Wieso seid ihr hier?
	AI_Output(self, hero, "Info_Mod_Bandit_AtXardas_WiesoHier_06_01"); //Mann, was ist das für 'ne Frage? Das ist unser Lager. Und jetzt erzähl mal schnell, was du hier suchst, bevor ich dich einen Kopf kürzer mache.
};

INSTANCE Info_Mod_Bandit_AtXardas_Anschluss (C_INFO)
{
	npc		= Mod_7772_BDT_Bandit_NW;
	nr		= 1;
	condition	= Info_Mod_Bandit_AtXardas_Anschluss_Condition;
	information	= Info_Mod_Bandit_AtXardas_Anschluss_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kann ich mich euch anschließen?";
};

FUNC INT Info_Mod_Bandit_AtXardas_Anschluss_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bandit_AtXardas_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bandit_AtXardas_Anschluss_Info()
{
	AI_Output(hero, self, "Info_Mod_Bandit_AtXardas_Anschluss_15_00"); //Kann ich mich euch anschließen?
	AI_Output(self, hero, "Info_Mod_Bandit_AtXardas_Anschluss_06_01"); //Nein. Wir nehmen hier keine Windelträger auf, kapiert?
	AI_Output(hero, self, "Info_Mod_Bandit_AtXardas_Anschluss_15_02"); //Na gut, dann gehe ich eben wieder...
	AI_Output(self, hero, "Info_Mod_Bandit_AtXardas_Anschluss_06_03"); //Dafür ist es zu spät Freundchen. Ich werde mir jetzt mal anschauen, ob du nicht doch was Wertvolles dabei hast.

	AI_StopProcessInfos	(self);

	self.guild = GIL_STRF;
	Npc_SetTrueGuild (self, GIL_STRF);

	B_Attack	(self, hero, AR_GuildEnemy, 0);
};