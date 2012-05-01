INSTANCE Info_Mod_Berdin_Hi (C_INFO)
{
	npc		= Mod_1018_KGD_Berdin_MT;
	nr		= 1;
	condition	= Info_Mod_Berdin_Hi_Condition;
	information	= Info_Mod_Berdin_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hi, könntest du mir ein paar Tipps zur Jagd im Minetal geben?";
};

FUNC INT Info_Mod_Berdin_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Berdin_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Berdin_Hi_15_00"); //Hi, könntest du mir ein paar Tipps zur Jagd im Minetal geben?
	AI_Output(self, hero, "Info_Mod_Berdin_Hi_07_01"); //Na ja, eigentlich unterscheidet sich die Jagd hier nicht besonders von der Jagd wo anders.
	AI_Output(self, hero, "Info_Mod_Berdin_Hi_07_02"); //Das einzige, was du hier wissen solltest, und das sagt eigentlich schon der Name, ist, dass du in einem Tal bist, und soweit ich weiß ist der Pass der einzige Weg hier raus.
	AI_Output(self, hero, "Info_Mod_Berdin_Hi_07_03"); //Wenn du dich also bei der Jagd mit einem zu starken Monster anlegst und es nicht los werden kannst, bist du hier so gut wie gefangen. Das beste, was du dann machen kannst, ist in eins der vielen Lager hier zu fliehen.
	AI_Output(self, hero, "Info_Mod_Berdin_Hi_07_04"); //Dann bist du zwar deine Trophäen los, aber du lebst immerhin.
	AI_Output(hero, self, "Info_Mod_Berdin_Hi_15_05"); //Ja, das klingt logisch. Kannst du mir zeigen, wie ich bei der Jagd an Trophäen komme?
	AI_Output(self, hero, "Info_Mod_Berdin_Hi_07_06"); //Ich kann dir zeigen, wie du Klauen und Zungen ziehst, aber das mache ich erst, wenn du bei uns angefangen hast.
};

INSTANCE Info_Mod_Berdin_Jagdtalente (C_INFO)
{
	npc		= Mod_1018_KGD_Berdin_MT;
	nr		= 1;
	condition	= Info_Mod_Berdin_Jagdtalente_Condition;
	information	= Info_Mod_Berdin_Jagdtalente_Info;
	permanent	= 1;
	important	= 0;
	description	= "Unterrichtest du mich jetzt?";
};

FUNC INT Info_Mod_Berdin_Jagdtalente_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Berdin_Hi))
	&& (KG_Dabei == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Berdin_Jagdtalente_Info()
{
	AI_Output(hero, self, "Info_Mod_Berdin_Jagdtalente_15_00"); //Unterrichtest du mich jetzt?

	if ((PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
	||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_FireTongue] == FALSE))
	{
		AI_Output(self, hero, "Info_Mod_Berdin_Jagdtalente_07_01"); //Na klar, was willst du lernen?

		Info_AddChoice		(Info_Mod_Berdin_Jagdtalente, DIALOG_BACK, Info_Mod_Berdin_Jagdtalente_BACK);
		
		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
		{ 
			Info_AddChoice	(Info_Mod_Berdin_Jagdtalente, B_BuildLearnString ("Klauen hacken",B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Claws)),  Info_Mod_Berdin_Jagdtalente_Claws);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_FireTongue] == FALSE)
		{ 
			Info_AddChoice	(Info_Mod_Berdin_Jagdtalente, B_BuildLearnString ("Feuerzunge", B_GetLearnCostTalent (hero, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_FireTongue)),  Info_Mod_Berdin_Jagdtalente_FireTongue);
		};
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Berdin_Jagdtalente_07_02"); //Ich kann dir im Moment nicht mehr beibringen, als du ohnehin schon weißt. Tut mir Leid.
	};
};

FUNC VOID Info_Mod_Berdin_Jagdtalente_BACK()
{
	Info_ClearChoices	(Info_Mod_Berdin_Jagdtalente);
};

FUNC VOID Info_Mod_Berdin_Jagdtalente_Claws()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, hero, TROPHY_Claws))
	{
		AI_Output			(self, hero, "Info_Mod_Berdin_Jagdtalente_Claws_07_00"); //Tiere geben ihre Klauen nicht sehr gerne her. Du musst schon sehr genau den Punkt treffen, an dem du mit deinem Messer ansetzt.
		AI_Output			(self, hero, "Info_Mod_Berdin_Jagdtalente_Claws_07_01"); //Die Haltung deiner Hand sollte etwas verschränkt sein. Mit einem kräftigen Ruck trennst du dann die Klaue ab.
		AI_Output			(self, hero, "Info_Mod_Berdin_Jagdtalente_Claws_07_02"); //Klauen sind immer ein begehrtes Zahlungsmittel bei einem Händler.
	};

	Info_ClearChoices	(Info_Mod_Berdin_Jagdtalente);
		
};

FUNC VOID Info_Mod_Berdin_Jagdtalente_FireTongue()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy	(self, hero, TROPHY_FIRETONGUE))
	{
		
	};

	Info_ClearChoices	(Info_Mod_Berdin_Jagdtalente);
};

INSTANCE Info_Mod_Berdin_Pickpocket (C_INFO)
{
	npc		= Mod_1018_KGD_Berdin_MT;
	nr		= 1;
	condition	= Info_Mod_Berdin_Pickpocket_Condition;
	information	= Info_Mod_Berdin_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Berdin_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Berdin_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Berdin_Pickpocket);

	Info_AddChoice	(Info_Mod_Berdin_Pickpocket, DIALOG_BACK, Info_Mod_Berdin_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Berdin_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Berdin_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Berdin_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Berdin_Pickpocket);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Aabid_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Aabid_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Aabid_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Berdin_EXIT (C_INFO)
{
	npc		= Mod_1018_KGD_Berdin_MT;
	nr		= 1;
	condition	= Info_Mod_Berdin_EXIT_Condition;
	information	= Info_Mod_Berdin_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Berdin_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Berdin_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};