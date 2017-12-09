INSTANCE Info_Mod_Suchender_DT_Hi (C_INFO)
{
	npc		= Mod_7543_DMT_Suchender_DT;
	nr		= 1;
	condition	= Info_Mod_Suchender_DT_Hi_Condition;
	information	= Info_Mod_Suchender_DT_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ha. Wieder erwischt.";
};

FUNC INT Info_Mod_Suchender_DT_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Suchender_DT_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Suchender_DT_Hi_15_00"); //Ha. Wieder erwischt. Jetzt weiß ich auch, was dein Zuhause ist. Diesmal entkommst du mir nicht!
	AI_Output(self, hero, "Info_Mod_Suchender_DT_Hi_10_01"); //Ha. Du schon wieder! Diesmal verschon ich dich nicht!
	AI_Output(hero, self, "Info_Mod_Suchender_DT_Hi_15_02"); //Mal langsam. Was treibt dich eigentlich um?
	AI_Output(self, hero, "Info_Mod_Suchender_DT_Hi_10_03"); //Ich bin der Diener meines Herrn, Khorgor, dem Göttlichen.
	AI_Output(hero, self, "Info_Mod_Suchender_DT_Hi_15_04"); //Was ist so göttlich an ihm?
	AI_Output(self, hero, "Info_Mod_Suchender_DT_Hi_10_05"); //Mein Herr wird Herr über das Chaos sein, wenn die Bewahrer des Gleichgewichts, die Wassermagier und die Waldleute, erst vernichtet sind.
};

INSTANCE Info_Mod_Suchender_DT_Option01 (C_INFO)
{
	npc		= Mod_7543_DMT_Suchender_DT;
	nr		= 1;
	condition	= Info_Mod_Suchender_DT_Option01_Condition;
	information	= Info_Mod_Suchender_DT_Option01_Info;
	permanent	= 0;
	important	= 0;
	description	= "Verstehe. Sag, könnte ich vielleicht eurem Verein beitreten?";
};

FUNC INT Info_Mod_Suchender_DT_Option01_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Suchender_DT_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Suchender_DT_Option01_Info()
{
	AI_Output(hero, self, "Info_Mod_Suchender_DT_Option01_15_00"); //Verstehe. Sag, könnte ich vielleicht eurem Verein beitreten?
	AI_Output(self, hero, "Info_Mod_Suchender_DT_Option01_10_01"); //Du? Ich weiß nicht ...
	AI_Output(hero, self, "Info_Mod_Suchender_DT_Option01_15_02"); //Warum nicht? Bin schon lange nicht mehr damit einverstanden, was die anderen so treiben.
	AI_Output(self, hero, "Info_Mod_Suchender_DT_Option01_10_03"); //Das muss der Meister entscheiden. Ich werde ihn fragen. Warte hier.

	AI_GotoWP	(self, "DT_037");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Suchender_DT_Option02 (C_INFO)
{
	npc		= Mod_7543_DMT_Suchender_DT;
	nr		= 1;
	condition	= Info_Mod_Suchender_DT_Option02_Condition;
	information	= Info_Mod_Suchender_DT_Option02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Aha! Deshalb seid ihr hinter uns und den Druiden her.";
};

FUNC INT Info_Mod_Suchender_DT_Option02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Suchender_DT_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Suchender_DT_Option02_Info()
{
	AI_Output(hero, self, "Info_Mod_Suchender_DT_Option02_15_00"); //Aha! Deshalb seid ihr hinter uns und den Druiden her.
	AI_Output(self, hero, "Info_Mod_Suchender_DT_Option02_10_01"); //Du hast es kapiert. Nun stirb!

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_GuildEnemy, 0);
};