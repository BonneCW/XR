INSTANCE Info_Mod_Halvor_Hi (C_INFO)
{
	npc		= Mod_582_NONE_Halvor_NW;
	nr		= 1;
	condition	= Info_Mod_Halvor_Hi_Condition;
	information	= Info_Mod_Halvor_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kim jestes?";
};

FUNC INT Info_Mod_Halvor_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Halvor_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Halvor_Hi_26_01"); //Jestem Halvor. Zawsze daje swieza rybe.
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Halvor w dzielnicy portowej jest rybakiem.");
};

INSTANCE Info_Mod_Halvor_HolFische (C_INFO)
{
	npc		= Mod_582_NONE_Halvor_NW;
	nr		= 1;
	condition	= Info_Mod_Halvor_HolFische_Condition;
	information	= Info_Mod_Halvor_HolFische_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Halvor_HolFische_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Halvor_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Farim_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_William_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Halvor_HolFische_Info()
{
	AI_Output(self, hero, "Info_Mod_Halvor_HolFische_26_00"); //Masz minute?

	Info_ClearChoices	(Info_Mod_Halvor_HolFische);

	Info_AddChoice	(Info_Mod_Halvor_HolFische, "Nie, nie mam teraz czasu.", Info_Mod_Halvor_HolFische_Nein);
	Info_AddChoice	(Info_Mod_Halvor_HolFische, "Tak, co jest?", Info_Mod_Halvor_HolFische_Ja);
};

FUNC VOID Info_Mod_Halvor_HolFische_Nein()
{
	AI_Output(hero, self, "Info_Mod_Halvor_HolFische_Nein_15_00"); //Nie, nie mam teraz czasu.
	AI_Output(self, hero, "Info_Mod_Halvor_HolFische_Nein_26_01"); //Cóz, mysle, ze sam bede musial sie tym zajac.

	Info_ClearChoices	(Info_Mod_Halvor_HolFische);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Halvor_HolFische_Ja()
{
	AI_Output(hero, self, "Info_Mod_Halvor_HolFische_Ja_15_00"); //Tak, co jest?
	AI_Output(self, hero, "Info_Mod_Halvor_HolFische_Ja_26_01"); //Jak wiecie, jestem tu rybakiem i teraz jestem prawie suchy.
	AI_Output(self, hero, "Info_Mod_Halvor_HolFische_Ja_26_02"); //Zazwyczaj dostaje rybe od rybaków Farima i Williama, ale oni nie widzieli sie od dni.
	AI_Output(self, hero, "Info_Mod_Halvor_HolFische_Ja_26_03"); //Czy móglbys odebrac mi jej rybe? Zaplacilem juz za nie, ale nie moge zostawic sie samotnie.

	Info_ClearChoices	(Info_Mod_Halvor_HolFische);

	Info_AddChoice	(Info_Mod_Halvor_HolFische, "Nie, idzcie sami.", Info_Mod_Halvor_HolFische_Ja_Nein);
	Info_AddChoice	(Info_Mod_Halvor_HolFische, "Tak, ale co z nagroda?", Info_Mod_Halvor_HolFische_Ja_Ja);
};

FUNC VOID Info_Mod_Halvor_HolFische_Ja_Nein()
{
	AI_Output(hero, self, "Info_Mod_Halvor_HolFische_Ja_Nein_15_00"); //Nie, idzcie sami.
	AI_Output(self, hero, "Info_Mod_Halvor_HolFische_Ja_Nein_26_01"); //Cóz, mysle, ze sam bede musial sie tym zajac.

	Info_ClearChoices	(Info_Mod_Halvor_HolFische);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Halvor_HolFische_Ja_Ja()
{
	AI_Output(hero, self, "Info_Mod_Halvor_HolFische_Ja_Ja_15_00"); //Tak, ale co z nagroda?
	AI_Output(self, hero, "Info_Mod_Halvor_HolFische_Ja_Ja_26_01"); //Oczywiscie, kazda mala przysluga chcialaby byc placona twarda gotówka, prawda?
	AI_Output(self, hero, "Info_Mod_Halvor_HolFische_Ja_Ja_26_02"); //Dobrze, jesli dobrze sobie radzisz, jest w nim troche zlota.
	AI_Output(hero, self, "Info_Mod_Halvor_HolFische_Ja_Ja_15_03"); //To wlasnie chcialem uslyszec. Bede wiec w drodze.

	Mod_HalvorHolFischeQuest = TRUE;

	Log_CreateTopic	(TOPIC_MOD_HALVOR_HOLFISCHE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_HALVOR_HOLFISCHE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_HALVOR_HOLFISCHE, "Halvor, handlarz ryb w dzielnicy portowej, chce, abym przywiózl mu ryby od rybaków Farima i Williama.");

	Info_ClearChoices	(Info_Mod_Halvor_HolFische);
};

INSTANCE Info_Mod_Halvor_HierSindFische (C_INFO)
{
	npc		= Mod_582_NONE_Halvor_NW;
	nr		= 1;
	condition	= Info_Mod_Halvor_HierSindFische_Condition;
	information	= Info_Mod_Halvor_HierSindFische_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dostalem rybe.";
};

FUNC INT Info_Mod_Halvor_HierSindFische_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Farim_HalvorHolFische))
	&& ((Mod_HalvorHolFischeQuest == 2)
	|| (Npc_IsDead(Mod_927_NONE_William_NW)))
	&& (Npc_HasItems(hero, ItFo_Fish) >= 20)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Halvor_HierSindFische_Info()
{
	AI_Output(hero, self, "Info_Mod_Halvor_HierSindFische_15_00"); //Dostalem rybe.

	B_GiveInvItems	(hero, self, ItFo_Fish, 20);

	AI_Output(self, hero, "Info_Mod_Halvor_HierSindFische_26_01"); //Cóz, moim klientom sie to spodoba.
	AI_Output(hero, self, "Info_Mod_Halvor_HierSindFische_15_02"); //Lubisz to równiez?
	AI_Output(self, hero, "Info_Mod_Halvor_HierSindFische_26_03"); //Ach, tak, oto kilka zlotych monet.

	B_GiveInvItems	(self, hero, ItMi_Gold, 50);

	B_GivePlayerXP	(50);

	B_LogEntry	(TOPIC_MOD_HALVOR_HOLFISCHE, "Przynioslam rybe Halvor i dostalam zlote monety, zeby mu podziekowac.");
	B_SetTopicStatus	(TOPIC_MOD_HALVOR_HOLFISCHE, LOG_SUCCESS);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Halvor_Fenia (C_INFO)
{
	npc		= Mod_582_NONE_Halvor_NW;
	nr		= 1;
	condition	= Info_Mod_Halvor_Fenia_Condition;
	information	= Info_Mod_Halvor_Fenia_Info;
	permanent	= 0;
	important	= 0;
	description	= "Slyszalem od Ciebie historie kobiety.";
};

FUNC INT Info_Mod_Halvor_Fenia_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fenia_AllesKlar))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Halvor_Fenia_Info()
{
	AI_Output(hero, self, "Info_Mod_Halvor_Fenia_15_00"); //Slyszalem od Ciebie historie kobiety.
	AI_Output(self, hero, "Info_Mod_Halvor_Fenia_26_01"); //Rozkoszuj sie! Ale nie rozmawiam o tym z nieznajomymi. Z zatrzymanymi.

	Info_ClearChoices	(Info_Mod_Halvor_Fenia);

	if (Mod_Verhandlungsgeschick > 0)
	{
		Info_AddChoice	(Info_Mod_Halvor_Fenia, "Jestem pewien, ze moglibyscie skorzystac z jakiegos wsparcia.", Info_Mod_Halvor_Fenia_C);
	};

	if (Npc_HasItems(hero, ItMi_Gold) >= 20)
	{
		Info_AddChoice	(Info_Mod_Halvor_Fenia, "Czy mozna przekonac Cie o tym, ze zloto jest pelne blasku? (- 20 zlota (- 20 zlota)", Info_Mod_Halvor_Fenia_B);
	};

	Info_AddChoice	(Info_Mod_Halvor_Fenia, "Wszystko w porzadku, zróbmy to odrzucmy.", Info_Mod_Halvor_Fenia_A);
};

FUNC VOID Info_Mod_Halvor_Fenia_D()
{
	AI_Output(self, hero, "Info_Mod_Halvor_Fenia_D_26_00"); //Laduj, ale nie ma wiele do powiedzenia.
	AI_Output(self, hero, "Info_Mod_Halvor_Fenia_D_26_01"); //Nie wiem, czym jest fantazja fenii. Tak, to robie, ale nie wiem dlaczego.
	AI_Output(self, hero, "Info_Mod_Halvor_Fenia_D_26_02"); //Ona zazdrosci o kazda kobiete, z która rozmawiam, i to wiele kobiet.
	AI_Output(self, hero, "Info_Mod_Halvor_Fenia_D_26_03"); //Kiedy zobaczyla, ze Sonja kupila u mnie rybe, niemal szalala i zalozyla, ze Sonja przyjedzie do mnie po wielkiej nocy.
	AI_Output(hero, self, "Info_Mod_Halvor_Fenia_D_15_04"); //Nic wiec nie budzi watpliwosci?
	AI_Output(self, hero, "Info_Mod_Halvor_Fenia_D_26_05"); //Od lat nie bylem w kurniku!
	AI_Output(self, hero, "Info_Mod_Halvor_Fenia_D_26_06"); //Ale im wiecej mnie Fenia pchnie, tym lepiej bym sobie z nia poradzila.
	AI_Output(self, hero, "Info_Mod_Halvor_Fenia_D_26_07"); //Jestem pewien, ze to je ozywiloby.

	Info_ClearChoices	(Info_Mod_Halvor_Fenia);
};

FUNC VOID Info_Mod_Halvor_Fenia_C()
{
	AI_Output(hero, self, "Info_Mod_Halvor_Fenia_C_15_00"); //Z pewnoscia mozesz skorzystac z jakiegos wsparcia.

	if (self.aivar[AIV_Verhandlung] == TRUE)
	{
		B_GivePlayerXP	(10);

		B_RaiseHandelsgeschick (2);

		Info_Mod_Halvor_Fenia_D();
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Halvor_Fenia_C_26_01"); //Z pewnoscia nie potrzebuje waszego wsparcia.

		Info_ClearChoices	(Info_Mod_Halvor_Fenia);
	};
};

FUNC VOID Info_Mod_Halvor_Fenia_B()
{
	AI_Output(hero, self, "Info_Mod_Halvor_Fenia_B_15_00"); //Czy mozna przekonac Cie o tym, ze zloto jest pelne blasku?

	B_GiveInvItems	(hero, self, ItMi_Gold, 20);

	Info_Mod_Halvor_Fenia_D();
};

FUNC VOID Info_Mod_Halvor_Fenia_A()
{
	AI_Output(hero, self, "Info_Mod_Halvor_Fenia_A_15_00"); //Wszystko w porzadku, zróbmy to odrzucmy.

	Info_ClearChoices	(Info_Mod_Halvor_Fenia);
};

INSTANCE Info_Mod_Halvor_Kap2 (C_INFO)
{
	npc		= Mod_582_NONE_Halvor_NW;
	nr		= 1;
	condition	= Info_Mod_Halvor_Kap2_Condition;
	information	= Info_Mod_Halvor_Kap2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Masz wiec swieza rybe?";
};

FUNC INT Info_Mod_Halvor_Kap2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Halvor_Hi))
	&& (Kapitel >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Halvor_Kap2_Info()
{
	AI_Output(hero, self, "Info_Mod_Halvor_Kap2_15_00"); //Masz wiec swieza rybe?
	AI_Output(self, hero, "Info_Mod_Halvor_Kap2_26_01"); //Wlasnie o tym ciagle wam mówie. Swieze ryby.
	AI_Output(hero, self, "Info_Mod_Halvor_Kap2_15_02"); //Który z nich jest najswiezszy?
	AI_Output(self, hero, "Info_Mod_Halvor_Kap2_26_03"); //Sa równie dobre. Swieze ryby, to wszystko.
	AI_Output(hero, self, "Info_Mod_Halvor_Kap2_15_04"); //Wiec naprawde swieze sledzie?
	AI_Output(self, hero, "Info_Mod_Halvor_Kap2_26_05"); //Zobacz to, bohater. Zobacz, ze sledz po lewej stronie?
	AI_Output(hero, self, "Info_Mod_Halvor_Kap2_15_06"); //Masz na mysli to?
	AI_Output(self, hero, "Info_Mod_Halvor_Kap2_26_07"); //Tak, tak wlasnie jest. Jest tak swiezy, wczoraj plywal w oceanie, zonglowal rekinami. Jest tak swiezy. Teraz odejdz i zostaw mnie sam na sam.
};

INSTANCE Info_Mod_Halvor_Trade (C_INFO)
{
	npc		= Mod_582_NONE_Halvor_NW;
	nr		= 1;
	condition	= Info_Mod_Halvor_Trade_Condition;
	information	= Info_Mod_Halvor_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Halvor_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Halvor_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Halvor_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Halvor_Pickpocket (C_INFO)
{
	npc		= Mod_582_NONE_Halvor_NW;
	nr		= 1;
	condition	= Info_Mod_Halvor_Pickpocket_Condition;
	information	= Info_Mod_Halvor_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Halvor_Pickpocket_Condition()
{
	C_Beklauen	(52, ItFo_Fish, 12);
};

FUNC VOID Info_Mod_Halvor_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Halvor_Pickpocket);

	Info_AddChoice	(Info_Mod_Halvor_Pickpocket, DIALOG_BACK, Info_Mod_Halvor_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Halvor_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Halvor_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Halvor_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Halvor_Pickpocket);
};

FUNC VOID Info_Mod_Halvor_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Halvor_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Halvor_Pickpocket);

		Info_AddChoice	(Info_Mod_Halvor_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Halvor_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Halvor_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Halvor_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Halvor_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Halvor_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Halvor_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Halvor_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Halvor_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Halvor_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Halvor_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Halvor_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Halvor_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Halvor_EXIT (C_INFO)
{
	npc		= Mod_582_NONE_Halvor_NW;
	nr		= 1;
	condition	= Info_Mod_Halvor_EXIT_Condition;
	information	= Info_Mod_Halvor_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Halvor_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Halvor_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
