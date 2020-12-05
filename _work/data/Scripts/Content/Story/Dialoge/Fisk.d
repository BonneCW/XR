INSTANCE Info_Mod_Fisk_Hi (C_INFO)
{
	npc		= Mod_950_STT_Fisk_MT;
	nr		= 1;
	condition	= Info_Mod_Fisk_Hi_Condition;
	information	= Info_Mod_Fisk_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Fisk_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fisk_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Fisk_Hi_37_00"); //Hej, moge ci cos sprzedac. Mam troche broni.
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_OLDCAMP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_OLDCAMP, "Dysk zajmuje sie sprzedaza broni.");
};

INSTANCE Info_Mod_Fisk_Dieb (C_INFO)
{
	npc		= Mod_950_STT_Fisk_MT;
	nr		= 1;
	condition	= Info_Mod_Fisk_Dieb_Condition;
	information	= Info_Mod_Fisk_Dieb_Info;
	permanent	= 0;
	important	= 0;
	description	= "Slysze, ze masz do czynienia z goracymi goracymi rzeczami....";
};

FUNC INT Info_Mod_Fisk_Dieb_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_Dieb))
	&& (Mod_PDV_Genug_Infos >= 2)
	&& (Mod_PDV_Fisk_Infos == 0)
	&& (Npc_KnowsInfo(hero, Info_Mod_Fisk_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fisk_Dieb_Info()
{
	AI_Output(hero, self, "Info_Mod_Fisk_Dieb_15_00"); //Ich habe gehört, dass du mit "goracy" handelst, und ich würde dir vorschlagen, du verrätst mir, ob darunter das Zeug ist, das den Erzbaronen gestohlen wurde.
	AI_Output(self, hero, "Info_Mod_Fisk_Dieb_37_01"); //Nie moge temu pomóc, przyszedl do mnie i chcial, abym zachowal rzeczy dla swojego kontaktownika. Zagrozil, ze mnie zabije.
	AI_Output(hero, self, "Info_Mod_Fisk_Dieb_15_02"); //Kim jest on? Czy moze pan przynajmniej dac mi dowód przeciwko niemu?
	AI_Output(self, hero, "Info_Mod_Fisk_Dieb_37_03"); //Jesli upewnisz sie, ze mnie nie skrzywdzi, daje ci dowód przeciwko niemu.

	Mod_PDV_Fisk_Infos = 1;
};

INSTANCE Info_Mod_Fisk_Frage (C_INFO)
{
	npc		= Mod_950_STT_Fisk_MT;
	nr		= 1;
	condition	= Info_Mod_Fisk_Frage_Condition;
	information	= Info_Mod_Fisk_Frage_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bylbym zainteresowany....";
};

FUNC INT Info_Mod_Fisk_Frage_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_Dieb))
	&& (Mod_PDV_Genug_Infos >= 2)
	&& (Mod_PDV_Fisk_Infos == 0)
	&& (Npc_KnowsInfo(hero, Info_Mod_Fisk_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fisk_Frage_Info()
{
	AI_Output(hero, self, "Info_Mod_Fisk_Frage_15_00"); //Interesowaly mnie rzeczy barona i slyszalem, jak sprzedawales troche.
	AI_Output(self, hero, "Info_Mod_Fisk_Frage_37_01"); //Skad to wiesz? Nie, nie moge sprzedac zadnej z tych rzeczy, wiec zapomnij o tym, co mam.
	AI_Output(hero, self, "Info_Mod_Fisk_Frage_15_02"); //Sluchaj, jestem w imieniu Thorusa i musze wiedziec, co sie dzieje.
	AI_Output(self, hero, "Info_Mod_Fisk_Frage_37_03"); //Jesli upewnisz sie, ze mnie nie skrzywdzi, daje ci dowód przeciwko niemu.

	Mod_PDV_Fisk_Infos = 1;
};

INSTANCE Info_Mod_Fisk_Hilfe (C_INFO)
{
	npc		= Mod_950_STT_Fisk_MT;
	nr		= 1;
	condition	= Info_Mod_Fisk_Hilfe_Condition;
	information	= Info_Mod_Fisk_Hilfe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ladunek.";
};

FUNC INT Info_Mod_Fisk_Hilfe_Condition()
{
	if (Mod_PDV_Fisk_Infos == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fisk_Hilfe_Info()
{
	AI_Output(hero, self, "Info_Mod_Fisk_Hilfe_15_00"); //Ladunek.
	AI_Output(self, hero, "Info_Mod_Fisk_Hilfe_37_01"); //Zawsze zawsze kradna rzeczy o godzinie 2:00, a nastepnie zabieraja je do mojego sklepu. W tym czasie oczekuja, ze bede obecny.
	AI_Output(self, hero, "Info_Mod_Fisk_Hilfe_37_02"); //Lie in czekac w domu barona o tej godzinie.
	AI_Output(hero, self, "Info_Mod_Fisk_Hilfe_15_03"); //Wszystko jasne.

	Mod_PDV_Fisk_Infos = 2;

	B_LogEntry	(TOPIC_MOD_PDV, "Poprosilem go, czy móglby mi podac wiecej szczególów. Powiedzial, ze jesli zglosie to Thorusowi, on da mi dowód. Powiedzial mi równiez, zebym klamal czekac na Ciebie o godzinie 2:00 w Domu Archbaronów.");

	B_StartOtherRoutine	(Mod_943_GRD_Bloodwyn_MT, "DIEB");
	B_StartOtherRoutine	(Mod_1110_GRD_Cutter_MT, "DIEB");
};

INSTANCE Info_Mod_Fisk_Zettel (C_INFO)
{
	npc		= Mod_950_STT_Fisk_MT;
	nr		= 1;
	condition	= Info_Mod_Fisk_Zettel_Condition;
	information	= Info_Mod_Fisk_Zettel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Zdobyto krew i obcinak, co z dowodami?";
};

FUNC INT Info_Mod_Fisk_Zettel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorus_Diebe))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fisk_Zettel_Info()
{
	AI_Output(hero, self, "Info_Mod_Fisk_Zettel_15_00"); //Zdobyto krew i obcinak, co z dowodami?
	AI_Output(self, hero, "Info_Mod_Fisk_Zettel_37_01"); //Tutaj pismo to pojawialo sie przy kazdej dostawie.

	B_GiveInvItems	(self, hero, ItWr_FisksNotiz, 1);

	B_LogEntry	(TOPIC_MOD_PDV, "Dysk dal mi papier. To powinno to stanowic dowód.");
};

INSTANCE Info_Mod_Fisk_SLDSpy (C_INFO)
{
	npc		= Mod_950_STT_Fisk_MT;
	nr		= 1;
	condition	= Info_Mod_Fisk_SLDSpy_Condition;
	information	= Info_Mod_Fisk_SLDSpy_Info;
	permanent	= 0;
	important	= 0;
	description	= "Witaj, co nowego w obozie?";
};

FUNC INT Info_Mod_Fisk_SLDSpy_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fisk_Hi))
	&& (Mod_SLD_STT_Mordrag == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Lee_GotoSylvio))
	&& (Mod_SLD_Spy == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fisk_SLDSpy_Info()
{
	AI_Output(hero, self, "Info_Mod_Fisk_SLDSpy_15_00"); //Witaj, co nowego w obozie?
	AI_Output(self, hero, "Info_Mod_Fisk_SLDSpy_37_01"); //O to wlasnie pytasz....
	AI_Output(hero, self, "Info_Mod_Fisk_SLDSpy_15_02"); //(oczekiwane) Tak?
	AI_Output(self, hero, "Info_Mod_Fisk_SLDSpy_37_03"); //Moje towary. Najlepsza i najnowsza jakosc, jaka mozna uzyskac za atrakcyjna cene.
	AI_Output(hero, self, "Info_Mod_Fisk_SLDSpy_15_04"); //Ach i inne nowosci?
	AI_Output(self, hero, "Info_Mod_Fisk_SLDSpy_37_05"); //Teraz wiem, co pan ma na mysli....
	AI_Output(hero, self, "Info_Mod_Fisk_SLDSpy_15_06"); //Slucham.
	AI_Output(self, hero, "Info_Mod_Fisk_SLDSpy_37_07"); //Rzeczy z szczurami w duszeniu baronów rudy. Nie lakne, mówie ci. Za czasów Gomeza obaj szefowie kuchni byliby zacieci lub na kólkach.
	AI_Output(hero, self, "Info_Mod_Fisk_SLDSpy_15_08"); //Hmm.....
	AI_Output(self, hero, "Info_Mod_Fisk_SLDSpy_37_09"); //Albo, tak, czuwal zabójca Cutter. Wyglada jak cos waznego. To wszystko, o czym moge teraz pomyslec.

	B_LogEntry	(TOPIC_MOD_SLD_SPY, "Cutter byl swiadkiem waznego morderstwa, czego dowiedzialem sie od Fiskusa.");
};

INSTANCE Info_Mod_Fisk_CutterBad (C_INFO)
{
	npc		= Mod_950_STT_Fisk_MT;
	nr		= 1;
	condition	= Info_Mod_Fisk_CutterBad_Condition;
	information	= Info_Mod_Fisk_CutterBad_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hej, powiedziales mi, ze Cutter oglada morderstwo.";
};

FUNC INT Info_Mod_Fisk_CutterBad_Condition()
{
	if (Mod_SLD_Spy == 5)
	&& (Mob_HasItems("CUTTERSTRUHE", ItMw_BloodySword) == 1)
	&& (Mob_HasItems("CUTTERSTRUHE", ItWr_SentenzaForCutter) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fisk_CutterBad_Info()
{
	AI_Output(hero, self, "Info_Mod_Fisk_CutterBad_15_00"); //Hej, powiedziales mi, ze Cutter oglada morderstwo.
	AI_Output(self, hero, "Info_Mod_Fisk_CutterBad_37_01"); //Tak, i?
	AI_Output(hero, self, "Info_Mod_Fisk_CutterBad_15_02"); //Ostatnio Cutter gral dosc dziwnie. Widzialem, jak noca przeniknal przez obóz stosem smieci, jakby chcial ukryc to, co trzeba bylo ukryc. Mozliwe, ze.... Nie, to byloby absurdalne.....
	AI_Output(self, hero, "Info_Mod_Fisk_CutterBad_37_03"); //Tak, powiedz mi, co myslisz?
	AI_Output(hero, self, "Info_Mod_Fisk_CutterBad_15_04"); //Cóz, zastanawialem sie, czy on sam nie moze miec z tym morderstwem nic wspólnego.
	AI_Output(self, hero, "Info_Mod_Fisk_CutterBad_37_05"); //To niebezpieczne zalozenie.... Samo w sobie Hmm, ale czy jest w nim jakas prawda? Zdecydowanie musza zajac sie tym niektórzy straznicy.

	Mod_SLD_Spy = 6;

	B_LogEntry	(TOPIC_MOD_SLD_SPY, "Cóz, tak sie stalo. Teraz straznik powinien wkrótce patrzec w klatke piersiowa Cuttera.");
};

INSTANCE Info_Mod_Fisk_WoherWaren (C_INFO)
{
	npc		= Mod_950_STT_Fisk_MT;
	nr		= 1;
	condition	= Info_Mod_Fisk_WoherWaren_Condition;
	information	= Info_Mod_Fisk_WoherWaren_Info;
	permanent	= 0;
	important	= 0;
	description	= "Gdzie w tych trudnych czasach dostajecie towar?";
};

FUNC INT Info_Mod_Fisk_WoherWaren_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fisk_WoherWaren_Info()
{
	AI_Output(hero, self, "Info_Mod_Fisk_WoherWaren_15_00"); //Gdzie w tych trudnych czasach dostajecie towar?
	AI_Output(self, hero, "Info_Mod_Fisk_WoherWaren_37_01"); //Zdobywanie broni nie jest teraz problemem. Mamy mnóstwo dobrych kowali.
	AI_Output(self, hero, "Info_Mod_Fisk_WoherWaren_37_02"); //Ale nikt nie chce teraz tego wszystkiego. Jaki sens ma uzycie zlomu zelazka, jesli rzeczywiscie potrzebujesz czegos pomiedzy zebami?
	AI_Output(hero, self, "Info_Mod_Fisk_WoherWaren_15_03"); //Dlaczego wiec jestes tu nadal obecny?
	AI_Output(self, hero, "Info_Mod_Fisk_WoherWaren_37_04"); //Zastanawiam sie, ze od dawna.....
};

INSTANCE Info_Mod_Fisk_Trade (C_INFO)
{
	npc		= Mod_950_STT_Fisk_MT;
	nr		= 1;
	condition	= Info_Mod_Fisk_Trade_Condition;
	information	= Info_Mod_Fisk_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Fisk_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fisk_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fisk_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Fisk_Pickpocket (C_INFO)
{
	npc		= Mod_950_STT_Fisk_MT;
	nr		= 1;
	condition	= Info_Mod_Fisk_Pickpocket_Condition;
	information	= Info_Mod_Fisk_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Fisk_Pickpocket_Condition()
{
	C_Beklauen	(59, ItMi_Nugget, 2);
};

FUNC VOID Info_Mod_Fisk_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Fisk_Pickpocket);

	Info_AddChoice	(Info_Mod_Fisk_Pickpocket, DIALOG_BACK, Info_Mod_Fisk_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Fisk_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Fisk_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Fisk_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Fisk_Pickpocket);
};

FUNC VOID Info_Mod_Fisk_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Fisk_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Fisk_Pickpocket);

		Info_AddChoice	(Info_Mod_Fisk_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Fisk_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Fisk_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Fisk_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Fisk_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Fisk_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Fisk_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Fisk_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Fisk_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Fisk_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Fisk_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Fisk_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Fisk_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Fisk_EXIT (C_INFO)
{
	npc		= Mod_950_STT_Fisk_MT;
	nr		= 1;
	condition	= Info_Mod_Fisk_EXIT_Condition;
	information	= Info_Mod_Fisk_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Fisk_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fisk_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
