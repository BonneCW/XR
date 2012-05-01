INSTANCE Info_Mod_Bret_Hi (C_INFO)
{
	npc		= Mod_7414_JG_Bret_NW;
	nr		= 1;
	condition	= Info_Mod_Bret_Hi_Condition;
	information	= Info_Mod_Bret_Hi_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Bret_Hi_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Jäger_Dabei == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bret_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Bret_Hi_08_00"); //Wenn du was von uns möchtest, geh zu Dragomir.
};

INSTANCE Info_Mod_Bret_PreJaeger (C_INFO)
{
	npc		= Mod_7414_JG_Bret_NW;
	nr		= 1;
	condition	= Info_Mod_Bret_PreJaeger_Condition;
	information	= Info_Mod_Bret_PreJaeger_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mach ich. Aber ich möchte auch was von dir wissen.";
};

FUNC INT Info_Mod_Bret_PreJaeger_Condition()
{
	if (Jäger_Dabei == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bret_PreJaeger_Info()
{
	AI_Output(hero, self, "Info_Mod_Bret_PreJaeger_15_00"); //Mach ich. Aber ich möchte auch was von dir wissen.
	AI_Output(self, hero, "Info_Mod_Bret_PreJaeger_08_01"); //Und das wäre?
	AI_Output(hero, self, "Info_Mod_Bret_PreJaeger_15_02"); //Wie kommst du hierher?
	AI_Output(self, hero, "Info_Mod_Bret_PreJaeger_08_03"); //Dumme Frage. Bin von der Stadt hergelaufen.
	AI_Output(hero, self, "Info_Mod_Bret_PreJaeger_15_04"); //Das meine ich nicht. Warum bist du in diesem Lager?
	AI_Output(self, hero, "Info_Mod_Bret_PreJaeger_08_05"); //Als ich alt genug war, hat mich Meister Bosper in die Lehre genommen.
	AI_Output(self, hero, "Info_Mod_Bret_PreJaeger_08_06"); //Genau so, wie meinen Bruder und früher meinen Vater.
	AI_Output(hero, self, "Info_Mod_Bret_PreJaeger_15_07"); //Dann bist du hier geboren?
	AI_Output(self, hero, "Info_Mod_Bret_PreJaeger_08_08"); //Ja, wie die meisten Jäger auf der Insel.
	AI_Output(self, hero, "Info_Mod_Bret_PreJaeger_08_09"); //Und nach der Lehre hab ich mich dem Trupp von Dragomir hier angeschlossen. Ist noch gar nicht so lange her.
	AI_Output(self, hero, "Info_Mod_Bret_PreJaeger_08_10"); //Willst du denn auch zu den Jägern?
	AI_Output(hero, self, "Info_Mod_Bret_PreJaeger_15_11"); //Weiß ich noch nicht. Mal sehen.
};

INSTANCE Info_Mod_Bret_Ambient (C_INFO)
{
	npc		= Mod_7414_JG_Bret_NW;
	nr		= 1;
	condition	= Info_Mod_Bret_Ambient_Condition;
	information	= Info_Mod_Bret_Ambient_Info;
	permanent	= 0;
	important	= 0;
	description	= "Jetzt bin ich bei den Jägern aufgenommen worden.";
};

FUNC INT Info_Mod_Bret_Ambient_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Jäger_Dabei == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bret_Ambient_Info()
{
	AI_Output(hero, self, "Info_Mod_Bret_Ambient_15_00"); //Jetzt bin ich bei den Jägern aufgenommen worden.
	AI_Output(self, hero, "Info_Mod_Bret_Ambient_08_01"); //(unmotiviert) Ich seh's. Willkommen.
	AI_Output(hero, self, "Info_Mod_Bret_Ambient_15_02"); //Irgendwelche Tipps, die du mir mit auf den Weg geben willst?
	AI_Output(self, hero, "Info_Mod_Bret_Ambient_08_03"); //Geh zu Dragomir, er wird bestimmt einen Auftrag für dich haben.
	AI_Output(hero, self, "Info_Mod_Bret_Ambient_15_04"); //Ach ja.
};

INSTANCE Info_Mod_Bret_Pickpocket (C_INFO)
{
	npc		= Mod_7414_JG_Bret_NW;
	nr		= 1;
	condition	= Info_Mod_Bret_Pickpocket_Condition;
	information	= Info_Mod_Bret_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Bret_Pickpocket_Condition()
{
	C_Beklauen	(60, ItMi_Gold, 230);
};

FUNC VOID Info_Mod_Bret_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Bret_Pickpocket);

	Info_AddChoice	(Info_Mod_Bret_Pickpocket, DIALOG_BACK, Info_Mod_Bret_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Bret_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Bret_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Bret_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Bret_Pickpocket);
};

FUNC VOID Info_Mod_Bret_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Bret_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Bret_Pickpocket);

		Info_AddChoice	(Info_Mod_Bret_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Bret_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Bret_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Bret_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Bret_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Bret_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Bret_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Bret_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Bret_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Bret_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Bret_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Bret_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Bret_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Bret_EXIT (C_INFO)
{
	npc		= Mod_7414_JG_Bret_NW;
	nr		= 1;
	condition	= Info_Mod_Bret_EXIT_Condition;
	information	= Info_Mod_Bret_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Bret_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bret_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};