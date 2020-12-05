INSTANCE Info_Mod_Gorax_Hi (C_INFO)
{
	npc		= Mod_917_KDF_Gorax_NW;
	nr		= 1;
	condition	= Info_Mod_Gorax_Hi_Condition;
	information	= Info_Mod_Gorax_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kim jestes?";
};

FUNC INT Info_Mod_Gorax_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gorax_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Gorax_Hi_14_01"); //Jestem Goraxem i zajmuje sie zaopatrzeniem w zywnosc tutaj, w klasztorze.
	AI_Output(self, hero, "Info_Mod_Gorax_Hi_14_02"); //Sprzedaje równiez inne rzeczy.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_KLOSTER, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_KLOSTER, "Gorax moze sprzedac mi kilka rzeczy.");
};

INSTANCE Info_Mod_Gorax_Andokai (C_INFO)
{
	npc		= Mod_917_KDF_Gorax_NW;
	nr		= 1;
	condition	= Info_Mod_Gorax_Andokai_Condition;
	information	= Info_Mod_Gorax_Andokai_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gorax_Andokai_Condition()
{
	var C_Item RobeVonAndokai;
	RobeVonAndokai = Npc_GetEquippedArmor(hero);

	if (Npc_KnowsInfo(hero, Info_Mod_Andokai_Hi))
	&& (Hlp_IsItem(RobeVonAndokai, ITAR_FAKE_NOV_L) == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorax_Andokai_Info()
{
	AI_Output(self, hero, "Info_Mod_Gorax_Andokai_14_00"); //Oops! Skad pochodziles?
	AI_Output(hero, self, "Info_Mod_Gorax_Andokai_15_01"); //Jestem tu nowoscia. Masz dla mnie zadanie, Panie?
	AI_Output(self, hero, "Info_Mod_Gorax_Andokai_14_02"); //Jestes wciaz zmotywowany, czyz nie jestes? Nie martw sie, to sie ustapi w czasie.
	AI_Output(self, hero, "Info_Mod_Gorax_Andokai_14_03"); //Na poczatku jestes przepelniony energia, ale kiedy juz ja przywiezliscie magikowi, mówicie o winie i piwie - popatrzcie na mnie!
	AI_Output(self, hero, "Info_Mod_Gorax_Andokai_14_04"); //W pewnym momencie, trudno bedzie Ci dostac brzucha nad lózkiem.
	AI_Output(self, hero, "Info_Mod_Gorax_Andokai_14_05"); //Oh, tak, ale byles tutaj na to zadanie. Musze wziac pod uwage, ze jestes niedoswiadczony.
	AI_Output(self, hero, "Info_Mod_Gorax_Andokai_14_06"); //Jest jedna rzecz, która moge sobie wyobrazic.
	AI_Output(self, hero, "Info_Mod_Gorax_Andokai_14_07"); //Mam tu znakomita wysylke wina do Orlanu. Wiesz, gosc, który jest wlascicielem tawerny. Daje mi 250 zlotych monet.
	AI_Output(self, hero, "Info_Mod_Gorax_Andokai_14_08"); //Czy pamietasz to? Wino, Orlan, 250 zlota?

	B_GiveInvItems	(self, hero, ItFo_KWine, 10);

	Mod_GoraxWeinGeklaut = Wld_GetDay();

	Info_ClearChoices	(Info_Mod_Gorax_Andokai);

	Info_AddChoice	(Info_Mod_Gorax_Andokai, "Czy nie mozesz to zapisac?", Info_Mod_Gorax_Andokai_B);
	Info_AddChoice	(Info_Mod_Gorax_Andokai, "Bez problemu.", Info_Mod_Gorax_Andokai_A);
};

FUNC VOID Info_Mod_Gorax_Andokai_B()
{
	AI_Output(hero, self, "Info_Mod_Gorax_Andokai_B_15_00"); //Czy nie mozesz to zapisac?
	AI_Output(self, hero, "Info_Mod_Gorax_Andokai_B_14_01"); //Och, na pewno to zrobisz. Gdzie umiescilem pióro?
	AI_Output(hero, self, "Info_Mod_Gorax_Andokai_B_15_02"); //Za uchem.
	AI_Output(self, hero, "Info_Mod_Gorax_Andokai_B_14_03"); //Co nie mówisz, naprawde! Widzisz, jestes juz pomocnikiem!
	AI_Output(self, hero, "Info_Mod_Gorax_Andokai_B_14_04"); //Oto wiec ta uwaga. Powinienes to zapamietac.

	B_GiveInvItems	(self, hero, ItWr_GoraxAndokai, 1);

	Info_ClearChoices	(Info_Mod_Gorax_Andokai);
};

FUNC VOID Info_Mod_Gorax_Andokai_A()
{
	AI_Output(hero, self, "Info_Mod_Gorax_Andokai_A_15_00"); //Bez problemu.
	AI_Output(self, hero, "Info_Mod_Gorax_Andokai_A_14_01"); //Zobacze cie wkrótce. Zabawa tutaj w klasztorze!

	Info_ClearChoices	(Info_Mod_Gorax_Andokai);
};

INSTANCE Info_Mod_Gorax_Weinverkauf (C_INFO)
{
	npc		= Mod_917_KDF_Gorax_NW;
	nr		= 1;
	condition	= Info_Mod_Gorax_Weinverkauf_Condition;
	information	= Info_Mod_Gorax_Weinverkauf_Info;
	permanent	= 0;
	important	= 0;
	description	= "Przynioslem wino Orlan.";
};

FUNC INT Info_Mod_Gorax_Weinverkauf_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orlan_Gorax))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 250)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Gorax_AndokaiBinBack))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorax_Weinverkauf_Info()
{
	AI_Output(hero, self, "Info_Mod_Gorax_Weinverkauf_15_00"); //Przynioslem wino Orlan.

	B_GiveInvItems	(hero, self, ItMi_Gold, 250);

	AI_Output(self, hero, "Info_Mod_Gorax_Weinverkauf_14_01"); //Dziekuje bardzo. Mozemy uzywac takiego poslanca jak ty. Moze wróce do ciebie.

	B_GivePlayerXP	(100);

	B_Göttergefallen(1, 1);
};

INSTANCE Info_Mod_Gorax_AndokaiBinBack (C_INFO)
{
	npc		= Mod_917_KDF_Gorax_NW;
	nr		= 1;
	condition	= Info_Mod_Gorax_AndokaiBinBack_Condition;
	information	= Info_Mod_Gorax_AndokaiBinBack_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gorax_AndokaiBinBack_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gorax_Andokai))
	&& (Mod_GoraxWeinGeklaut < Wld_GetDay())
	&& (Npc_HasItems(hero, ItMi_Gold) >= 250)
	&& (Npc_KnowsInfo(hero, Info_Mod_Gorax_Weinverkauf))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Gorax_Weinverkauf))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorax_AndokaiBinBack_Info()
{
	AI_Output(self, hero, "Info_Mod_Gorax_AndokaiBinBack_14_00"); //Hej! Przyniesliscie moje zloto?
	AI_Output(hero, self, "Info_Mod_Gorax_AndokaiBinBack_15_01"); //Um....
	AI_Output(self, hero, "Info_Mod_Gorax_AndokaiBinBack_14_02"); //Ach, tam jest.

	B_GiveInvItems	(hero, self, ItMi_Gold, 250);

	B_GivePlayerXP	(50);
};

INSTANCE Info_Mod_Gorax_Aufgabe (C_INFO)
{
	npc		= Mod_917_KDF_Gorax_NW;
	nr		= 1;
	condition	= Info_Mod_Gorax_Aufgabe_Condition;
	information	= Info_Mod_Gorax_Aufgabe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Masz dla mnie cos do zrobienia?";
};

FUNC INT Info_Mod_Gorax_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Pyrokar_Mitglied))
	&& (Npc_KnowsInfo(hero, Info_Mod_Gorax_Hi))
	&& (Mod_Gilde == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorax_Aufgabe_Info()
{
	AI_Output(hero, self, "Info_Mod_Gorax_Aufgabe_15_00"); //Masz dla mnie cos do zrobienia?
	AI_Output(self, hero, "Info_Mod_Gorax_Aufgabe_14_01"); //Dla mnie mozna bylo pojechac do miasta i kupic od Salandryla cztery butelki alkoholu.

	Log_CreateTopic	(TOPIC_MOD_GORAX_ALKOHOL, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_GORAX_ALKOHOL, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_GORAX_ALKOHOL, "Mam otrzymac cztery butelki alkoholu dla Goraxa z Salandrilu.");

	Info_ClearChoices	(Info_Mod_Gorax_Aufgabe);

	Info_AddChoice	(Info_Mod_Gorax_Aufgabe, "Wtedy bede mial racje po drodze.", Info_Mod_Gorax_Aufgabe_Los);
	Info_AddChoice	(Info_Mod_Gorax_Aufgabe, "Gdzie moge znalezc Salandril?", Info_Mod_Gorax_Aufgabe_Salandril);
	Info_AddChoice	(Info_Mod_Gorax_Aufgabe, "Dlaczego potrzebujesz gorzalki?", Info_Mod_Gorax_Aufgabe_Alkohol);
};

FUNC VOID Info_Mod_Gorax_Aufgabe_Los()
{
	AI_Output(hero, self, "Info_Mod_Gorax_Aufgabe_Los_15_00"); //Wtedy bede mial racje po drodze.
	AI_Output(self, hero, "Info_Mod_Gorax_Aufgabe_Los_14_01"); //Oto 100 zlotych monet.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	Info_ClearChoices	(Info_Mod_Gorax_Aufgabe);
};

FUNC VOID Info_Mod_Gorax_Aufgabe_Salandril()
{
	AI_Output(hero, self, "Info_Mod_Gorax_Aufgabe_Salandril_15_00"); //Gdzie moge znalezc Salandril?
	AI_Output(self, hero, "Info_Mod_Gorax_Aufgabe_Salandril_14_01"); //Prowadzi dzialalnosc gospodarcza w górnym kwartale.

	Mod_DialogGoraxAufgabe2 = TRUE;

	Info_ClearChoices	(Info_Mod_Gorax_Aufgabe);

	Info_AddChoice	(Info_Mod_Gorax_Aufgabe, "Wtedy bede mial racje po drodze.", Info_Mod_Gorax_Aufgabe_Los);

	if (Mod_DialogGoraxAufgabe1 == FALSE)
	{
		Info_AddChoice	(Info_Mod_Gorax_Aufgabe, "Dlaczego potrzebujesz gorzalki?", Info_Mod_Gorax_Aufgabe_Alkohol);
	};
};

FUNC VOID Info_Mod_Gorax_Aufgabe_Alkohol()
{
	AI_Output(hero, self, "Info_Mod_Gorax_Aufgabe_Alkohol_15_00"); //Dlaczego potrzebujesz gorzalki?
	AI_Output(self, hero, "Info_Mod_Gorax_Aufgabe_Alkohol_14_01"); //My magicy tolerujemy duzo alkoholu, a w naszym winie nie ma zbyt wiele, wiec napelniamy go czystym alkoholem.

	Mod_DialogGoraxAufgabe1 = TRUE;
	
	Info_ClearChoices	(Info_Mod_Gorax_Aufgabe);

	Info_AddChoice	(Info_Mod_Gorax_Aufgabe, "Wtedy bede mial racje po drodze.", Info_Mod_Gorax_Aufgabe_Los);

	if (Mod_DialogGoraxAufgabe2 == FALSE)
	{
		Info_AddChoice	(Info_Mod_Gorax_Aufgabe, "Gdzie moge znalezc Salandril?", Info_Mod_Gorax_Aufgabe_Salandril);
	};
};

INSTANCE Info_Mod_Gorax_HabAlkohol (C_INFO)
{
	npc		= Mod_917_KDF_Gorax_NW;
	nr		= 1;
	condition	= Info_Mod_Gorax_HabAlkohol_Condition;
	information	= Info_Mod_Gorax_HabAlkohol_Info;
	permanent	= 0;
	important	= 0;
	description	= "Zaczalem gorzej.";
};

FUNC INT Info_Mod_Gorax_HabAlkohol_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gorax_Aufgabe))
	&& (Npc_KnowsInfo(hero, Info_Mod_Salandril_Alkohol))
	&& (Npc_HasItems(hero, ItMi_Alchemy_Alcohol_01)	== 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorax_HabAlkohol_Info()
{
	AI_Output(hero, self, "Info_Mod_Gorax_HabAlkohol_15_00"); //Zaczalem gorzej.

	B_GiveInvItems	(hero, self, ItMi_Alchemy_Alcohol_01, 4);

	AI_Output(self, hero, "Info_Mod_Gorax_HabAlkohol_14_01"); //Dzieki. Bardzo nam wszystkim pomogliscie.

	Npc_RemoveInvItems	(self, ItMi_Alchemy_Alcohol_01, 4);

	AI_Output(self, hero, "Info_Mod_Gorax_HabAlkohol_14_02"); //Wez to zloto jako nagrode.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	B_GivePlayerXP	(250);

	B_LogEntry_More	(TOPIC_MOD_FEUERMAGIER, TOPIC_MOD_GORAX_ALKOHOL, "Przynióslem Goraxowi gorzelnie.", "Przynióslem Goraxowi gorzelnie.");
	B_SetTopicStatus	(TOPIC_MOD_GORAX_ALKOHOL, LOG_SUCCESS);

	B_Göttergefallen(1, 1);
};

INSTANCE Info_Mod_Gorax_Unkraut (C_INFO)
{
	npc		= Mod_917_KDF_Gorax_NW;
	nr		= 1;
	condition	= Info_Mod_Gorax_Unkraut_Condition;
	information	= Info_Mod_Gorax_Unkraut_Info;
	permanent	= 0;
	important	= 0;
	description	= "Masz dla mnie cos do zrobienia.";
};

FUNC INT Info_Mod_Gorax_Unkraut_Condition()
{
	if (hero.guild == GIL_VLK)
	&& (Mod_Gilde == 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorax_Unkraut_Info()
{
	AI_Output(hero, self, "Info_Mod_Gorax_Unkraut_15_00"); //Masz dla mnie cos do zrobienia.
	AI_Output(self, hero, "Info_Mod_Gorax_Unkraut_14_01"); //Ahh, sumienny nowicjusz. Na korytkach nie ma w tej chwili zadnego miejsca, a reszta nowicjuszy tupia po calym miejscu.
	AI_Output(self, hero, "Info_Mod_Gorax_Unkraut_14_02"); //Ale zamiast tego, mozesz pomóc wyrwac wszystkie chwasty wokól naszych winorosli.
	AI_Output(self, hero, "Info_Mod_Gorax_Unkraut_14_03"); //Nie, ze paskudne male rosliny ukrasc skladniki odzywcze z naszych dobrych winorosli i wkrótce bedziemy siedziec na stole suszenia. (smiertelnicy)

	Log_CreateTopic	(TOPIC_MOD_GORAX_UNKRAUT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_GORAX_UNKRAUT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_GORAX_UNKRAUT, "Gorax powiedzial, ze moge wyrwac chwasty wokól winorosli.");

	Wld_InsertItem	(ItPl_Unkraut_Gorax, "FP_ITEM_GORAX_UNKRAUT_01");
	Wld_InsertItem	(ItPl_Unkraut_Gorax, "FP_ITEM_GORAX_UNKRAUT_02");
	Wld_InsertItem	(ItPl_Unkraut_Gorax, "FP_ITEM_GORAX_UNKRAUT_03");
	Wld_InsertItem	(ItPl_Unkraut_Gorax, "FP_ITEM_GORAX_UNKRAUT_04");
	Wld_InsertItem	(ItPl_Unkraut_Gorax, "FP_ITEM_GORAX_UNKRAUT_05");
	Wld_InsertItem	(ItPl_Unkraut_Gorax, "FP_ITEM_GORAX_UNKRAUT_06");
	Wld_InsertItem	(ItPl_Unkraut_Gorax, "FP_ITEM_GORAX_UNKRAUT_07");
	Wld_InsertItem	(ItPl_Unkraut_Gorax, "FP_ITEM_GORAX_UNKRAUT_08");
};

INSTANCE Info_Mod_Gorax_Unkraut2 (C_INFO)
{
	npc		= Mod_917_KDF_Gorax_NW;
	nr		= 1;
	condition	= Info_Mod_Gorax_Unkraut2_Condition;
	information	= Info_Mod_Gorax_Unkraut2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Zebralem wszystkie chwasty.";
};

FUNC INT Info_Mod_Gorax_Unkraut2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Opolos_Unkraut))
	|| (Npc_HasItems(hero, ItPl_Unkraut_Gorax) == 8)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorax_Unkraut2_Info()
{
	AI_Output(hero, self, "Info_Mod_Gorax_Unkraut2_15_00"); //Zebralem wszystkie chwasty.
	AI_Output(self, hero, "Info_Mod_Gorax_Unkraut2_14_01"); //Dobry nowicjusz. Tutaj konczymy swój dzien kilkoma dobrymi butelkami wina.

	B_GiveInvItems	(self, hero, ItFo_KWine, 3);

	B_GivePlayerXP	(100);

	B_SetTopicStatus	(TOPIC_MOD_GORAX_UNKRAUT, LOG_SUCCESS);
};

INSTANCE Info_Mod_Gorax_Comeback (C_INFO)
{
	npc		= Mod_917_KDF_Gorax_NW;
	nr		= 1;
	condition	= Info_Mod_Gorax_Comeback_Condition;
	information	= Info_Mod_Gorax_Comeback_Info;
	permanent	= 0;
	important	= 0;
	description	= "Innos, powitanie. Rada obiecala mi jedna ze starych misek ofiarniczych. Chce ja podniesc.";
};

FUNC INT Info_Mod_Gorax_Comeback_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Pyrokar_Comeback))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorax_Comeback_Info()
{
	AI_Output(hero, self, "Info_Mod_Gorax_Comeback_15_00"); //Innos, powitanie. Rada obiecala mi jedna ze starych misek ofiarniczych. Chce ja podniesc.
	AI_Output(self, hero, "Info_Mod_Gorax_Comeback_14_01"); //Mamy ich jeszcze kilka. Ale nie bedziesz mógl go nosic. Jest zbyt ciezki.
	AI_Output(hero, self, "Info_Mod_Gorax_Comeback_15_02"); //Byc moze jeden z nowicjuszy moze mi pomóc.....
	AI_Output(self, hero, "Info_Mod_Gorax_Comeback_14_03"); //Doloze wszelkich staran, abys to zrozumial. Gdzie ma pójsc?
	AI_Output(hero, self, "Info_Mod_Gorax_Comeback_15_04"); //To jeszcze nie jest pewne. Najlepiej umiescic je na prawo od wschodniej bramy na lace.
	AI_Output(self, hero, "Info_Mod_Gorax_Comeback_14_05"); //Zrobi to.

	B_LogEntry	(TOPIC_MOD_ASS_COMEBACK, "Gorax dostarczy muszle ofiarna do laki niedaleko obozu. Mozemy je tam odebrac. Powinienem teraz wrócic do Noreka.");
};

INSTANCE Info_Mod_Gorax_Trade (C_INFO)
{
	npc		= Mod_917_KDF_Gorax_NW;
	nr		= 1;
	condition	= Info_Mod_Gorax_Trade_Condition;
	information	= Info_Mod_Gorax_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Gorax_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gorax_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorax_Trade_Info()
{	
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Gorax_Pickpocket (C_INFO)
{
	npc		= Mod_917_KDF_Gorax_NW;
	nr		= 1;
	condition	= Info_Mod_Gorax_Pickpocket_Condition;
	information	= Info_Mod_Gorax_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Gorax_Pickpocket_Condition()
{
	C_Beklauen	(91, ItFo_KWine, 6);
};

FUNC VOID Info_Mod_Gorax_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Gorax_Pickpocket);

	Info_AddChoice	(Info_Mod_Gorax_Pickpocket, DIALOG_BACK, Info_Mod_Gorax_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Gorax_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Gorax_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Gorax_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Gorax_Pickpocket);
};

FUNC VOID Info_Mod_Gorax_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Gorax_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Gorax_Pickpocket);

		Info_AddChoice	(Info_Mod_Gorax_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Gorax_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Gorax_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Gorax_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Gorax_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Gorax_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Gorax_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Gorax_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Gorax_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Gorax_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Gorax_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Gorax_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Gorax_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Gorax_EXIT (C_INFO)
{
	npc		= Mod_917_KDF_Gorax_NW;
	nr		= 1;
	condition	= Info_Mod_Gorax_EXIT_Condition;
	information	= Info_Mod_Gorax_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Gorax_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gorax_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
