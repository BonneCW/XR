INSTANCE Info_Mod_Faros_Hi (C_INFO)
{
	npc		= Mod_1770_KDF_Faros_PAT;
	nr		= 1;
	condition	= Info_Mod_Faros_Hi_Condition;
	information	= Info_Mod_Faros_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Faros_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Faros_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Faros_Hi_09_01"); //Ich bin Faros, der Gärtner.
	AI_Output(self, hero, "Info_Mod_Faros_Hi_09_02"); //Ich bin der Chef vom Kräutergarten.
};

INSTANCE Info_Mod_Faros_MangelQuest (C_INFO)
{
	npc		= Mod_1770_KDF_Faros_PAT;
	nr		= 1;
	condition	= Info_Mod_Faros_MangelQuest_Condition;
	information	= Info_Mod_Faros_MangelQuest_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie läuft die Gartenarbeit?";
};

FUNC INT Info_Mod_Faros_MangelQuest_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Faros_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Faros_MangelQuest_Info()
{
	AI_Output(hero, self, "Info_Mod_Faros_MangelQuest_15_00"); //Wie läuft die Gartenarbeit?
	AI_Output(self, hero, "Info_Mod_Faros_MangelQuest_09_01"); //Miserabel. Da hilft es auch nicht, das Turgas immer alles schönreden will.
	AI_Output(hero, self, "Info_Mod_Faros_MangelQuest_15_02"); //Was ist los?
	AI_Output(self, hero, "Info_Mod_Faros_MangelQuest_09_03"); //Na sieh dich doch mal um! Unter den Pflanzen grassiert eine Pilzinfektion und ich habe das verdammte Fungizid dagegen nicht.
	AI_Output(self, hero, "Info_Mod_Faros_MangelQuest_09_04"); //Dabei hat außerhalb des Belagerungsringes jeder beliebige Alchemisten- oder Kräuterfutzi dieses Zeug. Es ist zu frustrierend.

	B_StartMangel();

	B_LogEntry	(TOPIC_MOD_FM_MANGEL, "Faros hat sich beklagt, dass in seinem Kräutergarten eine Pilzinfektion wütet. Er meinte, dass jeder Alchemist und Kräuterkundler draußen ein Gegenmittel hätte.");
};

INSTANCE Info_Mod_Faros_MangelQuest2 (C_INFO)
{
	npc		= Mod_1770_KDF_Faros_PAT;
	nr		= 1;
	condition	= Info_Mod_Faros_MangelQuest2_Condition;
	information	= Info_Mod_Faros_MangelQuest2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe hier was gegen die Pilzinfektion ...";
};

FUNC INT Info_Mod_Faros_MangelQuest2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Faros_MangelQuest))
	&& (Npc_HasItems(hero, ItMi_Fungizid) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Faros_MangelQuest2_Info()
{
	AI_Output(hero, self, "Info_Mod_Faros_MangelQuest2_15_00"); //Ich habe hier was gegen die Pilzinfektion ...

	B_GiveInvItems	(hero, self, ItMi_Fungizid, 1);

	AI_Output(self, hero, "Info_Mod_Faros_MangelQuest2_09_01"); //Was? Zeig her ... Tatsächlich, das scheint es zu sein. Ich muss es sofort ausprobieren.

	AI_PlayAni	(hero, "T_PLUNDER");

	AI_Output(self, hero, "Info_Mod_Faros_MangelQuest2_09_02"); //Ja, es wirkt. Damit wird diese Pilzgeschichte in wenigen Tagen der Vergangenheit angehören. Tausend Dank.
	AI_Output(self, hero, "Info_Mod_Faros_MangelQuest2_09_03"); //Hier, nimm einige meiner besten Kräuter zur Belohnung. Innos sei mit dir.

	B_ShowGivenThings	("Kronstöckl, 4 Feldknöterich und 5 Feuerwurzel erhalten");

	CreateInvItems	(hero, ItPl_Perm_Herb, 1);
	CreateInvItems	(hero, ItPl_Temp_Herb, 4);
	CreateInvItems	(hero, ItPl_Mana_Herb_03, 5);

	B_GivePlayerXP	(300);

	B_LogEntry	(TOPIC_MOD_FM_MANGEL, "Faros Pilzproblem ist gelöst.");

	B_StopMangel();
};

INSTANCE Info_Mod_Faros_Fake (C_INFO)
{
	npc		= Mod_1770_KDF_Faros_PAT;
	nr		= 1;
	condition	= Info_Mod_Faros_Fake_Condition;
	information	= Info_Mod_Faros_Fake_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ist hier ein seltsamer Magier gewesen?";
};

FUNC INT Info_Mod_Faros_Fake_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Paladin01_Fake))
	&& (Npc_KnowsInfo(hero, Info_Mod_Faros_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Faros_Fake_Info()
{
	AI_Output(hero, self, "Info_Mod_Faros_Fake_15_00"); //Ist hier ein seltsamer Magier gewesen?
	AI_Output(self, hero, "Info_Mod_Faros_Fake_09_01"); //Ja, allerdings. Da war so ein Kerl, der es ziemlich eilig hatte. Er hat sich umgeschaut und dann was von Bibliothek gemurmelt. Dann ist er verschwunden.

	B_LogEntry	(TOPIC_MOD_FM_SM, "Faros hat mir erzählt, dass der Magier etwas von der Bibliothek gemurmelt hat. Vielleicht sollte ich mich dort mal umsehen.");
};

INSTANCE Info_Mod_Faros_EXIT (C_INFO)
{
	npc		= Mod_1770_KDF_Faros_PAT;
	nr		= 1;
	condition	= Info_Mod_Faros_EXIT_Condition;
	information	= Info_Mod_Faros_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Faros_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Faros_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};