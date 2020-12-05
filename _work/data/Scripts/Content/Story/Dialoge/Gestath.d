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
	AI_Output(self, hero, "Info_Mod_Gestath_Hi_11_00"); //No cóz, inny dzielny mysliwy, który chce zamienic swoje trofea w zloto?
	AI_Output(hero, self, "Info_Mod_Gestath_Hi_15_01"); //Co sprawia, ze myslisz, ze jestem mysliwym?
	AI_Output(self, hero, "Info_Mod_Gestath_Hi_11_02"); //Dlaczego? (smiech) Poniewaz wszyscy rolnicy na polach ryzowych sa zamrazani.
	AI_Output(self, hero, "Info_Mod_Gestath_Hi_11_03"); //Nie ma zadnego wykroczenia, powaznie: wydaje sie, ze nie przychodzisz stad, czy ty?
	AI_Output(hero, self, "Info_Mod_Gestath_Hi_15_04"); //Tak, podszedlem nad kamiennymi kregami.
	AI_Output(self, hero, "Info_Mod_Gestath_Hi_11_05"); //Ach, wiec jestem wtedy z powrotem. Uzywany do zycia na wyspie.
	AI_Output(self, hero, "Info_Mod_Gestath_Hi_11_06"); //Potem uslyszalem o tym miejscu pelnym lodu i sniegu, gdzie powinno tetnic zwierzetami.
	AI_Output(self, hero, "Info_Mod_Gestath_Hi_11_07"); //Zebralem caly sprzet, którego potrzebuje i wyjezdzam na lad. Slyszal o czarowniku, który mial byc w domu.
	AI_Output(self, hero, "Info_Mod_Gestath_Hi_11_08"); //Plotka glosi, ze przekraczal kamienne kregi w najdalszych zakatkach swiata.... (przerwanie) ale co zamierzam wam powiedziec, wiecie jak to dziala.
	AI_Output(hero, self, "Info_Mod_Gestath_Hi_15_09"); //A potem otworzyles to miejsce?
	AI_Output(self, hero, "Info_Mod_Gestath_Hi_11_10"); //Tak, po chwili. Na poczatku sam jeszcze duzo polowalem.
	AI_Output(self, hero, "Info_Mod_Gestath_Hi_11_11"); //Ale potem stopniowo przechodzilem do handlu trofeami, poniewaz wiem, gdzie na ziemi mozna dostac dobre zloto.
};

INSTANCE Info_Mod_Gestath_Snapperbogen (C_INFO)
{
	npc		= Mod_974_OUT_Gestath_EIS;
	nr		= 1;
	condition	= Info_Mod_Gestath_Snapperbogen_Condition;
	information	= Info_Mod_Gestath_Snapperbogen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wiesz, gdzie moge dostac sciegno smoka?";
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
	AI_Output(hero, self, "Info_Mod_Gestath_Snapperbogen_15_00"); //Wiesz, gdzie moge dostac sciegno smoka?
	AI_Output(self, hero, "Info_Mod_Gestath_Snapperbogen_11_01"); //Prosze pozwolic mi pomyslec o tym...... Tak, mysliwy Wütar specjalizuje sie w sciegnach zwierzecych. Jestem pewien, ze dostaniesz od niego troche.
	AI_Output(self, hero, "Info_Mod_Gestath_Snapperbogen_11_02"); //Jesli jeszcze nie poluje, mozna go znalezc w jego chacie we wsi lub w pubie.
};

INSTANCE Info_Mod_Gestath_TrophaenHolen (C_INFO)
{
	npc		= Mod_974_OUT_Gestath_EIS;
	nr		= 1;
	condition	= Info_Mod_Gestath_TrophaenHolen_Condition;
	information	= Info_Mod_Gestath_TrophaenHolen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Potrzebujesz pewnych trofeów?";
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
	AI_Output(hero, self, "Info_Mod_Gestath_TrophaenHolen_15_00"); //Potrzebujesz pewnych trofeów?

	if (Wld_GetDay() > Mod_EIS_Gestath_Day)
	{
		AI_Output(self, hero, "Info_Mod_Gestath_TrophaenHolen_11_01"); //Tak, na te liste umiescilem to, czego moge znowu potrzebowac.

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
		AI_Output(self, hero, "Info_Mod_Gestath_TrophaenHolen_11_02"); //Nie, sa dla mnie teraz inni mysliwi na drodze.
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
	description	= "Dostalem wasze trofea.";
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
	AI_Output(hero, self, "Info_Mod_Gestath_TrophaenGeben_15_00"); //Dostalem wasze trofea.

	B_ShowGivenThings	("Trofeum");

	Npc_RemoveInvItems	(hero, ItAt_DrgSnapperHorn, Mod_EIS_Gestath_DragonsnapperHorn);
	Npc_RemoveInvItems	(hero, ItAt_LurkerClaw, Mod_EIS_Gestath_LurkerClaw);
	Npc_RemoveInvItems	(hero, ItAt_Keilerhauer, Mod_EIS_Gestath_Keilerhauer);
	Npc_RemoveInvItems	(hero, ItAt_WaranFiretongue, Mod_EIS_Gestath_Flammenzunge);
	Npc_RemoveInvItems	(hero, ItAt_ShadowHorn, Mod_EIS_Gestath_ShadowHorn);
	Npc_RemoveInvItems	(hero, ItAt_SharkTeeth, Mod_EIS_Gestath_SharkTeeth);
	Npc_RemoveInvItems	(hero, ItWr_GestathTrophyList, 1);

	AI_Output(self, hero, "Info_Mod_Gestath_TrophaenGeben_11_01"); //Dobrze, dziekuje. Oto Twoje zloto.

	B_GiveInvItems	(self, hero, ItMi_Gold, (Mod_EIS_Gestath_DragonsnapperHorn * Value_DrgSnapperHorn + Mod_EIS_Gestath_LurkerClaw * Value_LurkerClaw + Mod_EIS_Gestath_Keilerhauer * Value_Keilerhauer + Mod_EIS_Gestath_Flammenzunge * Value_WaranFiretongue + Mod_EIS_Gestath_ShadowHorn * Value_ShadowHorn + Mod_EIS_Gestath_SharkTeeth * Value_SharkTeeth) / 2);

	Mod_EIS_Gestath = 0;

	if (Mod_EIS_Gestath_Day == 0) {
		Log_CreateTopic(TOPIC_MOD_HAENDLER_EISGEBIET, LOG_NOTE);
		B_LogEntry(TOPIC_MOD_HAENDLER_EISGEBIET, "Gestath handluje teraz ze mna i sprzedaje trofea mysliwskie.");
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
	description	= "Czego mozesz mnie nauczyc?";
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
	AI_Output(hero, self, "Info_Mod_Gestath_Lernen_15_00"); //Czego mozesz mnie nauczyc?

	if ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE))
	{
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_11_01"); //Zalezy od tego, co chcesz wiedziec.

		Info_ClearChoices	(Info_Mod_Gestath_Lernen);

		Info_AddChoice	(Info_Mod_Gestath_Lernen, DIALOG_BACK, Info_Mod_Gestath_Lernen_BACK);

		if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
		{ 
			Info_AddChoice	(Info_Mod_Gestath_Lernen, B_BuildLearnString("rozdarte zeby", B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)), Info_Mod_Gestath_Lernen_Teeth);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE)
		{ 
			Info_AddChoice	(Info_Mod_Gestath_Lernen, B_BuildLearnString("skóry", B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ReptileSkin)), Info_Mod_Gestath_Lernen_ReptileSkin);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
		{ 
			Info_AddChoice	(Info_Mod_Gestath_Lernen, B_BuildLearnString("pazury", B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Claws)), Info_Mod_Gestath_Lernen_Claws);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE)
		{ 
			Info_AddChoice	(Info_Mod_Gestath_Lernen, B_BuildLearnString("jezyk ognia", B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_FireTongue)), Info_Mod_Gestath_Lernen_FireTongue);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE)
		{ 
			Info_AddChoice	(Info_Mod_Gestath_Lernen, B_BuildLearnString("smok", B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DrgSnapperHorn)), Info_Mod_Gestath_Lernen_DrgSnapperHorn);
		};
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_11_02"); //Nie moge cie nauczyc wiecej niz juz wiesz. Przepraszam za to.
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
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_Claws_11_00"); //Zwierzeta nie lubia oddawac pazurów. Musisz trafic dokladnie tam, gdzie idziesz nozem.
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_Claws_11_01"); //Postawa dloni powinna byc lekko uwiklana. Z mocnym wstrzasem odciales pazur.
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_Claws_11_02"); //Sprzet jest zawsze pozadanym srodkiem platniczym dla przedsiebiorcy.
	};

	Info_ClearChoices	(Info_Mod_Gestath_Lernen);

	Info_AddChoice	(Info_Mod_Gestath_Lernen, DIALOG_BACK, Info_Mod_Gestath_Lernen_BACK);
		
};

FUNC void Info_Mod_Gestath_Lernen_ReptileSkin()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_ReptileSkin))
	{
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_ReptileSkin_11_00"); //I zawsze wyciac tylko na brzuchu, inaczej obnizysz jakosc.
	};

	Info_ClearChoices	(Info_Mod_Gestath_Lernen);

	Info_AddChoice	(Info_Mod_Gestath_Lernen, DIALOG_BACK, Info_Mod_Gestath_Lernen_BACK);
};

FUNC void Info_Mod_Gestath_Lernen_Teeth()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_Teeth))
	{
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_Teeth_11_00"); //Najprostsza rzecza, która mozna wyciagnac ze zwierzat jest ich zeby. Jezdzisz nozem dookola protezy w ustach.
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_Teeth_11_01"); //Potem umiejetnie oddziela sie go od czaszki zwierzecia szarpnieciem.
	};

	Info_ClearChoices	(Info_Mod_Gestath_Lernen);

	Info_AddChoice	(Info_Mod_Gestath_Lernen, DIALOG_BACK, Info_Mod_Gestath_Lernen_BACK);
};

FUNC void Info_Mod_Gestath_Lernen_Fur()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_Fur))
	{
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_Fur_11_00"); //Najlepszym sposobem usuniecia siersci jest wykonanie glebokiego ciecia na tylnych nogach zwierzecia.
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_Fur_11_01"); //Dzieki temu zawsze mozna latwo sciagnac futro z przodu do tylu.
	};

	Info_ClearChoices	(Info_Mod_Gestath_Lernen);

	Info_AddChoice	(Info_Mod_Gestath_Lernen, DIALOG_BACK, Info_Mod_Gestath_Lernen_BACK);
};

FUNC void Info_Mod_Gestath_Lernen_FireTongue()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_FireTongue))
	{
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_FireTongue_11_00"); //Za pomoca noza wycietego z ust podczas trzymania go druga reka uderza sie w jezyk monitora przeciwpozarowego.
	};

	Info_ClearChoices	(Info_Mod_Gestath_Lernen);

	Info_AddChoice	(Info_Mod_Gestath_Lernen, DIALOG_BACK, Info_Mod_Gestath_Lernen_BACK);
};

FUNC void Info_Mod_Gestath_Lernen_DrgSnapperHorn()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_DrgSnapperHorn))
	{
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_DrgSnapperHorn_11_00"); //Przy podstawie czolo smoka jest najlepszym miejscem do oddzielenia rogu od czaszki stabilnym nozem.
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
