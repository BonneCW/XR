INSTANCE Info_Mod_Baldur_Hi (C_INFO)
{
	npc		= Mod_7431_JG_Baldur_MT;
	nr		= 1;
	condition	= Info_Mod_Baldur_Hi_Condition;
	information	= Info_Mod_Baldur_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo! Wie kann man dich nennen?";
};

FUNC INT Info_Mod_Baldur_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Baldur_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Baldur_Hi_15_00"); //Hallo! Wie kann man dich nennen?
	AI_Output(self, hero, "Info_Mod_Baldur_Hi_08_01"); //Ich bin Baldur, Jäger im Dienste der Druiden und Waldläufer.
	AI_Output(hero, self, "Info_Mod_Baldur_Hi_15_02"); //Waldläufer? Druiden? Was ...
	AI_Output(self, hero, "Info_Mod_Baldur_Hi_08_03"); //Waldläufer sind eigentlich auch Jäger, aber sie haben sich zum Teil auf Nahkampf festgelegt.
	AI_Output(hero, self, "Info_Mod_Baldur_Hi_15_04"); //Und die Druiden?
	AI_Output(self, hero, "Info_Mod_Baldur_Hi_08_05"); //Das sind die Oberhäupter der Waldläufer. Und auch aller Jäger.
	AI_Output(self, hero, "Info_Mod_Baldur_Hi_08_06"); //Weise Männer, die sich auch in Heilkunde und Magie auskennen.
	AI_Output(self, hero, "Info_Mod_Baldur_Hi_08_07"); //Sie jagen nicht und kämpfen selten, sind naturverbunden und beten zu Adanos.
	AI_Output(hero, self, "Info_Mod_Baldur_Hi_15_08"); //Interessant! Danke für deine Auskunft.
};

INSTANCE Info_Mod_Baldur_CyrcoMine (C_INFO)
{
	npc		= Mod_7431_JG_Baldur_MT;
	nr		= 1;
	condition	= Info_Mod_Baldur_CyrcoMine_Condition;
	information	= Info_Mod_Baldur_CyrcoMine_Info;
	permanent	= 0;
	important	= 0;
	description	= "He Baldur! Du warst doch vorhin beim Kampf dabei.";
};

FUNC INT Info_Mod_Baldur_CyrcoMine_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cyrco_BaalOrun))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Baldur_CyrcoMine_Info()
{
	AI_Output(hero, self, "Info_Mod_Baldur_CyrcoMine_15_00"); //He Baldur! Du warst doch vorhin beim Kampf dabei.
	AI_Output(self, hero, "Info_Mod_Baldur_CyrcoMine_08_01"); //Das will  ich meinen! Diese Bande haben wir aber aufgemischt!
	AI_Output(hero, self, "Info_Mod_Baldur_CyrcoMine_15_02"); //Hast du Lust auf eine zweite Runde? Hab noch 'ne Mission.
	AI_Output(self, hero, "Info_Mod_Baldur_CyrcoMine_08_03"); //Ne, lass mal. Hab mich am Arm verletzt. Besser nicht.
};

INSTANCE Info_Mod_Baldur_Felle (C_INFO)
{
	npc		= Mod_7431_JG_Baldur_MT;
	nr		= 1;
	condition	= Info_Mod_Baldur_Felle_Condition;
	information	= Info_Mod_Baldur_Felle_Info;
	permanent	= 0;
	important	= 0;
	description	= "Der Alchemist braucht frische Felle.";
};

FUNC INT Info_Mod_Baldur_Felle_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wulfgar_Felle3))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Baldur_Felle_Info()
{
	AI_Output(hero, self, "Info_Mod_Baldur_Felle_15_00"); //Der Alchemist braucht frische Felle.
	AI_Output(self, hero, "Info_Mod_Baldur_Felle_08_01"); //Da liegt ein Haufen. Bedien dich.
	AI_Output(hero, self, "Info_Mod_Baldur_Felle_15_02"); //Ich nehm mal 10 Stück.
	AI_Output(self, hero, "Info_Mod_Baldur_Felle_08_03"); //Nur zu. Brauch ich sie nicht runterschleppen.

	AI_GotoWP	(hero, "WP_JL_14");

	AI_PlayAni	(hero, "T_PLUNDER");

	CreateInvItems	(hero, ItAt_Wolffur, 5);
	CreateInvItems	(hero, ItAt_WargFur, 5);

	B_ShowGivenThings	("5 Wolf- und Wargfelle erhalten");
};

INSTANCE Info_Mod_Baldur_AlterMann (C_INFO)
{
	npc		= Mod_7431_JG_Baldur_MT;
	nr		= 1;
	condition	= Info_Mod_Baldur_AlterMann_Condition;
	information	= Info_Mod_Baldur_AlterMann_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wegen altem Mann im Wald fragen.";
};

FUNC INT Info_Mod_Baldur_AlterMann_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Morgahard_AlterWaldMann))
	&& (Mod_BDT_AlterWaldMann < 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Baldur_AlterMann_Info()
{
	if (Mod_BDT_AlterWaldMann == 0)
	{
		B_Say	(hero, self, "$ALTERWALDMANN01");

		AI_Output(self, hero, "Info_Mod_Baldur_AlterMann_08_00"); //Ahh, du meinst den alten Mann des Waldes. Ja, etwas weiß ich über ihn.
		AI_Output(self, hero, "Info_Mod_Baldur_AlterMann_08_01"); //Er soll Jahrhunderte alt sein und die Tiere des Waldes Rund um Khorata behüten.
		AI_Output(self, hero, "Info_Mod_Baldur_AlterMann_08_02"); //Zwar sagt man, er sei blind, jedoch gleichzeitig auch magisch begabt.
		AI_Output(self, hero, "Info_Mod_Baldur_AlterMann_08_03"); //Mehr fällt mir gerade nicht ein. Vielleicht weiß ein anderer mehr.

		B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "Von dem ersten Waldläufer erfuhr ich nicht viel Neues. Der alte Mann des Waldes, behütet die Tiere, er ist uralt, blind und magisch begabt. Vielleicht weiß ein anderer Waldläufer mehr.");
	}
	else if (Mod_BDT_AlterWaldMann == 1)
	{
		B_Say	(hero, self, "$ALTERWALDMANN02");

		AI_Output(self, hero, "Info_Mod_Baldur_AlterMann_08_04"); //Der alte Mann des Waldes? Ja, ich hörte er solle einst ein Diener Adanos gewesen sein.
		AI_Output(self, hero, "Info_Mod_Baldur_AlterMann_08_05"); //Wobei unklar ist, ob er ein Waldläufer war wie wir, ein Magier des Wassers, oder ein Verwandlungsmagier.
		AI_Output(self, hero, "Info_Mod_Baldur_AlterMann_08_06"); //Seine magischen Fähigkeiten, wie auch seine starke Bindung zur Tier- und Pflanzenwelt zeugen davon, dass er von allem etwas hat.

		B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "Beim 2ten Waldläufer erfuhr ich auch nicht viel wissenswertes. Der alte Mann des Waldes soll Adanos und der Schöpfung verbunden sein, allem voran der Tier und Pflanzenwelt.");
	}
	else if (Mod_BDT_AlterWaldMann == 2)
	{
		B_Say	(hero, self, "$ALTERWALDMANN03");

		AI_Output(self, hero, "Info_Mod_Baldur_AlterMann_08_07"); //Tja, viel kann ich dir nicht über ihn verraten.
		AI_Output(self, hero, "Info_Mod_Baldur_AlterMann_08_08"); //Das Problem besteht auch darin, dass er mit keinem Menschen spricht, nicht mal mit uns, auch, wenn wir eigentlich ähnliche Ziele verfolgen.
		AI_Output(self, hero, "Info_Mod_Baldur_AlterMann_08_09"); //Allein mit den Tieren des Waldes unterhält er sich.
		AI_Output(self, hero, "Info_Mod_Baldur_AlterMann_08_10"); //Tja, wenn ich ein Keiler wäre, könnte ich dir bestimmt mehr über ihn verraten.

		B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "Acha, das könnte ein wichtiger Hinweis gewesen sein. Der alte Mann des Waldes meidet Menschen gänzlich, spricht nur mit Tieren.");
	}
	else if (Mod_BDT_AlterWaldMann == 3)
	{
		B_Say	(hero, self, "$ALTERWALDMANN04");

		AI_Output(self, hero, "Info_Mod_Baldur_AlterMann_08_11"); //Der alte Mann des Waldes? Nun, er soll in enger Beziehung zur Tier- und Pflanzenwelt stehen.
		AI_Output(self, hero, "Info_Mod_Baldur_AlterMann_08_12"); //Man sagt, er leite Rudeltiere wie Keiler, oder Wölfe dazu an, den Wald gegen Eindringlinge zu beschützen.
		AI_Output(self, hero, "Info_Mod_Baldur_AlterMann_08_13"); //Selbst, so sagt man, fände man ihn häufig in Gestalt eines grünen Wolfes vor.

		B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "Er soll vor allem auch größere Rudeltiere wie Keiler und Wölfe dazu anleiten den Wald gegen Eindringlinge zu beschützen.");
	}
	else if (Mod_BDT_AlterWaldMann == 4)
	{
		B_Say	(hero, self, "$ALTERWALDMANN05");

		AI_Output(self, hero, "Info_Mod_Baldur_AlterMann_08_14"); //Du interessierst dich für Geschichten über den alten Mann des Waldes?
		AI_Output(self, hero, "Info_Mod_Baldur_AlterMann_08_15"); //Nun, viel weiß ich nicht über diesen mystischen Kauz.
		AI_Output(self, hero, "Info_Mod_Baldur_AlterMann_08_16"); //Er soll sich meistens im dunklen Wald aufhalten, aber auch immer in der Nähe von Gewässern, wie Seen.
		AI_Output(self, hero, "Info_Mod_Baldur_AlterMann_08_17"); //Selten hat ihn jemand zu Gesicht bekommen ...

		B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "Man findet ihn höchst wahrscheinlich im dichten Wald Khorata’s in der Nähe eines Sees.");
	};

	Mod_BDT_AlterWaldMann += 1;
};

INSTANCE Info_Mod_Baldur_Pickpocket (C_INFO)
{
	npc		= Mod_7431_JG_Baldur_MT;
	nr		= 1;
	condition	= Info_Mod_Baldur_Pickpocket_Condition;
	information	= Info_Mod_Baldur_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Baldur_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Baldur_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Baldur_Pickpocket);

	Info_AddChoice	(Info_Mod_Baldur_Pickpocket, DIALOG_BACK, Info_Mod_Baldur_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Baldur_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Baldur_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Baldur_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Baldur_Pickpocket);
};

FUNC VOID Info_Mod_Baldur_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Baldur_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Baldur_Pickpocket);

		Info_AddChoice	(Info_Mod_Baldur_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Baldur_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Baldur_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Baldur_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Baldur_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Baldur_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Baldur_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Baldur_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Baldur_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Baldur_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Baldur_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Baldur_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Baldur_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Baldur_EXIT (C_INFO)
{
	npc		= Mod_7431_JG_Baldur_MT;
	nr		= 1;
	condition	= Info_Mod_Baldur_EXIT_Condition;
	information	= Info_Mod_Baldur_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Baldur_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Baldur_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};