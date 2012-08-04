INSTANCE Info_Mod_Granmar_Hi (C_INFO)
{
	npc		= Mod_1017_KGD_Granmar_MT;
	nr		= 1;
	condition	= Info_Mod_Granmar_Hi_Condition;
	information	= Info_Mod_Granmar_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Granmar_Hi_Condition()
{
	if (Wld_IsTime(08,00,20,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Granmar_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Granmar_Hi_08_00"); //Stop, was willst du hier?
	AI_Output(hero, self, "Info_Mod_Granmar_Hi_15_01"); //Ich weiß noch nicht genau. Was gibt’s hier denn?
	AI_Output(self, hero, "Info_Mod_Granmar_Hi_08_02"); //Na ja, wenn du für uns arbeiten willst, solltest du zu Ole gehen.
	AI_Output(self, hero, "Info_Mod_Granmar_Hi_08_03"); //Ansonsten könntest du dir noch bei Bernd ein paar Sachen kaufen. Das Minental ist ein hartes Pflaster und unvorbereitet sollte man sich nicht zu tief hinein wagen.
	AI_Output(hero, self, "Info_Mod_Granmar_Hi_15_04"); //Mhm, ok, danke für den Tipp.
};

INSTANCE Info_Mod_Granmar_Aufgabe (C_INFO)
{
	npc		= Mod_1017_KGD_Granmar_MT;
	nr		= 1;
	condition	= Info_Mod_Granmar_Aufgabe_Condition;
	information	= Info_Mod_Granmar_Aufgabe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ole schickt mich, ich soll dir bei der Sache mit der Mine helfen!";
};

FUNC INT Info_Mod_Granmar_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ole_Vorbereitungen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Granmar_Aufgabe_Info()
{
	AI_Output(hero, self, "Info_Mod_Granmar_Aufgabe_15_00"); //Ole schickt mich, ich soll dir bei der Sache mit der Mine helfen!
	AI_Output(self, hero, "Info_Mod_Granmar_Aufgabe_08_01"); //Ok, Hilfe kann ich brauchen!
	AI_Output(self, hero, "Info_Mod_Granmar_Aufgabe_08_02"); //Ich soll mich um die komischen Steinmonster in der Mine kümmern, allerdings sind diese Viecher gegen normale Waffen resistent.
	AI_Output(self, hero, "Info_Mod_Granmar_Aufgabe_08_03"); //Der einzige Hinweis steht in einem Buch, welches ich von den Wassermagiern erworben habe.
	AI_Output(self, hero, "Info_Mod_Granmar_Aufgabe_08_04"); //Anscheinend sind diese Steinmonster nur mit Hilfe von erzüberzogenen Keulen besiegbar.
	AI_Output(self, hero, "Info_Mod_Granmar_Aufgabe_08_05"); //Ich habe mit Heidrek auch schon darüber gesprochen und er meint, dass man dafür ein bestimmtes Holz braucht, das nur in der Nähe von Trollen zu finden ist.
	AI_Output(hero, self, "Info_Mod_Granmar_Aufgabe_15_06"); //Und wo ist hier in der Nähe ein Troll?
	AI_Output(self, hero, "Info_Mod_Granmar_Aufgabe_08_07"); //Soweit ich weiß gibt es hier sogar einen Trollkessel, in der Nähe des Banditenlagers.
	AI_Output(self, hero, "Info_Mod_Granmar_Aufgabe_08_08"); //Allerdings ist mir mein gutes Schwert abhanden gekommen und Heidrek konnte mir noch kein neues anfertigen.
	AI_Output(self, hero, "Info_Mod_Granmar_Aufgabe_08_09"); //Ohne mein Schwert werde ich ganz sicher nicht in die Nähe von Trollen gehen.
	AI_Output(hero, self, "Info_Mod_Granmar_Aufgabe_15_10"); //Na gut, dann werde ich eben danach suchen, aber dafür will ich auch eine angemessene Belohnung.
	AI_Output(self, hero, "Info_Mod_Granmar_Aufgabe_08_11"); //Glaub mir, wenn du das Holz findest, wirst du es nicht bereuen.

	Log_CreateTopic	(TOPIC_MOD_KG_TROLLHOLZ, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_KG_TROLLHOLZ, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_KG_TROLLHOLZ, "Granmar sollte die Steinmonster in der Mine töten, doch benötigt er dafür eine erzüberzogene Keule. Dafür ist jedoch ein Stück Trollholz nötig, welches ich nun besorgen darf. Vielleicht finde ich im Trollkessel beim Banditenlager ein Stück von diesem Holz ...");

	Wld_InsertItem	(ItMi_Trollholz, "FP_ITEM_TROLLHOLZ");

	Wld_InsertNpc	(Gobbo_Warrior,	"FP_ITEM_TROLLHOLZ");
	Wld_InsertNpc	(Gobbo_Warrior,	"FP_ITEM_TROLLHOLZ");
	Wld_InsertNpc	(Gobbo_Warrior,	"FP_ITEM_TROLLHOLZ");
};

INSTANCE Info_Mod_Granmar_Trollholz (C_INFO)
{
	npc		= Mod_1017_KGD_Granmar_MT;
	nr		= 1;
	condition	= Info_Mod_Granmar_Trollholz_Condition;
	information	= Info_Mod_Granmar_Trollholz_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe das Holz gefunden.";
};

FUNC INT Info_Mod_Granmar_Trollholz_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Granmar_Aufgabe))
	&& (Npc_HasItems(hero, ItMi_Trollholz) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Granmar_Trollholz_Info()
{
	AI_Output(hero, self, "Info_Mod_Granmar_Trollholz_15_00"); //Ich habe das Holz gefunden. Was machen wir jetzt damit?
	AI_Output(self, hero, "Info_Mod_Granmar_Trollholz_08_01"); //Sehr gut, bring es gleich zu Heidrek, er wird daraus eine Keule machen.

	B_LogEntry	(TOPIC_MOD_KG_TROLLHOLZ, "Ich soll das Trollholz zu Heidrek bringen, damit er daraus die Keule herstellen kann.");

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Granmar_Trollholz2 (C_INFO)
{
	npc		= Mod_1017_KGD_Granmar_MT;
	nr		= 1;
	condition	= Info_Mod_Granmar_Trollholz2_Condition;
	information	= Info_Mod_Granmar_Trollholz2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Keulen sind fertig!";
};

FUNC INT Info_Mod_Granmar_Trollholz2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Heidrek_Trollholz3))
	&& (Npc_HasItems(hero, ItMW_GranmarKeule) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Granmar_Trollholz2_Info()
{
	AI_Output(hero, self, "Info_Mod_Granmar_Trollholz2_15_00"); //Die Keulen sind fertig!

	B_GiveInvItems	(hero, self, ItMw_GranmarKeule, 1);

	AI_Output(self, hero, "Info_Mod_Granmar_Trollholz2_08_01"); //Perfekt, dann können wir ja bald auf die Jagd gehen.
	AI_Output(self, hero, "Info_Mod_Granmar_Trollholz2_08_02"); //Sag mir Bescheid, sobald Hymir das Ok gibt.

	B_LogEntry_More	(TOPIC_MOD_KG_VORBEREITUNGEN, TOPIC_MOD_KG_TROLLHOLZ, "Granmars Probleme sind gelöst.", "Granmar ist nun bereit die Mine zu stürmen. Ich soll ihm dann Bescheid geben, wenn Hymir das OK gibt.");
	B_SetTopicStatus	(TOPIC_mOD_KG_TROLLHOLZ, LOG_SUCCESS);

	B_GivePlayerXP	(150);
};

INSTANCE Info_Mod_Granmar_PreLehrer (C_INFO)
{
	npc		= Mod_1017_KGD_Granmar_MT;
	nr		= 1;
	condition	= Info_Mod_Granmar_PreLehrer_Condition;
	information	= Info_Mod_Granmar_PreLehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie schaut es aus, kannst du mir zeigen wie ich ein besserer Kämpfer werde?";
};

FUNC INT Info_Mod_Granmar_PreLehrer_Condition()
{
	if (KG_Dabei == 1)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Granmar_Trollholz2))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Granmar_PreLehrer_Info()
{
	AI_Output(hero, self, "Info_Mod_Granmar_PreLehrer_15_00"); //Wie schaut es aus, kannst du mir zeigen wie ich ein besserer Kämpfer werde?
	AI_Output(self, hero, "Info_Mod_Granmar_PreLehrer_08_01"); //Ich könnte dir schon was beibringen, allerdings solang ich keine gescheite Waffe habe, werd ich mir die Mühe nicht machen.
	AI_Output(self, hero, "Info_Mod_Granmar_PreLehrer_08_02"); //Frag mich noch mal wenn Heidrek mein neues Schwert fertig hat.
};

INSTANCE Info_Mod_Granmar_Lehrer (C_INFO)
{
	npc		= Mod_1017_KGD_Granmar_MT;
	nr		= 1;
	condition	= Info_Mod_Granmar_Lehrer_Condition;
	information	= Info_Mod_Granmar_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie sieht es aus, kannst du mir jetzt zeigen wie ich besser werde?";
};

FUNC INT Info_Mod_Granmar_Lehrer_Condition()
{
	if (KG_Dabei == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Granmar_Trollholz2))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Granmar_Lehrer_Info()
{
	AI_Output(hero, self, "Info_Mod_Granmar_Lehrer_15_00"); //Wie sieht es aus, kannst du mir jetzt zeigen, wie ich besser werde?
	AI_Output(self, hero, "Info_Mod_Granmar_Lehrer_08_01"); //Ok, versprochen ist versprochen. Wenn du willst kann ich dir den Umgang mit dem Zweihänder beibringen.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_KG, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_KG, "Granmar kann mir den Umgang mit Zweihändern beibringen.");
};

INSTANCE Info_Mod_Granmar_Lernen (C_INFO)
{
	npc		= Mod_1017_KGD_Granmar_MT;
	nr		= 1;
	condition	= Info_Mod_Granmar_Lernen_Condition;
	information	= Info_Mod_Granmar_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will lernen.";
};

FUNC INT Info_Mod_Granmar_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Granmar_Lehrer))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Granmar_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Granmar_Lernen_15_00"); //Ich will lernen.

	Info_ClearChoices	(Info_Mod_Granmar_Lernen);

	Info_AddChoice	(Info_Mod_Granmar_Lernen, DIALOG_BACK, Info_Mod_Granmar_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Granmar_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H)), Info_Mod_Granmar_Lernen_2H_5);
	Info_AddChoice	(Info_Mod_Granmar_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1)), Info_Mod_Granmar_Lernen_2H_1);
};

FUNC VOID Info_Mod_Granmar_Lernen_BACK()
{
	Info_ClearChoices	(Info_Mod_Granmar_Lernen);
};

FUNC VOID Info_Mod_Granmar_Lernen_2H_5()
{
	if B_TeachFightTalentPercent_New	(self, hero, NPC_TALENT_2H, 5, 100)
	{
		Info_ClearChoices	(Info_Mod_Granmar_Lernen);

		Info_AddChoice	(Info_Mod_Granmar_Lernen, DIALOG_BACK, Info_Mod_Granmar_Lernen_BACK);
		Info_AddChoice	(Info_Mod_Granmar_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H)), Info_Mod_Granmar_Lernen_2H_5);
		Info_AddChoice	(Info_Mod_Granmar_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1)), Info_Mod_Granmar_Lernen_2H_1);
	};
};

FUNC VOID Info_Mod_Granmar_Lernen_2H_1()
{
	if B_TeachFightTalentPercent	(self, hero, NPC_TALENT_2H, 1, 100)
	{
		Info_ClearChoices	(Info_Mod_Granmar_Lernen);

		Info_AddChoice	(Info_Mod_Granmar_Lernen, DIALOG_BACK, Info_Mod_Granmar_Lernen_BACK);
		Info_AddChoice	(Info_Mod_Granmar_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H)), Info_Mod_Granmar_Lernen_2H_5);
		Info_AddChoice	(Info_Mod_Granmar_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1)), Info_Mod_Granmar_Lernen_2H_1);
	};
};

INSTANCE Info_Mod_Granmar_Pickpocket (C_INFO)
{
	npc		= Mod_1017_KGD_Granmar_MT;
	nr		= 1;
	condition	= Info_Mod_Granmar_Pickpocket_Condition;
	information	= Info_Mod_Granmar_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Granmar_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 200);
};

FUNC VOID Info_Mod_Granmar_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Granmar_Pickpocket);

	Info_AddChoice	(Info_Mod_Granmar_Pickpocket, DIALOG_BACK, Info_Mod_Granmar_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Granmar_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Granmar_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Granmar_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Granmar_Pickpocket);
};

FUNC VOID Info_Mod_Granmar_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Granmar_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Granmar_Pickpocket);

		Info_AddChoice	(Info_Mod_Granmar_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Granmar_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Granmar_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Granmar_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Granmar_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Granmar_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Granmar_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Granmar_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Granmar_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Granmar_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Granmar_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Granmar_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Granmar_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Granmar_EXIT (C_INFO)
{
	npc		= Mod_1017_KGD_Granmar_MT;
	nr		= 1;
	condition	= Info_Mod_Granmar_EXIT_Condition;
	information	= Info_Mod_Granmar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Granmar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Granmar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};