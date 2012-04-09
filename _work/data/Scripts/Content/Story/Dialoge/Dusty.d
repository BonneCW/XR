INSTANCE Info_Mod_Dusty_Hi (C_INFO)
{
	npc		= Mod_1724_PSINOV_Dusty_NW;
	nr		= 1;
	condition	= Info_Mod_Dusty_Hi_Condition;
	information	= Info_Mod_Dusty_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Dusty_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Dusty_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Dusty_Hi_14_00"); //Du hier? Ich dachte du wärst bei dem Versuch den Schläfer zu töten gestorben.
	AI_Output(hero, self, "Info_Mod_Dusty_Hi_15_01"); //Das ist eine lange Geschichte, aber was machst du hier?
	AI_Output(self, hero, "Info_Mod_Dusty_Hi_14_02"); //Ich bin hier um zu jagen. Bringt orderntlich Gold, wenn man die ganzen Jagdtrophäen verkauft.
	AI_Output(self, hero, "Info_Mod_Dusty_Hi_14_03"); //Wenn du willst, dann zeig ich dir ein paar Sachen, schließlich hast du mir damals in der Kolonie geholfen.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_KHORINIS, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_KHORINIS, "Dusty kann mir ein paar Jagdtrophäen beibringen.");
};

INSTANCE Info_Mod_Dusty_Infos (C_INFO)
{
	npc		= Mod_1724_PSINOV_Dusty_NW;
	nr		= 1;
	condition	= Info_Mod_Dusty_Infos_Condition;
	information	= Info_Mod_Dusty_Infos_Info;
	permanent	= 0;
	important	= 0;
	description	= "Weißt du was über die Schläferanhänger hier in der Gegend?";
};

FUNC INT Info_Mod_Dusty_Infos_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_Fanatiker))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Andre_Erfahrung_Fanatiker))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dusty_Infos_Info()
{
	AI_Output(hero, self, "Info_Mod_Dusty_Infos_15_00"); //Weißt du was über die Schläferanhänger hier in der Gegend?
	AI_Output(self, hero, "Info_Mod_Dusty_Infos_14_01"); //Ja, ich hab ein paar gesehen. Es waren zwei kleine Gruppen.
	AI_Output(hero, self, "Info_Mod_Dusty_Infos_15_02"); //Wo kann ich sie finden?
	AI_Output(self, hero, "Info_Mod_Dusty_Infos_14_03"); //Ich kann mich nicht mehr erinnern. Besorg mir einen Sumpfkrautstengel, dann sollte es wieder gehen.

	B_LogEntry	(TOPIC_MOD_MILIZ_SEKTENSPINNER, "Bevor Dusty mir sagen kann, wo sich die Schläferanhänger aufhalten, soll ich ihm einen Sumpfkrautstengel bringen.");
};

INSTANCE Info_Mod_Dusty_Kippe (C_INFO)
{
	npc		= Mod_1724_PSINOV_Dusty_NW;
	nr		= 1;
	condition	= Info_Mod_Dusty_Kippe_Condition;
	information	= Info_Mod_Dusty_Kippe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier hast du dein Sumpfkraut.";
};

FUNC INT Info_Mod_Dusty_Kippe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dusty_Infos))
	&& (Npc_HasItems(hero, ItMi_Joint) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dusty_Kippe_Info()
{
	AI_Output(hero, self, "Info_Mod_Dusty_Kippe_15_00"); //Hier hast du dein Sumpfkraut.
	
	B_GiveInvItems	(hero, self, ItMi_Joint, 1);

	B_UseItem	(self, ItMi_Joint);

	AI_Output(self, hero, "Info_Mod_Dusty_Kippe_14_01"); //Ah, sehr schön. Ich erinnere mich.
	AI_Output(hero, self, "Info_Mod_Dusty_Kippe_15_02"); //Dann sag mir wo ich die Fanatiker finde.
	AI_Output(self, hero, "Info_Mod_Dusty_Kippe_14_03"); //Die eine Gruppe hat sich beim Leuchtturm niedergelassen. Das ist die größere Gruppe. Wenn du dort hingehst, musst du sehr vorsichtig sein.
	AI_Output(self, hero, "Info_Mod_Dusty_Kippe_14_04"); //Die andere Gruppe ist in einer Höhle im Wald südlich der Stadt. Dort solltest du zuerst vorbeischauen.
	AI_Output(self, hero, "Info_Mod_Dusty_Kippe_14_05"); //Den Leuchtturm lässt du besser mal noch bleiben, bevor du mehr herausgefunden hast.

	B_GivePlayerXP	(50);

	B_LogEntry	(TOPIC_MOD_MILIZ_SEKTENSPINNER, "Dusty hat mir gesagt, dass die eine Gruppe ihr Lager beim Leuchtturm hat, die andere in einer Höhle südlich der Stadt. Den Leuchtturm sollte ich noch in Ruhe lassen, bis ich mehr weiß.");
};

INSTANCE Info_Mod_Dusty_Crawlersekret (C_INFO)
{
	npc		= Mod_1724_PSINOV_Dusty_NW;
	nr		= 1;
	condition	= Info_Mod_Dusty_Crawlersekret_Condition;
	information	= Info_Mod_Dusty_Crawlersekret_Info;
	permanent	= 0;
	important	= 0;
	description	= "Woher könnte ich starkes Minecrawler-Sekret bekommen?";
};

FUNC INT Info_Mod_Dusty_Crawlersekret_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_Lehrling))
	&& (Mod_MinecrawlerEi >= 0)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Constantino_Stimme))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dusty_Crawlersekret_Info()
{
	AI_Output(hero, self, "Info_Mod_Dusty_Crawlersekret_15_00"); //Woher könnte ich starkes Minecrawler-Sekret bekommen?
	AI_Output(self, hero, "Info_Mod_Dusty_Crawlersekret_14_01"); //Ich habe von den anderen Jägern gehört, dass im Norden Minecrawler gesichtet wurden.
	AI_Output(self, hero, "Info_Mod_Dusty_Crawlersekret_14_02"); //Wenn du Glück hast, dann gibt es dort auch eine Königin, deren Eier zu stehlen kannst, um daraus das Sekret zu gewinnen.
};

INSTANCE Info_Mod_Dusty_OtherHunters (C_INFO)
{
	npc		= Mod_1724_PSINOV_Dusty_NW;
	nr		= 1;
	condition	= Info_Mod_Dusty_OtherHunters_Condition;
	information	= Info_Mod_Dusty_OtherHunters_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir sagen, wo ich noch andere Jäger finde?";
};

FUNC INT Info_Mod_Dusty_OtherHunters_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dusty_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Dragomir_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dusty_OtherHunters_Info()
{
	AI_Output(hero, self, "Info_Mod_Dusty_OtherHunters_15_00"); //Kannst du mir sagen, wo ich noch andere Jäger finde?
	AI_Output(self, hero, "Info_Mod_Dusty_OtherHunters_14_01"); //Bei der Taverne lagern noch welche, glaube ich.
	AI_Output(hero, self, "Info_Mod_Dusty_OtherHunters_15_02"); //Danke, Mann.
};

INSTANCE Info_Mod_Dusty_Lernen (C_INFO)
{
	npc		= Mod_1724_PSINOV_Dusty_NW;
	nr          	= 1;
	condition	= Info_Mod_Dusty_Lernen_Condition;
	information	= Info_Mod_Dusty_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Was kannst du mir beibringen?";
};

FUNC INT Info_Mod_Dusty_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dusty_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dusty_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Dusty_Lernen_15_00"); //Was kannst du mir beibringen?

	if ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE))
	{
		AI_Output(self, hero, "Info_Mod_Dusty_Lernen_14_01"); //Kommt darauf an, was du wissen willst.

		Info_ClearChoices	(Info_Mod_Dusty_Lernen);

		Info_AddChoice	(Info_Mod_Dusty_Lernen, DIALOG_BACK, Info_Mod_Dusty_Lernen_BACK);

		if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
		{ 
			Info_AddChoice	(Info_Mod_Dusty_Lernen, B_BuildLearnString ("Zähne reissen",B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)), Info_Mod_Dusty_Lernen_Teeth);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
		{ 
			Info_AddChoice	(Info_Mod_Dusty_Lernen, B_BuildLearnString ("Klauen hacken",B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Claws)), Info_Mod_Dusty_Lernen_Claws);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE)
		{ 
			Info_AddChoice	(Info_Mod_Dusty_Lernen, B_BuildLearnString("Fliegenstachel", B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFSting)), Info_Mod_Dusty_Lernen_BFSting);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
		{ 
			Info_AddChoice	(Info_Mod_Dusty_Lernen, B_BuildLearnString ("Fell abziehen",B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Fur)), Info_Mod_Dusty_Lernen_Fur);
		};
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Dusty_Lernen_14_02"); //Ich kann dir im Moment nicht mehr beibringen, als du ohnehin schon weißt. Tut mir Leid.
	};
};

FUNC void Info_Mod_Dusty_Lernen_BACK()
{
	Info_ClearChoices (Info_Mod_Dusty_Lernen);
};

FUNC void Info_Mod_Dusty_Lernen_Claws()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_Claws))
	{
		AI_Output(self, hero, "Info_Mod_Dusty_Lernen_Claws_14_00"); //Tiere geben ihre Klauen nicht sehr gerne her. Du musst schon sehr genau den Punkt treffen, an dem du mit deinem Messer ansetzt.
		AI_Output(self, hero, "Info_Mod_Dusty_Lernen_Claws_14_01"); //Die Haltung deiner Hand sollte etwas verschränkt sein. Mit einem kräftigen Ruck trennst du dann die Klaue ab.
		AI_Output(self, hero, "Info_Mod_Dusty_Lernen_Claws_14_02"); //Klauen sind immer ein begehrtes Zahlungsmittel bei einem Händler.
	};

	Info_ClearChoices	(Info_Mod_Dusty_Lernen);

	Info_AddChoice	(Info_Mod_Dusty_Lernen, DIALOG_BACK, Info_Mod_Dusty_Lernen_BACK);

	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
	{ 
		Info_AddChoice	(Info_Mod_Dusty_Lernen, B_BuildLearnString ("Zähne reissen",B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)), Info_Mod_Dusty_Lernen_Teeth);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
	{ 
		Info_AddChoice	(Info_Mod_Dusty_Lernen, B_BuildLearnString ("Klauen hacken",B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Claws)), Info_Mod_Dusty_Lernen_Claws);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE)
	{ 
		Info_AddChoice	(Info_Mod_Dusty_Lernen, B_BuildLearnString("Fliegenstachel", B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFSting)), Info_Mod_Dusty_Lernen_BFSting);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{ 
		Info_AddChoice	(Info_Mod_Dusty_Lernen, B_BuildLearnString ("Fell abziehen",B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Fur)), Info_Mod_Dusty_Lernen_Fur);
	};
		
};

FUNC void Info_Mod_Dusty_Lernen_Teeth()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_Teeth))
	{
		AI_Output(self, hero, "Info_Mod_Dusty_Lernen_Teeth_14_00"); //Das einfachste, was du Tieren entnehmen kannst, sind seine Zähne. Du fährst mit deinem Messer in seinem Maul um das Gebiss.
		AI_Output(self, hero, "Info_Mod_Dusty_Lernen_Teeth_14_01"); //Dann trennst es geschickt mit einem Ruck vom Schädel des Tieres.
	};

	Info_ClearChoices	(Info_Mod_Dusty_Lernen);

	Info_AddChoice	(Info_Mod_Dusty_Lernen, DIALOG_BACK, Info_Mod_Dusty_Lernen_BACK);

	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
	{ 
		Info_AddChoice	(Info_Mod_Dusty_Lernen, B_BuildLearnString ("Zähne reissen",B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)), Info_Mod_Dusty_Lernen_Teeth);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
	{ 
		Info_AddChoice	(Info_Mod_Dusty_Lernen, B_BuildLearnString ("Klauen hacken",B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Claws)), Info_Mod_Dusty_Lernen_Claws);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE)
	{ 
		Info_AddChoice	(Info_Mod_Dusty_Lernen, B_BuildLearnString("Fliegenstachel", B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFSting)), Info_Mod_Dusty_Lernen_BFSting);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{ 
		Info_AddChoice	(Info_Mod_Dusty_Lernen, B_BuildLearnString ("Fell abziehen",B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Fur)), Info_Mod_Dusty_Lernen_Fur);
	};
};

FUNC void Info_Mod_Dusty_Lernen_BFSting()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_BFSting))
	{
		AI_Output(self, hero, "Info_Mod_Dusty_Lernen_BFSting_07_00"); //Die Fliege hat am Rücken eine weiche Stelle.
		AI_Output(self, hero, "Info_Mod_Dusty_Lernen_BFSting_07_01"); //Wenn du dort mit der Hand gegen drückst, fährt der Stachel sehr weit aus und du kannst ihn mit dem Messer abtrennen.
	};

	Info_ClearChoices	(Info_Mod_Dusty_Lernen);

	Info_AddChoice	(Info_Mod_Dusty_Lernen, DIALOG_BACK, Info_Mod_Dusty_Lernen_BACK);

	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
	{ 
		Info_AddChoice	(Info_Mod_Dusty_Lernen, B_BuildLearnString ("Zähne reissen",B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)), Info_Mod_Dusty_Lernen_Teeth);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
	{ 
		Info_AddChoice	(Info_Mod_Dusty_Lernen, B_BuildLearnString ("Klauen hacken",B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Claws)), Info_Mod_Dusty_Lernen_Claws);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE)
	{ 
		Info_AddChoice	(Info_Mod_Dusty_Lernen, B_BuildLearnString("Fliegenstachel", B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFSting)), Info_Mod_Dusty_Lernen_BFSting);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{ 
		Info_AddChoice	(Info_Mod_Dusty_Lernen, B_BuildLearnString ("Fell abziehen",B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Fur)), Info_Mod_Dusty_Lernen_Fur);
	};
};

FUNC void Info_Mod_Dusty_Lernen_Fur()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_Fur))
	{
		AI_Output(self, hero, "Info_Mod_Dusty_Lernen_Fur_14_00"); //Felle ziehst du am besten ab, indem du einen tiefen Schnitt an den Hinterläufen des Tieres vornimmst.
		AI_Output(self, hero, "Info_Mod_Dusty_Lernen_Fur_14_01"); //Dann kannst du das Fell von vorne nach hinten eigentlich immer sehr leicht abziehen.
	};

	Info_ClearChoices	(Info_Mod_Dusty_Lernen);

	Info_AddChoice	(Info_Mod_Dusty_Lernen, DIALOG_BACK, Info_Mod_Dusty_Lernen_BACK);

	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
	{ 
		Info_AddChoice	(Info_Mod_Dusty_Lernen, B_BuildLearnString ("Zähne reissen",B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)), Info_Mod_Dusty_Lernen_Teeth);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
	{ 
		Info_AddChoice	(Info_Mod_Dusty_Lernen, B_BuildLearnString ("Klauen hacken",B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Claws)), Info_Mod_Dusty_Lernen_Claws);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE)
	{ 
		Info_AddChoice	(Info_Mod_Dusty_Lernen, B_BuildLearnString("Fliegenstachel", B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFSting)), Info_Mod_Dusty_Lernen_BFSting);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{ 
		Info_AddChoice	(Info_Mod_Dusty_Lernen, B_BuildLearnString ("Fell abziehen",B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Fur)), Info_Mod_Dusty_Lernen_Fur);
	};
};

INSTANCE Info_Mod_Dusty_EXIT (C_INFO)
{
	npc		= Mod_1724_PSINOV_Dusty_NW;
	nr		= 1;
	condition	= Info_Mod_Dusty_EXIT_Condition;
	information	= Info_Mod_Dusty_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Dusty_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Dusty_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};