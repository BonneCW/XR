INSTANCE Info_Mod_Lothar_Hi (C_INFO)
{
	npc		= Mod_539_PAL_Lothar_NW;
	nr		= 1;
	condition	= Info_Mod_Lothar_Hi_Condition;
	information	= Info_Mod_Lothar_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lothar_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Lothar_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Lothar_Hi_01_00"); //Ein neues Gesicht im oberen Viertel?
	AI_Output(self, hero, "Info_Mod_Lothar_Hi_01_01"); //Benimm' dich nur, die reichen Leute hier mögen es nicht, wenn man für Unruhe sorgt.
};

INSTANCE Info_Mod_Lothar_News (C_INFO)
{
	npc		= Mod_539_PAL_Lothar_NW;
	nr		= 1;
	condition	= Info_Mod_Lothar_News_Condition;
	information	= Info_Mod_Lothar_News_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ist hier irgendetwas Interessantes passiert?";
};

FUNC INT Info_Mod_Lothar_News_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lothar_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lothar_News_Info()
{
	AI_Output(hero, self, "Info_Mod_Lothar_News_15_00"); //Ist hier irgendetwas Interessantes passiert?
	AI_Output(self, hero, "Info_Mod_Lothar_News_01_01"); //Nichts, was jemanden wie dich etwas angehen würde. Allerdings, wenn du mir ein Bier bringen würdest, dann ...
	AI_Output(hero, self, "Info_Mod_Lothar_News_15_02"); //Verstehe.
};

INSTANCE Info_Mod_Lothar_Bier (C_INFO)
{
	npc		= Mod_539_PAL_Lothar_NW;
	nr		= 1;
	condition	= Info_Mod_Lothar_Bier_Condition;
	information	= Info_Mod_Lothar_Bier_Info;
	permanent	= 0;
	important	= 0;
	description	= "Nimm ein Bier (Bier geben)";
};

FUNC INT Info_Mod_Lothar_Bier_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lothar_News))
	&& (Npc_HasItems(hero, ItFo_Beer) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lothar_Bier_Info()
{
	AI_Output(hero, self, "Info_Mod_Lothar_Bier_15_00"); //Nimm ein Bier.
	
	B_GiveInvItems	(hero, self, ItFo_Beer, 1);

	B_UseItem	(self, ItFo_Beer);

	AI_Output(self, hero, "Info_Mod_Lothar_Bier_01_01"); //Danke.
	AI_Output(hero, self, "Info_Mod_Lothar_Bier_15_02"); //Gibt es jetzt irgendwelche Neuigkeiten?
	AI_Output(self, hero, "Info_Mod_Lothar_Bier_01_03"); //Da du mir ein Bier gebracht hast, werde ich dir etwas erzählen.
	AI_Output(self, hero, "Info_Mod_Lothar_Bier_01_04"); //Vor ein paar Tagen wurde unser wertvollster Besitz, ein Kristall, geklaut. Wir vermuten, dass die Diebe dahinterstecken.
	AI_Output(self, hero, "Info_Mod_Lothar_Bier_01_05"); //Ein Mitglied der Diebesgilde heißt Diego, doch wir können ihm nichts anhaben, da er unter dem Schutz der Wassermagier steht.

	Log_CreateTopic	(TOPIC_MOD_DIEGO_KRISTALL, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_DIEGO_KRISTALL, LOG_RUNNING);

	if (Npc_KnowsInfo(hero, Info_Mod_Torlof_Auftrag))
	{
		B_LogEntry_More	(TOPIC_MOD_TORLOFSPIONAGE, TOPIC_MOD_DIEGO_KRISTALL, "Der Paladin Lothar hat mir gesagt, dass sie einen wertvollen Kristall vermissen. Dieser Kristall wird mir helfen Söldner zu werden.", "Ein wertvoller Kristall der Paladine wurde gestohlen. Diego soll etwas darüber wissen. Ich sollte ihn aufsuchen.");
	}
	else
	{
		B_LogEntry	(TOPIC_MOD_DIEGO_KRISTALL, "Ein wertvoller Kristall der Paladine wurde gestohlen. Diego soll etwas darüber wissen. Ich sollte ihn aufsuchen.");
	};

	B_GivePlayerXP	(150);

	B_Göttergefallen(1, 1);
};

INSTANCE Info_Mod_Lothar_Kristall (C_INFO)
{
	npc		= Mod_539_PAL_Lothar_NW;
	nr		= 1;
	condition	= Info_Mod_Lothar_Kristall_Condition;
	information	= Info_Mod_Lothar_Kristall_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab hier euren Kristall.";
};

FUNC INT Info_Mod_Lothar_Kristall_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lothar_Bier))
	&& (Mod_Gilde	==	0)
	&& (Npc_HasItems(hero, Mod_PaladinKristall) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lothar_Kristall_Info()
{
	AI_Output(hero, self, "Info_Mod_Lothar_Kristall_15_00"); //Ich hab hier euren Kristall.

	B_GiveInvItems	(hero, self, Mod_PaladinKristall, 1);

	AI_Output(self, hero, "Info_Mod_Lothar_Kristall_01_01"); //Du hast also den Dieben ihre Beute abgenommen. Bring den Kristall zu Lord Andre, er wird dich in die Reihen der Miliz aufnehmen.

	B_GiveInvItems	(self, hero, Mod_PaladinKristall, 1);

	B_LogEntry	(TOPIC_MOD_MILIZ, "Lothar sagt, dass Lord Andre mich aufnehmen wird, wenn ich ihm den Kristall bringe.");

	B_Göttergefallen(1, 1);

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Lothar_Ornament (C_INFO)
{
	npc		= Mod_539_PAL_Lothar_NW;
	nr		= 1;
	condition	= Info_Mod_Lothar_Ornament_Condition;
	information	= Info_Mod_Lothar_Ornament_Info;
	permanent	= 0;
	important	= 0;
	description	= "Habt ihr ein Stück eines Steinringes?";
};

FUNC INT Info_Mod_Lothar_Ornament_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lothar_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Nefarius_VierErbauer))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lothar_Ornament_Info()
{
	AI_Output(hero, self, "Info_Mod_Lothar_Ornament_15_00"); //Habt ihr ein Stück eines Steinringes?
	AI_Output(self, hero, "Info_Mod_Lothar_Ornament_01_01"); //Mit alten Relikten der Stadt beschäftigt sich Larius, der Statthalter.

	B_LogEntry	(TOPIC_MOD_PORTAL, "Larius, der Statthalter, soll sich mit alten Relikten der Stadt befassen.");
};

INSTANCE Info_Mod_Lothar_Lehrer (C_INFO)
{
	npc		= Mod_539_PAL_Lothar_NW;
	nr		= 1;
	condition	= Info_Mod_Lothar_Lehrer_Condition;
	information	= Info_Mod_Lothar_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir was beibringen?";
};

FUNC INT Info_Mod_Lothar_Lehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lothar_Hi))
	&& (Mod_Gilde == 3)
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lothar_Lehrer_Info()
{
	B_Say	(hero, self, "$KANNSTDUMIRWASBEIBRINGEN");

	AI_Output(self, hero, "Info_Mod_Lothar_Lehrer_01_00"); //Ich kann dir helfen stärker zu werden.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_STADT, "Lothar kann mir helfen Stärker zu werden.");
};

INSTANCE Info_Mod_Lothar_Lernen (C_INFO)
{
	npc		= Mod_539_PAL_Lothar_NW;
	nr		= 1;
	condition	= Info_Mod_Lothar_Lernen_Condition;
	information	= Info_Mod_Lothar_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Bring mir was bei.";
};

FUNC INT Info_Mod_Lothar_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lothar_Lehrer))
	&& ((Mod_Gilde == 3)
	|| (Mod_Gilde == 4))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lothar_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Lothar_Lernen_15_00"); //Bring mir was bei.
	AI_Output(self, hero, "Info_Mod_Lothar_Lernen_01_01"); //Was willst du lernen?

	Info_ClearChoices	(Info_Mod_Lothar_Lernen);

	Info_AddChoice 		(Info_Mod_Lothar_Lernen, DIALOG_BACK, Info_Mod_Lothar_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Lothar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Lothar_Lernen_Staerke_5);
	Info_AddChoice		(Info_Mod_Lothar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Lothar_Lernen_Staerke_1);
};

FUNC VOID Info_Mod_Lothar_Lernen_BACK()
{
	Info_ClearChoices (Info_Mod_Lothar_Lernen);
};

FUNC VOID Info_Mod_Lothar_Lernen_Staerke_5()
{
	B_TeachAttributePoints_New (self, hero, ATR_STRENGTH, 5, 120);
	
	Info_ClearChoices	(Info_Mod_Lothar_Lernen);

	Info_AddChoice 		(Info_Mod_Lothar_Lernen, DIALOG_BACK, Info_Mod_Lothar_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Lothar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Lothar_Lernen_Staerke_5);
	Info_AddChoice		(Info_Mod_Lothar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Lothar_Lernen_Staerke_1);
};

FUNC VOID Info_Mod_Lothar_Lernen_Staerke_1()
{
	B_TeachAttributePoints (self, hero, ATR_STRENGTH, 1, 120);
	
	Info_ClearChoices	(Info_Mod_Lothar_Lernen);

	Info_AddChoice 		(Info_Mod_Lothar_Lernen, DIALOG_BACK, Info_Mod_Lothar_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Lothar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Lothar_Lernen_Staerke_5);
	Info_AddChoice		(Info_Mod_Lothar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Lothar_Lernen_Staerke_1);
};

INSTANCE Info_Mod_Lothar_Pickpocket (C_INFO)
{
	npc		= Mod_539_PAL_Lothar_NW;
	nr		= 1;
	condition	= Info_Mod_Lothar_Pickpocket_Condition;
	information	= Info_Mod_Lothar_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_100;
};

FUNC INT Info_Mod_Lothar_Pickpocket_Condition()
{
	C_Beklauen	(85, ItMi_Gold, 530);
};

FUNC VOID Info_Mod_Lothar_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Lothar_Pickpocket);

	Info_AddChoice	(Info_Mod_Lothar_Pickpocket, DIALOG_BACK, Info_Mod_Lothar_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Lothar_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Lothar_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Lothar_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Lothar_Pickpocket);
};

FUNC VOID Info_Mod_Lothar_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Lothar_Pickpocket);
};

INSTANCE Info_Mod_Lothar_EXIT (C_INFO)
{
	npc		= Mod_539_PAL_Lothar_NW;
	nr		= 1;
	condition	= Info_Mod_Lothar_EXIT_Condition;
	information	= Info_Mod_Lothar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Lothar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Lothar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};