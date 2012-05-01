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

FUNC VOID Info_Mod_Aabid_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Aabid_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Aabid_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Aabid_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
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