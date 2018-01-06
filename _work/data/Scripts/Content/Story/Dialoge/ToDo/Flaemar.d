INSTANCE Info_Mod_Flaemar_Hi (C_INFO)
{
	npc		= Mod_7791_SFB_Flaemar_PAT;
	nr		= 1;
	condition	= Info_Mod_Flaemar_Hi_Condition;
	information	= Info_Mod_Flaemar_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Flaemar_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Flaemar_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Flaemar_Hi_02_00"); //(gleichgültig) He, hab dich hier noch nie gesehen. Kommst du vielleicht von draußen?
	AI_Output(hero, self, "Info_Mod_Flaemar_Hi_15_01"); //Ja, wieso?
	AI_Output(self, hero, "Info_Mod_Flaemar_Hi_02_02"); //(aufhorchend) Hast du vielleicht paar Krautstängel dabei, oder einen guten Schluck Bier und Waholder?
	AI_Output(self, hero, "Info_Mod_Flaemar_Hi_02_03"); //(missmutig) Meine, hier im Kloster ist seit der Belagerung echt alles für den Arsch – keine Händler da, oder sonst was los - und das einzige was die hier haben, um die Zeit irgendwie totzuschlagen, ist dieser Klosterwein ... und auch damit werden sie immer geiziger ...

	B_StartMangel();

	B_LogEntry	(TOPIC_MOD_FM_MANGEL, "Flämar und seine Schürferkollegen sind verzweifelt auf der Suche nach etwas Kraut und Alkohol, um sich abzulenken.");
};

FUNC VOID Info_Mod_Flaemar_MangelQuest_Fertig()
{
	AI_Output(self, hero, "Info_Mod_Flaemar_MangelQuest_Fertig_02_00"); //Jedenfalls haben wir jetzt alles, was man sich nur wünschen kann.
	AI_Output(self, hero, "Info_Mod_Flaemar_MangelQuest_Fertig_02_01"); //Hier, Mann, nimm unser Gold und das Erz.

	B_ShowGivenThings	("752 Gold und 2 Erzbrocken erhalten");

	AI_Output(self, hero, "Info_Mod_Flaemar_MangelQuest_Fertig_02_02"); //Hier können wir im Moment eh nichts damit anfangen.

	B_GivePlayerXP	(300);

	CreateInvItems	(hero, ItMi_Gold, 752);
	CreateInvItems	(hero, ItMi_Nugget, 2);

	B_LogEntry	(TOPIC_MOD_FM_MANGEL, "Flämar und die Schürfer sind mit allem versorgt.");

	B_StopMangel();
};

INSTANCE Info_Mod_Flaemar_MangelQuest (C_INFO)
{
	npc		= Mod_7791_SFB_Flaemar_PAT;
	nr		= 1;
	condition	= Info_Mod_Flaemar_MangelQuest_Condition;
	information	= Info_Mod_Flaemar_MangelQuest_Info;
	permanent	= 1;
	important	= 0;
	description	= "(Kraut geben)";
};

FUNC INT Info_Mod_Flaemar_MangelQuest_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Flaemar_Hi))
	&& (Mod_PAT_FlaemarKraut < 15)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Flaemar_MangelQuest_F()
{
	Info_ClearChoices	(Info_Mod_Flaemar_MangelQuest);

	Info_AddChoice	(Info_Mod_Flaemar_MangelQuest, DIALOG_BACK, Info_Mod_Flaemar_MangelQuest_BACK);

	if (Npc_HasItems(hero, ItMi_Traumruf) >= 1)
	{
		Info_AddChoice	(Info_Mod_Flaemar_MangelQuest, "Traumruf", Info_Mod_Flaemar_MangelQuest_D);
	};
	if (Npc_HasItems(hero, ItMi_Addon_Joint_02) >= 1)
	{
		Info_AddChoice	(Info_Mod_Flaemar_MangelQuest, "Schwarzer Weiser", Info_Mod_Flaemar_MangelQuest_C);
	};
	if (Npc_HasItems(hero, ItMi_Addon_Joint_01) >= 1)
	{
		Info_AddChoice	(Info_Mod_Flaemar_MangelQuest, "Grüner Novize", Info_Mod_Flaemar_MangelQuest_B);
	};
	if (Npc_HasItems(hero, ItMi_Joint) >= 1)
	{
		Info_AddChoice	(Info_Mod_Flaemar_MangelQuest, "Sumpfkrautstängel", Info_Mod_Flaemar_MangelQuest_A);
	};
};

FUNC VOID Info_Mod_Flaemar_MangelQuest_Info()
{
	Info_Mod_Flaemar_MangelQuest_F();
};

FUNC VOID Info_Mod_Flaemar_MangelQuest_BACK()
{
	Info_ClearChoices	(Info_Mod_Flaemar_MangelQuest);
};

FUNC VOID Info_Mod_Flaemar_MangelQuest_E()
{
	AI_Output(self, hero, "Info_Mod_Flaemar_MangelQuest_E_02_00"); //Ich glaub’s nicht ... so viel Kraut. Das reicht erst mal für einige Zeit.

	if (Mod_PAT_FlaemarAlkohol >= 15)
	{
		Info_Mod_Flaemar_MangelQuest_Fertig();
	};

	Info_ClearChoices	(Info_Mod_Flaemar_MangelQuest);
};

FUNC VOID Info_Mod_Flaemar_MangelQuest_D()
{
	B_GiveInvItems	(hero, self, ItMi_Traumruf, 1);

	Mod_PAT_FlaemarKraut += 3;

	if (Mod_PAT_FlaemarKraut < 15) {
		Info_Mod_Flaemar_MangelQuest_F();
	} else {
		Info_Mod_Flaemar_MangelQuest_E();
	};
};

FUNC VOID Info_Mod_Flaemar_MangelQuest_C()
{
	B_GiveInvItems	(hero, self, ItMi_Addon_Joint_02, 1);

	Mod_PAT_FlaemarKraut += 2;

	if (Mod_PAT_FlaemarKraut < 15) {
		Info_Mod_Flaemar_MangelQuest_F();
	} else {
		Info_Mod_Flaemar_MangelQuest_E();
	};
};

FUNC VOID Info_Mod_Flaemar_MangelQuest_B()
{
	B_GiveInvItems	(hero, self, ItMi_Addon_Joint_01, 1);

	Mod_PAT_FlaemarKraut += 1;

	if (Mod_PAT_FlaemarKraut < 15) {
		Info_Mod_Flaemar_MangelQuest_F();
	} else {
		Info_Mod_Flaemar_MangelQuest_E();
	};
};

FUNC VOID Info_Mod_Flaemar_MangelQuest_A()
{
	B_GiveInvItems	(hero, self, ItMi_Joint, 1);

	Mod_PAT_FlaemarKraut += 1;

	if (Mod_PAT_FlaemarKraut < 15) {
		Info_Mod_Flaemar_MangelQuest_F();
	} else {
		Info_Mod_Flaemar_MangelQuest_E();
	};
};

INSTANCE Info_Mod_Flaemar_MangelQuest2 (C_INFO)
{
	npc		= Mod_7791_SFB_Flaemar_PAT;
	nr		= 1;
	condition	= Info_Mod_Flaemar_MangelQuest2_Condition;
	information	= Info_Mod_Flaemar_MangelQuest2_Info;
	permanent	= 1;
	important	= 0;
	description	= "(Alkohol geben)";
};

FUNC INT Info_Mod_Flaemar_MangelQuest2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Flaemar_Hi))
	&& (Mod_PAT_FlaemarAlkohol < 15)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Flaemar_MangelQuest2_F()
{
	Info_ClearChoices	(Info_Mod_Flaemar_MangelQuest2);

	Info_AddChoice	(Info_Mod_Flaemar_MangelQuest2, DIALOG_BACK, Info_Mod_Flaemar_MangelQuest2_BACK);

	if (Npc_HasItems(hero, ItFo_Addon_Rum) >= 1)
	{
		Info_AddChoice	(Info_Mod_Flaemar_MangelQuest2, "Rum", Info_Mod_Flaemar_MangelQuest2_D);
	};
	if (Npc_HasItems(hero, ItFo_Addon_Grog) >= 1)
	{
		Info_AddChoice	(Info_Mod_Flaemar_MangelQuest2, "Grog", Info_Mod_Flaemar_MangelQuest2_C);
	};
	if (Npc_HasItems(hero, ItFo_Booze) >= 1)
	{
		Info_AddChoice	(Info_Mod_Flaemar_MangelQuest2, "Wacholder", Info_Mod_Flaemar_MangelQuest2_B);
	};
	if (Npc_HasItems(hero, ItFo_Beer) >= 1)
	{
		Info_AddChoice	(Info_Mod_Flaemar_MangelQuest2, "Bier", Info_Mod_Flaemar_MangelQuest2_A);
	};
};

FUNC VOID Info_Mod_Flaemar_MangelQuest2_Info()
{
	Info_Mod_Flaemar_MangelQuest2_F();
};

FUNC VOID Info_Mod_Flaemar_MangelQuest2_BACK()
{
	Info_ClearChoices	(Info_Mod_Flaemar_MangelQuest2);
};

FUNC VOID Info_Mod_Flaemar_MangelQuest2_E()
{
	AI_Output(self, hero, "Info_Mod_Flaemar_MangelQuest2_E_02_00"); //Hey, Mann, danke. Damit können wir es uns erst mal die nächsten Tage richtig gut gehen lassen.

	if (Mod_PAT_FlaemarKraut >= 15)
	{
		Info_Mod_Flaemar_MangelQuest_Fertig();
	};

	Info_ClearChoices	(Info_Mod_Flaemar_MangelQuest2);
};

FUNC VOID Info_Mod_Flaemar_MangelQuest2_D()
{
	B_GiveInvItems	(hero, self, ItFo_Addon_Rum, 1);

	Mod_PAT_FlaemarAlkohol += 2;

	if (Mod_PAT_FlaemarAlkohol < 15) {
		Info_Mod_Flaemar_MangelQuest2_F();
	} else {
		Info_Mod_Flaemar_MangelQuest2_E();
	};
};

FUNC VOID Info_Mod_Flaemar_MangelQuest2_C()
{
	B_GiveInvItems	(hero, self, ItFo_Addon_Grog, 1);

	Mod_PAT_FlaemarAlkohol += 2;

	if (Mod_PAT_FlaemarAlkohol < 15) {
		Info_Mod_Flaemar_MangelQuest2_F();
	} else {
		Info_Mod_Flaemar_MangelQuest2_E();
	};
};

FUNC VOID Info_Mod_Flaemar_MangelQuest2_B()
{
	B_GiveInvItems	(hero, self, ItFo_Booze, 1);

	Mod_PAT_FlaemarAlkohol += 1;

	if (Mod_PAT_FlaemarAlkohol < 15) {
		Info_Mod_Flaemar_MangelQuest2_F();
	} else {
		Info_Mod_Flaemar_MangelQuest2_E();
	};
};

FUNC VOID Info_Mod_Flaemar_MangelQuest2_A()
{
	B_GiveInvItems	(hero, self, ItFo_Beer, 1);

	Mod_PAT_FlaemarAlkohol += 1;

	if (Mod_PAT_FlaemarAlkohol < 15) {
		Info_Mod_Flaemar_MangelQuest2_F();
	} else {
		Info_Mod_Flaemar_MangelQuest2_E();
	};
};

INSTANCE Info_Mod_Flaemar_EXIT (C_INFO)
{
	npc		= Mod_7791_SFB_Flaemar_PAT;
	nr		= 1;
	condition	= Info_Mod_Flaemar_EXIT_Condition;
	information	= Info_Mod_Flaemar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Flaemar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Flaemar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};