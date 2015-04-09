INSTANCE Info_Mod_Costa_Hi (C_INFO)
{
	npc		= Mod_1442_BUD_Costa_MT;
	nr		= 1;
	condition	= Info_Mod_Costa_Hi_Condition;
	information	= Info_Mod_Costa_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Costa_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Costa_Hi_Info()
{
	B_Say	(hero, self, "$WHoAREYOU");

	AI_Output(self, hero, "Info_Mod_Costa_Hi_34_00"); //Costa, Buddler. Wie unschwer zu erkennen ist.
};

INSTANCE Info_Mod_Costa_Buddler (C_INFO)
{
	npc		= Mod_1442_BUD_Costa_MT;
	nr		= 1;
	condition	= Info_Mod_Costa_Buddler_Condition;
	information	= Info_Mod_Costa_Buddler_Info;
	permanent	= 0;
	important	= 0;
	description	= "Interesse, wieder als Buddler zu arbeiten?";
};

FUNC INT Info_Mod_Costa_Buddler_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Melcador_Buddler2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Costa_Buddler_Info()
{
	AI_Output(hero, self, "Info_Mod_Costa_Buddler_15_00"); //Interesse, wieder als Buddler zu arbeiten?
	AI_Output(self, hero, "Info_Mod_Costa_Buddler_34_01"); //Leider ist mit mir nicht mehr so viel anzufangen. Hab seit dem Fall der Barriere keinen Brocken Erz mehr geschürft.
	AI_Output(self, hero, "Info_Mod_Costa_Buddler_34_02"); //Und leider hab ich bei einem Kampf mit einem Skelett mein Buddlerbuch verloren. Da steht alles drin, um mich wieder auf Vordermann zu bringen.
	AI_Output(hero, self, "Info_Mod_Costa_Buddler_15_03"); //Warum legt sich ein Buddler mit einem Skelett an?
	AI_Output(self, hero, "Info_Mod_Costa_Buddler_34_04"); //Na ja, irgendwas muss man ja machen. Hab mich nach dem Fall der Barriere als Artefaktsucher versucht. Bin wohl nicht sehr gut gewesen.
	AI_Output(hero, self, "Info_Mod_Costa_Buddler_15_05"); //Dann ist das Skelett ja ein besserer Artefaktsucher als du. Wo soll denn dieses Skelett sein?
	AI_Output(self, hero, "Info_Mod_Costa_Buddler_34_06"); //Ich nehme an, noch in meinem kleinen Lager, das auf dem Weg zum Neuen Lager am Fluss liegt.
	AI_Output(hero, self, "Info_Mod_Costa_Buddler_15_07"); //Ich werde dein Buch schon irgendwie bekommen, pack du schon mal eine sieben Sachen ein.

	B_LogEntry	(TOPIC_MOD_KG_BUDDLER, "Costa wäre bereit, bei uns in der Mine zu schürfen, ist jedoch nicht mehr ganz in der Materie. Ich soll ihm daher sein Buddlerbuch besorgen, welches er jedoch bei einem Kampf mit einem Skelett verloren hat. Das Skelett befindet sich nun in seinem Lager am Fluss zum Neuen Lager. Ich sollte lieber Melcador mitnehmen.");
};

INSTANCE Info_Mod_Costa_Buddler2 (C_INFO)
{
	npc		= Mod_1442_BUD_Costa_MT;
	nr		= 1;
	condition	= Info_Mod_Costa_Buddler2_Condition;
	information	= Info_Mod_Costa_Buddler2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier hast du das Buch.";
};

FUNC INT Info_Mod_Costa_Buddler2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Costa_Buddler))
	&& (Npc_KnowsInfo(hero, Info_Mod_Melcador_Buddler5))
	&& (Npc_HasItems(hero, ItWr_Buddlerbuch) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Costa_Buddler2_Info()
{
	AI_Output(hero, self, "Info_Mod_Costa_Buddler2_15_00"); //Hier hast du das Buch.

	B_GiveInvItems	(hero, self, ItWr_Buddlerbuch, 1);

	AI_Output(self, hero, "Info_Mod_Costa_Buddler2_34_01"); //Danke, jetzt kann ich mich wieder fit machen. Wo soll ich denn buddeln?
	AI_Output(hero, self, "Info_Mod_Costa_Buddler2_15_02"); //Geh zur verlassenen Mine und warte davor.
	AI_Output(self, hero, "Info_Mod_Costa_Buddler2_34_03"); //Ich mach mich sofort auf den Weg.

	B_LogEntry	(TOPIC_MOD_KG_BUDDLER, "Costa macht sich jetzt auf den Weg zur Mine.");

	B_GivePlayerXP	(200);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "MINE");
};

INSTANCE Info_Mod_Costa_SchonImmerHier (C_INFO)
{
	npc		= Mod_1442_BUD_Costa_MT;
	nr		= 1;
	condition	= Info_Mod_Costa_SchonImmerHier_Condition;
	information	= Info_Mod_Costa_SchonImmerHier_Info;
	permanent	= 0;
	important	= 0;
	description	= "Warst du schon immer im Alten Lager?";
};

FUNC INT Info_Mod_Costa_SchonImmerHier_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Costa_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Costa_SchonImmerHier_Info()
{
	AI_Output(hero, self, "Info_Mod_Costa_SchonImmerHier_15_00"); //Warst du schon immer im Alten Lager?
	AI_Output(self, hero, "Info_Mod_Costa_SchonImmerHier_34_01"); //Jedenfalls schon deutlich zu lange. Ich habe dich vor Monaten auch schon mal gesehen.
	AI_Output(self, hero, "Info_Mod_Costa_SchonImmerHier_34_02"); //Aber wie haben nie miteinander gesprochen oder so.
};

INSTANCE Info_Mod_Costa_NichtZufrieden (C_INFO)
{
	npc		= Mod_1442_BUD_Costa_MT;
	nr		= 1;
	condition	= Info_Mod_Costa_NichtZufrieden_Condition;
	information	= Info_Mod_Costa_NichtZufrieden_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wirklich zufrieden siehst du nicht aus.";
};

FUNC INT Info_Mod_Costa_NichtZufrieden_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Costa_SchonImmerHier))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Costa_NichtZufrieden_Info()
{
	AI_Output(hero, self, "Info_Mod_Costa_NichtZufrieden_15_00"); //Wirklich zufrieden siehst du nicht aus.
	AI_Output(self, hero, "Info_Mod_Costa_NichtZufrieden_34_01"); //Ja, verdammt. Ich hatte meine Chance, aus dem Lager zu fliehen, aber ich hab's einfach verpennt.
	AI_Output(self, hero, "Info_Mod_Costa_NichtZufrieden_34_02"); //Die anderen haben sich mitten in der Nacht getroffen und sind abgehauen, während ich tief und fest geschlafen habe.
	AI_Output(self, hero, "Info_Mod_Costa_NichtZufrieden_34_03"); //Zu allem Überfluss hatte ich Jesse vorher meine wertvollsten Besitztümer gegeben, weil er die unabhängig von uns rausschaffen wollte.
	AI_Output(self, hero, "Info_Mod_Costa_NichtZufrieden_34_04"); //Das Erz ist mir egal, aber meinen Gürtel brauche ich zurück. Ohne den hätte ich die Arbeit in den Minen nie ertragen.
	AI_Output(self, hero, "Info_Mod_Costa_NichtZufrieden_34_05"); //Und außerdem rutschen mir jetzt alle Hosen.

	Info_ClearChoices	(Info_Mod_Costa_NichtZufrieden);

	Info_AddChoice	(Info_Mod_Costa_NichtZufrieden, "Viel Erfolg beim Suchen.", Info_Mod_Costa_NichtZufrieden_B);
	Info_AddChoice	(Info_Mod_Costa_NichtZufrieden, "Ich werde versuchen, deinen Gürtel aufzutreiben.", Info_Mod_Costa_NichtZufrieden_A);
};

FUNC VOID Info_Mod_Costa_NichtZufrieden_B()
{
	AI_Output(hero, self, "Info_Mod_Costa_NichtZufrieden_B_15_00"); //Viel Erfolg beim Suchen.

	Info_ClearChoices	(Info_Mod_Costa_NichtZufrieden);
};

FUNC VOID Info_Mod_Costa_NichtZufrieden_A()
{
	AI_Output(hero, self, "Info_Mod_Costa_NichtZufrieden_A_15_00"); //Ich werde versuchen, deinen Gürtel aufzutreiben.
	AI_Output(self, hero, "Info_Mod_Costa_NichtZufrieden_A_34_01"); //Das ist leichter gesagt als getan, fürchte ich. Wir wussten nämlich überhaupt nicht, wohin wir uns nach der Flucht wenden sollten.
	AI_Output(self, hero, "Info_Mod_Costa_NichtZufrieden_A_34_02"); //Deshalb habe ich keine Ahnung, wo Jesse jetzt stecken könnte.
	AI_Output(self, hero, "Info_Mod_Costa_NichtZufrieden_A_34_03"); //Wenn du ihm aber doch mal über den Weg läufst, soll er meinen Gürtel rausrücken.

	Mod_Costa_Guertel = 1;

	Mod_Costa_Guertel_Tag = Wld_GetDay();

	Info_ClearChoices	(Info_Mod_Costa_NichtZufrieden);

	Log_CreateTopic	(TOPIC_MOD_COSTA_GUERTEL, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_COSTA_GUERTEL, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_COSTA_GUERTEL, "Costa hat Jesse seine Habseligkeiten überlassen, bevor sie aus dem Lager fliehen wollten. Nur hat Costa es nicht geschafft. Von seinen Besitztümern ist ihm sein Gürtel am wichtigsten. Wenn ich Jesse treffe, soll ich Costa seinen Gürtel zurückbringen.");
};

INSTANCE Info_Mod_Costa_Jesse (C_INFO)
{
	npc		= Mod_1442_BUD_Costa_MT;
	nr		= 1;
	condition	= Info_Mod_Costa_Jesse_Condition;
	information	= Info_Mod_Costa_Jesse_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe Jesse gefunden.";
};

FUNC INT Info_Mod_Costa_Jesse_Condition()
{
	if (Mod_Costa_Guertel == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Jesse_Costa))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Costa_Jesse_Info()
{
	AI_Output(hero, self, "Info_Mod_Costa_Jesse_15_00"); //Ich habe Jesse gefunden.
	AI_Output(self, hero, "Info_Mod_Costa_Jesse_34_01"); //Ha! Und? Hat er meinen Gürtel rausgerückt?
	AI_Output(hero, self, "Info_Mod_Costa_Jesse_15_02"); //Das nicht. Er kommt persönlich, um dich hier rauszuholen. Du sollst nur um Mitternacht zu eurem vereinbarten Treffpunkt erscheinen.
	AI_Output(self, hero, "Info_Mod_Costa_Jesse_34_03"); //Jesse ist eben ein echter Kumpel! Ich hoffe bloß, dass uns die Wachen nicht erwischen...
	AI_Output(self, hero, "Info_Mod_Costa_Jesse_34_04"); //Dir auch vielen Dank für deine Botschaft. Vielleicht sieht man sich mal wieder.

	B_GivePlayerXP	(150);

	CurrentNQ += 1;

	B_SetTopicStatus	(TOPIC_MOD_COSTA_GUERTEL, LOG_SUCCESS);

	Mod_Costa_Guertel_Tag = Wld_GetDay();

	B_StartOtherRoutine	(self, "TREFFEN");
	B_StartOtherRoutine	(Mod_1506_BUD_Jesse_MT, "TREFFEN");
};

INSTANCE Info_Mod_Costa_Jesse2 (C_INFO)
{
	npc		= Mod_1442_BUD_Costa_MT;
	nr		= 1;
	condition	= Info_Mod_Costa_Jesse2_Condition;
	information	= Info_Mod_Costa_Jesse2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du hast es geschafft.";
};

FUNC INT Info_Mod_Costa_Jesse2_Condition()
{
	if (Mod_Costa_Guertel_Tag < Wld_GetDay())
	&& (Npc_KnowsInfo(hero, Info_Mod_Costa_Jesse))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Costa_Jesse2_Info()
{
	AI_Output(hero, self, "Info_Mod_Costa_Jesse2_15_00"); //Du hast es geschafft.
	AI_Output(self, hero, "Info_Mod_Costa_Jesse2_34_01"); //Ich habe es geschafft. Jesse hat mir meinen ganzen alten Kram wiedergegeben.
	AI_Output(self, hero, "Info_Mod_Costa_Jesse2_34_02"); //Aber weil du fast den größten Anteil an meiner Flucht hattest, will ich dir meinen Gürtel schenken.

	B_GiveInvItems	(self, hero, ItBe_Addon_STR_10, 1);

	AI_Output(hero, self, "Info_Mod_Costa_Jesse2_15_03"); //Und was machst du nun gegen rutschende Hosen?
	AI_Output(self, hero, "Info_Mod_Costa_Jesse2_34_04"); //Ich hab neue bekommen! Da rutscht nichts mehr!
	AI_Output(hero, self, "Info_Mod_Costa_Jesse2_15_05"); //Dann mach's mal gut.

	B_GivePlayerXP	(50);
};

INSTANCE Info_Mod_Costa_Lagermusik (C_INFO)
{
	npc		= Mod_1442_BUD_Costa_MT;
	nr		= 1;
	condition	= Info_Mod_Costa_Lagermusik_Condition;
	information	= Info_Mod_Costa_Lagermusik_Info;
	permanent	= 0;
	important	= 0;
	description	= "Willst du bei Gravos Musikgruppe mitmachen?";
};

FUNC INT Info_Mod_Costa_Lagermusik_Condition()
{
	if (Mod_Gravo_Schatz == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Costa_Lagermusik_Info()
{
	AI_Output(hero, self, "Info_Mod_Costa_Lagermusik_15_00"); //Willst du bei Gravos Musikgruppe mitmachen?
	AI_Output(self, hero, "Info_Mod_Costa_Lagermusik_34_01"); //(abschätzig) Was der Musik nennt, hört meine Oma vielleicht gern. Ich brauch harte Sachen, Mann. Bei seiner Dudelmusik mach ich nicht mit. Keine Chance.
};

INSTANCE Info_Mod_Costa_WarumNichtWeg (C_INFO)
{
	npc		= Mod_1442_BUD_Costa_MT;
	nr		= 1;
	condition	= Info_Mod_Costa_WarumNichtWeg_Condition;
	information	= Info_Mod_Costa_WarumNichtWeg_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wieso versuchst du nicht trotzdem, aus dem Lager zu fliehen?";
};

FUNC INT Info_Mod_Costa_WarumNichtWeg_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Costa_NichtZufrieden))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Costa_WarumNichtWeg_Info()
{
	AI_Output(hero, self, "Info_Mod_Costa_WarumNichtWeg_15_00"); //Wieso versuchst du nicht trotzdem, aus dem Lager zu fliehen?
	AI_Output(self, hero, "Info_Mod_Costa_WarumNichtWeg_34_01"); //Ach, ich hab für so etwas einfach kein Händchen.
	AI_Output(self, hero, "Info_Mod_Costa_WarumNichtWeg_34_02"); //Wenn jemand das gut organisiert, in Ordnung, aber allein traue ich mich das nicht.
};

INSTANCE Info_Mod_Costa_Pickpocket (C_INFO)
{
	npc		= Mod_1442_BUD_Costa_MT;
	nr		= 1;
	condition	= Info_Mod_Costa_Pickpocket_Condition;
	information	= Info_Mod_Costa_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Costa_Pickpocket_Condition()
{
	C_Beklauen	(35, ItMi_Nugget, 2);
};

FUNC VOID Info_Mod_Costa_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Costa_Pickpocket);

	Info_AddChoice	(Info_Mod_Costa_Pickpocket, DIALOG_BACK, Info_Mod_Costa_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Costa_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Costa_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Costa_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Costa_Pickpocket);
};

FUNC VOID Info_Mod_Costa_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Costa_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Costa_Pickpocket);

		Info_AddChoice	(Info_Mod_Costa_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Costa_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Costa_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Costa_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Costa_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Costa_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Costa_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Costa_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Costa_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Costa_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Costa_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Costa_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Costa_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Costa_EXIT (C_INFO)
{
	npc		= Mod_1442_BUD_Costa_MT;
	nr		= 1;
	condition	= Info_Mod_Costa_EXIT_Condition;
	information	= Info_Mod_Costa_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Costa_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Costa_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};