INSTANCE Info_Mod_HofstaatTrunkenbold_Hi (C_INFO)
{
	npc		= Mod_7272_HS_Trunkenbold_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatTrunkenbold_Hi_Condition;
	information	= Info_Mod_HofstaatTrunkenbold_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bist du der Trunkenbold?";
};

FUNC INT Info_Mod_HofstaatTrunkenbold_Hi_Condition()
{
	if (Mod_HSBook == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatTrunkenbold_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_HofstaatTrunkenbold_Hi_15_00"); //Bist du der Trunkenbold?
	AI_Output(self, hero, "Info_Mod_HofstaatTrunkenbold_Hi_04_01"); //...
	AI_Output(hero, self, "Info_Mod_HofstaatTrunkenbold_Hi_15_02"); //Hallo?
	AI_Output(self, hero, "Info_Mod_HofstaatTrunkenbold_Hi_04_01"); //...
	AI_Output(hero, self, "Info_Mod_HofstaatTrunkenbold_Hi_15_03"); //HALLO?!

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_7011_HS_Alex_REL, "TRUNKENBOLD");

	AI_Teleport	(Mod_7011_HS_Alex_REL, "REL_261");
};

INSTANCE Info_Mod_HofstaatTrunkenbold_Trunken (C_INFO)
{
	npc		= Mod_7272_HS_Trunkenbold_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatTrunkenbold_Trunken_Condition;
	information	= Info_Mod_HofstaatTrunkenbold_Trunken_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatTrunkenbold_Trunken_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alex_Trunkenbold))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatTrunkenbold_Trunken_Info()
{
	B_GiveInvItems	(self, hero, ItFo_Trunken, 3);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_HofstaatTrunkenbold_Geliebte (C_INFO)
{
	npc		= Mod_7272_HS_Trunkenbold_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatTrunkenbold_Geliebte_Condition;
	information	= Info_Mod_HofstaatTrunkenbold_Geliebte_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatTrunkenbold_Geliebte_Condition()
{
	if (Mod_SL_PartGeliebte == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatTrunkenbold_Geliebte_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatTrunkenbold_Geliebte_04_00"); //(gähnt) Guten Morgen Majestät. Ist schon wieder die Zeit des Festes?
	AI_Output(hero, self, "Info_Mod_HofstaatTrunkenbold_Geliebte_15_01"); //Jaja, Trunkenbold. Zu was anderem, weißt du noch, wie du die königliche ... äh ... meine Geliebte verführt hast?
	AI_Output(self, hero, "Info_Mod_HofstaatTrunkenbold_Geliebte_04_02"); //Jaja, das weiß ich noch (gähnt) Da hat sie von meinem Spezialtrunken gekostet, hehe. Niemand verträgt meinen Spezialtrunken.
	AI_Output(hero, self, "Info_Mod_HofstaatTrunkenbold_Geliebte_15_03"); //Gib ihn mir.
	AI_Output(self, hero, "Info_Mod_HofstaatTrunkenbold_Geliebte_04_04"); //Nein.
	AI_Output(hero, self, "Info_Mod_HofstaatTrunkenbold_Geliebte_15_05"); //Was nein.
	AI_Output(self, hero, "Info_Mod_HofstaatTrunkenbold_Geliebte_04_06"); //Geht nicht. Hab keinen mehr.
	AI_Output(hero, self, "Info_Mod_HofstaatTrunkenbold_Geliebte_15_07"); //Dann mach welchen.
	AI_Output(self, hero, "Info_Mod_HofstaatTrunkenbold_Geliebte_04_08"); //Natürlich, sobald ich richtig wach bin. Den zu machen dauert aber ein Weilchen.

	Info_ClearChoices	(Info_Mod_HofstaatTrunkenbold_Geliebte);

	Info_AddChoice	(Info_Mod_HofstaatTrunkenbold_Geliebte, "Nein, sag mir lieber wie du ihn machst.", Info_Mod_HofstaatTrunkenbold_Geliebte_B);
	Info_AddChoice	(Info_Mod_HofstaatTrunkenbold_Geliebte, "Na gut.", Info_Mod_HofstaatTrunkenbold_Geliebte_B);
};

FUNC VOID Info_Mod_HofstaatTrunkenbold_Geliebte_B()
{
	AI_Output(hero, self, "Info_Mod_HofstaatTrunkenbold_Geliebte_B_15_00"); //Nein, sag mir lieber wie du ihn machst.
	AI_Output(self, hero, "Info_Mod_HofstaatTrunkenbold_Geliebte_B_04_01"); //Jawohl Hoheit. Ihr braucht Trunken, viiiieeel Trunken.  Dann braucht ihr eine seltsame, grüne Frucht, das ist alles.
	AI_Output(hero, self, "Info_Mod_HofstaatTrunkenbold_Geliebte_B_15_02"); //Woher bekomme ich den Trunken?
	AI_Output(self, hero, "Info_Mod_HofstaatTrunkenbold_Geliebte_B_04_03"); //Den bekommt man in einer Stadt. Die Ausländer nennen Trunken "Schnaps" oder auch "Wacholder". Ts ... lächerlich.
	AI_Output(hero, self, "Info_Mod_HofstaatTrunkenbold_Geliebte_B_15_04"); //Was für eine grüne Frucht?
	AI_Output(self, hero, "Info_Mod_HofstaatTrunkenbold_Geliebte_B_04_05"); //Sie wird "Melone" genannt. Ihr bekommst sie in Khorata. Schüttet den Trunken an einem Alchemietisch in die Melone.
	AI_Output(hero, self, "Info_Mod_HofstaatTrunkenbold_Geliebte_B_15_06"); //Du bist ja noch gar nicht richtig wach. Hier, nimm ein wenig Freudenspender.

	CreateInvItems	(self, ItMi_Freudenspender, 1);

	B_UseItem	(self, ItMi_Freudenspender);

	Info_ClearChoices	(Info_Mod_HofstaatTrunkenbold_Geliebte);

	Mod_SL_PartGeliebte = 3;

	B_LogEntry	(TOPIC_MOD_SL_GELIEBTE, "Für den Spezialtrunken, mit dem der Trunkenbold damals die königliche Geliebte verführt hat, brauche ich jede Menge Trunken und eine Melone. Trunken ist bei Ausländern auch als Wacholder bekannt. Beides kann ich in Khorata bekommen.");
};

FUNC VOID Info_Mod_HofstaatTrunkenbold_Geliebte_A()
{
	AI_Output(hero, self, "Info_Mod_HofstaatTrunkenbold_Geliebte_A_15_00"); //Na gut.
	AI_Output(self, hero, "Info_Mod_HofstaatTrunkenbold_Geliebte_A_04_01"); //Gut,gut. (gähnt) Ich mach' mich auf den Weg.

	AI_GotoWP	(self, "REL_262");
	AI_GotoWP	(self, "REL_272");

	AI_Output(self, hero, "Info_Mod_HofstaatTrunkenbold_Geliebte_A_04_02"); //Es ist nicht die Zeit des Festes ... und du bist nicht der König! STIIRB!

	Info_ClearChoices	(Info_Mod_HofstaatTrunkenbold_Geliebte);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Kill, 0);
};

INSTANCE Info_Mod_HofstaatTrunkenbold_Pickpocket (C_INFO)
{
	npc		= Mod_7272_HS_Trunkenbold_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatTrunkenbold_Pickpocket_Condition;
	information	= Info_Mod_HofstaatTrunkenbold_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20;
};

FUNC INT Info_Mod_HofstaatTrunkenbold_Pickpocket_Condition()
{
	C_Beklauen	(17, ItMi_Gold, 60);
};

FUNC VOID Info_Mod_HofstaatTrunkenbold_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_HofstaatTrunkenbold_Pickpocket);

	Info_AddChoice	(Info_Mod_HofstaatTrunkenbold_Pickpocket, DIALOG_BACK, Info_Mod_HofstaatTrunkenbold_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_HofstaatTrunkenbold_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_HofstaatTrunkenbold_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_HofstaatTrunkenbold_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_HofstaatTrunkenbold_Pickpocket);
};

FUNC VOID Info_Mod_HofstaatTrunkenbold_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_HofstaatTrunkenbold_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_HofstaatTrunkenbold_Pickpocket);

		Info_AddChoice	(Info_Mod_HofstaatTrunkenbold_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_HofstaatTrunkenbold_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_HofstaatTrunkenbold_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_HofstaatTrunkenbold_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_HofstaatTrunkenbold_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_HofstaatTrunkenbold_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_HofstaatTrunkenbold_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_HofstaatTrunkenbold_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_HofstaatTrunkenbold_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_HofstaatTrunkenbold_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_HofstaatTrunkenbold_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_HofstaatTrunkenbold_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_HofstaatTrunkenbold_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_HofstaatTrunkenbold_EXIT (C_INFO)
{
	npc		= Mod_7272_HS_Trunkenbold_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatTrunkenbold_EXIT_Condition;
	information	= Info_Mod_HofstaatTrunkenbold_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_HofstaatTrunkenbold_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HofstaatTrunkenbold_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};