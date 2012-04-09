INSTANCE Info_Mod_Rudolf_Hi (C_INFO)
{
	npc		= Mod_7338_OUT_Lebensmittelhaendler_REL;
	nr		= 1;
	condition	= Info_Mod_Rudolf_Hi_Condition;
	information	= Info_Mod_Rudolf_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Rudolf_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Rudolf_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Rudolf_Hi_09_00"); //Frische Ware, frische Ware. Lebensmittel aller Art nur bei mir!

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_KHORATA, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_KHORATA, "Rudolf in Khorata verkauft alle möglichen Lebensmittel.");
};

INSTANCE Info_Mod_Rudolf_Aufgabe (C_INFO)
{
	npc		= Mod_7338_OUT_Lebensmittelhaendler_REL;
	nr		= 1;
	condition	= Info_Mod_Rudolf_Aufgabe_Condition;
	information	= Info_Mod_Rudolf_Aufgabe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kann ich dir irgendwas gutes tun?";
};

FUNC INT Info_Mod_Rudolf_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Rudolf_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rudolf_Aufgabe_Info()
{
	AI_Output(hero, self, "Info_Mod_Rudolf_Aufgabe_15_00"); //Kann ich dir irgendwas gutes tun?
	AI_Output(self, hero, "Info_Mod_Rudolf_Aufgabe_09_01"); //Was gutes?
	AI_Output(hero, self, "Info_Mod_Rudolf_Aufgabe_15_02"); //Ja, irgendetwas, was dir auf dem Herzen liegt ...
	AI_Output(self, hero, "Info_Mod_Rudolf_Aufgabe_09_03"); //Hm ... du könntest zu Erika gehen. Sie hat dort einen besonders guten Schnaps im Angebot.
	AI_Output(self, hero, "Info_Mod_Rudolf_Aufgabe_09_04"); //Den könntest du mir besorgen. Ich geb dir auch das Gold dafür, wenn du ihn mir gebracht hast.
	AI_Output(hero, self, "Info_Mod_Rudolf_Aufgabe_15_05"); //Wie du meinst.
};

INSTANCE Info_Mod_Rudolf_HabSchnaps (C_INFO)
{
	npc		= Mod_7338_OUT_Lebensmittelhaendler_REL;
	nr		= 1;
	condition	= Info_Mod_Rudolf_HabSchnaps_Condition;
	information	= Info_Mod_Rudolf_HabSchnaps_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab den Schnaps für dich.";
};

FUNC INT Info_Mod_Rudolf_HabSchnaps_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Rudolf_Aufgabe))
	&& (Npc_HasItems(hero, ItFo_BoozeRudolf) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rudolf_HabSchnaps_Info()
{
	AI_Output(hero, self, "Info_Mod_Rudolf_HabSchnaps_15_00"); //Ich hab den Schnaps für dich.
	AI_Output(self, hero, "Info_Mod_Rudolf_HabSchnaps_09_01"); //Dann gib mal her das Zeug.
	AI_Output(hero, self, "Info_Mod_Rudolf_HabSchnaps_15_02"); //Hier hast du ihn.

	B_GiveInvItems	(hero, self, ItFo_BoozeRudolf, 1);

	AI_Output(self, hero, "Info_Mod_Rudolf_HabSchnaps_09_03"); //Ah ... gleich mal probieren.

	B_UseItem	(self, ItFo_BoozeRudolf);

	AI_Output(self, hero, "Info_Mod_Rudolf_HabSchnaps_09_04"); //Oh, der haut ganz schön rein ...
	AI_Output(hero, self, "Info_Mod_Rudolf_HabSchnaps_15_05"); //Was ist mit meinem Gold?
	AI_Output(self, hero, "Info_Mod_Rudolf_HabSchnaps_09_06"); //Jaja, hier nimm.

	B_GiveInvItems	(self, hero, ItMi_Gold, 50);

	AI_Output(self, hero, "Info_Mod_Rudolf_HabSchnaps_09_07"); //Und jetzt lass mich meinen edlen Tropfen genießen.

	B_GivePlayerXP	(50);
};

INSTANCE Info_Mod_Rudolf_Nagelnachschub (C_INFO)
{
	npc		= Mod_7338_OUT_Lebensmittelhaendler_REL;
	nr		= 1;
	condition	= Info_Mod_Rudolf_Nagelnachschub_Condition;
	information	= Info_Mod_Rudolf_Nagelnachschub_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du Nägel?";
};

FUNC INT Info_Mod_Rudolf_Nagelnachschub_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lukas_Wettstreit))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rudolf_Nagelnachschub_Info()
{
	AI_Output(hero, self, "Info_Mod_Rudolf_Nagelnachschub_15_00"); //Hast du Nägel?
	AI_Output(self, hero, "Info_Mod_Rudolf_Nagelnachschub_09_01"); //(grimmig) Kannst ja mal in meinem Obst suchen, ob ich irgendwo Nägel versteckt habe.
	AI_Output(self, hero, "Info_Mod_Rudolf_Nagelnachschub_09_02"); //Und wenn du nicht fündig wirst, habe ich wohl keine.
};

INSTANCE Info_Mod_Rudolf_Kissen (C_INFO)
{
	npc		= Mod_7338_OUT_Lebensmittelhaendler_REL;
	nr		= 1;
	condition	= Info_Mod_Rudolf_Kissen_Condition;
	information	= Info_Mod_Rudolf_Kissen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich brauche was Weiches.";
};

FUNC INT Info_Mod_Rudolf_Kissen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Rudolf_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Malik_Aufgabe))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Morpheus_Kissen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rudolf_Kissen_Info()
{
	AI_Output(hero, self, "Info_Mod_Rudolf_Kissen_15_00"); //Ich brauche was Weiches.
	AI_Output(self, hero, "Info_Mod_Rudolf_Kissen_09_01"); //Da kann ich meinen Hochlandkäse anbieten. Der schmilzt auf der Zunge.
	AI_Output(hero, self, "Info_Mod_Rudolf_Kissen_15_02"); //Der stinkt.
	AI_Output(self, hero, "Info_Mod_Rudolf_Kissen_09_03"); //Na und? Sonst wäre es kein Käse.
	AI_Output(hero, self, "Info_Mod_Rudolf_Kissen_15_04"); //Auch wahr. Nein danke. Wir sehen uns.
	AI_Output(self, hero, "Info_Mod_Rudolf_Kissen_09_05"); //Wenn du meinst ...
};

INSTANCE Info_Mod_Rudolf_Kimon (C_INFO)
{
	npc		= Mod_7338_OUT_Lebensmittelhaendler_REL;
	nr		= 1;
	condition	= Info_Mod_Rudolf_Kimon_Condition;
	information	= Info_Mod_Rudolf_Kimon_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du noch was anderes außer Lebensmitteln?";
};

FUNC INT Info_Mod_Rudolf_Kimon_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Rudolf_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Penner_Kimon))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Morpheus_Kimon))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rudolf_Kimon_Info()
{
	AI_Output(hero, self, "Info_Mod_Rudolf_Kimon_15_00"); //Hast du noch was anderes außer Lebensmitteln?
	AI_Output(self, hero, "Info_Mod_Rudolf_Kimon_09_01"); //Eigentlich nichts.
	AI_Output(hero, self, "Info_Mod_Rudolf_Kimon_15_02"); //Eigentlich? Vielleicht doch? Freudenspender vielleicht?
	AI_Output(self, hero, "Info_Mod_Rudolf_Kimon_09_03"); //Ich wollte, ich hätte! Soll noch besser sein, als der Schnaps von der Erika.
	AI_Output(hero, self, "Info_Mod_Rudolf_Kimon_15_04"); //War ja nur eine Frage. Nichts für ungut.
};

INSTANCE Info_Mod_Rudolf_Trade (C_INFO)
{
	npc		= Mod_7338_OUT_Lebensmittelhaendler_REL;
	nr		= 1;
	condition	= Info_Mod_Rudolf_Trade_Condition;
	information	= Info_Mod_Rudolf_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Rudolf_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Rudolf_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rudolf_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Rudolf_Pickpocket (C_INFO)
{
	npc		= Mod_7338_OUT_Lebensmittelhaendler_REL;
	nr		= 1;
	condition	= Info_Mod_Rudolf_Pickpocket_Condition;
	information	= Info_Mod_Rudolf_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_100;
};

FUNC INT Info_Mod_Rudolf_Pickpocket_Condition()
{
	C_Beklauen	(97, ItMi_Gold, 2000);
};

FUNC VOID Info_Mod_Rudolf_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Rudolf_Pickpocket);

	Info_AddChoice	(Info_Mod_Rudolf_Pickpocket, DIALOG_BACK, Info_Mod_Rudolf_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Rudolf_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Rudolf_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Rudolf_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Rudolf_Pickpocket);
};

FUNC VOID Info_Mod_Rudolf_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Rudolf_Pickpocket);
};

INSTANCE Info_Mod_Rudolf_EXIT (C_INFO)
{
	npc		= Mod_7338_OUT_Lebensmittelhaendler_REL;
	nr		= 1;
	condition	= Info_Mod_Rudolf_EXIT_Condition;
	information	= Info_Mod_Rudolf_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Rudolf_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Rudolf_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};