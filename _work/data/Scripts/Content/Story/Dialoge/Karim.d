INSTANCE Info_Mod_Karim_Hi (C_INFO)
{
	npc		= Mod_7125_ASS_Karim_NW;
	nr		= 1;
	condition	= Info_Mod_Karim_Hi_Condition;
	information	= Info_Mod_Karim_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Karim_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sinbad_Training4))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Karim_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Karim_Hi_13_00"); //Da bist du ja.
	AI_Output(hero, self, "Info_Mod_Karim_Hi_15_01"); //Ich war mit Sinbad unterwegs. Was liegt an?
	AI_Output(self, hero, "Info_Mod_Karim_Hi_13_02"); //Hast du schon mal von den Blutkelchen gehört?
	AI_Output(hero, self, "Info_Mod_Karim_Hi_15_03"); //Ich habe für Amir schon mal einen besorgt. Vom Geldverleiher in Khorinis. Er ist tot.
	AI_Output(self, hero, "Info_Mod_Karim_Hi_13_04"); //Natürlich, sonst hätte der Kelch ja keinen Wert. Der Besitzer muss sterben, damit die Kelche ihre Wirkung erlangen.
	AI_Output(hero, self, "Info_Mod_Karim_Hi_15_05"); //Wieviele Kelche gibt es?
	AI_Output(self, hero, "Info_Mod_Karim_Hi_13_06"); //Es sind drei. Einen besitzt nach unseren Informationen der Richter in Khorinis. Nach genau diesem verlangt der große Rat.
	AI_Output(hero, self, "Info_Mod_Karim_Hi_15_07"); //Dann soll ich den Richter meucheln und den Kelch beibringen.
	AI_Output(self, hero, "Info_Mod_Karim_Hi_13_08"); //Schlauer Bursche. Wenn dir das gelingt, ist dir ein Platz bei den Anwärtern sicher,
	AI_Output(hero, self, "Info_Mod_Karim_Hi_15_09"); //Dann will ich mal ...

	Log_CreateTopic	(TOPIC_MOD_ASS_BLUTKELCH, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_BLUTKELCH, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ASS_BLUTKELCH, "Ich soll dem Rat den 2. Blutkelch besorgen. Der Richter in Khorinis hat ihn wahrscheinlich. Er muss sterben. Sollte kein Aufsehen erregen. Gift wäre das rechte Mittel für einen Assassinen. Hier war doch irgendwo ein Alchemist ...");
};

INSTANCE Info_Mod_Karim_Lehrer (C_INFO)
{
	npc		= Mod_7125_ASS_Karim_NW;
	nr		= 1;
	condition	= Info_Mod_Karim_Lehrer_Condition;
	information	= Info_Mod_Karim_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie heißt du denn?";
};

FUNC INT Info_Mod_Karim_Lehrer_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Karim_Lehrer_Info()
{
	AI_Output(hero, self, "Info_Mod_Karim_Lehrer_15_00"); //Wie heißt du denn?
	AI_Output(self, hero, "Info_Mod_Karim_Lehrer_13_01"); //Man nennt mich Karim. Du willst wohl was von mir?
	AI_Output(hero, self, "Info_Mod_Karim_Lehrer_15_02"); //Hast du denn was?
	AI_Output(self, hero, "Info_Mod_Karim_Lehrer_13_03"); //Nun, ich könnte dir was beibringen.
	AI_Output(hero, self, "Info_Mod_Karim_Lehrer_15_04"); //Aha. Und was hast du denn drauf?
	AI_Output(self, hero, "Info_Mod_Karim_Lehrer_13_05"); //Ich kann dir beibringen, wie man schleicht oder wie man jemand unauffällig von hinten meuchelt.
};

INSTANCE Info_Mod_Karim_Lernen_Schleichen (C_INFO)
{
	npc		= Mod_7125_ASS_Karim_NW;
	nr		= 1;
	condition	= Info_Mod_Karim_Lernen_Schleichen_Condition;
	information	= Info_Mod_Karim_Lernen_Schleichen_Info;
	permanent	= 1;
	important	= 0;
	description	= B_BuildLearnString("Schleichen", B_GetLearnCostTalent(other, NPC_TALENT_SNEAK, 1));
};

FUNC INT Info_Mod_Karim_Lernen_Schleichen_Condition()
{
	Info_Mod_Cavalorn_Lernen_Schleichen.description = B_BuildLearnString("Schleichen", B_GetLearnCostTalent(hero, NPC_TALENT_SNEAK, 1));

	if (Npc_KnowsInfo(hero, Info_Mod_Karim_Lehrer))
	&& (Npc_GetTalentSkill (hero, NPC_TALENT_SNEAK) == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Karim_Lernen_Schleichen_Info()
{
	AI_Output(hero, self, "Info_Mod_Karim_Lernen_Schleichen_15_00"); //Bring mir das Schleichen bei.

	if (B_TeachThiefTalent (self, hero, NPC_TALENT_SNEAK))
	{
		AI_Output(self, hero, "Info_Mod_Karim_Lernen_Schleichen_13_01"); //Mit weichen Sohlen hast du eine größere Chance, dich deinen Gegnern zu nähern, ohne dass sie es merken.
	};
};

INSTANCE Info_Mod_Karim_Lernen_Meucheln (C_INFO)
{
	npc		= Mod_7125_ASS_Karim_NW;
	nr		= 1;
	condition	= Info_Mod_Karim_Lernen_Meucheln_Condition;
	information	= Info_Mod_Karim_Lernen_Meucheln_Info;
	permanent	= 1;
	important	= 0;
	description	= B_BuildLearnString("Meucheln", B_GetLearnCostTalent(other, NPC_TALENT_SNEAK, 1));
};

FUNC INT Info_Mod_Karim_Lernen_Meucheln_Condition()
{
	if (Mod_Schwierigkeit == 4)
	{
		Info_Mod_Karim_Lernen_Meucheln.description = "Meucheln. Kosten: 1000 Gold";
	}
	else
	{
		Info_Mod_Karim_Lernen_Meucheln.description = "Meucheln. Kosten: 10 LP";
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Karim_Lehrer))
	&& (Delirium_Perk == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Karim_Lernen_Meucheln_Info()
{
	AI_Output(hero, self, "Info_Mod_Karim_Lernen_Meucheln_15_00"); //Bring mir das Meucheln bei.

	if ((Mod_Schwierigkeit == 4)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 1000))
	|| ((Mod_Schwierigkeit != 4)
	&& (hero.lp >= 10))
	{
		AI_Output(self, hero, "Info_Mod_Karim_Lernen_Meucheln_08_01"); //Ist wirklich gut. Du kannst so eine Person beseitigen, ohne dass es jemand bemerkt.
		AI_Output(self, hero, "Info_Mod_Karim_Lernen_Meucheln_08_02"); //Allerdings solltest du dazu deinen Dolch verwenden. Ein langes Schwert könnte doch von einer Person in der Nähe bemerkt werden.
		AI_Output(self, hero, "Info_Mod_Karim_Lernen_Meucheln_08_03"); //Hast du dann einen Dolch ausgerüstest gehst du hinter dein Opfer und tust, als wolltest du es ansprechen.
		AI_Output(self, hero, "Info_Mod_Karim_Lernen_Meucheln_08_04"); //Der Rest wird die wie von alleine von der Hand gehen.

		Delirium_Perk = TRUE;

		if (Mod_Schwierigkeit == 4)
		{
			Npc_RemoveInvItems	(hero, ItMi_Gold, 1000);
		}
		else
		{
			hero.lp -= 10;
		};
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Karim_Lernen_Meucheln_08_05"); //Komm wieder, wenn du dazu bereit bist.
	};
};

INSTANCE Info_Mod_Karim_Pickpocket (C_INFO)
{
	npc		= Mod_7125_ASS_Karim_NW;
	nr		= 1;
	condition	= Info_Mod_Karim_Pickpocket_Condition;
	information	= Info_Mod_Karim_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Karim_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Karim_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Karim_Pickpocket);

	Info_AddChoice	(Info_Mod_Karim_Pickpocket, DIALOG_BACK, Info_Mod_Karim_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Karim_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Karim_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Karim_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Karim_Pickpocket);
};

FUNC VOID Info_Mod_Karim_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Karim_Pickpocket);
};

INSTANCE Info_Mod_Karim_EXIT (C_INFO)
{
	npc		= Mod_7125_ASS_Karim_NW;
	nr		= 1;
	condition	= Info_Mod_Karim_EXIT_Condition;
	information	= Info_Mod_Karim_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Karim_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Karim_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};