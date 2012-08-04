INSTANCE Info_Mod_Hedwig_Hi (C_INFO)
{
	npc		= Mod_7723_OUT_Hedwig_REL;
	nr		= 1;
	condition	= Info_Mod_Hedwig_Hi_Condition;
	information	= Info_Mod_Hedwig_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hedwig_Hi_Condition()
{
	if (Mod_Kneipe_Ditmar == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hedwig_Hi_Info()
{
	var c_npc Hedwig; Hedwig = Hlp_GetNpc(Mod_7723_OUT_Hedwig_REL);
	var c_npc Berta; Berta = Hlp_GetNpc(Mod_7724_OUT_Berta_REL);
	var c_npc Irmgard; Irmgard = Hlp_GetNpc(Mod_7725_OUT_Irmgard_REL);
	var c_npc Salmey; Salmey = Hlp_GetNpc(Mod_7726_OUT_Salmey_REL);

	TRIA_Invite(Berta);
	TRIA_Invite(Irmgard);
	TRIA_Invite(Salmey);

	TRIA_Start();

	AI_TurnToNpc	(Hedwig, hero);
	AI_TurnToNpc	(Berta, hero);
	AI_TurnToNpc	(Irmgard, hero);

	TRIA_Next(Hedwig);

	AI_Output(self, hero, "Info_Mod_Hedwig_Hi_26_00"); //(resolut) Hoch die Tassen! Äh, hoch die Humpen!

	CreateInvItems	(self, ItFo_Beer, 10);

	B_UseItem	(self, ItFo_Beer);

	TRIA_Next(Irmgard);

	CreateInvItems	(self, ItFo_Beer, 10);

	B_UseItem	(self, ItFo_Beer);

	TRIA_Next(Berta);

	CreateInvItems	(self, ItFo_Beer, 10);

	B_UseItem	(self, ItFo_Beer);

	AI_Output(self, hero, "Info_Mod_Hedwig_Hi_16_01"); //(hickst)

	TRIA_Next(Irmgard);

	AI_Output(self, hero, "Info_Mod_Hedwig_Hi_26_02"); //(vorwurfsvoll) Meinst du nicht auch, dass wir langsam mal genug getrunken haben?
	AI_Output(self, hero, "Info_Mod_Hedwig_Hi_26_03"); //Die arme Berta kann ja schon fast nicht mehr geradeaus gehen.

	TRIA_Next(Hedwig);

	AI_Output(self, hero, "Info_Mod_Hedwig_Hi_26_04"); //Darum geht's doch! Das ist der Sinn bei der ganzen Sache!

	TRIA_Next(Irmgard);

	AI_Output(self, hero, "Info_Mod_Hedwig_Hi_26_05"); //(zweifelnd) Na, ich weiß nicht.

	TRIA_Next(Berta);

	AI_Output(self, hero, "Info_Mod_Hedwig_Hi_16_01"); //(hickst)

	TRIA_Next(Hedwig);

	AI_TurnToNpc	(Hedwig, Salmey);

	AI_Output(self, hero, "Info_Mod_Hedwig_Hi_26_06"); //(betont männlich) He, Salmey, bring noch 'ne Runde!

	TRIA_Next(Salmey);

	AI_GotoNpc	(self, Hedwig);

	AI_GotoWP	(self, self.wp);

	TRIA_Next(Irmgard);

	B_UseItem	(self, ItFo_Beer);

	TRIA_Next(Berta);

	B_UseItem	(self, ItFo_Beer);

	TRIA_Next(Hedwig);

	B_UseItem	(self, ItFo_Beer);

	AI_Output(hero, self, "Info_Mod_Hedwig_Hi_15_07"); //Darf ich fragen, was das hier für ein Treffen ist?
	AI_Output(self, hero, "Info_Mod_Hedwig_Hi_26_08"); //Na klar doch. Wir besaufen uns, bis wir beinahe besinnungslos sind, torkeln lautstark nach Hause und kotzen vors Bett.

	TRIA_Next(Irmgard);

	AI_Output(self, hero, "Info_Mod_Hedwig_Hi_26_09"); //(pikiert) Ich werde mich nicht ins Haus übergeben!

	TRIA_Next(Hedwig);

	AI_Output(self, hero, "Info_Mod_Hedwig_Hi_26_10"); //Oh doch, das wirst du. Das ist dir in dem Moment so was von egal.

	TRIA_Next(Irmgard);

	AI_Output(self, hero, "Info_Mod_Hedwig_Hi_26_11"); //Na, ich weiß nicht.

	TRIA_Next(Hedwig);

	AI_Output(self, hero, "Info_Mod_Hedwig_Hi_26_12"); //Du musst es ja auch nicht wegwischen.
	AI_Output(self, hero, "Info_Mod_Hedwig_Hi_26_13"); //(eindringlich) Du wirst es nicht wegwischen, verstanden? Und du auch, Berta?

	TRIA_Next(Berta);

	AI_Output(self, hero, "Info_Mod_Hedwig_Hi_16_01"); //(hickst)

	TRIA_Next(Irmgard);

	AI_Output(self, hero, "Info_Mod_Hedwig_Hi_26_14"); //Aber wer dann?

	TRIA_Next(Hedwig);

	AI_Output(self, hero, "Info_Mod_Hedwig_Hi_26_15"); //(poltert) Zum Donnerwetter, das haben wir doch schon tausend Mal besprochen! Dein Mann macht diesmal den Dreck weg!

	TRIA_Next(Irmgard);

	AI_Output(self, hero, "Info_Mod_Hedwig_Hi_26_16"); //Na, ich weiß nicht.
	AI_Output(hero, self, "Info_Mod_Hedwig_Hi_15_17"); //Könnt ihr die Probleme mit euren Männern nicht anders lösen?

	TRIA_Next(Hedwig);

	AI_Output(self, hero, "Info_Mod_Hedwig_Hi_26_18"); //(streitlustig) Wir haben uns nun mal für diese Lösung entschieden.

	TRIA_Next(Irmgard);

	AI_Output(self, hero, "Info_Mod_Hedwig_Hi_26_19"); //(kleinlaut) Eigentlich hast du das entschieden.

	TRIA_Next(Hedwig);

	AI_Output(self, hero, "Info_Mod_Hedwig_Hi_26_20"); //(giftig) Na und? Hast du etwa protestiert?

	TRIA_Next(Berta);

	AI_Output(self, hero, "Info_Mod_Hedwig_Hi_16_21"); //(lallt) Is doch lustich hier. Wer trinkt noch einen mit?

	TRIA_Finish();

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_DITMAR_DICKELUFT, "Die drei sind wirklich hartnäckig. Wobei ... Hedwig scheint die Drahtzieherin zu sein und überzeugt, dass ihr Weg zum Erfolg führt. Mit Berta ist nicht mehr viel anzufangen. Aber Irmgard scheint die Sache langsam leid zu sein.");
};

INSTANCE Info_Mod_Hedwig_Kneipe (C_INFO)
{
	npc		= Mod_7723_OUT_Hedwig_REL;
	nr		= 1;
	condition	= Info_Mod_Hedwig_Kneipe_Condition;
	information	= Info_Mod_Hedwig_Kneipe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie lange habt ihr noch vor zu bleiben?";
};

FUNC INT Info_Mod_Hedwig_Kneipe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hedwig_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hedwig_Kneipe_Info()
{
	AI_Output(hero, self, "Info_Mod_Hedwig_Kneipe_15_00"); //Wie lange habt ihr noch vor zu bleiben?
	AI_Output(self, hero, "Info_Mod_Hedwig_Kneipe_26_01"); //Netter Versuch, aber du kannst Ditmar sagen, dass wir die Stellung halten.
	AI_Output(self, hero, "Info_Mod_Hedwig_Kneipe_26_02"); //Solange gewisse Herren der Schöpfung nicht zur Einsicht gelangen, ist unser Auftrag nicht beendet.
};

INSTANCE Info_Mod_Hedwig_Kneipe2 (C_INFO)
{
	npc		= Mod_7723_OUT_Hedwig_REL;
	nr		= 1;
	condition	= Info_Mod_Hedwig_Kneipe2_Condition;
	information	= Info_Mod_Hedwig_Kneipe2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer ist denn überhaupt dein Mann?";
};

FUNC INT Info_Mod_Hedwig_Kneipe2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hedwig_Kneipe))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hedwig_Kneipe2_Info()
{
	AI_Output(hero, self, "Info_Mod_Hedwig_Kneipe2_15_00"); //Wer ist denn überhaupt dein Mann?
	AI_Output(self, hero, "Info_Mod_Hedwig_Kneipe2_26_01"); //Na, du bist mir ja ein Spaßvogel! Kennst die Frau des Stadthalters nicht!
	AI_Output(hero, self, "Info_Mod_Hedwig_Kneipe2_15_02"); //Oh. Aber wieso hat Anselm dich ... wieso hast du Anselm ... (überlegt) Obwohl ...
};

INSTANCE Info_Mod_Hedwig_Kneipe3 (C_INFO)
{
	npc		= Mod_7723_OUT_Hedwig_REL;
	nr		= 1;
	condition	= Info_Mod_Hedwig_Kneipe3_Condition;
	information	= Info_Mod_Hedwig_Kneipe3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wieso redest du nicht einfach mit Anselm?";
};

FUNC INT Info_Mod_Hedwig_Kneipe3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hedwig_Kneipe2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hedwig_Kneipe3_Info()
{
	AI_Output(hero, self, "Info_Mod_Hedwig_Kneipe3_15_00"); //Wieso redest du nicht einfach mit Anselm?
	AI_Output(self, hero, "Info_Mod_Hedwig_Kneipe3_26_01"); //Das bringt nichts. Der soll jetzt mal am eigenen Leib spüren, wie es ist, nicht den ganzen Tag bemuttert zu werden.
};

INSTANCE Info_Mod_Hedwig_Pickpocket (C_INFO)
{
	npc		= Mod_7723_OUT_Hedwig_REL;
	nr		= 1;
	condition	= Info_Mod_Hedwig_Pickpocket_Condition;
	information	= Info_Mod_Hedwig_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60_Female;
};

FUNC INT Info_Mod_Hedwig_Pickpocket_Condition()
{
	C_Beklauen	(52, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_Hedwig_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Hedwig_Pickpocket);

	Info_AddChoice	(Info_Mod_Hedwig_Pickpocket, DIALOG_BACK, Info_Mod_Hedwig_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Hedwig_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Hedwig_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Hedwig_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Hedwig_Pickpocket);
};

FUNC VOID Info_Mod_Hedwig_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Hedwig_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Hedwig_Pickpocket);

		Info_AddChoice	(Info_Mod_Hedwig_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Hedwig_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Hedwig_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Hedwig_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Hedwig_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Hedwig_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Hedwig_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Hedwig_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Hedwig_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Hedwig_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Hedwig_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Hedwig_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Hedwig_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Hedwig_EXIT (C_INFO)
{
	npc		= Mod_7723_OUT_Hedwig_REL;
	nr		= 1;
	condition	= Info_Mod_Hedwig_EXIT_Condition;
	information	= Info_Mod_Hedwig_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Hedwig_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hedwig_EXIT_Info()
{
	AI_Output(self, hero, "Info_Mod_Hedwig_EXIT_26_00"); //Wir sehen uns ... hoffentlich.

	AI_StopProcessInfos	(self);
};