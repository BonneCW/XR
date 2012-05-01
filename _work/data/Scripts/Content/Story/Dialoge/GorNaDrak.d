INSTANCE Info_Mod_GorNaDrak_Lehrer (C_INFO)
{
	npc		= Mod_2011_TPL_GorNaDrak_MT;
	nr		= 1;
	condition	= Info_Mod_GorNaDrak_Lehrer_Condition;
	information	= Info_Mod_GorNaDrak_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir was beibringen?";
};

FUNC INT Info_Mod_GorNaDrak_Lehrer_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_GorNaDrak_Lehrer_Info()
{
	B_Say	(hero, self, "$KANNSTDUMIRWASBEIBRINGEN");

	AI_Output(self, hero, "Info_Mod_GorNaDrak_Lehrer_09_00"); //Ich kann dir zeigen, wie du Minecrawlern die Zangen entnimmst.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_SUMPF, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_SUMPF, "Gor Na Drak kann mir zeigen wie ich Minecrawlern die Zangen entnehme.");
};

INSTANCE Info_Mod_GorNaDrak_Hueterklinge (C_INFO)
{
	npc		= Mod_2011_TPL_GorNaDrak_MT;
	nr		= 1;
	condition	= Info_Mod_GorNaDrak_Hueterklinge_Condition;
	information	= Info_Mod_GorNaDrak_Hueterklinge_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe gehört, du bist schon ziemlich lange bei den Templern.";
};

FUNC INT Info_Mod_GorNaDrak_Hueterklinge_Condition()
{
	if (Mod_TPL_Hueterklinge_Drak == 2)
	&& (Mod_TPL_Hueterklinge == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_GorNaDrak_Hueterklinge_Info()
{
	AI_Output(hero, self, "Info_Mod_GorNaDrak_Hueterklinge_15_00"); //Ich habe gehört, du bist schon ziemlich lange bei den Templern.
	AI_Output(self, hero, "Info_Mod_GorNaDrak_Hueterklinge_09_01"); //Jaja, ich hab alles miterlebt. Die große Hungernot von 84, den schlimmen Stunk von 3, das Fegefeuer von 72, das ...
	AI_Output(hero, self, "Info_Mod_GorNaDrak_Hueterklinge_15_02"); //Ich verstehe, du hast viel mitgemacht. Du hast wohl auch viel gekämpft, was?
	AI_Output(self, hero, "Info_Mod_GorNaDrak_Hueterklinge_09_03"); //Jaja, ich hab viel gekämpft.
	AI_Output(self, hero, "Info_Mod_GorNaDrak_Hueterklinge_09_04"); //Gegen den großen Troll vor 62, gegen den fiesen Drachen von 112, gegen den scharfen Scavanger von ...
	AI_Output(hero, self, "Info_Mod_GorNaDrak_Hueterklinge_15_05"); //Ich verstehe, du hast viel gekämpft.

	Info_ClearChoices	(Info_Mod_GorNaDrak_Hueterklinge);

	Info_AddChoice	(Info_Mod_GorNaDrak_Hueterklinge, "Wenn du so viel gekämpft hast, dann verdienst du doch eigentlich ... Ach egal, nicht so wichtig.", Info_Mod_GorNaDrak_Hueterklinge_C);
	Info_AddChoice	(Info_Mod_GorNaDrak_Hueterklinge, "Wenn du so viel gekämpft hast, wird dein Schwert wohl ziemlich viele Kerben haben, oder?", Info_Mod_GorNaDrak_Hueterklinge_B);
	Info_AddChoice	(Info_Mod_GorNaDrak_Hueterklinge, "Wenn du so viel gekämpft hast, wirst du dein Schwert wohl nicht mehr brauchen, oder?", Info_Mod_GorNaDrak_Hueterklinge_A);
};

FUNC VOID Info_Mod_GorNaDrak_Hueterklinge_C()
{
	AI_Output(hero, self, "Info_Mod_GorNaDrak_Hueterklinge_C_15_00"); //Wenn du so viel gekämpft hast, dann verdienst du doch eigentlich ... Ach egal, nicht so wichtig.

	Info_ClearChoices	(Info_Mod_GorNaDrak_Hueterklinge);
};

FUNC VOID Info_Mod_GorNaDrak_Hueterklinge_B()
{
	AI_Output(hero, self, "Info_Mod_GorNaDrak_Hueterklinge_B_15_00"); //Wenn du so viel gekämpft hast, wird dein Schwert wohl ziemlich viele Kerben haben, oder?
	AI_Output(self, hero, "Info_Mod_GorNaDrak_Hueterklinge_B_09_01"); //Ja ... jetzt wo du es sagst, mein Schwert hat wirklich viele Kerben ...
	AI_Output(hero, self, "Info_Mod_GorNaDrak_Hueterklinge_B_15_02"); //Wäre es dann nicht angebracht, ein neues Schwert zu führen und sich des alten zu entledigen?

	if (self.aivar[AIV_Verhandlung] == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_GorNaDrak_Hueterklinge_B_09_03"); //Gewiss ... das wäre in der Tat angebracht, das wäre sogar sehr angebracht!
		AI_Output(self, hero, "Info_Mod_GorNaDrak_Hueterklinge_B_09_04"); //Aber woher bekomme ich jemals ein neues Schwert?
		AI_Output(self, hero, "Info_Mod_GorNaDrak_Hueterklinge_B_09_05"); //Wir sind hier Mitten in der Wüste und es gibt weit und breit keine Schmiede.
		AI_Output(hero, self, "Info_Mod_GorNaDrak_Hueterklinge_B_15_06"); //Ich besorg‘ dir eines.

		Mod_TPL_Hueterklinge_Drak = 2;

		B_LogEntry	(TOPIC_MOD_SL_SCHMIEDEFEUERN, "Ich muss Gor Na Drak ein neues Schwert besorgen.");
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_GorNaDrak_Hueterklinge_B_09_07"); //Ein neues Schwert?! Niemals!
		AI_Output(self, hero, "Info_Mod_GorNaDrak_Hueterklinge_B_09_08"); //Ich weiß nicht, ob du‘s weißt, aber ich habe mit diesem Schwert schon gegen den großen Troll von 62 gekämpft, und gegen den fiesen Drachen von 112 und ...

		AI_TurnAway	(hero, self);

		AI_Output(hero, self, "Info_Mod_GorNaDrak_Hueterklinge_B_15_09"); //(zu sich selbst) Das kann ich wohl vergessen.

		AI_TurnToNpc	(hero, self);
	};

	Info_ClearChoices	(Info_Mod_GorNaDrak_Hueterklinge);
};

FUNC VOID Info_Mod_GorNaDrak_Hueterklinge_A()
{
	AI_Output(hero, self, "Info_Mod_GorNaDrak_Hueterklinge_A_15_00"); //Wenn du so viel gekämpft hast, wirst du dein Schwert wohl nicht mehr brauchen, oder?
	AI_Output(self, hero, "Info_Mod_GorNaDrak_Hueterklinge_A_09_01"); //MEIN SCHWERT NICHT MEHR BRAUCHEN???
	AI_Output(self, hero, "Info_Mod_GorNaDrak_Hueterklinge_A_09_02"); //Aber was wenn der große Troll von 62 von schwarzer Magie ungetötet wird und zum großen, untoten Troll von 417 wird?
	AI_Output(self, hero, "Info_Mod_GorNaDrak_Hueterklinge_A_09_03"); //Was wenn die Knochen des fiesen  Drachens von 112 wieder zusammenfinden und zum grauenhaften Drachenskelett von 45 werden?
	AI_Output(self, hero, "Info_Mod_GorNaDrak_Hueterklinge_A_09_04"); //Was wenn ...
	AI_Output(hero, self, "Info_Mod_GorNaDrak_Hueterklinge_A_15_05"); //Ich verstehe, du brauchst dein Schwert also noch.

	Info_ClearChoices	(Info_Mod_GorNaDrak_Hueterklinge);
};

INSTANCE Info_Mod_GorNaDrak_Hueterklinge2 (C_INFO)
{
	npc		= Mod_2011_TPL_GorNaDrak_MT;
	nr		= 1;
	condition	= Info_Mod_GorNaDrak_Hueterklinge2_Condition;
	information	= Info_Mod_GorNaDrak_Hueterklinge2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab hier ein Schwert für dich.";
};

FUNC INT Info_Mod_GorNaDrak_Hueterklinge2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_GorNaDrak_Hueterklinge))
	&& (Mod_TPL_Hueterklinge_Drak == 2)
	&& (Mod_TPL_Hueterklinge == 0)
	&& ((Npc_HasItems(hero, ItMw_1h_MISC_Sword) >= 1)
	|| (Npc_HasItems(hero, ItMw_1H_Common_01) >= 1)
	|| (Npc_HasItems(hero, ItMw_Schwert1) >= 1))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_GorNaDrak_Hueterklinge2_Info()
{
	AI_Output(hero, self, "Info_Mod_GorNaDrak_Hueterklinge2_15_00"); //Ich hab hier ein Schwert für dich.
	AI_Output(self, hero, "Info_Mod_GorNaDrak_Hueterklinge2_09_01"); //Ach ja? Welches?

	Info_ClearChoices	(Info_Mod_GorNaDrak_Hueterklinge2);

	if (Npc_HasItems(hero, ItMw_Schwert1) >= 1)
	{
		Info_AddChoice	(Info_Mod_GorNaDrak_Hueterklinge2, "(edles Schwert anbieten)", Info_Mod_GorNaDrak_Hueterklinge2_C);
	};
	if (Npc_HasItems(hero, ItMw_1H_Common_01) >= 1)
	{
		Info_AddChoice	(Info_Mod_GorNaDrak_Hueterklinge2, "(Schwert anbieten)", Info_Mod_GorNaDrak_Hueterklinge2_B);
	};
	if (Npc_HasItems(hero, ItMw_1h_MISC_Sword) >= 1)
	{
		Info_AddChoice	(Info_Mod_GorNaDrak_Hueterklinge2, "(rostiges Schwert anbieten)", Info_Mod_GorNaDrak_Hueterklinge2_A);
	};
};

FUNC VOID Info_Mod_GorNaDrak_Hueterklinge2_E()
{
	AI_Output(self, hero, "Info_Mod_GorNaDrak_Hueterklinge2_E_09_00"); //Oh ja, ein wunderschönes Schwert, ein Meisterwerk!
	AI_Output(self, hero, "Info_Mod_GorNaDrak_Hueterklinge2_E_09_01"); //Geschmiedet von flinken Fingern, um von einer starken Hand geführt zu werden! Ich LIEBE es!
	AI_Output(hero, self, "Info_Mod_GorNaDrak_Hueterklinge2_E_15_02"); //Dein altes Schwert wirst du jetzt wohl nicht mehr brauchen, oder?
	AI_Output(self, hero, "Info_Mod_GorNaDrak_Hueterklinge2_E_09_03"); //Ach ja ... das sollte ich wohl wegwerfen.
	AI_Output(self, hero, "Info_Mod_GorNaDrak_Hueterklinge2_E_09_04"); //Aber wir sind hier auf dem Gipfel eines Gletschers und ich sehe weit und breit keinen Abfallbehälter für Altmetall ...
	AI_Output(hero, self, "Info_Mod_GorNaDrak_Hueterklinge2_E_15_05"); //Ich werf’s für dich weg.
	AI_Output(hero, self, "Info_Mod_GorNaDrak_Hueterklinge2_E_15_06"); //Das ist sehr freundlich von dir! Vielen Dank.

	if (Mod_TPL_Hueterklinge_Art == 2)
	{
		B_GiveInvItems	(self, hero, ItMw_AlteHueterklinge_2H, 1);
	}
	else
	{
		B_GiveInvItems	(self, hero, ItMw_AlteHueterklinge_1H, 1);
	};

	B_LogEntry	(TOPIC_MOD_SL_SCHMIEDEFEUERN, "Ich hab die alte Hüterklinge von Gor Na Drak. Ich sollte jetzt mal bei Cor Angar vorstellig werden.");

	Mod_TPL_Hueterklinge = 1;

	Info_ClearChoices	(Info_Mod_GorNaDrak_Hueterklinge2);
};

FUNC VOID Info_Mod_GorNaDrak_Hueterklinge2_D()
{
	AI_Output(self, hero, "Info_Mod_GorNaDrak_Hueterklinge2_D_09_00"); //Was?! Das soll ein Schwert sein?
	AI_Output(self, hero, "Info_Mod_GorNaDrak_Hueterklinge2_D_09_01"); //Mit so etwas würd ich mir den Hintern nicht abwischen!

	Info_ClearChoices	(Info_Mod_GorNaDrak_Hueterklinge2);
};

FUNC VOID Info_Mod_GorNaDrak_Hueterklinge2_C()
{
	B_GiveInvItems	(hero, self, ItMw_Schwert1, 1);

	Info_Mod_GorNaDrak_Hueterklinge2_E();
};

FUNC VOID Info_Mod_GorNaDrak_Hueterklinge2_B()
{
	B_GiveInvItems	(hero, self, ItMw_Schwert1, 1);

	if (Hlp_Random(100) < 50)
	{
		Info_Mod_GorNaDrak_Hueterklinge2_E();
	}
	else
	{
		Info_Mod_GorNaDrak_Hueterklinge2_D();
	};
};

FUNC VOID Info_Mod_GorNaDrak_Hueterklinge2_A()
{
	B_GiveInvItems	(hero, self, ItMw_Schwert1, 1);

	if (Hlp_Random(100) < 25)
	{
		Info_Mod_GorNaDrak_Hueterklinge2_E();
	}
	else
	{
		Info_Mod_GorNaDrak_Hueterklinge2_D();
	};
};

INSTANCE Info_Mod_GorNaDrak_CrawlerZangen (C_INFO)
{
	npc		= Mod_2011_TPL_GorNaDrak_MT;
	nr		= 1;
	condition	= Info_Mod_GorNaDrak_CrawlerZangen_Condition;
	information	= Info_Mod_GorNaDrak_CrawlerZangen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Kannst du mir sagen, wie ich an das Sekret eines Minecrawlers herankomme? (3 LP)";
};

FUNC INT Info_Mod_GorNaDrak_CrawlerZangen_Condition()
{
	Info_Mod_GorNaDrak_CrawlerZangen.description = B_BuildLearnString("Kannst du mir sagen, wie ich an das Sekret eines Minecrawlers herankomme?", B_GetLearnCostTalent(hero, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Mandibles));

	if (Npc_KnowsInfo(hero, Info_Mod_GorNaDrak_Lehrer))
	&& (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_GorNaDrak_CrawlerZangen_Info()
{
	AI_Output(hero, self, "Info_Mod_GorNaDrak_CrawlerZangen_15_00"); //Kannst du mir sagen, wie ich an das Sekret eines Minecrawlers herankomme?

	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Mandibles))
	{
		AI_Output(self, hero, "Info_Mod_GorNaDrak_CrawlerZangen_09_01"); //Klar, nachdem du das Vieh getötet hast, packst du es an den Beißzangen und reißt sie gerade heraus. Dann kommt die Sekretdrüse mit raus, ohne zu zerreißen.
		AI_Output(self, hero, "Info_Mod_GorNaDrak_CrawlerZangen_09_02"); //Ich habe übrigens gehört, dass das so auch mit Feldräubern klappen soll.
	};
};

INSTANCE Info_Mod_GorNaDrak_Pickpocket (C_INFO)
{
	npc		= Mod_2011_TPL_GorNaDrak_MT;
	nr		= 1;
	condition	= Info_Mod_GorNaDrak_Pickpocket_Condition;
	information	= Info_Mod_GorNaDrak_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_GorNaDrak_Pickpocket_Condition()
{
	C_Beklauen	(74, ItMi_Gold, 120);
};

FUNC VOID Info_Mod_GorNaDrak_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_GorNaDrak_Pickpocket);

	Info_AddChoice	(Info_Mod_GorNaDrak_Pickpocket, DIALOG_BACK, Info_Mod_GorNaDrak_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_GorNaDrak_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_GorNaDrak_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_GorNaDrak_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_GorNaDrak_Pickpocket);
};

FUNC VOID Info_Mod_GorNaDrak_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_GorNaDrak_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_GorNaDrak_Pickpocket);

		Info_AddChoice	(Info_Mod_GorNaDrak_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_GorNaDrak_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_GorNaDrak_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_GorNaDrak_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_GorNaDrak_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_GorNaDrak_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_GorNaDrak_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_GorNaDrak_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_GorNaDrak_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_GorNaDrak_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_GorNaDrak_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_GorNaDrak_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_GorNaDrak_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_GorNaDrak_EXIT (C_INFO)
{
	npc		= Mod_2011_TPL_GorNaDrak_MT;
	nr		= 1;
	condition	= Info_Mod_GorNaDrak_EXIT_Condition;
	information	= Info_Mod_GorNaDrak_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_GorNaDrak_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_GorNaDrak_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};