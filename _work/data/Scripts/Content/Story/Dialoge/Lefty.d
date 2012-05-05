INSTANCE Info_Mod_Lefty_Hi (C_INFO)
{
	npc		= Mod_1294_SLD_Lefty_MT;
	nr		= 1;
	condition	= Info_Mod_Lefty_Hi_Condition;
	information	= Info_Mod_Lefty_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lefty_Hi_Condition()
{
	if (hero.guild == GIL_MIL)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lefty_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Lefty_Hi_07_00"); //Hey, du musst neu im Lager sein.
	AI_Output(hero, self, "Info_Mod_Lefty_Hi_15_01"); //In gewisser Weise schon ...
	AI_Output(self, hero, "Info_Mod_Lefty_Hi_07_02"); //Wenn du es zu was bringen willst, musst du dich nützlich machen, zeigen, dass du was auf dem Kasten hast. Ich habe da schon eine Aufgabe für dich.
	AI_Output(hero, self, "Info_Mod_Lefty_Hi_15_03"); //Ja, worum geht es?
	AI_Output(self, hero, "Info_Mod_Lefty_Hi_07_04"); //Vor einiger Zeit kam so ein Typ zu uns ins Lager. Die Bauern haben den gegen uns aufgestachelt und er hat uns übel zugerichtet.
	AI_Output(self, hero, "Info_Mod_Lefty_Hi_07_05"); //Der hat mich so am Kopf erwischt ... ich kann mich jetzt kaum noch erinnern, wie sein Gesicht genau aussah.
	AI_Output(hero, self, "Info_Mod_Lefty_Hi_15_06"); //Soso, kommt mir irgendwie bekannt vor.
	AI_Output(self, hero, "Info_Mod_Lefty_Hi_07_07"); //Hey, der Typ war auch ... ähh ... über zwei Meter groß, sage ich dir, genau. Voll der Bär. Gegen den sah ein Ork aus, wie ein Knabe ...
	AI_Output(self, hero, "Info_Mod_Lefty_Hi_07_08"); //Ich habe zuletzt lange mit ihm gefochten, aber dann hat er mich doch noch erwischt.
	AI_Output(hero, self, "Info_Mod_Lefty_Hi_15_09"); //(belächelnd) Über zwei Meter? Klingt ja Furcht einflößend.
	AI_Output(self, hero, "Info_Mod_Lefty_Hi_07_10"); //Jedenfalls sind die Bauern seitdem sehr aufsässig. Jemand müsste ihnen mal wieder zeigen, wer das sagen hat.
	AI_Output(self, hero, "Info_Mod_Lefty_Hi_07_11"); //Das wäre die Gelegenheit für dich zu zeigen, dass du austeilen kannst.

	Info_ClearChoices	(Info_Mod_Lefty_Hi);

	Info_AddChoice	(Info_Mod_Lefty_Hi, "Was, wehrlose Bauern? Da musst du dir echt jemand anderen suchen.", Info_Mod_Lefty_Hi_B);
	Info_AddChoice	(Info_Mod_Lefty_Hi, "Klar, die paar Bauern haue ich im nu zusammen.", Info_Mod_Lefty_Hi_A);
};

FUNC VOID Info_Mod_Lefty_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Lefty_Hi_B_15_00"); //Was, wehrlose Bauern? Da musst du dir echt jemand anderen suchen.
	AI_Output(self, hero, "Info_Mod_Lefty_Hi_B_07_01"); //Flasche. Dann muss das halt jemand anders übernehmen.

	Mod_LeftysBauern = 1;
	
	Info_ClearChoices	(Info_Mod_Lefty_Hi);
};

FUNC VOID Info_Mod_Lefty_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Lefty_Hi_A_15_00"); //Klar, die paar Bauern haue ich im nu zusammen.
	AI_Output(self, hero, "Info_Mod_Lefty_Hi_A_07_01"); //Sehr gut. Verkloppe mindestens fünf Bauern ... und diesen Horatio solltest du dir auch auf jeden Fall vornehmen. Der scheint so eine Art Anführer von denen zu sein.

	Mod_LeftysBauern = 2;

	Log_CreateTopic	(TOPIC_MOD_SLD_LEFTYBAUERN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SLD_LEFTYBAUERN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SLD_LEFTYBAUERN, "Ich soll für Lefty fünf Bauern und Horatio verprügeln.");
	
	Info_ClearChoices	(Info_Mod_Lefty_Hi);
};

INSTANCE Info_Mod_Lefty_BauernVerbatscht (C_INFO)
{
	npc		= Mod_1294_SLD_Lefty_MT;
	nr		= 1;
	condition	= Info_Mod_Lefty_BauernVerbatscht_Condition;
	information	= Info_Mod_Lefty_BauernVerbatscht_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lefty_BauernVerbatscht_Condition()
{
	if (Mod_LeftysBauern == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lefty_BauernVerbatscht_Info()
{
	AI_Output(self, hero, "Info_Mod_Lefty_BauernVerbatscht_07_00"); //Ha, sehr gut, das wird den Bauern zeigen, wer hier das Sagen hat. Geh gleich zum Reislord, er wird dich dafür belohnen.
	AI_Output(self, hero, "Info_Mod_Lefty_BauernVerbatscht_07_01"); //Typen wie dich können wir hier im Lager gut gebrauchen.

	B_LogEntry	(TOPIC_MOD_SLD_LEFTYBAUERN, "Lefty war zufrieden. Ich soll mir beim Reislord meine Belohnung holen.");

	B_GivePlayerXP	(200);
};

INSTANCE Info_Mod_Lefty_RufusWeg (C_INFO)
{
	npc		= Mod_1294_SLD_Lefty_MT;
	nr		= 1;
	condition	= Info_Mod_Lefty_RufusWeg_Condition;
	information	= Info_Mod_Lefty_RufusWeg_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lefty_RufusWeg_Condition()
{
	if (Mod_LeftysBauern == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lefty_RufusWeg_Info()
{
	AI_Output(self, hero, "Info_Mod_Lefty_RufusWeg_07_00"); //Verdammt, dieser dumme Bauer Rufus hat die Kurve gekratzt. Der Reislord ist außer sich. So was bringt die anderen Bauern nur auf dumme Gedanken.
	AI_Output(self, hero, "Info_Mod_Lefty_RufusWeg_07_01"); //Wer den Flüchtenden wieder einfangen würde, bekäme bestimmt eine gute Belohnung.
	AI_Output(self, hero, "Info_Mod_Lefty_RufusWeg_07_02"); //(etwas stiller zu sich selbst) Obwohl der Reislord auch bestimmt nichts dagegen hätte, wenn man Rufus den Garaus machen würde.

	Log_CreateTopic	(TOPIC_MOD_SLD_RUFUS, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SLD_RUFUS, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SLD_RUFUS, "Der Bauer Rufus ist abgehauen. Wer ihn wieder zurückholen würde, könnte mit einer Belohnung beim Reislord rechnen.");
};

INSTANCE Info_Mod_Lefty_RufusDa (C_INFO)
{
	npc		= Mod_1294_SLD_Lefty_MT;
	nr		= 1;
	condition	= Info_Mod_Lefty_RufusDa_Condition;
	information	= Info_Mod_Lefty_RufusDa_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lefty_RufusDa_Condition()
{
	if (Mod_SLD_Rufus == 3)
	&& (!Npc_IsDead(Mod_1082_BAU_Rufus_MT))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lefty_RufusDa_Info()
{
	AI_Output(self, hero, "Info_Mod_Lefty_RufusDa_07_00"); //Du hast Rufus tatsächlich gefunden und zurückgebracht. Der kann jetzt was erleben ...

	if (hero.guild == GIL_MIL)
	{
		AI_Output(self, hero, "Info_Mod_Lefty_RufusDa_07_01"); //Egal, damit hast du wieder einige Punkte gesammelt. Geh gleich zum Reislord.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Lefty_RufusDa_07_02"); //Egal, damit hast du was gut. Geh gleich zum Reislord.
	};

	B_LogEntry	(TOPIC_MOD_SLD_RUFUS, "Ich soll jetzt zum Reislord gehen.");

	Mod_SLD_Rufus = 6;
};

INSTANCE Info_Mod_Lefty_RufusTot (C_INFO)
{
	npc		= Mod_1294_SLD_Lefty_MT;
	nr		= 1;
	condition	= Info_Mod_Lefty_RufusTot_Condition;
	information	= Info_Mod_Lefty_RufusTot_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lefty_RufusTot_Condition()
{
	if (Npc_IsDead(Mod_1082_BAU_Rufus_MT))
	&& (Npc_KnowsInfo(hero, Info_Mod_Lefty_RufusWeg))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lefty_RufusTot_Info()
{
	AI_Output(self, hero, "Info_Mod_Lefty_RufusTot_07_00"); //Du warst doch außerhalb des Lagers. Hast du zufällig Rufus gesehen?
	AI_Output(hero, self, "Info_Mod_Lefty_RufusTot_15_01"); //Ja. In seinem Blut.
	AI_Output(self, hero, "Info_Mod_Lefty_RufusTot_07_02"); //Du willst doch nicht damit sagen ...
	AI_Output(hero, self, "Info_Mod_Lefty_RufusTot_15_03"); //Doch.
	AI_Output(self, hero, "Info_Mod_Lefty_RufusTot_07_04"); //Geh zum Reislord. Das wird ihn interessieren.

	B_LogEntry	(TOPIC_MOD_SLD_RUFUS, "Ich soll zum Reislord und ihm von Rufus’ Schicksal berichten.");
};

INSTANCE Info_Mod_Lefty_OJGBoss (C_INFO)
{
	npc		= Mod_1294_SLD_Lefty_MT;
	nr		= 1;
	condition	= Info_Mod_Lefty_OJGBoss_Condition;
	information	= Info_Mod_Lefty_OJGBoss_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lefty_OJGBoss_Condition()
{
	if (Mod_LeeOJGBoss < Wld_GetDay()-3)
	&& (Npc_KnowsInfo(hero, Info_Mod_Lee_HabPfeife))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lefty_OJGBoss_Info()
{
	AI_Output(self, hero, "Info_Mod_Lefty_OJGBoss_07_00"); //(etwas ehrfürchtig) Hey, ähhm, du bist doch der neue Anführer der Orkjäger.
	AI_Output(hero, self, "Info_Mod_Lefty_OJGBoss_15_01"); //Ja, und weiter?
	AI_Output(self, hero, "Info_Mod_Lefty_OJGBoss_07_02"); //(verunsichert) Nichts, nichts ... nur ... der Reislord hat ein Geschenk für dich ... um dir, ähh, unseren Respekt zu zollen.
};

INSTANCE Info_Mod_Lefty_Pickpocket (C_INFO)
{
	npc		= Mod_1294_SLD_Lefty_MT;
	nr		= 1;
	condition	= Info_Mod_Lefty_Pickpocket_Condition;
	information	= Info_Mod_Lefty_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Lefty_Pickpocket_Condition()
{
	C_Beklauen	(53, ItFo_Water, 6);
};

FUNC VOID Info_Mod_Lefty_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Lefty_Pickpocket);

	Info_AddChoice	(Info_Mod_Lefty_Pickpocket, DIALOG_BACK, Info_Mod_Lefty_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Lefty_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Lefty_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Lefty_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Lefty_Pickpocket);
};

FUNC VOID Info_Mod_Lefty_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Lefty_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Lefty_Pickpocket);

		Info_AddChoice	(Info_Mod_Lefty_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Lefty_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Lefty_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Lefty_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Lefty_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Lefty_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Lefty_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Lefty_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Lefty_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Lefty_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Lefty_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Lefty_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Lefty_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Lefty_EXIT (C_INFO)
{
	npc		= Mod_1294_SLD_Lefty_MT;
	nr		= 1;
	condition	= Info_Mod_Lefty_EXIT_Condition;
	information	= Info_Mod_Lefty_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Lefty_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Lefty_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};