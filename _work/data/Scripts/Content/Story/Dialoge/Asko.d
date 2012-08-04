INSTANCE Info_Mod_Asko_Trador (C_INFO)
{
	npc		= Mod_7355_VMG_Asko_TUG;
	nr		= 1;
	condition	= Info_Mod_Asko_Trador_Condition;
	information	= Info_Mod_Asko_Trador_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Asko_Trador_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Per_Trador))
	|| (Npc_KnowsInfo(hero, Info_Mod_Dever_Trador))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Asko_Trador_Info()
{
	AI_Output(self, hero, "Info_Mod_Asko_Trador_05_00"); //Hallo. Was gibt es?

	Info_ClearChoices	(Info_Mod_Asko_Trador);

	Info_AddChoice	(Info_Mod_Asko_Trador, "Du bist nicht tot? Dann habe ich hier nichts mehr verloren.", Info_Mod_Asko_Trador_B);
	Info_AddChoice	(Info_Mod_Asko_Trador, "Ein Verwandlungsmagier ist ermordet worden.", Info_Mod_Asko_Trador_A);
};

FUNC VOID Info_Mod_Asko_Trador_B()
{
	AI_Output(hero, self, "Info_Mod_Asko_Trador_B_15_00"); //Du bist nicht tot? Dann habe ich hier nichts mehr verloren.
	AI_Output(self, hero, "Info_Mod_Asko_Trador_B_05_01"); //(wütend) Was nimmst du dir heraus?

	Info_ClearChoices	(Info_Mod_Asko_Trador);

	Info_AddChoice	(Info_Mod_Asko_Trador, "Du kannst mir gar nichts. Ich werd' dann mal wieder.", Info_Mod_Asko_Trador_D);
	Info_AddChoice	(Info_Mod_Asko_Trador, "War nicht so gemeint, tut mir Leid.", Info_Mod_Asko_Trador_C);
};

FUNC VOID Info_Mod_Asko_Trador_A()
{
	AI_Output(hero, self, "Info_Mod_Asko_Trador_A_15_00"); //Ein Verwandlungsmagier ist ermordet worden, und ich soll herausfinden, wer das ist.
	AI_Output(self, hero, "Info_Mod_Asko_Trador_A_05_01"); //Das gibt es doch nicht! Und ich habe hier draußen nichts mitbekommen.
	AI_Output(self, hero, "Info_Mod_Asko_Trador_A_05_02"); //Aber warum suchst du 	mich dafür auf?
	AI_Output(hero, self, "Info_Mod_Asko_Trador_A_15_03"); //Ich muss schließlich nachsehen, wer verschwunden ist, und wer nur seit ein paar Tagen nicht im Dorf war.
	AI_Output(self, hero, "Info_Mod_Asko_Trador_A_05_04"); //Natürlich, das hätte ich wissen müssen. Mir ist nichts zugestoßen.
	AI_Output(hero, self, "Info_Mod_Asko_Trador_A_15_05"); //Okay, dann mache ich mich wieder auf den Weg.

	B_LogEntry	(TOPIC_MOD_FAICE_GIFT, "Asko lebt noch und studiert die Ruinen.");

	Info_ClearChoices	(Info_Mod_Asko_Trador);
};

FUNC VOID Info_Mod_Asko_Trador_D()
{
	AI_Output(hero, self, "Info_Mod_Asko_Trador_D_15_00"); //Du kannst mir gar nichts. Ich werd' dann mal wieder.
	AI_Output(self, hero, "Info_Mod_Asko_Trador_D_05_01"); //Du bleibst schön hier und erzählst mir was los ist!

	Info_Mod_Asko_Trador_A();
};

FUNC VOID Info_Mod_Asko_Trador_C()
{
	AI_Output(hero, self, "Info_Mod_Asko_Trador_C_15_00"); //War nicht so gemeint, tut mir Leid.

	Info_Mod_Asko_Trador_A();
};

INSTANCE Info_Mod_Asko_Per (C_INFO)
{
	npc		= Mod_7355_VMG_Asko_TUG;
	nr		= 1;
	condition	= Info_Mod_Asko_Per_Condition;
	information	= Info_Mod_Asko_Per_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich soll dir noch von Per ausrichten, dass er ein Päckchen für dich oben im Dorf hat.";
};

FUNC INT Info_Mod_Asko_Per_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Per_Trador))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Asko_Per_Info()
{
	AI_Output(hero, self, "Info_Mod_Asko_Per_15_00"); //Ich soll dir noch von Per ausrichten, dass er ein Päckchen für dich oben im Dorf hat.
	AI_Output(self, hero, "Info_Mod_Asko_Per_05_01"); //Danke für die Information. Ich werde mich gleich auf den Weg machen.

	B_LogEntry	(TOPIC_MOD_PER_ASKO, "Ich habe Asko davon in Kenntis gesetzt, dass Per ein Paket für ihn hat.");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Asko_Pruefung (C_INFO)
{
	npc		= Mod_7355_VMG_Asko_TUG;
	nr		= 1;
	condition	= Info_Mod_Asko_Pruefung_Condition;
	information	= Info_Mod_Asko_Pruefung_Info;
	permanent	= 1;
	important	= 0;
	description	= "Genn schickt mich. Es geht um die Prüfung der Verwandlungsmagier.";
};

FUNC INT Info_Mod_Asko_Pruefung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Genn_Pruefung2))
	&& (Mod_VMG_Pruefung == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Asko_Pruefung_Info()
{
	AI_Output(hero, self, "Info_Mod_Asko_Pruefung_15_00"); //Genn schickt mich. Es geht um die Prüfung der Verwandlungsmagier.
	AI_Output(self, hero, "Info_Mod_Asko_Pruefung_05_01"); //Ich bin schon darüber informiert worden. Die Aufgabe wird nicht einfach.
	AI_Output(self, hero, "Info_Mod_Asko_Pruefung_05_02"); //Bist du bereit sie zu erfahren?

	Info_ClearChoices	(Info_Mod_Asko_Pruefung);

	Info_AddChoice	(Info_Mod_Asko_Pruefung, "Ich muss noch etwas erledigen.", Info_Mod_Asko_Pruefung_B);
	Info_AddChoice	(Info_Mod_Asko_Pruefung, "Ich bin bereit.", Info_Mod_Asko_Pruefung_A);
};

FUNC VOID Info_Mod_Asko_Pruefung_B()
{
	AI_Output(hero, self, "Info_Mod_Asko_Pruefung_B_15_00"); //Ich muss noch etwas erledigen.
	AI_Output(self, hero, "Info_Mod_Asko_Pruefung_B_05_01"); //Komme wieder, wenn du bereit bist.

	Info_ClearChoices	(Info_Mod_Asko_Pruefung);
};

FUNC VOID Info_Mod_Asko_Pruefung_A()
{
	AI_Output(hero, self, "Info_Mod_Asko_Pruefung_A_15_00"); //Ich bin bereit.
	AI_Output(self, hero, "Info_Mod_Asko_Pruefung_A_05_01"); //Okay, hier ist deine Aufgabe: Vor kurzem ist ein Wolfsrudel zu uns ins Tal gekommen.
	AI_Output(self, hero, "Info_Mod_Asko_Pruefung_A_05_02"); //Es hat sich beim Steinkreis niedergelassen und jagt dort seine Beute.
	AI_Output(self, hero, "Info_Mod_Asko_Pruefung_A_05_03"); //Das ist gar nicht gut, denn 	wir Leben hier im Einklang mit der Natur und sie bittet uns, das Rudel zu vertreiben.
	AI_Output(self, hero, "Info_Mod_Asko_Pruefung_A_05_04"); //Und genau das wird deine Aufgabe sein.
	AI_Output(hero, self, "Info_Mod_Asko_Pruefung_A_15_05"); //Wie soll ich das anstellen?
	AI_Output(self, hero, "Info_Mod_Asko_Pruefung_A_05_06"); //Ich gebe dir eine Spruchrolle, mit deren Hilfe du dich in einen Warg verwandeln kannst.
	AI_Output(self, hero, "Info_Mod_Asko_Pruefung_A_05_07"); //Benutze sie aber nur abseits von Menschen, da sie dich sonst für ein wildes Tief halten könnten.
	AI_Output(self, hero, "Info_Mod_Asko_Pruefung_A_05_08"); //Begib dich dann zu dem Rudel und versuche, den Leitwolf zu überzeugen, ein anderes Jagdgebiet aufzusuchen.
	AI_Output(self, hero, "Info_Mod_Asko_Pruefung_A_05_09"); //Versuche auf jeden Fall zu vermeiden, dass die Wölfe zu schaden kommen!
	AI_Output(self, hero, "Info_Mod_Asko_Pruefung_A_05_10"); //Ansonsten kann ich die Aufgabe eigentlich nicht als erfüllt ansehen.
	AI_Output(hero, self, "Info_Mod_Asko_Pruefung_A_15_11"); //Eigentlich?
	AI_Output(self, hero, "Info_Mod_Asko_Pruefung_A_05_12"); //Töten ist nicht unsere Art. Es ist nur die äußerste Notlösung! Behalte das im Hinterkopf.
	AI_Output(hero, self, "Info_Mod_Asko_Pruefung_A_15_13"); //Gut, dann werde ich mich mal auf den Weg machen.
	AI_Output(self, hero, "Info_Mod_Asko_Pruefung_A_05_14"); //Okay. Hier ist die Spruchrolle. Pass auf dich auf.

	B_GiveInvItems	(self, hero, ItSc_TrfWarg, 1);

	Mod_VMG_Pruefung = 2;

	B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Mit Hilfe der Verwandlung zum Warg soll ich ein Rudel in der Nähe des Steinkreises davon überzeugen, das Tal zu verlassen, damit die Natur hier nicht zu Schaden kommt. Das Töten des Rudels soll ich nach Möglichkeit vermeiden.");

	Info_ClearChoices	(Info_Mod_Asko_Pruefung);

	Wld_InsertNpc	(Monster_11060_Leitwolf_TUG,	"TUG_86");
	Wld_InsertNpc	(Monster_11061_Wolf_TUG,	"TUG_86");
	Wld_InsertNpc	(Monster_11062_Wolf_TUG,	"TUG_86");
	Wld_InsertNpc	(Monster_11063_Wolf_TUG,	"TUG_86");
	Wld_InsertNpc	(Monster_11064_Wolf_TUG,	"TUG_86");
	Wld_InsertNpc	(Monster_11065_Wolf_TUG,	"TUG_86");
};

INSTANCE Info_Mod_Asko_Pruefung2 (C_INFO)
{
	npc		= Mod_7355_VMG_Asko_TUG;
	nr		= 1;
	condition	= Info_Mod_Asko_Pruefung2_Condition;
	information	= Info_Mod_Asko_Pruefung2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich musste Fleisch besorgen und brauche nun eine neue Verwandlungsrolle.";
};

FUNC INT Info_Mod_Asko_Pruefung2_Condition()
{
	if (Mod_VMG_Pruefung_Leitwolf == 2)
	&& (Npc_HasItems(hero, ItFo_MuttonRaw) >= 20)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Asko_Pruefung2_Info()
{
	AI_Output(hero, self, "Info_Mod_Asko_Pruefung2_15_00"); //Ich musste Fleisch besorgen und brauche nun eine neue Verwandlungsrolle.
	AI_Output(self, hero, "Info_Mod_Asko_Pruefung2_05_01"); //Okay, hier hast du eine.

	B_GiveInvItems	(self, hero, ItSc_TrfWarg, 1);
};

INSTANCE Info_Mod_Asko_Pruefung3 (C_INFO)
{
	npc		= Mod_7355_VMG_Asko_TUG;
	nr		= 1;
	condition	= Info_Mod_Asko_Pruefung3_Condition;
	information	= Info_Mod_Asko_Pruefung3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Da bin ich wieder.";
};

FUNC INT Info_Mod_Asko_Pruefung3_Condition()
{
	if (Mod_VMG_Pruefung == 2)
	&& ((Mod_VMG_Pruefung_Leitwolf == 3)
	|| ((Npc_IsDead(Monster_11060_Leitwolf_TUG))
	&& (Npc_IsDead(Monster_11061_Wolf_TUG))
	&& (Npc_IsDead(Monster_11062_Wolf_TUG))
	&& (Npc_IsDead(Monster_11063_Wolf_TUG))
	&& (Npc_IsDead(Monster_11064_Wolf_TUG))
	&& (Npc_IsDead(Monster_11065_Wolf_TUG))))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Asko_Pruefung3_Info()
{
	AI_Output(hero, self, "Info_Mod_Asko_Pruefung3_15_00"); //Da bin ich wieder.
	AI_Output(self, hero, "Info_Mod_Asko_Pruefung3_05_01"); //Und? Wie ist es gelaufen?

	if (Mod_VMG_Pruefung_Leitwolf == 3)
	{
		AI_Output(hero, self, "Info_Mod_Asko_Pruefung3_15_02"); //Die Wölfe werden sich nicht mehr blicken lassen.
		AI_Output(self, hero, "Info_Mod_Asko_Pruefung3_05_03"); //Das hast du gut gemacht, ich werde eine Empfehlung für dich aussprechen.
		AI_Output(self, hero, "Info_Mod_Asko_Pruefung3_05_04"); //Triff dich nun mit Per, er stellt dir die letzte Aufgabe. Für dich sollte sie kein Problem darstellen.

		Mod_VMG_Pruefung_Asko = 1;
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Asko_Pruefung3_15_05"); //Ich musste das Rudel töten. Der Leitwolf hat mir keine andere Wahl gelassen.

		Mod_VMG_Pruefung_Asko = 2;

		if (Mod_VMG_Pruefung_Genn == 1)
		{
			AI_Output(self, hero, "Info_Mod_Asko_Pruefung3_05_06"); //Da du dich schon bei der vorigen Aufgabe angestrengt und so viel für uns getan hast, werde ich ein Auge zudrücken.
			AI_Output(self, hero, "Info_Mod_Asko_Pruefung3_05_07"); //Du darfst aber weiterhin nicht scheitern. Hast du das verstanden?
			AI_Output(hero, self, "Info_Mod_Asko_Pruefung3_15_08"); //Klar und deutlich. Was ist jetzt zu tun?
		}
		else
		{
			AI_Output(self, hero, "Info_Mod_Asko_Pruefung3_05_09"); //Hm, Genns Aufgabe hast du auch nicht zu seiner Zufriedenheit gelöst. Das ist heikel.
			AI_Output(self, hero, "Info_Mod_Asko_Pruefung3_05_10"); //Ich kann dich nur unter einer Bedingung weiter lassen.
			AI_Output(hero, self, "Info_Mod_Asko_Pruefung3_15_11"); //Und die wäre?
			AI_Output(self, hero, "Info_Mod_Asko_Pruefung3_05_12"); //Du musst auf deine Belohnung verzichten.
			AI_Output(hero, self, "Info_Mod_Asko_Pruefung3_15_13"); //Das ist nicht dein Ernst.
			AI_Output(self, hero, "Info_Mod_Asko_Pruefung3_05_14"); //Mein voller Ernst. Entweder du verzichtest, oder du kommst nicht weiter.
			AI_Output(hero, self, "Info_Mod_Asko_Pruefung3_15_15"); //Dann habe ich wohl keine andere Wahl. Lass mich weitermachen.
		};

		AI_Output(self, hero, "Info_Mod_Asko_Pruefung3_05_16"); //Triff dich nun mit Per, er stellt dir die letzte Aufgabe.
	};

	AI_Output(hero, self, "Info_Mod_Asko_Pruefung3_15_17"); //Wie sieht es mit einer Belohnung aus?
	AI_Output(self, hero, "Info_Mod_Asko_Pruefung3_05_18"); //Die bekommst du erst, wenn du alle drei Aufgaben erledigt hast.
	AI_Output(hero, self, "Info_Mod_Asko_Pruefung3_15_19"); //War ja klar. Wir sehen uns.
	AI_Output(self, hero, "Info_Mod_Asko_Pruefung3_05_20"); //Ich wünsch' dir viel Erfolg bei der letzten Aufgabe.

	B_RemoveNpc	(Monster_11060_Leitwolf_TUG);
	B_RemoveNpc	(Monster_11061_Wolf_TUG);
	B_RemoveNpc	(Monster_11062_Wolf_TUG);
	B_RemoveNpc	(Monster_11063_Wolf_TUG);
	B_RemoveNpc	(Monster_11064_Wolf_TUG);
	B_RemoveNpc	(Monster_11065_Wolf_TUG);

	B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Diese Aufgabe wäre erledigt. Ich soll mich jetzt bei Per melden. Er wird mir meine letzte Aufgabe stellen.");
};

INSTANCE Info_Mod_Asko_Pickpocket (C_INFO)
{
	npc		= Mod_7355_VMG_Asko_TUG;
	nr		= 1;
	condition	= Info_Mod_Asko_Pickpocket_Condition;
	information	= Info_Mod_Asko_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Asko_Pickpocket_Condition()
{
	C_Beklauen	(58, ItPo_Health_01, 5);
};

FUNC VOID Info_Mod_Asko_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Asko_Pickpocket);

	Info_AddChoice	(Info_Mod_Asko_Pickpocket, DIALOG_BACK, Info_Mod_Asko_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Asko_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Asko_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Asko_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Asko_Pickpocket);
};

FUNC VOID Info_Mod_Asko_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Asko_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Asko_Pickpocket);

		Info_AddChoice	(Info_Mod_Asko_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Asko_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Asko_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Asko_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Asko_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Asko_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Asko_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Asko_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Asko_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Asko_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Asko_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Asko_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Asko_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Asko_EXIT (C_INFO)
{
	npc		= Mod_7355_VMG_Asko_TUG;
	nr		= 1;
	condition	= Info_Mod_Asko_EXIT_Condition;
	information	= Info_Mod_Asko_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Asko_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Asko_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};