INSTANCE Info_Mod_Aerwak_Hi (C_INFO)
{
	npc		= Mod_7807_OUT_Aerwak_EIS;
	nr		= 1;
	condition	= Info_Mod_Aerwak_Hi_Condition;
	information	= Info_Mod_Aerwak_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie geht’s?";
};

FUNC INT Info_Mod_Aerwak_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Aerwak_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Aerwak_Hi_15_00"); //Wie geht’s?
	AI_Output(self, hero, "Info_Mod_Aerwak_Hi_01_01"); //Ach ne, nicht schon wieder so einer.
	AI_Output(hero, self, "Info_Mod_Aerwak_Hi_15_02"); //Was meinst du?
	AI_Output(self, hero, "Info_Mod_Aerwak_Hi_01_03"); //Einer von euch Fremden. Nur Probleme macht eures Gleichen hier im Dorf. Euch Pack sollte man gar nicht erst hier rein lassen.

	Info_ClearChoices	(Info_Mod_Aerwak_Hi);

	Info_AddChoice	(Info_Mod_Aerwak_Hi, "Du riskierst eine ganz schön dicke Lippe, mein Freundchen.", Info_Mod_Aerwak_Hi_B);
	Info_AddChoice	(Info_Mod_Aerwak_Hi, "Was ist dein Problem?", Info_Mod_Aerwak_Hi_A);
};

FUNC VOID Info_Mod_Aerwak_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Aerwak_Hi_B_15_00"); //Du riskierst eine ganz schön dicke Lippe, mein Freundchen.
	AI_Output(self, hero, "Info_Mod_Aerwak_Hi_B_01_01"); //Dicke Lippe?! Die hast du gleich!

	Info_ClearChoices	(Info_Mod_Aerwak_Hi);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_NONE, 0);

	Mod_Aerwak = 1;
};

FUNC VOID Info_Mod_Aerwak_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Aerwak_Hi_A_15_00"); //Was ist dein Problem?
	AI_Output(self, hero, "Info_Mod_Aerwak_Hi_A_01_01"); //Ihr Fremden seid mein Problem. Und ich bin nicht der einzige, der das so sieht.
	AI_Output(self, hero, "Info_Mod_Aerwak_Hi_A_01_02"); //Kaum seid ihr hier, steckt ihr überall eure Nase hinein, betretet fremde Häuser, als ob sie euer Eigentum wären ... und ... (überlegt) und ...
	AI_Output(hero, self, "Info_Mod_Aerwak_Hi_A_15_03"); //Ja?
	AI_Output(self, hero, "Info_Mod_Aerwak_Hi_A_01_04"); //Ähhm ... ja, genau ... es gibt nur noch schlechten Fisch zu kaufen.
	AI_Output(hero, self, "Info_Mod_Aerwak_Hi_A_15_05"); //Was kann ich denn für den Fisch?
	AI_Output(self, hero, "Info_Mod_Aerwak_Hi_A_01_06"); //Du nicht direkt, aber du bist ja auch so einer wie der Gestath.
	AI_Output(self, hero, "Info_Mod_Aerwak_Hi_A_01_07"); //Seitdem der hier sein Jagdgeschäft aufgemacht hat und alle als Jäger für sich ackern lässt, ist nur noch Anglar als Fischhändler geblieben ... der kann es sich also leisten, uns alten Fisch zu verkaufen.
	AI_Output(self, hero, "Info_Mod_Aerwak_Hi_A_01_08"); //Eivar hat seinen Fischstand dicht gemacht, um wie viele andere das große Geld bei Gestath zu machen, oder irgendwelchen unnützen Schnickschnack von ihm zu erhandeln. So ein Idiot.
	AI_Output(self, hero, "Info_Mod_Aerwak_Hi_A_01_09"); //Und Aldaro kann nicht angeln, weil er krank ist.
	AI_Output(hero, self, "Info_Mod_Aerwak_Hi_A_15_10"); //Und daran bin ich vermutlich auch Schuld ...
	AI_Output(self, hero, "Info_Mod_Aerwak_Hi_A_01_11"); //Ach, mach, dass du wegkommst.

	Info_ClearChoices	(Info_Mod_Aerwak_Hi);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Aerwak_Aldaro (C_INFO)
{
	npc		= Mod_7807_OUT_Aerwak_EIS;
	nr		= 1;
	condition	= Info_Mod_Aerwak_Aldaro_Condition;
	information	= Info_Mod_Aerwak_Aldaro_Info;
	permanent	= 0;
	important	= 0;
	description	= "Aldaro ist wieder gesund.";
};

FUNC INT Info_Mod_Aerwak_Aldaro_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Aerwak_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Aldaro_Gift2))
	&& (Mod_Aerwak == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Aerwak_Aldaro_Info()
{
	AI_Output(hero, self, "Info_Mod_Aerwak_Aldaro_15_00"); //Aldaro ist wieder gesund.
	AI_Output(self, hero, "Info_Mod_Aerwak_Aldaro_01_01"); //Schön für ihn ... musst du mich deshalb so blöd von der Seite anquatschen, Fremder?
	AI_Output(hero, self, "Info_Mod_Aerwak_Aldaro_15_02"); //Du hattest dich doch über Anglars Fische beschwert ...
	AI_Output(self, hero, "Info_Mod_Aerwak_Aldaro_01_03"); //Hä, ja und?
	AI_Output(hero, self, "Info_Mod_Aerwak_Aldaro_15_04"); //Anglar wird wieder angeln gehen.
	AI_Output(self, hero, "Info_Mod_Aerwak_Aldaro_01_05"); //Hä ... (gleichgültig) ach ja ... das ist toll ... (abfällig) War das alles? Dann kannst du wieder gehen.

	B_GivePlayerXP	(200);
};

INSTANCE Info_Mod_Aerwak_Eivar (C_INFO)
{
	npc		= Mod_7807_OUT_Aerwak_EIS;
	nr		= 1;
	condition	= Info_Mod_Aerwak_Eivar_Condition;
	information	= Info_Mod_Aerwak_Eivar_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe Eivar gefunden. Er ist einem Raubtier zum Opfer gefallen.";
};

FUNC INT Info_Mod_Aerwak_Eivar_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Aerwak_Hi))
	&& (Mod_Aerwak == 0)
	&& (Mod_Eivar == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Aerwak_Eivar_Info()
{
	AI_Output(hero, self, "Info_Mod_Aerwak_Eivar_15_00"); //Ich habe Eivar gefunden. Er ist einem Raubtier zum Opfer gefallen.
	AI_Output(self, hero, "Info_Mod_Aerwak_Eivar_01_01"); //Was?! Dann ... (sich aufbauschend) dann habt ihr Fremden seinen Tod zu verantworten ... (wütend pathetisch) den Tod ... meines liebsten Bruders unserer Dorfgemeinschaft!
	AI_Output(hero, self, "Info_Mod_Aerwak_Eivar_15_02"); //He, vor kurzem hast du ihn aber noch als Idioten bezeichnet!
	AI_Output(self, hero, "Info_Mod_Aerwak_Eivar_01_03"); //(stammelnd) Ähhm ... nein ... das habe ich so nie gesagt ... (wieder sich aggressiv aufbauend) Jedenfalls habe ich von Beginn an gewusst, dass man eures gleichen niemals hätte ins Dorf hinein lassen sollen.
	AI_Output(self, hero, "Info_Mod_Aerwak_Eivar_01_04"); //Ich werde dir dreckigen Fremden die Lektion erteilen, die dir zusteht!

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_NONE, 0);

	Mod_Aerwak = 1;

	B_GivePlayerXP	(400);
};

INSTANCE Info_Mod_Aerwak_Trade (C_INFO)
{
	npc		= Mod_7807_OUT_Aerwak_EIS;
	nr		= 1;
	condition	= Info_Mod_Aerwak_Trade_Condition;
	information	= Info_Mod_Aerwak_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Aerwak_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Aerwak_Eivar))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Aerwak_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Aerwak_Pickpocket (C_INFO)
{
	npc		= Mod_7807_OUT_Aerwak_EIS;
	nr		= 1;
	condition	= Info_Mod_Aerwak_Pickpocket_Condition;
	information	= Info_Mod_Aerwak_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Aerwak_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 250);
};

FUNC VOID Info_Mod_Aerwak_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Aerwak_Pickpocket);

	Info_AddChoice	(Info_Mod_Aerwak_Pickpocket, DIALOG_BACK, Info_Mod_Aerwak_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Aerwak_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Aerwak_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Aerwak_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Aerwak_Pickpocket);
};

FUNC VOID Info_Mod_Aerwak_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Aerwak_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Aerwak_Pickpocket);

		Info_AddChoice	(Info_Mod_Aerwak_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Aerwak_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Aerwak_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Aerwak_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Aerwak_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Aerwak_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Aerwak_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Aerwak_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Aerwak_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Aerwak_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Aerwak_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Aerwak_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Aerwak_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Aerwak_EXIT (C_INFO)
{
	npc		= Mod_7807_OUT_Aerwak_EIS;
	nr		= 1;
	condition	= Info_Mod_Aerwak_EXIT_Condition;
	information	= Info_Mod_Aerwak_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Aerwak_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Aerwak_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};