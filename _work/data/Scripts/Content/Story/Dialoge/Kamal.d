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

	B_ShowGivenThings	("750 Gold gegeben und Gift erhalten");

	CreateInvItems	(hero, ItPo_KamalGift, 1);
	Npc_RemoveInvItems	(hero, ItMi_Gold, 750);

	B_LogEntry	(TOPIC_MOD_ASS_BLUTKELCH, "Ich hab das Gift. Jetzt nichts wie los zum Richter.");
};

INSTANCE Info_Mod_Kamal_Hi (C_INFO)
{
	npc		= Mod_7163_ASS_Kamal_NW;
	nr		= 1;
	condition	= Info_Mod_Kamal_Hi_Condition;
	information	= Info_Mod_Kamal_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du bist Kamal, der Alchemist?";
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
	AI_Output(hero, self, "Info_Mod_Kamal_Hi_15_00"); //Du bist Kamal, der Alchemist?
	AI_Output(self, hero, "Info_Mod_Kamal_Hi_11_01"); //Wer sagt das?
	AI_Output(hero, self, "Info_Mod_Kamal_Hi_15_02"); //Einer, der eine Bitte hat ...

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
	description	= "Er schon wieder.";
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
	AI_Output(hero, self, "Info_Mod_Kamal_Blutkelch_15_00"); //Er schon wieder.
	AI_Output(self, hero, "Info_Mod_Kamal_Blutkelch_11_01"); //Aha. Der Kräutermann. Hast du noch welche?
	AI_Output(hero, self, "Info_Mod_Kamal_Blutkelch_15_02"); //Das nicht. Aber eine Bitte hat er ...

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
	description	= "Ich sehe du bist Kamal, der Alchemist?";
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
	AI_Output(hero, self, "Info_Mod_Kamal_Zutaten_15_00"); //Ich sehe du bist Kamal, der Alchemist?
	AI_Output(self, hero, "Info_Mod_Kamal_Zutaten_11_01"); //Wer sagt das?
	AI_Output(hero, self, "Info_Mod_Kamal_Zutaten_15_02"); //Einer, der dir zur Hand gehen will ...
	AI_Output(self, hero, "Info_Mod_Kamal_Zutaten_11_03"); //Und warum will er das?
	AI_Output(hero, self, "Info_Mod_Kamal_Zutaten_15_04"); //Er möchte Magier werden wie du.
	AI_Output(self, hero, "Info_Mod_Kamal_Zutaten_11_05"); //Und mich arbeitslos machen?
	AI_Output(hero, self, "Info_Mod_Kamal_Zutaten_15_06"); //Nein, nein. Er würde lieber eure Zauber lernen. Dafür muss er erst mal Punkte sammeln bei den Magiern.
	AI_Output(self, hero, "Info_Mod_Kamal_Zutaten_11_07"); //Wohl wahr. Er kann mir einen Gefallen tun.
	AI_Output(hero, self, "Info_Mod_Kamal_Zutaten_15_08"); //Was liegt an?
	AI_Output(self, hero, "Info_Mod_Kamal_Zutaten_11_09"); //Mir gehen die Ingredienzien aus.
	AI_Output(hero, self, "Info_Mod_Kamal_Zutaten_15_10"); //Die was?
	AI_Output(self, hero, "Info_Mod_Kamal_Zutaten_11_11"); //Zutaten für meine Gifte. Ich brauche Fliegenstachel, Höllenpilze und ein paar Fliegenpilze. Jeweils fünf sollten genügen.
	AI_Output(hero, self, "Info_Mod_Kamal_Zutaten_15_12"); //Wo findet er das?
	AI_Output(self, hero, "Info_Mod_Kamal_Zutaten_11_13"); //Was weiß ich. Bin noch nicht lange auf der Insel. Kenne mich nicht aus. Vielleicht wissen die Jäger etwas. Nun mache er hin.

	Log_CreateTopic	(TOPIC_MOD_ASS_KAMAL, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_KAMAL, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ASS_KAMAL, "Ich will Novize werden. Dazu soll ich Zutaten für Kamal besorgen. Jeweils 5 Blutfliegenstachel, Fliegenpilze und Höllenpilze. Hm ... bei wem kann ich Stachel ziehen lernen? Die Pilze finde ich im Minental.");
};

INSTANCE Info_Mod_Kamal_Zutaten2 (C_INFO)
{
	npc		= Mod_7163_ASS_Kamal_NW;
	nr		= 1;
	condition	= Info_Mod_Kamal_Zutaten2_Condition;
	information	= Info_Mod_Kamal_Zutaten2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Er ist zurück.";
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
	AI_Output(hero, self, "Info_Mod_Kamal_Zutaten2_15_00"); //Er ist zurück.
	AI_Output(self, hero, "Info_Mod_Kamal_Zutaten2_11_01"); //Wer?
	AI_Output(hero, self, "Info_Mod_Kamal_Zutaten2_15_02"); //Der mit den Pilzen und so.
	AI_Output(self, hero, "Info_Mod_Kamal_Zutaten2_11_03"); //Ach der. Kann ich sehen?
	AI_Output(hero, self, "Info_Mod_Kamal_Zutaten2_15_04"); //Hier, fünf Stachel und hier fünf Höllenpilze. Und da noch fünf Fliegenpilze. Sind sehr selten auf Khorinis.

	Npc_RemoveInvItems	(hero, ItAt_Sting, 5);
	Npc_RemoveInvItems	(hero, ItPl_Mushroom_03, 5);
	Npc_RemoveInvItems	(hero, ItFo_Plants_Mushroom_01, 5);

	B_ShowGivenThings	("5 Stachel, 5 Fliegenpilze und 5 Höllenpilze gegeben");

	AI_Output(self, hero, "Info_Mod_Kamal_Zutaten2_11_05"); //Weitere Fliegenpilze, die gefunden werden, können gebracht werden. Es winkt gutes Gold.
	AI_Output(hero, self, "Info_Mod_Kamal_Zutaten2_15_06"); //Wem?
	AI_Output(self, hero, "Info_Mod_Kamal_Zutaten2_11_07"); //Dem Finder natürlich.
	AI_Output(hero, self, "Info_Mod_Kamal_Zutaten2_15_08"); //Natürlich. Kennst du jemanden, dem er auch zur Hand gehen kann?
	AI_Output(self, hero, "Info_Mod_Kamal_Zutaten2_11_09"); //Dem Malek. Er jammert immer, er habe nicht genug Mana.
	AI_Output(hero, self, "Info_Mod_Kamal_Zutaten2_15_10"); //Kannst du ihm denn nicht helfen.
	AI_Output(self, hero, "Info_Mod_Kamal_Zutaten2_11_11"); //Nein. Ich versteh mich nur auf Gifte.
	AI_Output(hero, self, "Info_Mod_Kamal_Zutaten2_15_12"); //Aha. Er geht dann mal. Und vergiss nicht, ihm deine Stimme zu geben.
	AI_Output(self, hero, "Info_Mod_Kamal_Zutaten2_11_13"); //Er kann sich drauf verlassen.

	B_SetTopicStatus	(TOPIC_MOD_ASS_KAMAL, LOG_SUCCESS);
	
	B_LogEntry	(TOPIC_MOD_ASS_MAGIER, "Ich habe Kamal geholfen. Jetzt soll ich zu Malek gehen.");

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
	description	= "Ich könnte paar magische Sachen brauchen.";
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
	AI_Output(hero, self, "Info_Mod_Kamal_Lehrer_15_00"); //Ich könnte paar magische Sachen brauchen.
	AI_Output(self, hero, "Info_Mod_Kamal_Lehrer_11_01"); //Bin Alchemist, kein Händler. Aber ich könnte dir beibringen, wie man Gifte braut.
	AI_Output(self, hero, "Info_Mod_Kamal_Lehrer_11_02"); //Wenn du was kaufen willst, musst du zu Mufid gehen.
	AI_Output(hero, self, "Info_Mod_Kamal_Lehrer_15_03"); //Danke für den Tip.
};

INSTANCE Info_Mod_Kamal_Fliegenpilze (C_INFO)
{
	npc		= Mod_7163_ASS_Kamal_NW;
	nr		= 1;
	condition	= Info_Mod_Kamal_Fliegenpilze_Condition;
	information	= Info_Mod_Kamal_Fliegenpilze_Info;
	permanent	= 1;
	important	= 0;
	description	= "Er hat frische Fliegenpilze.";
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

	AI_Output(hero, self, "Info_Mod_Kamal_Fliegenpilze_15_00"); //Er hat frische Fliegenpilze.

	B_GiveInvItems	(hero, self, ItPl_Mushroom_03, KamalPilze);

	AI_Output(self, hero, "Info_Mod_Kamal_Fliegenpilze_11_01"); //Und hier hat er seinen Lohn.

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
	description	= "Bring mir etwas über die Alchemie bei.";
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
		Info_AddChoice	  (Info_Mod_Kamal_Lernen, B_BuildLearnString ("Trank der leichten Heilung", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_07)), Info_Mod_Kamal_Lernen_Health_07);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_06] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Kamal_Lernen, B_BuildLearnString ("Leichter Heiltrank", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_06)), Info_Mod_Kamal_Lernen_Health_06);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_05] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Kamal_Lernen, B_BuildLearnString ("Trank der schnellen Heilung", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_05)), Info_Mod_Kamal_Lernen_Health_05);
	};	
	
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_06] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Kamal_Lernen, B_BuildLearnString ("Trank des leichten Mana", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_06)), Info_Mod_Kamal_Lernen_Mana_06);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_05] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Kamal_Lernen, B_BuildLearnString ("Leichte Manatrank", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_05)), Info_Mod_Kamal_Lernen_Mana_05);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Kamal_Lernen, B_BuildLearnString ("Trank der Geschwindigkeit", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Speed)), Info_Mod_Kamal_Lernen_Speed);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_GiftNeutralisierer] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Kamal_Lernen, B_BuildLearnString ("Trank der temporären Giftimmunität", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_GiftNeutralisierer)), Info_Mod_Kamal_Lernen_GiftNeutralisierer);
	};                                                                                                                                                                            
	if (PLAYER_TALENT_ALCHEMY[POTION_Gift] == FALSE)
	{                                                                                                                                                                                     
		Info_AddChoice (Info_Mod_Kamal_Lernen, B_BuildLearnString ("Mischgift", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Gift)), Info_Mod_Kamal_Lernen_Gift);               
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