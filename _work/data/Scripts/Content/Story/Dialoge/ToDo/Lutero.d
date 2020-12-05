INSTANCE Info_Mod_Lutero_Hi (C_INFO)
{
	npc		= Mod_594_NONE_Lutero_NW;
	nr		= 1;
	condition	= Info_Mod_Lutero_Hi_Condition;
	information	= Info_Mod_Lutero_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lutero_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Lutero_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Lutero_Hi_13_00"); //Hej, czy szukasz czegos wyjatkowego? Dostalem tu kilka rzadkich rzeczy.
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Lutero sprzedaje rzadkie rzeczy.");
};

INSTANCE Info_Mod_Lutero_Lutero (C_INFO)
{
	npc		= Mod_594_NONE_Lutero_NW;
	nr		= 1;
	condition	= Info_Mod_Lutero_Lutero_Condition;
	information	= Info_Mod_Lutero_Lutero_Info;
	permanent	= 0;
	important	= 0;
	description	= "Witaj.";
};

FUNC INT Info_Mod_Lutero_Lutero_Condition()
{
	if (Mod_MitLawrenceGesprochen == 7)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lutero_Lutero_Info()
{
	AI_Output(hero, self, "Info_Mod_Lutero_Lutero_15_00"); //Witaj.
	AI_Output(self, hero, "Info_Mod_Lutero_Lutero_13_01"); //Co.....? Jestes milicja? Co moge dla Ciebie zrobic?
	AI_Output(hero, self, "Info_Mod_Lutero_Lutero_15_02"); //Szukam Lutero.
	AI_Output(self, hero, "Info_Mod_Lutero_Lutero_13_03"); //Och.... uh, on juz nie ma. Ja jestem Junur, jego brat.
	AI_Output(hero, self, "Info_Mod_Lutero_Lutero_15_04"); //Gdzie pojechal Lutero?
	AI_Output(self, hero, "Info_Mod_Lutero_Lutero_13_05"); //Kim? Um.... Nie wiem. Moze Minentalowi. Wlasnie przybylem dzis i znalazlem jego dom pusty.
	AI_Output(hero, self, "Info_Mod_Lutero_Lutero_15_06"); //Okay. Chcialem z nim porozmawiac o czyms waznym.
	AI_Output(self, hero, "Info_Mod_Lutero_Lutero_13_07"); //Cos waznego?
	AI_Output(hero, self, "Info_Mod_Lutero_Lutero_15_08"); //Tak, chodzi o wynalazce.
	AI_Output(self, hero, "Info_Mod_Lutero_Lutero_13_09"); //U-u-u-u - o wynalazcy? O co dokladnie chodzi? Czy dowiedziales sie czegos o jego zniknieciu?
	AI_Output(hero, self, "Info_Mod_Lutero_Lutero_15_10"); //Skad wiesz o zniknieciu wynalazcy? Przyjechales tu dzis, czyz nie?
	AI_Output(self, hero, "Info_Mod_Lutero_Lutero_13_11"); //Jestem, uh, um, um, gówno!

	B_LogEntry	(TOPIC_MOD_MILIZ_WISSENSCHAFTLER, "Lutero uciekl, jak sie wydaje, zauwazyl, ze widzialem przez jego gre. Moze powinienem rozejrzec sie dookola, moze zostawil troche uwagi lub cos tutaj.");

	AI_StopProcessInfos	(self);
	
	B_StartOtherRoutine	(self, "FLUCHT");

	Mod_MitLawrenceGesprochen = 8;

	AI_SetWalkmode 		(self, NPC_RUN);
	Mdl_ApplyOverlayMds	(self, "HUMANS_FLEE.MDS");
};

INSTANCE Info_Mod_Lutero_SonjaFreier (C_INFO)
{
	npc		= Mod_594_NONE_Lutero_NW;
	nr		= 1;
	condition	= Info_Mod_Lutero_SonjaFreier_Condition;
	information	= Info_Mod_Lutero_SonjaFreier_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy regularnie odwiedzales Sonje?";
};

FUNC INT Info_Mod_Lutero_SonjaFreier_Condition()
{
	if (Mod_Sonja_Freier == 1)
	&& (Npc_HasItems(hero, Info_Mod_Lutero_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lutero_SonjaFreier_Info()
{
	AI_Output(hero, self, "Info_Mod_Lutero_SonjaFreier_15_00"); //Czy regularnie odwiedzales Sonje?
	AI_Output(self, hero, "Info_Mod_Lutero_SonjaFreier_13_01"); //Moze raz lub dwa razy. Ale Nadja zawsze mi sie jednak lepiej podobalo.
	AI_Output(self, hero, "Info_Mod_Lutero_SonjaFreier_13_02"); //Obiecalem ja nawet kiedys poslubic. Mam nadzieje, ze zapomniala.
	AI_Output(hero, self, "Info_Mod_Lutero_SonjaFreier_15_03"); //Wtedy nie jestes tym, kogo szukam.
};

INSTANCE Info_Mod_Lutero_Blutkelch (C_INFO)
{
	npc		= Mod_594_NONE_Lutero_NW;
	nr		= 1;
	condition	= Info_Mod_Lutero_Blutkelch_Condition;
	information	= Info_Mod_Lutero_Blutkelch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Jestes dealerem rzadkosci, czy nie?";
};

FUNC INT Info_Mod_Lutero_Blutkelch_Condition()
{
	if (Npc_HasItems(hero, Info_Mod_Lutero_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Baltram_Blutkelch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lutero_Blutkelch_Info()
{
	AI_Output(hero, self, "Info_Mod_Lutero_Blutkelch_15_00"); //Jestes dealerem rzadkosci, czy nie?
	AI_Output(self, hero, "Info_Mod_Lutero_Blutkelch_13_01"); //Bylo dobrze. Niestety, mozna powiedziec.
	AI_Output(hero, self, "Info_Mod_Lutero_Blutkelch_15_02"); //Dlaczego niestety?
	AI_Output(self, hero, "Info_Mod_Lutero_Blutkelch_13_03"); //Mieszkancy miasta nie sa zainteresowani rzadkoscia.
	AI_Output(self, hero, "Info_Mod_Lutero_Blutkelch_13_04"); //Nie moge nawet pozbyc sie jedwabiu. Wyroby finalne z ladu stalego....
	AI_Output(hero, self, "Info_Mod_Lutero_Blutkelch_15_05"); //Nastepnie nalezy udac sie do Relendel. W Khoracie jest sprzedawca rarytasów, ludzie wyrywaja towar z rak.
	AI_Output(self, hero, "Info_Mod_Lutero_Blutkelch_13_06"); //To nieprawda! Powiedziales, ze powinienes sie przylaczyc? To ma byc dosc daleko. Hmm..... Moze powinienem.....
	AI_Output(hero, self, "Info_Mod_Lutero_Blutkelch_15_07"); //Moze uda nam sie zawrzec porozumienie. Szukam filizanki. Filizanka krwi.
	AI_Output(self, hero, "Info_Mod_Lutero_Blutkelch_13_08"); //Nigdy o tym nie slyszalem. Poza tym nie zajmuje sie na statkach do picia.
};

INSTANCE Info_Mod_Lutero_Anschlagtafel (C_INFO)
{
	npc		= Mod_594_NONE_Lutero_NW;
	nr		= 1;
	condition	= Info_Mod_Lutero_Anschlagtafel_Condition;
	information	= Info_Mod_Lutero_Anschlagtafel_Info;
	permanent	= 1;
	important	= 0;
	description	= "Widzialem twój plakat na billboardzie....";
};

FUNC INT Info_Mod_Lutero_Anschlagtafel_Condition()
{
	if (Mod_Anschlagtafel_Khorinis_Lutero == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lutero_Anschlagtafel_Info()
{
	B_Say	(hero, self, "$ANSCHLAGTAFEL01");

	if (Npc_HasItems(hero, ItMi_SilverCup) >= Mod_Anschlagtafel_Khorinis_Lutero_Silberkelch)
	&& (Npc_HasItems(hero, ItMi_SilverPlate) >= Mod_Anschlagtafel_Khorinis_Lutero_Silberteller)
	&& (Npc_HasItems(hero, ItMi_SilverCandleholder) >= Mod_Anschlagtafel_Khorinis_Lutero_SilbernerKerzenstaender)
	&& (Npc_HasItems(hero, ItMi_GoldCup) >= Mod_Anschlagtafel_Khorinis_Lutero_Goldkelch)
	&& (Npc_HasItems(hero, ItAt_TrollTooth) >= Mod_Anschlagtafel_Khorinis_Lutero_Trollhauer)
	&& (Npc_HasItems(hero, ItAt_DrgSnapperHorn) >= Mod_Anschlagtafel_Khorinis_Lutero_Drachensnapperhorn)
	&& (Npc_HasItems(hero, ItAt_SharkTeeth) >= Mod_Anschlagtafel_Khorinis_Lutero_Sumpfhaizahn)
	&& (Npc_HasItems(hero, ItAt_SharkSkin) >= Mod_Anschlagtafel_Khorinis_Lutero_Sumpfhaihaut)
	&& (Npc_HasItems(hero, ItAm_Prot_Fire_01) >= Mod_Anschlagtafel_Khorinis_Lutero_FlammenAmulett)
	&& (Npc_HasItems(hero, ItMi_Runeblank) >= Mod_Anschlagtafel_Khorinis_Lutero_Runenstein)
	&& (Npc_HasItems(hero, ItAt_StoneGolemHeart) >= Mod_Anschlagtafel_Khorinis_Lutero_Steingolemherz)
	&& (Npc_HasItems(hero, ItAt_DemonHeart) >= Mod_Anschlagtafel_Khorinis_Lutero_Daemonenherz)
	&& (Npc_HasItems(hero, ItMi_GoldRing) >= Mod_Anschlagtafel_Khorinis_Lutero_Goldring)
	{
		Npc_RemoveInvItems	(hero, ItMi_SilverCup, Mod_Anschlagtafel_Khorinis_Lutero_Silberkelch);
		Npc_RemoveInvItems	(hero, ItMi_SilverPlate, Mod_Anschlagtafel_Khorinis_Lutero_Silberteller);
		Npc_RemoveInvItems	(hero, ItMi_SilverCandleholder, Mod_Anschlagtafel_Khorinis_Lutero_SilbernerKerzenstaender);
		Npc_RemoveInvItems	(hero, ItMi_GoldCup, Mod_Anschlagtafel_Khorinis_Lutero_Goldkelch);
		Npc_RemoveInvItems	(hero, ItAt_TrollTooth, Mod_Anschlagtafel_Khorinis_Lutero_Trollhauer);
		Npc_RemoveInvItems	(hero, ItAt_DrgSnapperHorn, Mod_Anschlagtafel_Khorinis_Lutero_Drachensnapperhorn);
		Npc_RemoveInvItems	(hero, ItAt_SharkTeeth, Mod_Anschlagtafel_Khorinis_Lutero_Sumpfhaizahn);
		Npc_RemoveInvItems	(hero, ItAt_SharkSkin, Mod_Anschlagtafel_Khorinis_Lutero_Sumpfhaihaut);
		Npc_RemoveInvItems	(hero, ItAm_Prot_Fire_01, Mod_Anschlagtafel_Khorinis_Lutero_FlammenAmulett);
		Npc_RemoveInvItems	(hero, ItMi_Runeblank, Mod_Anschlagtafel_Khorinis_Lutero_Runenstein);
		Npc_RemoveInvItems	(hero, ItAt_StoneGolemHeart, Mod_Anschlagtafel_Khorinis_Lutero_Steingolemherz);
		Npc_RemoveInvItems	(hero, ItAt_DemonHeart, Mod_Anschlagtafel_Khorinis_Lutero_Daemonenherz);
		Npc_RemoveInvItems	(hero, ItMi_GoldRing, Mod_Anschlagtafel_Khorinis_Lutero_Goldring);

		AI_Output(self, hero, "Info_Mod_Lutero_Anschlagtafel_13_00"); //Co? Pokaz mi.... W rzeczywistosci to wszystko. Bardzo dobrze wykonane.
		AI_Output(self, hero, "Info_Mod_Lutero_Anschlagtafel_13_01"); //Oto Twoja nagroda.

		B_GiveInvItems	(self, hero, ItMi_Gold, Mod_Anschlagtafel_Khorinis_Lutero_Gold);

		AI_Output(self, hero, "Info_Mod_Lutero_Anschlagtafel_13_02"); //Mile robienie interesów z Toba.

		if (Mod_Anschlagtafel_Khorinis_Lutero_Gold < 200)
		{
			B_GivePlayerXP	(300);
		}
		else if (Mod_Anschlagtafel_Khorinis_Lutero_Gold < 400)
		{
			B_GivePlayerXP	(400);
		}
		else if (Mod_Anschlagtafel_Khorinis_Lutero_Gold < 600)
		{
			B_GivePlayerXP	(500);
		}
		else
		{
			B_GivePlayerXP	(600);
		};

		Mod_Anschlagtafel_Khorinis_Lutero = 0;
		Mod_Anschlagtafel_Khorinis_Lutero_Cooldown = 3600;

		Npc_RemoveInvItems	(hero, ItWr_Anschlagtafel_Lutero, 1);
	}
	else
	{
		B_Say	(hero, self, "$ANSCHLAGTAFEL02");
	};
};

INSTANCE Info_Mod_Lutero_Trade (C_INFO)
{
	npc		= Mod_594_NONE_Lutero_NW;
	nr		= 1;
	condition	= Info_Mod_Lutero_Trade_Condition;
	information	= Info_Mod_Lutero_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Lutero_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lutero_Hi))
	&& (Mod_MitLawrenceGesprochen < 7)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lutero_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Lutero_Pickpocket (C_INFO)
{
	npc		= Mod_594_NONE_Lutero_NW;
	nr		= 1;
	condition	= Info_Mod_Lutero_Pickpocket_Condition;
	information	= Info_Mod_Lutero_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Lutero_Pickpocket_Condition()
{
	C_Beklauen	(118, ItAt_DemonHeart, 1);
};

FUNC VOID Info_Mod_Lutero_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Lutero_Pickpocket);

	Info_AddChoice	(Info_Mod_Lutero_Pickpocket, DIALOG_BACK, Info_Mod_Lutero_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Lutero_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Lutero_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Lutero_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Lutero_Pickpocket);
};

FUNC VOID Info_Mod_Lutero_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Lutero_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Lutero_Pickpocket);

		Info_AddChoice	(Info_Mod_Lutero_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Lutero_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Lutero_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Lutero_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Lutero_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Lutero_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Lutero_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Lutero_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Lutero_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Lutero_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Lutero_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Lutero_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Lutero_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Lutero_EXIT (C_INFO)
{
	npc		= Mod_594_NONE_Lutero_NW;
	nr		= 1;
	condition	= Info_Mod_Lutero_EXIT_Condition;
	information	= Info_Mod_Lutero_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Lutero_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Lutero_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
