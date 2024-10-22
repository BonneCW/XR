INSTANCE Info_Mod_Xardas_GDG_Ritualplatz (C_INFO)
{
	npc		= Mod_843_DMB_Xardas_GDG;
	nr		= 1;
	condition	= Info_Mod_Xardas_GDG_Ritualplatz_Condition;
	information	= Info_Mod_Xardas_GDG_Ritualplatz_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab den Ritualplatz gefunden.";
};

FUNC INT Info_Mod_Xardas_GDG_Ritualplatz_Condition()
{
	if (Mod_Ritualplatz_Used == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_GDG_Ritualplatz_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_GDG_Ritualplatz_15_00"); //Ich hab den Ritualplatz gefunden.
	AI_Output(self, hero, "Info_Mod_Xardas_GDG_Ritualplatz_14_01"); //Wir werden uns sofort auf den Weg machen. Wir treffen uns dann in der Höhle. Vergiss bloß die Götterwaffen nicht.

	AI_StopProcessInfos	(self);

	Npc_ExchangeRoutine	(self, "WAITFORRITUAL");
	Npc_ExchangeRoutine	(Mod_6003_KDW_Saturas_GDG, "WAITFORRITUAL");
	Npc_ExchangeRoutine	(Mod_6002_KDF_Pyrokar_GDG, "WAITFORRITUAL");

	B_GivePlayerXP	(2000);

	B_LogEntry	(TOPIC_MOD_URIZIEL, "Xardas und die anderen haben sich sofort auf den Weg zur Höhle gemacht. Ich soll sie dort treffen.");
};

INSTANCE Info_Mod_Xardas_GDG_SeelensteineEinsetzen (C_INFO)
{
	npc		= Mod_843_DMB_Xardas_GDG;
	nr		= 1;
	condition	= Info_Mod_Xardas_GDG_SeelensteineEinsetzen_Condition;
	information	= Info_Mod_Xardas_GDG_SeelensteineEinsetzen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Xardas_GDG_SeelensteineEinsetzen_Condition()
{
	if (Npc_GetDistToWP(self, "WP_GDG_RITUAL_XARDAS") < 1000)
	&& (SoulStoneEingesetzt < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_GDG_SeelensteineEinsetzen_Info()
{
	AI_Output(self, hero, "Info_Mod_Xardas_GDG_SeelensteineEinsetzen_14_00"); //Du solltest die Seelensteine noch in die Sockel in diesem Raum einsetzen, damit wir das Ritual beginnen können.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Xardas_GDG_Ritual (C_INFO)
{
	npc		= Mod_843_DMB_Xardas_GDG;
	nr		= 1;
	condition	= Info_Mod_Xardas_GDG_Ritual_Condition;
	information	= Info_Mod_Xardas_GDG_Ritual_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Xardas_GDG_Ritual_Condition()
{
	if (Npc_GetDistToWP(self, "WP_GDG_RITUAL_XARDAS") < 1000)
	&& ((Npc_HasItems(hero, ItMw_Adanos_Stab_Magieteil) == 1)
	|| (Npc_HasItems(hero, ItMw_Adanos_Stab_Kampfteil) == 1))
	&& (Npc_HasItems(hero, Holy_Hammer_MIS) == 1)
	&& ((Npc_HasItems(hero, ItMw_BeliarWeapon_1H_01) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_02) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_03) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_04) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_05) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_06) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_07) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_08) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_09) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_10) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_11) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_12) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_13) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_14) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_15) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_16) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_17) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_18) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_19) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_20) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_01) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_02) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_03) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_04) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_05) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_06) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_07) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_08) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_09) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_10) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_11) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_12) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_13) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_14) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_15) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_16) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_17) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_18) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_19) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_20) == 1))
	&& (SoulStoneEingesetzt == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_GDG_Ritual_Info()
{
	AI_Output(self, hero, "Info_Mod_Xardas_GDG_Ritual_14_00"); //Gut, wir werden jetzt beginnen.

	AI_UnequipWeapons	(hero);

	Npc_RemoveInvItems	(hero, ItMw_Adanos_Stab_Magieteil, 1);
	Npc_RemoveInvItems	(hero, ItMw_Adanos_Stab_Kampfteil, 1);
	Npc_RemoveInvItems	(hero, Holy_Hammer_MIS, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_Raven, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_1H_01, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_1H_02, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_1H_03, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_1H_04, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_1H_05, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_1H_06, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_1H_07, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_1H_08, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_1H_09, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_1H_10, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_1H_11, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_1H_12, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_1H_13, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_1H_14, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_1H_15, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_1H_16, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_1H_17, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_1H_18, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_1H_19, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_1H_20, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_2H_01, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_2H_02, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_2H_03, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_2H_04, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_2H_05, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_2H_06, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_2H_07, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_2H_08, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_2H_09, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_2H_10, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_2H_11, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_2H_12, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_2H_13, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_2H_14, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_2H_15, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_2H_16, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_2H_17, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_2H_18, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_2H_19, 1);
	Npc_RemoveInvItems	(hero, ItMw_BeliarWeapon_2H_20, 1);

	AI_EquipBestMeleeWeapon	(hero);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "RITUAL");
	B_StartOtherRoutine	(Mod_6003_KDW_Saturas_GDG, "RITUAL");
	B_StartOtherRoutine	(Mod_6002_KDF_Pyrokar_GDG, "RITUAL");
};

INSTANCE Info_Mod_Xardas_GDG_Uriziel (C_INFO)
{
	npc		= Mod_843_DMB_Xardas_GDG;
	nr		= 1;
	condition	= Info_Mod_Xardas_GDG_Uriziel_Condition;
	information	= Info_Mod_Xardas_GDG_Uriziel_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Xardas_GDG_Uriziel_Condition()
{
	if (Npc_HasItems(hero, Uriziel_1H) == 1)
	|| (Npc_HasItems(hero, Uriziel_2H) == 1)
	|| (Npc_HasItems(hero, ItRu_MassDeath) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_GDG_Uriziel_Info()
{
	AI_Output(self, hero, "Info_Mod_Xardas_GDG_Uriziel_14_00"); //(feierlich) Das Ritual hat geklappt. Uriziel ist nun mächtiger als je zuvor.
	AI_Output(hero, self, "Info_Mod_Xardas_GDG_Uriziel_15_01"); //Dann wird es jetzt Zeit für die finale Schlacht?
	AI_Output(self, hero, "Info_Mod_Xardas_GDG_Uriziel_14_02"); //So schnell wie möglich, ja. Komm mich morgen in meinem Turm in Khorinis besuchen.
	AI_Output(self, hero, "Info_Mod_Xardas_GDG_Uriziel_14_03"); //Bereite dich solange auf deine Mission vor.
	AI_Output(self, hero, "Info_Mod_Xardas_GDG_Uriziel_14_04"); //Nimm aber noch den Almanach. Wir haben da etwas gefunden, was für dich interessant sein könnte.

	B_GiveInvItems	(self, hero, ItWr_GDG_Almanach_Offen, 1);

	AI_StopProcessInfos	(self);

	Npc_ExchangeRoutine	(self, "START");
	Npc_ExchangeRoutine	(Mod_6003_KDW_Saturas_GDG, "START");
	Npc_ExchangeRoutine	(Mod_6002_KDF_Pyrokar_GDG, "START");

	B_GivePlayerXP	(5000);

	B_LogEntry	(TOPIC_MOD_XERES, "Das Ritual hat geklappt und ich halte nun Uriziel in meinen Händen. Ich soll mich auf den Kampf gegen Xeres vorbereiten und nach Ablauf des Tages Xardas in seinem Turm in Khorinis besuchen.");
	B_SetTopicStatus	(TOPIC_MOD_URIZIEL, LOG_SUCCESS);

	Mod_Xardas_Uriziel_Day = Wld_GetDay();
};

INSTANCE Info_Mod_Xardas_GDG_Lernen_MANA (C_INFO)
{
	npc		= Mod_843_DMB_Xardas_GDG;
	nr		= 1;
	condition	= Info_Mod_Xardas_GDG_Lernen_MANA_Condition;
	information	= Info_Mod_Xardas_GDG_Lernen_MANA_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will meine magischen Kräfte steigern.";
};

FUNC INT Info_Mod_Xardas_GDG_Lernen_MANA_Condition()
{
	if (hero.attribute[ATR_MANA_MAX] <= 300)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_GDG_Lernen_MANA_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_GDG_Lernen_MANA_15_00"); //Ich will meine magischen Kräfte steigern.

	Info_ClearChoices	(Info_Mod_Xardas_GDG_Lernen_MANA);

	Info_AddChoice		(Info_Mod_Xardas_GDG_Lernen_MANA, DIALOG_BACK, Info_Mod_Xardas_GDG_Lernen_MANA_BACK);
	Info_AddChoice		(Info_Mod_Xardas_GDG_Lernen_MANA, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Xardas_GDG_Lernen_MANA_5);
	Info_AddChoice		(Info_Mod_Xardas_GDG_Lernen_MANA, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Xardas_GDG_Lernen_MANA_1);
};

FUNC VOID Info_Mod_Xardas_GDG_Lernen_MANA_BACK()
{
	if (hero.attribute[ATR_MANA_MAX] >= 300)
	{
		AI_Output(self, hero, "Info_Mod_Xardas_GDG_Lernen_MANA_BACK_14_01"); //Deine magischen Kenntnisse sind jetzt so gut, dass ich dir nichts mehr beibringen kann.
	};
	Info_ClearChoices	(Info_Mod_Xardas_GDG_Lernen_MANA);
};

FUNC VOID Info_Mod_Xardas_GDG_Lernen_MANA_5()
{
	B_TeachAttributePoints_New (self, hero, ATR_MANA_MAX, 5, 300);

	Info_ClearChoices	(Info_Mod_Xardas_GDG_Lernen_MANA);

	Info_AddChoice		(Info_Mod_Xardas_GDG_Lernen_MANA, DIALOG_BACK, Info_Mod_Xardas_GDG_Lernen_MANA_BACK);
	Info_AddChoice		(Info_Mod_Xardas_GDG_Lernen_MANA, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Xardas_GDG_Lernen_MANA_5);
	Info_AddChoice		(Info_Mod_Xardas_GDG_Lernen_MANA, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Xardas_GDG_Lernen_MANA_1);
};

FUNC VOID Info_Mod_Xardas_GDG_Lernen_MANA_1()
{
	B_TeachAttributePoints (self, hero, ATR_MANA_MAX, 1, 300);

	Info_ClearChoices	(Info_Mod_Xardas_GDG_Lernen_MANA);

	Info_AddChoice		(Info_Mod_Xardas_GDG_Lernen_MANA, DIALOG_BACK, Info_Mod_Xardas_GDG_Lernen_MANA_BACK);
	Info_AddChoice		(Info_Mod_Xardas_GDG_Lernen_MANA, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Xardas_GDG_Lernen_MANA_5);
	Info_AddChoice		(Info_Mod_Xardas_GDG_Lernen_MANA, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Xardas_GDG_Lernen_MANA_1);
};

INSTANCE Info_Mod_Xardas_GDG_EXIT (C_INFO)
{
	npc		= Mod_843_DMB_Xardas_GDG;
	nr		= 1;
	condition	= Info_Mod_Xardas_GDG_EXIT_Condition;
	information	= Info_Mod_Xardas_GDG_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Xardas_GDG_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Xardas_GDG_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};