INSTANCE Info_Mod_Balor_Hi (C_INFO)
{
	npc		= Mod_3001_PSINOV_Balor_MT;
	nr		= 1;
	condition	= Info_Mod_Balor_Hi_Condition;
	information	= Info_Mod_Balor_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Balor_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Balor_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Balor_Hi_01_01"); //Ich bin Balor, Novize der Bruderschaft. Meine Aufgabe ist es hier im Sumpf Sumpfkraut zu sammeln.
	AI_Output(self, hero, "Info_Mod_Balor_Hi_01_02"); //Das wird dann im Lager zu Stengeln verarbeitet und dann rauchen wir es oder verkaufen es weiter.
};

INSTANCE Info_Mod_Balor_Dünger (C_INFO)
{
	npc		= Mod_3001_PSINOV_Balor_MT;
	nr		= 1;
	condition	= Info_Mod_Balor_Dünger_Condition;
	information	= Info_Mod_Balor_Dünger_Info;
	permanent	= 0;
	important	= 0;
	description	= "Baal Namib schickt mich.";
};

FUNC INT Info_Mod_Balor_Dünger_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Namib_WarBeiLester))
	&& (Npc_HasItems(hero, ItMi_DuengerPaket) == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Balor_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Balor_Dünger_Info()
{
	AI_Output(hero, self, "Info_Mod_Balor_Dünger_15_00"); //Baal Namib schickt mich, ich soll dir dieses Paket bringen.
	AI_Output(self, hero, "Info_Mod_Balor_Dünger_01_01"); //Ah, endlich. Der Dünger ist gekommen. Verteile ihn doch bitte auf dem Feld.
	AI_Output(hero, self, "Info_Mod_Balor_Dünger_15_02"); //Ich soll es auf dem Feld verteilen?
	AI_Output(self, hero, "Info_Mod_Balor_Dünger_01_03"); //Ja. Hier nimm diese Spitzhacke.

	CreateInvItems	(self, ItMw_2H_Axe_L_01, 1);
	B_GiveInvItems	(self, hero, ItMw_2H_Axe_L_01, 1);

	AI_Output(self, hero, "Info_Mod_Balor_Dünger_01_04"); //Ich habe den Ort, an dem du düngen musst, mit einem roten X gekennzeichnet. Grab einfach dort und dünge dann.

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Balor will, dass ich den Dünger auf dem Feld verteile. Er hat die Stelle mit einem roten X gekennzeichnet.");

	Wld_SendTrigger	("EVT_MT_DUENGER");
};

INSTANCE Info_Mod_Balor_DüngerVerteilt (C_INFO)
{
	npc		= Mod_3001_PSINOV_Balor_MT;
	nr		= 1;
	condition	= Info_Mod_Balor_DüngerVerteilt_Condition;
	information	= Info_Mod_Balor_DüngerVerteilt_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab den Dünger verteilt.";
};

FUNC INT Info_Mod_Balor_DüngerVerteilt_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Balor_Dünger))
	&& (Npc_HasItems(hero, ItMi_DuengerPaket) == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Balor_DüngerVerteilt_Info()
{
	AI_Output(hero, self, "Info_Mod_Balor_DüngerVerteilt_15_00"); //Ich hab den Dünger verteilt.
	AI_Output(self, hero, "Info_Mod_Balor_DüngerVerteilt_01_01"); //Gut, dann wird das Sumpfkraut nur so sprießen.
	AI_Output(self, hero, "Info_Mod_Balor_DüngerVerteilt_01_02"); //Hier hast du ein paar Stängel.

	CreateInvItems	(self, ItMi_Joint, 6);
	B_GiveInvItems	(self, hero, ItMi_Joint, 5);

	AI_Output(self, hero, "Info_Mod_Balor_DüngerVerteilt_01_04"); //Ich zieh mir auch erst mal einen rein.

	B_UseItem	(self, ItMi_Joint);

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Ich hab den Dünger verteilt und mit Balor gesprochen. Jetzt sollte ich wieder zu Baal Namib gehen.");

	B_GivePlayerXP	(50);

	Wld_SendTrigger	("EVT_MT_DUENGER");
};

INSTANCE Info_Mod_Balor_Woher (C_INFO)
{
	npc		= Mod_3001_PSINOV_Balor_MT;
	nr		= 1;
	condition	= Info_Mod_Balor_Woher_Condition;
	information	= Info_Mod_Balor_Woher_Info;
	permanent	= 1;
	important	= 0;
	description	= "Wieso bist du hier im Sumpflager?";
};

FUNC INT Info_Mod_Balor_Woher_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Balor_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Balor_Woher_Info()
{
	AI_Output(hero, self, "Info_Mod_Balor_Woher_15_00"); //Wieso bist du hier im Sumpflager?
	AI_Output(self, hero, "Info_Mod_Balor_Woher_01_01"); //Nachdem man mich bei einem Raubzug in Khorinis erwischt hat, haben sie mich in die Kolonie geworfen.
	AI_Output(self, hero, "Info_Mod_Balor_Woher_01_02"); //Das Sumpflager erschien mir als das sicherste und angenehmste Lager, deswegen bin ich hierher gekommen.
};

INSTANCE Info_Mod_Balor_Pickpocket (C_INFO)
{
	npc		= Mod_3001_PSINOV_Balor_MT;
	nr		= 1;
	condition	= Info_Mod_Balor_Pickpocket_Condition;
	information	= Info_Mod_Balor_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20;
};

FUNC INT Info_Mod_Balor_Pickpocket_Condition()
{
	C_Beklauen	(15, ItMi_Gold, 20);
};

FUNC VOID Info_Mod_Balor_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Balor_Pickpocket);

	Info_AddChoice	(Info_Mod_Balor_Pickpocket, DIALOG_BACK, Info_Mod_Balor_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Balor_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Balor_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Balor_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Balor_Pickpocket);
};

FUNC VOID Info_Mod_Balor_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Balor_Pickpocket);
};

INSTANCE Info_Mod_Balor_EXIT (C_INFO)
{
	npc		= Mod_3001_PSINOV_Balor_MT;
	nr		= 1;
	condition	= Info_Mod_Balor_EXIT_Condition;
	information	= Info_Mod_Balor_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Balor_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Balor_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};