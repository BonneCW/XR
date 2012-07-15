INSTANCE Info_Mod_Drax_Hi (C_INFO)
{
	npc		= Mod_1121_BDT_Drax_MT;
	nr		= 1;
	condition	= Info_Mod_Drax_Hi_Condition;
	information	= Info_Mod_Drax_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir etwas über die Jagd beibringen?";
};

FUNC INT Info_Mod_Drax_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Drax_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Drax_Hi_15_00"); //Kannst du mir etwas über die Jagd beibringen?

	if (Banditen_Dabei == FALSE)
	{
		AI_Output(self, hero, "Info_Mod_Drax_Hi_06_01"); //Könnte, aber du gehörst nicht zu uns.
	}
	else
	{
		if (Mod_Schwierigkeit != 4)
		{
			AI_Output(self, hero, "Info_Mod_Drax_Hi_06_02"); //Hm, da du einer von uns bist, werde ich dir etwas über die Jagd und das Bogenschießen beibringen.

			Log_CreateTopic	(TOPIC_MOD_LEHRER_BANDITEN, LOG_NOTE);
			B_LogEntry	(TOPIC_MOD_LEHRER_BANDITEN, "Von Drax kann ich diverse Jagdtalente sowie das Bogenschießen lernen.");
		}
		else
		{
			AI_Output(self, hero, "Info_Mod_Drax_Hi_06_03"); //Hm, da du einer von uns bist, werde ich dir etwas über die Jagd beibringen.

			Log_CreateTopic	(TOPIC_MOD_LEHRER_BANDITEN, LOG_NOTE);
			B_LogEntry	(TOPIC_MOD_LEHRER_BANDITEN, "Von Drax kann ich diverse Jagdtalente lernen.");
		};
	};
};

INSTANCE Info_Mod_Drax_Fokus (C_INFO)
{
	npc		= Mod_1121_BDT_Drax_MT;
	nr		= 1;
	condition	= Info_Mod_Drax_Fokus_Condition;
	information	= Info_Mod_Drax_Fokus_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie geht's dir?";
};

FUNC INT Info_Mod_Drax_Fokus_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ratford_Fokus))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Drax_Fokus_Info()
{
	AI_Output(hero, self, "Info_Mod_Drax_Fokus_15_00"); //Wie geht's dir?
	AI_Output(self, hero, "Info_Mod_Drax_Fokus_06_01"); //(nach Atem ringend) Kein Ahnung. Zuerst haben mir die Viecher einen Mordsschrecken versetzt, aber bei der anschließenden Jagd hatte ich einen Spaß wie nie zuvor.
	AI_Output(hero, self, "Info_Mod_Drax_Fokus_15_02"); //Sind das hier alle restlichen Warge?
	AI_Output(self, hero, "Info_Mod_Drax_Fokus_06_03"); //Ich hab jedenfalls keinen entkommen sehen. Aber wieso willst du das wissen?
	AI_Output(hero, self, "Info_Mod_Drax_Fokus_15_04"); //Einer von ihnen hat etwas, das ich suche.
	AI_Output(self, hero, "Info_Mod_Drax_Fokus_06_05"); //Das blaue funkelnde Ding? Ist sicher 'ne Menge wert, oder?
	AI_Output(hero, self, "Info_Mod_Drax_Fokus_15_06"); //Nicht in Gold.
	AI_Output(self, hero, "Info_Mod_Drax_Fokus_06_07"); //(enttäuscht) Na dann... Schau doch rum, einer von denen wird's schon dabeihaben.

	B_StartOtherRoutine	(self, "START");
	B_StartOtherRoutine	(Mod_1120_BDT_Ratford_MT, "START");
};

INSTANCE Info_Mod_Drax_Lernen_Bogen (C_INFO)
{
	npc		= Mod_1121_BDT_Drax_MT;
	nr		= 1;
	condition	= Info_Mod_Drax_Lernen_Bogen_Condition;
	information	= Info_Mod_Drax_Lernen_Bogen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Bring mir Bogenschießen bei.";
};

FUNC INT Info_Mod_Drax_Lernen_Bogen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Drax_Hi))
	&& (hero.hitchance[NPC_TALENT_BOW] < 60)
	&& (Banditen_Dabei == TRUE)
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Drax_Lernen_Bogen_Info()
{
	AI_Output(hero, self, "Info_Mod_Drax_Lernen_Bogen_15_00"); //Bring mir Bogenschießen bei.

	Info_ClearChoices	(Info_Mod_Drax_Lernen_Bogen);
	
	Info_AddChoice	(Info_Mod_Drax_Lernen_Bogen, "Zurück.", Info_Mod_Drax_Lernen_Bogen_BACK);
	Info_AddChoice	(Info_Mod_Drax_Lernen_Bogen, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent_New(hero, NPC_TALENT_BOW)), Info_Mod_Drax_Lernen_Bogen_5);
	Info_AddChoice	(Info_Mod_Drax_Lernen_Bogen, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(hero, NPC_TALENT_BOW, 1)), Info_Mod_Drax_Lernen_Bogen_1);
};

FUNC VOID Info_Mod_Drax_Lernen_Bogen_BACK()
{
	Info_ClearChoices	(Info_Mod_Drax_Lernen_Bogen);
};

FUNC VOID Info_Mod_Drax_Lernen_Bogen_5()
{
	B_TeachFightTalentPercent_New (self, hero, NPC_TALENT_BOW, 5, 60);

	Info_ClearChoices	(Info_Mod_Drax_Lernen_Bogen);

	Info_AddChoice	(Info_Mod_Drax_Lernen_Bogen, "Zurück.", Info_Mod_Drax_Lernen_Bogen_BACK);
	Info_AddChoice	(Info_Mod_Drax_Lernen_Bogen, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent_New(hero, NPC_TALENT_BOW)), Info_Mod_Drax_Lernen_Bogen_5);
	Info_AddChoice	(Info_Mod_Drax_Lernen_Bogen, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(hero, NPC_TALENT_BOW, 1)), Info_Mod_Drax_Lernen_Bogen_1);
};

FUNC VOID Info_Mod_Drax_Lernen_Bogen_1()
{
	B_TeachFightTalentPercent (self, hero, NPC_TALENT_BOW, 1, 60);

	Info_ClearChoices	(Info_Mod_Drax_Lernen_Bogen);

	Info_AddChoice	(Info_Mod_Drax_Lernen_Bogen, "Zurück.", Info_Mod_Drax_Lernen_Bogen_BACK);
	Info_AddChoice	(Info_Mod_Drax_Lernen_Bogen, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent_New(hero, NPC_TALENT_BOW)), Info_Mod_Drax_Lernen_Bogen_5);
	Info_AddChoice	(Info_Mod_Drax_Lernen_Bogen, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(hero, NPC_TALENT_BOW, 1)), Info_Mod_Drax_Lernen_Bogen_1);
};

INSTANCE Info_Mod_Drax_Jagdtalente (C_INFO)
{
	npc		= Mod_1121_BDT_Drax_MT;
	nr		= 1;
	condition	= Info_Mod_Drax_Jagdtalente_Condition;
	information	= Info_Mod_Drax_Jagdtalente_Info;
	permanent	= 1;
	important	= 0;
	description	= "Was kannst du mir beibringen?";
};

FUNC INT Info_Mod_Drax_Jagdtalente_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Drax_Hi))
	&& (Banditen_Dabei == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Drax_Jagdtalente_Info()
{
	AI_Output(hero, self, "Info_Mod_Drax_Jagdtalente_15_00"); //Was kannst du mir beibringen?

	if ((PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
	||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
	||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ReptileSkin] == FALSE)
	||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE))
	{
		AI_Output(self, hero, "Info_Mod_Drax_Jagdtalente_06_01"); //Kommt darauf an, was du wissen willst.

		Info_AddChoice		(Info_Mod_Drax_Jagdtalente, DIALOG_BACK, Info_Mod_Drax_Jagdtalente_BACK);
		
		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
		{ 
			Info_AddChoice	(Info_Mod_Drax_Jagdtalente, B_BuildLearnString ("Zähne reissen",B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)),  Info_Mod_Drax_Jagdtalente_Teeth);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
		{ 
			Info_AddChoice	(Info_Mod_Drax_Jagdtalente, B_BuildLearnString ("Klauen hacken",B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Claws)),  Info_Mod_Drax_Jagdtalente_Claws);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
		{ 
			Info_AddChoice	(Info_Mod_Drax_Jagdtalente, B_BuildLearnString ("Fell abziehen",B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Fur)),  Info_Mod_Drax_Jagdtalente_Fur);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ReptileSkin] == FALSE)
		{ 
			Info_AddChoice	(Info_Mod_Drax_Jagdtalente, B_BuildLearnString ("Häuten von Reptilien",B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ReptileSkin)),  Info_Mod_Drax_Jagdtalente_ReptileSkin);
		};
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Drax_Jagdtalente_06_02"); //Ich kann dir im Moment nicht mehr beibringen, als du ohnehin schon weißt. Tut mir Leid.
	};
};

FUNC VOID Info_Mod_Drax_Jagdtalente_BACK()
{
	Info_ClearChoices	(Info_Mod_Drax_Jagdtalente);
};

FUNC VOID Info_Mod_Drax_Jagdtalente_Claws()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, hero, TROPHY_Claws))
	{
		AI_Output			(self, hero, "Info_Mod_Drax_Jagdtalente_Claws_06_00"); //Tiere geben ihre Klauen nicht sehr gerne her. Du musst schon sehr genau den Punkt treffen, an dem du mit deinem Messer ansetzt.
		AI_Output			(self, hero, "Info_Mod_Drax_Jagdtalente_Claws_06_01"); //Die Haltung deiner Hand sollte etwas verschränkt sein. Mit einem kräftigen Ruck trennst du dann die Klaue ab.
		AI_Output			(self, hero, "Info_Mod_Drax_Jagdtalente_Claws_06_02"); //Klauen sind immer ein begehrtes Zahlungsmittel bei einem Händler.
	};

	Info_ClearChoices	(Info_Mod_Drax_Jagdtalente);
		
};

FUNC VOID Info_Mod_Drax_Jagdtalente_Teeth()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, hero, TROPHY_Teeth))
	{
		AI_Output			(self, hero, "Info_Mod_Drax_Jagdtalente_Teeth_06_00"); //Das einfachste, was du Tieren entnehmen kannst, sind seine Zähne. Du fährst mit deinem Messer in seinem Maul um das Gebiss.
		AI_Output			(self, hero, "Info_Mod_Drax_Jagdtalente_Teeth_06_01"); //Dann trennst es geschickt mit einem Ruck vom Schädel des Tieres.
	};

	Info_ClearChoices	(Info_Mod_Drax_Jagdtalente);
};

FUNC VOID Info_Mod_Drax_Jagdtalente_Fur()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, hero, TROPHY_Fur))
	{
		AI_Output			(self, hero, "Info_Mod_Drax_Jagdtalente_Fur_06_00"); //Felle ziehst du am besten ab, indem du einen tiefen Schnitt an den Hinterläufen des Tieres vornimmst.
		AI_Output			(self, hero, "Info_Mod_Drax_Jagdtalente_Fur_06_01"); //Dann kannst du das Fell von vorne nach hinten eigentlich immer sehr leicht abziehen.
	};

	Info_ClearChoices	(Info_Mod_Drax_Jagdtalente);
};

FUNC VOID Info_Mod_Drax_Jagdtalente_ReptileSkin()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, hero, TROPHY_ReptileSkin))
	{
		AI_Output			(self, hero, "Info_Mod_Drax_Jagdtalente_BFSting_06_00"); //enn du die Haut an den Seiten anschneidest, löst sie sich wie von selbst. Du solltest ab jetzt kein Problem mehr haben, Echsen zu häuten.
	};

	Info_ClearChoices	(Info_Mod_Drax_Jagdtalente);
};

INSTANCE Info_Mod_Drax_Pickpocket (C_INFO)
{
	npc		= Mod_1121_BDT_Drax_MT;
	nr		= 1;
	condition	= Info_Mod_Drax_Pickpocket_Condition;
	information	= Info_Mod_Drax_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Drax_Pickpocket_Condition()
{
	C_Beklauen	(65, ItAt_WolfFur, 3);
};

FUNC VOID Info_Mod_Drax_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Drax_Pickpocket);

	Info_AddChoice	(Info_Mod_Drax_Pickpocket, DIALOG_BACK, Info_Mod_Drax_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Drax_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Drax_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Drax_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Drax_Pickpocket);
};

FUNC VOID Info_Mod_Drax_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Drax_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Drax_Pickpocket);

		Info_AddChoice	(Info_Mod_Drax_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Drax_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Drax_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Drax_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Drax_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Drax_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Drax_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Drax_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Drax_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Drax_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Drax_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Drax_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Drax_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Drax_EXIT (C_INFO)
{
	npc		= Mod_1121_BDT_Drax_MT;
	nr		= 1;
	condition	= Info_Mod_Drax_EXIT_Condition;
	information	= Info_Mod_Drax_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Drax_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Drax_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};