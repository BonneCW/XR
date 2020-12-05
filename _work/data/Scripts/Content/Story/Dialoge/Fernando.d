INSTANCE Info_Mod_Fernando_Hi (C_INFO)
{
	npc		= Mod_576_NONE_Fernando_NW;
	nr		= 1;
	condition	= Info_Mod_Fernando_Hi_Condition;
	information	= Info_Mod_Fernando_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "A kim jestes?";
};

FUNC INT Info_Mod_Fernando_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fernando_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Fernando_Hi_15_00"); //A kim jestes?
	AI_Output(self, hero, "Info_Mod_Fernando_Hi_11_01"); //Fernando. Prosze przepraszam za zmeczenie, nie spie teraz dobrze.
};

INSTANCE Info_Mod_Fernando_BadSleep (C_INFO)
{
	npc		= Mod_576_NONE_Fernando_NW;
	nr		= 1;
	condition	= Info_Mod_Fernando_BadSleep_Condition;
	information	= Info_Mod_Fernando_BadSleep_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dlaczego nie spisz dobrze?";
};

FUNC INT Info_Mod_Fernando_BadSleep_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fernando_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fernando_BadSleep_Info()
{
	AI_Output(hero, self, "Info_Mod_Fernando_BadSleep_15_00"); //Dlaczego nie spisz dobrze?

	AI_PlayAni	(self, "T_SEARCH");

	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep_11_01"); //Dom po drugiej stronie ulicy jest nawiedzony! Pod sypialnia Paladina.
	AI_Output(hero, self, "Info_Mod_Fernando_BadSleep_15_02"); //Oh, tak.
	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep_11_03"); //Naprawde nie! Od czasu smierci starego czlowieka, do którego dom nalezal, dom trzeszczyl i wrzaskal w nim noca, tak jak w królestwie Beliara!
	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep_11_04"); //Jak tylko sie przytaknelo, zaczyna sie, czasami na kilka godzin.
	AI_Output(hero, self, "Info_Mod_Fernando_BadSleep_15_05"); //Dlaczego nie sprawdzisz, co powoduje halas?
	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep_11_06"); //Nie mozesz tego zrobic! Ja, cóz, czy to jest duch starego czlowieka? A moze inny diabelski szatan?
	AI_Output(hero, self, "Info_Mod_Fernando_BadSleep_15_07"); //Co sadza straznicy miasta?
	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep_11_08"); //Nie chcesz w to wierzyc! Usmiech mi sie policzkowo lub smiac!
	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep_11_09"); //I wyglada na to, ze codziennie rano zrywam. Czy zajmie sie pan ta sprawa?

	Info_ClearChoices	(Info_Mod_Fernando_BadSleep);

	Info_AddChoice	(Info_Mod_Fernando_BadSleep, "Nie wierze w duchy.", Info_Mod_Fernando_BadSleep_B);
	Info_AddChoice	(Info_Mod_Fernando_BadSleep, "Zobacze.", Info_Mod_Fernando_BadSleep_A);
};

FUNC VOID Info_Mod_Fernando_BadSleep_B()
{
	AI_Output(hero, self, "Info_Mod_Fernando_BadSleep_B_15_00"); //Nie wierze w duchy.

	Info_ClearChoices	(Info_Mod_Fernando_BadSleep);
};

FUNC VOID Info_Mod_Fernando_BadSleep_A()
{
	AI_Output(hero, self, "Info_Mod_Fernando_BadSleep_A_15_00"); //Zobacze.
	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep_A_11_01"); //Dziekuje, dziekuje! Zaprzestancie tego!

	Log_CreateTopic	(TOPIC_MOD_FERNANDO_MITTERNACHTSSPUK, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_FERNANDO_MITTERNACHTSSPUK, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_FERNANDO_MITTERNACHTSSPUK, "Fernando jest torturowany w nocy szumami z pustego domu sasiada. Jest to budynek pod sypialnia Paladina. Mialem poczekac w domu o pólnocy i zobaczyc, co sie tam dzieje.");

	Mod_Fernando_Mitternachtsspuk = 1;

	if (!Mod_Valentino_Kidnapped)
	{
		B_StartOtherRoutine	(Mod_754_NONE_Valentino_NW, "SPUK");
		B_StartOtherRoutine	(Mod_1066_VLK_Buergerin_NW, "SPUK");
	};

	Info_ClearChoices	(Info_Mod_Fernando_BadSleep);
};

INSTANCE Info_Mod_Fernando_BadSleep2 (C_INFO)
{
	npc		= Mod_576_NONE_Fernando_NW;
	nr		= 1;
	condition	= Info_Mod_Fernando_BadSleep2_Condition;
	information	= Info_Mod_Fernando_BadSleep2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Fernando_BadSleep2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Valentino_Mitternachtsspuk))
	&& (Wld_IsTime(22,05,07,59))
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fernando_BadSleep2_Info()
{
	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep2_11_00"); //(screams) Pomoc, pomoc! Oh Innos! Och, to tylko ty. (jaja)
};

INSTANCE Info_Mod_Fernando_BadSleep3 (C_INFO)
{
	npc		= Mod_576_NONE_Fernando_NW;
	nr		= 1;
	condition	= Info_Mod_Fernando_BadSleep3_Condition;
	information	= Info_Mod_Fernando_BadSleep3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Rozwiazywalem zagadke nawiedzonej dzielnicy.";
};

FUNC INT Info_Mod_Fernando_BadSleep3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Valentino_Mitternachtsspuk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fernando_BadSleep3_Info()
{
	AI_Output(hero, self, "Info_Mod_Fernando_BadSleep3_15_00"); //Rozwiazywalem zagadke nawiedzonej dzielnicy.
	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep3_11_01"); //Tak?
	AI_Output(hero, self, "Info_Mod_Fernando_BadSleep3_15_02"); //Malzonkowie, zakochani, przeniesli sie tam w zamilowanie.
	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep3_11_03"); //Czy....? Oh.
	AI_Output(hero, self, "Info_Mod_Fernando_BadSleep3_15_04"); //Czy mozna lepiej spac z wiedza?
	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep3_11_05"); //Oczywiscie. (mumbuly) Zbierz sie razem......
	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep3_11_06"); //Uh, oczywiscie zasluguje pan na nagrode. Wez to tutaj.

	B_GiveInvItems	(self, hero, ItMi_Gold, 150);

	if (Wld_IsTime(22,05,07,59))
	{
		AI_Output(self, hero, "Info_Mod_Fernando_BadSleep3_11_07"); //A teraz potrzebuje dobrego snu.
	};

	Mod_FernandoBlubber = Wld_GetDay();

	B_SetTopicStatus	(TOPIC_MOD_FERNANDO_MITTERNACHTSSPUK, LOG_SUCCESS);

	B_GivePlayerXP	(100);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Fernando_SonjaFreier (C_INFO)
{
	npc		= Mod_576_NONE_Fernando_NW;
	nr		= 1;
	condition	= Info_Mod_Fernando_SonjaFreier_Condition;
	information	= Info_Mod_Fernando_SonjaFreier_Info;
	permanent	= 0;
	important	= 0;
	description	= "Jestes jednym z freelancerów Sonji?";
};

FUNC INT Info_Mod_Fernando_SonjaFreier_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fernando_Hi))
	&& (Mod_Sonja_Freier == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fernando_SonjaFreier_Info()
{
	AI_Output(hero, self, "Info_Mod_Fernando_SonjaFreier_15_00"); //Jestes jednym z freelancerów Sonji?
	AI_Output(self, hero, "Info_Mod_Fernando_SonjaFreier_11_01"); //Szukaj! Nie tak glosno!
	AI_Output(hero, self, "Info_Mod_Fernando_SonjaFreier_15_02"); //Tak wiec, tak?
	AI_Output(self, hero, "Info_Mod_Fernando_SonjaFreier_11_03"); //Cichy) Czasy juz minely. Moja zona.... zauwazyla cos. Nie, nie, czasy juz minely.

	Mod_Sonja_Freier = 2;

	B_LogEntry	(TOPIC_MOD_SONJA_FREIER, "Fernando jest dawna regularnoscia Sonji. Jednak zona dowiedziala sie o jego rozmachu, wiec nie odwazyl sie isc do domu publicznego.");
};

INSTANCE Info_Mod_Fernando_BadSleep4 (C_INFO)
{
	npc		= Mod_576_NONE_Fernando_NW;
	nr		= 1;
	condition	= Info_Mod_Fernando_BadSleep4_Condition;
	information	= Info_Mod_Fernando_BadSleep4_Info;
	permanent	= 1;
	important	= 0;
	description	= "Czy spisz dobrze teraz?";
};

FUNC INT Info_Mod_Fernando_BadSleep4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fernando_BadSleep3))
	&& (Wld_GetDay() > Mod_FernandoBlubber)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fernando_BadSleep4_Info()
{
	AI_Output(hero, self, "Info_Mod_Fernando_BadSleep4_15_00"); //Czy spisz dobrze teraz?
	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep4_11_01"); //Wiekszosc czasu. Nie tylko wtedy, gdy w nastepnym pokoju sa zbyt dzikie.
};

INSTANCE Info_Mod_Fernando_Pickpocket (C_INFO)
{
	npc		= Mod_576_NONE_Fernando_NW;
	nr		= 1;
	condition	= Info_Mod_Fernando_Pickpocket_Condition;
	information	= Info_Mod_Fernando_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Fernando_Pickpocket_Condition()
{
	C_Beklauen	(72, ItMi_Gold, 30);
};

FUNC VOID Info_Mod_Fernando_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Fernando_Pickpocket);

	Info_AddChoice	(Info_Mod_Fernando_Pickpocket, DIALOG_BACK, Info_Mod_Fernando_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Fernando_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Fernando_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Fernando_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Fernando_Pickpocket);
};

FUNC VOID Info_Mod_Fernando_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Fernando_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Fernando_Pickpocket);

		Info_AddChoice	(Info_Mod_Fernando_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Fernando_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Fernando_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Fernando_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Fernando_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Fernando_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Fernando_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Fernando_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Fernando_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Fernando_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Fernando_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Fernando_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Fernando_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Fernando_EXIT (C_INFO)
{
	npc		= Mod_576_NONE_Fernando_NW;
	nr		= 1;
	condition	= Info_Mod_Fernando_EXIT_Condition;
	information	= Info_Mod_Fernando_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Fernando_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fernando_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
