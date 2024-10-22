INSTANCE Info_Mod_Hexe_PAT_Fokus05_Hi (C_INFO)
{
	npc		= Mod_7796_HEX_Hexe_PAT;
	nr		= 1;
	condition	= Info_Mod_Hexe_PAT_Fokus05_Hi_Condition;
	information	= Info_Mod_Hexe_PAT_Fokus05_Hi_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Hexe_PAT_Fokus05_Hi_Condition()
{
	if (Npc_RefuseTalk(self) == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hexe_PAT_Fokus05_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Hexe_PAT_Fokus05_Hi_17_00"); //Na du erbärmlicher Schlappschwanz. Jämmerlicher Versager, du. Willst du dich vielleicht mit mir anlegen?

	Info_ClearChoices	(Info_Mod_Hexe_PAT_Fokus05_Hi);

	Info_AddChoice	(Info_Mod_Hexe_PAT_Fokus05_Hi, "Ich werde dir mal dein Schandmaul stopfen, du alte Vettel. Komm her!", Info_Mod_Hexe_PAT_Fokus05_Hi_B);
	Info_AddChoice	(Info_Mod_Hexe_PAT_Fokus05_Hi, "Beruhige dich, gute Frau. Ich will nur diesen Fokus hier holen.", Info_Mod_Hexe_PAT_Fokus05_Hi_A);
};

FUNC VOID Info_Mod_Hexe_PAT_Fokus05_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Hexe_PAT_Fokus05_Hi_B_15_00"); //Ich werde dir mal dein Schandmaul stopfen, du alte Vettel. Komm her!
	AI_Output(self, hero, "Info_Mod_Hexe_PAT_Fokus05_Hi_B_17_01"); //Das kannst du haben, Großmaul!

	Info_ClearChoices	(Info_Mod_Hexe_PAT_Fokus05_Hi);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_KILL, 0);

	Npc_SetRefuseTalk	(self, 120);
};

FUNC VOID Info_Mod_Hexe_PAT_Fokus05_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Hexe_PAT_Fokus05_Hi_A_15_00"); //Beruhige dich, gute Frau. Ich will nur diesen Fokus hier holen.
	AI_Output(self, hero, "Info_Mod_Hexe_PAT_Fokus05_Hi_A_17_01"); //Nur über meine Leiche.

	Info_ClearChoices	(Info_Mod_Hexe_PAT_Fokus05_Hi);

	AI_StopProcessInfos	(self);

	self.guild = GIL_STRF;
	Npc_SetTrueGuild	(self, GIL_STRF);

	B_LogEntry	(TOPIC_MOD_FM_FOKI, "Von so einer Zicke lass ich mich doch nicht provozieren. Vernünftig wie ich bin.");

	Mod_PAT_Focus_05 = 1;
};

INSTANCE Info_Mod_Hexe_PAT_Fokus05_EXIT (C_INFO)
{
	npc		= Mod_7796_HEX_Hexe_PAT;
	nr		= 1;
	condition	= Info_Mod_Hexe_PAT_Fokus05_EXIT_Condition;
	information	= Info_Mod_Hexe_PAT_Fokus05_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Hexe_PAT_Fokus05_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hexe_PAT_Fokus05_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};