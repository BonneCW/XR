INSTANCE Info_Mod_Engardo_Hi (C_INFO)
{
	npc		= Mod_904_SLD_Engardo_MT;
	nr		= 1;
	condition	= Info_Mod_Engardo_Hi_Condition;
	information	= Info_Mod_Engardo_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Engardo_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fester_BackAtCamp))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Engardo_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Engardo_Hi_13_00"); //Man, du hast gezeigt, dass du zuverlässig bist. Ich hätte da eine Aufgabe für dich, bei der du dir die Beine vertreten kannst, und Gold, Erz und Sumpfkraut dabei verdienst.
	AI_Output(hero, self, "Info_Mod_Engardo_Hi_15_01"); //Hört sich gut an.
	AI_Output(self, hero, "Info_Mod_Engardo_Hi_13_02"); //Du weißt vielleicht schon, dass einige der Wasserkrieger ehemalige Söldner sind. Einer davon ist Vanas.
	AI_Output(self, hero, "Info_Mod_Engardo_Hi_13_03"); //Du müsstest ihm nur etwas vorbeibringen und das, was er dir gibt, zu mir bringen.

	B_StartOtherRoutine	(self, "START");

	Info_ClearChoices	(Info_Mod_Engardo_Hi);

	Info_AddChoice	(Info_Mod_Engardo_Hi, "Ne, ist mir ein zu weiter Weg.", Info_Mod_Engardo_Hi_B);
	Info_AddChoice	(Info_Mod_Engardo_Hi, "Klar, mach ich doch mit links.", Info_Mod_Engardo_Hi_A);
};

FUNC VOID Info_Mod_Engardo_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Engardo_Hi_B_15_00"); //Ne, ist mir ein zu weiter Weg.
	AI_Output(self, hero, "Info_Mod_Engardo_Hi_B_13_01"); //Schade. Sehr enttäuschend. Muss ich jemand anderen dafür finden.
	
	Info_ClearChoices	(Info_Mod_Engardo_Hi);
};

FUNC VOID Info_Mod_Engardo_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Engardo_Hi_A_15_00"); //Klar, mach ich doch mit links.
	AI_Output(self, hero, "Info_Mod_Engardo_Hi_A_13_01"); //Sehr gut. Hier hast du je zwölf Erbrocken und Sumpfkrautstängel für Vanas.

	B_ShowGivenThings	("12 Erzbrocken und 12 Stängel Sumpfkraut erhalten");

	CreateInvItems	(hero, ItMi_Nugget, 12);
	CreateInvItems	(hero, ItMi_Joint, 12);

	Mod_SLD_Engardo = 1;

	Log_CreateTopic	(TOPIC_MOD_SLD_ENGARDO, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SLD_ENGARDO, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SLD_ENGARDO, "Ich soll je zwölf Erbrocken und Sumpfkrautstängel zu dem Wasserkrieger Vanas bringen und die Bezahlung dann zu Engardo ins Minental befördern.");
	
	Info_ClearChoices	(Info_Mod_Engardo_Hi);
};

INSTANCE Info_Mod_Engardo_Vanas (C_INFO)
{
	npc		= Mod_904_SLD_Engardo_MT;
	nr		= 1;
	condition	= Info_Mod_Engardo_Vanas_Condition;
	information	= Info_Mod_Engardo_Vanas_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich war bei Vanas. Er hatte jedoch nicht alles dabei.";
};

FUNC INT Info_Mod_Engardo_Vanas_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Engardo_Hi))
	&& (((Mod_SLD_Engardo == 3)
	&& (Npc_HasItems(hero, ItMi_Nugget) >= 4)
	&& (Npc_HasItems(hero, ItMi_Joint) >= 4))
	|| (Npc_KnowsInfo(hero, Info_Mod_Everaldo_Hi)))
	&& (Npc_HasItems(hero, ItMi_VanasPaket) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Engardo_Vanas_Info()
{
	AI_Output(hero, self, "Info_Mod_Engardo_Vanas_15_00"); //Ich war bei Vanas. Er hatte jedoch nicht alles dabei.

	if (Mod_SLD_Engardo == 3)
	{
		AI_Output(hero, self, "Info_Mod_Engardo_Vanas_15_01"); //Er gab mir einen Teil des Erzes und Sumpfkrautes zurück.

		B_ShowGivenThings	("Paket, 4 Erz und 4 Stängel Sumpfkraut gegeben");

		Npc_RemoveInvItems	(hero, ItMi_VanasPaket, 1);
		Npc_RemoveInvItems	(hero, ItMi_Nugget, 4);
		Npc_RemoveInvItems	(hero, ItMi_Joint, 4);

		AI_Output(self, hero, "Info_Mod_Engardo_Vanas_13_02"); //Lass sehen ... Naja, ok, immerhin etwas. Hier hast du vier Sumpfkrautstängel und drei Erz zur Belohnung.

		B_ShowGivenThings	("3 Erz und 4 Stängel Sumpfkraut erhalten");

		CreateInvItems	(hero, ItMi_Nugget, 3);
		CreateInvItems	(hero, ItMi_Joint, 4);

		B_GivePlayerXP	(350);

		Mod_SLD_Engardo = 5;
	}
	else
	{
		B_GiveInvItems	(hero, self, ItMi_VanasPaket, 1);

		AI_Output(self, hero, "Info_Mod_Engardo_Vanas_13_03"); //Lass sehen ... Und was bekomme ich zum Ausgleich?

		Info_ClearChoices	(Info_Mod_Engardo_Vanas);

		Info_AddChoice	(Info_Mod_Engardo_Vanas, "Gar nichts.", Info_Mod_Engardo_Vanas_F);

		if (Npc_HasItems(hero, ItFo_Beer) >= 14)
		{
			Info_AddChoice	(Info_Mod_Engardo_Vanas, "14 Bier.", Info_Mod_Engardo_Vanas_E);
		};
		if (Npc_HasItems(hero, ItFo_Cheese) >= 14)
		{
			Info_AddChoice	(Info_Mod_Engardo_Vanas, "14 Stücke Käse.", Info_Mod_Engardo_Vanas_D);
		};
		if (Npc_HasItems(hero, ItMi_Gold) >= 250)
		{
			Info_AddChoice	(Info_Mod_Engardo_Vanas, "250 Goldmünzen.", Info_Mod_Engardo_Vanas_C);
		};
		if (Npc_HasItems(hero, ItMi_Joint) >= 12)
		{
			Info_AddChoice	(Info_Mod_Engardo_Vanas, "Zwölf Stängel Sumpfkraut.", Info_Mod_Engardo_Vanas_B);
		};
		if (Npc_HasItems(hero, ItMi_Nugget) >= 6)
		{
			Info_AddChoice	(Info_Mod_Engardo_Vanas, "Sechs Erz.", Info_Mod_Engardo_Vanas_A);
		};
	};

	B_SetTopicStatus	(TOPIC_MOD_SLD_ENGARDO, LOG_SUCCESS);
};

FUNC VOID Info_Mod_Engardo_Vanas_G()
{
	AI_Output(self, hero, "Info_Mod_Engardo_Vanas_G_13_00"); //Naja, ist ganz in Ordnung. Hier hast du fünf Sumpfkrautstängel und vier Erz zur Belohnung.

	B_ShowGivenThings	("4 Erz und 5 Stängel Sumpfkraut erhalten");

	CreateInvItems	(hero, ItMi_Nugget, 4);
	CreateInvItems	(hero, ItMi_Joint, 5);

	B_GivePlayerXP	(400);

	Mod_SLD_Engardo = 5;

	Info_ClearChoices	(Info_Mod_Engardo_Vanas);
};

FUNC VOID Info_Mod_Engardo_Vanas_F()
{
	AI_Output(hero, self, "Info_Mod_Engardo_Vanas_F_15_00"); //Gar nichts.
	AI_Output(self, hero, "Info_Mod_Engardo_Vanas_F_13_01"); //Was?! Wegen dir Tölpel habe ich ein Verlustgeschäft gemacht. Geh mir aus den Augen!

	B_GivePlayerXP	(200);

	Info_ClearChoices	(Info_Mod_Engardo_Vanas);
};

FUNC VOID Info_Mod_Engardo_Vanas_E()
{
	AI_Output(hero, self, "Info_Mod_Engardo_Vanas_E_15_00"); //14 Bier.

	B_GiveInvItems	(hero, self, ItFo_Beer, 14);
	
	Info_Mod_Engardo_Vanas_G();
};

FUNC VOID Info_Mod_Engardo_Vanas_D()
{
	AI_Output(hero, self, "Info_Mod_Engardo_Vanas_D_15_00"); //14 Stücke Käse.

	B_GiveInvItems	(hero, self, ItFo_Cheese, 14);

	Info_Mod_Engardo_Vanas_G();
};

FUNC VOID Info_Mod_Engardo_Vanas_C()
{
	AI_Output(hero, self, "Info_Mod_Engardo_Vanas_C_15_00"); //250 Goldmünzen.

	B_GiveInvItems	(hero, self, ItMi_Gold, 250);

	Info_Mod_Engardo_Vanas_G();
};

FUNC VOID Info_Mod_Engardo_Vanas_B()
{
	AI_Output(hero, self, "Info_Mod_Engardo_Vanas_B_15_00"); //Zwölf Stängel Sumpfkraut.

	B_GiveInvItems	(hero, self, ItMi_Joint, 12);

	Info_Mod_Engardo_Vanas_G();
};

FUNC VOID Info_Mod_Engardo_Vanas_A()
{
	AI_Output(hero, self, "Info_Mod_Engardo_Vanas_A_15_00"); //Sechs Erz.

	B_GiveInvItems	(hero, self, ItMi_Nugget, 6);

	Info_Mod_Engardo_Vanas_G();
};

INSTANCE Info_Mod_Engardo_Pickpocket (C_INFO)
{
	npc		= Mod_904_SLD_Engardo_MT;
	nr		= 1;
	condition	= Info_Mod_Engardo_Pickpocket_Condition;
	information	= Info_Mod_Engardo_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Engardo_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 18);
};

FUNC VOID Info_Mod_Engardo_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Engardo_Pickpocket);

	Info_AddChoice	(Info_Mod_Engardo_Pickpocket, DIALOG_BACK, Info_Mod_Engardo_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Engardo_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Engardo_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Engardo_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Engardo_Pickpocket);
};

FUNC VOID Info_Mod_Engardo_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Engardo_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Engardo_Pickpocket);

		Info_AddChoice	(Info_Mod_Engardo_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Engardo_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Engardo_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Engardo_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Engardo_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Engardo_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Engardo_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Engardo_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Engardo_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Engardo_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Engardo_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Engardo_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Engardo_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Engardo_EXIT (C_INFO)
{
	npc		= Mod_904_SLD_Engardo_MT;
	nr		= 1;
	condition	= Info_Mod_Engardo_EXIT_Condition;
	information	= Info_Mod_Engardo_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Engardo_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Engardo_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};