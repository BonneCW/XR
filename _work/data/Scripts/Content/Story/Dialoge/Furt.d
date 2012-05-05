INSTANCE Info_Mod_Furt_Hi (C_INFO)
{
	npc		= Mod_1626_VMG_Furt_MT;
	nr		= 1;
	condition	= Info_Mod_Furt_Hi_Condition;
	information	= Info_Mod_Furt_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie heißt du?";
};

FUNC INT Info_Mod_Furt_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Furt_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Furt_Hi_15_00"); //Wie heißt du?
	AI_Output(self, hero, "Info_Mod_Furt_Hi_03_01"); //Ich wüsste nicht, was dich das angeht.

	Info_ClearChoices	(Info_Mod_Furt_Hi);

	Info_AddChoice	(Info_Mod_Furt_Hi, "Du hast Recht. Ich geh dann mal.", Info_Mod_Furt_Hi_B);
	Info_AddChoice	(Info_Mod_Furt_Hi, "Was ist dir denn über die Leber gelaufen?", Info_Mod_Furt_Hi_A);
};

FUNC VOID Info_Mod_Furt_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Furt_Hi_B_15_00"); //Du hast Recht. Ich geh dann mal.
	AI_Output(self, hero, "Info_Mod_Furt_Hi_B_03_01"); //Ist auch besser für dich.

	Info_ClearChoices	(Info_Mod_Furt_Hi);
};

FUNC VOID Info_Mod_Furt_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Furt_Hi_A_15_00"); //Was ist dir denn über die Leber gelaufen?
	AI_Output(self, hero, "Info_Mod_Furt_Hi_A_03_01"); //Mach nur weiter so ...

	Info_ClearChoices	(Info_Mod_Furt_Hi);

	Info_AddChoice	(Info_Mod_Furt_Hi, "Du hast bestimmt nicht viele Freunde, oder?", Info_Mod_Furt_Hi_D);
	Info_AddChoice	(Info_Mod_Furt_Hi, "Sag mal, machst du jeden Neuen so an?", Info_Mod_Furt_Hi_C);
};

FUNC VOID Info_Mod_Furt_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_Furt_Hi_D_15_00"); //Du hast bestimmt nicht viele Freunde, oder?
	AI_Output(self, hero, "Info_Mod_Furt_Hi_D_03_01"); //Bestimmt mehr als du. Und jetzt hau ab!
	AI_Output(hero, self, "Info_Mod_Furt_Hi_D_15_02"); //Ich bin noch nicht fertig.
	AI_Output(self, hero, "Info_Mod_Furt_Hi_D_03_03"); //Du verschwindest besser, bevor ich dir aufs Maul haue!

	Info_ClearChoices	(Info_Mod_Furt_Hi);
};

FUNC VOID Info_Mod_Furt_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_Furt_Hi_C_15_00"); //Sag mal, machst du jeden Neuen so an?
	AI_Output(self, hero, "Info_Mod_Furt_Hi_C_03_01"); //Ja.
	AI_Output(hero, self, "Info_Mod_Furt_Hi_C_15_02"); //Bist wohl kein Mann der großen Worte, was?
	AI_Output(self, hero, "Info_Mod_Furt_Hi_C_03_03"); //Nein.
	AI_Output(hero, self, "Info_Mod_Furt_Hi_C_15_04"); //Willst du mir sonst noch was sagen?
	AI_Output(self, hero, "Info_Mod_Furt_Hi_C_03_05"); //Ja. Hau ab!

	Info_ClearChoices	(Info_Mod_Furt_Hi);
};

INSTANCE Info_Mod_Furt_Faice (C_INFO)
{
	npc		= Mod_1626_VMG_Furt_MT;
	nr		= 1;
	condition	= Info_Mod_Furt_Faice_Condition;
	information	= Info_Mod_Furt_Faice_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Furt_Faice_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Turendil_Mendulus))
	&& (Mod_VMG_FaiceGifty_Gift == 10)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Furt_Faice_Info()
{
	AI_Output(self, hero, "Info_Mod_Furt_Faice_03_00"); //Was gibt’s?
	AI_Output(hero, self, "Info_Mod_Furt_Faice_15_01"); //Ich habe gehört, du weißt etwas über die Vergiftung der Spruchrolle.
	AI_Output(self, hero, "Info_Mod_Furt_Faice_03_02"); //Was? Nein! Ich weiß nichts!
};

INSTANCE Info_Mod_Furt_Faice02 (C_INFO)
{
	npc		= Mod_1626_VMG_Furt_MT;
	nr		= 1;
	condition	= Info_Mod_Furt_Faice02_Condition;
	information	= Info_Mod_Furt_Faice02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich weiß, dass du es bist. Leugnen ist zwecklos.";
};

FUNC INT Info_Mod_Furt_Faice02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Turendil_Mendulus))
	&& (Mod_VMG_FaiceGifty_Gift == 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Furt_Faice02_Info()
{
	AI_Output(hero, self, "Info_Mod_Furt_Faice02_15_00"); //Ich weiß, dass du es bist. Leugnen ist zwecklos.
	AI_Output(self, hero, "Info_Mod_Furt_Faice02_03_01"); //Wie? Wer hat dir das gesagt?
	AI_Output(hero, self, "Info_Mod_Furt_Faice02_15_02"); //Das spielt keine Rolle. Gestehe und es wird kein Blutvergießen geben.
	AI_Output(self, hero, "Info_Mod_Furt_Faice02_03_03"); //Okay, okay! Ich gestehe! Ich habe die Spruchrolle vergiftet.
	AI_Output(hero, self, "Info_Mod_Furt_Faice02_15_04"); //Na bitte, geht doch. Warum hast du das getan?
	AI_Output(self, hero, "Info_Mod_Furt_Faice02_03_05"); //Ich werde meinen Auftraggeber nicht verraten!
	AI_Output(hero, self, "Info_Mod_Furt_Faice02_15_06"); //Was soll ich jetzt mit dir machen?
	AI_Output(self, hero, "Info_Mod_Furt_Faice02_03_07"); //Lass mich laufen. Ich gebe dir 500 Goldmünzen und eine Spruchrolle „Verwandlung Scavenger“.

	B_LogEntry	(TOPIC_MOD_FAICE_HEILUNG, "Ich habe herausgefunden, dass Furt die Spruchrolle vergiftet hat.");
};

INSTANCE Info_Mod_Furt_Faice03 (C_INFO)
{
	npc		= Mod_1626_VMG_Furt_MT;
	nr		= 1;
	condition	= Info_Mod_Furt_Faice03_Condition;
	information	= Info_Mod_Furt_Faice03_Info;
	permanent	= 0;
	important	= 0;
	description	= "Warum so aufgebracht?";
};

FUNC INT Info_Mod_Furt_Faice03_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Turendil_Mendulus))
	&& (Mod_VMG_FaiceGifty_Gift == 10)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Furt_Faice02))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Furt_Faice03_Info()
{
	AI_Output(hero, self, "Info_Mod_Furt_Faice03_15_00"); //Warum so aufgebracht?
	AI_Output(self, hero, "Info_Mod_Furt_Faice03_03_01"); //Ich ... ich kann es immer noch nicht fassen, dass Faice vergiftet worden ist.
	AI_Output(hero, self, "Info_Mod_Furt_Faice03_15_02"); //(ironisch) Natürlich.
	AI_Output(self, hero, "Info_Mod_Furt_Faice03_03_03"); //Aber ... ich weiß wirklich von nichts!
};

INSTANCE Info_Mod_Furt_Faice04 (C_INFO)
{
	npc		= Mod_1626_VMG_Furt_MT;
	nr		= 1;
	condition	= Info_Mod_Furt_Faice04_Condition;
	information	= Info_Mod_Furt_Faice04_Info;
	permanent	= 0;
	important	= 0;
	description	= "Okay, gib mir das Zeug und verschwinde.";
};

FUNC INT Info_Mod_Furt_Faice04_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Furt_Faice02))
	&& ((Mod_VMG_FaiceGifty_Gift == 10)
	|| (Mod_VMG_FaiceGifty_Gift == 11))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Furt_Faice04_Info()
{
	AI_Output(hero, self, "Info_Mod_Furt_Faice04_15_00"); //Okay, gib mir das Zeug und verschwinde.
	AI_Output(self, hero, "Info_Mod_Furt_Faice04_03_01"); //Hier. Jetzt mach's gut.

	B_GiveInvItems	(self, hero, ItMi_Gold, 500);

	B_LogEntry	(TOPIC_MOD_FAICE_HEILUNG, "Ich habe Furt laufen lassen und ein paar Gegenstände von ihm erhalten. Er wird sich wohl nicht wieder blicken lassen.");

	Mod_VMG_FaiceGifty_Gift = 12;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FLUCHT");
};

INSTANCE Info_Mod_Furt_Faice05 (C_INFO)
{
	npc		= Mod_1626_VMG_Furt_MT;
	nr		= 1;
	condition	= Info_Mod_Furt_Faice05_Condition;
	information	= Info_Mod_Furt_Faice05_Info;
	permanent	= 0;
	important	= 0;
	description	= "Das reicht nicht.";
};

FUNC INT Info_Mod_Furt_Faice05_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Furt_Faice02))
	&& (Mod_VMG_FaiceGifty_Gift == 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Furt_Faice05_Info()
{
	AI_Output(hero, self, "Info_Mod_Furt_Faice05_15_00"); //Das reicht nicht.
	AI_Output(self, hero, "Info_Mod_Furt_Faice05_03_01"); //Ich gebe dir noch eine Spruchrolle drauf. Mehr gibt es nicht.
	
	Mod_VMG_FaiceGifty_Gift = 11;
};

INSTANCE Info_Mod_Furt_Faice06 (C_INFO)
{
	npc		= Mod_1626_VMG_Furt_MT;
	nr		= 1;
	condition	= Info_Mod_Furt_Faice06_Condition;
	information	= Info_Mod_Furt_Faice06_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich werde Turndil erzählen, dass du die Spruchrolle vergiftet hast.";
};

FUNC INT Info_Mod_Furt_Faice06_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Furt_Faice02))
	&& ((Mod_VMG_FaiceGifty_Gift == 10)
	|| (Mod_VMG_FaiceGifty_Gift == 11))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Furt_Faice06_Info()
{
	AI_Output(hero, self, "Info_Mod_Furt_Faice06_15_00"); //Ich werde Turndil erzählen, dass du die Spruchrolle vergiftet hast.
	AI_Output(self, hero, "Info_Mod_Furt_Faice06_03_01"); //Tu, was du nicht lassen kannst.
	AI_Output(hero, self, "Info_Mod_Furt_Faice06_15_02"); //Ja, ich werde zu Turendil gehen.
	AI_Output(self, hero, "Info_Mod_Furt_Faice06_03_03"); //Dann ist es so. Lebe wohl.

	Mod_VMG_FaiceGifty_Gift = 13;

	B_LogEntry	(TOPIC_MOD_FAICE_HEILUNG, "Ich werde Turendil verraten, dass Furt die Spruchrolle von Faice vergiftet hat.");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Furt_Pickpocket (C_INFO)
{
	npc		= Mod_1626_VMG_Furt_MT;
	nr		= 1;
	condition	= Info_Mod_Furt_Pickpocket_Condition;
	information	= Info_Mod_Furt_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Furt_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 110);
};

FUNC VOID Info_Mod_Furt_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Furt_Pickpocket);

	Info_AddChoice	(Info_Mod_Furt_Pickpocket, DIALOG_BACK, Info_Mod_Furt_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Furt_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Furt_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Furt_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Furt_Pickpocket);
};

FUNC VOID Info_Mod_Furt_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Furt_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Furt_Pickpocket);

		Info_AddChoice	(Info_Mod_Furt_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Furt_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Furt_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Furt_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Furt_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Furt_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Furt_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Furt_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Furt_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Furt_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Furt_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Furt_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Furt_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Furt_EXIT (C_INFO)
{
	npc		= Mod_1626_VMG_Furt_MT;
	nr		= 1;
	condition	= Info_Mod_Furt_EXIT_Condition;
	information	= Info_Mod_Furt_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Furt_EXIT_Condition()
{
	if (Mod_VMG_FaiceGifty_Gift < 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Furt_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};