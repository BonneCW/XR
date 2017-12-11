INSTANCE Info_Mod_Hubert_Hi (C_INFO)
{
	npc		= Mod_7380_OUT_Hubert_REL;
	nr		= 1;
	condition	= Info_Mod_Hubert_Hi_Condition;
	information	= Info_Mod_Hubert_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Hubert_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hubert_Hi_Info()
{
	B_Say	(hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Hubert_Hi_28_01"); //H - (Schluckauf) hä?
};

INSTANCE Info_Mod_Hubert_Landvermessung (C_INFO)
{
	npc		= Mod_7380_OUT_Hubert_REL;
	nr		= 1;
	condition	= Info_Mod_Hubert_Landvermessung_Condition;
	information	= Info_Mod_Hubert_Landvermessung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich brauche deine Hilfe.";
};

FUNC INT Info_Mod_Hubert_Landvermessung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hubert_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Anselm_LandvermessungVincent))
	&& (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hubert_Landvermessung_Info()
{
	AI_Output(hero, self, "Info_Mod_Hubert_Landvermessung_15_00"); //Ich brauche deine Hilfe.
	AI_Output(hero, self, "Info_Mod_Hubert_Landvermessung_15_01"); //Wie groß ist Khorata?
	AI_Output(self, hero, "Info_Mod_Hubert_Landvermessung_28_02"); //H ... hm. Bring mir ersma n büschn neues Zeuchz. In meim nüchtern Zustand kannich ja noch kein klarn Gedankn nich fassn.
	AI_Output(hero, self, "Info_Mod_Hubert_Landvermessung_15_03"); //Woher bekomme ich das "Zeuchz"?
	AI_Output(self, hero, "Info_Mod_Hubert_Landvermessung_28_04"); //Immer gradeaus un dann rechts. Ah nee, geh ma besser zu die Tussi, wo Fusl ver, äh, veräußert. Müsste am Marktplatz rumstehn. (grunzt)

	B_LogEntry	(TOPIC_MOD_KHORATA_LANDVERMESSUNG, "Ich soll der Saufbirne Hubert seinen Alkohol von einer Händlerin am Marktplatz kaufen. Ob das moralisch noch zu rechtfertigen ist ...?");
};

INSTANCE Info_Mod_Hubert_LandvermessungAlk (C_INFO)
{
	npc		= Mod_7380_OUT_Hubert_REL;
	nr		= 1;
	condition	= Info_Mod_Hubert_LandvermessungAlk_Condition;
	information	= Info_Mod_Hubert_LandvermessungAlk_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe deinen Spezialtrunk.";
};

FUNC INT Info_Mod_Hubert_LandvermessungAlk_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hubert_Landvermessung))
	&& (Npc_HasItems(hero, ItFo_HubertBooze) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hubert_LandvermessungAlk_Info()
{
	AI_Output(hero, self, "Info_Mod_Hubert_LandvermessungAlk_15_00"); //Ich habe deinen Spezialtrunk.

	B_GiveInvItems	(hero, self, ItFo_HubertBooze, 1);
	Npc_RemoveInvItems	(self, ItFo_HubertBooze, 1);

	AI_Output(self, hero, "Info_Mod_Hubert_LandvermessungAlk_28_01"); //Oh, gut!

	CreateInvItems	(self, ItFo_Booze, 1);

	B_UseItem	(self, ItFo_Booze);

	AI_Output(self, hero, "Info_Mod_Hubert_LandvermessungAlk_28_02"); //Jetz gehts wieder besser. Mannomann! Ich hab inner Zwitschen ... Zwichen ..., äh, Zeit über deine Frage nachgedacht.
	AI_Output(hero, self, "Info_Mod_Hubert_LandvermessungAlk_15_03"); //Ja?
	AI_Output(self, hero, "Info_Mod_Hubert_LandvermessungAlk_28_04"); //Jo!
	AI_Output(hero, self, "Info_Mod_Hubert_LandvermessungAlk_15_05"); //Und? Zu welchem Ergebnis bist du gekommen?
	AI_Output(self, hero, "Info_Mod_Hubert_LandvermessungAlk_28_06"); //Siebn Stobbelfelder! Kho-ra-ra-ra-ta is so groß wie siebn Stobbelfelder nebneinander.
	AI_Output(hero, self, "Info_Mod_Hubert_LandvermessungAlk_15_07"); //Umwerfend ...
	AI_Output(self, hero, "Info_Mod_Hubert_LandvermessungAlk_28_08"); //Nich wahr?

	B_GivePlayerXP	(50);

	B_LogEntry	(TOPIC_MOD_KHORATA_LANDVERMESSUNG, "Khorata ist also so groß wie sieben Stoppelfelder ... Sehr gut zu wissen!");
};

INSTANCE Info_Mod_Hubert_CityGuide01 (C_INFO)
{
	npc		= Mod_7380_OUT_Hubert_REL;
	nr		= 1;
	condition	= Info_Mod_Hubert_CityGuide01_Condition;
	information	= Info_Mod_Hubert_CityGuide01_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir die Stadt zeigen?";
};

FUNC INT Info_Mod_Hubert_CityGuide01_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hubert_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hubert_CityGuide01_Info()
{
	AI_Output(hero, self, "Info_Mod_Hubert_CityGuide01_15_00"); //Kannst du mir die Stadt zeigen?
	AI_Output(self, hero, "Info_Mod_Hubert_CityGuide01_28_01"); //(betrunken) Hu? Bis wohl neu hier?
	AI_Output(hero, self, "Info_Mod_Hubert_CityGuide01_15_02"); //Du hast es erraten.
	AI_Output(self, hero, "Info_Mod_Hubert_CityGuide01_28_03"); //Also, das kannich schon machn ... wart mal, muss ebn meine Beine sortiern. (ächzt)
	AI_Output(self, hero, "Info_Mod_Hubert_CityGuide01_28_04"); //Immer schön hübsch freundlischein su den Fremden, ne?
	AI_Output(self, hero, "Info_Mod_Hubert_CityGuide01_28_05"); //Lauf mir einfach hinterher und sag, wenn ich su schnell bin.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "RATHAUS");
};

INSTANCE Info_Mod_Hubert_CityGuide02 (C_INFO)
{
	npc		= Mod_7380_OUT_Hubert_REL;
	nr		= 1;
	condition	= Info_Mod_Hubert_CityGuide02_Condition;
	information	= Info_Mod_Hubert_CityGuide02_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hubert_CityGuide02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hubert_CityGuide01))
	&& (Npc_GetDistToWP(hero, "RATHAUS_01") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hubert_CityGuide02_Info()
{
	AI_Output(self, hero, "Info_Mod_Hubert_CityGuide02_28_00"); //Das is unser Rathaus. Da haust unser Oberfurzi drin. Kannst ja mal hallo sagn.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "MARKT");
};

INSTANCE Info_Mod_Hubert_CityGuide03 (C_INFO)
{
	npc		= Mod_7380_OUT_Hubert_REL;
	nr		= 1;
	condition	= Info_Mod_Hubert_CityGuide03_Condition;
	information	= Info_Mod_Hubert_CityGuide03_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hubert_CityGuide03_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hubert_CityGuide02))
	&& (Npc_GetDistToWP(hero, "REL_CITY_089") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hubert_CityGuide03_Info()
{
	AI_Output(self, hero, "Info_Mod_Hubert_CityGuide03_28_00"); //Hier kriegste alles zu trinken. Und wennde dich kloppen willst, kannste mal den Hans kenn ... n ... n lernen.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "NORDOST");
};

INSTANCE Info_Mod_Hubert_CityGuide04 (C_INFO)
{
	npc		= Mod_7380_OUT_Hubert_REL;
	nr		= 1;
	condition	= Info_Mod_Hubert_CityGuide04_Condition;
	information	= Info_Mod_Hubert_CityGuide04_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hubert_CityGuide04_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hubert_CityGuide03))
	&& (Npc_GetDistToWP(hero, "REL_CITY_095") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hubert_CityGuide04_Info()
{
	AI_Output(self, hero, "Info_Mod_Hubert_CityGuide04_28_00"); //In der Straße gehn sie alle penn ... n. Nix, wo du hinmusst.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "MAGIER");
};

INSTANCE Info_Mod_Hubert_CityGuide05 (C_INFO)
{
	npc		= Mod_7380_OUT_Hubert_REL;
	nr		= 1;
	condition	= Info_Mod_Hubert_CityGuide05_Condition;
	information	= Info_Mod_Hubert_CityGuide05_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hubert_CityGuide05_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hubert_CityGuide04))
	&& (Npc_GetDistToWP(hero, "REL_CITY_260") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hubert_CityGuide05_Info()
{
	AI_Output(self, hero, "Info_Mod_Hubert_CityGuide05_28_00"); //Da drin sind die Robenfurzis, wie ich sie nenn.
	AI_Output(self, hero, "Info_Mod_Hubert_CityGuide05_28_01"); //(lacht übertrieben) Die ham den einzign richtign Pott inner Stadt.
	AI_Output(self, hero, "Info_Mod_Hubert_CityGuide05_28_02"); //Naja, feine Ärsche ham die halt.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "GERICHT");
};

INSTANCE Info_Mod_Hubert_CityGuide06 (C_INFO)
{
	npc		= Mod_7380_OUT_Hubert_REL;
	nr		= 1;
	condition	= Info_Mod_Hubert_CityGuide06_Condition;
	information	= Info_Mod_Hubert_CityGuide06_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hubert_CityGuide06_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hubert_CityGuide05))
	&& (Npc_GetDistToWP(hero, "REL_CITY_293") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hubert_CityGuide06_Info()
{
	AI_Output(self, hero, "Info_Mod_Hubert_CityGuide06_28_00"); //Da musste hoffentlich nie rein, da ist nämlich der Richter. Is mir unheimlich, der Kerl.
	AI_Output(self, hero, "Info_Mod_Hubert_CityGuide06_28_01"); //Damit is die Führung fertich. Ich geh jetzt noch ins Gasthaus, neues Zeuchz holen.
	AI_Output(self, hero, "Info_Mod_Hubert_CityGuide06_28_02"); //Kannst mich ja begleiten, wennde willst.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "GASTHAUS");

	B_GivePlayerXP	(100);
	
	Spine_UnlockAchievement(SPINE_ACHIEVEMENT_12);
};

INSTANCE Info_Mod_Hubert_Freudenspender (C_INFO)
{
	npc		= Mod_7380_OUT_Hubert_REL;
	nr		= 1;
	condition	= Info_Mod_Hubert_Freudenspender_Condition;
	information	= Info_Mod_Hubert_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Brauchst du Freudenspender?";
};                       

FUNC INT Info_Mod_Hubert_Freudenspender_Condition()
{
	if (Npc_HasItems(hero, ItMi_Freudenspender) >= 1)
	&& (Mod_Freudenspender < 5)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Hi))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Hubert_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Hubert_Freudenspender_15_00"); //Brauchst du Freudenspender?
	AI_Output(self, hero, "Info_Mod_Hubert_Freudenspender_28_01"); //Nee, nee, mein Zeuchz reicht mir ...
};

INSTANCE Info_Mod_Hubert_Pickpocket (C_INFO)
{
	npc		= Mod_7380_OUT_Hubert_REL;
	nr		= 1;
	condition	= Info_Mod_Hubert_Pickpocket_Condition;
	information	= Info_Mod_Hubert_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_30;
};

FUNC INT Info_Mod_Hubert_Pickpocket_Condition()
{
	C_Beklauen	(14, ItFo_Booze, 3);
};

FUNC VOID Info_Mod_Hubert_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Hubert_Pickpocket);

	Info_AddChoice	(Info_Mod_Hubert_Pickpocket, DIALOG_BACK, Info_Mod_Hubert_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Hubert_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Hubert_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Hubert_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Hubert_Pickpocket);
};

FUNC VOID Info_Mod_Hubert_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Hubert_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Hubert_Pickpocket);

		Info_AddChoice	(Info_Mod_Hubert_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Hubert_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Hubert_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Hubert_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Hubert_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Hubert_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Hubert_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Hubert_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Hubert_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Hubert_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Hubert_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Hubert_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Hubert_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Hubert_EXIT (C_INFO)
{
	npc		= Mod_7380_OUT_Hubert_REL;
	nr		= 1;
	condition	= Info_Mod_Hubert_EXIT_Condition;
	information	= Info_Mod_Hubert_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Hubert_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hubert_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};