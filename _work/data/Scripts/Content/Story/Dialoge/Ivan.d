INSTANCE Info_Mod_Ivan_Hi (C_INFO)
{
	npc		= Mod_7514_OUT_Ivan_REL;
	nr		= 1;
	condition	= Info_Mod_Ivan_Hi_Condition;
	information	= Info_Mod_Ivan_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Na, wie geht's?";
};

FUNC INT Info_Mod_Ivan_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ivan_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Ivan_Hi_15_00"); //Na, wie geht's?
	AI_Output(self, hero, "Info_Mod_Ivan_Hi_01_01"); //Keine Ahnung. Wie ist das Wetter?
};

INSTANCE Info_Mod_Ivan_Hasenfuss (C_INFO)
{
	npc		= Mod_7514_OUT_Ivan_REL;
	nr		= 1;
	condition	= Info_Mod_Ivan_Hasenfuss_Condition;
	information	= Info_Mod_Ivan_Hasenfuss_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du kommst jetzt mit zur Scavenger-Jagd.";
};

FUNC INT Info_Mod_Ivan_Hasenfuss_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ivan_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Dalton_Hi))
	&& (Mod_REL_Hasenfuss == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ivan_Hasenfuss_Info()
{
	AI_Output(hero, self, "Info_Mod_Ivan_Hasenfuss_15_00"); //Du kommst jetzt mit zur Scavenger-Jagd.
	AI_Output(self, hero, "Info_Mod_Ivan_Hasenfuss_01_01"); //Spinnst du? Diese blutrünstigen Viecher würden uns zerfleischen.
	AI_Output(hero, self, "Info_Mod_Ivan_Hasenfuss_15_02"); //Ich habe nicht gesagt, dass du eine Wahl hast.
	AI_Output(self, hero, "Info_Mod_Ivan_Hasenfuss_01_03"); //Aber das kannst du doch nicht verlangen! Ich werd's Dad erzählen!
	AI_Output(hero, self, "Info_Mod_Ivan_Hasenfuss_15_04"); //Wann wurdest du das letzte Mal windelweich geprügelt?
	AI_Output(self, hero, "Info_Mod_Ivan_Hasenfuss_01_05"); //(fassungslos) Du bist wirklich richtig mies. Glaub ja nicht, dass ich gern mitkomme.

	Mod_REL_Hasenfuss = 2;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOW");

	self.aivar[AIV_Partymember] = TRUE;
};

INSTANCE Info_Mod_Ivan_Hasenfuss2 (C_INFO)
{
	npc		= Mod_7514_OUT_Ivan_REL;
	nr		= 1;
	condition	= Info_Mod_Ivan_Hasenfuss2_Condition;
	information	= Info_Mod_Ivan_Hasenfuss2_Info;
	permanent	= 1;
	important	= 0;
	description	= "Lass uns Blümchen pflücken gehen!";
};

FUNC INT Info_Mod_Ivan_Hasenfuss2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ivan_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Dalton_Hi))
	&& (Mod_REL_Hasenfuss == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ivan_Hasenfuss2_Info()
{
	AI_Output(hero, self, "Info_Mod_Ivan_Hasenfuss2_15_00"); //Lass uns Blümchen pflücken gehen!
	AI_Output(self, hero, "Info_Mod_Ivan_Hasenfuss2_01_01"); //Au ja! Kennst du eine gute Blumenwiese?

	Info_ClearChoices	(Info_Mod_Ivan_Hasenfuss2);

	Info_AddChoice	(Info_Mod_Ivan_Hasenfuss2, "Ich komme wieder, wenn ich eine gefunden habe.", Info_Mod_Ivan_Hasenfuss2_B);
	Info_AddChoice	(Info_Mod_Ivan_Hasenfuss2, "Klar, komm mit.", Info_Mod_Ivan_Hasenfuss2_A);
};

FUNC VOID Info_Mod_Ivan_Hasenfuss2_B()
{
	AI_Output(hero, self, "Info_Mod_Ivan_Hasenfuss2_B_15_00"); //Ich komme wieder, wenn ich eine gefunden habe.

	Info_ClearChoices	(Info_Mod_Ivan_Hasenfuss2);
};

FUNC VOID Info_Mod_Ivan_Hasenfuss2_A()
{
	AI_Output(hero, self, "Info_Mod_Ivan_Hasenfuss2_A_15_00"); //Klar, komm mit.

	Info_ClearChoices	(Info_Mod_Ivan_Hasenfuss2);

	Mod_REL_Hasenfuss = 3;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOW");

	self.aivar[AIV_Partymember] = TRUE;
};

INSTANCE Info_Mod_Ivan_Hasenfuss3 (C_INFO)
{
	npc		= Mod_7514_OUT_Ivan_REL;
	nr		= 1;
	condition	= Info_Mod_Ivan_Hasenfuss3_Condition;
	information	= Info_Mod_Ivan_Hasenfuss3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ivan_Hasenfuss3_Condition()
{
	if (Npc_GetDistToWP(hero, "REL_SURFACE_126") < 2500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ivan_Hasenfuss3_Info()
{
	if (Mod_REL_Hasenfuss == 3)
	{
		AI_Output(self, hero, "Info_Mod_Ivan_Hasenfuss3_01_00"); //Hier willst du Blumen sammeln? Ist doch alles voller fieser Monster.
		AI_Output(self, hero, "Info_Mod_Ivan_Hasenfuss3_01_01"); //Lass uns lieber woanders hin gehen.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Ivan_Hasenfuss3_01_02"); //Du, ich trau mich wirklich nicht. Kannst du nicht allein jagen gehen?
		AI_Output(self, hero, "Info_Mod_Ivan_Hasenfuss3_01_03"); //O-oder hast d-du etwa zu viel Schiss?
	};

	Info_ClearChoices	(Info_Mod_Ivan_Hasenfuss3);

	Info_AddChoice	(Info_Mod_Ivan_Hasenfuss3, "Wir werden gemeinsam jagen gehen, damit das klar ist.", Info_Mod_Ivan_Hasenfuss3_B);
	Info_AddChoice	(Info_Mod_Ivan_Hasenfuss3, "Töte die Scavenger. Ich schaue zu.", Info_Mod_Ivan_Hasenfuss3_A);
};

FUNC VOID Info_Mod_Ivan_Hasenfuss3_B()
{
	AI_Output(hero, self, "Info_Mod_Ivan_Hasenfuss3_B_15_00"); //Wir werden gemeinsam jagen gehen, damit das klar ist.
	AI_Output(self, hero, "Info_Mod_Ivan_Hasenfuss3_B_01_01"); //(trotzig) Ich habe vom Jagen gar keine Ahnung.
	AI_Output(hero, self, "Info_Mod_Ivan_Hasenfuss3_B_15_02"); //Deswegen stehe ich dir zur Seite.
	AI_Output(self, hero, "Info_Mod_Ivan_Hasenfuss3_B_01_03"); //Ähm ... es reicht doch, wenn ich dir zuschaue und lerne, oder?

	Info_ClearChoices	(Info_Mod_Ivan_Hasenfuss3);

	Info_AddChoice	(Info_Mod_Ivan_Hasenfuss3, "Keine Chance.", Info_Mod_Ivan_Hasenfuss3_D);
	Info_AddChoice	(Info_Mod_Ivan_Hasenfuss3, "In Ordnung.", Info_Mod_Ivan_Hasenfuss3_C);
};

FUNC VOID Info_Mod_Ivan_Hasenfuss3_A()
{
	AI_Output(hero, self, "Info_Mod_Ivan_Hasenfuss3_A_15_00"); //Töte die Scavenger. Ich schaue zu.
	AI_Output(self, hero, "Info_Mod_Ivan_Hasenfuss3_A_01_01"); //Du spinnst wohl?!

	B_LogEntry	(TOPIC_MOD_KHORATA_HASENFUSS, "Ivan ist bockig. Ich sollte einen Weg finden, ihn zur Jagd zu ermutigen.");

	Info_ClearChoices	(Info_Mod_Ivan_Hasenfuss3);

	Mod_REL_Hasenfuss = 6;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FLUCHT");

	self.aivar[AIV_Partymember] = FALSE;
};

FUNC VOID Info_Mod_Ivan_Hasenfuss3_D()
{
	AI_Output(hero, self, "Info_Mod_Ivan_Hasenfuss3_D_15_00"); //Keine Chance.
	AI_Output(self, hero, "Info_Mod_Ivan_Hasenfuss3_D_01_01"); //(niedergeschlagen) Na gut, versuchen wir's. Sag, wann es losgeht.
	AI_Output(hero, self, "Info_Mod_Ivan_Hasenfuss3_D_15_02"); //Gehen wir's an.

	Info_ClearChoices	(Info_Mod_Ivan_Hasenfuss3);

	Mod_REL_Hasenfuss = 4;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOW");
};

FUNC VOID Info_Mod_Ivan_Hasenfuss3_C()
{
	AI_Output(hero, self, "Info_Mod_Ivan_Hasenfuss3_C_15_00"); //In Ordnung.

	Info_ClearChoices	(Info_Mod_Ivan_Hasenfuss3);

	Mod_REL_Hasenfuss = 5;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "WAIT");
};

INSTANCE Info_Mod_Ivan_Hasenfuss4 (C_INFO)
{
	npc		= Mod_7514_OUT_Ivan_REL;
	nr		= 1;
	condition	= Info_Mod_Ivan_Hasenfuss4_Condition;
	information	= Info_Mod_Ivan_Hasenfuss4_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Ivan_Hasenfuss4_Condition()
{
	if (Mod_REL_Hasenfuss == 6)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ivan_Hasenfuss4_Info()
{
	AI_Output(self, hero, "Info_Mod_Ivan_Hasenfuss4_01_00"); //(wütend) Hau ab!

	Info_ClearChoices	(Info_Mod_Ivan_Hasenfuss4);

	Info_AddChoice	(Info_Mod_Ivan_Hasenfuss4, "Wenn du mitkommst, kriegst du ein paar Pflanzen von mir.", Info_Mod_Ivan_Hasenfuss4_B);
	Info_AddChoice	(Info_Mod_Ivan_Hasenfuss4, "Das wird deinen Vater nicht erfreuen.", Info_Mod_Ivan_Hasenfuss4_A);
};

FUNC VOID Info_Mod_Ivan_Hasenfuss4_B()
{
	AI_Output(hero, self, "Info_Mod_Ivan_Hasenfuss4_B_15_00"); //Wenn du mitkommst, kriegst du ein paar Pflanzen von mir.
	AI_Output(self, hero, "Info_Mod_Ivan_Hasenfuss4_B_01_01"); //Hast du fünf Heilpflanzen?

	Info_ClearChoices	(Info_Mod_Ivan_Hasenfuss4);

	Info_AddChoice	(Info_Mod_Ivan_Hasenfuss4, "Ich bringe sie dir später.", Info_Mod_Ivan_Hasenfuss4_D);

	if (Npc_HasItems(hero, ItPl_Health_Herb_01) >= 5)
	{
		Info_AddChoice	(Info_Mod_Ivan_Hasenfuss4, "Hier hast du sie.", Info_Mod_Ivan_Hasenfuss4_C);
	};
};

FUNC VOID Info_Mod_Ivan_Hasenfuss4_A()
{
	AI_Output(hero, self, "Info_Mod_Ivan_Hasenfuss4_A_15_00"); //Das wird deinen Vater nicht erfreuen.
	AI_Output(self, hero, "Info_Mod_Ivan_Hasenfuss4_A_01_01"); //(aufbrausend) Mein Vater steckt wieder dahinter! Ich kann es nicht mehr hören!
	AI_Output(self, hero, "Info_Mod_Ivan_Hasenfuss4_A_01_02"); //Aber das war das letzte Mal, dass er mich hintergeht!
	AI_Output(self, hero, "Info_Mod_Ivan_Hasenfuss4_A_01_03"); //Es gibt schließlich auch andere Orte, an denen ich wohnen kann.

	Info_ClearChoices	(Info_Mod_Ivan_Hasenfuss4);

	Mod_REL_Hasenfuss = 7;

	B_SetTopicStatus	(TOPIC_MOD_KHORATA_HASENFUSS, LOG_FAILED);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ERHARD");
};

FUNC VOID Info_Mod_Ivan_Hasenfuss4_D()
{
	AI_Output(hero, self, "Info_Mod_Ivan_Hasenfuss4_D_15_00"); //Ich bringe sie dir später.

	Info_ClearChoices	(Info_Mod_Ivan_Hasenfuss4);
};

FUNC VOID Info_Mod_Ivan_Hasenfuss4_C()
{
	AI_Output(hero, self, "Info_Mod_Ivan_Hasenfuss4_C_15_00"); //Hier hast du sie.

	B_GiveInvItems	(hero, self, ItPl_Health_Herb_01, 5);

	Info_ClearChoices	(Info_Mod_Ivan_Hasenfuss4);

	Info_Mod_Ivan_Hasenfuss3_B();
};

INSTANCE Info_Mod_Ivan_Hasenfuss5 (C_INFO)
{
	npc		= Mod_7514_OUT_Ivan_REL;
	nr		= 1;
	condition	= Info_Mod_Ivan_Hasenfuss5_Condition;
	information	= Info_Mod_Ivan_Hasenfuss5_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ivan_Hasenfuss5_Condition()
{
	if (Mod_REL_Hasenfuss == 8)
	|| (Mod_REL_Hasenfuss == 9)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ivan_Hasenfuss5_Info()
{
	if (Mod_REL_Hasenfuss == 8)
	{
		AI_Output(self, hero, "Info_Mod_Ivan_Hasenfuss5_01_00"); //(prahlerisch) Hast du gesehen, wie ich's denen gegeben habe? Das hat Spaß gemacht!
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Ivan_Hasenfuss5_01_01"); //Und was soll daran jetzt so toll sein?
	};

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");

	self.aivar[AIV_Partymember] = FALSE;
};

INSTANCE Info_Mod_Ivan_Freudenspender (C_INFO)
{
	npc		= Mod_7514_OUT_Ivan_REL;
	nr		= 1;
	condition	= Info_Mod_Ivan_Freudenspender_Condition;
	information	= Info_Mod_Ivan_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Möchtest du auch Freudenspender oder bist du noch zu jung?";
};                       

FUNC INT Info_Mod_Ivan_Freudenspender_Condition()
{
	if (Npc_HasItems(hero, ItMi_Freudenspender) >= 1)
	&& (Mod_Freudenspender < 5)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Hi))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Ivan_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Ivan_Freudenspender_15_00"); //Möchtest du auch Freudenspender oder bist du noch zu jung?
	AI_Output(self, hero, "Info_Mod_Ivan_Freudenspender_01_01"); //Nein, ich nehm das Zeug ... regelmäßig.

	B_GiveInvItems	(hero, self, ItMi_Freudenspender, 1);

	B_GiveInvItems	(self, hero, ItMi_Gold, 10);

	Mod_Freudenspender	+= 1;

	B_StartOtherRoutine	(self, "BEKIFFT");
};

INSTANCE Info_Mod_Ivan_Pickpocket (C_INFO)
{
	npc		= Mod_7514_OUT_Ivan_REL;
	nr		= 1;
	condition	= Info_Mod_Ivan_Pickpocket_Condition;
	information	= Info_Mod_Ivan_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Ivan_Pickpocket_Condition()
{
	C_Beklauen	(45, ItMi_Gold, 16);
};

FUNC VOID Info_Mod_Ivan_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Ivan_Pickpocket);

	Info_AddChoice	(Info_Mod_Ivan_Pickpocket, DIALOG_BACK, Info_Mod_Ivan_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Ivan_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Ivan_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Ivan_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Ivan_Pickpocket);
};

FUNC VOID Info_Mod_Ivan_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Ivan_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Ivan_Pickpocket);

		Info_AddChoice	(Info_Mod_Ivan_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Ivan_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Ivan_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Ivan_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Ivan_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Ivan_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Ivan_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Ivan_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Ivan_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Ivan_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Ivan_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Ivan_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Ivan_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Ivan_EXIT (C_INFO)
{
	npc		= Mod_7514_OUT_Ivan_REL;
	nr		= 1;
	condition	= Info_Mod_Ivan_EXIT_Condition;
	information	= Info_Mod_Ivan_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Ivan_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ivan_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};