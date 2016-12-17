INSTANCE Info_Mod_Thilo_Hi (C_INFO)
{
	npc		= Mod_1938_Thilo_NONE_NW;
	nr		= 1;
	condition	= Info_Mod_Thilo_Hi_Condition;
	information	= Info_Mod_Thilo_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Thilo_Hi_Condition()
{
	if (Mod_WilfriedsQuest == 0)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Wilfried_HabBeutel))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Thilo_Wilfried))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thilo_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Thilo_Hi_01_01"); //(abweisend) Lass mich in Ruhe, es gibt nichts, worüber ich mit dir reden möchte.
};

INSTANCE Info_Mod_Thilo_Wilfried (C_INFO)
{
	npc		= Mod_1938_Thilo_NONE_NW;
	nr		= 1;
	condition	= Info_Mod_Thilo_Wilfried_Condition;
	information	= Info_Mod_Thilo_Wilfried_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thilo_Wilfried_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wilfried_HabBeutel))
	&& (Mod_WilfriedsQuest == 1)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thilo_Wilfried_Info()
{
	AI_Output(self, hero, "Info_Mod_Thilo_Wilfried_01_00"); //(abweisend) Lass mich in Ruhe, es gibt nichts, worüber ich mit dir reden möchte.
	AI_Output(hero, self, "Info_Mod_Thilo_Wilfried_15_01"); //Du bist der Dieb von Wilfrieds Geldbeutel!
	AI_Output(self, hero, "Info_Mod_Thilo_Wilfried_01_02"); //(kühl) Wer behauptet das?

	Info_ClearChoices	(Info_Mod_Thilo_Wilfried);

	Info_AddChoice	(Info_Mod_Thilo_Wilfried, "Wilfried hat es mir verraten.", Info_Mod_Thilo_Wilfried_Wilfried);
	Info_AddChoice	(Info_Mod_Thilo_Wilfried, "Der Name tut nichts zur Sache.", Info_Mod_Thilo_Wilfried_Egal);
};

FUNC VOID Info_Mod_Thilo_Wilfried_Egal()
{
	AI_Output(hero, self, "Info_Mod_Thilo_Wilfried_Egal_15_00"); //Der Name tut nichts zur Sache.
	AI_Output(self, hero, "Info_Mod_Thilo_Wilfried_Egal_01_01"); //So? Ich wüsste nicht, dass ich einen Diebstahl begangen habe. Oder meinst du etwa, Beweise zu haben?

	Info_ClearChoices	(Info_Mod_Thilo_Wilfried);

	Info_AddChoice	(Info_Mod_Thilo_Wilfried, "Wilfried hat es mir verraten.", Info_Mod_Thilo_Wilfried_Wilfried);
};

FUNC VOID Info_Mod_Thilo_Wilfried_Wilfried()
{
	AI_Output(hero, self, "Info_Mod_Thilo_Wilfried_Wilfried_15_00"); //Wilfried hat es mir verraten.
	AI_Output(self, hero, "Info_Mod_Thilo_Wilfried_Wilfried_01_01"); //(erregt) Dieser elende Schuft! Ich werde es nicht länger verheimlichen! Du!

	Info_ClearChoices	(Info_Mod_Thilo_Wilfried);

	Info_AddChoice	(Info_Mod_Thilo_Wilfried, "Nein!", Info_Mod_Thilo_Wilfried_Nein);
	Info_AddChoice	(Info_Mod_Thilo_Wilfried, "Ja?", Info_Mod_Thilo_Wilfried_Ja);
};

FUNC VOID Info_Mod_Thilo_Wilfried_Nein()
{
	AI_Output(hero, self, "Info_Mod_Thilo_Wilfried_Nein_15_00"); //Nein!
	AI_Output(self, hero, "Info_Mod_Thilo_Wilfried_Nein_01_01"); //Du willst mich nicht anhören? (verächtlich) Kriech nur zurück zu Wilfried, mir kannst du ja doch nichts nachweisen!

	Info_ClearChoices	(Info_Mod_Thilo_Wilfried);

	Info_AddChoice	(Info_Mod_Thilo_Wilfried, "ENDE", Info_Mod_Thilo_Wilfried_EXIT);
	Info_AddChoice	(Info_Mod_Thilo_Wilfried, "Erzähl schon.", Info_Mod_Thilo_Wilfried_Tell);
};

FUNC VOID Info_Mod_Thilo_Wilfried_EXIT()
{
	Info_ClearChoices	(Info_Mod_Thilo_Wilfried);

	B_SetTopicStatus	(TOPIC_MOD_WILFRIED_GOLD, LOG_FAILED);
};

FUNC VOID Info_Mod_Thilo_Wilfried_Ja()
{
	AI_Output(hero, self, "Info_Mod_Thilo_Wilfried_Ja_15_00"); //Ja?
	AI_Output(self, hero, "Info_Mod_Thilo_Wilfried_Ja_01_01"); //Du wirst der Erste sein, der die Wahrheit erfährt! Und zwar die ganze Geschichte!

	Info_ClearChoices	(Info_Mod_Thilo_Wilfried);

	Info_AddChoice	(Info_Mod_Thilo_Wilfried, "Erzähl schon.", Info_Mod_Thilo_Wilfried_Tell);
};

FUNC VOID Info_Mod_Thilo_Wilfried_Tell()
{
	AI_Output(hero, self, "Info_Mod_Thilo_Wilfried_Tell_15_00"); //Erzähl schon.
	AI_Output(self, hero, "Info_Mod_Thilo_Wilfried_Tell_01_01"); //Wie du sicher weißt, verkauft Wilfried seltene und wertvolle Schmuckstücke. Zum Geburtstag wollte ich meiner Liebsten ein teures Amulett schenken, und so ging ich zu ihm und ließ mich von ihm beraten.
	AI_Output(self, hero, "Info_Mod_Thilo_Wilfried_Tell_01_02"); //Er zeigte mir Zeichnungen von Amuletten, die er nicht bei sich hatte, aber von denen er angeblich wusste, wo er sie beschaffen konnte, und ich entschied mich für eines von diesen.
	AI_Output(self, hero, "Info_Mod_Thilo_Wilfried_Tell_01_03"); //Das Gold musste ich auf der Stelle bezahlen, und das Amulett sollte ich eine Woche später abholen.
	AI_Output(self, hero, "Info_Mod_Thilo_Wilfried_Tell_01_04"); //Als ich nach der verabredeten Zeit kam, gab Wilfried plötzlich vor, dass ich gar keine Bestellung aufgegeben hätte und setzte mich vor die Tür.
	AI_Output(hero, self, "Info_Mod_Thilo_Wilfried_Tell_15_05"); //Habt ihr eure Abmachung nicht schriftlich festgehalten?
	AI_Output(self, hero, "Info_Mod_Thilo_Wilfried_Tell_01_06"); //Das ist ja der Knackpunkt! Darüber hatte ich gar nicht nachgedacht, schließlich kann man den meisten Menschen vertrauen - dachte ich jedenfalls. So hatte ich aber nichts gegen Wilfried in der Hand, keine Beweise, gar nichts. Ich konnte ihm nichts anhängen.
	AI_Output(hero, self, "Info_Mod_Thilo_Wilfried_Tell_15_07"); //Aber das Gold wolltest du trotzdem zurück haben...
	AI_Output(self, hero, "Info_Mod_Thilo_Wilfried_Tell_01_08"); //(niedergeschlagen) Ja, das stimmt. Ich weiß, dass es nicht vollkommen korrekt war,...
	AI_Output(hero, self, "Info_Mod_Thilo_Wilfried_Tell_15_09"); //(ironisch) Das ist leicht untertrieben...
	AI_Output(self, hero, "Info_Mod_Thilo_Wilfried_Tell_01_10"); //... aber ich sah keine andere Möglichkeit, wieder an mein Gold zu kommen. Ich habe lediglich eine Ungerechtigkeit ausgeglichen.

	Info_ClearChoices	(Info_Mod_Thilo_Wilfried);

	Info_AddChoice	(Info_Mod_Thilo_Wilfried, "Ich werde dich jetzt schön verpfeifen...", Info_Mod_Thilo_Wilfried_Verpfeifen);
	Info_AddChoice	(Info_Mod_Thilo_Wilfried, "Und was sollen wir jetzt machen?", Info_Mod_Thilo_Wilfried_WasJetzt);
};

FUNC VOID Info_Mod_Thilo_Wilfried_Verpfeifen()
{
	AI_Output(hero, self, "Info_Mod_Thilo_Wilfried_Verpfeifen_15_00"); //Ich werde dich jetzt schön verpfeifen...
	AI_Output(self, hero, "Info_Mod_Thilo_Wilfried_Verpfeifen_01_01"); //(ungläubig) Was??? Siehst du nicht die Ungerechtigkeit?

	Info_ClearChoices	(Info_Mod_Thilo_Wilfried);

	Info_AddChoice	(Info_Mod_Thilo_Wilfried, "Und was sollen wir jetzt machen?", Info_Mod_Thilo_Wilfried_WasJetzt);
};

FUNC VOID Info_Mod_Thilo_Wilfried_WasJetzt()
{
	AI_Output(hero, self, "Info_Mod_Thilo_Wilfried_WasJetzt_15_00"); //Und was sollen wir jetzt machen?
	AI_Output(self, hero, "Info_Mod_Thilo_Wilfried_WasJetzt_01_01"); //Ich bin sicher, dass ich nicht das einzige Opfer von Wilfried bin. Wir müssen ihm das Handwerk legen, aber das geht nur mit mehr Unterstützung.
	AI_Output(self, hero, "Info_Mod_Thilo_Wilfried_WasJetzt_01_02"); //Ich würde vorschlagen, du fragst in der näheren Umgebung, ob jemandem schon Ähnliches widerfahren ist.
	AI_Output(self, hero, "Info_Mod_Thilo_Wilfried_WasJetzt_01_03"); //Vielleicht gelingt es uns so, Beweismaterial oder wenigstens Verbündete zu gewinnen.
	AI_Output(hero, self, "Info_Mod_Thilo_Wilfried_WasJetzt_15_04"); //Wird erledigt.

	B_LogEntry	(TOPIC_MOD_WILFRIED_GOLD, "Thilo ist tatsächlich der Dieb, allerdings beschuldigt er seinerseits Wilfried, dass der ihm das Gold vorher durch einen Trick entwendet habe. Nun soll ich sehen, ob es weitere Opfer von Wilfried in seiner näheren Umgebung gibt, sodass sich eine Anklage lohnen würde.");

	Mod_WilfriedsQuest = 2;

	Info_ClearChoices	(Info_Mod_Thilo_Wilfried);
};

INSTANCE Info_Mod_Thilo_Partner (C_INFO)
{
	npc		= Mod_1938_Thilo_NONE_NW;
	nr		= 1;
	condition	= Info_Mod_Thilo_Partner_Condition;
	information	= Info_Mod_Thilo_Partner_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thilo_Partner_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thilo_Wilfried))
	&& ((Mod_WilfriedsQuest == 3)
	|| (Mod_WilfriedsQuest == 4)
	|| (Mod_WilfriedsQuest == 5))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thilo_Partner_Info()
{
	AI_Output(self, hero, "Info_Mod_Thilo_Partner_01_00"); //Hast du Neuigkeiten?
	AI_Output(hero, self, "Info_Mod_Thilo_Partner_15_01"); //Ich habe Verbündete gefunden.
	AI_Output(self, hero, "Info_Mod_Thilo_Partner_01_02"); //(erfreut) Gut! Damit sollte es uns gelingen, Wilfried zu stellen. Willst du ihm den Besuch abstatten?
	AI_Output(hero, self, "Info_Mod_Thilo_Partner_15_03"); //Von mir aus.
	AI_Output(self, hero, "Info_Mod_Thilo_Partner_01_04"); //Wenn du fertig bist, sag Bescheid, wie es gelaufen ist.
};

INSTANCE Info_Mod_Thilo_WilfriedWeg (C_INFO)
{
	npc		= Mod_1938_Thilo_NONE_NW;
	nr		= 1;
	condition	= Info_Mod_Thilo_WilfriedWeg_Condition;
	information	= Info_Mod_Thilo_WilfriedWeg_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wilfried ist weg.";
};

FUNC INT Info_Mod_Thilo_WilfriedWeg_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thilo_Partner))
	&& ((Mod_WilfriedsQuest == 4)
	|| (Mod_WilfriedsQuest == 5))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thilo_WilfriedWeg_Info()
{
	AI_Output(hero, self, "Info_Mod_Thilo_WilfriedWeg_15_00"); //Wilfried ist weg.
	AI_Output(self, hero, "Info_Mod_Thilo_WilfriedWeg_01_01"); //(schockiert) Nein! (Pause, überlegt) Er muss von unseren Bemühungen Wind bekommen haben.
	AI_Output(hero, self, "Info_Mod_Thilo_WilfriedWeg_15_02"); //Was können wir jetzt machen?
	AI_Output(self, hero, "Info_Mod_Thilo_WilfriedWeg_01_03"); //Vielleicht gibt es irgendwo Hinweise zu seinem Verbleib. Am besten suchst du das Haus von Wilfried mal gründlich ab, und ich frage in der Gegend herum.

	Mob_CreateItems	("WILFRIEDSTRUHE", WilfriedsTagebuchseite, 1);
};

INSTANCE Info_Mod_Thilo_Tagebuchseite (C_INFO)
{
	npc		= Mod_1938_Thilo_NONE_NW;
	nr		= 1;
	condition	= Info_Mod_Thilo_Tagebuchseite_Condition;
	information	= Info_Mod_Thilo_Tagebuchseite_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thilo_Tagebuchseite_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thilo_WilfriedWeg))
	&& (Mod_WilfriedsQuest == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thilo_Tagebuchseite_Info()
{
	AI_Output(hero, self, "Info_Mod_Thilo_Tagebuchseite_15_00"); //Ich habe eine aufschlussreiche Tagebuchseite gefunden.
	AI_Output(self, hero, "Info_Mod_Thilo_Tagebuchseite_01_01"); //Was steht darauf?
	AI_Output(hero, self, "Info_Mod_Thilo_Tagebuchseite_15_02"); //Wilfried hat eine Höhle vor der Stadt entdeckt.
	AI_Output(self, hero, "Info_Mod_Thilo_Tagebuchseite_01_03"); //Schön, dann würde ich sagen, dass du mal schaust, ob du sie finden kannst. (beschämt) Ich kann nämlich leider gerade nicht weg ... eine wichtige Verabredung ...
	AI_Output(hero, self, "Info_Mod_Thilo_Tagebuchseite_15_04"); //Du hast Angst?
	AI_Output(self, hero, "Info_Mod_Thilo_Tagebuchseite_01_05"); //Das würde ich nicht so sagen, eher Respekt. Du machst das schon. Bis dann.
};

INSTANCE Info_Mod_Thilo_WilfriedTot (C_INFO)
{
	npc		= Mod_1938_Thilo_NONE_NW;
	nr		= 1;
	condition	= Info_Mod_Thilo_WilfriedTot_Condition;
	information	= Info_Mod_Thilo_WilfriedTot_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thilo_WilfriedTot_Condition()
{
	if (Mod_WilfriedsQuest == 8)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thilo_WilfriedTot_Info()
{
	AI_Output(self, hero, "Info_Mod_Thilo_WilfriedTot_01_00"); //Ich habe schon gehört, du hast Wilfried bestraft. Eine drastische Maßnahme, aber dein Schaden soll es nicht sein.
	AI_Output(self, hero, "Info_Mod_Thilo_WilfriedTot_01_01"); //Vielen Dank für deine Hilfe. Man sieht sich.

	CreateInvItems	(self, ItMi_Gold, 50);
	B_GiveInvItems	(self, hero, ItMi_Gold, 50);
};

INSTANCE Info_Mod_Thilo_Pickpocket (C_INFO)
{
	npc		= Mod_1938_Thilo_NONE_NW;
	nr		= 1;
	condition	= Info_Mod_Thilo_Pickpocket_Condition;
	information	= Info_Mod_Thilo_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_30;
};

FUNC INT Info_Mod_Thilo_Pickpocket_Condition()
{
	C_Beklauen	(20, ItMi_Gold, 15);
};

FUNC VOID Info_Mod_Thilo_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Thilo_Pickpocket);

	Info_AddChoice	(Info_Mod_Thilo_Pickpocket, DIALOG_BACK, Info_Mod_Thilo_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Thilo_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Thilo_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Thilo_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Thilo_Pickpocket);
};

FUNC VOID Info_Mod_Thilo_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Thilo_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Thilo_Pickpocket);

		Info_AddChoice	(Info_Mod_Thilo_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Thilo_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Thilo_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Thilo_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Thilo_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Thilo_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Thilo_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Thilo_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Thilo_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Thilo_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Thilo_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Thilo_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Thilo_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Thilo_EXIT (C_INFO)
{
	npc		= Mod_1938_Thilo_NONE_NW;
	nr		= 1;
	condition	= Info_Mod_Thilo_EXIT_Condition;
	information	= Info_Mod_Thilo_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Thilo_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Thilo_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};