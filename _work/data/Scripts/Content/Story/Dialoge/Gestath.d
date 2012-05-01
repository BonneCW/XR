INSTANCE Info_Mod_Gestath_Hi (C_INFO)
{
	npc		= Mod_974_OUT_Gestath_EIS;
	nr		= 1;
	condition	= Info_Mod_Gestath_Hi_Condition;
	information	= Info_Mod_Gestath_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gestath_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gestath_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Gestath_Hi_09_00"); //Na, wieder ein wackerer J‰ger, der seine Troph‰en in Gold umwanden mˆchte?
	AI_Output(hero, self, "Info_Mod_Gestath_Hi_15_01"); //Wieso glaubst du, dass ich J‰ger bin?
	AI_Output(self, hero, "Info_Mod_Gestath_Hi_09_02"); //Wieso? (lacht) Weil die ganzen Bauern auf den Reisfeldern festgefroren sind.
	AI_Output(self, hero, "Info_Mod_Gestath_Hi_09_03"); //Nichts f¸r Ungut, mal im Ernst: du scheinst wohl nicht von hier zu kommen?
	AI_Output(hero, self, "Info_Mod_Gestath_Hi_15_04"); //Ja, ich bin ¸ber die Steinkreise hergekommen.
	AI_Output(self, hero, "Info_Mod_Gestath_Hi_09_05"); //Ahh, das bin ich damals auch. War fr¸her mal auf einer Insel beheimatet.
	AI_Output(self, hero, "Info_Mod_Gestath_Hi_09_06"); //Dann hˆrte ich von dieser Gegend voller Eis und Schnee, wo es nur so von Viechern wimmeln soll.
	AI_Output(self, hero, "Info_Mod_Gestath_Hi_09_07"); //Ich habe alles an Ausr¸stung zusammengesammelt und bin auf das Festland. Hatte n‰mlich von einem Zauberkundigen gehˆrt der dort beheimatet sein soll.
	AI_Output(self, hero, "Info_Mod_Gestath_Hi_09_08"); //Ger¸chte besagten, dass er ¸ber die Steinkreise in die entlegensten Winkel der ... (unterbricht) aber was erz‰hle ich dir das, du weiﬂt ja selbst, wie es funktioniert.
	AI_Output(hero, self, "Info_Mod_Gestath_Hi_15_09"); //Und dann hast du diesen Laden erˆffnet?
	AI_Output(self, hero, "Info_Mod_Gestath_Hi_09_10"); //Ja, nach einiger Zeit. Am Anfang war ich selbst noch viel auf der Jagd.
	AI_Output(self, hero, "Info_Mod_Gestath_Hi_09_11"); //Dann bin ich aber nach und nach auf den Troph‰enhandel umgestiegen, da ich weiﬂ, an welchen Orten der Erde man gutes Gold daf¸r bekommt.
};

INSTANCE Info_Mod_Gestath_Snapperbogen (C_INFO)
{
	npc		= Mod_974_OUT_Gestath_EIS;
	nr		= 1;
	condition	= Info_Mod_Gestath_Snapperbogen_Condition;
	information	= Info_Mod_Gestath_Snapperbogen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Weiﬂt du, woher ich eine Drachensnappersehne bekomme?";
};

FUNC INT Info_Mod_Gestath_Snapperbogen_Condition()
{
	if (Snapperbogen)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gestath_Snapperbogen_Info()
{
	AI_Output(hero, self, "Info_Mod_Gestath_Snapperbogen_15_00"); //Weiﬂt du, woher ich eine Drachensnappersehne bekomme?
	AI_Output(self, hero, "Info_Mod_Gestath_Snapperbogen_09_01"); //Lass mich nachdenken ... ja, der J‰ger W¸tar hat sich auf Tiersehnen spezialisiert. Bei ihm wirst du bestimmt welche bekommen.
	AI_Output(self, hero, "Info_Mod_Gestath_Snapperbogen_09_02"); //Falls er nicht noch auf der Jagd ist, wirst du ihn in seiner H¸tte im Dorf oder in der Kneipe finden.
};

INSTANCE Info_Mod_Gestath_TrophaenHolen (C_INFO)
{
	npc		= Mod_974_OUT_Gestath_EIS;
	nr		= 1;
	condition	= Info_Mod_Gestath_TrophaenHolen_Condition;
	information	= Info_Mod_Gestath_TrophaenHolen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Brauchst du bestimmte Troph‰en?";
};

FUNC INT Info_Mod_Gestath_TrophaenHolen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gestath_Hi))
	&& (Mod_EIS_Gestath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gestath_TrophaenHolen_Info()
{
	AI_Output(hero, self, "Info_Mod_Gestath_TrophaenHolen_15_00"); //Brauchst du bestimmte Troph‰en?

	if (Wld_GetDay() > Mod_EIS_Gestath_Day)
	{
		AI_Output(self, hero, "Info_Mod_Gestath_TrophaenHolen_09_01"); //Ja, ich habe auf dieser Liste festgehalten, was ich mal wieder brauchen kˆnnte.

		B_GiveInvItems	(self, hero, ItWr_GestathTrophyList, 1);

		Mod_EIS_Gestath_DragonsnapperHorn = r_max(4);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Gestath_TrophaenHolen_09_02"); //Nein, im Moment sind schon andere J‰ger f¸r mich unterwegs.
	};
};

INSTANCE Info_Mod_Gestath_TrophaenGeben (C_INFO)
{
	npc		= Mod_974_OUT_Gestath_EIS;
	nr		= 1;
	condition	= Info_Mod_Gestath_TrophaenGeben_Condition;
	information	= Info_Mod_Gestath_TrophaenGeben_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich habe deine Troph‰en.";
};

FUNC INT Info_Mod_Gestath_TrophaenGeben_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gestath_TrophaenHolen))
	&& (Mod_EIS_Gestath == 1)
	&& (Npc_HasItems(hero, ItAt_DrgSnapperHorn) >= Mod_EIS_Gestath_DragonsnapperHorn)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gestath_TrophaenGeben_Info()
{
	AI_Output(hero, self, "Info_Mod_Gestath_TrophaenGeben_15_00"); //Ich habe deine Troph‰en.

	B_ShowGivenThings	("Troph‰en gegeben");

	Npc_RemoveInvItems	(hero, ItAt_DrgSnapperHorn, Mod_EIS_Gestath_DragonsnapperHorn);
	Npc_RemoveInvItems	(hero, ItWr_GestathTrophyList, 1);

	AI_Output(self, hero, "Info_Mod_Gestath_TrophaenGeben_09_01"); //Gut, danke. Hier ist dein Gold.

	B_GiveInvItems	(self, hero, ItMi_Gold, (Mod_EIS_Gestath_DragonsnapperHorn*Value_DrgSnapperHorn)/2);

	Mod_EIS_Gestath = 0;

	Mod_EIS_Gestath_Day = Wld_GetDay()+5;
};

INSTANCE Info_Mod_Gestath_Lernen (C_INFO)
{
	npc		= Mod_974_OUT_Gestath_EIS;
	nr          	= 1;
	condition	= Info_Mod_Gestath_Lernen_Condition;
	information	= Info_Mod_Gestath_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Was kannst du mir beibringen?";
};

FUNC INT Info_Mod_Gestath_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gestath_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gestath_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Gestath_Lernen_15_00"); //Was kannst du mir beibringen?

	if ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE))
	{
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_09_01"); //Kommt darauf an, was du wissen willst.

		Info_ClearChoices	(Info_Mod_Gestath_Lernen);

		Info_AddChoice	(Info_Mod_Gestath_Lernen, DIALOG_BACK, Info_Mod_Gestath_Lernen_BACK);

		if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
		{ 
			Info_AddChoice	(Info_Mod_Gestath_Lernen, B_BuildLearnString("Z‰hne reissen", B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)), Info_Mod_Gestath_Lernen_Teeth);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE)
		{ 
			Info_AddChoice	(Info_Mod_Gestath_Lernen, B_BuildLearnString("Tiere h‰uten", B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ReptileSkin)), Info_Mod_Gestath_Lernen_ReptileSkin);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
		{ 
			Info_AddChoice	(Info_Mod_Gestath_Lernen, B_BuildLearnString("Klauen hacken", B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Claws)), Info_Mod_Gestath_Lernen_Claws);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE)
		{ 
			Info_AddChoice	(Info_Mod_Gestath_Lernen, B_BuildLearnString("Feuerzunge", B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_FireTongue)), Info_Mod_Gestath_Lernen_FireTongue);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE)
		{ 
			Info_AddChoice	(Info_Mod_Gestath_Lernen, B_BuildLearnString("Drachensnapperhorn", B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DrgSnapperHorn)), Info_Mod_Gestath_Lernen_DrgSnapperHorn);
		};
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_09_02"); //Ich kann dir im Moment nicht mehr beibringen, als du ohnehin schon weiﬂt. Tut mir Leid.
	};
};

FUNC void Info_Mod_Gestath_Lernen_BACK()
{
	Info_ClearChoices (Info_Mod_Gestath_Lernen);
};

FUNC void Info_Mod_Gestath_Lernen_Claws()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_Claws))
	{
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_Claws_09_00"); //Tiere geben ihre Klauen nicht sehr gerne her. Du musst schon sehr genau den Punkt treffen, an dem du mit deinem Messer ansetzt.
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_Claws_09_01"); //Die Haltung deiner Hand sollte etwas verschr‰nkt sein. Mit einem kr‰ftigen Ruck trennst du dann die Klaue ab.
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_Claws_09_02"); //Klauen sind immer ein begehrtes Zahlungsmittel bei einem H‰ndler.
	};

	Info_ClearChoices	(Info_Mod_Gestath_Lernen);

	Info_AddChoice	(Info_Mod_Gestath_Lernen, DIALOG_BACK, Info_Mod_Gestath_Lernen_BACK);
		
};

FUNC void Info_Mod_Gestath_Lernen_ReptileSkin()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_ReptileSkin))
	{
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_ReptileSkin_09_00"); //Und immer nur am Bauch aufschneiden, sonst verminderst du die Qualit‰t.
	};

	Info_ClearChoices	(Info_Mod_Gestath_Lernen);

	Info_AddChoice	(Info_Mod_Gestath_Lernen, DIALOG_BACK, Info_Mod_Gestath_Lernen_BACK);
};

FUNC void Info_Mod_Gestath_Lernen_Teeth()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_Teeth))
	{
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_Teeth_09_00"); //Das einfachste, was du Tieren entnehmen kannst, sind seine Z‰hne. Du f‰hrst mit deinem Messer in seinem Maul um das Gebiss.
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_Teeth_09_01"); //Dann trennst es geschickt mit einem Ruck vom Sch‰del des Tieres.
	};

	Info_ClearChoices	(Info_Mod_Gestath_Lernen);

	Info_AddChoice	(Info_Mod_Gestath_Lernen, DIALOG_BACK, Info_Mod_Gestath_Lernen_BACK);
};

FUNC void Info_Mod_Gestath_Lernen_Fur()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_Fur))
	{
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_Fur_09_00"); //Felle ziehst du am besten ab, indem du einen tiefen Schnitt an den Hinterl‰ufen des Tieres vornimmst.
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_Fur_09_01"); //Dann kannst du das Fell von vorne nach hinten eigentlich immer sehr leicht abziehen.
	};

	Info_ClearChoices	(Info_Mod_Gestath_Lernen);

	Info_AddChoice	(Info_Mod_Gestath_Lernen, DIALOG_BACK, Info_Mod_Gestath_Lernen_BACK);
};

FUNC void Info_Mod_Gestath_Lernen_FireTongue()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_FireTongue))
	{
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_FireTongue_09_00"); //Die Zunge von einem Feuerwaran schl‰gst du mit einem Messerhieb aus dem Maul, w‰hrend du sie mit der anderen Hand festh‰ltst.
	};

	Info_ClearChoices	(Info_Mod_Gestath_Lernen);

	Info_AddChoice	(Info_Mod_Gestath_Lernen, DIALOG_BACK, Info_Mod_Gestath_Lernen_BACK);
};

FUNC void Info_Mod_Gestath_Lernen_DrgSnapperHorn()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_DrgSnapperHorn))
	{
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_DrgSnapperHorn_09_00"); //Am Stirnansatz des Drachensnappers ist die beste Stelle, ihm das Horn mit einem stabilen Messer aus dem Sch‰del zu trennen.
	};

	Info_ClearChoices	(Info_Mod_Gestath_Lernen);

	Info_AddChoice	(Info_Mod_Gestath_Lernen, DIALOG_BACK, Info_Mod_Gestath_Lernen_BACK);
};

INSTANCE Info_Mod_Gestath_Trade (C_INFO)
{
	npc		= Mod_974_OUT_Gestath_EIS;
	nr		= 1;
	condition	= Info_Mod_Gestath_Trade_Condition;
	information	= Info_Mod_Gestath_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Gestath_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gestath_TrophaenGeben))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gestath_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Gestath_Pickpocket (C_INFO)
{
	npc		= Mod_974_OUT_Gestath_EIS;
	nr		= 1;
	condition	= Info_Mod_Gestath_Pickpocket_Condition;
	information	= Info_Mod_Gestath_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_100;
};

FUNC INT Info_Mod_Gestath_Pickpocket_Condition()
{
	C_Beklauen	(99, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Gestath_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Gestath_Pickpocket);

	Info_AddChoice	(Info_Mod_Gestath_Pickpocket, DIALOG_BACK, Info_Mod_Gestath_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Gestath_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Gestath_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Gestath_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Gestath_Pickpocket);
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

INSTANCE Info_Mod_Gestath_EXIT (C_INFO)
{
	npc		= Mod_974_OUT_Gestath_EIS;
	nr		= 1;
	condition	= Info_Mod_Gestath_EXIT_Condition;
	information	= Info_Mod_Gestath_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Gestath_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gestath_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};