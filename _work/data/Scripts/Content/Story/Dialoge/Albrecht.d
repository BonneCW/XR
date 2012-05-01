INSTANCE Info_Mod_Albrecht_Hi (C_INFO)
{
	npc		= Mod_559_PAL_Albrecht_NW;
	nr		= 1;
	condition	= Info_Mod_Albrecht_Hi_Condition;
	information	= Info_Mod_Albrecht_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Albrecht_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Albrecht_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Albrecht_Hi_03_01"); //Ich bin Albrecht, Paladin des Königs. Ich lehre den anderen Paladinen den Umgang mit unserer Magie.
};

instance Info_Mod_Albrecht_IstPala (C_INFO)
{
	npc		= Mod_559_PAL_Albrecht_NW;
	nr		= 1;
	condition	= Info_Mod_Albrecht_IstPala_Condition;
	information	= Info_Mod_Albrecht_IstPala_Info;
	permanent    	= 0;
	important	= 1;
};

func int Info_Mod_Albrecht_IstPala_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Mod_Albrecht_Hi))
	&& (Mod_Gilde == 3)
	{	
		return 1;
	};
};

func void Info_Mod_Albrecht_IstPala_Info()
{
	AI_Output (self, other, "Info_Mod_Albrecht_IstPala_03_00"); //Du gehörst nun also zu uns. Damit eröffnet sich dir auch die Magie der Paladine.
	AI_Output (self, other, "Info_Mod_Albrecht_IstPala_03_01"); //Ich kann sie dich lehren, wenn du möchtest.
};

instance Info_Mod_Albrecht_CanTeach (C_INFO)
{
	npc		= Mod_559_PAL_Albrecht_NW;
	nr		= 1;
	condition	= Info_Mod_Albrecht_CanTeach_Condition;
	information	= Info_Mod_Albrecht_CanTeach_Info;
	permanent    	= 1;
	important	= 0;
	description	= "Kannst du mir was beibringen?";
};

func int Info_Mod_Albrecht_CanTeach_Condition()
{	
	if (Albrecht_TeachMANA == FALSE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Albrecht_Hi))
	&& (Mod_Schwierigkeit != 4)
	{	
		return 1;
	};
};

func void Info_Mod_Albrecht_CanTeach_Info()
{
	B_Say	(hero, self, "$KANNSTDUMIRWASBEIBRINGEN");
	
	if (Mod_Gilde == 3)
	{
		AI_Output (self, other, "Info_Mod_Albrecht_CanTeach_03_00"); //Wenn du dich würdig erweißt, werde ich dir die magischen Runen der Paladine verleihen.
		AI_Output (self, other, "Info_Mod_Albrecht_CanTeach_03_01"); //Außerdem kann ich dir beibringen, deine magische Kraft zu vergrößern.
		Albrecht_TeachMANA = TRUE;
		B_LogEntry (TOPIC_MOD_LEHRER_STADT, "Paladin Albrecht kann mir helfen, meine magische Kraft zu steigern.");
	}
	else
	{	
		AI_Output (self, other, "Info_Mod_Albrecht_CanTeach_03_02"); //Ich unterweise nur Paladine.
	};
};

instance Info_Mod_Albrecht_TEACHPalRunes (C_INFO)
{
	npc		= Mod_559_PAL_Albrecht_NW;
	nr		= 1;
	condition	= Info_Mod_Albrecht_TEACHPalRunes_Condition;
	information	= Info_Mod_Albrecht_TEACHPalRunes_Info;
	permanent	= 1;
	important	= 0;
	description	= "Bin ich würdig, eine Rune zu empfangen?";
};

func int Info_Mod_Albrecht_TEACHPalRunes_Condition()
{	
	if (Albrecht_TeachMANA == TRUE)
	{
		return 1;
	};
};

func void Info_Mod_Albrecht_TEACHPalRunes_Info()
{
	AI_Output (other, self, "Info_Mod_Albrecht_TEACHPalRunes_15_00"); //Bin ich würdig, eine Rune zu empfangen?
	
	if (PLAYER_TALENT_RUNES [SPL_PalLight] == FALSE)
	{
		
		AI_Output (self,other, "Info_Mod_Albrecht_TEACHPalRunes_03_01"); //Als Zeichen deines Ranges verleihe ich dir die Rune des Lichtes. Sie ist Symbol der Wahrheit und der Gerechtigkeit.
		AI_Output (self,other, "Info_Mod_Albrecht_TEACHPalRunes_03_02"); //Leuchtet all denjenigen den Weg, die den aufrechten Pfad Innos' begehen.
		AI_Output (self,other, "Info_Mod_Albrecht_TEACHPalRunes_03_03"); //Alle weiteren Runen musst du dir verdienen. Komme wieder, wenn du denkst, dass du dich ihrer würdig erwiesen hast.
	
		PLAYER_TALENT_RUNES [SPL_PalLight] = TRUE;
	
		CreateInvItems (self,ItRu_PalLight,1);
		B_GiveInvItems (self,other,ItRu_PalLight,1);
	}
	else
	{
		AI_Output (self,other, "Info_Mod_Albrecht_TEACHPalRunes_03_04"); //Für welchen Weg entscheidest du dich?
		AI_Output (self,other, "Info_Mod_Albrecht_TEACHPalRunes_03_05"); //Den Weg der Heilung oder den Weg des Kampfes?
		
		Info_ClearChoices   (Info_Mod_Albrecht_TEACHPalRunes);
		Info_AddChoice (Info_Mod_Albrecht_TEACHPalRunes,DIALOG_BACK,Info_Mod_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice (Info_Mod_Albrecht_TEACHPalRunes,"Ich wähle den Weg der Heilung.",Info_Mod_Albrecht_TEACHPalRunes_Heal);
		Info_AddChoice (Info_Mod_Albrecht_TEACHPalRunes,"Ich wähle den Weg des Kampfes.",Info_Mod_Albrecht_TEACHPalRunes_Combat);
	};	
};

FUNC VOID Info_Mod_Albrecht_TEACHPalRunes_BACK()
{
	Info_ClearChoices   (Info_Mod_Albrecht_TEACHPalRunes);
};

FUNC VOID B_Albrecht_YouAreNotWorthy ()
{
	AI_Output (self ,other,"B_Albrecht_YouAreNotWorthy_03_00"); //Du bist noch nicht würdig, den nächsten Spruch dieses Weges zu erhalten.
};

FUNC VOID Info_Mod_Albrecht_TEACHPalRunes_Heal()
{
	AI_Output (other,self ,"Info_Mod_Albrecht_TEACHPalRunes_Heal_15_00"); //Ich wähle den Weg der Heilung.
	if  (PLAYER_TALENT_RUNES [SPL_PalLightHeal] == FALSE)
	&&	(Kapitel >= 5)
	{
		Info_ClearChoices   (Info_Mod_Albrecht_TEACHPalRunes);
		Info_AddChoice (Info_Mod_Albrecht_TEACHPalRunes,DIALOG_BACK,Info_Mod_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice	(Info_Mod_Albrecht_TEACHPalRunes, B_BuildLearnString ("Leichte Wunden heilen", CostForPalSpells) ,Info_Mod_Albrecht_TEACHPalRunes_PalLightHeal);
	}
	else if 	(PLAYER_TALENT_RUNES [SPL_PalMediumHeal] == FALSE)
	&&	(Kapitel >= 5)
	{
		Info_ClearChoices   (Info_Mod_Albrecht_TEACHPalRunes);
		Info_AddChoice (Info_Mod_Albrecht_TEACHPalRunes,DIALOG_BACK,Info_Mod_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice	(Info_Mod_Albrecht_TEACHPalRunes, B_BuildLearnString ("Mittlere Wunden heilen", CostForPalSpells) ,Info_Mod_Albrecht_TEACHPalRunes_PalMediumHeal);
	}
	else if 	(PLAYER_TALENT_RUNES [SPL_PalFullHeal] == FALSE)
	&&	(Kapitel >= 6)
	{
		Info_ClearChoices   (Info_Mod_Albrecht_TEACHPalRunes);
		Info_AddChoice (Info_Mod_Albrecht_TEACHPalRunes,DIALOG_BACK,Info_Mod_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice	(Info_Mod_Albrecht_TEACHPalRunes, B_BuildLearnString ("Schwere Wunden heilen", CostForPalSpells) ,Info_Mod_Albrecht_TEACHPalRunes_PalFullHeal);
	}
	else
	{
		B_Albrecht_YouAreNotWorthy ();
	};
};

FUNC VOID Info_Mod_Albrecht_TEACHPalRunes_Combat()
{
	AI_Output (other,self ,"Info_Mod_Albrecht_TEACHPalRunes_Combat_15_00"); //Ich wähle den Weg des Kampfes.
	
	if	(PLAYER_TALENT_RUNES [SPL_PalHolyBolt] == FALSE)
	&&	(Kapitel >= 5)
	{
		Info_ClearChoices   (Info_Mod_Albrecht_TEACHPalRunes);
		Info_AddChoice (Info_Mod_Albrecht_TEACHPalRunes,DIALOG_BACK,Info_Mod_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice	(Info_Mod_Albrecht_TEACHPalRunes, B_BuildLearnString ("Heiliger Pfeil", CostForPalSpells) ,Info_Mod_Albrecht_TEACHPalRunes_PalHolyBolt);
	}
	else if (PLAYER_TALENT_RUNES [SPL_PalRepelEvil] == FALSE)
	&&	(Kapitel >= 5)
	{
		Info_ClearChoices   (Info_Mod_Albrecht_TEACHPalRunes);
		Info_AddChoice (Info_Mod_Albrecht_TEACHPalRunes,DIALOG_BACK,Info_Mod_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice	(Info_Mod_Albrecht_TEACHPalRunes, B_BuildLearnString ("Böses austreiben", CostForPalSpells) ,Info_Mod_Albrecht_TEACHPalRunes_PalRepelEvil);
	}
	else if (PLAYER_TALENT_RUNES [SPL_PalDestroyEvil] == FALSE)
	&&	(Kapitel >= 6)
	{
		Info_ClearChoices   (Info_Mod_Albrecht_TEACHPalRunes);
		Info_AddChoice (Info_Mod_Albrecht_TEACHPalRunes,DIALOG_BACK,Info_Mod_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice	(Info_Mod_Albrecht_TEACHPalRunes, B_BuildLearnString ("Böses vernichten", CostForPalSpells) ,Info_Mod_Albrecht_TEACHPalRunes_PalDestroyEvil);
	}
	else
	{
		B_Albrecht_YouAreNotWorthy ();
	};
};


FUNC INT Info_Mod_Albrecht_TEACHPalRunes_PalLightHeal()
{
	if (other.lp < CostForPalSpells)
	{
		PrintScreen	(PRINT_NotEnoughLearnPoints, -1,-1, FONT_ScreenSmall ,2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
		
		return FALSE;
	};
	
	PLAYER_TALENT_RUNES [SPL_PalLightHeal] = TRUE;
	CreateInvItems (self,ItRu_PalLightHeal,1);
	B_GiveInvItems (self,other,ItRu_PalLightHeal,1);
	other.lp = (other.lp -CostForPalSpells);
	Info_ClearChoices   (Info_Mod_Albrecht_TEACHPalRunes); 

	return TRUE;
};

FUNC INT Info_Mod_Albrecht_TEACHPalRunes_PalMediumHeal()
{
	if (other.lp < CostForPalSpells)
	{
		PrintScreen	(PRINT_NotEnoughLearnPoints, -1,-1, FONT_ScreenSmall ,2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
		
		return FALSE;
	};
	PLAYER_TALENT_RUNES [SPL_PalMediumHeal] = TRUE;
	CreateInvItems (self,ItRu_PalMediumHeal,1);
	B_GiveInvItems (self,other,ItRu_PalMediumHeal,1); 
	other.lp = (other.lp -CostForPalSpells);
	return TRUE;
};

FUNC INT Info_Mod_Albrecht_TEACHPalRunes_PalFullHeal()
{
	if (other.lp < CostForPalSpells)
	{
		PrintScreen	(PRINT_NotEnoughLearnPoints, -1,-1, FONT_ScreenSmall ,2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
		
		return FALSE;
	};
	PLAYER_TALENT_RUNES [SPL_PalFullHeal] = TRUE;
	CreateInvItems (self,ItRu_PalFullHeal,1);
	B_GiveInvItems (self,other,ItRu_PalFullHeal,1); 
	other.lp = (other.lp -CostForPalSpells);
	return TRUE;
};

FUNC INT Info_Mod_Albrecht_TEACHPalRunes_PalHolyBolt()
{
	if (other.lp < CostForPalSpells)
	{
		PrintScreen	(PRINT_NotEnoughLearnPoints, -1,-1, FONT_ScreenSmall ,2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
		
		return FALSE;
	};
	
	PLAYER_TALENT_RUNES [SPL_PalHolyBolt] = TRUE;
	CreateInvItems (self,ItRu_PalHolyBolt,1);
	B_GiveInvItems (self,other,ItRu_PalHolyBolt,1);  
	other.lp = (other.lp -CostForPalSpells);
	return TRUE;
};

FUNC INT Info_Mod_Albrecht_TEACHPalRunes_PalRepelEvil()
{
	if (other.lp < CostForPalSpells)
	{
		PrintScreen	(PRINT_NotEnoughLearnPoints, -1,-1, FONT_ScreenSmall ,2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
		
		return FALSE;
	};
	
	PLAYER_TALENT_RUNES [SPL_PalRepelEvil] = TRUE;
	CreateInvItems (self,ItRu_PalRepelEvil,1);
	B_GiveInvItems (self,other,ItRu_PalRepelEvil,1);
	other.lp = (other.lp -CostForPalSpells);
	return TRUE;
};

FUNC INT Info_Mod_Albrecht_TEACHPalRunes_PalDestroyEvil()
{
	if (other.lp < CostForPalSpells)
	{
		PrintScreen	(PRINT_NotEnoughLearnPoints, -1,-1, FONT_ScreenSmall ,2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
		
		return FALSE;
	};
	
	PLAYER_TALENT_RUNES [SPL_PalDestroyEvil] = TRUE;
	CreateInvItems (self,ItRu_PalDestroyEvil,1);
	B_GiveInvItems (self,other,ItRu_PalDestroyEvil,1);
	other.lp = (other.lp -CostForPalSpells);
	return TRUE;
};

instance Info_Mod_Albrecht_Teach		(C_INFO)
{
	npc		  	 = 	Mod_559_PAL_Albrecht_NW;
	nr			 = 	101;
	condition	 = 	Info_Mod_Albrecht_Teach_Condition;
	information	 = 	Info_Mod_Albrecht_Teach_Info;
	permanent	 = 	TRUE;
	description	 = 	"Ich will meine magische Kraft steigern.";
};
func int Info_Mod_Albrecht_Teach_Condition ()
{	
	if (Albrecht_TeachMANA == TRUE)
	&& (Mod_Schwierigkeit != 4)
	{
		return TRUE;
	};
};
func void Info_Mod_Albrecht_Teach_Info ()
{
	AI_Output (other, self, "Info_Mod_Albrecht_Teach_15_00"); //Ich will meine magische Kraft steigern.
	
	
	Info_ClearChoices   (Info_Mod_Albrecht_Teach);
	Info_AddChoice 		(Info_Mod_Albrecht_Teach, DIALOG_BACK, Info_Mod_Albrecht_Teach_BACK);
	Info_AddChoice		(Info_Mod_Albrecht_Teach, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(other, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Albrecht_Teach_5);
	Info_AddChoice		(Info_Mod_Albrecht_Teach, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Albrecht_Teach_1);
};
func void Info_Mod_Albrecht_Teach_BACK()
{
	if (other.attribute [ATR_MANA_MAX] >= T_MED)
	{
		AI_Output (self, other, "Info_Mod_Albrecht_Teach_03_00"); //Wenn du deine magische Kraft weiter steigern willst, musst du dir einen anderen Lehrer suchen.
	};
	Info_ClearChoices (Info_Mod_Albrecht_TEACH);
};
func void Info_Mod_Albrecht_Teach_1()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_MED);
	
	Info_ClearChoices   (Info_Mod_Albrecht_Teach);
	
	Info_AddChoice 		(Info_Mod_Albrecht_Teach, DIALOG_BACK, Info_Mod_Albrecht_TEACH_BACK);
	Info_AddChoice		(Info_Mod_Albrecht_Teach, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(other, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Albrecht_Teach_5);
	Info_AddChoice		(Info_Mod_Albrecht_Teach, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Albrecht_Teach_1);
	
	
};
func void Info_Mod_Albrecht_Teach_5()
{
	B_TeachAttributePoints_New (self, other, ATR_MANA_MAX, 5, T_MED);
	
	Info_ClearChoices   (Info_Mod_Albrecht_Teach);
	
	Info_AddChoice 		(Info_Mod_Albrecht_Teach, DIALOG_BACK, Info_Mod_Albrecht_Teach_BACK);
	Info_AddChoice		(Info_Mod_Albrecht_Teach, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(other, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Albrecht_Teach_5);
	Info_AddChoice		(Info_Mod_Albrecht_Teach, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Albrecht_Teach_1);
	
	
};

INSTANCE Info_Mod_Albrecht_Pickpocket (C_INFO)
{
	npc		= Mod_559_PAL_Albrecht_NW;
	nr		= 1;
	condition	= Info_Mod_Albrecht_Pickpocket_Condition;
	information	= Info_Mod_Albrecht_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_100;
};

FUNC INT Info_Mod_Albrecht_Pickpocket_Condition()
{
	C_Beklauen	(90, ItMi_Gold, 700);
};

FUNC VOID Info_Mod_Albrecht_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Albrecht_Pickpocket);

	Info_AddChoice	(Info_Mod_Albrecht_Pickpocket, DIALOG_BACK, Info_Mod_Albrecht_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Albrecht_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Albrecht_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Albrecht_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Albrecht_Pickpocket);
};

FUNC VOID Info_Mod_Albrecht_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Albrecht_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Albrecht_Pickpocket);

		Info_AddChoice	(Info_Mod_Albrecht_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Albrecht_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Albrecht_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Albrecht_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Albrecht_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Albrecht_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Albrecht_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Albrecht_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Albrecht_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Albrecht_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Albrecht_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Albrecht_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Albrecht_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Albrecht_EXIT (C_INFO)
{
	npc		= Mod_559_PAL_Albrecht_NW;
	nr		= 1;
	condition	= Info_Mod_Albrecht_EXIT_Condition;
	information	= Info_Mod_Albrecht_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Albrecht_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Albrecht_EXIT_Info()
{
	AI_Output(self, hero, "Info_Mod_Albrecht_EXIT_03_00"); //Für den König!
	
	AI_StopProcessInfos	(self);
};