INSTANCE Info_Mod_Zelar_Hi (C_INFO)
{
	npc		= Mod_7433_JG_Zelar_MT;
	nr		= 1;
	condition	= Info_Mod_Zelar_Hi_Condition;
	information	= Info_Mod_Zelar_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Zelar_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Zelar_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Zelar_Hi_03_00"); //Bist du ein Neuer?
	AI_Output(hero, self, "Info_Mod_Zelar_Hi_15_01"); //Vielleicht. Und du bist ein Waldläufer?
	AI_Output(self, hero, "Info_Mod_Zelar_Hi_03_02"); //Ja. Wie du an meiner schönen Rüstung sehen kannst.
	AI_Output(hero, self, "Info_Mod_Zelar_Hi_15_03"); //Meine ist auch nicht ohne. Aber was machst du hier?
	AI_Output(self, hero, "Info_Mod_Zelar_Hi_03_04"); //Ich schiebe Wache, wie die Jäger hier und der Waldläufer am Tor.
	AI_Output(hero, self, "Info_Mod_Zelar_Hi_15_05"); //Ist das nötig?
	AI_Output(self, hero, "Info_Mod_Zelar_Hi_03_06"); //Was glaubst du? In letzter Zeit streift allerlei Gesindel durch das Tal.
	AI_Output(self, hero, "Info_Mod_Zelar_Hi_03_07"); //Außerdem, hast du schon mal ein Lager ohne Torwache gesehen?
	AI_Output(hero, self, "Info_Mod_Zelar_Hi_15_08"); //Eigentlich nicht. Ich will dann mal weiter.
};

INSTANCE Info_Mod_Zelar_CyrcoMine (C_INFO)
{
	npc		= Mod_7433_JG_Zelar_MT;
	nr		= 1;
	condition	= Info_Mod_Zelar_CyrcoMine_Condition;
	information	= Info_Mod_Zelar_CyrcoMine_Info;
	permanent	= 0;
	important	= 0;
	description	= "Tag, Waldläufer. Du siehst so aufgeräumt aus. Interesse an einem Auslug?";
};

FUNC INT Info_Mod_Zelar_CyrcoMine_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cyrco_BaalOrun))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Zelar_CyrcoMine_Info()
{
	AI_Output(hero, self, "Info_Mod_Zelar_CyrcoMine_15_00"); //Tag, Waldläufer. Du siehst so aufgeräumt aus. Interesse an einem Ausflug?
	AI_Output(self, hero, "Info_Mod_Zelar_CyrcoMine_03_01"); //Gerne. Hier steht man sich nur die Beine in den Bauch.
	AI_Output(hero, self, "Info_Mod_Zelar_CyrcoMine_15_02"); //Wir marschieren zur Alten Mine, da gibt's was auszuräuchern.
	AI_Output(self, hero, "Info_Mod_Zelar_CyrcoMine_03_03"); //Prima. Hast du vielleicht 'nen Stängel für mich? Wenn wir grad dabei sind ...
	AI_Output(hero, self, "Info_Mod_Zelar_CyrcoMine_15_04"); //Nach der Arbeit bekommst du zehn Stück. Versprochen.
	AI_Output(self, hero, "Info_Mod_Zelar_CyrcoMine_03_05"); //Wenn das nix ist! Wann geht's los?
	AI_Output(hero, self, "Info_Mod_Zelar_CyrcoMine_15_06"); //Ich sag Bescheid.

	if (Npc_KnowsInfo(hero, Info_Mod_Sonor_CyrcoMine))
	{
		B_LogEntry	(TOPIC_MOD_JG_GARDISTEN, "So, ich habe alles beisammen. Ausrüstung und zwei Mann. Sonor und Zelar werden mitgehen. Noch mal bei Cyrco vorbeischauen ...");
	};
};

INSTANCE Info_Mod_Zelar_AlterMann (C_INFO)
{
	npc		= Mod_7433_JG_Zelar_MT;
	nr		= 1;
	condition	= Info_Mod_Zelar_AlterMann_Condition;
	information	= Info_Mod_Zelar_AlterMann_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wegen altem Mann im Wald fragen.";
};

FUNC INT Info_Mod_Zelar_AlterMann_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Morgahard_AlterWaldMann))
	&& (Mod_BDT_AlterWaldMann < 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Zelar_AlterMann_Info()
{
	if (Mod_BDT_AlterWaldMann == 0)
	{
		B_Say	(hero, self, "$ALTERWALDMANN01");

		AI_Output(self, hero, "Info_Mod_Zelar_AlterMann_03_00"); //Ahh, du meinst den alten Mann des Waldes. Ja, etwas weiß ich über ihn.
		AI_Output(self, hero, "Info_Mod_Zelar_AlterMann_03_01"); //Er soll Jahrhunderte alt sein und die Tiere des Waldes Rund um Khorata behüten.
		AI_Output(self, hero, "Info_Mod_Zelar_AlterMann_03_02"); //Zwar sagt man, er sei blind, jedoch gleichzeitig auch magisch begabt.
		AI_Output(self, hero, "Info_Mod_Zelar_AlterMann_03_03"); //Mehr fällt mir gerade nicht ein. Vielleicht weiß ein anderer mehr.

		B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "Von dem ersten Waldläufer erfuhr ich nicht viel Neues. Der alte Mann des Waldes, behütet die Tiere, er ist uralt, blind und magisch begabt. Vielleicht weiß ein anderer Waldläufer mehr.");
	}
	else if (Mod_BDT_AlterWaldMann == 1)
	{
		B_Say	(hero, self, "$ALTERWALDMANN02");

		AI_Output(self, hero, "Info_Mod_Zelar_AlterMann_03_04"); //Der alte Mann des Waldes? Ja, ich hörte er solle einst ein Diener Adanos gewesen sein.
		AI_Output(self, hero, "Info_Mod_Zelar_AlterMann_03_05"); //Wobei unklar ist, ob er ein Waldläufer war wie wir, ein Magier des Wassers, oder ein Verwandlungsmagier.
		AI_Output(self, hero, "Info_Mod_Zelar_AlterMann_03_06"); //Seine magischen Fähigkeiten, wie auch seine starke Bindung zur Tier- und Pflanzenwelt zeugen davon, dass er von allem etwas hat.

		B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "Beim 2ten Waldläufer erfuhr ich auch nicht viel wissenswertes. Der alte Mann des Waldes soll Adanos und der Schöpfung verbunden sein, allem voran der Tier und Pflanzenwelt.");
	}
	else if (Mod_BDT_AlterWaldMann == 2)
	{
		B_Say	(hero, self, "$ALTERWALDMANN03");

		AI_Output(self, hero, "Info_Mod_Zelar_AlterMann_03_07"); //Tja, viel kann ich dir nicht über ihn verraten.
		AI_Output(self, hero, "Info_Mod_Zelar_AlterMann_03_08"); //Das Problem besteht auch darin, dass er mit keinem Menschen spricht, nicht mal mit uns, auch, wenn wir eigentlich ähnliche Ziele verfolgen.
		AI_Output(self, hero, "Info_Mod_Zelar_AlterMann_03_09"); //Allein mit den Tieren des Waldes unterhält er sich.
		AI_Output(self, hero, "Info_Mod_Zelar_AlterMann_03_10"); //Tja, wenn ich ein Keiler wäre, könnte ich dir bestimmt mehr über ihn verraten.

		B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "Acha, das könnte ein wichtiger Hinweis gewesen sein. Der alte Mann des Waldes meidet Menschen gänzlich, spricht nur mit Tieren.");
	}
	else if (Mod_BDT_AlterWaldMann == 3)
	{
		B_Say	(hero, self, "$ALTERWALDMANN04");

		AI_Output(self, hero, "Info_Mod_Zelar_AlterMann_03_11"); //Der alte Mann des Waldes? Nun, er soll in enger Beziehung zur Tier- und Pflanzenwelt stehen.
		AI_Output(self, hero, "Info_Mod_Zelar_AlterMann_03_12"); //Man sagt, er leite Rudeltiere wie Keiler, oder Wölfe dazu an, den Wald gegen Eindringlinge zu beschützen.
		AI_Output(self, hero, "Info_Mod_Zelar_AlterMann_03_13"); //Selbst, so sagt man, fände man ihn häufig in Gestalt eines grünen Wolfes vor.

		B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "Er soll vor allem auch größere Rudeltiere wie Keiler und Wölfe dazu anleiten den Wald gegen Eindringlinge zu beschützen.");
	}
	else if (Mod_BDT_AlterWaldMann == 4)
	{
		B_Say	(hero, self, "$ALTERWALDMANN05");

		AI_Output(self, hero, "Info_Mod_Zelar_AlterMann_03_14"); //Du interessierst dich für Geschichten über den alten Mann des Waldes?
		AI_Output(self, hero, "Info_Mod_Zelar_AlterMann_03_15"); //Nun, viel weiß ich nicht über diesen mystischen Kauz.
		AI_Output(self, hero, "Info_Mod_Zelar_AlterMann_03_16"); //Er soll sich meistens im dunklen Wald aufhalten, aber auch immer in der Nähe von Gewässern, wie Seen.
		AI_Output(self, hero, "Info_Mod_Zelar_AlterMann_03_17"); //Selten hat ihn jemand zu Gesicht bekommen ...

		B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "Man findet ihn höchst wahrscheinlich im dichten Wald Khorata’s in der Nähe eines Sees.");
	};

	Mod_BDT_AlterWaldMann += 1;
};

INSTANCE Info_Mod_Zelar_Urs (C_INFO)
{
	npc		= Mod_7433_JG_Zelar_MT;
	nr		= 1;
	condition	= Info_Mod_Zelar_Urs_Condition;
	information	= Info_Mod_Zelar_Urs_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo, ich bringe euch die magischen Pfeile von Urs.";
};

FUNC INT Info_Mod_Zelar_Urs_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Urs_Hi))
	&& (Npc_HasItems(hero, ItMi_PfeilpaketZelar) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Zelar_Urs_Info()
{
	AI_Output(hero, self, "Info_Mod_Zelar_Urs_15_00"); //Hallo, ich bringe euch die magischen Pfeile von Urs.

	B_GiveInvItems	(hero, self, ItMi_PfeilpaketZelar, 1);

	AI_Output(self, hero, "Info_Mod_Zelar_Urs_03_01"); //Das trifft sich gut. Gerade treiben sich diese aufdringlichen Irrlichter wieder gefährlich nahe vor unserem Lager herum.
	AI_Output(self, hero, "Info_Mod_Zelar_Urs_03_02"); //Ob Mensch, oder Tier, sie greifen alles an, was geht und steht.
	AI_Output(self, hero, "Info_Mod_Zelar_Urs_03_03"); //Wenn die Pfeile ihre Wirkung erzielen, sollst du deine Felle erhalten.
	AI_Output(self, hero, "Info_Mod_Zelar_Urs_03_04"); //Komm mit.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "IRRLICHTER");

	self.aivar[AIV_Partymember] = TRUE;

	Wld_InsertNpc	(Wisp_Zelar_01,	"PATH_TO_CLIFF_02B");
	Wld_InsertNpc	(Wisp_Zelar_02,	"PATH_TO_CLIFF_02B");
	Wld_InsertNpc	(Wisp_Zelar_03,	"PATH_TO_CLIFF_02B");
};

INSTANCE Info_Mod_Zelar_Urs2 (C_INFO)
{
	npc		= Mod_7433_JG_Zelar_MT;
	nr		= 1;
	condition	= Info_Mod_Zelar_Urs2_Condition;
	information	= Info_Mod_Zelar_Urs2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Zelar_Urs2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Zelar_Urs))
	&& (Npc_IsDead(Wisp_Zelar_01))
	&& (Npc_IsDead(Wisp_Zelar_02))
	&& (Npc_IsDead(Wisp_Zelar_03))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Zelar_Urs2_Info()
{
	AI_Output(self, hero, "Info_Mod_Zelar_Urs2_03_00"); //So, diese Plagegeister wären erledigt. Die Pfeile sind jedes Fell Wert. Hier, und hab dank.

	CreateInvItems	(hero, ItAt_WargFur, 2);
	CreateInvItems	(hero, ItAt_ShadowFur, 2);
	CreateInvItems	(hero, ItAt_TrollFur, 1);

	B_ShowGivenThings	("2 Wargfelle, 2 SChattenläuferfelle und 1 Trollfell erhalten");

	B_GivePlayerXP	(300);

	B_LogEntry	(TOPIC_MOD_URS_HUND, "Ich habe die Felle von Zelar.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");

	self.aivar[AIV_Partymember] = FALSE;
};

INSTANCE Info_Mod_Zelar_Heiltrank (C_INFO)
{
	npc		= Mod_7433_JG_Zelar_MT;
	nr		= 1;
	condition	= Info_Mod_Zelar_Heiltrank_Condition;
	information	= Info_Mod_Zelar_Heiltrank_Info;
	permanent	= 1;
	important	= 0;
	description	= "(Heiltrank geben)";
};

FUNC INT Info_Mod_Zelar_Heiltrank_Condition()
{
	if (self.aivar[AIV_Partymember] == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Zelar_Heiltrank_Info()
{
	Info_ClearChoices	(Info_Mod_Zelar_Heiltrank);

	Info_AddChoice	(Info_Mod_Zelar_Heiltrank, DIALOG_BACK, Info_Mod_Zelar_Heiltrank_BACK);

	if (Npc_HasItems(hero, ItPo_Health_Addon_04) >= 1)
	{
		Info_AddChoice	(Info_Mod_Zelar_Heiltrank, "Essenz der Heilung", Info_Mod_Zelar_Heiltrank_Health_04);
	};
	if (Npc_HasItems(hero, ItPo_Health_01) >= 1)
	{
		Info_AddChoice	(Info_Mod_Zelar_Heiltrank, "Elixier der Heilung", Info_Mod_Zelar_Heiltrank_Health_03);
	};
	if (Npc_HasItems(hero, ItPo_Health_02) >= 1)
	{
		Info_AddChoice	(Info_Mod_Zelar_Heiltrank, "Extrakt der Heilung", Info_Mod_Zelar_Heiltrank_Health_02);
	};
	if (Npc_HasItems(hero, ItPo_Health_01) >= 1)
	{
		Info_AddChoice	(Info_Mod_Zelar_Heiltrank, "Essenz der Heilung", Info_Mod_Zelar_Heiltrank_Health_01);
	};
	if (Npc_HasItems(hero, ItPo_Health_07) >= 1)
	{
		Info_AddChoice	(Info_Mod_Zelar_Heiltrank, "Trank der leichten Heilung", Info_Mod_Zelar_Heiltrank_Health_07);
	};
	if (Npc_HasItems(hero, ItPo_Health_06) >= 1)
	{
		Info_AddChoice	(Info_Mod_Zelar_Heiltrank, "Leichter Heiltrank", Info_Mod_Zelar_Heiltrank_Health_06);
	};
	if (Npc_HasItems(hero, ItPo_Health_05) >= 1)
	{
		Info_AddChoice	(Info_Mod_Zelar_Heiltrank, "Trank der schnellen Heilung", Info_Mod_Zelar_Heiltrank_Health_05);
	};
};

FUNC VOID Info_Mod_Zelar_Heiltrank_BACK ()
{
	Info_ClearChoices	(Info_Mod_Zelar_Heiltrank);
};

FUNC VOID Info_Mod_Zelar_Heiltrank_Health_04 ()
{
	Info_ClearChoices	(Info_Mod_Zelar_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_Addon_04, 1);

	B_UseItem	(self, ItPo_Health_Addon_04);
};

FUNC VOID Info_Mod_Zelar_Heiltrank_Health_03 ()
{
	Info_ClearChoices	(Info_Mod_Zelar_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_03, 1);

	B_UseItem	(self, ItPo_Health_03);
};

FUNC VOID Info_Mod_Zelar_Heiltrank_Health_02 ()
{
	Info_ClearChoices	(Info_Mod_Zelar_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_02, 1);

	B_UseItem	(self, ItPo_Health_02);
};

FUNC VOID Info_Mod_Zelar_Heiltrank_Health_01 ()
{
	Info_ClearChoices	(Info_Mod_Zelar_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_01, 1);

	B_UseItem	(self, ItPo_Health_01);
};

FUNC VOID Info_Mod_Zelar_Heiltrank_Health_07 ()
{
	Info_ClearChoices	(Info_Mod_Zelar_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_07, 1);

	B_UseItem	(self, ItPo_Health_07);
};

FUNC VOID Info_Mod_Zelar_Heiltrank_Health_06 ()
{
	Info_ClearChoices	(Info_Mod_Zelar_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_06, 1);

	B_UseItem	(self, ItPo_Health_06);
};

FUNC VOID Info_Mod_Zelar_Heiltrank_Health_05 ()
{
	Info_ClearChoices	(Info_Mod_Zelar_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_05, 1);

	B_UseItem	(self, ItPo_Health_05);
};

INSTANCE Info_Mod_Zelar_Pickpocket (C_INFO)
{
	npc		= Mod_7433_JG_Zelar_MT;
	nr		= 1;
	condition	= Info_Mod_Zelar_Pickpocket_Condition;
	information	= Info_Mod_Zelar_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Zelar_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Zelar_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Zelar_Pickpocket);

	Info_AddChoice	(Info_Mod_Zelar_Pickpocket, DIALOG_BACK, Info_Mod_Zelar_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Zelar_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Zelar_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Zelar_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Zelar_Pickpocket);
};

FUNC VOID Info_Mod_Zelar_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Zelar_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Zelar_Pickpocket);

		Info_AddChoice	(Info_Mod_Zelar_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Zelar_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Zelar_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Zelar_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Zelar_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Zelar_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Zelar_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Zelar_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Zelar_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Zelar_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Zelar_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Zelar_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Zelar_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Zelar_EXIT (C_INFO)
{
	npc		= Mod_7433_JG_Zelar_MT;
	nr		= 1;
	condition	= Info_Mod_Zelar_EXIT_Condition;
	information	= Info_Mod_Zelar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Zelar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Zelar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};