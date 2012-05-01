INSTANCE Info_Mod_Raoul_Hi (C_INFO)
{
	npc		= Mod_794_SLD_Raoul_MT;
	nr		= 1;
	condition	= Info_Mod_Raoul_Hi_Condition;
	information	= Info_Mod_Raoul_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Seit wann schiebt ihr hier Wache?";
};

FUNC INT Info_Mod_Raoul_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Khaled_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raoul_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Raoul_Hi_15_00"); //Seit wann schiebt ihr hier Wache und warum dürfen jetzt keine aus dem Sumpflager mehr hinein, obwohl da einer drin sitzt?
	AI_Output(self, hero, "Info_Mod_Raoul_Hi_01_01"); //Tja, wir sind hier die Türsteher, seitdem die neue Regel erlassen wurde, dass in der Kneipe kein Sumpfkraut mehr geraucht werden darf, und somit auch keine Sumpffritzen rein dürfen.
	AI_Output(hero, self, "Info_Mod_Raoul_Hi_15_02"); //Und warum besteht dieses Verbot?
	AI_Output(self, hero, "Info_Mod_Raoul_Hi_01_03"); //Lee will den unkontrollierten Konsum von Sumpfkraut eindämmen, damit die Männer mehr trainieren.
	AI_Output(self, hero, "Info_Mod_Raoul_Hi_01_04"); //Und die anderen in der Kneipe sollen ja auch nicht durch den Sumpfkrautrauch in Mitleidenschaft gezogen werden, obwohl sie es vielleicht gar nicht wollen.
	AI_Output(self, hero, "Info_Mod_Raoul_Hi_01_05"); //Jetzt darf nur noch außerhalb der Kneipe geraucht werden, aber wer zu oft dabei erwischt wird, bekommt eine Rüge und extra Stunden Training. (leiser, zu sich selbst) Tja, jetzt muss man vors Lager gehen, um zu rauchen.
	AI_Output(hero, self, "Info_Mod_Raoul_Hi_15_06"); //Aber wieso ist der Typ aus dem Sumpflager ...
	AI_Output(self, hero, "Info_Mod_Raoul_Hi_01_07"); //Tja, der war schon drin, bevor die neue Regelung in Kraft trat. Und unsere Aufgabe ist es ja nur darauf zu achten, dass keiner von denen hineinkommt.
};

INSTANCE Info_Mod_Raoul_Pickpocket (C_INFO)
{
	npc		= Mod_794_SLD_Raoul_MT;
	nr		= 1;
	condition	= Info_Mod_Raoul_Pickpocket_Condition;
	information	= Info_Mod_Raoul_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Raoul_Pickpocket_Condition()
{
	C_Beklauen	(68, ItMi_Gold, 210);
};

FUNC VOID Info_Mod_Raoul_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Raoul_Pickpocket);

	Info_AddChoice	(Info_Mod_Raoul_Pickpocket, DIALOG_BACK, Info_Mod_Raoul_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Raoul_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Raoul_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Raoul_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Raoul_Pickpocket);
};

FUNC VOID Info_Mod_Raoul_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Raoul_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Raoul_Pickpocket);

		Info_AddChoice	(Info_Mod_Raoul_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Raoul_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Raoul_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Raoul_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Raoul_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Raoul_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Raoul_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Raoul_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Raoul_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Raoul_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Raoul_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Raoul_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Raoul_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Raoul_EXIT (C_INFO)
{
	npc		= Mod_794_SLD_Raoul_MT;
	nr		= 1;
	condition	= Info_Mod_Raoul_EXIT_Condition;
	information	= Info_Mod_Raoul_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Raoul_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Raoul_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};