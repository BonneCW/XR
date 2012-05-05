INSTANCE Info_Mod_Henker_Hi (C_INFO)
{
	npc		= Mod_7391_OUT_Henker_REL;
	nr		= 1;
	condition	= Info_Mod_Henker_Hi_Condition;
	information	= Info_Mod_Henker_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hi.";
};

FUNC INT Info_Mod_Henker_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Henker_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Henker_Hi_15_00"); //Hi.
	AI_Output(self, hero, "Info_Mod_Henker_Hi_05_01"); //(brummt) Is' was?

	Info_ClearChoices	(Info_Mod_Henker_Hi);

	Info_AddChoice	(Info_Mod_Henker_Hi, "Nicht wirklich.", Info_Mod_Henker_Hi_B);
	Info_AddChoice	(Info_Mod_Henker_Hi, "Magst du deine Arbeit?", Info_Mod_Henker_Hi_A);
};

FUNC VOID Info_Mod_Henker_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Henker_Hi_B_15_00"); //Nicht wirklich.

	Info_ClearChoices	(Info_Mod_Henker_Hi);
};

FUNC VOID Info_Mod_Henker_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Henker_Hi_A_15_00"); //Magst du deine Arbeit?
	AI_Output(self, hero, "Info_Mod_Henker_Hi_A_05_01"); //Nee, nich' immer. Hasse es, wenn die Weiber kreischen.
	AI_Output(hero, self, "Info_Mod_Henker_Hi_A_15_02"); //(ironisch) Ja, schrecklich.

	Info_ClearChoices	(Info_Mod_Henker_Hi);

	Info_AddChoice	(Info_Mod_Henker_Hi, "Ich wünsche deinen Delinquenten einen unblutigen Tag.", Info_Mod_Henker_Hi_D);
	Info_AddChoice	(Info_Mod_Henker_Hi, "Hast du Lust auf ein Kräftemessen im Faustkampf?", Info_Mod_Henker_Hi_C);
};

FUNC VOID Info_Mod_Henker_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_Henker_Hi_D_15_00"); //Ich wünsche deinen Delinquenten einen unblutigen Tag.

	Info_ClearChoices	(Info_Mod_Henker_Hi);
};

FUNC VOID Info_Mod_Henker_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_Henker_Hi_C_15_00"); //Hast du Lust auf ein Kräftemessen im Faustkampf?
	AI_Output(self, hero, "Info_Mod_Henker_Hi_C_05_01"); //(misstrauisch) Wieso? Willst du verprügelt werden?
	AI_Output(hero, self, "Info_Mod_Henker_Hi_C_15_02"); //50 Goldmünzen für den Gewinner.
	AI_Output(self, hero, "Info_Mod_Henker_Hi_C_05_03"); //Hast du ir'ndwelche Tricks oder was? Kannst doch nicht ernsthaft glauben ...

	Info_ClearChoices	(Info_Mod_Henker_Hi);

	Info_AddChoice	(Info_Mod_Henker_Hi, "Ich gehe vorher nochmal trainieren.", Info_Mod_Henker_Hi_F);
	Info_AddChoice	(Info_Mod_Henker_Hi, "Jetzt sofort?", Info_Mod_Henker_Hi_E);
};

FUNC VOID Info_Mod_Henker_Hi_F()
{
	AI_Output(hero, self, "Info_Mod_Henker_Hi_F_15_00"); //Ich gehe vorher nochmal trainieren.

	Mod_REL_HenkerKampf = 1;

	Info_ClearChoices	(Info_Mod_Henker_Hi);
};

FUNC VOID Info_Mod_Henker_Hi_E()
{
	AI_Output(hero, self, "Info_Mod_Henker_Hi_E_15_00"); //Jetzt sofort?
	AI_Output(self, hero, "Info_Mod_Henker_Hi_E_05_01"); //Hmm, na gut. Kann's losgehen?

	Mod_REL_HenkerKampf = 1;

	Info_ClearChoices	(Info_Mod_Henker_Hi);
};

INSTANCE Info_Mod_Henker_LetsFight (C_INFO)
{
	npc		= Mod_7391_OUT_Henker_REL;
	nr		= 1;
	condition	= Info_Mod_Henker_LetsFight_Condition;
	information	= Info_Mod_Henker_LetsFight_Info;
	permanent	= 0;
	important	= 0;
	description	= "Lass uns beginnen!";
};

FUNC INT Info_Mod_Henker_LetsFight_Condition()
{
	if (Mod_REL_HenkerKampf == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Henker_LetsFight_Info()
{
	AI_Output(hero, self, "Info_Mod_Henker_LetsFight_15_00"); //Lass uns beginnen!

	AI_UnequipWeapons	(hero);

	Mod_REL_HenkerKampf = 2;

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_None, 0);
};

INSTANCE Info_Mod_Henker_Umgehauen (C_INFO)
{
	npc		= Mod_7391_OUT_Henker_REL;
	nr		= 1;
	condition	= Info_Mod_Henker_Umgehauen_Condition;
	information	= Info_Mod_Henker_Umgehauen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe gewonnen.";
};

FUNC INT Info_Mod_Henker_Umgehauen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Henker_LetsFight))
	&& (Mod_REL_HenkerKampf == 2)
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Henker_Umgehauen_Info()
{
	AI_Output(hero, self, "Info_Mod_Henker_Umgehauen_15_00"); //Ich habe gewonnen.
	AI_Output(self, hero, "Info_Mod_Henker_Umgehauen_05_01"); //Na und?
	AI_Output(hero, self, "Info_Mod_Henker_Umgehauen_15_02"); //Du schuldest mir ein paar Münzen ...
	AI_Output(self, hero, "Info_Mod_Henker_Umgehauen_05_03"); //Kann mich nicht erinnern.
	AI_Output(hero, self, "Info_Mod_Henker_Umgehauen_15_04"); //Soll ich dir meine Erinnerungshilfen vorführen?
	AI_Output(self, hero, "Info_Mod_Henker_Umgehauen_05_05"); //(wimmert) Mann, das ist ein Wochenlohn.

	B_GiveInvItems	(self, hero, ItMi_Gold, 50);

	AI_StopProcessInfos	(self);

	Mod_REL_HenkerKampf = 3;
};

INSTANCE Info_Mod_Henker_Unruhen (C_INFO)
{
	npc		= Mod_7391_OUT_Henker_REL;
	nr		= 1;
	condition	= Info_Mod_Henker_Unruhen_Condition;
	information	= Info_Mod_Henker_Unruhen_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Ich brauche jemanden, der für mich seine Axt schwingt.";
};                       

FUNC INT Info_Mod_Henker_Unruhen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lukas_Unruhen4))
	&& (Mod_REL_LukasS == 0)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Henker_Unruhen_Info()
{
	AI_Output(hero, self, "Info_Mod_Henker_Unruhen_15_00"); //Ich brauche jemanden, der für mich seine Axt schwingt.
	AI_Output(self, hero, "Info_Mod_Henker_Unruhen_05_01"); //Mal keine Hexen heut? Kann mal 'n bisschen Abwechslung vertragen.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOWTOMINE");

	self.aivar[AIV_Partymember] = TRUE;
};

INSTANCE Info_Mod_Henker_Freudenspender (C_INFO)
{
	npc		= Mod_7391_OUT_Henker_REL;
	nr		= 1;
	condition	= Info_Mod_Henker_Freudenspender_Condition;
	information	= Info_Mod_Henker_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Etwas Freudenspender nach einem harten Arbeitstag?";
};                       

FUNC INT Info_Mod_Henker_Freudenspender_Condition()
{
	if (Npc_HasItems(hero, ItMi_Freudenspender) >= 1)
	&& (Mod_Freudenspender < 5)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Hi))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Henker_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Henker_Freudenspender_15_00"); //Etwas Freudenspender nach einem harten Arbeitstag?
	AI_Output(self, hero, "Info_Mod_Henker_Freudenspender_05_01"); //Nee, Mann, das Zeug haut bei mir immer voll rein.
};

INSTANCE Info_Mod_Henker_Pickpocket (C_INFO)
{
	npc		= Mod_7391_OUT_Henker_REL;
	nr		= 1;
	condition	= Info_Mod_Henker_Pickpocket_Condition;
	information	= Info_Mod_Henker_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Henker_Pickpocket_Condition()
{
	C_Beklauen	(76, ItMi_Gold, 25);
};

FUNC VOID Info_Mod_Henker_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Henker_Pickpocket);

	Info_AddChoice	(Info_Mod_Henker_Pickpocket, DIALOG_BACK, Info_Mod_Henker_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Henker_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Henker_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Henker_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Henker_Pickpocket);
};

FUNC VOID Info_Mod_Henker_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Henker_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Henker_Pickpocket);

		Info_AddChoice	(Info_Mod_Henker_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Henker_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Henker_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Henker_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Henker_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Henker_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Henker_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Henker_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Henker_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Henker_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Henker_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Henker_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Henker_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Henker_EXIT (C_INFO)
{
	npc		= Mod_7391_OUT_Henker_REL;
	nr		= 1;
	condition	= Info_Mod_Henker_EXIT_Condition;
	information	= Info_Mod_Henker_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Henker_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Henker_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};