INSTANCE Info_Mod_HSBauer_05_Hi (C_INFO)
{
	npc		= Mod_7019_HS_Bauer_REL;
	nr		= 1;
	condition	= Info_Mod_HSBauer_05_Hi_Condition;
	information	= Info_Mod_HSBauer_05_Hi_Info;
	permanent	= 1;
	important	= 0;
	description	= "Was ist das hier für 'ne Gegend?";
};

FUNC INT Info_Mod_HSBauer_05_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HSBauer_05_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_HSBauer_05_Hi_15_00"); //Was ist das hier für 'ne Gegend?
	AI_Output(self, hero, "Info_Mod_HSBauer_05_Hi_05_01"); //Maaan ... du siehst das alles viel zu eng, m'kay?
	AI_Output(hero, self, "Info_Mod_HSBauer_05_Hi_15_02"); //...?
	AI_Output(self, hero, "Info_Mod_HSBauer_05_Hi_05_03"); //Weißt du, ich war auch mal so wie du, m'kay?
	AI_Output(self, hero, "Info_Mod_HSBauer_05_Hi_05_04"); //Ich dachte wir sind alle nur ein Individuum auf dieser Welt ... aber in Wahrheit sind wir alle riesengroße Individuen, m'kay?
	AI_Output(self, hero, "Info_Mod_HSBauer_05_Hi_05_05"); //Verstehst du die Message, die ich dir so rüberbringen will?

	Info_ClearChoices	(Info_Mod_HSBauer_05_Hi);

	Info_AddChoice	(Info_Mod_HSBauer_05_Hi, "Aber wenn wir alle ein riesengroßes Individuum sind, woran misst du diese Große?", Info_Mod_HSBauer_05_Hi_C);
	Info_AddChoice	(Info_Mod_HSBauer_05_Hi, "Ja ... ist klar.", Info_Mod_HSBauer_05_Hi_B);
	Info_AddChoice	(Info_Mod_HSBauer_05_Hi, "So spät ist es schon?", Info_Mod_HSBauer_05_Hi_A);
};

FUNC VOID Info_Mod_HSBauer_05_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_HSBauer_05_Hi_C_15_00"); //Aber wenn wir alle ein riesengroßes Individuum sind, woran misst du diese Große?
	AI_Output(hero, self, "Info_Mod_HSBauer_05_Hi_C_15_01"); //Du brauchst einen Maßstab, um etwas groß zu nennen, und wir können nicht alle große Individuen sein, da wir gegenseitig der Maßstab für uns selbst sind.
	AI_Output(hero, self, "Info_Mod_HSBauer_05_Hi_C_15_02"); //Also muss „riesengroß“ relativ auf den Durchschnitt sein, wodurch es aber so sein muss, dass der Großteil durchschnittliche Individuen sind und es ein paar große und dafür auch ein paar kleine gibt.
	AI_Output(self, hero, "Info_Mod_HSBauer_05_Hi_C_05_03"); //Aber ... äh ... wir sind alle ein riesengroßes Individuum, verstehst du?
	AI_Output(hero, self, "Info_Mod_HSBauer_05_Hi_C_15_04"); //Nun du kannst auch nicht Individuum sagen, da wir unsere gesamte Welt nicht aus der Sicht des Individualismus ansehen dürfen.
	AI_Output(hero, self, "Info_Mod_HSBauer_05_Hi_C_15_05"); //Abgesehen von dem inneren Drang des Menschen, in einer Gruppe Schutz und Geborgenheit zu suchen, liegt es auch in unserer Natur, wie Tiere Rudel zu bilden.
	AI_Output(hero, self, "Info_Mod_HSBauer_05_Hi_C_15_06"); //Letzten Endes bist auch du in einem solchen Rudel, und in einem „Rudel“ geht es nicht um das Individuum sondern um das Wohl der Gesamtheit.
	AI_Output(self, hero, "Info_Mod_HSBauer_05_Hi_C_05_07"); //Darüber muss ich jetzt ein wenig nachdenken, mein Freund ... m'kay?

	Info_ClearChoices	(Info_Mod_HSBauer_05_Hi);
};

FUNC VOID Info_Mod_HSBauer_05_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_HSBauer_05_Hi_B_15_00"); //Ja ... ist klar.
	AI_Output(self, hero, "Info_Mod_HSBauer_05_Hi_B_05_01"); //Schön, mein Freund. Du hast die Message, m'kay?
	AI_Output(hero, self, "Info_Mod_HSBauer_05_Hi_B_15_02"); //M'kay!
	AI_Output(self, hero, "Info_Mod_HSBauer_05_Hi_B_05_03"); //M'kay ...

	Info_ClearChoices	(Info_Mod_HSBauer_05_Hi);
};

FUNC VOID Info_Mod_HSBauer_05_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_HSBauer_05_Hi_A_15_00"); //So spät ist es schon?

	Info_ClearChoices	(Info_Mod_HSBauer_05_Hi);
};

INSTANCE Info_Mod_HSBauer_05_Pickpocket (C_INFO)
{
	npc		= Mod_7019_HS_Bauer_REL;
	nr		= 1;
	condition	= Info_Mod_HSBauer_05_Pickpocket_Condition;
	information	= Info_Mod_HSBauer_05_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_30;
};

FUNC INT Info_Mod_HSBauer_05_Pickpocket_Condition()
{
	C_Beklauen	(15, ItMi_Gold, 45);
};

FUNC VOID Info_Mod_HSBauer_05_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_HSBauer_05_Pickpocket);

	Info_AddChoice	(Info_Mod_HSBauer_05_Pickpocket, DIALOG_BACK, Info_Mod_HSBauer_05_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_HSBauer_05_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_HSBauer_05_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_HSBauer_05_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_HSBauer_05_Pickpocket);
};

FUNC VOID Info_Mod_HSBauer_05_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_HSBauer_05_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_HSBauer_05_Pickpocket);

		Info_AddChoice	(Info_Mod_HSBauer_05_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_HSBauer_05_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_HSBauer_05_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_HSBauer_05_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_HSBauer_05_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_HSBauer_05_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_HSBauer_05_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_HSBauer_05_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_HSBauer_05_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_HSBauer_05_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_HSBauer_05_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_HSBauer_05_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_HSBauer_05_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_HSBauer_05_EXIT (C_INFO)
{
	npc		= Mod_7019_HS_Bauer_REL;
	nr		= 1;
	condition	= Info_Mod_HSBauer_05_EXIT_Condition;
	information	= Info_Mod_HSBauer_05_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_HSBauer_05_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HSBauer_05_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};