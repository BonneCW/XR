INSTANCE Info_Mod_Turgor_Hi (C_INFO)
{
	npc		= Mod_7397_PSINOV_Turgor_REL;
	nr		= 1;
	condition	= Info_Mod_Turgor_Hi_Condition;
	information	= Info_Mod_Turgor_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was machst du hier?";
};

FUNC INT Info_Mod_Turgor_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Turgor_Hi_Info()
{
	B_Say	(hero, self, "$WASMACHSTDUHIER");

	AI_Output(self, hero, "Info_Mod_Turgor_Hi_05_01"); //Das wüsste ich auch ganz gern!
	AI_Output(self, hero, "Info_Mod_Turgor_Hi_05_02"); //"Geh nach Relendel", haben sie gesagt, "dort hast du einen freien Markt für Sumpfkraut."
	AI_Output(self, hero, "Info_Mod_Turgor_Hi_05_03"); //Jaahah, aber sie haben nicht verraten, dass es hier was viel Besseres gibt!
	AI_Output(self, hero, "Info_Mod_Turgor_Hi_05_04"); //Etwas, das das ganze beschissene Sumpfkraut unnötig macht!

	Info_ClearChoices	(Info_Mod_Turgor_Hi);

	Info_AddChoice	(Info_Mod_Turgor_Hi, "(reden lassen und weggehen)", Info_Mod_Turgor_Hi_B);
	Info_AddChoice	(Info_Mod_Turgor_Hi, "Wer sind 'sie'?", Info_Mod_Turgor_Hi_A);
};

FUNC VOID Info_Mod_Turgor_Hi_B()
{
	AI_TurnAway	(hero, self);

	AI_Output(self, hero, "Info_Mod_Turgor_Hi_B_05_00"); //Und erst die Leute hier ... He, was soll das werden?!

	Info_ClearChoices	(Info_Mod_Turgor_Hi);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Turgor_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Turgor_Hi_A_15_00"); //Wer sind "sie"?
	AI_Output(self, hero, "Info_Mod_Turgor_Hi_A_05_01"); //Wo komme ich wohl her, hä?
	AI_Output(self, hero, "Info_Mod_Turgor_Hi_A_05_02"); //Die alten Säcke von Gurus wollten mich wohl loswerden.
	AI_Output(self, hero, "Info_Mod_Turgor_Hi_A_05_03"); //Sollen sie doch in ihrem Sumpf vermodern!
	AI_Output(self, hero, "Info_Mod_Turgor_Hi_A_05_04"); //Ich werde ihnen nicht den Gefallen tun und zurückkehren.
	AI_Output(self, hero, "Info_Mod_Turgor_Hi_A_05_05"); //Aber hier isses auch nicht viel besser. Die Gurus sind wenigstens ausgeglichen!
	AI_Output(self, hero, "Info_Mod_Turgor_Hi_A_05_06"); //In Khorata gehen sich alle gegenseitig auf die Nerven, meckern rum, sind unzufrieden ...
	AI_Output(self, hero, "Info_Mod_Turgor_Hi_A_05_07"); //So kann man nicht normal miteinander umgehen.
	AI_Output(hero, self, "Info_Mod_Turgor_Hi_A_15_08"); //Fällt dir was auf?
	AI_Output(self, hero, "Info_Mod_Turgor_Hi_A_05_09"); //(Pause) Oh, Scheiße. (betroffen) Jaah, tut mir Leid.
	AI_Output(hero, self, "Info_Mod_Turgor_Hi_A_15_10"); //Können wir dann "normal miteinander umgehen"?
	AI_Output(self, hero, "Info_Mod_Turgor_Hi_A_05_11"); //'Türlich. Haste Fragen oder wie?

	Info_ClearChoices	(Info_Mod_Turgor_Hi);
};

INSTANCE Info_Mod_Turgor_WieLaeufts (C_INFO)
{
	npc		= Mod_7397_PSINOV_Turgor_REL;
	nr		= 1;
	condition	= Info_Mod_Turgor_WieLaeufts_Condition;
	information	= Info_Mod_Turgor_WieLaeufts_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie läuft's?";
};

FUNC INT Info_Mod_Turgor_WieLaeufts_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Turgor_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Turgor_WieLaeufts_Info()
{
	AI_Output(hero, self, "Info_Mod_Turgor_WieLaeufts_15_00"); //Wie läuft's?
	AI_Output(self, hero, "Info_Mod_Turgor_WieLaeufts_05_01"); //Haha, witzig. Das Sumpfkraut wächst, aber niemand will's haben. Kann's höchstens noch selbst rauchen.
};

INSTANCE Info_Mod_Turgor_Freudenspender (C_INFO)
{
	npc		= Mod_7397_PSINOV_Turgor_REL;
	nr		= 1;
	condition	= Info_Mod_Turgor_Freudenspender_Condition;
	information	= Info_Mod_Turgor_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Ich hätte hier Freudenspender für dich.";
};                       

FUNC INT Info_Mod_Turgor_Freudenspender_Condition()
{
	if (Npc_HasItems(hero, ItMi_Freudenspender) >= 1)
	&& (Mod_Freudenspender < 5)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Hi))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Turgor_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Turgor_Freudenspender_15_00"); //Ich hätte hier Freudenspender für dich.
	AI_Output(self, hero, "Info_Mod_Turgor_Freudenspender_05_01"); //Meine Fresse, du willst mich jetzt auch noch ruinieren?! Was passiert denn mit meinem Kraut?
	AI_Output(hero, self, "Info_Mod_Turgor_Freudenspender_15_02"); //Also nicht?
	AI_Output(self, hero, "Info_Mod_Turgor_Freudenspender_05_03"); //Scheiße, gib her. (brummelt) Ist einfach viel besser als 'n beschissener Stengel.

	B_GiveInvItems	(hero, self, ItMi_Freudenspender, 1);

	B_GiveInvItems	(self, hero, ItMi_Gold, 10);

	Mod_Freudenspender	+= 1;
};

INSTANCE Info_Mod_Turgor_Pickpocket (C_INFO)
{
	npc		= Mod_7397_PSINOV_Turgor_REL;
	nr		= 1;
	condition	= Info_Mod_Turgor_Pickpocket_Condition;
	information	= Info_Mod_Turgor_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Turgor_Pickpocket_Condition()
{
	C_Beklauen	(76, ItMi_Gold, 350);
};

FUNC VOID Info_Mod_Turgor_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Turgor_Pickpocket);

	Info_AddChoice	(Info_Mod_Turgor_Pickpocket, DIALOG_BACK, Info_Mod_Turgor_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Turgor_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Turgor_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Turgor_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Turgor_Pickpocket);
};

FUNC VOID Info_Mod_Turgor_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Turgor_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Turgor_Pickpocket);

		Info_AddChoice	(Info_Mod_Turgor_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Turgor_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Turgor_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Turgor_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Turgor_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Turgor_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Turgor_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Turgor_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Turgor_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Turgor_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Turgor_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Turgor_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Turgor_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Turgor_EXIT (C_INFO)
{
	npc		= Mod_7397_PSINOV_Turgor_REL;
	nr		= 1;
	condition	= Info_Mod_Turgor_EXIT_Condition;
	information	= Info_Mod_Turgor_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Turgor_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Turgor_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};