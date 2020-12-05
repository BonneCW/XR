INSTANCE Info_Mod_Kimon_REL_Hi (C_INFO)
{
	npc		= Mod_7771_FH_Kimon_REL;
	nr		= 1;
	condition	= Info_Mod_Kimon_REL_Hi_Condition;
	information	= Info_Mod_Kimon_REL_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Kimon_REL_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Kimon_REL_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Hi_34_00"); //Spotykamy sie wiec ponownie. Na drodze?
	AI_Output(hero, self, "Info_Mod_Kimon_REL_Hi_15_01"); //Mówisz to. Zawsze mam cos do zrobienia.
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Hi_34_02"); //Tak samo jak ja. Moja firma znów rozkwita. Tylko....
	AI_Output(hero, self, "Info_Mod_Kimon_REL_Hi_15_03"); //Po prostu?
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Hi_34_04"); //Waznym klientem interesuja sie dozowniki blyszczace. Jest to dobrze znane w Khoracie.
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Hi_34_05"); //Tam tez mam dobre relacje, ale nie moge znalezc dostawcy.
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Hi_34_06"); //Sedzia i prezes oczywiscie maja na niej swoje rece.
	AI_Output(hero, self, "Info_Mod_Kimon_REL_Hi_15_07"); //A kto tworzy rzeczy?
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Hi_34_08"); //To maja byc ludzie sadu. Jednak dostep do nich jest blokowany przez magiczna bariere. Nikt nie moze przejsc.
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Hi_34_09"); //Próbowalem go sam, ale zmusilo mnie to do zawracania za kazdym razem, niezaleznie od tego, czy chcialem, czy nie.
	AI_Output(hero, self, "Info_Mod_Kimon_REL_Hi_15_10"); //Dziwny. A dlaczego mi o tym mówisz?
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Hi_34_11"); //Jestes bardziej skuteczny niz ja. Byc moze podczas pobytu w Khoracie mozna znalezc dostawce.
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Hi_34_12"); //To nie powinno byc twoim uszkodzeniem. Dla mnie wystarcza mi trzy czesci.....
};

INSTANCE Info_Mod_Kimon_REL_Freudenspender (C_INFO)
{
	npc		= Mod_7771_FH_Kimon_REL;
	nr		= 1;
	condition	= Info_Mod_Kimon_REL_Freudenspender_Condition;
	information	= Info_Mod_Kimon_REL_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description	= "Zapytam sie przy okazji.";
};

FUNC INT Info_Mod_Kimon_REL_Freudenspender_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kimon_REL_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kimon_REL_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Kimon_REL_Freudenspender_15_00"); //Zapytam sie przy okazji.
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Freudenspender_34_01"); //Jesli cos znajdziecie, wróccie do mnie.

	Log_CreateTopic	(TOPIC_MOD_KIMON_FREUDENSPENDER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_KIMON_FREUDENSPENDER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_KIMON_FREUDENSPENDER, "Dealer Kimon chce trzykrotnie odsprzedac delights. Mam znalezc dostawce w Khoracie. Mysle, ze jest to wlasciwy adres.");
};

INSTANCE Info_Mod_Kimon_REL_Freudenspender2 (C_INFO)
{
	npc		= Mod_7771_FH_Kimon_REL;
	nr		= 1;
	condition	= Info_Mod_Kimon_REL_Freudenspender2_Condition;
	information	= Info_Mod_Kimon_REL_Freudenspender2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Kimon_REL_Freudenspender2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_PennerVater_Kimon2))
	&& (Npc_HasItems(hero, ItMi_Freudenspender) >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kimon_REL_Freudenspender2_Info()
{
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Freudenspender2_34_00"); //Czy cos zrobiles/as?
	AI_Output(hero, self, "Info_Mod_Kimon_REL_Freudenspender2_15_01"); //Ale tak, tak, tak. Nie tylko dostawca, ale takze towary. Tutaj.

	B_GiveInvItems	(hero, self, ItMi_Freudenspender, 3);

	AI_Output(self, hero, "Info_Mod_Kimon_REL_Freudenspender2_34_02"); //Fantastyczne! Miales/as wydatki?
	AI_Output(hero, self, "Info_Mod_Kimon_REL_Freudenspender2_15_03"); //Tak, okolo 350 zlota.
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Freudenspender2_34_04"); //Tutaj wracasz i 350 na swoje problemy.
	
	B_GiveInvItems (self, hero, ItMi_Gold, 700);
	
	AI_Output(hero, self, "Info_Mod_Kimon_REL_Freudenspender2_15_05"); //Do zobaczenia nastepnym razem.

	B_SetTopicStatus	(TOPIC_MOD_KIMON_FREUDENSPENDER, LOG_SUCCESS);

	CurrentNQ += 1;

	B_GivePlayerXP	(150);
};

INSTANCE Info_Mod_Kimon_REL_Trade (C_INFO)
{
	npc		= Mod_7771_FH_Kimon_REL;
	nr		= 1;
	condition	= Info_Mod_Kimon_REL_Trade_Condition;
	information	= Info_Mod_Kimon_REL_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Kimon_REL_Trade_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Kimon_REL_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Kimon_REL_Pickpocket (C_INFO)
{
	npc		= Mod_7771_FH_Kimon_REL;
	nr		= 1;
	condition	= Info_Mod_Kimon_REL_Pickpocket_Condition;
	information	= Info_Mod_Kimon_REL_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Kimon_REL_Pickpocket_Condition()
{
	C_Beklauen	(70, ItMi_Gold, 24);
};

FUNC VOID Info_Mod_Kimon_REL_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Kimon_REL_Pickpocket);

	Info_AddChoice	(Info_Mod_Kimon_REL_Pickpocket, DIALOG_BACK, Info_Mod_Kimon_REL_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Kimon_REL_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Kimon_REL_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Kimon_REL_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Kimon_REL_Pickpocket);
};

FUNC VOID Info_Mod_Kimon_REL_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Kimon_REL_Pickpocket);
};

INSTANCE Info_Mod_Kimon_REL_EXIT (C_INFO)
{
	npc		= Mod_7771_FH_Kimon_REL;
	nr		= 1;
	condition	= Info_Mod_Kimon_REL_EXIT_Condition;
	information	= Info_Mod_Kimon_REL_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Kimon_REL_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Kimon_REL_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
