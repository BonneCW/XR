INSTANCE Info_Mod_Fisk_Hi (C_INFO)
{
	npc		= Mod_950_STT_Fisk_MT;
	nr		= 1;
	condition	= Info_Mod_Fisk_Hi_Condition;
	information	= Info_Mod_Fisk_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Fisk_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fisk_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Fisk_Hi_12_00"); //Hey, ich kann dir was verkaufen. Ich hab einige Waffen auf Lager.
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_OLDCAMP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_OLDCAMP, "Fisk verkauft Waffen.");
};

INSTANCE Info_Mod_Fisk_Dieb (C_INFO)
{
	npc		= Mod_950_STT_Fisk_MT;
	nr		= 1;
	condition	= Info_Mod_Fisk_Dieb_Condition;
	information	= Info_Mod_Fisk_Dieb_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe gehört, dass du mit 'heißer Ware' handelst ...";
};

FUNC INT Info_Mod_Fisk_Dieb_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_Dieb))
	&& (Mod_PDV_Genug_Infos >= 2)
	&& (Mod_PDV_Fisk_Infos == 0)
	&& (Npc_KnowsInfo(hero, Info_Mod_Fisk_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fisk_Dieb_Info()
{
	AI_Output(hero, self, "Info_Mod_Fisk_Dieb_15_00"); //Ich habe gehört, dass du mit "heißer Ware" handelst, und ich würde dir vorschlagen, du verrätst mir, ob darunter das Zeug ist, dass den Erzbaronen gestohlen wurde.
	AI_Output(self, hero, "Info_Mod_Fisk_Dieb_12_01"); //(erschrocken) Hey, ich kann nichts dafür, er kam zu mir und er wollte, dass ich das Zeug für seinen Kontaktmann aufbewahre. Er hat gedroht mich umzubringen.
	AI_Output(hero, self, "Info_Mod_Fisk_Dieb_15_02"); //Wer ist er? Kannst du mir wenigsten Beweise gegen ihn liefern?
	AI_Output(self, hero, "Info_Mod_Fisk_Dieb_12_03"); //Ok, versichere mir, dass ich sicher vor ihm bin, dann gebe ich dir einen Beweis gegen ihn.

	Mod_PDV_Fisk_Infos = 1;
};

INSTANCE Info_Mod_Fisk_Frage (C_INFO)
{
	npc		= Mod_950_STT_Fisk_MT;
	nr		= 1;
	condition	= Info_Mod_Fisk_Frage_Condition;
	information	= Info_Mod_Fisk_Frage_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hätte Interesse ...";
};

FUNC INT Info_Mod_Fisk_Frage_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_Dieb))
	&& (Mod_PDV_Genug_Infos >= 2)
	&& (Mod_PDV_Fisk_Infos == 0)
	&& (Npc_KnowsInfo(hero, Info_Mod_Fisk_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fisk_Frage_Info()
{
	AI_Output(hero, self, "Info_Mod_Fisk_Frage_15_00"); //Ich hätte Interesse an dem Zeug der Erzbarone und ich habe gehört, dass du etwas davon verkaufst.
	AI_Output(self, hero, "Info_Mod_Fisk_Frage_12_01"); //(erschrocken) Was, woher weißt du das? Nein, davon kann ich nichts verkaufen, vergiss bitte schnell, dass ich das Zeug habe.
	AI_Output(hero, self, "Info_Mod_Fisk_Frage_15_02"); //Hör zu, ich bin im Auftrag von Thorus unterwegs und ich muss wissen, was hier vorgeht.
	AI_Output(self, hero, "Info_Mod_Fisk_Frage_12_03"); //Ok, versichere mir, dass ich sicher vor ihm bin, dann gebe ich dir einen Beweis gegen ihn.

	Mod_PDV_Fisk_Infos = 1;
};

INSTANCE Info_Mod_Fisk_Hilfe (C_INFO)
{
	npc		= Mod_950_STT_Fisk_MT;
	nr		= 1;
	condition	= Info_Mod_Fisk_Hilfe_Condition;
	information	= Info_Mod_Fisk_Hilfe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Gut, wenn du mir sagst, was ich machen soll.";
};

FUNC INT Info_Mod_Fisk_Hilfe_Condition()
{
	if (Mod_PDV_Fisk_Infos == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fisk_Hilfe_Info()
{
	AI_Output(hero, self, "Info_Mod_Fisk_Hilfe_15_00"); //Gut, wenn du mir sagst, was ich machen soll.
	AI_Output(self, hero, "Info_Mod_Fisk_Hilfe_12_01"); //Nun gut, sie stehlen das Zeug immer um 2 Uhr und bringen es es dann zu meinem Laden. Um die Zeit erwarten sie, dass ich anwesend bin.
	AI_Output(self, hero, "Info_Mod_Fisk_Hilfe_12_02"); //Lege dich um die Zeit auf die Lauer im Haus der Erzbarone.
	AI_Output(hero, self, "Info_Mod_Fisk_Hilfe_15_03"); //Gut.

	Mod_PDV_Fisk_Infos = 2;

	B_LogEntry	(TOPIC_MOD_PDV, "Ich habe bei Fisk gefragt, ob er mir genaueres sagen kann. Er meinte, wenn ich sie bei Thorus melde, verschafft er mir einen Beweis. Außerdem sagte er, ich sollte mich um 2 Uhr im Haus der Erzbarone auf die Lauer legen.");

	B_StartOtherRoutine	(Mod_943_GRD_Bloodwyn_MT, "DIEB");
	B_StartOtherRoutine	(Mod_1110_GRD_Cutter_MT, "DIEB");
};

INSTANCE Info_Mod_Fisk_Zettel (C_INFO)
{
	npc		= Mod_950_STT_Fisk_MT;
	nr		= 1;
	condition	= Info_Mod_Fisk_Zettel_Condition;
	information	= Info_Mod_Fisk_Zettel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bloodwyn und Cutter wurden gefangen, was ist jetzt mit dem Beweis?";
};

FUNC INT Info_Mod_Fisk_Zettel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorus_Diebe))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fisk_Zettel_Info()
{
	AI_Output(hero, self, "Info_Mod_Fisk_Zettel_15_00"); //Bloodwyn und Cutter wurden gefangen, was ist jetzt mit dem Beweis?
	AI_Output(self, hero, "Info_Mod_Fisk_Zettel_12_01"); //Hier, diese Schrift war bei jeder Lieferung dabei.

	CreateInvItems	(self, ItWr_FisksNotiz, 1);
	B_GiveInvItems	(self, hero, ItWr_FisksNotiz, 1);

	B_LogEntry	(TOPIC_MOD_PDV, "Fisk gab mir ein Schriftstück. Das dürfte als Beweis genügen.");
};

INSTANCE Info_Mod_Fisk_SLDSpy (C_INFO)
{
	npc		= Mod_950_STT_Fisk_MT;
	nr		= 1;
	condition	= Info_Mod_Fisk_SLDSpy_Condition;
	information	= Info_Mod_Fisk_SLDSpy_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo, was gibt es Neues im Lager?";
};

FUNC INT Info_Mod_Fisk_SLDSpy_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fisk_Hi))
	&& (Mod_SLD_STT_Mordrag == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Lee_GotoSylvio))
	&& (Mod_SLD_Spy == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fisk_SLDSpy_Info()
{
	AI_Output(hero, self, "Info_Mod_Fisk_SLDSpy_15_00"); //Hallo, was gibt es Neues im Lager?
	AI_Output(self, hero, "Info_Mod_Fisk_SLDSpy_12_01"); //Da fragst du noch ...
	AI_Output(hero, self, "Info_Mod_Fisk_SLDSpy_15_02"); //(Erwartungsvoll) Ja?!
	AI_Output(self, hero, "Info_Mod_Fisk_SLDSpy_12_03"); //Meine Waren. Beste und neuste Qualität, für einen Schnäppchenpreis zu haben.
	AI_Output(hero, self, "Info_Mod_Fisk_SLDSpy_15_04"); //Ähh, und andere Neuigkeiten?
	AI_Output(self, hero, "Info_Mod_Fisk_SLDSpy_12_05"); //Jetzt weiß ich, was du meinst ...
	AI_Output(hero, self, "Info_Mod_Fisk_SLDSpy_15_06"); //Ich höre.
	AI_Output(self, hero, "Info_Mod_Fisk_SLDSpy_12_07"); //Die Sache mit den Ratten im Eintopf der Erzbarone. Das war vielleicht ein Spaß. Zu Gomez’ Zeiten hätte man die beiden Köche gevierteilt oder gerädert.
	AI_Output(hero, self, "Info_Mod_Fisk_SLDSpy_15_08"); //Hmm ...
	AI_Output(self, hero, "Info_Mod_Fisk_SLDSpy_12_09"); //Oder ja, der Mord, den Cutter beobachtet hat. Scheint was Wichtiges gewesen zu sein. Mehr fällt mir im Moment nicht ein.

	B_LogEntry	(TOPIC_MOD_SLD_SPY, "Cutter hat einen wichtigen Mord beobachtet, wie ich von Fisk erfahren habe.");
};

INSTANCE Info_Mod_Fisk_CutterBad (C_INFO)
{
	npc		= Mod_950_STT_Fisk_MT;
	nr		= 1;
	condition	= Info_Mod_Fisk_CutterBad_Condition;
	information	= Info_Mod_Fisk_CutterBad_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hey, du hast mir ja erzählt, dass Cutter einen Mord beobachtet hätte.";
};

FUNC INT Info_Mod_Fisk_CutterBad_Condition()
{
	if (Mod_SLD_Spy == 5)
	&& (Mob_HasItems("CUTTERSTRUHE", ItMw_BloodySword) == 1)
	&& (Mob_HasItems("CUTTERSTRUHE", ItWr_SentenzaForCutter) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fisk_CutterBad_Info()
{
	AI_Output(hero, self, "Info_Mod_Fisk_CutterBad_15_00"); //Hey, du hast mir ja erzählt, dass Cutter einen Mord beobachtet hätte.
	AI_Output(self, hero, "Info_Mod_Fisk_CutterBad_12_01"); //Ja und?
	AI_Output(hero, self, "Info_Mod_Fisk_CutterBad_15_02"); //Also Cutter hat sich ja ziemlich merkwürdig in letzter Zeit benommen. Habe ihn nachts durch das Lager schleichen sehen mit einem Haufen Krempel, als ob er die Sachen verstecken wollte, was zu verbergen hätte. Womöglich ... ne das wäre abwegig ...
	AI_Output(self, hero, "Info_Mod_Fisk_CutterBad_12_03"); //Ja sag schon, was meinst du?
	AI_Output(hero, self, "Info_Mod_Fisk_CutterBad_15_04"); //Na ja, ich habe mich gefragt, ob er womöglich nicht selbst was mit dem Mord zu tun haben könnte.
	AI_Output(self, hero, "Info_Mod_Fisk_CutterBad_12_05"); //Das ist eine gefährliche Unterstellung… . (zu sich selbst) Hmm, aber wenn vielleicht doch was dran ist? Muss unbedingt einige Gardisten darauf ansprechen.

	Mod_SLD_Spy = 6;

	B_LogEntry	(TOPIC_MOD_SLD_SPY, "So, das wäre erledigt. Jetzt sollten die Gardisten bald in Cutter’s Truhe schauen.");
};

INSTANCE Info_Mod_Fisk_WoherWaren (C_INFO)
{
	npc		= Mod_950_STT_Fisk_MT;
	nr		= 1;
	condition	= Info_Mod_Fisk_WoherWaren_Condition;
	information	= Info_Mod_Fisk_WoherWaren_Info;
	permanent	= 0;
	important	= 0;
	description	= "Woher bekommst du deine Ware in diesen trüben Zeiten?";
};

FUNC INT Info_Mod_Fisk_WoherWaren_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fisk_WoherWaren_Info()
{
	AI_Output(hero, self, "Info_Mod_Fisk_WoherWaren_15_00"); //Woher bekommst du deine Ware in diesen trüben Zeiten?
	AI_Output(self, hero, "Info_Mod_Fisk_WoherWaren_12_01"); //An Waffen zu kommen ist jetzt wirklich nicht so das Problem. Tüchtige Schmiede haben wir genug.
	AI_Output(self, hero, "Info_Mod_Fisk_WoherWaren_12_02"); //Allerdings will den ganzen Krempel gerade keiner. Was soll man schon mit schartigem Eisen, wenn man eigentlich was zwischen die Zähne braucht?
	AI_Output(hero, self, "Info_Mod_Fisk_WoherWaren_15_03"); //Wieso bist du dann noch hier?
	AI_Output(self, hero, "Info_Mod_Fisk_WoherWaren_12_04"); //Das frag ich mich auch schon lange ...
};

INSTANCE Info_Mod_Fisk_Trade (C_INFO)
{
	npc		= Mod_950_STT_Fisk_MT;
	nr		= 1;
	condition	= Info_Mod_Fisk_Trade_Condition;
	information	= Info_Mod_Fisk_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Fisk_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fisk_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fisk_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Fisk_Pickpocket (C_INFO)
{
	npc		= Mod_950_STT_Fisk_MT;
	nr		= 1;
	condition	= Info_Mod_Fisk_Pickpocket_Condition;
	information	= Info_Mod_Fisk_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Fisk_Pickpocket_Condition()
{
	C_Beklauen	(59, ItMi_Gold, 195);
};

FUNC VOID Info_Mod_Fisk_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Fisk_Pickpocket);

	Info_AddChoice	(Info_Mod_Fisk_Pickpocket, DIALOG_BACK, Info_Mod_Fisk_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Fisk_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Fisk_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Fisk_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Fisk_Pickpocket);
};

FUNC VOID Info_Mod_Fisk_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Fisk_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Fisk_Pickpocket);

		Info_AddChoice	(Info_Mod_Fisk_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Fisk_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Fisk_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Fisk_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Fisk_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Fisk_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Fisk_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Fisk_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Fisk_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Fisk_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Fisk_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Fisk_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Fisk_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Fisk_EXIT (C_INFO)
{
	npc		= Mod_950_STT_Fisk_MT;
	nr		= 1;
	condition	= Info_Mod_Fisk_EXIT_Condition;
	information	= Info_Mod_Fisk_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Fisk_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fisk_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};