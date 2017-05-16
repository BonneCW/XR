INSTANCE Info_Mod_Nimius_Hi (C_INFO)
{
	npc		= Mod_1054_VLK_Nimius_NW;
	nr		= 1;
	condition	= Info_Mod_Nimius_Hi_Condition;
	information	= Info_Mod_Nimius_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Nimius_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Nimius_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Nimius_Hi_01_01"); //Ich bin Nimius.
};

INSTANCE Info_Mod_Nimius_Wilfried (C_INFO)
{
	npc		= Mod_1054_VLK_Nimius_NW;
	nr		= 1;
	condition	= Info_Mod_Nimius_Wilfried_Condition;
	information	= Info_Mod_Nimius_Wilfried_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du dich daran erinnern ...";
};

FUNC INT Info_Mod_Nimius_Wilfried_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thilo_Wilfried))
	&& (Mod_WilfriedsQuest == 2)
	&& (Npc_KnowsInfo(hero, Info_Mod_Nimius_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Nimius_Wilfried_Info()
{
	AI_Output(hero, self, "Info_Mod_Nimius_Wilfried_15_00"); //Kannst du dich daran erinnern, jemals schlechte Erfahrungen mit Wilfried gemacht zu haben?
	AI_Output(self, hero, "Info_Mod_Nimius_Wilfried_01_01"); //(überrascht) Ja! Dass mich nach so langer Zeit noch jemand darauf ansprechen würde ... Ich hatte es schon beinahe vergessen.
	AI_Output(hero, self, "Info_Mod_Nimius_Wilfried_15_02"); //Was ist damals passiert?
	AI_Output(self, hero, "Info_Mod_Nimius_Wilfried_01_03"); //Er hat mich um mein Gold betrogen, indem er mir einen Billiggürtel angedreht hat, der einem Assassinengürtel aus Mora Sul, den ich bestellt hatte, stark ähnelte.
	AI_Output(hero, self, "Info_Mod_Nimius_Wilfried_15_04"); //Woher weißt du das? Hast du Beweise?
	AI_Output(self, hero, "Info_Mod_Nimius_Wilfried_01_05"); //Naja, immerhin stand dort in kleiner Schrift "Made in Myrtana" eingebrannt. Ich glaube nicht, dass dieser Schriftzug auf einem Original gestanden hätte.
	AI_Output(hero, self, "Info_Mod_Nimius_Wilfried_15_06"); //Wieso hast du nichts unternommen?
	AI_Output(self, hero, "Info_Mod_Nimius_Wilfried_01_07"); //Als ich ihn darauf ansprach, hat Wilfried mir durch versteckte Gesten zu erkennen gegeben, dass es meiner Gesundheit abträglich sein würde, wenn ich ihn anschwärzte.
	AI_Output(self, hero, "Info_Mod_Nimius_Wilfried_01_08"); //Und so habe ich Gras über die Sache wachsen lassen. Ich weiß nicht, was du mit meiner Information willst, aber ich wäre dir sehr verbunden, wenn du meinen Namen aus dem Spiel lassen könntest.
	AI_Output(hero, self, "Info_Mod_Nimius_Wilfried_15_09"); //Ja, das kenne ich schon. Danke für dein Vertrauen.

	if (Npc_KnowsInfo(hero, Info_Mod_Joerg_Wilfried))
	{
		Mod_WilfriedsQuest = 3;

		B_LogEntry	(TOPIC_MOD_WILFRIED_GOLD, "Ich habe noch zwei weitere Personen gefunden, die überzeugt sind, dass Wilfried unfairen Handel treibt. Allerdings fehlen noch immer die handfesten Beweise...");

		B_StartOtherRoutine	(Mod_544_NONE_Wilfried_NW, "HOEHLE");
		AI_Teleport	(Mod_544_NONE_Wilfried_NW, "TAVERNE");
	};
};

INSTANCE Info_Mod_Nimius_WilfriedTot (C_INFO)
{
	npc		= Mod_1054_VLK_Nimius_NW;
	nr		= 1;
	condition	= Info_Mod_Nimius_WilfriedTot_Condition;
	information	= Info_Mod_Nimius_WilfriedTot_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Nimius_WilfriedTot_Condition()
{
	if (Mod_WilfriedsQuest == 8)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Nimius_WilfriedTot_Info()
{
	AI_Output(self, hero, "Info_Mod_Nimius_WilfriedTot_01_00"); //Wilfried ist tot? Das hast du gut gemacht.

	B_GiveInvItems	(self, hero, ItMi_Gold, 50);
};

INSTANCE Info_Mod_Nimius_Sumpfkraut (C_INFO)
{
	npc		= Mod_1054_VLK_Nimius_NW;
	nr		= 1;
	condition	= Info_Mod_Nimius_Sumpfkraut_Condition;
	information	= Info_Mod_Nimius_Sumpfkraut_Info;
	permanent	= 0;
	important	= 0;
	description	= "Weißt du, woher ich hier Sumpfkraut bekommen kann?";
};

FUNC INT Info_Mod_Nimius_Sumpfkraut_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Moe_Sumpfkraut))
	&& (Npc_KnowsInfo(hero, Info_Mod_Nimius_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Nimius_Sumpfkraut_Info()
{
	AI_Output(hero, self, "Info_Mod_Nimius_Sumpfkraut_15_00"); //Weißt du, woher ich hier Sumpfkraut bekommen kann?
	AI_Output(self, hero, "Info_Mod_Nimius_Sumpfkraut_01_01"); //Nein, mit solchem Zeug hab ich nichts am Hut.
};

INSTANCE Info_Mod_Nimius_Flugblaetter (C_INFO)
{
	npc		= Mod_1054_VLK_Nimius_NW;
	nr		= 1;
	condition	= Info_Mod_Nimius_Flugblaetter_Condition;
	information	= Info_Mod_Nimius_Flugblaetter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab hier ein Flugblatt für dich.";
};

FUNC INT Info_Mod_Nimius_Flugblaetter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Auftrag_2))
	&& (Npc_HasItems(hero, MatteoFlugblaetter) >= 1)
	&& (Mod_Flugblaetter < 20)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Matteo_Flugblaetter))
	&& (Npc_KnowsInfo(hero, Info_Mod_Nimius_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Nimius_Flugblaetter_Info()
{
	B_Say (hero, self, "$MATTEOPAPER");

	B_GiveInvItems	(hero, self, MatteoFlugblaetter, 1);

	AI_Output(self, hero, "Info_Mod_Nimius_Flugblaetter_01_01"); //Oh, danke. Mal sehen ...

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Nimius_Flugblaetter_01_02"); //Ah ja. Vielleicht werd ich mal bei Matteo vorbeischauen.

	Mod_Flugblaetter += 1;
};

INSTANCE Info_Mod_Nimius_Pickpocket (C_INFO)
{
	npc		= Mod_1054_VLK_Nimius_NW;
	nr		= 1;
	condition	= Info_Mod_Nimius_Pickpocket_Condition;
	information	= Info_Mod_Nimius_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_30;
};

FUNC INT Info_Mod_Nimius_Pickpocket_Condition()
{
	C_Beklauen	(10, ItMi_Gold, 10);
};

FUNC VOID Info_Mod_Nimius_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Nimius_Pickpocket);

	Info_AddChoice	(Info_Mod_Nimius_Pickpocket, DIALOG_BACK, Info_Mod_Nimius_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Nimius_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Nimius_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Nimius_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Nimius_Pickpocket);
};

FUNC VOID Info_Mod_Nimius_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Nimius_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Nimius_Pickpocket);

		Info_AddChoice	(Info_Mod_Nimius_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Nimius_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Nimius_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Nimius_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Nimius_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Nimius_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Nimius_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Nimius_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Nimius_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Nimius_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Nimius_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Nimius_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Nimius_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Nimius_EXIT (C_INFO)
{
	npc		= Mod_1054_VLK_Nimius_NW;
	nr		= 1;
	condition	= Info_Mod_Nimius_EXIT_Condition;
	information	= Info_Mod_Nimius_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Nimius_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Nimius_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};