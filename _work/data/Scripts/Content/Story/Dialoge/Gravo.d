INSTANCE Info_Mod_Gravo_Hi (C_INFO)
{
	npc		= Mod_1430_BUD_Gravo_MT;
	nr		= 1;
	condition	= Info_Mod_Gravo_Hi_Condition;
	information	= Info_Mod_Gravo_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Und du bist auf der Suche nach ...";
};

FUNC INT Info_Mod_Gravo_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gravo_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Gravo_Hi_15_00"); //Und du bist auf der Suche nach ...
	AI_Output(self, hero, "Info_Mod_Gravo_Hi_25_01"); //(eifrig) Das kann ich nicht sagen. Das heißt, ich würde ja gern, aber dann würdest du sicher versuchen, mich von hier zu vertreiben.
	AI_Output(self, hero, "Info_Mod_Gravo_Hi_25_02"); //War das jetzt schon zu viel verraten?
	AI_Output(hero, self, "Info_Mod_Gravo_Hi_15_03"); //Keineswegs.

	Info_ClearChoices	(Info_Mod_Gravo_Hi);

	Info_AddChoice	(Info_Mod_Gravo_Hi, "Viel Erfolg noch.", Info_Mod_Gravo_Hi_D);
	Info_AddChoice	(Info_Mod_Gravo_Hi, "Du kannst dich nicht damit abfinden, nicht mehr zu schürfen?", Info_Mod_Gravo_Hi_C);
	Info_AddChoice	(Info_Mod_Gravo_Hi, "Du bist ... auf Schatzsuche?", Info_Mod_Gravo_Hi_B);
	Info_AddChoice	(Info_Mod_Gravo_Hi, "Du hast wohl was verloren?", Info_Mod_Gravo_Hi_A);
};

FUNC VOID Info_Mod_Gravo_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_Gravo_Hi_D_15_00"); //Viel Erfolg noch.

	Info_ClearChoices	(Info_Mod_Gravo_Hi);
};

FUNC VOID Info_Mod_Gravo_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_Gravo_Hi_C_15_00"); //Du kannst dich nicht damit abfinden, nicht mehr zu schürfen?
	AI_Output(self, hero, "Info_Mod_Gravo_Hi_C_25_01"); //(durchgeknallt) Am liebsten würde ich mit der Spitzhacke nur noch irgendwelchen Typen die Birne einschlagen.
	AI_Output(self, hero, "Info_Mod_Gravo_Hi_C_25_02"); //Ach ... so was sagt man nicht, oder?
};

FUNC VOID Info_Mod_Gravo_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Gravo_Hi_B_15_00"); //Du bist ... auf Schatzsuche?
	AI_Output(self, hero, "Info_Mod_Gravo_Hi_B_25_01"); //Psst! Hat dir Kyle auch davon erzählt?
	AI_Output(hero, self, "Info_Mod_Gravo_Hi_B_15_02"); //Klar.
	AI_Output(self, hero, "Info_Mod_Gravo_Hi_B_25_03"); //(beleidigt) Er hat mir versprochen, es bliebe unser Geheimnis.
	AI_Output(self, hero, "Info_Mod_Gravo_Hi_B_25_04"); //Na ja, aber wenn du davon weißt, bist du doch jetzt auch sicher hinter Garaz' und Pachos' Schatz her.
	AI_Output(hero, self, "Info_Mod_Gravo_Hi_B_15_05"); //Ähm ... ja.
	AI_Output(self, hero, "Info_Mod_Gravo_Hi_B_25_06"); //Dann wären wir ja so was wie Konkurrenten.
	AI_Output(self, hero, "Info_Mod_Gravo_Hi_B_25_07"); //Hmm ... sollte ich dich dann nicht besser sofort töten?
	AI_Output(self, hero, "Info_Mod_Gravo_Hi_B_25_08"); //Nein, warte, immer zuerst reden, haben sie gesagt. Ich soll meine gute Ausbildung nicht vergessen.

	Info_ClearChoices	(Info_Mod_Gravo_Hi);

	Mod_Gravo_Schatz = 1;

	Log_CreateTopic	(TOPIC_MOD_GRAVO_SCHATZ, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_GRAVO_SCHATZ, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_GRAVO_SCHATZ, "Der durchgeknallte Gravo hackt im Alten Lager beständig an einer Stelle neben dem Tümpel, um den Schatz zweier Ex-Buddler zu heben. Kyle soll ihn dazu angestiftet haben. Da Gravo von sich aus keinen Platz macht, werde ich einen anderen Weg finden müssen, ihn von dort zu entfernen.");
};

FUNC VOID Info_Mod_Gravo_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Gravo_Hi_A_15_00"); //Du hast wohl was verloren?
	AI_Output(self, hero, "Info_Mod_Gravo_Hi_A_25_01"); //Ja! Genau! Das Gefühl habe ich die ganze Zeit! Irgendetwas muss ich verloren haben.
	AI_Output(self, hero, "Info_Mod_Gravo_Hi_A_25_02"); //Ich komm nur nicht drauf, was es war ...
};

INSTANCE Info_Mod_Gravo_WasFuerSchatz (C_INFO)
{
	npc		= Mod_1430_BUD_Gravo_MT;
	nr		= 1;
	condition	= Info_Mod_Gravo_WasFuerSchatz_Condition;
	information	= Info_Mod_Gravo_WasFuerSchatz_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was war das noch gleich für ein Schatz?";
};

FUNC INT Info_Mod_Gravo_WasFuerSchatz_Condition()
{
	if (Mod_Gravo_Schatz == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gravo_WasFuerSchatz_Info()
{
	AI_Output(hero, self, "Info_Mod_Gravo_WasFuerSchatz_15_00"); //Was war das noch gleich für ein Schatz?
	AI_Output(self, hero, "Info_Mod_Gravo_WasFuerSchatz_25_01"); //(hämisch) Das hat dir Kyle also nicht erzählt, wie?
	AI_Output(self, hero, "Info_Mod_Gravo_WasFuerSchatz_25_02"); //Dass Garaz und Pacho hier ihren ganzen Reichtum vergraben haben sollen, bevor sie dem Minental den Rücken gekehrt haben, um eine Musiktruppe zu gründen?
	AI_Output(self, hero, "Info_Mod_Gravo_WasFuerSchatz_25_03"); //Dann werde ich es dir ganz bestimmt auch nicht sagen!
	AI_Output(hero, self, "Info_Mod_Gravo_WasFuerSchatz_15_04"); //Eine Musiktruppe?
	AI_Output(self, hero, "Info_Mod_Gravo_WasFuerSchatz_25_05"); //Das war schon immer ihr großer Traum, haben sie gesagt.
	AI_Output(self, hero, "Info_Mod_Gravo_WasFuerSchatz_25_06"); //Einen Künstlernamen hatten sie auch schon, eine Kombination aus ihren Namen. Gazpacho oder so.
	AI_Output(self, hero, "Info_Mod_Gravo_WasFuerSchatz_25_07"); //Als Snaf das gehört hat, hat er sich gar nicht mehr eingekriegt. Frag mich nicht, warum.
};

INSTANCE Info_Mod_Gravo_IchHacken (C_INFO)
{
	npc		= Mod_1430_BUD_Gravo_MT;
	nr		= 1;
	condition	= Info_Mod_Gravo_IchHacken_Condition;
	information	= Info_Mod_Gravo_IchHacken_Info;
	permanent	= 0;
	important	= 0;
	description	= "Lässt du mich auch mal kurz hacken?";
};

FUNC INT Info_Mod_Gravo_IchHacken_Condition()
{
	if (Mod_Gravo_Schatz == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gravo_IchHacken_Info()
{
	AI_Output(hero, self, "Info_Mod_Gravo_IchHacken_15_00"); //Lässt du mich auch mal kurz hacken?
	AI_Output(self, hero, "Info_Mod_Gravo_IchHacken_25_01"); //Nichts da! Das hier ist mein Revier.
	AI_Output(self, hero, "Info_Mod_Gravo_IchHacken_25_02"); //Sobald ich den Schatz gehoben habe und über alle Berge davon bin und mir von einer südländischen Schönheit Rum in den Mund träufeln lasse, kannst du's ja noch mal versuchen!
};

INSTANCE Info_Mod_Gravo_Schatz (C_INFO)
{
	npc		= Mod_1430_BUD_Gravo_MT;
	nr		= 1;
	condition	= Info_Mod_Gravo_Schatz_Condition;
	information	= Info_Mod_Gravo_Schatz_Info;
	permanent	= 0;
	important	= 0;
	description	= "Es gibt keinen Schatz.";
};

FUNC INT Info_Mod_Gravo_Schatz_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kyle_SchatzImSchlammsee))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gravo_Schatz_Info()
{
	AI_Output(hero, self, "Info_Mod_Gravo_Schatz_15_00"); //Es gibt keinen Schatz.
	AI_Output(self, hero, "Info_Mod_Gravo_Schatz_25_01"); //Schlechter Versuch. So einfach kriegst du mich hier nicht weg.
	AI_Output(hero, self, "Info_Mod_Gravo_Schatz_15_02"); //Es gibt wirklich keinen Schatz.
	AI_Output(hero, self, "Info_Mod_Gravo_Schatz_15_03"); //Kyle hat gelogen, damit du nicht dauernd durch seine Hütte läufst.
	AI_Output(self, hero, "Info_Mod_Gravo_Schatz_25_04"); //(enttäuscht) Tatsächlich? Und ich dachte noch, sein Pisspott in der Tür wäre bloß Zufall.
	AI_Output(self, hero, "Info_Mod_Gravo_Schatz_25_05"); //(in Rage) Am liebsten würde ich seine feuchte Scheiße nehmen und sie ihm...
	AI_Output(self, hero, "Info_Mod_Gravo_Schatz_25_06"); //(entspannter) ... zur Abfallgrube tragen.
	AI_Output(self, hero, "Info_Mod_Gravo_Schatz_25_07"); //Was soll's, finde ich halt anderswo meinen Schatz. Irgendwo wird schon einer sein.

	B_GivePlayerXP	(100);

	B_SetTopicStatus	(TOPIC_MOD_GRAVO_SCHATZ, LOG_SUCCESS);

	CurrentNQ += 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Gravo_Lagermusik (C_INFO)
{
	npc		= Mod_1430_BUD_Gravo_MT;
	nr		= 1;
	condition	= Info_Mod_Gravo_Lagermusik_Condition;
	information	= Info_Mod_Gravo_Lagermusik_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gravo_Lagermusik_Condition()
{
	if (Mod_Gravo_Schatz == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gravo_Lagermusik_Info()
{
	AI_Output(self, hero, "Info_Mod_Gravo_Lagermusik_25_00"); //(tadelnd) Na, na, na, da hat doch nicht etwa jemand meine Abwesenheit ausgenutzt?
	AI_Output(self, hero, "Info_Mod_Gravo_Lagermusik_25_01"); //Du dachtest du wohl, du könntest mich so einfach abschütteln?
	AI_Output(self, hero, "Info_Mod_Gravo_Lagermusik_25_02"); //(nachäffend) Kyle hat dich nur angeschmiert, ahahaha.
	AI_Output(self, hero, "Info_Mod_Gravo_Lagermusik_25_03"); //Eigentlich sollte ich dich für diesen Verrat - he, was hast du denn da gefunden?!
	AI_Output(self, hero, "Info_Mod_Gravo_Lagermusik_25_04"); //Warte mal - das sind doch die alten Instrumente von Garaz und Pacho! Die sie nicht mehr mitnehmen konnten! Das ist also ihr Schatz!

	AI_PlayAni	(self, "T_PLUNDER");

	AI_Output(self, hero, "Info_Mod_Gravo_Lagermusik_25_05"); //(euphorisch) Damit kann ich endlich meine eigene Gruppe gründen! Den Jungs mal ein bisschen mit Musik anheizen.
	AI_Output(self, hero, "Info_Mod_Gravo_Lagermusik_25_06"); //Ähm, du wirst mir doch helfen, Mitglieder zu finden, oder? Die meisten hier sprechen nämlich nicht mit mir.
	AI_Output(self, hero, "Info_Mod_Gravo_Lagermusik_25_07"); //Vielleicht könntest du ein paar Buddler überzeugen. Die haben ja eh nichts zu tun.

	B_StartOtherRoutine	(self, "START");

	Info_ClearChoices	(Info_Mod_Gravo_Lagermusik);

	Info_AddChoice	(Info_Mod_Gravo_Lagermusik, "Das schaffst du sicher auch allein.", Info_Mod_Gravo_Lagermusik_B);
	Info_AddChoice	(Info_Mod_Gravo_Lagermusik, "Ich kann mich mal umhören.", Info_Mod_Gravo_Lagermusik_A);
};

FUNC VOID Info_Mod_Gravo_Lagermusik_B()
{
	AI_Output(hero, self, "Info_Mod_Gravo_Lagermusik_B_15_00"); //Das schaffst du sicher auch allein.
	AI_Output(self, hero, "Info_Mod_Gravo_Lagermusik_B_25_01"); //(trotzig) Ja, klar. Ich bin nicht auf deine Hilfe angewiesen.

	Info_ClearChoices	(Info_Mod_Gravo_Lagermusik);
};

FUNC VOID Info_Mod_Gravo_Lagermusik_A()
{
	AI_Output(hero, self, "Info_Mod_Gravo_Lagermusik_A_15_00"); //Ich kann mich mal umhören.

	Info_ClearChoices	(Info_Mod_Gravo_Lagermusik);

	Mod_Gravo_Schatz = 3;

	Log_CreateTopic	(TOPIC_MOD_GRAVO_MUSIK, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_GRAVO_MUSIK, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_GRAVO_MUSIK, "Den Schatz von Garaz und Pacho gab es doch - und zwar ein paar alte Musikinstrumente. Gravo kam gleich auf die Idee, eine eigene Lagergruppe ins Leben zu rufen. Ich soll mich unter den Buddlern umhören, ob jemand Interesse hat, bei ihm Mitglied zu werden.");
};

INSTANCE Info_Mod_Gravo_Lagermusik2 (C_INFO)
{
	npc		= Mod_1430_BUD_Gravo_MT;
	nr		= 1;
	condition	= Info_Mod_Gravo_Lagermusik2_Condition;
	information	= Info_Mod_Gravo_Lagermusik2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gravo_Lagermusik2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Graham_Lagermusik))
	&& (Npc_KnowsInfo(hero, Info_Mod_Mud_Lagermusik))
	&& (Npc_KnowsInfo(hero, Info_Mod_Guy_Lagermusik))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gravo_Lagermusik2_Info()
{
	AI_Output(self, hero, "Info_Mod_Gravo_Lagermusik2_25_00"); //Sieh an, mit deiner Hilfe haben wir es wirklich geschafft!

	if (Npc_KnowsInfo(hero, Info_Mod_Seraphia_Lagermusik))
	{
		AI_Output(self, hero, "Info_Mod_Gravo_Lagermusik2_25_01"); //Wir haben schon unsere Aufgaben besprochen, Graham wird die Gitarre spielen, Mud die Trommel, Guy die Rassel, Seraphia tanzen, und ich werde singen.

		B_GivePlayerXP	(100);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Gravo_Lagermusik2_25_02"); //Wir haben schon unsere Aufgaben besprochen, Graham wird die Gitarre spielen, Mud die Trommel,  Guy die Rassel, und ich werde singen.

		B_GivePlayerXP	(50);
	};

	AI_Output(self, hero, "Info_Mod_Gravo_Lagermusik2_25_03"); // Jetzt brauchen wir nur noch einen guten Namen. Uns fällt da nichts ein...

	Info_ClearChoices	(Info_Mod_Gravo_Lagermusik2);

	Info_AddChoice	(Info_Mod_Gravo_Lagermusik2, "Mir würde 'Unglaublich reichhaltige Kartoffelsuppe' gut gefallen.", Info_Mod_Gravo_Lagermusik2_C);
	Info_AddChoice	(Info_Mod_Gravo_Lagermusik2, "Was haltet ihr von 'Die Höllenpilze'?", Info_Mod_Gravo_Lagermusik2_B);
	Info_AddChoice	(Info_Mod_Gravo_Lagermusik2, "Wie wär's mit 'The Three G's'?", Info_Mod_Gravo_Lagermusik2_A);
};

FUNC VOID Info_Mod_Gravo_Lagermusik2_D()
{
	AI_Output(self, hero, "Info_Mod_Gravo_Lagermusik2_D_25_00"); //Meinetwegen. Der Name ist ja eh nicht so wichtig.
	AI_Output(self, hero, "Info_Mod_Gravo_Lagermusik2_D_25_01"); //Wir proben jetzt einen Tag und treten dann morgen Abend um 19 Uhr erstmals auf der Bühne auf.
	AI_Output(self, hero, "Info_Mod_Gravo_Lagermusik2_D_25_02"); //Bis dahin muss ich mir noch einen Liedtext ausdenken...

	Info_ClearChoices	(Info_Mod_Gravo_Lagermusik2);

	CurrentNQ += 1;

	B_SetTopicStatus	(TOPIC_MOD_GRAVO_MUSIK, LOG_SUCCESS);

	Mod_Gravo_Schatz = 4;

	Mod_Gravo_Auftritt_Tag = Wld_GetDay();
};

FUNC VOID Info_Mod_Gravo_Lagermusik2_C()
{
	AI_Output(hero, self, "Info_Mod_Gravo_Lagermusik2_C_15_00"); //Mir würde "Unglaublich reichhaltige Kartoffelsuppe" gut gefallen.

	Info_Mod_Gravo_Lagermusik2_D();
};

FUNC VOID Info_Mod_Gravo_Lagermusik2_B()
{
	AI_Output(hero, self, "Info_Mod_Gravo_Lagermusik2_B_15_00"); //Was haltet ihr von "Die Höllenpilze"?

	Info_Mod_Gravo_Lagermusik2_D();
};

FUNC VOID Info_Mod_Gravo_Lagermusik2_A()
{
	AI_Output(hero, self, "Info_Mod_Gravo_Lagermusik2_A_15_00"); //Wie wär's mit "The Three G's"?

	Info_Mod_Gravo_Lagermusik2_D();
};

INSTANCE Info_Mod_Gravo_KGBuddler (C_INFO)
{
	npc		= Mod_1430_BUD_Gravo_MT;
	nr		= 1;
	condition	= Info_Mod_Gravo_KGBuddler_Condition;
	information	= Info_Mod_Gravo_KGBuddler_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du Lust als Buddler zu arbeiten?";
};

FUNC INT Info_Mod_Gravo_KGBuddler_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Melcador_Buddler2))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Costa_Buddler))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gravo_KGBuddler_Info()
{
	AI_Output(hero, self, "Info_Mod_Gravo_KGBuddler_15_00"); //Hast du Lust als Buddler zu arbeiten?
	AI_Output(self, hero, "Info_Mod_Gravo_KGBuddler_25_01"); //Ich habe mich schon davor gedrückt, als die Barriere noch da war, da werde ich jetzt bestimmt nicht damit anfangen ...
};

INSTANCE Info_Mod_Gravo_Pickpocket (C_INFO)
{
	npc		= Mod_1430_BUD_Gravo_MT;
	nr		= 1;
	condition	= Info_Mod_Gravo_Pickpocket_Condition;
	information	= Info_Mod_Gravo_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Gravo_Pickpocket_Condition()
{
	C_Beklauen	(51, ItMi_Gold, 20);
};

FUNC VOID Info_Mod_Gravo_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Gravo_Pickpocket);

	Info_AddChoice	(Info_Mod_Gravo_Pickpocket, DIALOG_BACK, Info_Mod_Gravo_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Gravo_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Gravo_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Gravo_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Gravo_Pickpocket);
};

FUNC VOID Info_Mod_Gravo_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Gravo_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Gravo_Pickpocket);

		Info_AddChoice	(Info_Mod_Gravo_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Gravo_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Gravo_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Gravo_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Gravo_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Gravo_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Gravo_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Gravo_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Gravo_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Gravo_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Gravo_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Gravo_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Gravo_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Gravo_EXIT (C_INFO)
{
	npc		= Mod_1430_BUD_Gravo_MT;
	nr		= 1;
	condition	= Info_Mod_Gravo_EXIT_Condition;
	information	= Info_Mod_Gravo_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Gravo_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gravo_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};