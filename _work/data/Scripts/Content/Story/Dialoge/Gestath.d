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
	AI_Output(self, hero, "Info_Mod_Gestath_Hi_11_00"); //Na, wieder ein wackerer Jäger, der seine Trophäen in Gold umwanden möchte?
	AI_Output(hero, self, "Info_Mod_Gestath_Hi_15_01"); //Wieso glaubst du, dass ich Jäger bin?
	AI_Output(self, hero, "Info_Mod_Gestath_Hi_11_02"); //Wieso? (lacht) Weil die ganzen Bauern auf den Reisfeldern festgefroren sind.
	AI_Output(self, hero, "Info_Mod_Gestath_Hi_11_03"); //Nichts für Ungut, mal im Ernst: du scheinst wohl nicht von hier zu kommen?
	AI_Output(hero, self, "Info_Mod_Gestath_Hi_15_04"); //Ja, ich bin über die Steinkreise hergekommen.
	AI_Output(self, hero, "Info_Mod_Gestath_Hi_11_05"); //Ahh, das bin ich damals auch. War früher mal auf einer Insel beheimatet.
	AI_Output(self, hero, "Info_Mod_Gestath_Hi_11_06"); //Dann hörte ich von dieser Gegend voller Eis und Schnee, wo es nur so von Viechern wimmeln soll.
	AI_Output(self, hero, "Info_Mod_Gestath_Hi_11_07"); //Ich habe alles an Ausrüstung zusammengesammelt und bin auf das Festland. Hatte nämlich von einem Zauberkundigen gehört der dort beheimatet sein soll.
	AI_Output(self, hero, "Info_Mod_Gestath_Hi_11_08"); //Gerüchte besagten, dass er über die Steinkreise in die entlegensten Winkel der ... (unterbricht) aber was erzähle ich dir das, du weißt ja selbst, wie es funktioniert.
	AI_Output(hero, self, "Info_Mod_Gestath_Hi_15_09"); //Und dann hast du diesen Laden eröffnet?
	AI_Output(self, hero, "Info_Mod_Gestath_Hi_11_10"); //Ja, nach einiger Zeit. Am Anfang war ich selbst noch viel auf der Jagd.
	AI_Output(self, hero, "Info_Mod_Gestath_Hi_11_11"); //Dann bin ich aber nach und nach auf den Trophäenhandel umgestiegen, da ich weiß, an welchen Orten der Erde man gutes Gold dafür bekommt.
};

INSTANCE Info_Mod_Gestath_Snapperbogen (C_INFO)
{
	npc		= Mod_974_OUT_Gestath_EIS;
	nr		= 1;
	condition	= Info_Mod_Gestath_Snapperbogen_Condition;
	information	= Info_Mod_Gestath_Snapperbogen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Weißt du, woher ich eine Drachensnappersehne bekomme?";
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
	AI_Output(hero, self, "Info_Mod_Gestath_Snapperbogen_15_00"); //Weißt du, woher ich eine Drachensnappersehne bekomme?
	AI_Output(self, hero, "Info_Mod_Gestath_Snapperbogen_11_01"); //Lass mich nachdenken ... ja, der Jäger Wütar hat sich auf Tiersehnen spezialisiert. Bei ihm wirst du bestimmt welche bekommen.
	AI_Output(self, hero, "Info_Mod_Gestath_Snapperbogen_11_02"); //Falls er nicht noch auf der Jagd ist, wirst du ihn in seiner Hütte im Dorf oder in der Kneipe finden.
};

INSTANCE Info_Mod_Gestath_TrophaenHolen (C_INFO)
{
	npc		= Mod_974_OUT_Gestath_EIS;
	nr		= 1;
	condition	= Info_Mod_Gestath_TrophaenHolen_Condition;
	information	= Info_Mod_Gestath_TrophaenHolen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Brauchst du bestimmte Trophäen?";
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
	AI_Output(hero, self, "Info_Mod_Gestath_TrophaenHolen_15_00"); //Brauchst du bestimmte Trophäen?

	if (Wld_GetDay() > Mod_EIS_Gestath_Day)
	{
		AI_Output(self, hero, "Info_Mod_Gestath_TrophaenHolen_11_01"); //Ja, ich habe auf dieser Liste festgehalten, was ich mal wieder brauchen könnte.

		B_GiveInvItems	(self, hero, ItWr_GestathTrophyList, 1);

		Mod_EIS_Gestath_DragonsnapperHorn = r_max(4);
		Mod_EIS_Gestath_LurkerClaw = r_max(10);
		Mod_EIS_Gestath_Keilerhauer = r_max(5);
		Mod_EIS_Gestath_Flammenzunge = r_max(4);
		Mod_EIS_Gestath_ShadowHorn = r_max(4);
		Mod_EIS_Gestath_SharkTeeth = r_max(4);

		Mod_EIS_Gestath = 1;
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Gestath_TrophaenHolen_11_02"); //Nein, im Moment sind schon andere Jäger für mich unterwegs.
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
	description	= "Ich habe deine Trophäen.";
};

FUNC INT Info_Mod_Gestath_TrophaenGeben_Condition()
{
	if (Mod_EIS_Gestath == 1)
	&& (Npc_HasItems(hero, ItAt_DrgSnapperHorn) >= Mod_EIS_Gestath_DragonsnapperHorn)
	&& (Npc_HasItems(hero, ItAt_LurkerClaw) >= Mod_EIS_Gestath_LurkerClaw)
	&& (Npc_HasItems(hero, ItAt_Keilerhauer) >= Mod_EIS_Gestath_Keilerhauer)
	&& (Npc_HasItems(hero, ItAt_WaranFiretongue) >= Mod_EIS_Gestath_Flammenzunge)
	&& (Npc_HasItems(hero, ItAt_ShadowHorn) >= Mod_EIS_Gestath_ShadowHorn)
	&& (Npc_HasItems(hero, ItAt_SharkTeeth) >= Mod_EIS_Gestath_SharkTeeth)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gestath_TrophaenGeben_Info()
{
	AI_Output(hero, self, "Info_Mod_Gestath_TrophaenGeben_15_00"); //Ich habe deine Trophäen.

	B_ShowGivenThings	("Trophäen gegeben");

	Npc_RemoveInvItems	(hero, ItAt_DrgSnapperHorn, Mod_EIS_Gestath_DragonsnapperHorn);
	Npc_RemoveInvItems	(hero, ItAt_LurkerClaw, Mod_EIS_Gestath_LurkerClaw);
	Npc_RemoveInvItems	(hero, ItAt_Keilerhauer, Mod_EIS_Gestath_Keilerhauer);
	Npc_RemoveInvItems	(hero, ItAt_WaranFiretongue, Mod_EIS_Gestath_Flammenzunge);
	Npc_RemoveInvItems	(hero, ItAt_ShadowHorn, Mod_EIS_Gestath_ShadowHorn);
	Npc_RemoveInvItems	(hero, ItAt_SharkTeeth, Mod_EIS_Gestath_SharkTeeth);
	Npc_RemoveInvItems	(hero, ItWr_GestathTrophyList, 1);

	AI_Output(self, hero, "Info_Mod_Gestath_TrophaenGeben_11_01"); //Gut, danke. Hier ist dein Gold.

	B_GiveInvItems	(self, hero, ItMi_Gold, (Mod_EIS_Gestath_DragonsnapperHorn * Value_DrgSnapperHorn + Mod_EIS_Gestath_LurkerClaw * Value_LurkerClaw + Mod_EIS_Gestath_Keilerhauer * Value_Keilerhauer + Mod_EIS_Gestath_Flammenzunge * Value_WaranFiretongue + Mod_EIS_Gestath_ShadowHorn * Value_ShadowHorn + Mod_EIS_Gestath_SharkTeeth * Value_SharkTeeth) / 2);

	Mod_EIS_Gestath = 0;

	if (Mod_EIS_Gestath_Day == 0) {
		Log_CreateTopic(TOPIC_MOD_HAENDLER_EISGEBIET, LOG_NOTE);
		B_LogEntry(TOPIC_MOD_HAENDLER_EISGEBIET, "Gestath handelt jetzt mit mir und verkauft Jagdtrophäen.");
	};
	
	Mod_EIS_Gestath_Day = Wld_GetDay() + 5;
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
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_11_01"); //Kommt darauf an, was du wissen willst.

		Info_ClearChoices	(Info_Mod_Gestath_Lernen);

		Info_AddChoice	(Info_Mod_Gestath_Lernen, DIALOG_BACK, Info_Mod_Gestath_Lernen_BACK);

		if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
		{ 
			Info_AddChoice	(Info_Mod_Gestath_Lernen, B_BuildLearnString("Zähne reissen", B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)), Info_Mod_Gestath_Lernen_Teeth);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE)
		{ 
			Info_AddChoice	(Info_Mod_Gestath_Lernen, B_BuildLearnString("Tiere häuten", B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ReptileSkin)), Info_Mod_Gestath_Lernen_ReptileSkin);
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
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_11_02"); //Ich kann dir im Moment nicht mehr beibringen, als du ohnehin schon weißt. Tut mir Leid.
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
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_Claws_11_00"); //Tiere geben ihre Klauen nicht sehr gerne her. Du musst schon sehr genau den Punkt treffen, an dem du mit deinem Messer ansetzt.
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_Claws_11_01"); //Die Haltung deiner Hand sollte etwas verschränkt sein. Mit einem kräftigen Ruck trennst du dann die Klaue ab.
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_Claws_11_02"); //Klauen sind immer ein begehrtes Zahlungsmittel bei einem Händler.
	};

	Info_ClearChoices	(Info_Mod_Gestath_Lernen);

	Info_AddChoice	(Info_Mod_Gestath_Lernen, DIALOG_BACK, Info_Mod_Gestath_Lernen_BACK);
		
};

FUNC void Info_Mod_Gestath_Lernen_ReptileSkin()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_ReptileSkin))
	{
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_ReptileSkin_11_00"); //Und immer nur am Bauch aufschneiden, sonst verminderst du die Qualität.
	};

	Info_ClearChoices	(Info_Mod_Gestath_Lernen);

	Info_AddChoice	(Info_Mod_Gestath_Lernen, DIALOG_BACK, Info_Mod_Gestath_Lernen_BACK);
};

FUNC void Info_Mod_Gestath_Lernen_Teeth()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_Teeth))
	{
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_Teeth_11_00"); //Das einfachste, was du Tieren entnehmen kannst, sind seine Zähne. Du fährst mit deinem Messer in seinem Maul um das Gebiss.
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_Teeth_11_01"); //Dann trennst es geschickt mit einem Ruck vom Schädel des Tieres.
	};

	Info_ClearChoices	(Info_Mod_Gestath_Lernen);

	Info_AddChoice	(Info_Mod_Gestath_Lernen, DIALOG_BACK, Info_Mod_Gestath_Lernen_BACK);
};

FUNC void Info_Mod_Gestath_Lernen_Fur()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_Fur))
	{
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_Fur_11_00"); //Felle ziehst du am besten ab, indem du einen tiefen Schnitt an den Hinterläufen des Tieres vornimmst.
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_Fur_11_01"); //Dann kannst du das Fell von vorne nach hinten eigentlich immer sehr leicht abziehen.
	};

	Info_ClearChoices	(Info_Mod_Gestath_Lernen);

	Info_AddChoice	(Info_Mod_Gestath_Lernen, DIALOG_BACK, Info_Mod_Gestath_Lernen_BACK);
};

FUNC void Info_Mod_Gestath_Lernen_FireTongue()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_FireTongue))
	{
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_FireTongue_11_00"); //Die Zunge von einem Feuerwaran schlägst du mit einem Messerhieb aus dem Maul, während du sie mit der anderen Hand festhältst.
	};

	Info_ClearChoices	(Info_Mod_Gestath_Lernen);

	Info_AddChoice	(Info_Mod_Gestath_Lernen, DIALOG_BACK, Info_Mod_Gestath_Lernen_BACK);
};

FUNC void Info_Mod_Gestath_Lernen_DrgSnapperHorn()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_DrgSnapperHorn))
	{
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_DrgSnapperHorn_11_00"); //Am Stirnansatz des Drachensnappers ist die beste Stelle, ihm das Horn mit einem stabilen Messer aus dem Schädel zu trennen.
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
	if (Mod_EIS_Gestath_Day > 0)
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
	description	= Pickpocket_150;
};

FUNC INT Info_Mod_Gestath_Pickpocket_Condition()
{
	C_Beklauen	(149, ItAt_DrgSnapperHorn, 2);
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

FUNC VOID Info_Mod_Gestath_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Gestath_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Gestath_Pickpocket);

		Info_AddChoice	(Info_Mod_Gestath_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Gestath_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Gestath_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Gestath_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Gestath_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Gestath_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Gestath_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Gestath_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Gestath_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Gestath_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Gestath_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Gestath_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Gestath_Pickpocket);
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