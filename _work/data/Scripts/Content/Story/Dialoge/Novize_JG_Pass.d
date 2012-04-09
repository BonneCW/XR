INSTANCE Info_Mod_Novize_JG_Pass_Hi (C_INFO)
{
	npc		= Mod_7435_NOV_Novize_MT;
	nr		= 1;
	condition	= Info_Mod_Novize_JG_Pass_Hi_Condition;
	information	= Info_Mod_Novize_JG_Pass_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Novize_JG_Pass_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Novize_JG_Pass_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Novize_JG_Pass_Hi_03_00"); //(wimmernd) Habt Gnade mit mir, ich werde auch nichts mehr tun, ehrlich.

	Info_ClearChoices	(Info_Mod_Novize_JG_Pass_Hi);

	Info_AddChoice	(Info_Mod_Novize_JG_Pass_Hi, "Warum hast du mich angegriffen?", Info_Mod_Novize_JG_Pass_Hi_B);
	Info_AddChoice	(Info_Mod_Novize_JG_Pass_Hi, "Vergiss es, stirb.", Info_Mod_Novize_JG_Pass_Hi_A);
};

FUNC VOID Info_Mod_Novize_JG_Pass_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Novize_JG_Pass_Hi_B_15_00"); //Warum hast du mich angegriffen?
	AI_Output(self, hero, "Info_Mod_Novize_JG_Pass_Hi_B_03_01"); //Ich ... ich konnte nicht anders. Er hat mich dazu gezwungen.
	AI_Output(hero, self, "Info_Mod_Novize_JG_Pass_Hi_B_15_02"); //Wer hat Dich dazu gezwungen?
	AI_Output(self, hero, "Info_Mod_Novize_JG_Pass_Hi_B_03_03"); //Mein Meister. Bitte lasst mich Leben.

	Info_ClearChoices	(Info_Mod_Novize_JG_Pass_Hi);

	Info_AddChoice	(Info_Mod_Novize_JG_Pass_Hi, "Vor deinem Tod hättest du wenigstens dein Gewissen erleichtern können. Stirb.", Info_Mod_Novize_JG_Pass_Hi_D);
	Info_AddChoice	(Info_Mod_Novize_JG_Pass_Hi, "Gut, ich werde dir nichts mehr tun. Nun sage mir, wer dein Meister ist.", Info_Mod_Novize_JG_Pass_Hi_C);
};

FUNC VOID Info_Mod_Novize_JG_Pass_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_Novize_JG_Pass_Hi_D_15_00"); //Vor deinem Tod hättest du wenigstens dein Gewissen erleichtern können. Stirb.
	AI_Output(self, hero, "Info_Mod_Novize_JG_Pass_Hi_D_03_01"); //Meister ...

	Info_ClearChoices	(Info_Mod_Novize_JG_Pass_Hi);

	AI_StopProcessInfos	(self);

	self.guild = GIL_STRF;
	Npc_SetTrueGuild (self, GIL_STRF);

	B_Attack	(self, hero, AR_GuildEnemy, 0);
};

FUNC VOID Info_Mod_Novize_JG_Pass_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_Novize_JG_Pass_Hi_C_15_00"); //Gut, ich werde dir nichts mehr tun. Nun sage mir, wer dein Meister ist.
	AI_Output(self, hero, "Info_Mod_Novize_JG_Pass_Hi_C_03_01"); //Ich kann nicht, er bringt mich dafür um. Lasst mich bitte gehen.

	Info_ClearChoices	(Info_Mod_Novize_JG_Pass_Hi);

	Info_AddChoice	(Info_Mod_Novize_JG_Pass_Hi, "Nein. Sirb.", Info_Mod_Novize_JG_Pass_Hi_F);
	Info_AddChoice	(Info_Mod_Novize_JG_Pass_Hi, "Verschwinde und lass dich nicht wieder blicken, Feigling.", Info_Mod_Novize_JG_Pass_Hi_E);
};

FUNC VOID Info_Mod_Novize_JG_Pass_Hi_F()
{
	AI_Output(hero, self, "Info_Mod_Novize_JG_Pass_Hi_F_15_00"); //Nein. Sirb.

	Info_ClearChoices	(Info_Mod_Novize_JG_Pass_Hi);

	AI_StopProcessInfos	(self);

	self.guild = GIL_STRF;
	Npc_SetTrueGuild (self, GIL_STRF);

	B_Attack	(self, hero, AR_GuildEnemy, 0);
};

FUNC VOID Info_Mod_Novize_JG_Pass_Hi_E()
{
	AI_Output(hero, self, "Info_Mod_Novize_JG_Pass_Hi_E_15_00"); //Verschwinde und lass dich nicht wieder blicken, Feigling.

	AI_TurnAway	(hero, self);

	AI_Output(self, hero, "Info_Mod_Novize_JG_Pass_Hi_E_03_01"); //Stirb du Narr. Niemals könnte ich so unter die Augen meines Meister treten.

	Info_ClearChoices	(Info_Mod_Novize_JG_Pass_Hi);

	AI_StopProcessInfos	(self);

	self.guild = GIL_STRF;
	Npc_SetTrueGuild (self, GIL_STRF);

	B_Attack	(self, hero, AR_GuildEnemy, 0);
};

FUNC VOID Info_Mod_Novize_JG_Pass_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Novize_JG_Pass_Hi_A_15_00"); //Vergiss es, stirb.
	AI_Output(self, hero, "Info_Mod_Novize_JG_Pass_Hi_A_03_01"); //Neeeeeeein!

	Info_ClearChoices	(Info_Mod_Novize_JG_Pass_Hi);

	AI_StopProcessInfos	(self);

	self.guild = GIL_STRF;
	Npc_SetTrueGuild (self, GIL_STRF);

	B_Attack	(self, hero, AR_GuildEnemy, 0);
};