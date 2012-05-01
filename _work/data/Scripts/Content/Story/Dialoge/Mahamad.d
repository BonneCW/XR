INSTANCE Info_Mod_Mahamad_Hi (C_INFO)
{
	npc		= Mod_7150_ASS_Mahamad_NW;
	nr		= 1;
	condition	= Info_Mod_Mahamad_Hi_Condition;
	information	= Info_Mod_Mahamad_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bei Beliar! Ich bin aber gefragt hier.";
};

FUNC INT Info_Mod_Mahamad_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Malek_Manaextrakt))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mahamad_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Hi_15_00"); //Bei Beliar! Ich bin aber gefragt hier.
	AI_Output(self, hero, "Info_Mod_Mahamad_Hi_01_01"); //Zu recht, wie mir scheint. Scheinst fähiger zu sein, als die anderen Gauner.
	AI_Output(hero, self, "Info_Mod_Mahamad_Hi_15_02"); //Ich fühle mich auch schon wie ein Obergauner. Du brauchst mich?
	AI_Output(self, hero, "Info_Mod_Mahamad_Hi_01_03"); //Eigentlich nicht. Aber du brauchst mich und meine Stimme.
	AI_Output(hero, self, "Info_Mod_Mahamad_Hi_15_04"); //Wohl wahr. Was muss ich dafür tun?
	AI_Output(self, hero, "Info_Mod_Mahamad_Hi_01_05"); //Von einem Magier wird eine gewisse geistige Reife und Intelligenz erwartet.
	AI_Output(self, hero, "Info_Mod_Mahamad_Hi_01_06"); //Meine Aufgabe ist es, zu testen, ob bei dir zumindest Ansätze vorhanden sind, damit du diese Anforderungen erreichen kannst.
	AI_Output(hero, self, "Info_Mod_Mahamad_Hi_15_07"); //Ich denke mal, ich bin nicht auf den Kopf gefallen.
	AI_Output(self, hero, "Info_Mod_Mahamad_Hi_01_08"); //Das werden wir sehen. Du wirst einige Rätsel lösen und Fragen beantworten müssen. Kannst du eigentlich lesen?
	AI_Output(hero, self, "Info_Mod_Mahamad_Hi_15_09"); //Das will ich meinen. Wir können anfangen.
	AI_Output(self, hero, "Info_Mod_Mahamad_Hi_01_10"); //Nun gut. Hier hast du vier Zettel. Finde die Antworten und komme zu mir.

	CreateInvItems	(hero, ItWr_MahamadRaetsel1, 1);
	CreateInvItems	(hero, ItWr_MahamadRaetsel2, 1);
	CreateInvItems	(hero, ItWr_MahamadRaetsel3, 1);
	CreateInvItems	(hero, ItWr_MahamadRaetsel4, 1);

	B_ShowGivenThings	("4 Zettel erhalten");

	Log_CreateTopic	(TOPIC_MOD_ASS_SCHLAUFUCHS, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_SCHLAUFUCHS, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ASS_SCHLAUFUCHS, "Mahamad will meine Intelligenz auf die Probe stellen. Dazu hat er mir vier Zettel mit Rätsel gegeben.");
};

INSTANCE Info_Mod_Mahamad_Schlaufuchs (C_INFO)
{
	npc		= Mod_7150_ASS_Mahamad_NW;
	nr		= 1;
	condition	= Info_Mod_Mahamad_Schlaufuchs_Condition;
	information	= Info_Mod_Mahamad_Schlaufuchs_Info;
	permanent	= 1;
	important	= 0;
	description	= "Du kannst mich testen.";
};

FUNC INT Info_Mod_Mahamad_Schlaufuchs_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mahamad_Hi))
	&& (Mod_ASS_MahamadRaetsel == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_Info()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_15_00"); //Du kannst mich testen.
	AI_Output(self, hero, "Info_Mod_Mahamad_Schlaufuchs_01_01"); //Du hast alles gut verstanden?
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_15_02"); //Ja.
	AI_Output(self, hero, "Info_Mod_Mahamad_Schlaufuchs_01_03"); //Dann möchte ich wissen, wieviel der Spitzenwein kostet.

	Mod_ASS_MahamadRaetsel_Niete = 0;

	Info_ClearChoices	(Info_Mod_Mahamad_Schlaufuchs);

	Info_AddChoice	(Info_Mod_Mahamad_Schlaufuchs, "Ich habe 200 Gold gerechnet.", Info_Mod_Mahamad_Schlaufuchs_C);
	Info_AddChoice	(Info_Mod_Mahamad_Schlaufuchs, "Ich habe 175 Gold gerechnet.", Info_Mod_Mahamad_Schlaufuchs_B);
	Info_AddChoice	(Info_Mod_Mahamad_Schlaufuchs, "Ich habe 150 Gold gerechnet.", Info_Mod_Mahamad_Schlaufuchs_A);
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_D()
{
	AI_Output(self, hero, "Info_Mod_Mahamad_Schlaufuchs_D_01_00"); //Und wieviele Dreiecke hast du gezählt?

	Info_ClearChoices	(Info_Mod_Mahamad_Schlaufuchs);

	Info_AddChoice	(Info_Mod_Mahamad_Schlaufuchs, "Ich denke, es sind 35 Dreiecke.", Info_Mod_Mahamad_Schlaufuchs_G);
	Info_AddChoice	(Info_Mod_Mahamad_Schlaufuchs, "Ich denke, es sind 25 Dreiecke.", Info_Mod_Mahamad_Schlaufuchs_F);
	Info_AddChoice	(Info_Mod_Mahamad_Schlaufuchs, "Ich denke, es sind 20 Dreiecke.", Info_Mod_Mahamad_Schlaufuchs_E);
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_C()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_C_15_00"); //Ich habe 200 Gold gerechnet.

	Mod_ASS_MahamadRaetsel_Niete += 1;

	Info_Mod_Mahamad_Schlaufuchs_D();
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_B()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_B_15_00"); //Ich habe 175 Gold gerechnet.

	Mod_ASS_MahamadRaetsel_Niete += 1;

	Info_Mod_Mahamad_Schlaufuchs_D();
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_A()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_A_15_00"); //Ich habe 150 Gold gerechnet.

	Info_Mod_Mahamad_Schlaufuchs_D();
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_H()
{
	AI_Output(self, hero, "Info_Mod_Mahamad_Schlaufuchs_H_01_00"); //Aha. Was ist mit den Zahlenreihen?

	Info_ClearChoices	(Info_Mod_Mahamad_Schlaufuchs);

	Info_AddChoice	(Info_Mod_Mahamad_Schlaufuchs, "War etwas schwierig. Ich hab für oben 7 4 und unten 14 16 raus.", Info_Mod_Mahamad_Schlaufuchs_K);
	Info_AddChoice	(Info_Mod_Mahamad_Schlaufuchs, "War etwas schwierig. Ich hab für oben 6 3 und unten 15 17 raus.", Info_Mod_Mahamad_Schlaufuchs_J);
	Info_AddChoice	(Info_Mod_Mahamad_Schlaufuchs, "War etwas schwierig. Ich hab für oben 5 2 und unten 17 19 raus.", Info_Mod_Mahamad_Schlaufuchs_I);
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_M()
{
	AI_Output(self, hero, "Info_Mod_Mahamad_Schlaufuchs_M_01_00"); //Und die letzte Aufgabe. Wie lange reicht die Medizin?

	Info_ClearChoices	(Info_Mod_Mahamad_Schlaufuchs);

	Info_AddChoice	(Info_Mod_Mahamad_Schlaufuchs, "1 Stunde.", Info_Mod_Mahamad_Schlaufuchs_P);
	Info_AddChoice	(Info_Mod_Mahamad_Schlaufuchs, "2 Stunden.", Info_Mod_Mahamad_Schlaufuchs_O);
	Info_AddChoice	(Info_Mod_Mahamad_Schlaufuchs, "1 1/2 Stunden.", Info_Mod_Mahamad_Schlaufuchs_N);
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_G()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_G_15_00"); //Ich denke, es sind 35 Dreiecke.

	Info_Mod_Mahamad_Schlaufuchs_H();
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_F()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_F_15_00"); //Ich denke, es sind 25 Dreiecke.

	Mod_ASS_MahamadRaetsel_Niete += 1;

	Info_Mod_Mahamad_Schlaufuchs_H();
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_E()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_E_15_00"); //Ich denke, es sind 20 Dreiecke.

	Mod_ASS_MahamadRaetsel_Niete += 1;

	Info_Mod_Mahamad_Schlaufuchs_H();
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_L()
{
	if (Mod_ASS_MahamadRaetsel_Niete >= 2)
	{
		AI_Output(self, hero, "Info_Mod_Mahamad_Schlaufuchs_L_01_00"); //Deine Antworten waren nicht schlecht, aber es reicht wohl nicht. Lerne, lese die Bücher, bereite dich weiter vor. Die meisten Novizen hier haben das gleiche Problem.
	}
	else if (Mod_ASS_MahamadRaetsel_Niete >= 1)
	{
		AI_Output(self, hero, "Info_Mod_Mahamad_Schlaufuchs_L_01_01"); //Du überrascht mich wirklich. Dieses Ergebnis habe ich dir nicht zugetraut. Ich muss sagen, du bist auf dem besten Weg nach oben. Ich will dir noch eine Chance geben.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Mahamad_Schlaufuchs_L_01_02"); //Perfekt! Alles richtig. Macht richtig Spaß mit dir. Meine Stimme ist dir sicher.
		AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_L_15_03"); //Und wie geht's weiter?
		AI_Output(self, hero, "Info_Mod_Mahamad_Schlaufuchs_L_01_04"); //Ich glaube, Mirza hat noch was für dich.

		B_GivePlayerXP	(250);

		Mod_ASS_MahamadRaetsel = 1;

		B_SetTopicStatus	(TOPIC_MOD_ASS_SCHLAUFUCHS, LOG_SUCCESS);
	};

	Info_ClearChoices	(Info_Mod_Mahamad_Schlaufuchs);
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_K()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_K_15_00"); //War etwas schwierig. Ich hab für oben 7 4 und unten 14 16 raus.

	Mod_ASS_MahamadRaetsel_Niete += 1;

	Info_Mod_Mahamad_Schlaufuchs_M();
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_J()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_J_15_00"); //War etwas schwierig. Ich hab für oben 6 3 und unten 15 17 raus.

	Info_Mod_Mahamad_Schlaufuchs_M();
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_I()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_I_15_00"); //War etwas schwierig. Ich hab für oben 5 2 und unten 17 19 raus.

	Mod_ASS_MahamadRaetsel_Niete += 1;

	Info_Mod_Mahamad_Schlaufuchs_M();
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_P()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_P_15_00"); //1 Stunde.

	Info_Mod_Mahamad_Schlaufuchs_L();
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_O()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_O_15_00"); //2 Stunden.

	Mod_ASS_MahamadRaetsel_Niete += 1;

	Info_Mod_Mahamad_Schlaufuchs_L();
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_N()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_N_15_00"); //1 1/2 Stunden.

	Mod_ASS_MahamadRaetsel_Niete += 1;

	Info_Mod_Mahamad_Schlaufuchs_L();
};

INSTANCE Info_Mod_Mahamad_Blutkelch (C_INFO)
{
	npc		= Mod_7150_ASS_Mahamad_NW;
	nr		= 1;
	condition	= Info_Mod_Mahamad_Blutkelch_Condition;
	information	= Info_Mod_Mahamad_Blutkelch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo! Kais erzählt mir, dass du einen Teil einer Botschaft hast. Kann ich mal haben?";
};

FUNC INT Info_Mod_Mahamad_Blutkelch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kais_Blutkelch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mahamad_Blutkelch_Info()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Blutkelch_15_00"); //Hallo! Kais erzählt mir, dass du einen Teil einer Botschaft hast. Kann ich mal haben?
	AI_Output(self, hero, "Info_Mod_Mahamad_Blutkelch_01_01"); //Hier, ich komme damit nicht klar. Aber Vorsicht! Ist ein altes Pergament.

	B_GiveInvItems	(self, hero, ItWr_BlutkelchZettel2, 1);

	AI_Output(hero, self, "Info_Mod_Mahamad_Blutkelch_15_02"); //Ich pass auf.

	if (Npc_HasItems(hero, ItWr_BlutkelchZettel1) == 1)
	&& (Npc_HasItems(hero, ItWr_BlutkelchZettel2) == 1)
	&& (Npc_HasItems(hero, ItWr_BlutkelchZettel3) == 1)
	{
		Log_CreateTopic	(TOPIC_MOD_ASS_LASTBLUTKELCH, LOG_MISSION);
		B_SetTopicStatus	(TOPIC_MOD_ASS_LASTBLUTKELCH, LOG_RUNNING);
		B_LogEntry	(TOPIC_MOD_ASS_LASTBLUTKELCH, "Habe von Kais, Mahamad und Norek jeweils ein Teil eines alten Pergaments erhalten und soll die Botschaft entziffern. Amir hat sie ins Lager gebracht. Mal sehen ...");
	};
};

INSTANCE Info_Mod_Mahamad_Pickpocket (C_INFO)
{
	npc		= Mod_7150_ASS_Mahamad_NW;
	nr		= 1;
	condition	= Info_Mod_Mahamad_Pickpocket_Condition;
	information	= Info_Mod_Mahamad_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Mahamad_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Mahamad_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Mahamad_Pickpocket);

	Info_AddChoice	(Info_Mod_Mahamad_Pickpocket, DIALOG_BACK, Info_Mod_Mahamad_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Mahamad_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Mahamad_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Mahamad_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Mahamad_Pickpocket);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Aabid_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Aabid_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Aabid_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Mahamad_EXIT (C_INFO)
{
	npc		= Mod_7150_ASS_Mahamad_NW;
	nr		= 1;
	condition	= Info_Mod_Mahamad_EXIT_Condition;
	information	= Info_Mod_Mahamad_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Mahamad_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Mahamad_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};