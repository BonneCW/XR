INSTANCE Info_Mod_Valentino_Hi (C_INFO)
{
	npc		= Mod_754_NONE_Valentino_NW;
	nr		= 1;
	condition	= Info_Mod_Valentino_Hi_Condition;
	information	= Info_Mod_Valentino_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Valentino_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Valentino_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Valentino_Hi_03_01"); //Was willst DU denn von mir?
};

INSTANCE Info_Mod_Valentino_Kidnapped (C_INFO)
{
	npc		= Mod_754_NONE_Valentino_NW;
	nr		= 1;
	condition	= Info_Mod_Valentino_Kidnapped_Condition;
	information	= Info_Mod_Valentino_Kidnapped_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Valentino_Kidnapped_Condition()
{
	if (Npc_IsDead(Mod_7028_OUT_Entfuehrer_NW))
	&& (Npc_IsDead(Mod_7029_OUT_Entfuehrer_NW))
	&& (Mod_Moe_Valentino > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Valentino_Kidnapped_Info()
{
	AI_Output(self, hero, "Info_Mod_Valentino_Kidnapped_03_00"); //(sarkastisch) Das hast du ja ganz toll hingekriegt. Glaubst du etwa, die Blutflecken gehen jemals raus?

	B_GivePlayerXP	(300);

	B_LogEntry_More	(TOPIC_MOD_MOE_VALENTINO, TOPIC_MOD_CANTHAR_GESCHAEFTE, "Valentino ist wieder frei. Damit habe ich Canthar einen weiteren Rückschlag verpasst.", "Ich konnte Canthars Rache verhindern. Vielleicht sollte zur Abwechslung mal ich Canthar eine Überraschung bereiten... Es muss doch bei dem Lager der Entführer irgendeinen Hinweis darauf geben, woher sie kommen oder wohin sie mich bringen sollten.");
	B_SetTopicStatus	(TOPIC_MOD_MOE_VALENTINO, LOG_SUCCESS);

	CurrentNQ += 1;

	if (Mod_Moe_Valentino == 2) {
		B_StartOtherRoutine	(Mod_1197_VLK_Valentine_NW, "INZELT");
	};

	Info_ClearChoices	(Info_Mod_Valentino_Kidnapped);

	Info_AddChoice	(Info_Mod_Valentino_Kidnapped, "Weil ich gerade so gut in Übung bin, polier ich dir auch nochmal die Fresse.", Info_Mod_Valentino_Kidnapped_B);
	Info_AddChoice	(Info_Mod_Valentino_Kidnapped, "Du bist frei.", Info_Mod_Valentino_Kidnapped_A);
};

FUNC VOID Info_Mod_Valentino_Kidnapped_B()
{
	AI_Output(hero, self, "Info_Mod_Valentino_Kidnapped_B_15_00"); //Weil ich gerade so gut in Übung bin, polier ich dir auch nochmal die Fresse.
	AI_Output(self, hero, "DEFAULT"); //

	Info_ClearChoices	(Info_Mod_Valentino_Kidnapped);

	if (Mod_Fernando_Mitternachtsspuk == 1)
	{
		B_StartOtherRoutine	(Mod_1066_VLK_Buergerin_NW, "SPUK");
		B_StartOtherRoutine	(self, "SPUK");
	}
	else
	{
		B_StartOtherRoutine	(self, "START");
	};

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_None, 1);
};

FUNC VOID Info_Mod_Valentino_Kidnapped_A()
{
	AI_Output(hero, self, "Info_Mod_Valentino_Kidnapped_A_15_00"); //Du bist frei.
	AI_Output(self, hero, "DEFAULT"); //

	Info_ClearChoices	(Info_Mod_Valentino_Kidnapped);

	AI_StopProcessInfos	(self);

	if (Mod_Fernando_Mitternachtsspuk == 1)
	{
		B_StartOtherRoutine	(Mod_1066_VLK_Buergerin_NW, "SPUK");
		B_StartOtherRoutine	(self, "SPUK");
	}
	else
	{
		B_StartOtherRoutine	(self, "START");
	};
};

INSTANCE Info_Mod_Valentino_Mitternachtsspuk (C_INFO)
{
	npc		= Mod_754_NONE_Valentino_NW;
	nr		= 1;
	condition	= Info_Mod_Valentino_Mitternachtsspuk_Condition;
	information	= Info_Mod_Valentino_Mitternachtsspuk_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Valentino_Mitternachtsspuk_Condition()
{
	if (Mod_Fernando_Mitternachtsspuk == 1)
	&& (Wld_IsTime(22,00,07,45))
	&& (Npc_GetDistToWP(hero, "NW_CITY_UPTOWN_HUT_03_04") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Valentino_Mitternachtsspuk_Info()
{
	AI_Output(self, hero, "Info_Mod_Valentino_Mitternachtsspuk_03_00"); //(erschrocken) Huch, was soll das werden?
	AI_Output(hero, self, "Info_Mod_Valentino_Mitternachtsspuk_15_01"); //Da habe ich aber jemanden erwischt.
	AI_Output(self, hero, "Info_Mod_Valentino_Mitternachtsspuk_03_02"); //(hochnäsig) Na und? Ist nichts Verbotenes.
	AI_Output(hero, self, "Info_Mod_Valentino_Mitternachtsspuk_15_03"); //Mal sehen, ob ihr Mann das auch meint.
	AI_Output(self, hero, "Info_Mod_Valentino_Mitternachtsspuk_03_04"); //Scheiße, was willst du von mir?
	AI_Output(hero, self, "Info_Mod_Valentino_Mitternachtsspuk_15_05"); //Trefft ihr euch häufiger nachts hier? Und geht es manchmal auch wild zu?
	AI_Output(self, hero, "Info_Mod_Valentino_Mitternachtsspuk_03_06"); //Natürlich nicht!
	AI_Output(hero, self, "Info_Mod_Valentino_Mitternachtsspuk_15_07"); //Ich sag's auch nicht weiter. Aber Fernando schläft euretwegen schlecht.
	AI_Output(self, hero, "Info_Mod_Valentino_Mitternachtsspuk_03_08"); //(lacht unsicher) Ja, wir sind schon ab und zu hier. Reicht das?
	AI_Output(hero, self, "Info_Mod_Valentino_Mitternachtsspuk_15_09"); //(genüsslich) Natürlich.
	AI_Output(self, hero, "Info_Mod_Valentino_Mitternachtsspuk_03_10"); //Dann hau endlich ab!

	B_LogEntry	(TOPIC_MOD_FERNANDO_MITTERNACHTSSPUK, "Valentino und eine Bürgerin verursachen unfreiwillig Fernandos Alpträume.");
};

INSTANCE Info_Mod_Valentino_SonjaFreier (C_INFO)
{
	npc		= Mod_754_NONE_Valentino_NW;
	nr		= 1;
	condition	= Info_Mod_Valentino_SonjaFreier_Condition;
	information	= Info_Mod_Valentino_SonjaFreier_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du Sonja früher regelmäßig besucht?";
};

FUNC INT Info_Mod_Valentino_SonjaFreier_Condition()
{
	if (Mod_Sonja_Freier == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Valentino_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Valentino_SonjaFreier_Info()
{
	AI_Output(hero, self, "Info_Mod_Valentino_SonjaFreier_15_00"); //Hast du Sonja früher regelmäßig besucht?
	AI_Output(self, hero, "Info_Mod_Valentino_SonjaFreier_03_01"); //(ungnädig) Was, diese Schlampe? Behauptet sie das etwa?
	AI_Output(hero, self, "Info_Mod_Valentino_SonjaFreier_15_02"); //Nein, reg dich ab.
	AI_Output(self, hero, "Info_Mod_Valentino_SonjaFreier_03_03"); //Ich gehe nur mit gut situierten Bürgerinnen dieser Stadt aus. Meistens. Also lass mich in Ruhe mit dieser Hure!
};

INSTANCE Info_Mod_Valentino_Pickpocket (C_INFO)
{
	npc		= Mod_754_NONE_Valentino_NW;
	nr		= 1;
	condition	= Info_Mod_Valentino_Pickpocket_Condition;
	information	= Info_Mod_Valentino_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Valentino_Pickpocket_Condition()
{
	C_Beklauen	(85, ItMi_GoldRing, 1);
};

FUNC VOID Info_Mod_Valentino_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Valentino_Pickpocket);

	Info_AddChoice	(Info_Mod_Valentino_Pickpocket, DIALOG_BACK, Info_Mod_Valentino_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Valentino_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Valentino_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Valentino_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Valentino_Pickpocket);
};

FUNC VOID Info_Mod_Valentino_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Valentino_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Valentino_Pickpocket);

		Info_AddChoice	(Info_Mod_Valentino_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Valentino_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Valentino_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Valentino_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Valentino_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Valentino_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Valentino_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Valentino_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Valentino_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Valentino_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Valentino_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Valentino_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Valentino_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Valentino_EXIT (C_INFO)
{
	npc		= Mod_754_NONE_Valentino_NW;
	nr		= 1;
	condition	= Info_Mod_Valentino_EXIT_Condition;
	information	= Info_Mod_Valentino_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Valentino_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Valentino_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};