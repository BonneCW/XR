INSTANCE Info_Mod_Burl_Rattenquest (C_INFO)
{
	npc		= Mod_7408_OUT_Burl_EIS;
	nr		= 1;
	condition	= Info_Mod_Burl_Rattenquest_Condition;
	information	= Info_Mod_Burl_Rattenquest_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bist du Burl?";
};

FUNC INT Info_Mod_Burl_Rattenquest_Condition()
{
	if (Mod_RattenQuest == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Burl_Rattenquest_Info()
{
	AI_Output(hero, self, "Info_Mod_Burl_Rattenquest_15_00"); //Bist du Burl?
	AI_Output(self, hero, "Info_Mod_Burl_Rattenquest_08_01"); //Oh man, mein Schädel brummt noch von gestern Nacht könntest du mich nicht noch schlafen lassen?
	AI_Output(hero, self, "Info_Mod_Burl_Rattenquest_15_02"); //Nein, soviel Zeit hab ich nicht.
	AI_Output(self, hero, "Info_Mod_Burl_Rattenquest_08_03"); //Ok, schon in Ordnung, wie kann ich dir denn helfen?
	AI_Output(hero, self, "Info_Mod_Burl_Rattenquest_15_04"); //Der Wirt meinte du wüsstest wo man hier Ratten findet.
	AI_Output(self, hero, "Info_Mod_Burl_Rattenquest_08_05"); //Ja, ich weiß wo sich in letzter Zeit eine Menge von denen aufhalten. Hab mich schon gewundet, warum die ausgerechnet in einem so kalten Gebiet sind.
	AI_Output(self, hero, "Info_Mod_Burl_Rattenquest_08_06"); //Ein gutes Stück westlich von hier, auf dem Berg über der Mine, dort habe ich sie gesehen. Hier ist eine Karte.

	B_GiveInvItems	(self, hero, ItWr_Map_Eisgebiet_Richard, 1);

	AI_Output(hero, self, "Info_Mod_Burl_Rattenquest_15_07"); //Danke.

	B_LogEntry	(TOPIC_MOD_RATTENQUEST, "Burl hat mir gesagt, wo ich die Ratten finde. Im Westen auf dem Berg über der Mine sollte ich mich also mal umsehen. Er hat mir auch eine Karte gegeben, wo der Ort markiert ist.");

	Mod_RattenQuest = 6;

	// Frau und Richard und Ratten spawnen

	Wld_InsertNpc	(Mod_7410_OUT_Frau_EIS, "EIS_173");

	Wld_InsertNpc	(Mod_7409_OUT_Richard_EIS, "EIS_174");

	Wld_InsertNpc	(Giant_EisRat, "EIS_EINSAMEBUDE_12");
	Wld_InsertNpc	(Giant_EisRat, "EIS_EINSAMEBUDE_12");
	Wld_InsertNpc	(Giant_EisRat, "EIS_EINSAMEBUDE_12");
	Wld_InsertNpc	(Giant_EisRat, "EIS_EINSAMEBUDE_12");
	Wld_InsertNpc	(Giant_EisRat, "EIS_EINSAMEBUDE_12");

	Wld_InsertNpc	(Giant_EisRat, "EIS_EINSAMEBUDE_6");
	Wld_InsertNpc	(Giant_EisRat, "EIS_EINSAMEBUDE_6");
	Wld_InsertNpc	(Giant_EisRat, "EIS_EINSAMEBUDE_6");
	Wld_InsertNpc	(Giant_EisRat, "EIS_EINSAMEBUDE_6");
	Wld_InsertNpc	(Giant_EisRat, "EIS_EINSAMEBUDE_6");
	Wld_InsertNpc	(Giant_EisRat, "EIS_EINSAMEBUDE_6");
	Wld_InsertNpc	(Giant_EisRat, "EIS_EINSAMEBUDE_6");

	Wld_InsertNpc	(Giant_EisRat, "GOBLINBANDIT_09");
	Wld_InsertNpc	(Giant_EisRat, "GOBLINBANDIT_09");
	Wld_InsertNpc	(Giant_EisRat, "GOBLINBANDIT_09");
	Wld_InsertNpc	(Giant_EisRat, "GOBLINBANDIT_09");
	Wld_InsertNpc	(Giant_EisRat, "GOBLINBANDIT_09");
	Wld_InsertNpc	(Giant_EisRat, "GOBLINBANDIT_09");
	Wld_InsertNpc	(Giant_EisRat, "GOBLINBANDIT_09");
	Wld_InsertNpc	(Giant_EisRat, "GOBLINBANDIT_09");
};

INSTANCE Info_Mod_Burl_EXIT (C_INFO)
{
	npc		= Mod_7408_OUT_Burl_EIS;
	nr		= 1;
	condition	= Info_Mod_Burl_EXIT_Condition;
	information	= Info_Mod_Burl_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Burl_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Burl_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};