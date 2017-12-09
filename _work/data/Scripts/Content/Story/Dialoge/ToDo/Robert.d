INSTANCE Info_Mod_Robert_Andre (C_INFO)
{
	npc		= Mod_7242_OUT_Robert_REL;
	nr		= 1;
	condition	= Info_Mod_Robert_Andre_Condition;
	information	= Info_Mod_Robert_Andre_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Robert_Andre_Condition()
{
	if ((Npc_KnowsInfo(hero, Info_Mod_Wendel_Andre))
	|| (Npc_KnowsInfo(hero, Info_Mod_Lukas_Andre))
	|| (Npc_KnowsInfo(hero, Info_Mod_Theodorus_Andre)))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Robert_Andre_Info()
{
	AI_Output(self, hero, "Info_Mod_Robert_Andre_05_00"); //Ah, du bist's. Hier, das solls'te abhol'n.

	B_GiveInvItems	(self, hero, ItBe_Kettenhemd, 1);

	B_Say	(hero, self, "$WASISTDAS");

	AI_Output(self, hero, "Info_Mod_Robert_Andre_05_01"); //'n Kettenhemd. Das is' 'n Meisterwerk! Hatte noch nie so gutes Material im Ofen, geschweige denn unterm Hammer.
	AI_Output(hero, self, "Info_Mod_Robert_Andre_15_02"); //Ich verstehe nicht.
	AI_Output(self, hero, "Info_Mod_Robert_Andre_05_03"); //Andre hat es in Auftrag gegeben. Hat gesagt, ich soll alles bereit machen für 'ne große Ladung magisches Erz und daraus 'n Kettenhemd schmieden. Du würdest es dann abholen.
};

INSTANCE Info_Mod_Robert_Plagenquest (C_INFO)
{
	npc		= Mod_7242_OUT_Robert_REL;
	nr		= 1;
	condition	= Info_Mod_Robert_Plagenquest_Condition;
	information	= Info_Mod_Robert_Plagenquest_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe alle Sachen, die ihr für die chemische Keule braucht.";
};

FUNC INT Info_Mod_Robert_Plagenquest_Condition()
{
	if ((Npc_KnowsInfo(hero, Info_Mod_Lukas_Plagenquest_02))
	|| (Npc_KnowsInfo(hero, Info_Mod_Wendel_Plagenquest_02))
	|| (Npc_KnowsInfo(hero, Info_Mod_Theodorus_Plagenquest_02)))
	&& (Npc_HasItems(hero, ItMi_Nugget) >= 8)
	&& (Npc_HasItems(hero, ItMi_HolyWater) >= 2)
	&& (Npc_HasItems(hero, ItMi_GoldNugget_Addon) >= 1)
	&& (Npc_HasItems(hero, ItMi_Sulfur) >= 1)
	&& (Npc_HasItems(hero, ItAt_LurkerSkin) >= 1)
	&& (Npc_HasItems(hero, ItMi_StarkerTabak) >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Robert_Plagenquest_Info()
{
	AI_Output(hero, self, "Info_Mod_Robert_Plagenquest_15_00"); //Ich habe alle Sachen, die ihr für die chemische Keule braucht.

	B_ShowGivenThings	("Diverse Items gegeben");

	AI_Output(self, hero, "Info_Mod_Robert_Plagenquest_05_01"); //Hey, gut man, dann leg ich mal los. Komm in paar Stunden wieder wieder.

	Npc_RemoveInvItems	(hero, ItMi_Nugget, 8);
	Npc_RemoveInvItems	(hero, ItMi_HolyWater, 2);
	Npc_RemoveInvItems	(hero, ItMi_GoldNugget_Addon, 1);
	Npc_RemoveInvItems	(hero, ItMi_Sulfur, 1);
	Npc_RemoveInvItems	(hero, ItAt_LurkerSkin, 1);
	Npc_RemoveInvItems	(hero, ItMi_StarkerTabak, 2);

	B_LogEntry	(TOPIC_MOD_ADANOS_DRECKSVIECHER, "Ich habe dem Schmied alles für die Keule gegeben und kann sie in einigen Stunden abholen.");

	B_GivePlayerXP	(150);

	Mod_WM_RobertChemo = Wld_GetDay();
};

INSTANCE Info_Mod_Robert_Plagenquest_02 (C_INFO)
{
	npc		= Mod_7242_OUT_Robert_REL;
	nr		= 1;
	condition	= Info_Mod_Robert_Plagenquest_02_Condition;
	information	= Info_Mod_Robert_Plagenquest_02_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Robert_Plagenquest_02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Robert_Plagenquest))
	&& (Wld_GetDay() > Mod_WM_RobertChemo)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Robert_Plagenquest_02_Info()
{
	AI_Output(self, hero, "Info_Mod_Robert_Plagenquest_02_05_00"); //Jo, gut man, habe das hübsche Stück fertig gemacht. Jetzt musst du nur noch zum Schrein Innos watscheln und die Weihe vollziehen.

	B_GiveInvItems	(self, hero, ItMw_Chemo_Unloaded, 1);

	B_LogEntry	(TOPIC_MOD_ADANOS_DRECKSVIECHER, "Ich habe die Keule. Jetzt muss ich sie nur noch an einem Schrein Innos weihen.");

	B_GivePlayerXP	(200);
};

INSTANCE Info_Mod_Robert_Nagelnachschub (C_INFO)
{
	npc		= Mod_7242_OUT_Robert_REL;
	nr		= 1;
	condition	= Info_Mod_Robert_Nagelnachschub_Condition;
	information	= Info_Mod_Robert_Nagelnachschub_Info;
	permanent	= 0;
	important	= 0;
	description	= "Verkaufst du Nägel?";
};

FUNC INT Info_Mod_Robert_Nagelnachschub_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lukas_Wettstreit))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Robert_Nagelnachschub_Info()
{
	AI_Output(hero, self, "Info_Mod_Robert_Nagelnachschub_15_00"); //Verkaufst du Nägel?
	AI_Output(self, hero, "Info_Mod_Robert_Nagelnachschub_05_01"); //Nö. Die brauche ich schon selbst.
	AI_Output(hero, self, "Info_Mod_Robert_Nagelnachschub_15_02"); //Kannst du denn keine herstellen?
	AI_Output(self, hero, "Info_Mod_Robert_Nagelnachschub_05_03"); //Kann ich schon ... aber nicht ohne Auftrag.
	AI_Output(hero, self, "Info_Mod_Robert_Nagelnachschub_15_04"); //Dann erteile ich dir den Auftrag, Nägel herzustellen.
	AI_Output(self, hero, "Info_Mod_Robert_Nagelnachschub_05_05"); //Dafür benötige ich einen Eisenrohling, den ich einschmelzen kann ... und 'ne Flasche Grog als Bezahlung.
	AI_Output(hero, self, "Info_Mod_Robert_Nagelnachschub_15_06"); //Wie viele Nägel kannst du fertigen?
	AI_Output(self, hero, "Info_Mod_Robert_Nagelnachschub_05_07"); //Ich habe noch 'nen Haufen Arbeit vor mir. Ich fülle dir ein Paket randvoll, das muss reichen.

	B_LogEntry	(TOPIC_MOD_KHORATA_NAGELNACHSCHUB, "Robert fertigt mir ein Paket voller Nägel an, wenn ich ihm einen Rohling und eine Flasche Grog bringe.");
};

INSTANCE Info_Mod_Robert_Nagelnachschub2 (C_INFO)
{
	npc		= Mod_7242_OUT_Robert_REL;
	nr		= 1;
	condition	= Info_Mod_Robert_Nagelnachschub2_Condition;
	information	= Info_Mod_Robert_Nagelnachschub2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier hast du einen Rohling und den Grog.";
};

FUNC INT Info_Mod_Robert_Nagelnachschub2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Robert_Nagelnachschub))
	&& (Npc_HasItems(hero, ItFo_Addon_Grog) >= 1)
	&& (Npc_HasItems(hero, ItMiSwordraw) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Robert_Nagelnachschub2_Info()
{
	AI_Output(hero, self, "Info_Mod_Robert_Nagelnachschub2_15_00"); //Hier hast du einen Rohling und den Grog.

	Npc_RemoveInvItems	(hero, ItMiSwordraw, 1);
	Npc_RemoveInvItems	(hero, ItFo_Addon_Grog, 1);

	B_ShowGivenThings	("Grog und Rohstahl gegeben");

	AI_Output(self, hero, "Info_Mod_Robert_Nagelnachschub2_05_01"); //Na gut, ich mach mich an die Arbeit. Komm morgen wieder vorbei.

	B_LogEntry	(TOPIC_MOD_KHORATA_NAGELNACHSCHUB, "Robert braucht einen Tag, um die Nägel herzustellen.");

	Mod_REL_Nagelnachschub_Tag = Wld_GetDay();
};

INSTANCE Info_Mod_Robert_Nagelnachschub3 (C_INFO)
{
	npc		= Mod_7242_OUT_Robert_REL;
	nr		= 1;
	condition	= Info_Mod_Robert_Nagelnachschub3_Condition;
	information	= Info_Mod_Robert_Nagelnachschub3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bist du fertig?";
};

FUNC INT Info_Mod_Robert_Nagelnachschub3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Robert_Nagelnachschub2))
	&& (Wld_GetDay() > Mod_REL_Nagelnachschub_Tag)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Robert_Nagelnachschub3_Info()
{
	AI_Output(hero, self, "Info_Mod_Robert_Nagelnachschub3_15_00"); //Bist du fertig?
	AI_Output(self, hero, "Info_Mod_Robert_Nagelnachschub3_05_01"); //Hätte ich noch Kunden, wenn ich meine Termine nicht einhalten würde? Natürlich bin ich fertig.

	B_GiveInvItems	(self, hero, ItMi_Nagelpaket, 1);

	AI_Output(self, hero, "Info_Mod_Robert_Nagelnachschub3_05_02"); //Und nun stör mich nicht weiter.

	B_GivePlayerXP	(50);
};

INSTANCE Info_Mod_Robert_Dietriche (C_INFO)
{
	npc		= Mod_7242_OUT_Robert_REL;
	nr		= 1;
	condition	= Info_Mod_Robert_Dietriche_Condition;
	information	= Info_Mod_Robert_Dietriche_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich komme von Thorben und möchte Dietriche in Auftrag geben.";
};

FUNC INT Info_Mod_Robert_Dietriche_Condition()
{
	if (Mod_Thorben_Dietriche == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Robert_Dietriche_Info()
{
	AI_Output(hero, self, "Info_Mod_Robert_Dietriche_15_00"); //Ich komme von Thorben und möchte Dietriche in Auftrag geben.
	AI_Output(self, hero, "Info_Mod_Robert_Dietriche_05_01"); //Hast du den Rohstahl und 100 Goldmünzen?

	Info_ClearChoices	(Info_Mod_Robert_Dietriche);

	Info_AddChoice	(Info_Mod_Robert_Dietriche, "Nein.", Info_Mod_Robert_Dietriche_B);

	if (Npc_HasItems(hero, ItMiSwordRaw) >= 5)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 100)
	{
		Info_AddChoice	(Info_Mod_Robert_Dietriche, "Ja.", Info_Mod_Robert_Dietriche_A);
	};
};

FUNC VOID Info_Mod_Robert_Dietriche_B()
{
	AI_Output(hero, self, "Info_Mod_Robert_Dietriche_B_15_00"); //Nein.

	Info_ClearChoices	(Info_Mod_Robert_Dietriche);
};

FUNC VOID Info_Mod_Robert_Dietriche_A()
{
	AI_Output(hero, self, "Info_Mod_Robert_Dietriche_A_15_00"); //Ja.

	Npc_RemoveInvItems	(hero, ItMiSwordRaw, 5);
	Npc_RemoveInvItems	(hero, ItMi_Gold, 100);

	B_ShowGivenThings	("100 Gold und 5 Rohstahl gegeben");

	AI_Output(self, hero, "Info_Mod_Robert_Dietriche_A_05_01"); //Es wird ein Weilchen dauern, bis ich fertig bin.
	AI_Output(self, hero, "Info_Mod_Robert_Dietriche_A_05_02"); //Ich werde die Dietriche dann einem Händler aus Khorinis mitgeben, und der wird sie an Thorben liefern.
	AI_Output(self, hero, "Info_Mod_Robert_Dietriche_A_05_03"); //Du musst also auf niemanden warten.

	Mod_Thorben_Dietriche = 3;

	Info_ClearChoices	(Info_Mod_Robert_Dietriche);
};

INSTANCE Info_Mod_Robert_Pickpocket (C_INFO)
{
	npc		= Mod_7242_OUT_Robert_REL;
	nr		= 1;
	condition	= Info_Mod_Robert_Pickpocket_Condition;
	information	= Info_Mod_Robert_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Robert_Pickpocket_Condition()
{
	C_Beklauen	(78, ItMiSwordRaw, 7);
};

FUNC VOID Info_Mod_Robert_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Robert_Pickpocket);

	Info_AddChoice	(Info_Mod_Robert_Pickpocket, DIALOG_BACK, Info_Mod_Robert_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Robert_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Robert_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Robert_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Robert_Pickpocket);
};

FUNC VOID Info_Mod_Robert_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Robert_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Robert_Pickpocket);

		Info_AddChoice	(Info_Mod_Robert_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Robert_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Robert_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Robert_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Robert_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Robert_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Robert_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Robert_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Robert_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Robert_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Robert_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Robert_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Robert_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Robert_EXIT (C_INFO)
{
	npc		= Mod_7242_OUT_Robert_REL;
	nr		= 1;
	condition	= Info_Mod_Robert_EXIT_Condition;
	information	= Info_Mod_Robert_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Robert_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Robert_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};