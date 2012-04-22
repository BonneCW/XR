INSTANCE Info_Mod_Bodo_Hi (C_INFO)
{
	npc		= Mod_516_SNOV_Bodo_NW;	
	nr		= 1;
	condition	= Info_Mod_Bodo_Hi_Condition;
	information	= Info_Mod_Bodo_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was ist dein Beruf?";
};

FUNC INT Info_Mod_Bodo_Hi_Condition()
{
	if (!Npc_KnowsInfo(hero, Info_Mod_Bodo_WiePruefung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bodo_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Bodo_Hi_15_00"); //Was ist dein Beruf?
	AI_Output(self, hero, "Info_Mod_Bodo_Hi_12_01"); //(redegewandt) Dies und das. Ich erledige vor allem Gelegenheitsarbeiten, Botendienste und so einen Kram.
	AI_Output(hero, self, "Info_Mod_Bodo_Hi_15_02"); //Kann man denn davon leben?
	AI_Output(self, hero, "Info_Mod_Bodo_Hi_12_03"); //Gut bezahlt ist es wirklich nicht, aber ich komme schon klar.
};

INSTANCE Info_Mod_Bodo_Krautlieferung (C_INFO)
{
	npc		= Mod_516_SNOV_Bodo_NW;
	nr		= 1;
	condition	= Info_Mod_Bodo_Krautlieferung_Condition;
	information	= Info_Mod_Bodo_Krautlieferung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du sollst was für Myxir dabei haben.";
};

FUNC INT Info_Mod_Bodo_Krautlieferung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Myxir_Haendler))
	&& (Mod_MyxirsKräuter == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bodo_Krautlieferung_Info()
{
	AI_Output(hero, self, "Info_Mod_Bodo_Krautlieferung_15_00"); //Du sollst was für Myxir dabei haben.
	AI_Output(self, hero, "Info_Mod_Bodo_Krautlieferung_12_01"); //Hat er danach gefragt, ja? Ich hätte ihm die Pflanzen ja gern schon gebracht, aber mein Auftrag hier hat es nicht zugelassen...
	AI_Output(hero, self, "Info_Mod_Bodo_Krautlieferung_15_02"); //Ja, schon gut. Niemand wird dich dafür umbringen.
	AI_Output(self, hero, "Info_Mod_Bodo_Krautlieferung_12_03"); //Na, da bin ich aber erleichtert!
	AI_Output(self, hero, "Info_Mod_Bodo_Krautlieferung_12_04"); //Hier hast du sie. Richte Myxir viele Grüße aus!

	B_GiveInvItems	(self, hero, MyxirsGiftpflanze, 20);

	AI_Output(hero, self, "Info_Mod_Bodo_Krautlieferung_15_05"); //Da wird er sich sicher freuen.

	B_LogEntry	(TOPIC_MOD_GIFTPFLANZEN, "Bodo hat mir die Pflanzen für Myxir ausgehändigt.");
};

INSTANCE Info_Mod_Bodo_WiePruefung (C_INFO)
{
	npc		= Mod_516_SNOV_Bodo_NW;
	nr		= 1;
	condition	= Info_Mod_Bodo_WiePruefung_Condition;
	information	= Info_Mod_Bodo_WiePruefung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo, Bruder.";
};

FUNC INT Info_Mod_Bodo_WiePruefung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andokai_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bodo_WiePruefung_Info()
{
	AI_Output(hero, self, "Info_Mod_Bodo_WiePruefung_15_00"); //Hallo, Bruder.
	AI_Output(self, hero, "Info_Mod_Bodo_WiePruefung_12_01"); //Bruder? Ich kenne dich doch gar nicht.
	AI_Output(hero, self, "Info_Mod_Bodo_WiePruefung_15_02"); //Du kannst aufhören zu spielen. Ich komme von Andokai.
	AI_Output(self, hero, "Info_Mod_Bodo_WiePruefung_12_03"); //Aah. Herzlich willkommen. Meine Tarnung als Tagedieb ist gut, oder?
	AI_Output(hero, self, "Info_Mod_Bodo_WiePruefung_15_04"); //Die Bürgerklamotten sind vielleicht etwas zu viel des Guten.
	AI_Output(self, hero, "Info_Mod_Bodo_WiePruefung_12_05"); //Stimmt. Aber das ist nun mal meine Eitelkeit. (lacht)
	AI_Output(self, hero, "Info_Mod_Bodo_WiePruefung_12_06"); //Was kann ich für dich tun?

	B_LogEntry	(TOPIC_MOD_DAEMONENBESCHWOERER, "Bodo sagt, dass die Sachen, die ihm bei seiner Prüfung geholfen haben von Myxir stammen.");
};

INSTANCE Info_Mod_Bodo_WieKloster (C_INFO)
{
	npc		= Mod_516_SNOV_Bodo_NW;
	nr		= 1;
	condition	= Info_Mod_Bodo_WieKloster_Condition;
	information	= Info_Mod_Bodo_WieKloster_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich muss etwas aus dem Kloster der Feuermagier stehlen.";
};

FUNC INT Info_Mod_Bodo_WieKloster_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bodo_WiePruefung))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Andokai_Hammer))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bodo_WieKloster_Info()
{
	AI_Output(hero, self, "Info_Mod_Bodo_WieKloster_15_00"); //Ich muss etwas aus dem Kloster der Feuermagier stehlen.
	AI_Output(hero, self, "Info_Mod_Bodo_WieKloster_15_01"); //Andokai hat gesagt, du könntest mir dazu Tipps geben.
	AI_Output(self, hero, "Info_Mod_Bodo_WieKloster_12_02"); //Was musst du denn entwenden?
	AI_Output(hero, self, "Info_Mod_Bodo_WieKloster_15_03"); //Einen Heiligen Hammer.
	AI_Output(self, hero, "Info_Mod_Bodo_WieKloster_12_04"); //Was für ein Glück für dich! Na, da ist doch ein Kinderspiel.
	AI_Output(self, hero, "Info_Mod_Bodo_WieKloster_12_05"); //Der Hammer liegt unten im Keller in einem separaten Raum und wird nur von einer einzelnen Wache kontrolliert.
	AI_Output(hero, self, "Info_Mod_Bodo_WieKloster_15_06"); //Aber gegen eine Wache kann ich doch noch gar nicht bestehen.
	AI_Output(self, hero, "Info_Mod_Bodo_WieKloster_12_07"); //Schon mal was von einem Schlafzauber gehört?
	AI_Output(self, hero, "Info_Mod_Bodo_WieKloster_12_08"); //Du zauberst den Spruch auf die Wache, nimmst den Hammer - und teleportierst dich raus aus dem Kloster!
	AI_Output(self, hero, "Info_Mod_Bodo_WieKloster_12_09"); //Und das Ganze, ohne dass du dem Wächter hast wehtun müssen.

	B_LogEntry	(TOPIC_MOD_DAEMONENBESCHWOERER, "Bodo rät mir, einen Schlafzauber einzupacken für den Fall, dass ich der Wache des Hammers körperlich nicht beikommen kann.");
};

INSTANCE Info_Mod_Bodo_Novize (C_INFO)
{
	npc		= Mod_516_SNOV_Bodo_NW;
	nr		= 1;
	condition	= Info_Mod_Bodo_Novize_Condition;
	information	= Info_Mod_Bodo_Novize_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bist du ein Schwarzer Novize?";
};

FUNC INT Info_Mod_Bodo_Novize_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bodo_WiePruefung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bodo_Novize_Info()
{
	AI_Output(hero, self, "Info_Mod_Bodo_Novize_15_00"); //Bist du ein Schwarzer Novize?
	AI_Output(self, hero, "Info_Mod_Bodo_Novize_12_01"); //Seit kurzem, ja. Und über mangelnde Beschäftigung kann ich nicht klagen.
	AI_Output(hero, self, "Info_Mod_Bodo_Novize_15_02"); //Wie lange hast du gebraucht, um Novize zu werden?
	AI_Output(self, hero, "Info_Mod_Bodo_Novize_12_03"); //Das hat schon gedauert. Ich habe erst mal eine Zeitlang in der Festung an allen Ecken und Ende aushelfen müssen, bis Andokai mich wahrgenommen hat.
	AI_Output(self, hero, "Info_Mod_Bodo_Novize_12_04"); //Nachdem ich die Feuermagier um ein Buch betrogen hatte, war er mir aber gleich sehr zugetan. Viel schwieriger wurde es dann, Xardas von mir überzeugen.
	AI_Output(self, hero, "Info_Mod_Bodo_Novize_12_05"); //Junge, ich sag's dir, das ist echt ein sturer alter Mistkerl. Es hat dann noch mal ein paar Wochen gedauert, bis ich auch seine Stimme hatte.
};

INSTANCE Info_Mod_Bodo_Flugblatt (C_INFO)
{
	npc		= Mod_516_SNOV_Bodo_NW;
	nr		= 1;
	condition	= Info_Mod_Bodo_Flugblatt_Condition;
	information	= Info_Mod_Bodo_Flugblatt_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab hier ein Flugblatt für dich.";
};

FUNC INT Info_Mod_Bodo_Flugblatt_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Auftrag_2))
	&& (Npc_HasItems(hero, MatteoFlugblaetter) >= 1)
	&& (Mod_Flugblaetter < 10)
	&&(!Npc_KnowsInfo(hero, Info_Mod_Matteo_Flugblaetter))
	&& (Npc_KnowsInfo(hero, Info_Mod_Bodo_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bodo_Flugblatt_Info()
{
	B_Say (hero, self, "$MATTEOPAPER");

	B_GiveInvItems	(hero, self, MatteoFlugblaetter, 1);

	AI_Output(self, hero, "Info_Mod_Bodo_Flugblatt_12_01"); //Oh danke. Mal sehen ...

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Bodo_Flugblatt_12_02"); //Ah ja. Vielleicht werd ich mal bei Matteo vorbeischauen.

	Mod_Flugblaetter += 1;
};

INSTANCE Info_Mod_Bodo_Pickpocket (C_INFO)
{
	npc		= Mod_516_SNOV_Bodo_NW;
	nr		= 1;
	condition	= Info_Mod_Bodo_Pickpocket_Condition;
	information	= Info_Mod_Bodo_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Bodo_Pickpocket_Condition()
{
	C_Beklauen	(56, ItMi_Gold, 130);
};

FUNC VOID Info_Mod_Bodo_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Bodo_Pickpocket);

	Info_AddChoice	(Info_Mod_Bodo_Pickpocket, DIALOG_BACK, Info_Mod_Bodo_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Bodo_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Bodo_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Bodo_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Bodo_Pickpocket);
};

FUNC VOID Info_Mod_Bodo_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Bodo_Pickpocket);
};

INSTANCE Info_Mod_Bodo_EXIT (C_INFO)
{
	npc		= Mod_516_SNOV_Bodo_NW;
	nr		= 1;
	condition	= Info_Mod_Bodo_EXIT_Condition;
	information	= Info_Mod_Bodo_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Bodo_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bodo_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};