INSTANCE Info_Mod_Pendler_02_Hi (C_INFO)
{
	npc		= Mod_7707_OUT_Pendler_REL;
	nr		= 1;
	condition	= Info_Mod_Pendler_02_Hi_Condition;
	information	= Info_Mod_Pendler_02_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du siehst durstig aus. Wie wär's mit einem Schluck kühlem Bier?";
};

FUNC INT Info_Mod_Pendler_02_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Pendler_02_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Pendler_02_Hi_15_00"); //Du siehst durstig aus. Wie wär's mit einem Schluck kühlem Bier?
	AI_Output(self, hero, "Info_Mod_Pendler_02_Hi_08_01"); //(stöhnt) Gib schon, gib schon!

	Info_ClearChoices	(Info_Mod_Pendler_02_Hi);

	if (Npc_HasItems(hero, ItFo_Beer) >= 1)
	{
		Info_AddChoice	(Info_Mod_Pendler_02_Hi, "Ich hab's mir anders überlegt: Schau mir doch beim Trinken zu!", Info_Mod_Pendler_02_Hi_C);
	};
	Info_AddChoice	(Info_Mod_Pendler_02_Hi, "Ich hab leider keins mehr.", Info_Mod_Pendler_02_Hi_B);
	if (Npc_HasItems(hero, ItFo_Beer) >= 1)
	{
		Info_AddChoice	(Info_Mod_Pendler_02_Hi, "Da hast du eins.", Info_Mod_Pendler_02_Hi_A);
	};
};

FUNC VOID Info_Mod_Pendler_02_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_Pendler_02_Hi_C_15_00"); //Ich hab's mir anders überlegt: Schau mir doch beim Trinken zu!

	B_UseItem	(hero, ItFo_Beer);

	AI_Output(self, hero, "Info_Mod_Pendler_02_Hi_C_08_01"); //Verpiss dich, du mieser Arsch!

	Info_ClearChoices	(Info_Mod_Pendler_02_Hi);
};

FUNC VOID Info_Mod_Pendler_02_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Pendler_02_Hi_B_15_00"); //Ich hab leider keins mehr.
	AI_Output(self, hero, "Info_Mod_Pendler_02_Hi_B_08_01"); //Ich auch nicht, und dabei schleift meine Zunge jetzt schon aufm Boden.
	AI_Output(self, hero, "Info_Mod_Pendler_02_Hi_B_08_02"); //Nachher wird bei Ditmar erst mal ordentlich was gestürzt.

	Info_ClearChoices	(Info_Mod_Pendler_02_Hi);
};

FUNC VOID Info_Mod_Pendler_02_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Pendler_02_Hi_A_15_00"); //Da hast du eins.

	B_GiveInvItems	(hero, self, ItFo_Beer, 1);

	B_UseItem	(self, ItFo_Beer);

	AI_Output(self, hero, "Info_Mod_Pendler_02_Hi_A_08_01"); //Verflucht, das ist das Einzige, woran ich den ganzen Tag denken kann. Danke, Mann!

	B_GivePlayerXP	(25);

	Info_ClearChoices	(Info_Mod_Pendler_02_Hi);
};

INSTANCE Info_Mod_Pendler_02_EXIT (C_INFO)
{
	npc		= Mod_7707_OUT_Pendler_REL;
	nr		= 1;
	condition	= Info_Mod_Pendler_02_EXIT_Condition;
	information	= Info_Mod_Pendler_02_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Pendler_02_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Pendler_02_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};