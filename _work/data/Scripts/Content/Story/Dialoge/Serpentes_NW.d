INSTANCE Info_Mod_Serpentes_Hi (C_INFO)
{
	npc		= Mod_552_KDF_Serpentes_NW;
	nr		= 1;
	condition	= Info_Mod_Serpentes_Hi_Condition;
	information	= Info_Mod_Serpentes_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Serpentes_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Serpentes_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Serpentes_Hi_10_01"); //Ich bin Serpentes, der zweithöchste Feuermagier auf Khorinis. Was willst du von mir?
};

INSTANCE Info_Mod_Serpentes_Weindiebe (C_INFO)
{
	npc		= Mod_552_KDF_Serpentes_NW;
	nr		= 1;
	condition	= Info_Mod_Serpentes_Weindiebe_Condition;
	information	= Info_Mod_Serpentes_Weindiebe_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Serpentes_Weindiebe_Condition()
{
	if (Wld_GetDay() > Mod_FMAufnahme_Day)
	&& (hero.guild == GIL_VLK)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Serpentes_Weindiebe_Info()
{
	AI_Output(self, hero, "Info_Mod_Serpentes_Weindiebe_10_00"); //Nicht so schnell, Novize. Ich habe ein Anliegen an dich.
	AI_Output(hero, self, "Info_Mod_Serpentes_Weindiebe_15_01"); //Was gibt es?
	AI_Output(self, hero, "Info_Mod_Serpentes_Weindiebe_10_02"); //Wie du bestimmt weißt, hat unser Kloster neben anderen Einnahmequellen auch mit dem Verkauf von Wein sein gutes Auskommen.
	AI_Output(self, hero, "Info_Mod_Serpentes_Weindiebe_10_03"); //Ich weiß das besser als jeder andere, da ich mich um die finanziellen Belange des Klosters kümmere und Einnahmen und Ausgaben stets im Blick habe.
	AI_Output(self, hero, "Info_Mod_Serpentes_Weindiebe_10_04"); //Leider musste ich zu meinem großen Bedauern feststellen, dass es in letzter Zeit ein unschönes Missverhältnis zwischen Weinausgang und Goldeinahmen gab.
	AI_Output(self, hero, "Info_Mod_Serpentes_Weindiebe_10_05"); //Der Wirt Orlan hat sich zudem mehrmals über ausgebliebene Lieferungen unseres Weines beschwert.
	AI_Output(hero, self, "Info_Mod_Serpentes_Weindiebe_15_06"); //Was sagt Gorax dazu?
	AI_Output(self, hero, "Info_Mod_Serpentes_Weindiebe_10_07"); //Gorax?! Der ist ein alter Säufer, der weit mehr von dem Wein genießt, als gut für ihn ist.
	AI_Output(self, hero, "Info_Mod_Serpentes_Weindiebe_10_08"); //Zwar hat er beteuert nur die zuverlässigsten Novizen für die Lieferungen einzusetzen, hat jedoch bereits bis mittags so viel getrunken, dass er kaum die Novizen von den Magiern unterscheiden kann.
	AI_Output(self, hero, "Info_Mod_Serpentes_Weindiebe_10_09"); //Mein scharfer Blick dagegen hat mir verraten, dass mehrfach Novizen das Kloster durch den Eingang verlasse haben, die vorher nicht durch diesen hineingelangt waren… und die ich vorher auch nie gesehen hatte.
	AI_Output(hero, self, "Info_Mod_Serpentes_Weindiebe_15_10"); //Was hat das zu bedeuten und wer könnte das sein?
	AI_Output(self, hero, "Info_Mod_Serpentes_Weindiebe_10_11"); //Nun, da unsere magische Pforte zwar Feinde am hineinkommen, aber nicht am hinauszugehen hindert, verdächtige ich die Jünger des finsteren Gottes.
	AI_Output(self, hero, "Info_Mod_Serpentes_Weindiebe_10_12"); //Es würde mich in der Tat nicht überraschen, wenn diese Dämonenmagier dreist genug wären ihre Novizen zum stehlen unseres Weines hier reinzuschicken.
	AI_Output(self, hero, "Info_Mod_Serpentes_Weindiebe_10_13"); //Aber genug der Mutmaßungen: Ich will Gewissheit!
	AI_Output(hero, self, "Info_Mod_Serpentes_Weindiebe_15_14"); //Was soll ich machen?
	AI_Output(self, hero, "Info_Mod_Serpentes_Weindiebe_10_15"); //Erst vor kurzem hat wieder einer dieser Scheinnovizen das Kloster verlassen.
	AI_Output(self, hero, "Info_Mod_Serpentes_Weindiebe_10_16"); //Wenn du dich beeilst, wirst du ihn vielleicht noch auf dem Weg zwischen Kloster und Taverne stellen können.
	AI_Output(self, hero, "Info_Mod_Serpentes_Weindiebe_10_17"); //Also, du weißt, was zu tun ist.
	AI_Output(hero, self, "Info_Mod_Serpentes_Weindiebe_15_18"); //Ich mache mich sofort auf den Weg.

	Log_CreateTopic	(TOPIC_MOD_SERPENTES_WEINDIEBE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SERPENTES_WEINDIEBE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SERPENTES_WEINDIEBE, "Serpentes hat das wiederholte verschwinden von Weinlieferungen beklagt. Er hat die Novizen der Dämonenmagier in Verdacht. Einer von diesen Scheinnovizen hat vor kurzem das Kloster verlassen und ich soll ihn verfolgen.");

	Wld_InsertNpc	(Mod_7761_SNOV_Novize_NW, "TAVERNE");
};

INSTANCE Info_Mod_Serpentes_Weindiebe2 (C_INFO)
{
	npc		= Mod_552_KDF_Serpentes_NW;
	nr		= 1;
	condition	= Info_Mod_Serpentes_Weindiebe2_Condition;
	information	= Info_Mod_Serpentes_Weindiebe2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Serpentes_Weindiebe2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_SchwarzerNovize_Weindieb_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Serpentes_Weindiebe2_Info()
{
	AI_Output(self, hero, "Info_Mod_Serpentes_Weindiebe2_10_00"); //Und?! Sprich schon! Was hast du über die Weindiebe zu berichten?
	AI_Output(hero, self, "Info_Mod_Serpentes_Weindiebe2_15_01"); //Du hattest Recht, es war ein Novize der Schwarzmagier.
	AI_Output(self, hero, "Info_Mod_Serpentes_Weindiebe2_10_02"); //Ha, ich wusste es. Mein scharfer Verstand hat mich nicht getäuscht.
	AI_Output(self, hero, "Info_Mod_Serpentes_Weindiebe2_10_03"); //Hast du den Übeltäter zur Rechenschaft gezogen?

	if (Npc_IsDead(Mod_7761_SNOV_Novize_NW))
	{
		AI_Output(hero, self, "Info_Mod_Serpentes_Weindiebe2_15_04"); //Es wird ihm schwer fallen, irgendjemanden je wieder zu bestehlen. Dafür habe ich gesorgt.
		AI_Output(self, hero, "Info_Mod_Serpentes_Weindiebe2_10_05"); //Vortrefflich ... ich bin mehr als zufrieden mit dir, Novize. Das wird den Schwarzmagiern eine Lehre sein.
		AI_Output(self, hero, "Info_Mod_Serpentes_Weindiebe2_10_06"); //Ich bezweifle, dass sich jetzt noch irgendein Lakai des dunklen Gottes in unser Kloster wagen wird.
		AI_Output(self, hero, "Info_Mod_Serpentes_Weindiebe2_10_07"); //Innos Flammen sollen jeden versengen, der sich uns in den Weg stellt.
		AI_Output(self, hero, "Info_Mod_Serpentes_Weindiebe2_10_08"); //Hier, dieses Gold und die Spruchrollen hast du dir redlich verdient!

		CreateInvItems	(hero, ItMi_Gold, 400);
		CreateInvItems	(hero, ItSc_Firestorm, 4);

		B_ShowGivenThings	("400 Gold und 4 Spruchrollen Feuersturm erhalten");

		AI_Output(self, hero, "Info_Mod_Serpentes_Weindiebe2_10_09"); //Geh mit Innos Segen.
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Serpentes_Weindiebe2_15_10"); //Ich habe ihm klargemacht, dass er und seine Mitbrüder sich hier niemals wieder blicken lassen sollen.
		AI_Output(self, hero, "Info_Mod_Serpentes_Weindiebe2_10_11"); //(erbost) Was, du hast ihn davonkommen lassen?!
		AI_Output(self, hero, "Info_Mod_Serpentes_Weindiebe2_10_12"); //Lieber wäre mir gewesen, du hättest ihn mit Innos’ Flammen zu Tode geläutert.
		AI_Output(self, hero, "Info_Mod_Serpentes_Weindiebe2_10_13"); //(nachsichtiger) Aber ich will es dir dieses eine Mal nachsehen.
		AI_Output(self, hero, "Info_Mod_Serpentes_Weindiebe2_10_14"); //Letztendlich hast du dafür Sorge getragen, dass die Diener der Niedertracht uns nicht mehr bestehlen werden.
		AI_Output(self, hero, "Info_Mod_Serpentes_Weindiebe2_10_15"); //Hier, nimm die Spruchrollen und das Gold zur Belohnung.

		CreateInvItems	(hero, ItMi_Gold, 250);
		CreateInvItems	(hero, ItSc_Firestorm, 2);

		B_ShowGivenThings	("250 Gold und 2 Spruchrollen Feuersturm erhalten");

		AI_Output(self, hero, "Info_Mod_Serpentes_Weindiebe2_10_16"); //Und nun entferne dich wieder.
	};

	B_GivePlayerXP	(200);

	B_SetTopicStatus	(TOPIC_MOD_SERPENTES_WEINDIEBE, LOG_SUCCESS);

	B_RemoveNpc	(Mod_7761_SNOV_Novize_NW);
};

INSTANCE Info_Mod_Serpentes_Kimon (C_INFO)
{
	npc		= Mod_552_KDF_Serpentes_NW;
	nr		= 1;
	condition	= Info_Mod_Serpentes_Kimon_Condition;
	information	= Info_Mod_Serpentes_Kimon_Info;
	permanent	= 0;
	important	= 0;
	description	= "Der Händler Kimon sagt, du hättest ihm zu wenig für seine Trauben bezahlt.";
};

FUNC INT Info_Mod_Serpentes_Kimon_Condition()
{
	if (Mod_Kimons_Traubenquest == TRUE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Serpentes_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Serpentes_Kimon_Info()
{
	AI_Output(hero, self, "Info_Mod_Serpentes_Kimon_15_00"); //Der Händler Kimon sagt, du hättest ihm zu wenig für seine Trauben bezahlt.
	AI_Output(self, hero, "Info_Mod_Serpentes_Kimon_10_01"); //So, sagt er das? Und was glaubst du, wie wenig es mich interessiert, was er sagt?
	AI_Output(self, hero, "Info_Mod_Serpentes_Kimon_10_02"); //Ich habe ihm so viel Gold gegeben, wie mir seine Trauben wert waren.
	AI_Output(hero, self, "Info_Mod_Serpentes_Kimon_15_03"); //Das war aber zu wenig.
	AI_Output(self, hero, "Info_Mod_Serpentes_Kimon_10_04"); //(wütend) Du stellst das Wort des zweithöchsten Feuermagiers von Khorinis in Frage?
	AI_Output(hero, self, "Info_Mod_Serpentes_Kimon_15_05"); //Ja, genau das mache ich.
	AI_Output(self, hero, "Info_Mod_Serpentes_Kimon_10_06"); //(laut) Verschwinde gefälligst, bevor ich dich hinauswerfen lasse!
	AI_Output(hero, self, "Info_Mod_Serpentes_Kimon_15_07"); //Nicht, bevor du diese verdammten Trauben bezahlt hast!
	AI_Output(self, hero, "Info_Mod_Serpentes_Kimon_10_08"); //So, jetzt reicht es mir.

	B_LogEntry	(TOPIC_MOD_KIMONSTRAUBEN, "Serpentes will das restliche Gold nicht bezahlen. Entweder muss ich versuchen Serpentes das Gold abzunehmen oder es selber zahlen. Vielleicht kann mir aber auch Pyrokar helfen.");

	AI_StopProcessInfos	(self);

	AI_Teleport	(hero, "KLOSTER");
};

INSTANCE Info_Mod_Serpentes_KimonsGold (C_INFO)
{
	npc		= Mod_552_KDF_Serpentes_NW;
	nr		= 1;
	condition	= Info_Mod_Serpentes_KimonsGold_Condition;
	information	= Info_Mod_Serpentes_KimonsGold_Info;
	permanent	= 1;
	important	= 0;
	description	= "Gibst du mir jetzt das Gold?";
};

FUNC INT Info_Mod_Serpentes_KimonsGold_Condition()
{
	if (Mod_Kimons_Traubenquest == TRUE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Serpentes_Kimon))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Pyrokar_KimonGeld))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Serpentes_KimonsGold_Info()
{
	AI_Output(hero, self, "Info_Mod_Serpentes_KimonsGold_15_00"); //Gibst du mir jetzt das Gold?
	AI_Output(self, hero, "Info_Mod_Serpentes_KimonsGold_10_01"); //(wütend) Ich hab gesagt, du sollst verschwinden!

	AI_StopProcessInfos	(self);

	AI_Teleport	(hero, "KLOSTER");
};

INSTANCE Info_Mod_Serpentes_Pickpocket (C_INFO)
{
	npc		= Mod_552_KDF_Serpentes_NW;
	nr		= 1;
	condition	= Info_Mod_Serpentes_Pickpocket_Condition;
	information	= Info_Mod_Serpentes_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_180;
};

FUNC INT Info_Mod_Serpentes_Pickpocket_Condition()
{
	C_Beklauen	(165, ItMi_Gold, 2000);
};

FUNC VOID Info_Mod_Serpentes_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Serpentes_Pickpocket);

	Info_AddChoice	(Info_Mod_Serpentes_Pickpocket, DIALOG_BACK, Info_Mod_Serpentes_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Serpentes_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Serpentes_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Serpentes_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Serpentes_Pickpocket);
};

FUNC VOID Info_Mod_Serpentes_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Serpentes_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Serpentes_Pickpocket);

		Info_AddChoice	(Info_Mod_Serpentes_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Serpentes_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Serpentes_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Serpentes_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Serpentes_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Serpentes_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Serpentes_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Serpentes_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Serpentes_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Serpentes_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Serpentes_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Serpentes_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Serpentes_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Serpentes_EXIT (C_INFO)
{
	npc		= Mod_552_KDF_Serpentes_NW;
	nr		= 1;
	condition	= Info_Mod_Serpentes_EXIT_Condition;
	information	= Info_Mod_Serpentes_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Serpentes_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Serpentes_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};