INSTANCE Info_Mod_Alchemist01_Hi (C_INFO)
{
	npc		= Mod_1739_KDF_Ordenspriester_PAT;
	nr		= 1;
	condition	= Info_Mod_Alchemist01_Hi_Condition;
	information	= Info_Mod_Alchemist01_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alchemist01_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Alchemist01_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Alchemist01_Hi_06_00"); //He, dich habe ich hier noch nie gesehen, Bruder. Bist du gerade von draußen reingekommen?
	AI_Output(hero, self, "Info_Mod_Alchemist01_Hi_15_01"); //Ja, das bin ich.
	AI_Output(self, hero, "Info_Mod_Alchemist01_Hi_06_02"); //Hast du zufällig einige Kräuter bei dir?
	AI_Output(self, hero, "Info_Mod_Alchemist01_Hi_06_03"); //Durch die Belagerung herrscht hier nämlich Mangel an allem und es sind vor allem die Tränke, die uns zu dieser schweren Stunde Kraft geben den Angriffen des Feindes zu widerstehen.
	AI_Output(self, hero, "Info_Mod_Alchemist01_Hi_06_04"); //Nur gehen uns eben langsam die Zutaten für diese aus.
	AI_Output(self, hero, "Info_Mod_Alchemist01_Hi_06_05"); //Wenn du mir also eine Hand voll verschiedener Kräuter besorgen könntest -  sagen wir mal von jedem ein dutzend Stück – wären wir zumindest von dieser Sorge für die nächsten Wochen befreit.

	B_StartMangel();

	B_LogEntry	(TOPIC_MOD_FM_MANGEL, "Der Ordenalchemist bat mich, ihm von verschiedenen Kräutern je 1 Dutzend zu bringen.");
};

INSTANCE Info_Mod_Alchemist01_MangelQuest (C_INFO)
{
	npc		= Mod_1739_KDF_Ordenspriester_PAT;
	nr		= 1;
	condition	= Info_Mod_Alchemist01_MangelQuest_Condition;
	information	= Info_Mod_Alchemist01_MangelQuest_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich habe Kräuter für dich.";
};

FUNC INT Info_Mod_Alchemist01_MangelQuest_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alchemist01_Hi))
	&& (Mod_Pat_PflanzenCount < 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alchemist01_MangelQuest_Choices()
{
	Info_ClearChoices	(Info_Mod_Alchemist01_MangelQuest);

	Info_AddChoice	(Info_Mod_Alchemist01_MangelQuest, "Zurück", Info_Mod_Alchemist01_MangelQuest_BACK);

	if (Mod_Pat_Winterrute == 0)
	&& (Npc_HasItems(hero, ItPl_Winterrute) >= 12)
	{
		Info_AddChoice	(Info_Mod_Alchemist01_MangelQuest, "Winterrute", Info_Mod_Alchemist01_MangelQuest_H);
	};
	if (Mod_Pat_Heilknospe == 0)
	&& (Npc_HasItems(hero, ItPl_Heilknospe) >= 12)
	{
		Info_AddChoice	(Info_Mod_Alchemist01_MangelQuest, "Heilknospe", Info_Mod_Alchemist01_MangelQuest_G);
	};
	if (Mod_Pat_Feuerwurzel == 0)
	&& (Npc_HasItems(hero, ItPl_Mana_Herb_03) >= 12)
	{
		Info_AddChoice	(Info_Mod_Alchemist01_MangelQuest, "Feuerwurzel", Info_Mod_Alchemist01_MangelQuest_F);
	};
	if (Mod_Pat_Feuerkraut == 0)
	&& (Npc_HasItems(hero, ItPl_Mana_Herb_02) >= 12)
	{
		Info_AddChoice	(Info_Mod_Alchemist01_MangelQuest, "Feuerkraut", Info_Mod_Alchemist01_MangelQuest_E);
	};
	if (Mod_Pat_Feuernessel == 0)
	&& (Npc_HasItems(hero, ItPl_Mana_Herb_01) >= 12)
	{
		Info_AddChoice	(Info_Mod_Alchemist01_MangelQuest, "Feuernessel", Info_Mod_Alchemist01_MangelQuest_D);
	};
	if (Mod_Pat_Heilwurzel == 0)
	&& (Npc_HasItems(hero, ItPl_Health_Herb_03) >= 12)
	{
		Info_AddChoice	(Info_Mod_Alchemist01_MangelQuest, "Heilwurzel", Info_Mod_Alchemist01_MangelQuest_C);
	};
	if (Mod_Pat_Heilkraut == 0)
	&& (Npc_HasItems(hero, ItPl_Health_Herb_02) >= 12)
	{
		Info_AddChoice	(Info_Mod_Alchemist01_MangelQuest, "Heilkraut", Info_Mod_Alchemist01_MangelQuest_B);
	};
	if (Mod_Pat_Heilpflanze == 0)
	&& (Npc_HasItems(hero, ItPl_Health_Herb_01) >= 12)
	{
		Info_AddChoice	(Info_Mod_Alchemist01_MangelQuest, "Heilpflanze", Info_Mod_Alchemist01_MangelQuest_A);
	};
};

FUNC VOID Info_Mod_Alchemist01_MangelQuest_Info()
{
	AI_Output(hero, self, "Info_Mod_Alchemist01_MangelQuest_15_00"); //Ich habe Kräuter für dich.
	
	Info_Mod_Alchemist01_MangelQuest_Choices();
};

FUNC VOID Info_Mod_Alchemist01_MangelQuest_BACK()
{
	Info_ClearChoices	(Info_Mod_Alchemist01_MangelQuest);
};

FUNC VOID Info_Mod_Alchemist01_MangelQuest_Fertig()
{
	AI_Output(self, hero, "Info_Mod_Alchemist01_MangelQuest_Fertig_06_00"); //Bei Innos, du musst Stunden damit zugebracht haben die ganzen Kräuter zu sammeln. Damit hat sich das mit dem Mangel an Zutaten erst mal erübrigt.
	AI_Output(self, hero, "Info_Mod_Alchemist01_MangelQuest_Fertig_06_01"); //Hier, diese Tränke werden dir bei deinen weiteren Reisen sicher von Nutzen sein.

	B_ShowGivenThings	("Elixier des Lebens, 2 Gegengifte und Trank der Genesung erhalten");

	AI_Output(self, hero, "Info_Mod_Alchemist01_MangelQuest_Fertig_06_02"); //Innos behüte dich.

	CreateInvItems	(hero, ItPo_Perm_Health, 1);
	CreateInvItems	(hero, ItPo_Gegengift, 2);
	CreateInvItems	(hero, ItPo_Genesung, 1);

	B_GivePlayerXP	(500);

	B_LogEntry	(TOPIC_MOD_FM_MANGEL, "Der Ordensalchemist ist mit Kräutern versorgt.");

	B_StopMangel();

	Info_ClearChoices	(Info_Mod_Alchemist01_MangelQuest);
};

FUNC VOID Info_Mod_Alchemist01_MangelQuest_H()
{
	B_GiveInvItems	(hero, self, ItPl_Winterrute, 12);

	Mod_Pat_PflanzenCount += 1;

	Mod_Pat_Winterrute = 1;

	if (Mod_Pat_PflanzenCount < 5)
	{
		Info_Mod_Alchemist01_MangelQuest_Choices();
	}
	else
	{
		Info_Mod_Alchemist01_MangelQuest_Fertig();
	};
};

FUNC VOID Info_Mod_Alchemist01_MangelQuest_G()
{
	B_GiveInvItems	(hero, self, ItPl_Heilknospe, 12);

	Mod_Pat_PflanzenCount += 1;

	Mod_Pat_Heilknospe = 1;

	if (Mod_Pat_PflanzenCount < 5)
	{
		Info_Mod_Alchemist01_MangelQuest_Choices();
	}
	else
	{
		Info_Mod_Alchemist01_MangelQuest_Fertig();
	};
};

FUNC VOID Info_Mod_Alchemist01_MangelQuest_F()
{
	B_GiveInvItems	(hero, self, ItPl_Mana_Herb_03, 12);

	Mod_Pat_PflanzenCount += 1;

	Mod_Pat_Feuerwurzel = 1;

	if (Mod_Pat_PflanzenCount < 5)
	{
		Info_Mod_Alchemist01_MangelQuest_Choices();
	}
	else
	{
		Info_Mod_Alchemist01_MangelQuest_Fertig();
	};
};

FUNC VOID Info_Mod_Alchemist01_MangelQuest_E()
{
	B_GiveInvItems	(hero, self, ItPl_Mana_Herb_02, 12);

	Mod_Pat_PflanzenCount += 1;

	Mod_Pat_Feuerkraut = 1;

	if (Mod_Pat_PflanzenCount < 5)
	{
		Info_Mod_Alchemist01_MangelQuest_Choices();
	}
	else
	{
		Info_Mod_Alchemist01_MangelQuest_Fertig();
	};
};

FUNC VOID Info_Mod_Alchemist01_MangelQuest_D()
{
	B_GiveInvItems	(hero, self, ItPl_Mana_Herb_01, 12);

	Mod_Pat_PflanzenCount += 1;

	Mod_Pat_Feuernessel = 1;

	if (Mod_Pat_PflanzenCount < 5)
	{
		Info_Mod_Alchemist01_MangelQuest_Choices();
	}
	else
	{
		Info_Mod_Alchemist01_MangelQuest_Fertig();
	};
};

FUNC VOID Info_Mod_Alchemist01_MangelQuest_C()
{
	B_GiveInvItems	(hero, self, ItPl_Health_Herb_03, 12);

	Mod_Pat_PflanzenCount += 1;

	Mod_Pat_Heilwurzel = 1;

	if (Mod_Pat_PflanzenCount < 5)
	{
		Info_Mod_Alchemist01_MangelQuest_Choices();
	}
	else
	{
		Info_Mod_Alchemist01_MangelQuest_Fertig();
	};
};

FUNC VOID Info_Mod_Alchemist01_MangelQuest_B()
{
	B_GiveInvItems	(hero, self, ItPl_Health_Herb_02, 12);

	Mod_Pat_PflanzenCount += 1;

	Mod_Pat_Heilkraut = 1;

	if (Mod_Pat_PflanzenCount < 5)
	{
		Info_Mod_Alchemist01_MangelQuest_Choices();
	}
	else
	{
		Info_Mod_Alchemist01_MangelQuest_Fertig();
	};
};

FUNC VOID Info_Mod_Alchemist01_MangelQuest_A()
{
	B_GiveInvItems	(hero, self, ItPl_Health_Herb_01, 12);

	Mod_Pat_PflanzenCount += 1;

	Mod_Pat_Heilpflanze = 1;

	if (Mod_Pat_PflanzenCount < 5)
	{
		Info_Mod_Alchemist01_MangelQuest_Choices();
	}
	else
	{
		Info_Mod_Alchemist01_MangelQuest_Fertig();
	};
};

INSTANCE Info_Mod_Alchemist01_Fake (C_INFO)
{
	npc		= Mod_1739_KDF_Ordenspriester_PAT;
	nr		= 1;
	condition	= Info_Mod_Alchemist01_Fake_Condition;
	information	= Info_Mod_Alchemist01_Fake_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ist hier ein seltsamer Magier gewesen?";
};

FUNC INT Info_Mod_Alchemist01_Fake_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_KDF_13_Fake))
	&& (Npc_KnowsInfo(hero, Info_Mod_Alchemist01_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alchemist01_Fake_Info()
{
	AI_Output(hero, self, "Info_Mod_Alchemist01_Fake_15_00"); //Ist hier ein seltsamer Magier gewesen?
	AI_Output(self, hero, "Info_Mod_Alchemist01_Fake_06_01"); //Ein Magier war eben noch hier. Er hat gesagt, er wolle zu den Übungsräumen.

	B_LogEntry	(TOPIC_MOD_FM_SM, "Scheint so als wäre er vom Alchemielabor aus Richtung Übrungsräume geflohen.");
};

INSTANCE Info_Mod_Alchemist01_EXIT (C_INFO)
{
	npc		= Mod_1739_KDF_Ordenspriester_PAT;
	nr		= 1;
	condition	= Info_Mod_Alchemist01_EXIT_Condition;
	information	= Info_Mod_Alchemist01_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Alchemist01_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Alchemist01_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};