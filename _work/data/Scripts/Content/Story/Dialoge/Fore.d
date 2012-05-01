INSTANCE Info_Mod_Fore_Trador (C_INFO)
{
	npc		= Mod_7356_VMG_Fore_TUG;
	nr		= 1;
	condition	= Info_Mod_Fore_Trador_Condition;
	information	= Info_Mod_Fore_Trador_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Fore_Trador_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Per_Trador))
	|| (Npc_KnowsInfo(hero, Info_Mod_Dever_Trador))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fore_Trador_Info()
{
	AI_Output(self, hero, "Info_Mod_Fore_Trador_01_00"); //Sei mir gegrüßt. Was kann ich für dich tun?

	Info_ClearChoices	(Info_Mod_Fore_Trador);

	Info_AddChoice	(Info_Mod_Fore_Trador, "Du bist nicht tot? Dann habe ich hier nichts mehr verloren.", Info_Mod_Fore_Trador_B);
	Info_AddChoice	(Info_Mod_Fore_Trador, "Ein Verwandlungsmagier ist ermordet worden.", Info_Mod_Fore_Trador_A);
};

FUNC VOID Info_Mod_Fore_Trador_B()
{
	AI_Output(hero, self, "Info_Mod_Fore_Trador_B_15_00"); //Du bist nicht tot? Dann habe ich hier nichts mehr verloren.
	AI_Output(self, hero, "Info_Mod_Fore_Trador_B_01_01"); //Du unverschämter Lümmel!

	Info_ClearChoices	(Info_Mod_Fore_Trador);

	Info_AddChoice	(Info_Mod_Fore_Trador, "Du kannst mir gar nichts. Ich werd' dann mal wieder.", Info_Mod_Fore_Trador_D);
	Info_AddChoice	(Info_Mod_Fore_Trador, "War nicht so gemeint, tut mir Leid.", Info_Mod_Fore_Trador_C);
};

FUNC VOID Info_Mod_Fore_Trador_A()
{
	AI_Output(hero, self, "Info_Mod_Fore_Trador_A_15_00"); //Ein Verwandlungsmagier ist ermordet worden, und ich soll herausfinden, wer das ist.
	AI_Output(self, hero, "Info_Mod_Fore_Trador_A_01_01"); //Das ist schrecklich! Aber was willst du denn von mir?
	AI_Output(hero, self, "Info_Mod_Fore_Trador_A_15_02"); //Ich muss schließlich nachsehen, wer verschwunden ist, und wer nur seit ein paar Tagen nicht im Dorf war.
	AI_Output(self, hero, "Info_Mod_Fore_Trador_A_01_03"); //Da hast du natürlich Recht. Also ich lebe noch, davor kannst du ausgehen (lacht).
	AI_Output(hero, self, "Info_Mod_Fore_Trador_A_15_04"); //Okay, dann mache ich mich wieder auf den Weg.

	B_LogEntry	(TOPIC_MOD_FAICE_GIFT, "Fore ist noch am Leben und sammelt fröhlich seine Pflanzen.");

	Info_ClearChoices	(Info_Mod_Fore_Trador);
};

FUNC VOID Info_Mod_Fore_Trador_D()
{
	AI_Output(hero, self, "Info_Mod_Fore_Trador_D_15_00"); //Du kannst mir gar nichts. Ich werd' dann mal wieder.
	AI_Output(self, hero, "Info_Mod_Fore_Trador_D_01_01"); //Gar nichts wirst du, bevor du mir nicht gesagt hast, was hier gespielt wird.

	Info_Mod_Fore_Trador_A();
};

FUNC VOID Info_Mod_Fore_Trador_C()
{
	AI_Output(hero, self, "Info_Mod_Fore_Trador_C_15_00"); //War nicht so gemeint, tut mir Leid.

	Info_Mod_Fore_Trador_A();
};

INSTANCE Info_Mod_Fore_Lehrer (C_INFO)
{
	npc		= Mod_7356_VMG_Fore_TUG;
	nr		= 1;
	condition	= Info_Mod_Fore_Lehrer_Condition;
	information	= Info_Mod_Fore_Lehrer_Info;
	permanent	= 1;
	important	= 0;
	description	= "Kann ich bei dir lernen?";
};

FUNC INT Info_Mod_Fore_Lehrer_Condition()
{	
	if (Mod_IstLehrling == 1)
	{	
		return 1;
	};
};

FUNC VOID Info_Mod_Fore_Lehrer_Info()
{
	AI_Output (hero, self, "Info_Mod_Fore_Lehrer_15_00"); //Kann ich bei dir lernen?
	AI_Output (self, hero, "Info_Mod_Fore_Lehrer_01_01"); //Ich werde dich in die Geheimnisse der Alchemie einweihen.
		
	Info_ClearChoices 	(Info_Mod_Fore_Lehrer);
	Info_AddChoice 		(Info_Mod_Fore_Lehrer,DIALOG_BACK,Info_Mod_Fore_Lehrer_BACK);
	
	if ( PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	&& (Mod_LehrlingBei != 1)
	{
		Info_AddChoice 		(Info_Mod_Fore_Lehrer,B_BuildLearnString ("Essenz der Heilung", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_01)),Info_Mod_Fore_Lehrer_HEALTH_01);
	};
		
	if ( PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
	&& ( PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Fore_Lehrer, B_BuildLearnString ("Extrakt der Heilung", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_02)), Info_Mod_Fore_Lehrer_Health_02);
	};
		
	if ( PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)
	&& ( PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Fore_Lehrer, B_BuildLearnString ("Elixier der Heilung", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_03)), Info_Mod_Fore_Lehrer_Health_03);
	};
		
	if ( PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE)
	&& ( PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)
	&& (Mod_LehrlingBei != 1)
	&& (Kapitel >= 4)
	{
		Info_AddChoice	  (Info_Mod_Fore_Lehrer, B_BuildLearnString ("Elixier des Lebens", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Perm_Health)), Info_Mod_Fore_Lehrer_Perm_Health);
	};
		
	if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	&& (Mod_LehrlingBei != 1)
	{
		Info_AddChoice	  (Info_Mod_Fore_Lehrer, B_BuildLearnString ("Mana Essenz", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_01)), Info_Mod_Fore_Lehrer_Mana_01);
	};
		
	if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	&& ( PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Fore_Lehrer, B_BuildLearnString ("Mana Extrakt", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_02)), Info_Mod_Fore_Lehrer_Mana_02);
	};
	
	if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
	&& ( PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Fore_Lehrer, B_BuildLearnString ("Mana Elixier", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_03)), Info_Mod_Fore_Lehrer_Mana_03);
	};
		
	if ( PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
	&& ( PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE)
	&& (Kapitel >= 4)
	{
		Info_AddChoice	  (Info_Mod_Fore_Lehrer, B_BuildLearnString ("Elixier des Geistes", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Perm_Mana)), Info_Mod_Fore_Lehrer_Perm_Mana);
	};                                                                                                                                                                                   
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE) 
	&& (Kapitel >= 4)
	{                                                                                                                                                                                     
		Info_AddChoice (Info_Mod_Fore_Lehrer, B_BuildLearnString ("Elixier der Stärke", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Perm_STR)), Info_Mod_Fore_Lehrer_PermSTR);               
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	&& (Kapitel >= 4)
	{
		Info_AddChoice (Info_Mod_Fore_Lehrer,B_BuildLearnString ("Elixier der Geschicklichkeit", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Perm_DEX)), Info_Mod_Fore_Lehrer_Perm_DEX);		
	};
};
FUNC VOID Info_Mod_Fore_Lehrer_BACK()
{
	Info_ClearChoices 	(Info_Mod_Fore_Lehrer);
};
FUNC VOID Info_Mod_Fore_Lehrer_HEALTH_01()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_01);
};
FUNC VOID Info_Mod_Fore_Lehrer_PermStr()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Perm_STR);
};
FUNC VOID Info_Mod_Fore_Lehrer_Perm_DEX()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Perm_DEX);
};
FUNC VOID Info_Mod_Fore_Lehrer_HEALTH_02()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_02);
};
FUNC VOID Info_Mod_Fore_Lehrer_Health_03()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_03);
};
FUNC VOID Info_Mod_Fore_Lehrer_Perm_Health()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Perm_Health);
};
FUNC VOID Info_Mod_Fore_Lehrer_MANA_01()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_01);
};
FUNC VOID Info_Mod_Fore_Lehrer_MANA_02()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_02);
};
FUNC VOID Info_Mod_Fore_Lehrer_MANA_03()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_03);
};
FUNC VOID Info_Mod_Fore_Lehrer_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Perm_Mana);
};

INSTANCE Info_Mod_Fore_Pickpocket (C_INFO)
{
	npc		= Mod_7356_VMG_Fore_TUG;
	nr		= 1;
	condition	= Info_Mod_Fore_Pickpocket_Condition;
	information	= Info_Mod_Fore_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Fore_Pickpocket_Condition()
{
	C_Beklauen	(54, ItPo_Mana_02, 3);
};

FUNC VOID Info_Mod_Fore_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Fore_Pickpocket);

	Info_AddChoice	(Info_Mod_Fore_Pickpocket, DIALOG_BACK, Info_Mod_Fore_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Fore_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Fore_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Fore_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Fore_Pickpocket);
};

FUNC VOID Info_Mod_Fore_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Fore_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Fore_Pickpocket);

		Info_AddChoice	(Info_Mod_Fore_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Fore_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Fore_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Fore_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Fore_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Fore_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Fore_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Fore_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Fore_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Fore_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Fore_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Fore_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Fore_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Fore_EXIT (C_INFO)
{
	npc		= Mod_7356_VMG_Fore_TUG;
	nr		= 1;
	condition	= Info_Mod_Fore_EXIT_Condition;
	information	= Info_Mod_Fore_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Fore_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fore_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};