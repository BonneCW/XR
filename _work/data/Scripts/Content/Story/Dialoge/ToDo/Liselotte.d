instance Info_Mod_Liselotte_Trade1 (C_INFO)
{
	npc		= Mod_546_NONE_Liselotte_NW;
	nr		= 1;
	condition	= Info_Mod_Liselotte_Trade1_Condition;
	information	= Info_Mod_Liselotte_Trade1_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du was für mich?";
};

FUNC INT Info_Mod_Liselotte_Trade1_Condition()
{
	return TRUE ;
};

FUNC VOID Info_Mod_Liselotte_TRADE1_Info()
{
	AI_Output (hero, self, "Info_Mod_Liselotte_Trade1_15_00"); //He, sag mal, du Händlerin, hast du vielleicht was für mich?
	AI_Output (self, hero, "Info_Mod_Liselotte_Trade1_43_01"); //He, willst du mich hier anmachen?
	AI_Output (hero, self, "Info_Mod_Liselotte_Trade1_15_02"); //Oh, äh....
	AI_Output (self, hero, "Info_Mod_Liselotte_Trade1_43_03"); //Sag jetzt nichts Falsches!
	AI_Output (hero, self, "Info_Mod_Liselotte_Trade1_15_04"); //Ich ...
 	AI_Output (self, hero, "Info_Mod_Liselotte_Trade1_43_05"); //... Denk es nicht einmal!
	AI_Output (hero, self, "Info_Mod_Liselotte_Trade1_15_06"); //ENTSCHULDIGUNG!
	AI_Output (self, hero, "Info_Mod_Liselotte_Trade1_43_07"); //Angenommen - aber GERADESO!
	AI_Output (hero, self, "Info_Mod_Liselotte_Trade1_15_08"); //Ähm ...
	AI_Output (self, hero, "Info_Mod_Liselotte_Trade1_43_09"); //Was willst du, verdammt nochmal?
	AI_Output (hero, self, "Info_Mod_Liselotte_Trade1_15_10"); //Ich wollte dich fragen ... du als Händlerin ...
	AI_Output (self, hero, "Info_Mod_Liselotte_Trade1_43_11"); //Red vernünftig mit mir!
	AI_Output (hero, self, "Info_Mod_Liselotte_Trade1_15_12"); //O.K., ähm, du als Händler verkaufst du Waren ...
	AI_Output (self, hero, "Info_Mod_Liselotte_Trade1_43_13"); //Ja, das stimmt.
	AI_Output (hero, self, "Info_Mod_Liselotte_Trade1_15_14"); //Dürfte ich mir dann mal deine Ware anschauen?
	AI_Output (self, hero, "Info_Mod_Liselotte_Trade1_43_15"); //Ich kann dir leider nichts anbieten, da ich mein Warenpaket auf dem Weg in die Stadt verloren habe.
	AI_Output (self, hero, "Info_Mod_Liselotte_Trade1_43_19"); //Es muss irgendwo in der Nähe des Stadttores herumliegen, aber ich habe es nicht finden können.
	AI_Output (hero, self, "Info_Mod_Liselotte_Trade1_15_16"); //Wenn ich es finde, werde ich es dir zukommen lassen.
	AI_Output (self, hero, "Info_Mod_Liselotte_Trade1_43_17"); //Danke, du bist ein Schatz!

	B_GiveInvItems (self, hero, ItMi_Gold, 50);

	AI_Output (hero, self, "Info_Mod_Liselotte_Trade1_15_18"); //Ähm, danke ...

	Log_CreateTopic (TOPIC_MOD_LISELOTTESBEUTEL, LOG_MISSION);
	B_SetTopicStatus (TOPIC_MOD_LISELOTTESBEUTEL, LOG_RUNNING);
	B_LogEntry (TOPIC_MOD_LISELOTTESBEUTEL, "Liselotte hat ihr Warenpaket irgendwo auf dem Weg in die Stadt verloren, weiß aber nicht genau wo. Es soll jedenfalls in der Nähe des Stadttores sein. Wenn ich es finde, kann ich Waren von ihr kaufen, da sie dann wieder welche hat. Wahrscheinlich erklärt dieser Verlust auch ihre schlechte Laune...");
};
   
INSTANCE Info_Mod_Liselotte_Warenpaket (C_INFO)
{
	npc		= Mod_546_NONE_Liselotte_NW;
	nr		= 1;
	condition	= Info_Mod_Liselotte_Warenpaket_Condition;
	information	= Info_Mod_Liselotte_Warenpaket_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ist das deins? (Warenpaket geben)";
};

FUNC INT Info_Mod_Liselotte_Warenpaket_Condition()
{
	if (Npc_HasItems(hero, Packet_Lise) >= 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Liselotte_Trade1))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Liselotte_Warenpaket_Info()
{
	AI_Output(hero, self, "Info_Mod_Liselotte_Warenpaket_15_00"); //Ist das hier dein Warenpaket?

	B_GiveInvItems	(hero, self, Packet_Lise, 1);

	AI_Output(self, hero, "Info_Mod_Liselotte_Warenpaket_43_01"); //Ja, Danke.
	AI_Output(hero, self, "Info_Mod_Liselotte_Warenpaket_15_02"); //Ähm, bekomme ich jetzt eine Belohnung?
	AI_Output(self, hero, "Info_Mod_Liselotte_Warenpaket_43_03"); //OK. Ich gebe dir 50 Gold.

	B_GiveInvItems	(self, hero, ItMi_Gold, 50);

	AI_Output(self, hero, "Info_Mod_Liselotte_Warenpaket_43_04"); //Außerdem kannst du jetzt mit mir handeln.

	B_LogEntry	(TOPIC_MOD_LISELOTTESBEUTEL, "Ich habe Liselottes Warenpaket gefunden und zurückgegeben.");
	B_SetTopicStatus	(TOPIC_MOD_LISELOTTESBEUTEL, LOG_SUCCESS);

	B_GivePlayerXP (100);

	Npc_RemoveInvItems	(self, Packet_Lise, 1);

	B_Göttergefallen(2, 1);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Liselotte_Blutkelch (C_INFO)
{
	npc		= Mod_546_NONE_Liselotte_NW;
	nr		= 1;
	condition	= Info_Mod_Liselotte_Blutkelch_Condition;
	information	= Info_Mod_Liselotte_Blutkelch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo, schönes Kind!";
};

FUNC INT Info_Mod_Liselotte_Blutkelch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mustafa_PosWechsel))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Baltram_Blutkelch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Liselotte_Blutkelch_Info()
{
	AI_Output(hero, self, "Info_Mod_Liselotte_Blutkelch_15_00"); //Hallo, schönes Kind!
	AI_Output(self, hero, "Info_Mod_Liselotte_Blutkelch_43_01"); //Ah, der Schmeichler. Was darf's sein?
	AI_Output(hero, self, "Info_Mod_Liselotte_Blutkelch_15_02"); //Ich suche einen Kelch. Einen Blutkelch.
	AI_Output(self, hero, "Info_Mod_Liselotte_Blutkelch_43_03"); //Einen Kelch habe ich nicht. Schon gar keinen blutigen.
	AI_Output(hero, self, "Info_Mod_Liselotte_Blutkelch_15_04"); //Hätte ja sein können. Danke. Übrigens, was machst du nach Feierabend?
	AI_Output(self, hero, "Info_Mod_Liselotte_Blutkelch_43_05"); //Schlafen gehen. Was sonst?
	AI_Output(hero, self, "Info_Mod_Liselotte_Blutkelch_15_06"); //Nur so ...
};

INSTANCE Info_Mod_Liselotte_Pickpocket (C_INFO)
{
	npc		= Mod_546_NONE_Liselotte_NW;
	nr		= 1;
	condition	= Info_Mod_Liselotte_Pickpocket_Condition;
	information	= Info_Mod_Liselotte_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60_Female;
};

FUNC INT Info_Mod_Liselotte_Pickpocket_Condition()
{
	C_Beklauen	(58, ItMi_Gold, 19);
};

FUNC VOID Info_Mod_Liselotte_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Liselotte_Pickpocket);

	Info_AddChoice	(Info_Mod_Liselotte_Pickpocket, DIALOG_BACK, Info_Mod_Liselotte_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Liselotte_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Liselotte_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Liselotte_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Liselotte_Pickpocket);
};

FUNC VOID Info_Mod_Liselotte_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Liselotte_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Liselotte_Pickpocket);

		Info_AddChoice	(Info_Mod_Liselotte_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Liselotte_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Liselotte_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Liselotte_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Liselotte_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Liselotte_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Liselotte_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Liselotte_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Liselotte_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Liselotte_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Liselotte_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Liselotte_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Liselotte_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Liselotte_Trade (C_INFO)
{
	npc		= Mod_546_NONE_Liselotte_NW;
	nr		= 1;
	condition	= Info_Mod_Liselotte_Trade_Condition;
	information	= Info_Mod_Liselotte_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Liselotte_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Liselotte_Warenpaket))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Liselotte_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

instance Info_Mod_Liselotte_EXIT (C_INFO)
{
	npc		= Mod_546_NONE_Liselotte_NW;
	nr		= 999;
	condition	= Info_Mod_Liselotte_EXIT_Condition;
	information	= Info_Mod_Liselotte_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Liselotte_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Liselotte_EXIT_Info()
{
	AI_StopProcessInfos (self);
};