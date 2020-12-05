INSTANCE Info_Mod_Valentino_Hi (C_INFO)
{
	npc		= Mod_754_NONE_Valentino_NW;
	nr		= 1;
	condition	= Info_Mod_Valentino_Hi_Condition;
	information	= Info_Mod_Valentino_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kim jestes?";
};

FUNC INT Info_Mod_Valentino_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Valentino_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Valentino_Hi_09_01"); //Czego od mnie oczekujesz?
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
	AI_Output(self, hero, "Info_Mod_Valentino_Kidnapped_09_00"); //Wykonal pan wspaniala prace. Czy sadzisz, ze plamy krwi kiedykolwiek zniknely?

	B_GivePlayerXP	(300);

	B_LogEntry_More	(TOPIC_MOD_MOE_VALENTINO, TOPIC_MOD_CANTHAR_GESCHAEFTE, "Valentino ponownie jest wolne. Wiec brakowalo mi kolejnej porazki Canthar.", "Udalo mi sie zapobiec zemscie Canthara. Byc moze powinienem zaskoczyc Canthara za zmiane..... Na obozie dla porywaczy musi byc jakas wskazówka, skad pochodza lub dokad mnie maja zabrac.");
	B_SetTopicStatus	(TOPIC_MOD_MOE_VALENTINO, LOG_SUCCESS);

	CurrentNQ += 1;

	if (Mod_Moe_Valentino == 2) {
		B_StartOtherRoutine	(Mod_1197_VLK_Valentine_NW, "INZELT");
	};

	Info_ClearChoices	(Info_Mod_Valentino_Kidnapped);

	Info_AddChoice	(Info_Mod_Valentino_Kidnapped, "Poniewaz jestem w tej chwili bardzo dobry w praktyce, podam wam kolejny ukosnik.", Info_Mod_Valentino_Kidnapped_B);
	Info_AddChoice	(Info_Mod_Valentino_Kidnapped, "Jestes wolny.", Info_Mod_Valentino_Kidnapped_A);
};

FUNC VOID Info_Mod_Valentino_Kidnapped_B()
{
	AI_Output(hero, self, "Info_Mod_Valentino_Kidnapped_B_15_00"); //Poniewaz jestem w tej chwili bardzo dobry w praktyce, podam wam kolejny ukosnik.
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

	Mod_Valentino_Kidnapped = 0;

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_None, 1);
};

FUNC VOID Info_Mod_Valentino_Kidnapped_A()
{
	AI_Output(hero, self, "Info_Mod_Valentino_Kidnapped_A_15_00"); //Jestes wolny.
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

	Mod_Valentino_Kidnapped = 0;
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
	AI_Output(self, hero, "Info_Mod_Valentino_Mitternachtsspuk_09_00"); //Kto, co ty robisz?
	AI_Output(hero, self, "Info_Mod_Valentino_Mitternachtsspuk_15_01"); //Zlapalem tam kogos.
	AI_Output(self, hero, "Info_Mod_Valentino_Mitternachtsspuk_09_02"); //Jaka jest wiec róznica? Nic nie jest zabronione.
	AI_Output(hero, self, "Info_Mod_Valentino_Mitternachtsspuk_15_03"); //Zobaczmy, czy jej maz sie zgadza.
	AI_Output(self, hero, "Info_Mod_Valentino_Mitternachtsspuk_09_04"); //Jakiego fuku od mnie oczekujesz?
	AI_Output(hero, self, "Info_Mod_Valentino_Mitternachtsspuk_15_05"); //Czy czesciej spedzasz tu noca? I czy czasami zdarza sie to dziko?
	AI_Output(self, hero, "Info_Mod_Valentino_Mitternachtsspuk_09_06"); //Oczywiscie nie!
	AI_Output(hero, self, "Info_Mod_Valentino_Mitternachtsspuk_15_07"); //Nikogo nie powiem. Ale Fernando nie spi z twojego powodu.
	AI_Output(self, hero, "Info_Mod_Valentino_Mitternachtsspuk_09_08"); //Tak, jestesmy tu od czasu do czasu. Czy to wystarczy?
	AI_Output(hero, self, "Info_Mod_Valentino_Mitternachtsspuk_15_09"); //Oczywiscie.
	AI_Output(self, hero, "Info_Mod_Valentino_Mitternachtsspuk_09_10"); //Potem wyjmij z tego fuge!

	B_LogEntry	(TOPIC_MOD_FERNANDO_MITTERNACHTSSPUK, "Valentino i obywatel bezwiednie powoduja koszmary Fernando.");
};

INSTANCE Info_Mod_Valentino_SonjaFreier (C_INFO)
{
	npc		= Mod_754_NONE_Valentino_NW;
	nr		= 1;
	condition	= Info_Mod_Valentino_SonjaFreier_Condition;
	information	= Info_Mod_Valentino_SonjaFreier_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy regularnie odwiedzales Sonje?";
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
	AI_Output(hero, self, "Info_Mod_Valentino_SonjaFreier_15_00"); //Czy regularnie odwiedzales Sonje?
	AI_Output(self, hero, "Info_Mod_Valentino_SonjaFreier_09_01"); //Co to za suka? Czy to mówi?
	AI_Output(hero, self, "Info_Mod_Valentino_SonjaFreier_15_02"); //Nie, po prostu spokojny.
	AI_Output(self, hero, "Info_Mod_Valentino_SonjaFreier_09_03"); //Wychodze tylko z zamoznymi mieszkancami tego miasta. Wiekszosc czasu. Wiec zostaw mnie sam na sam z ta dziwka!
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
