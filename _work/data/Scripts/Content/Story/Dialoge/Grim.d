INSTANCE Info_Mod_Grim_Hi (C_INFO)
{
	npc		= Mod_1426_BUD_Grim_MT;
	nr		= 1;
	condition	= Info_Mod_Grim_Hi_Condition;
	information	= Info_Mod_Grim_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du siehst ja ganz müde aus.";
};

FUNC INT Info_Mod_Grim_Hi_Condition()
{
	if (Wld_IsTime(05,00,22,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Grim_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Grim_Hi_15_00"); //Du siehst ja ganz müde aus.
	AI_Output(self, hero, "Info_Mod_Grim_Hi_06_01"); //Ach ja, da sind diese Alpträume... Irgendwann machen sie mich noch irre!
};

INSTANCE Info_Mod_Grim_WieGehts (C_INFO)
{
	npc		= Mod_1426_BUD_Grim_MT;
	nr		= 1;
	condition	= Info_Mod_Grim_WieGehts_Condition;
	information	= Info_Mod_Grim_WieGehts_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie ist es dir seit dem Fall der Barriere ergangen?";
};

FUNC INT Info_Mod_Grim_WieGehts_Condition()
{
	if (Wld_IsTime(05,00,22,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Grim_WieGehts_Info()
{
	AI_Output(hero, self, "Info_Mod_Grim_WieGehts_15_00"); //Wie ist es dir seit dem Fall der Barriere ergangen?
	AI_Output(self, hero, "Info_Mod_Grim_WieGehts_06_01"); //Ist einiges passiert seitdem. Anfangs war es noch ganz lustig, ohne Anführer und so.
	AI_Output(self, hero, "Info_Mod_Grim_WieGehts_06_02"); //Aber seitdem Thorus Gomez' Position eingenommen hat, kann man sich einfach nichts mehr leisten. Wurde ziemlich langweilig hier.
	AI_Output(self, hero, "Info_Mod_Grim_WieGehts_06_03"); //Und dann haben diese Alpträume angefangen ...
};

INSTANCE Info_Mod_Grim_Alptraeume (C_INFO)
{
	npc		= Mod_1426_BUD_Grim_MT;
	nr		= 1;
	condition	= Info_Mod_Grim_Alptraeume_Condition;
	information	= Info_Mod_Grim_Alptraeume_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was für Alpträume?";
};

FUNC INT Info_Mod_Grim_Alptraeume_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Grim_Hi))
	|| (Npc_KnowsInfo(hero, Info_Mod_Grim_WieGehts))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Grim_Alptraeume_Info()
{
	AI_Output(hero, self, "Info_Mod_Grim_Alptraeume_15_00"); //Was für Alpträume?
	AI_Output(self, hero, "Info_Mod_Grim_Alptraeume_06_01"); //Sie sind wie diese Dinger, die die Gurus im Sumpf hatten, wie Visionen.
	AI_Output(self, hero, "Info_Mod_Grim_Alptraeume_06_02"); //Nach dem Aufwachen kann ich mich nur noch ganz verschwommen erinnern.
	AI_Output(self, hero, "Info_Mod_Grim_Alptraeume_06_03"); //Es hat etwas mit Orks zu tun. Sie werden mich sicher töten!
};

INSTANCE Info_Mod_Grim_Nacht (C_INFO)
{
	npc		= Mod_1426_BUD_Grim_MT;
	nr		= 1;
	condition	= Info_Mod_Grim_Nacht_Condition;
	information	= Info_Mod_Grim_Nacht_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was machst du hier?";
};

FUNC INT Info_Mod_Grim_Nacht_Condition()
{
	if (Wld_IsTime(22,00,05,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Grim_Nacht_Info()
{
	AI_Output(hero, self, "Info_Mod_Grim_Nacht_15_00"); //Was machst du hier?
	AI_Output(self, hero, "Info_Mod_Grim_Nacht_06_01"); //Ach, ich ... ich vertrete mir ein wenig die Beine. Sonst kriege ich immer diese Alpträume. Ja, genau.
};

INSTANCE Info_Mod_Grim_Lagermusik (C_INFO)
{
	npc		= Mod_1426_BUD_Grim_MT;
	nr		= 1;
	condition	= Info_Mod_Grim_Lagermusik_Condition;
	information	= Info_Mod_Grim_Lagermusik_Info;
	permanent	= 0;
	important	= 0;
	description	= "Gravo will eine Musikgruppe gründen. Interesse?";
};

FUNC INT Info_Mod_Grim_Lagermusik_Condition()
{
	if (Mod_Gravo_Schatz == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Grim_Lagermusik_Info()
{
	AI_Output(hero, self, "Info_Mod_Grim_Lagermusik_15_00"); //Gravo will eine Musikgruppe gründen. Interesse?
	AI_Output(self, hero, "Info_Mod_Grim_Lagermusik_06_01"); //(nervös) Wieso fragst du das?

	Info_ClearChoices	(Info_Mod_Grim_Lagermusik);

	Info_AddChoice	(Info_Mod_Grim_Lagermusik, "Vielleicht kannst du ihn ja unterstützen.", Info_Mod_Grim_Lagermusik_B);
	Info_AddChoice	(Info_Mod_Grim_Lagermusik, "Ich will dir Angst einjagen.", Info_Mod_Grim_Lagermusik_A);
};

FUNC VOID Info_Mod_Grim_Lagermusik_B()
{
	AI_Output(hero, self, "Info_Mod_Grim_Lagermusik_B_15_00"); //Vielleicht kannst du ihn ja unterstützen.
	AI_Output(self, hero, "Info_Mod_Grim_Lagermusik_B_06_01"); //(abweisend) Nein, das glaube ich nicht. Muss eh nachdenken.

	Info_ClearChoices	(Info_Mod_Grim_Lagermusik);
};

FUNC VOID Info_Mod_Grim_Lagermusik_A()
{
	AI_Output(hero, self, "Info_Mod_Grim_Lagermusik_A_15_00"); //Ich will dir Angst einjagen.
	AI_Output(self, hero, "Info_Mod_Grim_Lagermusik_A_06_01"); //D-das ist dir aber nicht g-g-gelungen!

	Info_ClearChoices	(Info_Mod_Grim_Lagermusik);
};

INSTANCE Info_Mod_Grim_Pickpocket (C_INFO)
{
	npc		= Mod_1426_BUD_Grim_MT;
	nr		= 1;
	condition	= Info_Mod_Grim_Pickpocket_Condition;
	information	= Info_Mod_Grim_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Grim_Pickpocket_Condition()
{
	C_Beklauen	(52, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_Grim_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Grim_Pickpocket);

	Info_AddChoice	(Info_Mod_Grim_Pickpocket, DIALOG_BACK, Info_Mod_Grim_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Grim_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Grim_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Grim_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Grim_Pickpocket);
};

FUNC VOID Info_Mod_Grim_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Grim_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Grim_Pickpocket);

		Info_AddChoice	(Info_Mod_Grim_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Grim_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Grim_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Grim_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Grim_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Grim_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Grim_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Grim_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Grim_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Grim_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Grim_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Grim_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Grim_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Grim_EXIT (C_INFO)
{
	npc		= Mod_1426_BUD_Grim_MT;
	nr		= 1;
	condition	= Info_Mod_Grim_EXIT_Condition;
	information	= Info_Mod_Grim_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Grim_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Grim_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};