INSTANCE Info_Mod_PriesterRyan_Hi (C_INFO)
{
	npc		= Mod_1951_Priester_NW;
	nr		= 1;
	condition	= Info_Mod_PriesterRyan_Hi_Condition;
	information	= Info_Mod_PriesterRyan_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_PriesterRyan_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_PriesterRyan_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_PriesterRyan_Hi_02_00"); //Ryan kann gerade nicht gestört werden. Er ist mitten in einer Zeremonie.

	Info_ClearChoices	(Info_Mod_PriesterRyan_Hi);

	Info_AddChoice	(Info_Mod_PriesterRyan_Hi, "Schöne Waffe, die du da hast.", Info_Mod_PriesterRyan_Hi_B);
	Info_AddChoice	(Info_Mod_PriesterRyan_Hi, "Davon wirst du mich sicher nicht abhalten!", Info_Mod_PriesterRyan_Hi_A);
};

FUNC VOID Info_Mod_PriesterRyan_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_PriesterRyan_Hi_B_15_00"); //Schöne Waffe, die du da hast.
	AI_Output(self, hero, "Info_Mod_PriesterRyan_Hi_B_02_01"); //Der Drei-Götter-Stab ist unsere wichtigste Reliquie. Jeden Tag treibt er jedem unserer Anhänger böse Gedanken aus.

	Info_ClearChoices	(Info_Mod_PriesterRyan_Hi);

	Info_AddChoice	(Info_Mod_PriesterRyan_Hi, "(Feilschen) Gibst du ihn mir freiwillig oder muss ich ihn holen kommen?", Info_Mod_PriesterRyan_Hi_D);
	Info_AddChoice	(Info_Mod_PriesterRyan_Hi, "Der Zahnstocher wird sich gut in meiner Sammlung machen.", Info_Mod_PriesterRyan_Hi_C);
};

FUNC VOID Info_Mod_PriesterRyan_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_PriesterRyan_Hi_A_15_00"); //Davon wirst du mich sicher nicht abhalten!
	AI_Output(self, hero, "DEFAULT"); //

	Info_ClearChoices	(Info_Mod_PriesterRyan_Hi);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_GuildEnemy, 0);

	self.guild = GIL_STRF;
	Npc_SetTrueGuild	(self, GIL_STRF);

	Mod_1943_Waechter_01_NW.guild = GIL_STRF;
	Npc_SetTrueGuild	(Mod_1943_Waechter_01_NW, GIL_STRF);

	Mod_1952_Waechter_08_NW.guild = GIL_STRF;
	Npc_SetTrueGuild	(Mod_1952_Waechter_08_NW, GIL_STRF);

	Mod_1944_Waechter_02_NW.guild = GIL_STRF;
	Npc_SetTrueGuild	(Mod_1944_Waechter_02_NW, GIL_STRF);

	Mod_1945_Waechter_03_NW.guild = GIL_STRF;
	Npc_SetTrueGuild	(Mod_1945_Waechter_03_NW, GIL_STRF);

	Mod_1946_Waechter_04_NW.guild = GIL_STRF;
	Npc_SetTrueGuild	(Mod_1946_Waechter_04_NW, GIL_STRF);

	Mod_1947_Waechter_05_NW.guild = GIL_STRF;
	Npc_SetTrueGuild	(Mod_1947_Waechter_05_NW, GIL_STRF);

	Mod_1948_Waechter_06_NW.guild = GIL_STRF;
	Npc_SetTrueGuild	(Mod_1948_Waechter_06_NW, GIL_STRF);

	Mod_1949_Waechter_07_NW.guild = GIL_STRF;
	Npc_SetTrueGuild	(Mod_1949_Waechter_07_NW, GIL_STRF);
};

FUNC VOID Info_Mod_PriesterRyan_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_PriesterRyan_Hi_D_15_00"); //Gibst du ihn mir freiwillig oder muss ich ihn holen kommen?
	AI_Output(hero, self, "Info_Mod_PriesterRyan_Hi_D_15_01"); //Soll heißen: Wenn du hier lebend rauskommen willst, solltest du jetzt ganz brav sein.

	if (self.aivar[AIV_Verhandlung] == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_PriesterRyan_Hi_D_02_02"); //(schluckt) Wollen uns die Götter bestrafen? Aber wofür?

		B_GiveInvItems	(self, hero, DreiGoetterStab, 1);

		Info_ClearChoices	(Info_Mod_PriesterRyan_Hi);

		AI_StopProcessInfos	(self);

		B_StartOtherRoutine	(self, "TOT");

		B_RemoveNpc	(Mod_1952_Waechter_08_NW);
		B_RemoveNpc	(Mod_1943_Waechter_01_NW);
		B_RemoveNpc	(Mod_1944_Waechter_02_NW);
		B_RemoveNpc	(Mod_1945_Waechter_03_NW);
		B_RemoveNpc	(Mod_1946_Waechter_04_NW);
		B_RemoveNpc	(Mod_1947_Waechter_05_NW);
		B_RemoveNpc	(Mod_1948_Waechter_06_NW);
		B_RemoveNpc	(Mod_1949_Waechter_07_NW);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_PriesterRyan_Hi_D_02_03"); //Ha, du unterschätzt meine Macht!
	};
};

FUNC VOID Info_Mod_PriesterRyan_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_PriesterRyan_Hi_C_15_00"); //Der Zahnstocher wird sich gut in meiner Sammlung machen.
	AI_Output(self, hero, "DEFAULT"); //

	Info_ClearChoices	(Info_Mod_PriesterRyan_Hi);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_GuildEnemy, 0);

	self.guild = GIL_STRF;
	Npc_SetTrueGuild	(self, GIL_STRF);

	Mod_1943_Waechter_01_NW.guild = GIL_STRF;
	Npc_SetTrueGuild	(Mod_1943_Waechter_01_NW, GIL_STRF);

	Mod_1952_Waechter_08_NW.guild = GIL_STRF;
	Npc_SetTrueGuild	(Mod_1952_Waechter_08_NW, GIL_STRF);

	Mod_1944_Waechter_02_NW.guild = GIL_STRF;
	Npc_SetTrueGuild	(Mod_1944_Waechter_02_NW, GIL_STRF);

	Mod_1945_Waechter_03_NW.guild = GIL_STRF;
	Npc_SetTrueGuild	(Mod_1945_Waechter_03_NW, GIL_STRF);

	Mod_1946_Waechter_04_NW.guild = GIL_STRF;
	Npc_SetTrueGuild	(Mod_1946_Waechter_04_NW, GIL_STRF);

	Mod_1947_Waechter_05_NW.guild = GIL_STRF;
	Npc_SetTrueGuild	(Mod_1947_Waechter_05_NW, GIL_STRF);

	Mod_1948_Waechter_06_NW.guild = GIL_STRF;
	Npc_SetTrueGuild	(Mod_1948_Waechter_06_NW, GIL_STRF);

	Mod_1949_Waechter_07_NW.guild = GIL_STRF;
	Npc_SetTrueGuild	(Mod_1949_Waechter_07_NW, GIL_STRF);
};