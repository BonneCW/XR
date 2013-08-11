INSTANCE Info_Mod_Akahasch_Hi (C_INFO)
{
	npc		= Mod_4016_NOV_Akahasch_NW;
	nr		= 1;
	condition	= Info_Mod_Akahasch_Hi_Condition;
	information	= Info_Mod_Akahasch_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was machst du hier?";
};

FUNC INT Info_Mod_Akahasch_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Akahasch_Hi_Info()
{
	B_Say	(hero, self, "$WASMACHSTDUHIER");

	AI_Output(self, hero, "Info_Mod_Akahasch_Hi_24_01"); //(panisch) Was willst du?
	AI_Output(hero, self, "Info_Mod_Akahasch_Hi_15_02"); //Ich wollte nur wissen, was du hier machst ...?
	AI_Output(self, hero, "Info_Mod_Akahasch_Hi_24_03"); //Du gehörst also nicht zu ihnen?
	AI_Output(hero, self, "Info_Mod_Akahasch_Hi_15_04"); //Zu ihnen?
	AI_Output(self, hero, "Info_Mod_Akahasch_Hi_24_05"); //Diesen Verrückten, die mich töten wollten.
	AI_Output(hero, self, "Info_Mod_Akahasch_Hi_15_06"); //Ich weiß von keinen Verrückten ...
	AI_Output(self, hero, "Info_Mod_Akahasch_Hi_24_07"); //Kannst du mir dann helfen?

	Info_ClearChoices	(Info_Mod_Akahasch_Hi);

	Info_AddChoice	(Info_Mod_Akahasch_Hi, "Von wegen Verrückte. Wohl eher Leute, bei denen du in der Kreide stehst ...", Info_Mod_Akahasch_Hi_D);
	Info_AddChoice	(Info_Mod_Akahasch_Hi, "Kein Interesse.", Info_Mod_Akahasch_Hi_B);
	Info_AddChoice	(Info_Mod_Akahasch_Hi, "Worum geht's?", Info_Mod_Akahasch_Hi_A);
};

FUNC VOID Info_Mod_Akahasch_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Akahasch_Hi_B_15_00"); //Kein Interesse.
	AI_Output(self, hero, "Info_Mod_Akahasch_Hi_B_24_01"); //(ängstlich) Was soll ich nur machen?

	Info_ClearChoices	(Info_Mod_Akahasch_Hi);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Akahasch_Hi_E()
{
	AI_Output(hero, self, "Info_Mod_Akahasch_Hi_E_15_00"); //Ich bring die Rechnung. Es ist Zahltag ...
	AI_Output(self, hero, "Info_Mod_Akahasch_Hi_E_24_01"); //(erschrocken) Nein ... ohh, Innos, steht mir bei.

	Info_ClearChoices	(Info_Mod_Akahasch_Hi);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Kill, 2);
};

FUNC VOID Info_Mod_Akahasch_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_Akahasch_Hi_D_15_00"); //Von wegen Verrückte. Wohl eher Leute, bei denen du in der Kreide stehst ...
	AI_Output(self, hero, "Info_Mod_Akahasch_Hi_D_24_01"); //(erschrocken) Was?! Wer bist du, was hast du vor?

	Info_ClearChoices	(Info_Mod_Akahasch_Hi);

	Info_AddChoice	(Info_Mod_Akahasch_Hi, "Ich bring die Rechnung. Es ist Zahltag ...", Info_Mod_Akahasch_Hi_E);
	Info_AddChoice	(Info_Mod_Akahasch_Hi, "Keine Sorge. Ich werde dich in Sicherheit bringen.", Info_Mod_Akahasch_Hi_F);
};

FUNC VOID Info_Mod_Akahasch_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Akahasch_Hi_A_15_00"); //Worum geht's?
	AI_Output(self, hero, "Info_Mod_Akahasch_Hi_A_24_01"); //Kannst du mich zurück zum Kloster begleiten? Ich will lieber kein Risiko eingehen.

	Info_ClearChoices	(Info_Mod_Akahasch_Hi);

	Info_AddChoice	(Info_Mod_Akahasch_Hi, "Kein Interesse.", Info_Mod_Akahasch_Hi_B);
	Info_AddChoice	(Info_Mod_Akahasch_Hi, "Na gut, folge mir.", Info_Mod_Akahasch_Hi_C);
};

FUNC VOID Info_Mod_Akahasch_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_Akahasch_Hi_C_15_00"); //Na gut, folge mir.
	AI_Output(self, hero, "Info_Mod_Akahasch_Hi_C_24_01"); //Vielen Dank.

	Info_ClearChoices	(Info_Mod_Akahasch_Hi);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOW");

	self.aivar[AIV_Partymember] = TRUE;

	Mod_Akahasch_Guiding = 1;
};

FUNC VOID Info_Mod_Akahasch_Hi_F()
{
	AI_Output(hero, self, "Info_Mod_Akahasch_Hi_F_15_00"); //Keine Sorge. Ich werde dich in Sicherheit bringen.
	AI_Output(self, hero, "Info_Mod_Akahasch_Hi_F_24_01"); //Ja? Vielen Dank. Das Beste ist, wenn du mich zum Kloster bringst.

	Info_ClearChoices	(Info_Mod_Akahasch_Hi);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOW");

	self.aivar[AIV_Partymember] = TRUE;

	Mod_Akahasch_Guiding = 1;
};

INSTANCE Info_Mod_Akahasch_AtKloster (C_INFO)
{
	npc		= Mod_4016_NOV_Akahasch_NW;
	nr		= 1;
	condition	= Info_Mod_Akahasch_AtKloster_Condition;
	information	= Info_Mod_Akahasch_AtKloster_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Akahasch_AtKloster_Condition()
{
	if (Mod_Akahasch_Guiding == 1)
	&& (Npc_GetDistToWP(hero, "NW_MONASTERY_ENTRY_01") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Akahasch_AtKloster_Info()
{
	AI_Output(self, hero, "Info_Mod_Akahasch_AtKloster_24_00"); //Vielen Dank, wie kann ich das nur wieder gut machen?
	AI_Output(hero, self, "Info_Mod_Akahasch_AtKloster_15_01"); //Nun ja, ich wüsste da was ...
	AI_Output(self, hero, "Info_Mod_Akahasch_AtKloster_24_02"); //Ah, mir fällt da etwas ein. Nimm das!

	B_GiveInvItems	(self, hero, ItMi_Weinlieferung, 1);

	AI_Output(self, hero, "Info_Mod_Akahasch_AtKloster_24_03"); //Bring es zu Ulf in der Stadt, er wird dich dafür entlohnen.
	AI_Output(hero, self, "Info_Mod_Akahasch_AtKloster_15_04"); //(stöhnt) Na gut ...
	AI_Output(self, hero, "Info_Mod_Akahasch_AtKloster_24_05"); //Vielen Dank nochmal.
	
	B_LogEntry	(TOPIC_MOD_ASS_AUFNAHME, "Ich habe Akahasch zum Kloster gebracht. Dafür hat er mir ein Weinpaket gegeben, welches ich zu Ulf bringen sollte.");

	B_GivePlayerXP	(50);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "KLOSTER");

	B_Göttergefallen(1, 1);

	CurrentNQ += 1;

	self.aivar[AIV_Partymember] = FALSE;
};

INSTANCE Info_Mod_Akahasch_Fertig (C_INFO)
{
	npc		= Mod_4016_NOV_Akahasch_NW;
	nr		= 1;
	condition	= Info_Mod_Akahasch_Fertig_Condition;
	information	= Info_Mod_Akahasch_Fertig_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie geht's dir jetzt?";
};

FUNC INT Info_Mod_Akahasch_Fertig_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ulf_AkahaschTot))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Akahasch_Fertig_Info()
{
	AI_Output(hero, self, "Info_Mod_Akahasch_Fertig_15_00"); //Wie geht's dir jetzt?
	AI_Output(self, hero, "Info_Mod_Akahasch_Fertig_24_01"); //Hier bin ich sicher. So schnell traue ich mich aber nicht mehr nach draußen.
};

INSTANCE Info_Mod_Akahasch_Heiltrank (C_INFO)
{
	npc		= Mod_4016_NOV_Akahasch_NW;
	nr		= 1;
	condition	= Info_Mod_Akahasch_Heiltrank_Condition;
	information	= Info_Mod_Akahasch_Heiltrank_Info;
	permanent	= 1;
	important	= 0;
	description	= "(Heiltrank geben)";
};

FUNC INT Info_Mod_Akahasch_Heiltrank_Condition()
{
	if (self.aivar[AIV_Partymember] == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Akahasch_Heiltrank_Info()
{
	Info_ClearChoices	(Info_Mod_Akahasch_Heiltrank);

	Info_AddChoice	(Info_Mod_Akahasch_Heiltrank, DIALOG_BACK, Info_Mod_Akahasch_Heiltrank_BACK);

	if (Npc_HasItems(hero, ItPo_Health_Addon_04) >= 1)
	{
		Info_AddChoice	(Info_Mod_Akahasch_Heiltrank, "Essenz der Heilung", Info_Mod_Akahasch_Heiltrank_Health_04);
	};
	if (Npc_HasItems(hero, ItPo_Health_01) >= 1)
	{
		Info_AddChoice	(Info_Mod_Akahasch_Heiltrank, "Elixier der Heilung", Info_Mod_Akahasch_Heiltrank_Health_03);
	};
	if (Npc_HasItems(hero, ItPo_Health_02) >= 1)
	{
		Info_AddChoice	(Info_Mod_Akahasch_Heiltrank, "Extrakt der Heilung", Info_Mod_Akahasch_Heiltrank_Health_02);
	};
	if (Npc_HasItems(hero, ItPo_Health_01) >= 1)
	{
		Info_AddChoice	(Info_Mod_Akahasch_Heiltrank, "Essenz der Heilung", Info_Mod_Akahasch_Heiltrank_Health_01);
	};
	if (Npc_HasItems(hero, ItPo_Health_07) >= 1)
	{
		Info_AddChoice	(Info_Mod_Akahasch_Heiltrank, "Trank der leichten Heilung", Info_Mod_Akahasch_Heiltrank_Health_07);
	};
	if (Npc_HasItems(hero, ItPo_Health_06) >= 1)
	{
		Info_AddChoice	(Info_Mod_Akahasch_Heiltrank, "Leichter Heiltrank", Info_Mod_Akahasch_Heiltrank_Health_06);
	};
	if (Npc_HasItems(hero, ItPo_Health_05) >= 1)
	{
		Info_AddChoice	(Info_Mod_Akahasch_Heiltrank, "Trank der schnellen Heilung", Info_Mod_Akahasch_Heiltrank_Health_05);
	};
};

FUNC VOID Info_Mod_Akahasch_Heiltrank_BACK ()
{
	Info_ClearChoices	(Info_Mod_Akahasch_Heiltrank);
};

FUNC VOID Info_Mod_Akahasch_Heiltrank_Health_04 ()
{
	Info_ClearChoices	(Info_Mod_Akahasch_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_Addon_04, 1);

	B_UseItem	(self, ItPo_Health_Addon_04);
};

FUNC VOID Info_Mod_Akahasch_Heiltrank_Health_03 ()
{
	Info_ClearChoices	(Info_Mod_Akahasch_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_03, 1);

	B_UseItem	(self, ItPo_Health_03);
};

FUNC VOID Info_Mod_Akahasch_Heiltrank_Health_02 ()
{
	Info_ClearChoices	(Info_Mod_Akahasch_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_02, 1);

	B_UseItem	(self, ItPo_Health_02);
};

FUNC VOID Info_Mod_Akahasch_Heiltrank_Health_01 ()
{
	Info_ClearChoices	(Info_Mod_Akahasch_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_01, 1);

	B_UseItem	(self, ItPo_Health_01);
};

FUNC VOID Info_Mod_Akahasch_Heiltrank_Health_07 ()
{
	Info_ClearChoices	(Info_Mod_Akahasch_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_07, 1);

	B_UseItem	(self, ItPo_Health_07);
};

FUNC VOID Info_Mod_Akahasch_Heiltrank_Health_06 ()
{
	Info_ClearChoices	(Info_Mod_Akahasch_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_06, 1);

	B_UseItem	(self, ItPo_Health_06);
};

FUNC VOID Info_Mod_Akahasch_Heiltrank_Health_05 ()
{
	Info_ClearChoices	(Info_Mod_Akahasch_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_05, 1);

	B_UseItem	(self, ItPo_Health_05);
};

INSTANCE Info_Mod_Akahasch_Pickpocket (C_INFO)
{
	npc		= Mod_4016_NOV_Akahasch_NW;
	nr		= 1;
	condition	= Info_Mod_Akahasch_Pickpocket_Condition;
	information	= Info_Mod_Akahasch_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Akahasch_Pickpocket_Condition()
{
	C_Beklauen	(76, ItMi_Gold, 24);
};

FUNC VOID Info_Mod_Akahasch_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Akahasch_Pickpocket);

	Info_AddChoice	(Info_Mod_Akahasch_Pickpocket, DIALOG_BACK, Info_Mod_Akahasch_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Akahasch_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Akahasch_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Akahasch_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Akahasch_Pickpocket);
};

FUNC VOID Info_Mod_Akahasch_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Akahasch_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Akahasch_Pickpocket);

		Info_AddChoice	(Info_Mod_Akahasch_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Akahasch_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Akahasch_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Akahasch_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Akahasch_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Akahasch_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Akahasch_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Akahasch_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Akahasch_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Akahasch_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Akahasch_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Akahasch_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Akahasch_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Akahasch_EXIT (C_INFO)
{
	npc		= Mod_4016_NOV_Akahasch_NW;
	nr		= 1;
	condition	= Info_Mod_Akahasch_EXIT_Condition;
	information	= Info_Mod_Akahasch_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Akahasch_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Akahasch_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};