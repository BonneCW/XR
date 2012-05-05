INSTANCE Info_Mod_Neoras_Hi (C_INFO)
{
	npc		= Mod_922_KDF_Neoras_NW;
	nr		= 1;
	condition	= Info_Mod_Neoras_Hi_Condition;
	information	= Info_Mod_Neoras_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Neoras_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Neoras_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Neoras_Hi_01_01"); //Ich bin Neoras, der Meister der Tränke.
};

INSTANCE Info_Mod_Neoras_Aufgabe (C_INFO)
{
	npc		= Mod_922_KDF_Neoras_NW;
	nr		= 1;
	condition	= Info_Mod_Neoras_Aufgabe_Condition;
	information	= Info_Mod_Neoras_Aufgabe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kann ich dir irgendwie behilflich sein?";
};

FUNC INT Info_Mod_Neoras_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Neoras_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Pyrokar_Mitglied))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Neoras_Aufgabe_Info()
{
	AI_Output(hero, self, "Info_Mod_Neoras_Aufgabe_15_00"); //Kann ich dir irgendwie behilflich sein?
	AI_Output(self, hero, "Info_Mod_Neoras_Aufgabe_01_01"); //Ich brauche keine Hilfe. Geh zu den anderen Magiern, vielleicht haben die was für dich zu tun.
};

INSTANCE Info_Mod_Neoras_HabTrank (C_INFO)
{
	npc		= Mod_922_KDF_Neoras_NW;
	nr		= 1;
	condition	= Info_Mod_Neoras_HabTrank_Condition;
	information	= Info_Mod_Neoras_HabTrank_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab hier einen Trank für dich (Trank geben).";
};

FUNC INT Info_Mod_Neoras_HabTrank_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Neoras_Aufgabe))
	&& (Npc_KnowsInfo(hero, Info_Mod_Milten_HabTrank))
	&& (Npc_HasItems(hero, NeorasTrankVonMilten) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Neoras_HabTrank_Info()
{
	AI_Output(hero, self, "Info_Mod_Neoras_HabTrank_15_00"); //Ich hab hier einen Trank für dich.

	B_GiveInvItems	(hero, self, NeorasTrankVonMilten, 1);

	AI_Output(self, hero, "Info_Mod_Neoras_HabTrank_01_01"); //Auf diesen Trank warte ich schon lange. Woher hast du ihn?
	AI_Output(hero, self, "Info_Mod_Neoras_HabTrank_15_02"); //Ich habe Milten geholfen ihn herzustellen.
	AI_Output(self, hero, "Info_Mod_Neoras_HabTrank_01_03"); //Damit hast du mir bewiesen, dass du würdig bist ein Novize zu werden. Nimm dieses Gold als Belohnung.

	B_LogEntry_More	(TOPIC_MOD_FEUERMAGIER, TOPIC_MOD_NEORAS_TRANK, "Neoras hält mich für würdig ein Novize zu werden.", "Ich habe Neoras den Trank gebracht.");
	B_SetTopicStatus	(TOPIC_MOd_NEORAS_TRANK, LOG_SUCCESS);

	B_GivePlayerXP	(150);

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	B_Göttergefallen(1, 1);
};

INSTANCE Info_Mod_Neoras_Mitgift (C_INFO)
{
	npc		= Mod_922_KDF_Neoras_NW;
	nr		= 1;
	condition	= Info_Mod_Neoras_Mitgift_Condition;
	information	= Info_Mod_Neoras_Mitgift_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Neoras_Mitgift_Condition()
{
	if (hero.guild == GIL_VLK)
	&& (Mod_Gilde == 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Neoras_Mitgift_Info()
{
	AI_Output(self, hero, "Info_Mod_Neoras_Mitgift_01_00"); //Du bist doch der Novize, der mir diesen Trank gebracht hat.
	AI_Output(self, hero, "Info_Mod_Neoras_Mitgift_01_01"); //Ich hätte vielleicht noch eine Aufgabe für jemanden mit deinen Fähigkeiten.
	AI_Output(hero, self, "Info_Mod_Neoras_Mitgift_15_02"); //Ich bin ganz Ohr.
	AI_Output(self, hero, "Info_Mod_Neoras_Mitgift_01_03"); //Wie dir vielleicht schon aufgefallen ist, stellen wir hier im Kloster Gegengifte her.
	AI_Output(self, hero, "Info_Mod_Neoras_Mitgift_01_04"); //Das ist notwendig, da es da draußen viel giftiges Getier und Gewächs gibt.
	AI_Output(hero, self, "Info_Mod_Neoras_Mitgift_15_05"); //Ja, damit hatte auch ich schon Bekanntschaft gemacht.
	AI_Output(self, hero, "Info_Mod_Neoras_Mitgift_01_06"); //Genau. Du begreifst also ihren Zweck, so weit so gut.
	AI_Output(self, hero, "Info_Mod_Neoras_Mitgift_01_07"); //Aber in letzter Zeit gab es auf Khorinis immer häufiger Todesfälle durch schwere Vergiftungen.
	AI_Output(self, hero, "Info_Mod_Neoras_Mitgift_01_08"); //Jedoch wurden diese nicht etwa durch Tiere, oder Pflanzen hervorgerufen, sondern durch von Menschenhand geschaffene Waffen ... Schwerter und Pfeile.
	AI_Output(self, hero, "Info_Mod_Neoras_Mitgift_01_09"); //Es scheint gedungene Mörder zu geben, die ihre Klingen und Spitzen damit bestreichen, um ihre Opfer damit einem erbarmungslosen Tode zuzuführen.
	AI_Output(self, hero, "Info_Mod_Neoras_Mitgift_01_10"); //Dafür scheinen sie besonders konzentrierte Gifte zu verwenden.
	AI_Output(self, hero, "Info_Mod_Neoras_Mitgift_01_11"); //Ich möchte dich nun darum bitten, mir je ein Fläschchen tierisches und pflanzliches Gift zu beschaffen, damit ich meine Forschungen auf dem Gebiet intensivieren kann.
	AI_Output(self, hero, "Info_Mod_Neoras_Mitgift_01_12"); //Begib dich dafür am besten zu Alchemisten oder Kräuterkundigen. Dort könntest du mit etwas Glück fündig werden.

	Log_CreateTopic	(TOPIC_MOD_NEORAS_MITGIFT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_NEORAS_MITGIFT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_NEORAS_MITGIFT, "Ich soll Neoras zu Forschungszwecken je ein Fläschen Tier- und Gewächsgift besorgen. Er meinte, dass ich mich bei Kräuterkundigen und Alchemisten umschauen solle.");
};

INSTANCE Info_Mod_Neoras_Mitgift2 (C_INFO)
{
	npc		= Mod_922_KDF_Neoras_NW;
	nr		= 1;
	condition	= Info_Mod_Neoras_Mitgift2_Condition;
	information	= Info_Mod_Neoras_Mitgift2_Info;
	permanent	= 0;
	important	= 0;
	description	= "So, hier ein Fläschchen Gewächsgift und das Fläschchen Tiergift.";
};

FUNC INT Info_Mod_Neoras_Mitgift2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Neoras_Mitgift))
	&& (Npc_HasItems(hero, ItPo_Tiergift) >= 1)
	&& (Npc_HasItems(hero, ItPo_Pflanzengift) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Neoras_Mitgift2_Info()
{
	AI_Output(hero, self, "Info_Mod_Neoras_Mitgift2_15_00"); //So, hier ein Fläschchen Gewächsgift und das Fläschchen Tiergift.

	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_Mitgift2))
	{
		AI_Output(hero, self, "Info_Mod_Neoras_Mitgift2_15_01"); //Mit schönen Grüßen von Constantino.
	};

	AI_Output(self, hero, "Info_Mod_Neoras_Mitgift2_01_02"); //Ahh, vortrefflich. Das ist erst mal genügend Material für meine Forschungen. Du hast deine Aufgabe wieder einmal gut gemacht.
	AI_Output(self, hero, "Info_Mod_Neoras_Mitgift2_01_03"); //Hier, nimm etwas Gold für deine Aufwendungen und einige Gegengifte.

	CreateInvItems	(hero, ItMi_Gold, 200);
	CreateInvItems	(hero, ItPo_Gegengift, 3);

	B_ShowGivenThings	("200 Gold und 3 Gegengifte erhalten");

	B_GivePlayerXP	(350);

	B_SetTopicStatus	(TOPIC_MOD_NEORAS_MITGIFT, LOG_SUCCESS);
};

INSTANCE Info_Mod_Neoras_Lehrer (C_INFO)
{
	npc		= Mod_922_KDF_Neoras_NW;
	nr		= 1;
	condition	= Info_Mod_Neoras_Lehrer_Condition;
	information	= Info_Mod_Neoras_Lehrer_Info;
	permanent	= 1;
	important	= 0;
	description	= "Kann ich bei dir lernen?";
};

FUNC INT Info_Mod_Neoras_Lehrer_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Mod_Neoras_Hi))
	&& ((Mod_Gilde == 6)
	|| (Mod_Gilde == 7)
	|| (Mod_Gilde == 8))
	&& (Mod_IstLehrling == 1)
	{	
		return 1;
	};
};
FUNC VOID Info_Mod_Neoras_Lehrer_Info()
{
	AI_Output (hero, self, "Info_Mod_Neoras_Lehrer_15_00"); //Kann ich bei dir lernen?
	
	if (Mod_Gilde == 6)
	|| (Mod_Gilde == 7)
	|| (Mod_Gilde == 8)
	{
		AI_Output (self, hero, "Info_Mod_Neoras_Lehrer_01_01"); //Ich werde dich in die Geheimnisse der Alchemie einweihen.
		
		if (!Npc_KnowsInfo(hero, Info_Mod_Neoras_Lehrer))
		{
			Log_CreateTopic	(TOPIC_MOD_LEHRER_KLOSTER, LOG_NOTE);
			B_LogEntry	(TOPIC_MOD_LEHRER_KLOSTER, "Neoras kann mir etwas über die Alchemie beibringen.");
		};

		Info_ClearChoices 	(Info_Mod_Neoras_Lehrer);
		Info_AddChoice 		(Info_Mod_Neoras_Lehrer,DIALOG_BACK,Info_Mod_Neoras_Lehrer_BACK);
	
		if ( PLAYER_TALENT_ALCHEMY[POTION_Gegengift] == FALSE)
		{
			Info_AddChoice 		(Info_Mod_Neoras_Lehrer,B_BuildLearnString ("Gegengift", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Gegengift)),Info_Mod_Neoras_Lehrer_Gegengift);
		};
	
		if ( PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
		&& (Mod_LehrlingBei != 1)
		{
			Info_AddChoice 		(Info_Mod_Neoras_Lehrer,B_BuildLearnString ("Essenz der Heilung", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_01)),Info_Mod_Neoras_Lehrer_HEALTH_01);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
		&& ( PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
		{
			Info_AddChoice	  (Info_Mod_Neoras_Lehrer, B_BuildLearnString ("Extrakt der Heilung", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_02)), Info_Mod_Neoras_Lehrer_Health_02);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)
		&& ( PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)
		{
			Info_AddChoice	  (Info_Mod_Neoras_Lehrer, B_BuildLearnString ("Elixier der Heilung", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_03)), Info_Mod_Neoras_Lehrer_Health_03);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE)
		&& ( PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)
		&& (Mod_LehrlingBei != 1)
		&& (Kapitel >= 4)
		{
			Info_AddChoice	  (Info_Mod_Neoras_Lehrer, B_BuildLearnString ("Elixier des Lebens", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Perm_Health)), Info_Mod_Neoras_Lehrer_Perm_Health);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
		&& (Mod_LehrlingBei != 1)
		{
			Info_AddChoice	  (Info_Mod_Neoras_Lehrer, B_BuildLearnString ("Mana Essenz", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_01)), Info_Mod_Neoras_Lehrer_Mana_01);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
		&& ( PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
		{
			Info_AddChoice	  (Info_Mod_Neoras_Lehrer, B_BuildLearnString ("Mana Extrakt", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_02)), Info_Mod_Neoras_Lehrer_Mana_02);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
		&& ( PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
		{
			Info_AddChoice	  (Info_Mod_Neoras_Lehrer, B_BuildLearnString ("Mana Elixier", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_03)), Info_Mod_Neoras_Lehrer_Mana_03);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
		&& ( PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE)
		&& (Kapitel >= 4)
		{
			Info_AddChoice	  (Info_Mod_Neoras_Lehrer, B_BuildLearnString ("Elixier des Geistes", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Perm_Mana)), Info_Mod_Neoras_Lehrer_Perm_Mana);
		};                                                                                                                                                                            
		if (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE) 
		&& (Kapitel >= 4)
		{                                                                                                                                                                                     
			Info_AddChoice (Info_Mod_Neoras_Lehrer, B_BuildLearnString ("Elixier der Stärke", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Perm_STR)), Info_Mod_Neoras_Lehrer_PermSTR);               
		};
		if (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
		&& (Kapitel >= 4)
		{
			Info_AddChoice (Info_Mod_Neoras_Lehrer,B_BuildLearnString ("Elixier der Geschicklichkeit", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Perm_DEX)), Info_Mod_Neoras_Lehrer_Perm_DEX);
		};
		
	};
};
FUNC VOID Info_Mod_Neoras_Lehrer_BACK()
{
	Info_ClearChoices 	(Info_Mod_Neoras_Lehrer);
};
FUNC VOID Info_Mod_Neoras_Lehrer_Gegengift()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Gegengift);
};
FUNC VOID Info_Mod_Neoras_Lehrer_HEALTH_01()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_01);
};
FUNC VOID Info_Mod_Neoras_Lehrer_HEALTH_02()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_02);
};
FUNC VOID Info_Mod_Neoras_Lehrer_Health_03()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_03);
};
FUNC VOID Info_Mod_Neoras_Lehrer_PermStr()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Perm_STR);
};
FUNC VOID Info_Mod_Neoras_Lehrer_Perm_DEX()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Perm_DEX);
};
FUNC VOID Info_Mod_Neoras_Lehrer_Perm_Health()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Perm_Health);
};
FUNC VOID Info_Mod_Neoras_Lehrer_MANA_01()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_01);
};
FUNC VOID Info_Mod_Neoras_Lehrer_MANA_02()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_02);
};
FUNC VOID Info_Mod_Neoras_Lehrer_MANA_03()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_03);
};
FUNC VOID Info_Mod_Neoras_Lehrer_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Perm_Mana);
};

INSTANCE Info_Mod_Neoras_Pickpocket (C_INFO)
{
	npc		= Mod_922_KDF_Neoras_NW;
	nr		= 1;
	condition	= Info_Mod_Neoras_Pickpocket_Condition;
	information	= Info_Mod_Neoras_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_150;
};

FUNC INT Info_Mod_Neoras_Pickpocket_Condition()
{
	C_Beklauen	(130, ItPo_Perm_Mana, 1);
};

FUNC VOID Info_Mod_Neoras_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Neoras_Pickpocket);

	Info_AddChoice	(Info_Mod_Neoras_Pickpocket, DIALOG_BACK, Info_Mod_Neoras_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Neoras_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Neoras_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Neoras_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Neoras_Pickpocket);
};

FUNC VOID Info_Mod_Neoras_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Neoras_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Neoras_Pickpocket);

		Info_AddChoice	(Info_Mod_Neoras_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Neoras_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Neoras_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Neoras_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Neoras_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Neoras_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Neoras_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Neoras_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Neoras_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Neoras_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Neoras_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Neoras_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Neoras_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Neoras_EXIT (C_INFO)
{
	npc		= Mod_922_KDF_Neoras_NW;
	nr		= 1;
	condition	= Info_Mod_Neoras_EXIT_Condition;
	information	= Info_Mod_Neoras_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Neoras_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Neoras_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};