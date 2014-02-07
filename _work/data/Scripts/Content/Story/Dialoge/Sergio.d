INSTANCE Info_Mod_Sergio_Dragon (C_INFO)
{
	npc		= Mod_924_RIT_Sergio_NW;
	nr		= 1;
	condition	= Info_Mod_Sergio_Dragon_Condition;
	information	= Info_Mod_Sergio_Dragon_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was machst du denn hier?";
};

FUNC INT Info_Mod_Sergio_Dragon_Condition()
{
	if (Mod_NL_HasKamm >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sergio_Dragon_Info()
{
	AI_Output(hero, self, "Info_Mod_Sergio_Dragon_15_00"); //Was machst du denn hier? Bist du nicht der Paladin aus dem Kloster?
	AI_Output(self, hero, "Info_Mod_Sergio_Dragon_04_01"); //(in sein Schicksal ergeben) Ja, der bin ich. Ich bin hier, um meine Ehre wiederzugewinnen.
	AI_Output(self, hero, "Info_Mod_Sergio_Dragon_04_02"); //Bei dem Angriff der Dämonen auf das Kloster, zog ich mich mit den anderen in die inneren Räumlichkeiten zurück, anstatt weiter gegen die Bestien zu kämpfen.
	AI_Output(self, hero, "Info_Mod_Sergio_Dragon_04_03"); //Hier habe ich nun diese abscheulichen Geschöpfe ausfindig gemacht und sammle nun Kraft im Gebet, bevor ich gegen sie in den Kampf ziehe.
	AI_Output(hero, self, "Info_Mod_Sergio_Dragon_15_04"); //Auch ich sinne auf die Vernichtung dieser Geschöpfe. Ich treffe aber noch Vorbereitungen, um den Erfolg dieser Mission zu gewährleisten.
	AI_Output(self, hero, "Info_Mod_Sergio_Dragon_04_05"); //(hoffnungsvoll) Wirklich? Wenn es so weit ist, wird es mir eine Ehre sein, an deiner Seite zu kämpfen. Für Innos!

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Sergio_FeuerGegenEis (C_INFO)
{
	npc		= Mod_924_RIT_Sergio_NW;
	nr		= 1;
	condition	= Info_Mod_Sergio_FeuerGegenEis_Condition;
	information	= Info_Mod_Sergio_FeuerGegenEis_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Sergio_FeuerGegenEis_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hyglas_FeuerGegenEis2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sergio_FeuerGegenEis_Info()
{
	AI_Output(self, hero, "Info_Mod_Sergio_FeuerGegenEis_04_00"); //Verdammt, es waren einfach zu viele. Ich habe versagt und die Novizen nicht vor ihrem Verderben bewahrt.
	AI_Output(self, hero, "Info_Mod_Sergio_FeuerGegenEis_04_01"); //(zischt und setzt sich) Ahh, mein Bein.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ATSEE2");
	B_SetAivar	(self, AIV_INVINCIBLE, FALSE);
};

INSTANCE Info_Mod_Sergio_Pickpocket (C_INFO)
{
	npc		= Mod_924_RIT_Sergio_NW;
	nr		= 1;
	condition	= Info_Mod_Sergio_Pickpocket_Condition;
	information	= Info_Mod_Sergio_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_150;
};

FUNC INT Info_Mod_Sergio_Pickpocket_Condition()
{
	C_Beklauen	(139, ItMi_Gold, 66);
};

FUNC VOID Info_Mod_Sergio_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Sergio_Pickpocket);

	Info_AddChoice	(Info_Mod_Sergio_Pickpocket, DIALOG_BACK, Info_Mod_Sergio_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Sergio_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Sergio_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Sergio_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Sergio_Pickpocket);
};

FUNC VOID Info_Mod_Sergio_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Sergio_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Sergio_Pickpocket);

		Info_AddChoice	(Info_Mod_Sergio_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Sergio_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Sergio_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Sergio_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Sergio_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Sergio_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Sergio_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Sergio_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Sergio_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Sergio_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Sergio_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Sergio_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Sergio_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Sergio_EXIT (C_INFO)
{
	npc		= Mod_924_RIT_Sergio_NW;
	nr		= 1;
	condition	= Info_Mod_Sergio_EXIT_Condition;
	information	= Info_Mod_Sergio_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Sergio_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Sergio_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};