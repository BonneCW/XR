INSTANCE Info_Mod_Logan_Quest (C_INFO)
{
	npc		= Mod_957_BDT_Logan_MT;
	nr		= 1;
	condition	= Info_Mod_Logan_Quest_Condition;
	information	= Info_Mod_Logan_Quest_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Logan_Quest_Condition()
{
	if (Banditen_Dabei == TRUE)
	&& (Mod_OC_Miguel == 0)
	&& (Mod_OC_Morgahard == 0)
	&& (Kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Logan_Quest_Info()
{
	AI_Output(self, hero, "Info_Mod_Logan_Quest_10_00"); //Hey, du bist neu im Lager.
	AI_Output(hero, self, "Info_Mod_Logan_Quest_15_01"); //Ja, das hast du richtig erkannt.
	AI_Output(self, hero, "Info_Mod_Logan_Quest_10_02"); //Und du hast den weiten Weg von Khorinis zu uns geschafft, und lebst noch.
	AI_Output(self, hero, "Info_Mod_Logan_Quest_10_03"); //Du musst schnell auf den Beinen sein. Das sind doch schon mal gute Voraussetzungen.
	AI_Output(hero, self, "Info_Mod_Logan_Quest_15_04"); //Gute Voraussetzungen wofür?
	AI_Output(self, hero, "Info_Mod_Logan_Quest_10_05"); //Für unseren Plan.
	AI_Output(hero, self, "Info_Mod_Logan_Quest_15_06"); //Worum geht es?
	AI_Output(self, hero, "Info_Mod_Logan_Quest_10_07"); //Nun, wie klar sein dürfte befinden sind einige Reichtümer im Haus der Erzbarone. Auch ist zur Zeit ein stinkreicher Händler bei ihnen in der Burg, mit Handelswaren beachtlichen Wertes.
	AI_Output(self, hero, "Info_Mod_Logan_Quest_10_08"); //Das Problem ist nur, an dies alles heranzukommen. Dafür bedarf es einer kleinen Ablenkung. Und da kommst du ins Spiel.
	AI_Output(hero, self, "Info_Mod_Logan_Quest_15_09"); //Was genau habt ihr euch denn vorgestellt?
	AI_Output(self, hero, "Info_Mod_Logan_Quest_10_10"); //Nun, uns ist vor einigen Wochen eine Söldnerrüstung "in die Hände gefallen". Wie du vielleicht mitbekommen hast, sind das Alte und Neue Lager nicht so gut aufeinander zu sprechen.
	AI_Output(self, hero, "Info_Mod_Logan_Quest_10_11"); //Wenn nun jemand mit einer Söldnerrüstung ins Alte Lager marschieren würde ...
	AI_Output(hero, self, "Info_Mod_Logan_Quest_15_12"); //Was, ist das wirklich euer Ernst!? Ich soll mitten ins Wespennest?
	AI_Output(self, hero, "Info_Mod_Logan_Quest_10_13"); //Es ist nicht ganz so gefährlich, wie es sich anhört. Du wirst auch mit einem Schnelligkeitstrank ausgestattet.
	AI_Output(self, hero, "Info_Mod_Logan_Quest_10_14"); //Du läufst dann wenige Minuten. etwas auf dem Hof herum und ziehst die Aufmerksamkeit der Gardisten auf dich. Je mehr Zeit du uns verschaffst, desto besser.
	AI_Output(self, hero, "Info_Mod_Logan_Quest_10_15"); //Wir nehmen indessen getarnt mit alten Schattenrüstungen etwas von den Reichtümern des Burginneren an uns. Was sagst du?

	Info_ClearChoices	(Info_Mod_Logan_Quest);

	Info_AddChoice	(Info_Mod_Logan_Quest, "Auf keinen Fall, ich bin doch nicht lebensmüde.", Info_Mod_Logan_Quest_B);
	Info_AddChoice	(Info_Mod_Logan_Quest, "Ok, ich mach’s.", Info_Mod_Logan_Quest_A);
};

FUNC VOID Info_Mod_Logan_Quest_B()
{
	AI_Output(hero, self, "Info_Mod_Logan_Quest_B_15_00"); //Auf keinen Fall, ich bin doch nicht lebensmüde.
	AI_Output(self, hero, "Info_Mod_Logan_Quest_B_10_01"); //Schade. (vorwurfsvoll) Ich hoffe du weißt, dass und damit eine ordentliche Beute entgeht.
	
	Info_ClearChoices	(Info_Mod_Logan_Quest);
};

FUNC VOID Info_Mod_Logan_Quest_A()
{
	AI_Output(hero, self, "Info_Mod_Logan_Quest_A_15_00"); //Ok, ich mach’s.
	AI_Output(self, hero, "Info_Mod_Logan_Quest_A_10_01"); //Sehr gut. Ok, Ich, Morgahard und Miguel warten vor dem Eingang zur inneren Burg.
	AI_Output(self, hero, "Info_Mod_Logan_Quest_A_10_02"); //Sobald du für Ablenkung drinnen sorgst, übernehme ich und Morgahard den Händler und das Haus der Erzbarone, während Miguel etwas in den alten Schriften der Feuermagier nach nützlichem und profitablem Wissen stöbert.
	AI_Output(self, hero, "Info_Mod_Logan_Quest_A_10_03"); //Alles klar? Gut, dann kann es ja losgehen.

	CreateInvItems	(hero, ItAr_Sld_Logan, 1);
	CreateInvItems	(hero, ItPo_Speed, 1);

	B_ShowGivenThings	("leichte Söldnerrüstun und Trank erhalten");

	Mod_LoganQuest = 1;

	Log_CreateTopic	(TOPIC_MOD_BDT_LOGAN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BDT_LOGAN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BDT_LOGAN, "Ich soll mit der leichten Söldnerrüstung von Logan die Gardisten in der inneren Burg ablenken, während er, Miguel und Morgahard die Schätze dort rauben.");

	Info_ClearChoices	(Info_Mod_Logan_Quest);

	AI_StopProcessInfos	(self);

	CreateInvItems	(self, Stt_Armor_M, 1);
	CreateInvItems	(Mod_790_BDT_Morgahard_MT, Stt_Armor_M, 1);
	CreateInvItems	(Mod_958_BDT_Miguel_MT, Stt_Armor_M, 1);

	AI_EquipArmor	(self, Stt_Armor_M);
	AI_EquipArmor	(Mod_790_BDT_Morgahard_MT, Stt_Armor_M);
	AI_EquipArmor	(Mod_958_BDT_Miguel_MT, Stt_Armor_M);

	B_StartOtherRoutine	(self, "AL");
	B_StartOtherRoutine	(Mod_790_BDT_Morgahard_MT, "AL");
	B_StartOtherRoutine	(Mod_958_BDT_Miguel_MT, "AL");
};

INSTANCE Info_Mod_Logan_Belohnung (C_INFO)
{
	npc		= Mod_957_BDT_Logan_MT;
	nr		= 1;
	condition	= Info_Mod_Logan_Belohnung_Condition;
	information	= Info_Mod_Logan_Belohnung_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Logan_Belohnung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Logan_Quest))
	&& (Mod_LoganQuest == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Logan_Belohnung_Info()
{
	if (Mod_LaufZeit <= 60)
	{
		AI_Output(self, hero, "Info_Mod_Logan_Belohnung_10_00"); //Du hättest dir wirklich etwas mehr Mühe geben können. In der kurzen Zeit haben wir nicht so viel zusammenbekommen.

		B_GiveInvItems	(self, hero, ItMi_Gold, 200);

		B_GivePlayerXP	(200);
	}
	else if (Mod_LaufZeit <= 120)
	{
		AI_Output(self, hero, "Info_Mod_Logan_Belohnung_10_01"); //Naja, etwas mehr Zeit hätten wir schon gebrauchen können. Hier dein Anteil.

		CreateInvItems	(hero, ItMi_Gold, 300);
		CreateInvItems	(hero, ItMi_Nugget, 4);
		CreateInvItems	(hero, ItAt_LurkerSkin, 4);

		B_ShowGivenThings	("300 Gold, 4 Erzbrocken und 4 Reptilienhäute erhalten");

		B_GivePlayerXP	(300);
	}
	else if (Mod_LaufZeit < 180)
	{
		AI_Output(self, hero, "Info_Mod_Logan_Belohnung_10_02"); //Du hast deine Arbeit gut gemacht und dir deinen Anteil verdient, anbei auch ein Rezept von Miguel.

		CreateInvItems	(hero, ItMi_Gold, 350);
		CreateInvItems	(hero, ItMi_Nugget, 5);
		CreateInvItems	(hero, ItAt_LurkerSkin, 4);
		CreateInvItems	(hero, ItAt_TrollTooth, 1);
		CreateInvItems	(hero, ItAt_Shadowhorn, 2);
		CreateInvItems	(hero, ITWr_Addon_MCELIXIER_01, 1);

		B_ShowGivenThings	("350 Gold, 5 Erzbrocken, 4 Reptilienhäute, Trollhauer, 2 Schattenläuferhörner und Rezept erhalten");

		B_GivePlayerXP	(400);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Logan_Belohnung_10_03"); //Muahaha, du hast die Gardisten wirklich großartig an der Nase herumgeführt und uns mehr als genug Zeit verschafft dem Alten Lager einige kostbare Schätze zu entreißen.
		AI_Output(self, hero, "Info_Mod_Logan_Belohnung_10_04"); //Auch Miguel hat in den Büchern Nützliches gefunden, wovon du deinen Anteil bekommst.

		CreateInvItems	(hero, ItMi_Gold, 500);
		CreateInvItems	(hero, ItMi_Nugget, 7);
		CreateInvItems	(hero, ItAt_LurkerSkin, 5);
		CreateInvItems	(hero, ItAt_TrollTooth, 2);
		CreateInvItems	(hero, ItAt_Shadowhorn, 2);
		CreateInvItems	(hero, ITWr_Addon_MCELIXIER_01, 1);
		CreateInvItems	(hero, ItAt_SharkTeeth, 4);

		if (hero.guild == GIL_NOV)
		{
			CreateInvItems	(hero, ItSc_AuraFrost, 1);
			CreateInvItems	(hero, ItSc_SumIceGol, 1);
		}
		else if (hero.guild == GIL_VLK)
		{
			CreateInvItems	(hero, ItSc_AuraFeuer, 1);
			CreateInvItems	(hero, ItSc_SumFireGol, 1);
		}
		else if (hero.guild == GIL_KDF)
		{
			CreateInvItems	(hero, ItSc_SumFireGol, 1);
			CreateInvItems	(hero, ItSc_SumIceGol, 1);
		}
		else
		{
			CreateInvItems	(hero, ItSc_AuraBerserker, 1);
		};

		B_ShowGivenThings	("500 Gold, 7 Erzbrocken, 5 Reptilienhäute, 2 Trollhauer, 2 Schattenläuferhörner, Rezept und 4 Sumpfhaizähne erhalten");

		B_GivePlayerXP	(600);
	};

	AI_UnequipArmor	(hero);
	AI_UnequipArmor	(self);
	AI_UnequipArmor	(Mod_790_BDT_Morgahard_MT);
	AI_UnequipArmor	(Mod_958_BDT_Miguel_MT);

	AI_EquipArmor	(self, ItAr_BDT_M_01);
	AI_EquipArmor	(Mod_790_BDT_Morgahard_MT, ItAr_BDT_M_01);
	AI_EquipArmor	(Mod_958_BDT_Miguel_MT, ItAr_BDT_M_01);

	B_StartOtherRoutine	(self, "START");
	B_StartOtherRoutine	(Mod_790_BDT_Morgahard_MT, "START");
	B_StartOtherRoutine	(Mod_958_BDT_Miguel_MT, "START");

	Npc_RemoveInvItems	(hero, ItAr_Sld_Logan, 1);

	AI_EquipArmor	(hero, ItAr_BDT_M_01);

	B_SetTopicStatus	(TOPIC_MOD_BDT_LOGAN, LOG_SUCCESS);

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Logan_Pickpocket (C_INFO)
{
	npc		= Mod_957_BDT_Logan_MT;
	nr		= 1;
	condition	= Info_Mod_Logan_Pickpocket_Condition;
	information	= Info_Mod_Logan_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Logan_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 111);
};

FUNC VOID Info_Mod_Logan_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Logan_Pickpocket);

	Info_AddChoice	(Info_Mod_Logan_Pickpocket, DIALOG_BACK, Info_Mod_Logan_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Logan_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Logan_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Logan_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Logan_Pickpocket);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Aabid_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Aabid_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Aabid_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Logan_EXIT (C_INFO)
{
	npc		= Mod_957_BDT_Logan_MT;
	nr		= 1;
	condition	= Info_Mod_Logan_EXIT_Condition;
	information	= Info_Mod_Logan_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Logan_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Logan_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};