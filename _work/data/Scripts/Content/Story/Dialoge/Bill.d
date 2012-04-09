INSTANCE Info_Mod_Bill_Hi (C_INFO)
{
	npc		= Mod_929_PIR_Bill_AW;
	nr		= 1;
	condition	= Info_Mod_Bill_Hi_Condition;
	information	= Info_Mod_Bill_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Bill_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bill_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Bill_Hi_03_01"); //Ich bin Bill.
};

INSTANCE Info_Mod_Bill_Rezept (C_INFO)
{
	npc		= Mod_929_PIR_Bill_AW;
	nr		= 1;
	condition	= Info_Mod_Bill_Rezept_Condition;
	information	= Info_Mod_BIll_Rezept_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab hier was von dir.";
};

FUNC INT Info_Mod_Bill_Rezept_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alvro_Melasse))
	&& (Npc_KnowsInfo(hero, Info_Mod_Bill_Hi))
	&& (Npc_HasItems(hero, Mod_BillsRumRezept) == 1)
	&& (Mod_BillsRezeptGelesen == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bill_Rezept_Info()
{
	AI_Output(hero, self, "Info_Mod_Bill_Rezept_15_00"); //Ich hab hier was von dir.
	AI_Output(self, hero, "Info_Mod_Bill_Rezept_03_01"); //Was denn?
	AI_Output(hero, self, "Info_Mod_Bill_Rezept_15_02"); //Diesen Zettel hab ich bei Alvro gefunden. Es ist ein Schreiben von dir.

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Bill_Rezept_03_03"); //Ähm, nunja, es ist nicht so wie es aussieht. Ich wollte nur nicht wieder auf Schatzsuche gehen.
	AI_Output(self, hero, "Info_Mod_Bill_Rezept_03_04"); //Wir wären beim letzten Mal fast draufgegangen.
	AI_Output(hero, self, "Info_Mod_Bill_Rezept_15_05"); //Ich sollte das Greg melden.
	AI_Output(self, hero, "Info_Mod_Bill_Rezept_03_06"); //Nein, tu das nicht. Ich könnte dir vielleicht auch irgendwann mal helfen.

	Info_ClearChoices	(Info_Mod_Bill_Rezept);

	Info_AddChoice	(Info_Mod_Bill_Rezept, "Na gut, ich verpetze dich nicht und du hilfst mir dafür.", Info_Mod_Bill_Rezept_JA);
	Info_AddChoice	(Info_Mod_Bill_Rezept, "Nein, ich werde zu Greg gehen.", Info_Mod_Bill_Rezept_NEIN);
};

FUNC VOID Info_Mod_Bill_Rezept_JA()
{
	AI_Output(hero, self, "Info_Mod_Bill_Rezept_JA_15_00"); //Na gut, ich verpetze dich nicht und du hilfst mir dafür.
	AI_Output(self, hero, "Info_Mod_Bill_Rezept_JA_03_01"); //Danke. Wenn du ein Problem hast, dann komm gleich zu mir, ich werde dir helfen.

	Info_ClearChoices	(Info_Mod_Bill_Rezept);
};

FUNC VOID Info_Mod_Bill_Rezept_NEIN()
{
	AI_Output(hero, self, "Info_Mod_Bill_Rezept_NEIN_15_00"); //Nein, ich werde zu Greg gehen.
	AI_Output(self, hero, "Info_Mod_Bill_Rezept_NEIN_03_01"); //Wie du meinst, aber ich hätte nützlich für dich sein können.

	Mod_BillsVerbrechenPetzen = 1;
	
	Info_ClearChoices	(Info_Mod_Bill_Rezept);
};

INSTANCE Info_Mod_Bill_Befreiung (C_INFO)
{
	npc		= Mod_929_PIR_Bill_AW;
	nr		= 1;
	condition	= Info_Mod_Bill_Befreiung_Condition;
	information	= Info_Mod_Bill_Befreiung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du ziehst so eine lange Schnute, ist etwas passiert?";
};

FUNC INT Info_Mod_Bill_Befreiung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Greg_Befreiung2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bill_Befreiung_Info()
{
	AI_Output(hero, self, "Info_Mod_Bill_Befreiung_15_00"); //Du ziehst so eine lange Schnute, ist etwas passiert?
	AI_Output(self, hero, "Info_Mod_Bill_Befreiung_03_01"); //(traurig) Das kann man wohl sagen. Mein Freund, Owen, ist nicht mehr da.
	AI_Output(self, hero, "Info_Mod_Bill_Befreiung_03_02"); //Seit wir von den Untoten und diesem Kult angegriffen wurden, ist er spurlos verschwunden.
	AI_Output(self, hero, "Info_Mod_Bill_Befreiung_03_03"); //Ich glaube, dass er vor lauter Angst abgehauen ist, doch ich frage mich, wie er das angestellt hat, da das Lager verschlossen ist.
	AI_Output(self, hero, "Info_Mod_Bill_Befreiung_03_04"); //Ich weiß nicht mehr weiter.
	AI_Output(hero, self, "Info_Mod_Bill_Befreiung_15_05"); //Wo hast du Owen denn zuletzt gesehen. Ich meine, er kann nicht einfach verschwinden.
	AI_Output(self, hero, "Info_Mod_Bill_Befreiung_03_06"); //(nachdenklich) Zuletzt war er vor dem Angriff auf Wache hinter dem See bei Gregs Haus, da dort ein Weg in das Gebirge führt und wir von dort eventuellen Angriffen der Untoten ausgeliefert sind.
	AI_Output(self, hero, "Info_Mod_Bill_Befreiung_03_07"); //Ich denke, dass er dort verschwunden ist.
	AI_Output(hero, self, "Info_Mod_Bill_Befreiung_15_08"); //Seltsam ist das, ich werde versuchen deinen Freund zu finden.
	AI_Output(self, hero, "Info_Mod_Bill_Befreiung_03_09"); //(hellt auf) Wirklich? Ich kann dir nicht genug danken.
	AI_Output(self, hero, "Info_Mod_Bill_Befreiung_03_10"); //Was ich noch sagen wollte: Alligator Jack ist ebenfalls aufgebrochen, um Bill zu finden.
	AI_Output(self, hero, "Info_Mod_Bill_Befreiung_03_11"); //Vielleicht holst du ihn noch ein.
	AI_Output(hero, self, "Info_Mod_Bill_Befreiung_15_12"); //Gut, danke für die Infos. Ich werde mich auf den Weg machen.
	AI_Output(self, hero, "Info_Mod_Bill_Befreiung_03_13"); //Viel Glück!
	
	Log_CreateTopic	(TOPIC_MOD_BEL_PIRBILL, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_PIRBILL, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BEL_PIRBILL, "Bill's Freund Owen ist seit dem Angriff der Untoten verschwunden. Zuletzt wurde er in der Nähe von Greg's Hütte beim Weg ins Gebirge gesehen. Ich sollte meine Suche dort beginnen.");
};

INSTANCE Info_Mod_Bill_Befreiung2 (C_INFO)
{
	npc		= Mod_929_PIR_Bill_AW;
	nr		= 1;
	condition	= Info_Mod_Bill_Befreiung2_Condition;
	information	= Info_Mod_Bill_Befreiung2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich bringe dir Owen wieder.";
};

FUNC INT Info_Mod_Bill_Befreiung2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bill_Befreiung))
	&& (Npc_KnowsInfo(hero, Info_Mod_Owen_Befreiung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bill_Befreiung2_Info()
{
	AI_Output(hero, self, "Info_Mod_Bill_Befreiung2_15_00"); //Ich bringe dir Owen wieder.
	AI_Output(self, hero, "Info_Mod_Bill_Befreiung2_03_01"); //(hell erfreut) Ich danke dir. Ich kann dir nicht genug danken. Du hast Owen gerettet. Hier, nimm das!

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	AI_Output(hero, self, "Info_Mod_Bill_Befreiung2_15_02"); //Danke. Aber ich habe dir noch eine schlimme Nachricht zu überbringen.
	AI_Output(self, hero, "Info_Mod_Bill_Befreiung2_03_03"); //(überrascht) Achja? Um was geht es?
	AI_Output(hero, self, "Info_Mod_Bill_Befreiung2_15_04"); //Um Alligator Jack. Ich habe seine Leiche im Gebirge gefunden. Er wurde von den Banditen getötet, die auch Owen entführt hatten.
	AI_Output(self, hero, "Info_Mod_Bill_Befreiung2_03_05"); //(stottert) Das kann ... kann nicht sein. Alligator Jack war einer der Besten.
	AI_Output(hero, self, "Info_Mod_Bill_Befreiung2_15_06"); //Ich kann es auch nicht verstehen. Aber ich habe seine Leiche gefunden.
	AI_Output(self, hero, "Info_Mod_Bill_Befreiung2_03_07"); //Er ist gestorben, um seinen Kameraden zu helfen. Wir werden auf sein Wohl trinken und ihm ein anständiges Begräbnis machen.
	AI_Output(self, hero, "Info_Mod_Bill_Befreiung2_03_08"); //Jedenfalls danke ich dir für deine Hilfe. Wenn du mich jetzt entschuldigst, ich werde mich nun um Owen kümmern.
	AI_Output(hero, self, "Info_Mod_Bill_Befreiung2_15_09"); //Alles klar.

	B_GivePlayerXP	(600);

	Npc_ClearAIQueue	(Mod_939_PIR_Owen_AW);

	B_StartOtherRoutine	(Mod_939_PIR_Owen_AW, "START");

	Mod_Piratenbefreiung += 1;
	
	B_LogEntry_More	(TOPIC_MOD_BEL_PIRBILL, TOPIC_MOD_BEL_PIRATENLAGER, "Ich habe Owen zu Bill gebracht und diesem von Alligator Jack erzählt.", "Ich habe für Bill Owen gefunden. Leider ist Alligator Jack auf der Suche nach Owen getötet worden.");
	B_SetTopicStatus	(TOPIC_MOD_BEL_PIRBILL, LOG_SUCCESS);
};

INSTANCE Info_Mod_Bill_Pickpocket (C_INFO)
{
	npc		= Mod_929_PIR_Bill_AW;
	nr		= 1;
	condition	= Info_Mod_Bill_Pickpocket_Condition;
	information	= Info_Mod_Bill_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Bill_Pickpocket_Condition()
{
	C_Beklauen	(50, ItMi_Gold, 120);
};

FUNC VOID Info_Mod_Bill_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Bill_Pickpocket);

	Info_AddChoice	(Info_Mod_Bill_Pickpocket, DIALOG_BACK, Info_Mod_Bill_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Bill_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Bill_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Bill_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Bill_Pickpocket);
};

FUNC VOID Info_Mod_Bill_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Bill_Pickpocket);
};

INSTANCE Info_Mod_Bill_EXIT (C_INFO)
{
	npc		= Mod_929_PIR_Bill_AW;
	nr		= 1;
	condition	= Info_Mod_Bill_EXIT_Condition;
	information	= Info_Mod_Bill_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Bill_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bill_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};