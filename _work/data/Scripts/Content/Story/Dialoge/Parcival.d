INSTANCE Info_Mod_Parcival_Hi (C_INFO)
{
	npc		= Mod_504_PAL_Parcival_REL;
	nr		= 1;
	condition	= Info_Mod_Parcival_Hi_Condition;
	information	= Info_Mod_Parcival_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Sei gegrüßt, was macht ihr hier?";
};

FUNC INT Info_Mod_Parcival_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Parcival_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Parcival_Hi_15_00"); //Sei gegrüßt, was macht ihr hier?
	AI_Output(self, hero, "Info_Mod_Parcival_Hi_13_01"); //(erbost) Was?! Willst du uns verspotten?!
	AI_Output(hero, self, "Info_Mod_Parcival_Hi_15_02"); //Nun, ich, ähh ...
	AI_Output(self, hero, "Info_Mod_Parcival_Hi_13_03"); //(wütend) Wir dürfen diesen verfluchten Ort im Auge behalten ... auf königliche Weisung. (sarkastisch) Welch seltene Ehre.
	AI_Output(hero, self, "Info_Mod_Parcival_Hi_15_04"); //Ja, ist nicht die schönste Gegend.
	AI_Output(self, hero, "Info_Mod_Parcival_Hi_13_05"); //Und als ob das noch nicht schlimm genug wäre, hat sich dieser Abschaum hier noch eingenistet.
	AI_Output(hero, self, "Info_Mod_Parcival_Hi_15_06"); //Was meinst du?
	AI_Output(self, hero, "Info_Mod_Parcival_Hi_13_07"); //Ich meine dieses Lumpenpack in der Schenke. Tagediebe, Verbrecher, Huren ... die meisten von ihnen geradewegs aus der Strafkolonie.
	AI_Output(self, hero, "Info_Mod_Parcival_Hi_13_08"); //Innos legt uns wahrlich eine schwere Prüfung auf.
	AI_Output(hero, self, "Info_Mod_Parcival_Hi_15_09"); //Na ja, an diesem Monster verseuchten Ort vielleicht besser als nichts.
	AI_Output(self, hero, "Info_Mod_Parcival_Hi_13_10"); //Pah, wenn es nach mir ginge, würden wir sie alle samt ins Moor treiben, zu dem untoten Pack. Da wären sie in guter Gesellschaft.
	AI_Output(hero, self, "Info_Mod_Parcival_Hi_15_11"); //Jetzt übertreibst du aber ...
	AI_Output(self, hero, "Info_Mod_Parcival_Hi_13_12"); //Was sagst du?! Wieso rede ich überhaupt mit dir?! Scher dich weg!

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Parcival_Siedlung (C_INFO)
{
	npc		= Mod_504_PAL_Parcival_REL;
	nr		= 1;
	condition	= Info_Mod_Parcival_Siedlung_Condition;
	information	= Info_Mod_Parcival_Siedlung_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Parcival_Siedlung_Condition()
{
	if (Mod_Parcival_VorKneipe == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Parcival_Siedlung_Info()
{
	AI_Output(self, hero, "Info_Mod_Parcival_Siedlung_13_00"); //Verdammt, wo treibt er sich schon wieder herum. Er sollte doch hier Wache halten.
};

INSTANCE Info_Mod_Parcival_Pickpocket (C_INFO)
{
	npc		= Mod_504_PAL_Parcival_REL;
	nr		= 1;
	condition	= Info_Mod_Parcival_Pickpocket_Condition;
	information	= Info_Mod_Parcival_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Parcival_Pickpocket_Condition()
{
	C_Beklauen	(97, ItMi_Gold, 250);
};

FUNC VOID Info_Mod_Parcival_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Parcival_Pickpocket);

	Info_AddChoice	(Info_Mod_Parcival_Pickpocket, DIALOG_BACK, Info_Mod_Parcival_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Parcival_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Parcival_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Parcival_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Parcival_Pickpocket);
};

FUNC VOID Info_Mod_Parcival_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Parcival_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Parcival_Pickpocket);

		Info_AddChoice	(Info_Mod_Parcival_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Parcival_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Parcival_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Parcival_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Parcival_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Parcival_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Parcival_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Parcival_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Parcival_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Parcival_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Parcival_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Parcival_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Parcival_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Parcival_EXIT (C_INFO)
{
	npc		= Mod_504_PAL_Parcival_REL;
	nr		= 1;
	condition	= Info_Mod_Parcival_EXIT_Condition;
	information	= Info_Mod_Parcival_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Parcival_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Parcival_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};