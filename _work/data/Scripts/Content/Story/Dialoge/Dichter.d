INSTANCE Info_Mod_Dichter_Hi (C_INFO)
{
	npc		= Mod_7346_OUT_Dichter_REL;
	nr		= 1;
	condition	= Info_Mod_Dichter_Hi_Condition;
	information	= Info_Mod_Dichter_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was machst du hier?";
};

FUNC INT Info_Mod_Dichter_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Dichter_Hi_Info()
{
	B_Say	(hero, self, "$WASMACHSTDUHIER");

	AI_Output(self, hero, "Info_Mod_Dichter_Hi_34_01"); //(nervös) Tja, ich ... äh, schreibe. Gedichte und so weiter.
};

INSTANCE Info_Mod_Dichter_Unzufrieden (C_INFO)
{
	npc		= Mod_7346_OUT_Dichter_REL;
	nr		= 1;
	condition	= Info_Mod_Dichter_Unzufrieden_Condition;
	information	= Info_Mod_Dichter_Unzufrieden_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du klingst nicht sehr zufrieden.";
};

FUNC INT Info_Mod_Dichter_Unzufrieden_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dichter_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dichter_Unzufrieden_Info()
{
	AI_Output(hero, self, "Info_Mod_Dichter_Unzufrieden_15_00"); //Du klingst nicht sehr zufrieden.
	AI_Output(self, hero, "Info_Mod_Dichter_Unzufrieden_34_01"); //Sollte ich das etwa? Kann ich stolz auf mich sein?
	AI_Output(self, hero, "Info_Mod_Dichter_Unzufrieden_34_02"); //(neidisch) Leute wie du stehen immer im Mittelpunkt ...
	AI_Output(hero, self, "Info_Mod_Dichter_Unzufrieden_15_03"); //Nicht immer ganz freiwillig ...
	AI_Output(self, hero, "Info_Mod_Dichter_Unzufrieden_34_04"); //Und ich sitze in einer finsteren Bude und schreibe von Dingen, die ich noch nie gesehen habe!
	AI_Output(self, hero, "Info_Mod_Dichter_Unzufrieden_34_05"); //Von Tätigkeiten, die ich noch nie ausgeübt habe!
	AI_Output(self, hero, "Info_Mod_Dichter_Unzufrieden_34_06"); //Wie soll ich mich denn da beweisen?
	AI_Output(hero, self, "Info_Mod_Dichter_Unzufrieden_15_07"); //Wem willst du dich beweisen?
	AI_Output(self, hero, "Info_Mod_Dichter_Unzufrieden_34_08"); //Mir selbst natürlich.
	AI_Output(hero, self, "Info_Mod_Dichter_Unzufrieden_15_09"); //Wirklich?
	AI_Output(self, hero, "Info_Mod_Dichter_Unzufrieden_34_10"); //(herumdrucksend) Naja, es gibt da noch Margarethe ...
	AI_Output(hero, self, "Info_Mod_Dichter_Unzufrieden_15_11"); //Dachte ich's mir doch.
	AI_Output(self, hero, "Info_Mod_Dichter_Unzufrieden_34_12"); //Was soll ich nur tun?

	Info_ClearChoices	(Info_Mod_Dichter_Unzufrieden);

	Info_AddChoice	(Info_Mod_Dichter_Unzufrieden, "Vergiss sie.", Info_Mod_Dichter_Unzufrieden_C);
	Info_AddChoice	(Info_Mod_Dichter_Unzufrieden, "Zieh aus und lern die Welt kennen.", Info_Mod_Dichter_Unzufrieden_B);
	Info_AddChoice	(Info_Mod_Dichter_Unzufrieden, "Zeig ihr deine Gedichte.", Info_Mod_Dichter_Unzufrieden_A);
};

FUNC VOID Info_Mod_Dichter_Unzufrieden_C()
{
	AI_Output(hero, self, "Info_Mod_Dichter_Unzufrieden_C_15_00"); //Vergiss sie.
	AI_Output(self, hero, "Info_Mod_Dichter_Unzufrieden_C_34_01"); //(deprimiert) Habe ich mir gedacht ...

	Mod_REL_Dichter = 3;

	Info_ClearChoices	(Info_Mod_Dichter_Unzufrieden);
};

FUNC VOID Info_Mod_Dichter_Unzufrieden_B()
{
	AI_Output(hero, self, "Info_Mod_Dichter_Unzufrieden_B_15_00"); //Zieh aus und lern die Welt kennen.
	AI_Output(self, hero, "Info_Mod_Dichter_Unzufrieden_B_34_01"); //Einfach nicht weiter nachdenken, ja? Gut, ich mach's.

	Info_ClearChoices	(Info_Mod_Dichter_Unzufrieden);

	Mod_REL_Dichter = 2;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
};

FUNC VOID Info_Mod_Dichter_Unzufrieden_A()
{
	AI_Output(hero, self, "Info_Mod_Dichter_Unzufrieden_A_15_00"); //Zeig ihr deine Gedichte.
	AI_Output(self, hero, "Info_Mod_Dichter_Unzufrieden_A_34_01"); //(skeptisch) Meinst du, das klappt? Hmm, werd's mal probieren.	

	Info_ClearChoices	(Info_Mod_Dichter_Unzufrieden);

	Mod_REL_Dichter = 1;
};

INSTANCE Info_Mod_Dichter_AtMargarethe (C_INFO)
{
	npc		= Mod_7346_OUT_Dichter_REL;
	nr		= 1;
	condition	= Info_Mod_Dichter_AtMargarethe_Condition;
	information	= Info_Mod_Dichter_AtMargarethe_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Dichter_AtMargarethe_Condition()
{
	if (Mod_REL_DichterBeiMargarethe == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dichter_AtMargarethe_Info()
{
	AI_Output(self, hero, "Info_Mod_Dichter_AtMargarethe_34_00"); //Dein Tipp hat mir geholfen! Vielen Dank!

	B_GiveInvItems	(self, hero, ItMi_Gold, 50);
};

INSTANCE Info_Mod_Dichter_Freudenspender (C_INFO)
{
	npc		= Mod_7346_OUT_Dichter_REL;
	nr		= 1;
	condition	= Info_Mod_Dichter_Freudenspender_Condition;
	information	= Info_Mod_Dichter_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Willst du Freudenspender für mehr Inspiration?";
};                       

FUNC INT Info_Mod_Dichter_Freudenspender_Condition()
{
	if (Npc_HasItems(hero, ItMi_Freudenspender) >= 1)
	&& (Mod_Freudenspender < 5)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Hi))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Dichter_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Dichter_Freudenspender_15_00"); //Willst du Freudenspender für mehr Inspiration?
	AI_Output(self, hero, "Info_Mod_Dichter_Freudenspender_34_01"); //Meinst du, das hilft?
	AI_Output(hero, self, "Info_Mod_Dichter_Freudenspender_15_02"); //Bestimmt.
	AI_Output(self, hero, "Info_Mod_Dichter_Freudenspender_34_03"); //Dann nehm ich was. Danke.

	B_GiveInvItems	(hero, self, ItMi_Freudenspender, 1);

	B_GiveInvItems	(self, hero, ItMi_Gold, 10);

	Mod_Freudenspender += 1;
};

INSTANCE Info_Mod_Dichter_Pickpocket (C_INFO)
{
	npc		= Mod_7346_OUT_Dichter_REL;
	nr		= 1;
	condition	= Info_Mod_Dichter_Pickpocket_Condition;
	information	= Info_Mod_Dichter_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Dichter_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 15);
};

FUNC VOID Info_Mod_Dichter_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Dichter_Pickpocket);

	Info_AddChoice	(Info_Mod_Dichter_Pickpocket, DIALOG_BACK, Info_Mod_Dichter_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Dichter_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Dichter_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Dichter_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Dichter_Pickpocket);
};

FUNC VOID Info_Mod_Dichter_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Dichter_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Dichter_Pickpocket);

		Info_AddChoice	(Info_Mod_Dichter_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Dichter_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Dichter_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Dichter_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Dichter_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Dichter_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Dichter_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Dichter_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Dichter_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Dichter_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Dichter_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Dichter_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Dichter_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Dichter_EXIT (C_INFO)
{
	npc		= Mod_7346_OUT_Dichter_REL;
	nr		= 1;
	condition	= Info_Mod_Dichter_EXIT_Condition;
	information	= Info_Mod_Dichter_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Dichter_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Dichter_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};