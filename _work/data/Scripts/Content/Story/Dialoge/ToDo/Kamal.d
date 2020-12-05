FUNC VOID B_Say_KamalGift()
{
	AI_Output(self, hero, "Info_Mod_Kamal_Gift_11_00"); //Und das wäre?
	AI_Output(hero, self, "Info_Mod_Kamal_Gift_15_01"); //Er kann etwas Gift gebrauchen ...
	AI_Output(self, hero, "Info_Mod_Kamal_Gift_11_02"); //Und welches darf's sein?
	AI_Output(hero, self, "Info_Mod_Kamal_Gift_15_03"); //Etwas tödliches wäre ihm recht. Pur, wenn es geht und dann noch was geschmackloses. Zum Mischen mit Wein oder so.
	AI_Output(self, hero, "Info_Mod_Kamal_Gift_11_04"); //Da kann er gleich meine neue Kreation testen. Ein guter Wein, versetzt mit etwas Erdbeeraroma und sehr wirksamen Gift. Tödlich innerhalb einer Minute. Garantiert.
	AI_Output(hero, self, "Info_Mod_Kamal_Gift_15_05"); //Genau was er braucht!
	AI_Output(self, hero, "Info_Mod_Kamal_Gift_11_06"); //Bitte. Dafür bezahlt er 900 Gold.
	AI_Output(hero, self, "Info_Mod_Kamal_Gift_15_07"); //Etwas viel, meinst du nicht?
	AI_Output(self, hero, "Info_Mod_Kamal_Gift_11_08"); //Ich sagte guter Wein und gutes Gift.
	AI_Output(hero, self, "Info_Mod_Kamal_Gift_15_09"); //Er sagt 600 Gold.
	AI_Output(self, hero, "Info_Mod_Kamal_Gift_11_10"); //Sind wir hier auf dem Basar? 750.

	B_ShowGivenThings	("750 darowane zloto i otrzymana trucizna");

	CreateInvItems	(hero, ItPo_KamalGift, 1);
	Npc_RemoveInvItems	(hero, ItMi_Gold, 750);

	B_LogEntry	(TOPIC_MOD_ASS_BLUTKELCH, "Dostalem trucizne. Idzmy teraz do sedziego.");
};

INSTANCE Info_Mod_Kamal_Hi (C_INFO)
{
	npc		= Mod_7163_ASS_Kamal_NW;
	nr		= 1;
	condition	= Info_Mod_Kamal_Hi_Condition;
	information	= Info_Mod_Kamal_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Jestes Kamal, alchemik?";
};

FUNC INT Info_Mod_Kamal_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Karim_Hi))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 750)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kamal_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Kamal_Hi_15_00"); //Jestes Kamal, alchemik?
	AI_Output(self, hero, "Info_Mod_Kamal_Hi_11_01"); //Mówi kto kogo?
	AI_Output(hero, self, "Info_Mod_Kamal_Hi_15_02"); //Osoba, która ma prosbe....

	B_Say_KamalGift();
};

INSTANCE Info_Mod_Kamal_Blutkelch (C_INFO)
{
	npc		= Mod_7163_ASS_Kamal_NW;
	nr		= 1;
	condition	= Info_Mod_Kamal_Blutkelch_Condition;
	information	= Info_Mod_Kamal_Blutkelch_Info;
	permanent	= 0;
	important	= 0;
	description	= "On znowu.";
};

FUNC INT Info_Mod_Kamal_Blutkelch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Aiman_Hi))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 750)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kamal_Blutkelch_Info()
{
	AI_Output(hero, self, "Info_Mod_Kamal_Blutkelch_15_00"); //On znowu.
	AI_Output(self, hero, "Info_Mod_Kamal_Blutkelch_11_01"); //Uh-huh. Ziolo mezczyzna. Masz jeszcze jakies?
	AI_Output(hero, self, "Info_Mod_Kamal_Blutkelch_15_02"); //Nie ten jeden. Ale ma jeden wniosek....

	B_Say_KamalGift();
};

INSTANCE Info_Mod_Kamal_Zutaten (C_INFO)
{
	npc		= Mod_7163_ASS_Kamal_NW;
	nr		= 1;
	condition	= Info_Mod_Kamal_Zutaten_Condition;
	information	= Info_Mod_Kamal_Zutaten_Info;
	permanent	= 0;
	important	= 0;
	description	= "Widze, ze jestes Kamal, alchemik?";
};

FUNC INT Info_Mod_Kamal_Zutaten_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Aadel_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kamal_Zutaten_Info()
{
	AI_Output(hero, self, "Info_Mod_Kamal_Zutaten_15_00"); //Widze, ze jestes Kamal, alchemik?
	AI_Output(self, hero, "Info_Mod_Kamal_Zutaten_11_01"); //Mówi kto kogo?
	AI_Output(hero, self, "Info_Mod_Kamal_Zutaten_15_02"); //Kto chce dac ci reke.....
	AI_Output(self, hero, "Info_Mod_Kamal_Zutaten_11_03"); //I dlaczego tego chce?
	AI_Output(hero, self, "Info_Mod_Kamal_Zutaten_15_04"); //Chce byc jak ty magikiem.
	AI_Output(self, hero, "Info_Mod_Kamal_Zutaten_11_05"); //A ja jestem bezrobotny?
	AI_Output(hero, self, "Info_Mod_Kamal_Zutaten_15_06"); //Nie, nie, nie, nie, nie. Wolal raczej uczyc sie swoich zaklec. W tym celu musi zebrac punkty z magami.
	AI_Output(self, hero, "Info_Mod_Kamal_Zutaten_11_07"); //To wystarczy. On moze mi zrobic laske.
	AI_Output(hero, self, "Info_Mod_Kamal_Zutaten_15_08"); //Co sie dzieje?
	AI_Output(self, hero, "Info_Mod_Kamal_Zutaten_11_09"); //Brakuje mi skladników.
	AI_Output(hero, self, "Info_Mod_Kamal_Zutaten_15_10"); //Co?
	AI_Output(self, hero, "Info_Mod_Kamal_Zutaten_11_11"); //Skladniki dla moich trucizn. Potrzebuje kolców muchówek, grzybów piekielnych i niektórych muchówek. Kazda z nich powinna wystarczyc po piec.
	AI_Output(hero, self, "Info_Mod_Kamal_Zutaten_15_12"); //Gdzie on to widzi?
	AI_Output(self, hero, "Info_Mod_Kamal_Zutaten_11_13"); //Skad powinienem wiedziec? Nie bylem na wyspie od dawna. Nie wiem kim jestem. Moze mysliwi cos wiedza. Teraz on idzie.

	Log_CreateTopic	(TOPIC_MOD_ASS_KAMAL, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_KAMAL, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ASS_KAMAL, "Chce byc nowicjuszem. Mam otrzymac dla Kamala kilka skladników. 5 szpików, muchówek i grzybów piekielnych. Hm.... z kim moge nauczyc sie ciagnac kolce? Grzyby znajduja sie w Minental.");
};

INSTANCE Info_Mod_Kamal_Zutaten2 (C_INFO)
{
	npc		= Mod_7163_ASS_Kamal_NW;
	nr		= 1;
	condition	= Info_Mod_Kamal_Zutaten2_Condition;
	information	= Info_Mod_Kamal_Zutaten2_Info;
	permanent	= 0;
	important	= 0;
	description	= "On jest z powrotem.";
};

FUNC INT Info_Mod_Kamal_Zutaten2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kamal_Zutaten))
	&& (Npc_HasItems(hero, ItAt_Sting) >= 5)
	&& (Npc_HasItems(hero, ItPl_Mushroom_03) >= 5)
	&& (Npc_HasItems(hero, ItFo_Plants_Mushroom_01) >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kamal_Zutaten2_Info()
{
	AI_Output(hero, self, "Info_Mod_Kamal_Zutaten2_15_00"); //On jest z powrotem.
	AI_Output(self, hero, "Info_Mod_Kamal_Zutaten2_11_01"); //Kto?
	AI_Output(hero, self, "Info_Mod_Kamal_Zutaten2_15_02"); //Ten z grzybami i wszystkimi.
	AI_Output(self, hero, "Info_Mod_Kamal_Zutaten2_11_03"); //Ach, ten jeden. Czy widze?
	AI_Output(hero, self, "Info_Mod_Kamal_Zutaten2_15_04"); //Tutaj piec zadlaczy i piec piekielnych grzybów. Istnieje piec muchówek. Bardzo rzadkie nahorynie.

	Npc_RemoveInvItems	(hero, ItAt_Sting, 5);
	Npc_RemoveInvItems	(hero, ItPl_Mushroom_03, 5);
	Npc_RemoveInvItems	(hero, ItFo_Plants_Mushroom_01, 5);

	B_ShowGivenThings	("5 grzbietów, 5 muchówek i 5 grzybów piekielnych.");

	AI_Output(self, hero, "Info_Mod_Kamal_Zutaten2_11_05"); //Mozna wprowadzic inne znalezione muchówki. To jest dobre zloto.
	AI_Output(hero, self, "Info_Mod_Kamal_Zutaten2_15_06"); //Do kogo?
	AI_Output(self, hero, "Info_Mod_Kamal_Zutaten2_11_07"); //Oczywiscie Finder.
	AI_Output(hero, self, "Info_Mod_Kamal_Zutaten2_15_08"); //Oczywiscie tak jest. Czy znasz kogokolwiek, komu moze pomóc?
	AI_Output(self, hero, "Info_Mod_Kamal_Zutaten2_11_09"); //Malek. Zawsze narzeka, ze nie ma wystarczajacej ilosci maniku.
	AI_Output(hero, self, "Info_Mod_Kamal_Zutaten2_15_10"); //Nie mozesz mu pomóc?
	AI_Output(self, hero, "Info_Mod_Kamal_Zutaten2_11_11"); //Nie. Rozumiem tylko trucizny.
	AI_Output(hero, self, "Info_Mod_Kamal_Zutaten2_15_12"); //Uh-huh. On jest gonna. I nie zapomnij mu dac swój glos.
	AI_Output(self, hero, "Info_Mod_Kamal_Zutaten2_11_13"); //Moze na tym liczyc.

	B_SetTopicStatus	(TOPIC_MOD_ASS_KAMAL, LOG_SUCCESS);
	
	B_LogEntry	(TOPIC_MOD_ASS_MAGIER, "");

	B_GivePlayerXP	(250);
};

INSTANCE Info_Mod_Kamal_Heimweh (C_INFO)
{
	npc		= Mod_7163_ASS_Kamal_NW;
	nr		= 1;
	condition	= Info_Mod_Kamal_Heimweh_Condition;
	information	= Info_Mod_Kamal_Heimweh_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Kamal_Heimweh_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Norek_Blutkelch2))
	&& (Npc_HasItems(hero, ItMi_GreenNugget) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kamal_Heimweh_Info()
{
	AI_Output(self, hero, "Info_Mod_Kamal_Heimweh_11_00"); //Ein neuer Kollege. Wie hast du das nur geschafft? Manche brauchen Jahre, um den Stand des Magiers zu erlangen.
	AI_Output(hero, self, "Info_Mod_Kamal_Heimweh_15_01"); //Fleiß, Mut, Ausdauer, Geschick, Ehrgeiz,Glück, List, Verstand ...
	AI_Output(self, hero, "Info_Mod_Kamal_Heimweh_11_02"); //Gut, gut. Kann ich dich trotzdem um was bitten?
	AI_Output(hero, self, "Info_Mod_Kamal_Heimweh_15_03"); //Freilich. Was brauchst du?
	AI_Output(self, hero, "Info_Mod_Kamal_Heimweh_11_04"); //Einige Zutaten, die ich hier im Tal nicht finden kann. Du kennst dich doch aus in der Gegend.
	AI_Output(hero, self, "Info_Mod_Kamal_Heimweh_15_05"); //Gewiss. Aber schau doch erst mal in meinen Beutel. Vielleicht hab ich dabei, was du brauchst.
	AI_Output(self, hero, "Info_Mod_Kamal_Heimweh_11_06"); //(brüllt) Bei Beliar! Grünes Erz! Assassinengold!
	AI_Output(self, hero, "Info_Mod_Kamal_Heimweh_11_07"); //Das ist selbst in der Heimat so selten wie ein Regenschauer. Wo hast du das her?
	AI_Output(hero, self, "Info_Mod_Kamal_Heimweh_15_08"); //In Jharkendar ist ein Canyon mit alten Erzminen drin. Da hab ich's rausgehackt. 
	AI_Output(self, hero, "Info_Mod_Kamal_Heimweh_11_09"); //Bei allen Geistern! Das musst du unbedingt dem Rat zeigen!
	AI_Output(hero, self, "Info_Mod_Kamal_Heimweh_15_10"); //Verstehe. Hast du auch gefunden, was du so brauchst?
	AI_Output(self, hero, "Info_Mod_Kamal_Heimweh_11_11"); //Ja, für's Erste reicht's.
	AI_Output(hero, self, "Info_Mod_Kamal_Heimweh_15_12"); //Bezahlen brauchst du nichts. Ist ja für die Gemeinschaft, denke ich. Bis dann.
};

INSTANCE Info_Mod_Kamal_Lehrer (C_INFO)
{
	npc		= Mod_7163_ASS_Kamal_NW;
	nr		= 1;
	condition	= Info_Mod_Kamal_Lehrer_Condition;
	information	= Info_Mod_Kamal_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Móglbym uzyc jakichs magicznych rzeczy.";
};

FUNC INT Info_Mod_Kamal_Lehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kamal_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kamal_Lehrer_Info()
{
	AI_Output(hero, self, "Info_Mod_Kamal_Lehrer_15_00"); //Móglbym uzyc jakichs magicznych rzeczy.
	AI_Output(self, hero, "Info_Mod_Kamal_Lehrer_11_01"); //Jestem alchemikiem, a nie dealerem. Moge jednak nauczyc sie jak warzyc trucizny.
	AI_Output(self, hero, "Info_Mod_Kamal_Lehrer_11_02"); //Jesli chcesz cos kupic, musisz udac sie do Mufid' s.
	AI_Output(hero, self, "Info_Mod_Kamal_Lehrer_15_03"); //Dziekujemy za koncówke.
};

INSTANCE Info_Mod_Kamal_Fliegenpilze (C_INFO)
{
	npc		= Mod_7163_ASS_Kamal_NW;
	nr		= 1;
	condition	= Info_Mod_Kamal_Fliegenpilze_Condition;
	information	= Info_Mod_Kamal_Fliegenpilze_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ma swieza agaryke muchowa.";
};

FUNC INT Info_Mod_Kamal_Fliegenpilze_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kamal_Zutaten2))
	&& (Npc_HasItems(hero, ItPl_Mushroom_03) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kamal_Fliegenpilze_Info()
{
	var int KamalPilze;

	KamalPilze = Npc_HasItems(hero, ItPl_Mushroom_03);

	AI_Output(hero, self, "Info_Mod_Kamal_Fliegenpilze_15_00"); //Ma swieza agaryke muchowa.

	B_GiveInvItems	(hero, self, ItPl_Mushroom_03, KamalPilze);

	AI_Output(self, hero, "Info_Mod_Kamal_Fliegenpilze_11_01"); //Oto jego nagroda.

	B_GiveInvItems	(self, hero, ItMi_Gold, KamalPilze*50);

	Npc_RemoveInvItems	(self, ItPl_Mushroom_03, Npc_HasItems(self, ItPl_Mushroom_03));

	B_GivePlayerXP	(10*KamalPilze);
};

INSTANCE Info_Mod_Kamal_Lernen (C_INFO)
{
	npc		= Mod_7163_ASS_Kamal_NW;
	nr		= 1;
	condition	= Info_Mod_Kamal_Lernen_Condition;
	information	= Info_Mod_Kamal_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Naucz mnie alchemii.";
};

FUNC INT Info_Mod_Kamal_Lernen_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_Hi))
	&& (Mod_IstLehrling == 1)
	{	
		return 1;
	};
};

FUNC VOID Info_Mod_Kamal_Lernen_Info()
{
	AI_Output (hero, self, "Info_Mod_Kamal_Lernen_15_00"); //Bring mir etwas über die Alchemie bei.	
	AI_Output (self, hero, "Info_Mod_Kamal_Lernen_11_01"); //Was willst du wissen?
		
	Info_ClearChoices 	(Info_Mod_Kamal_Lernen);
	Info_AddChoice 		(Info_Mod_Kamal_Lernen,DIALOG_BACK,Info_Mod_Kamal_Lernen_BACK);
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_07] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Kamal_Lernen, B_BuildLearnString ("Napój lekkiego leczenia", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_07)), Info_Mod_Kamal_Lernen_Health_07);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_06] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Kamal_Lernen, B_BuildLearnString ("Lekki eliksir leczniczy", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_06)), Info_Mod_Kamal_Lernen_Health_06);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_05] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Kamal_Lernen, B_BuildLearnString ("Napoje szybko lecznicze", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_05)), Info_Mod_Kamal_Lernen_Health_05);
	};	
	
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_06] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Kamal_Lernen, B_BuildLearnString ("Pic lekka mane", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_06)), Info_Mod_Kamal_Lernen_Mana_06);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_05] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Kamal_Lernen, B_BuildLearnString ("Eliksir lekki", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_05)), Info_Mod_Kamal_Lernen_Mana_05);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Kamal_Lernen, B_BuildLearnString ("Szybkosc", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Speed)), Info_Mod_Kamal_Lernen_Speed);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_GiftNeutralisierer] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Kamal_Lernen, B_BuildLearnString ("Zanieczyszczenia wywolane tymczasowa odpornoscia toksyczna", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_GiftNeutralisierer)), Info_Mod_Kamal_Lernen_GiftNeutralisierer);
	};                                                                                                                                                                            
	if (PLAYER_TALENT_ALCHEMY[POTION_Gift] == FALSE)
	{                                                                                                                                                                                     
		Info_AddChoice (Info_Mod_Kamal_Lernen, B_BuildLearnString ("trucizna mieszana", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Gift)), Info_Mod_Kamal_Lernen_Gift);               
	};
};
FUNC VOID Info_Mod_Kamal_Lernen_BACK()
{
	Info_ClearChoices 	(Info_Mod_Kamal_Lernen);
};
FUNC VOID Info_Mod_Kamal_Lernen_Health_05()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_05);
};
FUNC VOID Info_Mod_Kamal_Lernen_Health_06()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_06);
};
FUNC VOID Info_Mod_Kamal_Lernen_Health_07()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_07);
};
FUNC VOID Info_Mod_Kamal_Lernen_MANA_05()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_05);
};
FUNC VOID Info_Mod_Kamal_Lernen_MANA_06()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_06);
};
FUNC VOID Info_Mod_Kamal_Lernen_Speed()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Speed);
};
FUNC VOID Info_Mod_Kamal_Lernen_GiftNeutralisierer()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_GiftNeutralisierer);
};
FUNC VOID Info_Mod_Kamal_Lernen_Gift()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Gift);
};

INSTANCE Info_Mod_Kamal_Pickpocket (C_INFO)
{
	npc		= Mod_7163_ASS_Kamal_NW;
	nr		= 1;
	condition	= Info_Mod_Kamal_Pickpocket_Condition;
	information	= Info_Mod_Kamal_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Kamal_Pickpocket_Condition()
{
	C_Beklauen	(97, ItPo_Tiergift, 2);
};

FUNC VOID Info_Mod_Kamal_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Kamal_Pickpocket);

	Info_AddChoice	(Info_Mod_Kamal_Pickpocket, DIALOG_BACK, Info_Mod_Kamal_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Kamal_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Kamal_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Kamal_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Kamal_Pickpocket);
};

FUNC VOID Info_Mod_Kamal_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Kamal_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Kamal_Pickpocket);

		Info_AddChoice	(Info_Mod_Kamal_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Kamal_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Kamal_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Kamal_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Kamal_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Kamal_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Kamal_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Kamal_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Kamal_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Kamal_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Kamal_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Kamal_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Kamal_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Kamal_EXIT (C_INFO)
{
	npc		= Mod_7163_ASS_Kamal_NW;
	nr		= 1;
	condition	= Info_Mod_Kamal_EXIT_Condition;
	information	= Info_Mod_Kamal_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Kamal_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Kamal_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
