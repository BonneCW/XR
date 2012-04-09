INSTANCE Info_Mod_Jim_Hi (C_INFO)
{
	npc		= Mod_10040_Orc_Jim_REL;
	nr		= 1;
	condition	= Info_Mod_Jim_Hi_Condition;
	information	= Info_Mod_Jim_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Jim_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Jim_Hi_Info()
{
	B_Say	(hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Jim_Hi_18_00"); //Ich Jim.
};

INSTANCE Info_Mod_Jim_WieStadt (C_INFO)
{
	npc		= Mod_10040_Orc_Jim_REL;
	nr		= 1;
	condition	= Info_Mod_Jim_WieStadt_Condition;
	information	= Info_Mod_Jim_WieStadt_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie gefällt dir die Stadt?";
};

FUNC INT Info_Mod_Jim_WieStadt_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jim_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jim_WieStadt_Info()
{
	AI_Output(hero, self, "Info_Mod_Jim_WieStadt_15_00"); //Wie gefällt dir die Stadt?
	AI_Output(self, hero, "Info_Mod_Jim_WieStadt_18_01"); //Bis vor ein paar Wochen Jim glücklich in Menschenstadt, aber jetzt traurig.
};

INSTANCE Info_Mod_Jim_Traurig (C_INFO)
{
	npc		= Mod_10040_Orc_Jim_REL;
	nr		= 1;
	condition	= Info_Mod_Jim_Traurig_Condition;
	information	= Info_Mod_Jim_Traurig_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wieso bist du traurig?";
};

FUNC INT Info_Mod_Jim_Traurig_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jim_WieStadt))
	&& (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jim_Traurig_Info()
{
	AI_Output(hero, self, "Info_Mod_Jim_Traurig_15_00"); //Wieso bist du traurig?
	AI_Output(self, hero, "Info_Mod_Jim_Traurig_18_01"); //Menschenhäuptling kommen zu Jim und sagen: "Du jetzt arbeiten in Mine von Khorata."
	AI_Output(self, hero, "Info_Mod_Jim_Traurig_18_02"); //Aber Jim sagen: "Nein!"
	AI_Output(self, hero, "Info_Mod_Jim_Traurig_18_03"); //Jim nicht wollen arbeiten wie seine Brüder in Mine.
	AI_Output(self, hero, "Info_Mod_Jim_Traurig_18_04"); //Menschenhäuptling sagen: "Gut, aber dann kriegen Jim kein Spender-Freuden mehr, wenn nicht gehen in Mine."
	AI_Output(self, hero, "Info_Mod_Jim_Traurig_18_05"); //Jim mögen Spender-Freuden sehr gern, und Menschenhäuptling wissen.
	AI_Output(self, hero, "Info_Mod_Jim_Traurig_18_06"); //Aber Jim lieber verzichten als zu arbeiten in dreckiger Mine. Seitdem Jim vermissen Spender-Freuden.
	AI_Output(hero, self, "Info_Mod_Jim_Traurig_15_07"); //Das wäre doch die richtige Zeit, sich von dem Zeug zu entwöhnen.
	AI_Output(self, hero, "Info_Mod_Jim_Traurig_18_08"); //Nein! Jim nicht wollen entwöhnen! Jim wollen Spender-Freuden!
	AI_Output(self, hero, "Info_Mod_Jim_Traurig_18_09"); //Und Jim haben Plan zu kriegen es zurück.
	AI_Output(hero, self, "Info_Mod_Jim_Traurig_15_10"); //Jetzt bin ich aber gespannt.
	AI_Output(self, hero, "Info_Mod_Jim_Traurig_18_11"); //Jim bauen Menschenhäuptling Amulett, das schützen gegen Geister.
	AI_Output(self, hero, "Info_Mod_Jim_Traurig_18_12"); //Dann Menschenhäuptling zufrieden und wieder lieb zu Jim und geben Jim Spender-Freuden.
	AI_Output(hero, self, "Info_Mod_Jim_Traurig_15_13"); //Und das soll funktionieren?
	AI_Output(self, hero, "Info_Mod_Jim_Traurig_18_14"); //Jim sehr guter Handwerker, Mensch brauchen haben keine Angst. Jim haben beeindruckt großen Ork-Häuptling Grshka mit Geisteramulett.
	AI_Output(self, hero, "Info_Mod_Jim_Traurig_18_15"); //Aber auszuprobieren Amulett, Jim müssen finden Geisterseele.

	Info_ClearChoices	(Info_Mod_Jim_Traurig);

	Info_AddChoice	(Info_Mod_Jim_Traurig, "Viel Spaß bei der Suche!", Info_Mod_Jim_Traurig_B);
	Info_AddChoice	(Info_Mod_Jim_Traurig, "Soll ich das übernehmen?", Info_Mod_Jim_Traurig_A);
};

FUNC VOID Info_Mod_Jim_Traurig_B()
{
	AI_Output(hero, self, "Info_Mod_Jim_Traurig_B_15_00"); //Viel Spaß bei der Suche!

	Info_ClearChoices	(Info_Mod_Jim_Traurig);
};

FUNC VOID Info_Mod_Jim_Traurig_A()
{
	AI_Output(hero, self, "Info_Mod_Jim_Traurig_A_15_00"); //Soll ich das übernehmen?
	AI_Output(self, hero, "Info_Mod_Jim_Traurig_A_18_01"); //Jim glücklich, wenn Mensch suchen nach Geisterseele.
	AI_Output(self, hero, "Info_Mod_Jim_Traurig_A_18_02"); //Schauen auf Menschenfriedhof bei Hofstaat-Pass, wenn dunkel.
	AI_Output(self, hero, "Info_Mod_Jim_Traurig_A_18_03"); //Vielleicht treiben sich dort herum eine Seele.

	B_GiveInvItems	(self, hero, ItAm_Geisteramulett, 1);

	AI_Output(hero, self, "Info_Mod_Jim_Traurig_A_15_04"); //Alles klar. Ich werde mal nachsehen.

	Log_CreateTopic	(TOPIC_MOD_JIM_SCHUTZ, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JIM_SCHUTZ, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_JIM_SCHUTZ, "Der Ork Jim in Khorata bekommt keinen Freudenspender mehr von Anselm, weil er sich geweigert hat, in der Mine zu arbeiten. Er will Anselm nun zur Besänftigung ein Geisteramulett schenken, das allerdings noch erprobt werden muss. Nordöstlich des Hofstaat-Passes ist ein Friedhof, auf dem sich nachts eine Geisterseele befinden könnte.");

	Mod_Jim_Schutz = 1;

	Info_ClearChoices	(Info_Mod_Jim_Traurig);
};

INSTANCE Info_Mod_Jim_Schutzbeduerftig (C_INFO)
{
	npc		= Mod_10040_Orc_Jim_REL;
	nr		= 1;
	condition	= Info_Mod_Jim_Schutzbeduerftig_Condition;
	information	= Info_Mod_Jim_Schutzbeduerftig_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe dein Amulett ausprobiert. Es hat tadellos gearbeitet.";
};

FUNC INT Info_Mod_Jim_Schutzbeduerftig_Condition()
{
	if (Mod_Jim_Schutz == 2)
	&& (Npc_HasItems(hero, ItAm_Geisteramulett) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jim_Schutzbeduerftig_Info()
{
	AI_Output(hero, self, "Info_Mod_Jim_Schutzbeduerftig_15_00"); //Ich habe dein Amulett ausprobiert. Es hat tadellos gearbeitet.

	B_GiveInvItems	(hero, self, ItAm_Geisteramulett, 1);

	AI_Output(self, hero, "Info_Mod_Jim_Schutzbeduerftig_18_01"); //Jim froh und dankbar. Mensch nehmen dieses Gold als Dank von Jim.

	B_GiveInvItems	(self, hero, ItMi_Gold, 50);

	AI_Output(hero, self, "Info_Mod_Jim_Schutzbeduerftig_15_02"); //Wirst du Anselm das Amulett nun geben?
	AI_Output(self, hero, "Info_Mod_Jim_Schutzbeduerftig_18_03"); //Ja! Jim kaum können erwarten zu kriegen wieder Spender-Freuden.
	AI_Output(hero, self, "Info_Mod_Jim_Schutzbeduerftig_15_04"); //Dann viel Glück.

	B_SetTopicStatus	(TOPIC_MOD_JIM_SCHUTZ, LOG_SUCCESS);

	B_GivePlayerXP	(150);

	CurrentNQ += 1;

	Mod_REL_QuestCounter += 1;

	Mod_Jim_AnselmDay = Wld_GetDay();
};

INSTANCE Info_Mod_Jim_SpenderFreuden (C_INFO)
{
	npc		= Mod_10040_Orc_Jim_REL;
	nr		= 1;
	condition	= Info_Mod_Jim_SpenderFreuden_Condition;
	information	= Info_Mod_Jim_SpenderFreuden_Info;
	permanent	= 0;
	important	= 0;
	description	= "Warst du erfolgreich mit deinem Amulett?";
};

FUNC INT Info_Mod_Jim_SpenderFreuden_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jim_Schutzbeduerftig))
	&& (Wld_GetDay() > Mod_Jim_AnselmDay)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jim_SpenderFreuden_Info()
{
	AI_Output(hero, self, "Info_Mod_Jim_SpenderFreuden_15_00"); //Warst du erfolgreich mit deinem Amulett?
	AI_Output(self, hero, "Info_Mod_Jim_SpenderFreuden_18_01"); //(verzweifelt) Menschenhäuptling nehmen, aber nicht geben Spender-Freuden zurück.
	AI_Output(self, hero, "Info_Mod_Jim_SpenderFreuden_18_02"); //Sagen bloß, Amulett nett und passen gut zu Kleidung.

	Info_ClearChoices	(Info_Mod_Jim_SpenderFreuden);

	Info_AddChoice	(Info_Mod_Jim_SpenderFreuden, "Glaub mir, das ist besser so.", Info_Mod_Jim_SpenderFreuden_B);
	Info_AddChoice	(Info_Mod_Jim_SpenderFreuden, "Soll ich ein wenig Freudenspender für dich auftreiben?", Info_Mod_Jim_SpenderFreuden_A);
};

FUNC VOID Info_Mod_Jim_SpenderFreuden_B()
{
	AI_Output(hero, self, "Info_Mod_Jim_SpenderFreuden_B_15_00"); //Glaub mir, das ist besser so.
	AI_Output(self, hero, "Info_Mod_Jim_SpenderFreuden_B_18_01"); //Aber Jim jetzt sehr traurig.

	Info_ClearChoices	(Info_Mod_Jim_SpenderFreuden);
};

FUNC VOID Info_Mod_Jim_SpenderFreuden_A()
{
	AI_Output(hero, self, "Info_Mod_Jim_SpenderFreuden_A_15_00"); //Soll ich ein wenig Freudenspender für dich auftreiben?
	AI_Output(self, hero, "Info_Mod_Jim_SpenderFreuden_A_18_01"); //Jim würden stehen in großer Schuld von Mensch, wenn bringen Spender-Freuden.
	AI_Output(self, hero, "Info_Mod_Jim_SpenderFreuden_A_18_02"); //Menschenhäuptling immer gehen zu Haus-Lager in Gasse, wo Menschen schlafen.
	AI_Output(self, hero, "Info_Mod_Jim_SpenderFreuden_A_18_03"); //Dort müssen sein großer Vorrat an Spender-Freuden. Aber Wache nicht lassen Jim in Haus-Lager.
	AI_Output(hero, self, "Info_Mod_Jim_SpenderFreuden_A_15_04"); //Ich komme bald wieder.

	Mod_Jim_Freudenspender = 1;

	Log_CreateTopic	(TOPIC_MOD_JIM_FREUDENSPENDER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JIM_FREUDENSPENDER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_JIM_FREUDENSPENDER, "Jim ist am Boden zerstört, weil Anselm sein Geschenk nicht mit Begeisterung aufgenommen hat. Ich habe ihm versprochen, dass ich ihm Freudenspender aus dem Lagerhaus in der Wohnhausgasse von Khorata bringe.");

	Wld_InsertItem	(ItMi_FreudenspenderPaket, "FP_ITEM_JIM_DROGEN");

	Info_ClearChoices	(Info_Mod_Jim_SpenderFreuden);
};

INSTANCE Info_Mod_Jim_SpenderFreuden2 (C_INFO)
{
	npc		= Mod_10040_Orc_Jim_REL;
	nr		= 1;
	condition	= Info_Mod_Jim_SpenderFreuden2_Condition;
	information	= Info_Mod_Jim_SpenderFreuden2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Das Paket hier sollte erst mal reichen, oder?";
};

FUNC INT Info_Mod_Jim_SpenderFreuden2_Condition()
{
	if (Mod_Jim_Freudenspender == 3)
	&& (Npc_HasItems(hero, ItMi_FreudenspenderPaket) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jim_SpenderFreuden2_Info()
{
	AI_Output(hero, self, "Info_Mod_Jim_SpenderFreuden2_15_00"); //Das Paket hier sollte erst mal reichen, oder?

	B_GiveInvItems	(hero, self, ItMi_FreudenspenderPaket, 1);

	AI_Output(self, hero, "Info_Mod_Jim_SpenderFreuden2_18_01"); //Oh, Jim Mensch sehr dankbar. Jim haben gespart eine Menge Geld von Ausbildung bei Metzger.
	AI_Output(self, hero, "Info_Mod_Jim_SpenderFreuden2_18_02"); //Jim wollen teilen mit Mensch.

	B_GiveInvItems	(self, hero, ItMi_Gold, 300);

	AI_Output(hero, self, "Info_Mod_Jim_SpenderFreuden2_15_03"); //Danke. Mach's gut.

	B_SetTopicStatus	(TOPIC_MOD_JIM_FREUDENSPENDER, LOG_SUCCESS);

	CurrentNQ += 1;

	Mod_REL_QuestCounter += 1;

	Mod_Jim_Freudenspender = 4;
};

INSTANCE Info_Mod_Jim_SpenderFreuden3 (C_INFO)
{
	npc		= Mod_10040_Orc_Jim_REL;
	nr		= 1;
	condition	= Info_Mod_Jim_SpenderFreuden3_Condition;
	information	= Info_Mod_Jim_SpenderFreuden3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hätte hier so was Ähnliches wie Freudenspender ...";
};

FUNC INT Info_Mod_Jim_SpenderFreuden3_Condition()
{
	if (Mod_Jim_Freudenspender < 4)
	&& (Mod_Jim_Freudenspender > 0)
	&& (Npc_HasItems(hero, ItPo_FreudenspenderSuppe) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jim_SpenderFreuden3_Info()
{
	AI_Output(hero, self, "Info_Mod_Jim_SpenderFreuden3_15_00"); //Ich hätte hier so was Ähnliches wie Freudenspender ...

	B_GiveInvItems	(hero, self, ItPo_FreudenspenderSuppe, 1);

	AI_Output(self, hero, "Info_Mod_Jim_SpenderFreuden3_18_01"); //Jim müssen probieren. Riechen nicht gut, aber vielleicht schmecken gut.

	AI_StopProcessInfos	(self);

	Mod_Jim_Freudenspender = 5;
};

INSTANCE Info_Mod_Jim_Name (C_INFO)
{
	npc		= Mod_10040_Orc_Jim_REL;
	nr		= 1;
	condition	= Info_Mod_Jim_Name_Condition;
	information	= Info_Mod_Jim_Name_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ungewöhnlicher Name für einen Ork.";
};

FUNC INT Info_Mod_Jim_Name_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jim_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jim_Name_Info()
{
	AI_Output(hero, self, "Info_Mod_Jim_Name_15_00"); //Ungewöhnlicher Name für einen Ork.
	AI_Output(self, hero, "Info_Mod_Jim_Name_18_01"); //Jim Name von Menschen. Jim nicht kennen Name von Orks.
};

INSTANCE Info_Mod_Jim_Pickpocket (C_INFO)
{
	npc		= Mod_10040_Orc_Jim_REL;
	nr		= 1;
	condition	= Info_Mod_Jim_Pickpocket_Condition;
	information	= Info_Mod_Jim_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Jim_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Jim_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Jim_Pickpocket);

	Info_AddChoice	(Info_Mod_Jim_Pickpocket, DIALOG_BACK, Info_Mod_Jim_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Jim_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Jim_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Jim_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Jim_Pickpocket);
};

FUNC VOID Info_Mod_Jim_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Jim_Pickpocket);
};

INSTANCE Info_Mod_Jim_EXIT (C_INFO)
{
	npc		= Mod_10040_Orc_Jim_REL;
	nr		= 1;
	condition	= Info_Mod_Jim_EXIT_Condition;
	information	= Info_Mod_Jim_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Jim_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Jim_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};