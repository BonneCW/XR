INSTANCE Info_Mod_Alkor_Hi (C_INFO)
{
	npc		= Mod_7654_OUT_Alkor_REL;
	nr		= 1;
	condition	= Info_Mod_Alkor_Hi_Condition;
	information	= Info_Mod_Alkor_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alkor_Hi_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alkor_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Alkor_Hi_08_00"); //(rau) Was willst du, Hänfling? Die Schätze des Moores bergen? Ha, das ich nicht lache.
	AI_Output(hero, self, "Info_Mod_Alkor_Hi_15_01"); //Was ist dein Problem?
	AI_Output(self, hero, "Info_Mod_Alkor_Hi_08_02"); //Ja, schau dich doch mal an.
	AI_Output(self, hero, "Info_Mod_Alkor_Hi_08_03"); //So jämmerlich wie du aussiehst, überlebst du keine zehn Sekunden im giftigen Moor.
	AI_Output(self, hero, "Info_Mod_Alkor_Hi_08_04"); //Ha, wahrscheinlich überlebst du nicht mal einen richtigen Schluck Wacholder.

	Info_ClearChoices	(Info_Mod_Alkor_Hi);

	Info_AddChoice	(Info_Mod_Alkor_Hi, "Ich vertrage bestimmt mehr als du.", Info_Mod_Alkor_Hi_B);
	Info_AddChoice	(Info_Mod_Alkor_Hi, "Fall jemand anderem auf die Nerven. ", Info_Mod_Alkor_Hi_A);
};

FUNC VOID Info_Mod_Alkor_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Alkor_Hi_B_15_00"); //Ich vertrage bestimmt mehr als du.
	AI_Output(self, hero, "Info_Mod_Alkor_Hi_B_08_01"); //Ha, das ich nicht lache ... wenn du es jemals schaffen solltest, mit mir mitzuhalten, würde ich meine ganzen Reserven an Gegengift hergeben.
	AI_Output(hero, self, "Info_Mod_Alkor_Hi_B_15_02"); //Gegengift kann ich immer brauchen.
	AI_Output(self, hero, "Info_Mod_Alkor_Hi_B_08_03"); //Wir werden ja sehen. Für jeden Versuch mich unter den Tisch zu trinken, werden 40 Goldstücke für das Gesöff fällig.

	Info_ClearChoices	(Info_Mod_Alkor_Hi);

	Mod_Alkor_Contest = 1;
};

FUNC VOID Info_Mod_Alkor_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Alkor_Hi_A_15_00"); //Fall jemand anderem auf die Nerven. 
	AI_Output(self, hero, "Info_Mod_Alkor_Hi_A_08_01"); //Ja, verzieh dich bloß wieder in die Stadt, du Weichei, geh zu deiner Mami!

	Info_ClearChoices	(Info_Mod_Alkor_Hi);
};

INSTANCE Info_Mod_Alkor_StarteContest (C_INFO)
{
	npc		= Mod_7654_OUT_Alkor_REL;
	nr		= 1;
	condition	= Info_Mod_Alkor_StarteContest_Condition;
	information	= Info_Mod_Alkor_StarteContest_Info;
	permanent	= 1;
	important	= 0;
	description	= "Hier ist das Gold.";
};

FUNC INT Info_Mod_Alkor_StarteContest_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alkor_Hi))
	&& (Mod_Alkor_Contest == 1)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 40)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alkor_StarteContest_Info()
{
	AI_Output(hero, self, "Info_Mod_Alkor_StarteContest_15_00"); //Hier ist das Gold.

	B_GiveInvItems	(hero, self, ItMi_Gold, 40);

	AI_Output(self, hero, "Info_Mod_Alkor_StarteContest_08_01"); //Na gut. Dann los zur ersten Runde.

	Info_ClearChoices	(Info_Mod_Alkor_StarteContest);

	Info_AddChoice	(Info_Mod_Alkor_StarteContest, "(Weiter)", Info_Mod_Alkor_StarteContest_Weiter_01);
};

FUNC VOID Info_Mod_Alkor_StarteContest_Weiter_01()
{
	CreateInvItems	(hero, ItFo_Beer, 3);
	CreateInvItems	(self, ItFo_Beer, 3);

	B_UseItem	(self, ItFo_Beer);
	B_UseItem	(hero, ItFo_Beer);
	B_UseItem	(self, ItFo_Beer);
	B_UseItem	(hero, ItFo_Beer);
	B_UseItem	(self, ItFo_Beer);
	B_UseItem	(hero, ItFo_Beer);

	AI_Output(self, hero, "Info_Mod_Alkor_StarteContest_Weiter_01_08_00"); //Du stehst noch? Bist vielleicht doch nicht so ein Hosenscheißer, wie ich zuerst gedacht hatte. Auf zur zweiten Runde.

	Info_ClearChoices	(Info_Mod_Alkor_StarteContest);

	Info_AddChoice	(Info_Mod_Alkor_StarteContest, "(Weiter)", Info_Mod_Alkor_StarteContest_Weiter_02);
};

FUNC VOID Info_Mod_Alkor_StarteContest_Weiter_02()
{
	CreateInvItems	(hero, ItFo_Booze, 3);
	CreateInvItems	(self, ItFo_Booze, 3);

	B_UseItem	(self, ItFo_Booze);
	B_UseItem	(hero, ItFo_Booze);
	B_UseItem	(self, ItFo_Booze);
	B_UseItem	(hero, ItFo_Booze);
	B_UseItem	(self, ItFo_Booze);
	B_UseItem	(hero, ItFo_Booze);

	if (Mod_Betrunken == 1)
	{
		AI_Output(self, hero, "Info_Mod_Alkor_StarteContest_Weiter_02_08_00"); //(hämisch) Ha, wusste ich’s doch. Beim ersten Schluck von was Stärkerem hält es den Wicht nicht mehr auf den Beinen.
		AI_Output(self, hero, "Info_Mod_Alkor_StarteContest_Weiter_02_08_01"); //Hattest wohl noch nie den einen, oder anderen richtigen Rausch, hä?!
		AI_Output(self, hero, "Info_Mod_Alkor_StarteContest_Weiter_02_08_02"); //Aber danke für das Gold, du Held.

		Info_ClearChoices	(Info_Mod_Alkor_StarteContest);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Alkor_StarteContest_Weiter_02_08_03"); //(angetrunken) Was?! Du stehst noch, aber ... aber gleich nicht mehr, wenn wir zur dritt... zur dritten Runde kommen.

		Info_ClearChoices	(Info_Mod_Alkor_StarteContest);

		Info_AddChoice	(Info_Mod_Alkor_StarteContest, "(Weiter)", Info_Mod_Alkor_StarteContest_Weiter_03);
	};
};

FUNC VOID Info_Mod_Alkor_StarteContest_Weiter_03()
{
	CreateInvItems	(self, ItFo_Addon_Grog, 1);

	B_UseItem	(self, ItFo_Addon_Grog);

	AI_Output(hero, self, "Info_Mod_Alkor_StarteContest_Weiter_03_15_00"); //Na, war’s das?
	AI_Output(self, hero, "Info_Mod_Alkor_StarteContest_Weiter_03_08_01"); //(benommen) Was?! Ahh, verdammt mein Kopf. Du Mistkerl!
	AI_Output(hero, self, "Info_Mod_Alkor_StarteContest_Weiter_03_15_02"); //Tja, man sollte den Mund nicht so voll nehmen, wenn man nicht so viel verträgt. Die Tränke?
	AI_Output(self, hero, "Info_Mod_Alkor_StarteContest_Weiter_03_08_03"); //Ahh, verfluchter Mist. Hier hast du die Gegengifte. Und jetzt ... verpiss dich!

	B_GiveInvItems	(self, hero, ItPo_Gegengift, 2);

	B_GivePlayerXP	(300);

	Mod_Alkor_Contest = 2;

	Info_ClearChoices	(Info_Mod_Alkor_StarteContest);
};

INSTANCE Info_Mod_Alkor_Wasserleichen (C_INFO)
{
	npc		= Mod_7654_OUT_Alkor_REL;
	nr		= 1;
	condition	= Info_Mod_Alkor_Wasserleichen_Condition;
	information	= Info_Mod_Alkor_Wasserleichen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alkor_Wasserleichen_Condition()
{
	if (Mod_Botschek_Wasserleichen == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alkor_Wasserleichen_Info()
{
	AI_Output(self, hero, "Info_Mod_Alkor_Wasserleichen_08_00"); //Was die Leichen nicht geschafft haben, werde ich zu Ende bringen!

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_GuildEnemy, 0);

	B_LogEntry	(TOPIC_MOD_BOTSCHEK_WASSERLEICHEN, "Die Wasserleichen sind erledigt. Aber was will Alkor? Hat er den Verstand verloren?");
};

INSTANCE Info_Mod_Alkor_Pickpocket (C_INFO)
{
	npc		= Mod_7654_OUT_Alkor_REL;
	nr		= 1;
	condition	= Info_Mod_Alkor_Pickpocket_Condition;
	information	= Info_Mod_Alkor_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Alkor_Pickpocket_Condition()
{
	C_Beklauen	(85, ItMi_GoldPlate, 2);
};

FUNC VOID Info_Mod_Alkor_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Alkor_Pickpocket);

	Info_AddChoice	(Info_Mod_Alkor_Pickpocket, DIALOG_BACK, Info_Mod_Alkor_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Alkor_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Alkor_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Alkor_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Alkor_Pickpocket);
};

FUNC VOID Info_Mod_Alkor_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Alkor_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Alkor_Pickpocket);

		Info_AddChoice	(Info_Mod_Alkor_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Alkor_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Alkor_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Alkor_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Alkor_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Alkor_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Alkor_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Alkor_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Alkor_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Alkor_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Alkor_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Alkor_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Alkor_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Alkor_EXIT (C_INFO)
{
	npc		= Mod_7654_OUT_Alkor_REL;
	nr		= 1;
	condition	= Info_Mod_Alkor_EXIT_Condition;
	information	= Info_Mod_Alkor_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Alkor_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Alkor_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};