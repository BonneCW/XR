INSTANCE Info_Mod_Alax_Hi (C_INFO)
{
	npc		= Mod_7502_KDS_Alax_MT;
	nr		= 1;
	condition	= Info_Mod_Alax_Hi_Condition;
	information	= Info_Mod_Alax_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alax_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Alax_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Alax_Hi_14_00"); //He, was trampelst du hier so laut rum? Ich brauche absolute Konzentration beim Tränkebrauen.
	AI_Output(hero, self, "Info_Mod_Alax_Hi_15_01"); //Als wäre es hier drin so still ...
	AI_Output(self, hero, "Info_Mod_Alax_Hi_14_02"); //Nun ... das mag ja stimmen. Aber als ehemaliger Guru des Schläfers entspricht es nun mal meiner Gewohnheit.
	AI_Output(hero, self, "Info_Mod_Alax_Hi_15_03"); //Du warst Guru im Sumpflager?
	AI_Output(self, hero, "Info_Mod_Alax_Hi_14_04"); //(ungeduldig) Das habe ich doch gerade gesagt.
	AI_Output(self, hero, "Info_Mod_Alax_Hi_14_05"); //Nachdem Xardas jedoch den Schläfer bezwungen hatte und die Barriere zum Einsturz brachte, verstand es sich für mich von selbst, dass ich seinem Beispiel folgen würde.
	AI_Output(self, hero, "Info_Mod_Alax_Hi_14_06"); //Letztendlich hat er mich von dieser Irrlehre, wie auch von der Gefangenschaft in der Kolonie befreit.
	AI_Output(self, hero, "Info_Mod_Alax_Hi_14_07"); //Also bin ich Alchemist in den Reihen der Dämonenmagier geworden.
};

INSTANCE Info_Mod_Alax_AlchemieLehrer (C_INFO)
{
	npc		= Mod_7502_KDS_Alax_MT;
	nr		= 1;
	condition	= Info_Mod_Alax_AlchemieLehrer_Condition;
	information	= Info_Mod_Alax_AlchemieLehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir etwas über Alchemie beibringen?";
};

FUNC INT Info_Mod_Alax_AlchemieLehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alax_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer_Info()
{
	AI_Output(hero, self, "Info_Mod_Alax_AlchemieLehrer_15_00"); //Kannst du mir etwas über Alchemie beibringen?
	AI_Output(self, hero, "Info_Mod_Alax_AlchemieLehrer_14_01"); //Warum bei Beliar sollte ich das tun?

	Info_ClearChoices	(Info_Mod_Alax_AlchemieLehrer);

	Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer, "Weil ich ein netter Kerl bin.", Info_Mod_Alax_AlchemieLehrer_B);
	Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer, "Ich habe Xardas damals geholfen den Schläfers zu verbannen.", Info_Mod_Alax_AlchemieLehrer_A);
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer_C()
{
	AI_Output(hero, self, "Info_Mod_Alax_AlchemieLehrer_C_15_00"); //Von welchen?
	AI_Output(self, hero, "Info_Mod_Alax_AlchemieLehrer_C_14_01"); //Überrasch mich ... oder anders gesagt: Stiehl mir nicht mehr Zeit und lass mich in Ruhe weiterarbeiten.

	Info_ClearChoices	(Info_Mod_Alax_AlchemieLehrer);

	Log_CreateTopic	(TOPIC_MOD_ALAX_ZUTATEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ALAX_ZUTATEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ALAX_ZUTATEN, "Bevor mir Alax etwas über Alchemie beibringt, soll ich ihm erst mal von 13 Tränken, Gewächsen oder sonstigen Zutaten meiner Wahl je 6 Stück bringen.");
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer_B()
{
	AI_Output(hero, self, "Info_Mod_Alax_AlchemieLehrer_B_15_00"); //Weil ich ein netter Kerl bin.
	AI_Output(self, hero, "Info_Mod_Alax_AlchemieLehrer_B_14_01"); //Netter Kerl?! Dann geh doch zu den weichgespülten Feuermagiern und bitte sie um deren Gunst.
	AI_Output(self, hero, "Info_Mod_Alax_AlchemieLehrer_B_14_02"); //Wenn ICH dir etwas beibringen soll, besorg mir erst von 13 verschiedenen Tränken, Gewächsen oder anderen Ingredienzien jeweils sechs Stück. Dann können wir weiterreden.

	Info_Mod_Alax_AlchemieLehrer_C();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer_A()
{
	AI_Output(hero, self, "Info_Mod_Alax_AlchemieLehrer_A_15_00"); //Ich habe Xardas damals geholfen den Schläfers zu verbannen.
	AI_Output(self, hero, "Info_Mod_Alax_AlchemieLehrer_A_14_01"); //Haha, natürlich ... und ich habe Innos’ heilige Jungfrauen geschändet. Verarschen kann ich mich selbst.
	AI_Output(self, hero, "Info_Mod_Alax_AlchemieLehrer_A_14_02"); //Wenn ich dir wirklich etwas beibringen soll, besorg mir erst von 13 verschiedenen Tränken, Gewächsen oder anderen Ingredienzien jeweils sechs Stück.

	Info_Mod_Alax_AlchemieLehrer_C();
};

INSTANCE Info_Mod_Alax_AlchemieLehrer2 (C_INFO)
{
	npc		= Mod_7502_KDS_Alax_MT;
	nr		= 1;
	condition	= Info_Mod_Alax_AlchemieLehrer2_Condition;
	information	= Info_Mod_Alax_AlchemieLehrer2_Info;
	permanent	= 1;
	important	= 0;
	description	= "(Zutaten geben)";
};

FUNC INT Info_Mod_Alax_AlchemieLehrer2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alax_AlchemieLehrer))
	&& (Mod_Alax_Zutaten < 13)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_Verteiler()
{
	Info_ClearChoices	(Info_Mod_Alax_AlchemieLehrer2);

	Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, DIALOG_BACK, Info_Mod_Alax_AlchemieLehrer2_BACK);

	Spine_UpdateAchievementProgress(SPINE_ACHIEVEMENT_29, Mod_Alax_Zutaten);
	
	if (Mod_Alax_Zutaten < 13)
	{
		if (!Mod_Alax_Zutat_Zwillingsdorn)
		&& (Npc_HasItems(hero, ItPl_Zwillingsdorn) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Zwillingsdorn geben", Info_Mod_Alax_AlchemieLehrer2_Zwillingsdorn);
		};
		if (!Mod_Alax_Zutat_Weidenbeere)
		&& (Npc_HasItems(hero, ItPl_Planeberry) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Weidenbeere geben", Info_Mod_Alax_AlchemieLehrer2_Weidenbeere);
		};
		if (!Mod_Alax_Zutat_Waldbeere)
		&& (Npc_HasItems(hero, ItPl_Forestberry) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Waldbeere geben", Info_Mod_Alax_AlchemieLehrer2_Waldbeere);
		};
		if (!Mod_Alax_Zutat_LeichtesMana)
		&& (Npc_HasItems(hero, ItPo_Mana_06) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Trank des leichten Manas geben", Info_Mod_Alax_AlchemieLehrer2_LeichtesMana);
		};
		if (!Mod_Alax_Zutat_SchnelleHeilung)
		&& (Npc_HasItems(hero, ItPo_Health_05) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Trank der schnellen Heilung geben", Info_Mod_Alax_AlchemieLehrer2_SchnelleHeilung);
		};
		if (!Mod_Alax_Zutat_Sumpfkraut)
		&& (Npc_HasItems(hero, ItPl_SwampHerb) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Sumpfkraut geben", Info_Mod_Alax_AlchemieLehrer2_Sumpfkraut);
		};
		if (!Mod_Alax_Zutat_Snapperkraut)
		&& (Npc_HasItems(hero, ItPl_Speed_Herb_01) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Snapperkraut geben", Info_Mod_Alax_AlchemieLehrer2_Snapperkraut);
		};
		if (!Mod_Alax_Zutat_Schwefel)
		&& (Npc_HasItems(hero, ItMi_Sulfur) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Schwefel geben", Info_Mod_Alax_AlchemieLehrer2_Schwefel);
		};
		if (!Mod_Alax_Zutat_SchwarzePerle)
		&& (Npc_HasItems(hero, ItMi_DarkPearl) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Schwarze Perle geben", Info_Mod_Alax_AlchemieLehrer2_SchwarzePerle);
		};
		if (!Mod_Alax_Zutat_Pech)
		&& (Npc_HasItems(hero, ItMi_Pitch) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Pech geben", Info_Mod_Alax_AlchemieLehrer2_Pech);
		};
		if (!Mod_Alax_Zutat_ManaExtrakt)
		&& (Npc_HasItems(hero, ItPo_Mana_02) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Mana Extrakt geben", Info_Mod_Alax_AlchemieLehrer2_ManaExtrakt);
		};
		if (!Mod_Alax_Zutat_ManaEssenz)
		&& (Npc_HasItems(hero, ItPo_Mana_01) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Mana Essenz geben", Info_Mod_Alax_AlchemieLehrer2_ManaEssenz);
		};
		if (!Mod_Alax_Zutat_ManaElixier)
		&& (Npc_HasItems(hero, ItPo_Mana_03) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Mana Elixier geben", Info_Mod_Alax_AlchemieLehrer2_ManaElixier);
		};
		if (!Mod_Alax_Zutat_LeichterManatrank)
		&& (Npc_HasItems(hero, ItPo_Mana_05) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Leichten Manatrank geben", Info_Mod_Alax_AlchemieLehrer2_LeichterManatrank);
		};
		if (!Mod_Alax_Zutat_LeichteHeilung)
		&& (Npc_HasItems(hero, ItPo_Health_06) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Leichten Heiltrank geben", Info_Mod_Alax_AlchemieLehrer2_LeichteHeilung);
		};
		if (!Mod_Alax_Zutat_Kohle)
		&& (Npc_HasItems(hero, ItMi_Coal) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Kohle geben", Info_Mod_Alax_AlchemieLehrer2_Kohle);
		};
		if (!Mod_Alax_Zutat_Heilwurzel)
		&& (Npc_HasItems(hero, ItPl_Health_Herb_03) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Heilwurzel geben", Info_Mod_Alax_AlchemieLehrer2_Heilwurzel);
		};
		if (!Mod_Alax_Zutat_Heilpflanze)
		&& (Npc_HasItems(hero, ItPl_Health_Herb_01) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Heilpflanze geben", Info_Mod_Alax_AlchemieLehrer2_Heilpflanze);
		};
		if (!Mod_Alax_Zutat_Heilkraut)
		&& (Npc_HasItems(hero, ItPl_Health_Herb_02) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Heilkraut geben", Info_Mod_Alax_AlchemieLehrer2_Heilkraut);
		};
		if (!Mod_Alax_Zutat_Heilknospe)
		&& (Npc_HasItems(hero, ItPl_Heilknospe) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Heilknospe geben", Info_Mod_Alax_AlchemieLehrer2_Heilknospe);
		};
		if (!Mod_Alax_Zutat_GletscherQuartz)
		&& (Npc_HasItems(hero, ItMi_Quartz) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Gletscher-Quartz geben", Info_Mod_Alax_AlchemieLehrer2_GletscherQuartz);
		};
		if (!Mod_Alax_Zutat_Feuerwurzel)
		&& (Npc_HasItems(hero, ItPl_Mana_Herb_03) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Feuerwurzel geben", Info_Mod_Alax_AlchemieLehrer2_Feuerwurzel);
		};
		if (!Mod_Alax_Zutat_Feuernessel)
		&& (Npc_HasItems(hero, ItPl_Mana_Herb_01) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Feuernessel geben", Info_Mod_Alax_AlchemieLehrer2_Feuernessel);
		};
		if (!Mod_Alax_Zutat_ExtraktDerHeilung)
		&& (Npc_HasItems(hero, ItPo_Health_02) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Extrakt der Heilung geben", Info_Mod_Alax_AlchemieLehrer2_ExtraktDerHeilung);
		};
		if (!Mod_Alax_Zutat_EssenzDerHeilung)
		&& (Npc_HasItems(hero, ItPo_Health_01) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Essenz der Heilung geben", Info_Mod_Alax_AlchemieLehrer2_EssenzDerHeilung);
		};
		if (!Mod_Alax_Zutat_ElixierDerHeilung)
		&& (Npc_HasItems(hero, ItPo_Health_03) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Elixier der Heilung geben", Info_Mod_Alax_AlchemieLehrer2_ElixierDerHeilung);
		};
		if (!Mod_Alax_Zutat_Fliegenpilz)
		&& (Npc_HasItems(hero, ItPl_Mushroom_03) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Fliegenpilz geben", Info_Mod_Alax_AlchemieLehrer2_Fliegenpilz);
		};
		if (!Mod_Alax_Zutat_Feuerkraut)
		&& (Npc_HasItems(hero, ItPl_Mana_Herb_02) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Feuerkraut geben", Info_Mod_Alax_AlchemieLehrer2_Feuerkraut);
		};
		if (!Mod_Alax_Zutat_Dunkelpilz)
		&& (Npc_HasItems(hero, ItPl_Mushroom_01) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Dunkelpilz geben", Info_Mod_Alax_AlchemieLehrer2_Dunkelpilz);
		};
		if (!Mod_Alax_Zutat_Buddlerfleisch)
		&& (Npc_HasItems(hero, ItPl_Mushroom_02) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Buddlerfleisch geben", Info_Mod_Alax_AlchemieLehrer2_Buddlerfleisch);
		};
		if (!Mod_Alax_Zutat_Blauflieder)
		&& (Npc_HasItems(hero, ItPl_Blueplant) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Blauflieder geben", Info_Mod_Alax_AlchemieLehrer2_Blauflieder);
		};
		if (!Mod_Alax_Zutat_Bergkristall)
		&& (Npc_HasItems(hero, ItMi_Rockcrystal) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Bergkristall geben", Info_Mod_Alax_AlchemieLehrer2_Bergkristall);
		};
		if (!Mod_Alax_Zutat_Aquamarin)
		&& (Npc_HasItems(hero, ItMi_Aquamarine) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Aquamarin geben", Info_Mod_Alax_AlchemieLehrer2_Aquamarin);
		};
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Alax_AlchemieLehrer2_Verteiler_15_00"); //Das waren 13mal 6.
		AI_Output(self, hero, "Info_Mod_Alax_AlchemieLehrer2_Verteiler_14_01"); //Tatsache ... Wäre eigentlich gar nicht nötig gewesen. Wie ich mittlerweile erfahren habe, warst du tatsächlich der Helfer meines Meisters im Kampf gegen den Schläfer ...
		AI_Output(hero, self, "Info_Mod_Alax_AlchemieLehrer2_Verteiler_15_02"); //Was?!
		AI_Output(self, hero, "Info_Mod_Alax_AlchemieLehrer2_Verteiler_14_03"); //Wie dem auch sei, was soll ich dir beibringen?

		B_GivePlayerXP	(600);

		CurrentNQ += 1;

		B_SetTopicStatus	(TOPIC_MOD_ALAX_ZUTATEN, LOG_SUCCESS);

		Log_CreateTopic	(TOPIC_MOD_LEHRER_BELIARFESTUNG, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_LEHRER_BELIARFESTUNG, "Alax kann mich in der Kunst der Alchemie unterweisen.");
	};
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_Info()
{
	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_BACK()
{
	Info_ClearChoices	(Info_Mod_Alax_AlchemieLehrer2);
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_Zwillingsdorn()
{
	B_GiveInvItems	(hero, self, ItPl_Zwillingsdorn, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_Zwillingsdorn = TRUE;
	
	B_LogEntry	(TOPIC_MOD_ALAX_ZUTATEN, "Ich habe Alax 6x Zwillingsdorn gebracht.");

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_Weidenbeere()
{
	B_GiveInvItems	(hero, self, ItPl_Planeberry, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_Weidenbeere = TRUE;
	
	B_LogEntry	(TOPIC_MOD_ALAX_ZUTATEN, "Ich habe Alax 6x Weidenbeere gebracht.");

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_Waldbeere()
{
	B_GiveInvItems	(hero, self, ItPl_Forestberry, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_Waldbeere = TRUE;
	
	B_LogEntry	(TOPIC_MOD_ALAX_ZUTATEN, "Ich habe Alax 6x Waldbeere gebracht.");

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_ManaEssenz()
{
	B_GiveInvItems	(hero, self, ItPo_Mana_01, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_ManaEssenz = TRUE;
	
	B_LogEntry	(TOPIC_MOD_ALAX_ZUTATEN, "Ich habe Alax 6x Mana Essenz gebracht.");

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_EssenzDerHeilung()
{
	B_GiveInvItems	(hero, self, ItPo_Health_01, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_EssenzDerHeilung = TRUE;
	
	B_LogEntry	(TOPIC_MOD_ALAX_ZUTATEN, "Ich habe Alax 6x Essenz der Heilung gebracht.");

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_ExtraktDerHeilung()
{
	B_GiveInvItems	(hero, self, ItPo_Health_02, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_ExtraktDerHeilung = TRUE;
	
	B_LogEntry	(TOPIC_MOD_ALAX_ZUTATEN, "Ich habe Alax 6x Extrakt der Heilung gebracht.");

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_ElixierDerHeilung()
{
	B_GiveInvItems	(hero, self, ItPo_Health_03, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_ElixierDerHeilung = TRUE;
	
	B_LogEntry	(TOPIC_MOD_ALAX_ZUTATEN, "Ich habe Alax 6x Elixier der Heilung gebracht.");

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_SchnelleHeilung()
{
	B_GiveInvItems	(hero, self, ItPo_Health_05, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_SchnelleHeilung = TRUE;
	
	B_LogEntry	(TOPIC_MOD_ALAX_ZUTATEN, "Ich habe Alax 6x Trank der schnellen Heilung gebracht.");

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_LeichteHeilung()
{
	B_GiveInvItems	(hero, self, ItPo_Health_06, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_LeichteHeilung = TRUE;
	
	B_LogEntry	(TOPIC_MOD_ALAX_ZUTATEN, "Ich habe Alax 6x Leichten Heiltrank gebracht.");

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_ManaExtrakt()
{
	B_GiveInvItems	(hero, self, ItPo_Mana_02, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_ManaExtrakt = TRUE;
	
	B_LogEntry	(TOPIC_MOD_ALAX_ZUTATEN, "Ich habe Alax 6x Mana Extrakt gebracht.");

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_ManaElixier()
{
	B_GiveInvItems	(hero, self, ItPo_Mana_03, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_ManaElixier = TRUE;
	
	B_LogEntry	(TOPIC_MOD_ALAX_ZUTATEN, "Ich habe Alax 6x Mana Elixier gebracht.");

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_LeichterManatrank()
{
	B_GiveInvItems	(hero, self, ItPo_Mana_05, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_LeichterManatrank = TRUE;
	
	B_LogEntry	(TOPIC_MOD_ALAX_ZUTATEN, "Ich habe Alax 6x Leichten Manatrank gebracht.");

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_LeichtesMana()
{
	B_GiveInvItems	(hero, self, ItPo_Mana_06, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_LeichtesMana = TRUE;
	
	B_LogEntry	(TOPIC_MOD_ALAX_ZUTATEN, "Ich habe Alax 6x Trank des leichten Manas gebracht.");

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_Schwefel()
{
	B_GiveInvItems	(hero, self, ItMi_Sulfur, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_Schwefel = TRUE;
	
	B_LogEntry	(TOPIC_MOD_ALAX_ZUTATEN, "Ich habe Alax 6x Schwefel gebracht.");

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_SchwarzePerle()
{
	B_GiveInvItems	(hero, self, ItMi_DarkPearl, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_SchwarzePerle = TRUE;
	
	B_LogEntry	(TOPIC_MOD_ALAX_ZUTATEN, "Ich habe Alax 6x Schwarze Perle gebracht.");

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_Pech()
{
	B_GiveInvItems	(hero, self, ItMi_Pitch, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_Pech = TRUE;
	
	B_LogEntry	(TOPIC_MOD_ALAX_ZUTATEN, "Ich habe Alax 6x Pech gebracht.");

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_Kohle()
{
	B_GiveInvItems	(hero, self, ItMi_Coal, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_Kohle = TRUE;
	
	B_LogEntry	(TOPIC_MOD_ALAX_ZUTATEN, "Ich habe Alax 6x Kohle gebracht.");

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_Heilwurzel()
{
	B_GiveInvItems	(hero, self, ItPl_Health_Herb_03, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_Heilwurzel = TRUE;
	
	B_LogEntry	(TOPIC_MOD_ALAX_ZUTATEN, "Ich habe Alax 6x Heilwurzel gebracht.");

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_Heilpflanze()
{
	B_GiveInvItems	(hero, self, ItPl_Health_Herb_01, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_Heilpflanze = TRUE;
	
	B_LogEntry	(TOPIC_MOD_ALAX_ZUTATEN, "Ich habe Alax 6x Heilpflanze gebracht.");

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_Heilkraut()
{
	B_GiveInvItems	(hero, self, ItPl_Health_Herb_02, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_Heilkraut = TRUE;
	
	B_LogEntry	(TOPIC_MOD_ALAX_ZUTATEN, "Ich habe Alax 6x Heilkraut gebracht.");

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_Heilknospe()
{
	B_GiveInvItems	(hero, self, ItPl_Heilknospe, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_Heilknospe = TRUE;
	
	B_LogEntry	(TOPIC_MOD_ALAX_ZUTATEN, "Ich habe Alax 6x Heilknospe gebracht.");

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_GletscherQuartz()
{
	B_GiveInvItems	(hero, self, ItMi_Quartz, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_GletscherQuartz = TRUE;
	
	B_LogEntry	(TOPIC_MOD_ALAX_ZUTATEN, "Ich habe Alax 6x Gletscher Quartz gebracht.");

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_Feuerwurzel()
{
	B_GiveInvItems	(hero, self, ItPl_Mana_Herb_03, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_Feuerwurzel = TRUE;
	
	B_LogEntry	(TOPIC_MOD_ALAX_ZUTATEN, "Ich habe Alax 6x Feuerwurzel gebracht.");

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_Feuernessel()
{
	B_GiveInvItems	(hero, self, ItPl_Mana_Herb_01, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_Feuernessel = TRUE;
	
	B_LogEntry	(TOPIC_MOD_ALAX_ZUTATEN, "Ich habe Alax 6x Feuernessel gebracht.");

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_Feuerkraut()
{
	B_GiveInvItems	(hero, self, ItPl_Mana_Herb_02, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_Feuerkraut = TRUE;
	
	B_LogEntry	(TOPIC_MOD_ALAX_ZUTATEN, "Ich habe Alax 6x Feuerkraut gebracht.");

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_Bergkristall()
{
	B_GiveInvItems	(hero, self, ItMi_Rockcrystal, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_Bergkristall = TRUE;
	
	B_LogEntry	(TOPIC_MOD_ALAX_ZUTATEN, "Ich habe Alax 6x Bergkristall gebracht.");

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_Aquamarin()
{
	B_GiveInvItems	(hero, self, ItMi_Aquamarine, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_Aquamarin = TRUE;
	
	B_LogEntry	(TOPIC_MOD_ALAX_ZUTATEN, "Ich habe Alax 6x Aquamarin gebracht.");

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_Buddlerfleisch()
{
	B_GiveInvItems	(hero, self, ItPl_Mushroom_02, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_Buddlerfleisch = TRUE;
	
	B_LogEntry	(TOPIC_MOD_ALAX_ZUTATEN, "Ich habe Alax 6x Buddlerfleisch gebracht.");

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_Dunkelpilz()
{
	B_GiveInvItems	(hero, self, ItPl_Mushroom_01, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_Dunkelpilz = TRUE;
	
	B_LogEntry	(TOPIC_MOD_ALAX_ZUTATEN, "Ich habe Alax 6x Dunkelpilz gebracht.");

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_Fliegenpilz()
{
	B_GiveInvItems	(hero, self, ItPl_Mushroom_03, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_Fliegenpilz = TRUE;
	
	B_LogEntry	(TOPIC_MOD_ALAX_ZUTATEN, "Ich habe Alax 6x Fliegenpilz gebracht.");

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_Blauflieder()
{
	B_GiveInvItems	(hero, self, ItPl_Blueplant, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_Blauflieder = TRUE;
	
	B_LogEntry	(TOPIC_MOD_ALAX_ZUTATEN, "Ich habe Alax 6x Blauflieder gebracht.");

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_Sumpfkraut()
{
	B_GiveInvItems	(hero, self, ItPl_SwampHerb, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_Sumpfkraut = TRUE;
	
	B_LogEntry	(TOPIC_MOD_ALAX_ZUTATEN, "Ich habe Alax 6x Sumpfkraut gebracht.");

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_Snapperkraut()
{
	B_GiveInvItems	(hero, self, ItPl_Speed_Herb_01, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_Snapperkraut = TRUE;
	
	B_LogEntry	(TOPIC_MOD_ALAX_ZUTATEN, "Ich habe Alax 6x Snapperkraut gebracht.");

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

INSTANCE Info_Mod_Alax_Lehrer (C_INFO)
{
	npc		= Mod_7502_KDS_Alax_MT;
	nr		= 1;
	condition	= Info_Mod_Alax_Lehrer_Condition;
	information	= Info_Mod_Alax_Lehrer_Info;
	permanent	= 1;
	important	= 0;
	description	= "Bring mir etwas über die Alchemie bei.";
};

FUNC INT Info_Mod_Alax_Lehrer_Condition()
{	
	if (Mod_Alax_Zutaten == 13)
	&& (Mod_IstLehrling == 1)
	{	
		return 1;
	};
};

FUNC VOID Info_Mod_Alax_Lehrer_Info()
{
	AI_Output (hero, self, "Info_Mod_Alax_Lehrer_15_00"); //Bring mir etwas über die Alchemie bei.	
	AI_Output (self, hero, "Info_Mod_Alax_Lehrer_14_01"); //Was willst du wissen?
		
	Info_ClearChoices 	(Info_Mod_Alax_Lehrer);
	Info_AddChoice 		(Info_Mod_Alax_Lehrer,DIALOG_BACK,Info_Mod_Alax_Lehrer_BACK);

	if (PLAYER_TALENT_ALCHEMY[POTION_Regeneration] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Alax_Lehrer, B_BuildLearnString ("Regenerationstrank", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Regeneration)), Info_Mod_Alax_Lehrer_Regeneration);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_07] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Alax_Lehrer, B_BuildLearnString ("Trank der leichten Heilung", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_07)), Info_Mod_Alax_Lehrer_Health_07);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_06] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Alax_Lehrer, B_BuildLearnString ("Leichter Heiltrank", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_06)), Info_Mod_Alax_Lehrer_Health_06);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_05] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Alax_Lehrer, B_BuildLearnString ("Trank der schnellen Heilung", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_05)), Info_Mod_Alax_Lehrer_Health_05);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	&& (Mod_LehrlingBei != 1)
	{
		Info_AddChoice 		(Info_Mod_Alax_Lehrer,B_BuildLearnString ("Essenz der Heilung", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_01)),Info_Mod_Alax_Lehrer_HEALTH_01);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Alax_Lehrer, B_BuildLearnString ("Extrakt der Heilung", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_02)), Info_Mod_Alax_Lehrer_Health_02);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Alax_Lehrer, B_BuildLearnString ("Elixier der Heilung", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_03)), Info_Mod_Alax_Lehrer_Health_03);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_06] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Alax_Lehrer, B_BuildLearnString ("Trank des leichten Mana", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_06)), Info_Mod_Alax_Lehrer_Mana_06);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_05] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Alax_Lehrer, B_BuildLearnString ("Leichte Manatrank", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_05)), Info_Mod_Alax_Lehrer_Mana_05);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	&& (Mod_LehrlingBei != 1)
	{
		Info_AddChoice	  (Info_Mod_Alax_Lehrer, B_BuildLearnString ("Mana Essenz", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_01)), Info_Mod_Alax_Lehrer_Mana_01);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Alax_Lehrer, B_BuildLearnString ("Mana Extrakt", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_02)), Info_Mod_Alax_Lehrer_Mana_02);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Alax_Lehrer, B_BuildLearnString ("Mana Elixier", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_03)), Info_Mod_Alax_Lehrer_Mana_03);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Alax_Lehrer, B_BuildLearnString ("Trank der Geschwindigkeit", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Speed)), Info_Mod_Alax_Lehrer_Speed);
	};
};
FUNC VOID Info_Mod_Alax_Lehrer_BACK()
{
	Info_ClearChoices 	(Info_Mod_Alax_Lehrer);
};
FUNC VOID Info_Mod_Alax_Lehrer_Regeneration()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Regeneration);
};
FUNC VOID Info_Mod_Alax_Lehrer_HEALTH_01()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_01);
};
FUNC VOID Info_Mod_Alax_Lehrer_HEALTH_02()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_02);
};
FUNC VOID Info_Mod_Alax_Lehrer_Health_03()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_03);
};
FUNC VOID Info_Mod_Alax_Lehrer_Health_05()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_05);
};
FUNC VOID Info_Mod_Alax_Lehrer_Health_06()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_06);
};
FUNC VOID Info_Mod_Alax_Lehrer_Health_07()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_07);
};
FUNC VOID Info_Mod_Alax_Lehrer_MANA_01()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_01);
};
FUNC VOID Info_Mod_Alax_Lehrer_MANA_02()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_02);
};
FUNC VOID Info_Mod_Alax_Lehrer_MANA_03()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_03);
};
FUNC VOID Info_Mod_Alax_Lehrer_MANA_05()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_05);
};
FUNC VOID Info_Mod_Alax_Lehrer_MANA_06()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_06);
};
FUNC VOID Info_Mod_Alax_Lehrer_Speed()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Speed);
};

INSTANCE Info_Mod_Alax_Pickpocket (C_INFO)
{
	npc		= Mod_7502_KDS_Alax_MT;
	nr		= 1;
	condition	= Info_Mod_Alax_Pickpocket_Condition;
	information	= Info_Mod_Alax_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Alax_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 20);
};

FUNC VOID Info_Mod_Alax_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Alax_Pickpocket);

	Info_AddChoice	(Info_Mod_Alax_Pickpocket, DIALOG_BACK, Info_Mod_Alax_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Alax_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Alax_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Alax_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Alax_Pickpocket);
};

FUNC VOID Info_Mod_Alax_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Alax_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Alax_Pickpocket);

		Info_AddChoice	(Info_Mod_Alax_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Alax_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Alax_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Alax_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Alax_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Alax_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Alax_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Alax_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Alax_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Alax_Pickpocket);

		AI_StopProcessInfos	(self);

		B_Attack (self, hero, AR_Theft, 1);
	}
	else
	{
		if (rnd >= 75)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 200);
		}
		else if (rnd >= 50)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 100);
		}
		else if (rnd >= 25)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 50);
		};

		B_Say	(self, hero, "$PICKPOCKET_BESTECHUNG_01");

		Info_ClearChoices	(Info_Mod_Alax_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Alax_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Alax_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Alax_EXIT (C_INFO)
{
	npc		= Mod_7502_KDS_Alax_MT;
	nr		= 1;
	condition	= Info_Mod_Alax_EXIT_Condition;
	information	= Info_Mod_Alax_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Alax_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Alax_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};