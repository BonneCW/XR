INSTANCE Info_Mod_Roscoe_Hi (C_INFO)
{
	npc		= Mod_1290_SLD_Roscoe_MT;
	nr		= 1;
	condition	= Info_Mod_Roscoe_Hi_Condition;
	information	= Info_Mod_Roscoe_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie mir scheint hast du jetzt Lares Platz eingenommen.";
};

FUNC INT Info_Mod_Roscoe_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Roscoe_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Roscoe_Hi_15_00"); //Wie mir scheint hast du jetzt Lares Platz eingenommen.
	AI_Output(self, hero, "Info_Mod_Roscoe_Hi_10_01"); //Richtig, solange er in Khorinis ist, bin ich für die Dinge zuständig, die etwas Finesse benötigen.
	AI_Output(hero, self, "Info_Mod_Roscoe_Hi_15_02"); //Was heißt ...?
	AI_Output(self, hero, "Info_Mod_Roscoe_Hi_10_03"); //Nun, das Sammeln nützlicher Informationen und das planen etwas diskreter Einsätze, wenn du verstehst.
	AI_Output(self, hero, "Info_Mod_Roscoe_Hi_10_04"); //Und Lernwillige, die unserem Lager angehören, kann ich sicherlich das eine oder andere Diebstalent lehren.
};

INSTANCE Info_Mod_Roscoe_SentenzaSchwert (C_INFO)
{
	npc		= Mod_1290_SLD_Roscoe_MT;
	nr		= 1;
	condition	= Info_Mod_Roscoe_SentenzaSchwert_Condition;
	information	= Info_Mod_Roscoe_SentenzaSchwert_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Roscoe_SentenzaSchwert_Condition()
{
	if (Mod_NL_BruceTot == 3)
	&& (Npc_IsDead(Mod_796_SLD_Sentenza_MT))
	&& (Npc_IsDead(Mod_779_SLD_Bullco_MT))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Roscoe_SentenzaSchwert_Info()
{
	AI_Output(self, hero, "Info_Mod_Roscoe_SentenzaSchwert_10_00"); //Tja, unauffällig vor der Taverne saufen war nicht unauffällig genug.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");

	self.aivar[AIV_Partymember] = FALSE;
};

INSTANCE Info_Mod_Roscoe_Lernen (C_INFO)
{
	npc		= Mod_1290_SLD_Roscoe_MT;
	nr		= 1;
	condition	= Info_Mod_Roscoe_Lernen_Condition;
	information	= Info_Mod_Roscoe_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Bring mir was bei.";
};

FUNC INT Info_Mod_Roscoe_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Roscoe_Hi))
	&& (hero.guild == GIL_MIL)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Roscoe_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Roscoe_Lernen_15_00"); //Bring mir was bei.
	AI_Output(self, hero, "Info_Mod_Roscoe_Lernen_10_01"); //Was willst du lernen?

	Info_ClearChoices	(Info_Mod_Roscoe_Lernen);

	Info_AddChoice 		(Info_Mod_Roscoe_Lernen, DIALOG_BACK, Info_Mod_Roscoe_Lernen_BACK);

	if (Npc_GetTalentSkill (hero, NPC_TALENT_PICKPOCKET) == FALSE)
	{
		Info_AddChoice		(Info_Mod_Roscoe_Lernen, B_BuildLearnString("Taschendiebstahl", B_GetLearnCostTalent(hero, NPC_TALENT_PICKPOCKET, 1)), Info_Mod_Roscoe_Lernen_Pickpocket);
	};
	if (Npc_GetTalentSkill (hero, NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice		(Info_Mod_Roscoe_Lernen, B_BuildLearnString("Schlösser knacken", B_GetLearnCostTalent(hero, NPC_TALENT_PICKLOCK, 1)), Info_Mod_Roscoe_Lernen_Picklock);
	};
	if (Npc_GetTalentSkill (hero, NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice		(Info_Mod_Roscoe_Lernen, B_BuildLearnString("Schleichen", B_GetLearnCostTalent(hero, NPC_TALENT_SNEAK, 1)), Info_Mod_Roscoe_Lernen_Sneak);
	};
};

FUNC VOID Info_Mod_Roscoe_Lernen_BACK()
{
	Info_ClearChoices (Info_Mod_Roscoe_Lernen);
};

FUNC VOID Info_Mod_Roscoe_Lernen_Pickpocket()
{
	B_TeachThiefTalent (self, hero, NPC_TALENT_PICKPOCKET);
};

FUNC VOID Info_Mod_Roscoe_Lernen_Picklock()
{
	B_TeachThiefTalent (self, hero, NPC_TALENT_PICKLOCK);
};

FUNC VOID Info_Mod_Roscoe_Lernen_Sneak()
{
	B_TeachThiefTalent (self, hero, NPC_TALENT_SNEAK);
};

INSTANCE Info_Mod_Roscoe_Pickpocket (C_INFO)
{
	npc		= Mod_1290_SLD_Roscoe_MT;
	nr		= 1;
	condition	= Info_Mod_Roscoe_Pickpocket_Condition;
	information	= Info_Mod_Roscoe_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Roscoe_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Roscoe_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Roscoe_Pickpocket);

	Info_AddChoice	(Info_Mod_Roscoe_Pickpocket, DIALOG_BACK, Info_Mod_Roscoe_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Roscoe_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Roscoe_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Roscoe_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Roscoe_Pickpocket);
};

FUNC VOID Info_Mod_Roscoe_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Roscoe_Pickpocket);
};

INSTANCE Info_Mod_Roscoe_EXIT (C_INFO)
{
	npc		= Mod_1290_SLD_Roscoe_MT;
	nr		= 1;
	condition	= Info_Mod_Roscoe_EXIT_Condition;
	information	= Info_Mod_Roscoe_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Roscoe_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Roscoe_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};