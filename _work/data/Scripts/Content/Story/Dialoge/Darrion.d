INSTANCE Info_Mod_Darrion_Hi (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Hi_Condition;
	information	= Info_Mod_Darrion_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Darrion_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Darrion_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Darrion_Hi_11_00"); //Willkommen in meiner Schmiede.
	AI_Output(self, hero, "Info_Mod_Darrion_Hi_11_01"); //Wenn du ein Schwert brauchst, kannst du es bei mir bekommen.
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_PSICAMP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_PSICAMP, "Darrion verkauft Waffen.");
};

INSTANCE Info_Mod_Darrion_Urs (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Urs_Condition;
	information	= Info_Mod_Darrion_Urs_Info;
	permanent	= 0;
	important	= 0;
	description	= "Schmied, hier dein gesegneter Stahl.";
};

FUNC INT Info_Mod_Darrion_Urs_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Darrion_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Urs_Hi))
	&& (Npc_HasItems(hero, ItMi_ErzpaketDarrion) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Darrion_Urs_Info()
{
	AI_Output(hero, self, "Info_Mod_Darrion_Urs_15_00"); //Schmied, hier dein gesegneter Stahl.

	B_GiveInvItems	(hero, self, ItMi_ErzpaketDarrion, 1);

	Npc_RemoveInvItems	(self, ItMi_ErzpaketDarrion, 1);

	AI_Output(self, hero, "Info_Mod_Darrion_Urs_11_01"); //(skeptisch) Wirklich? Na, das will ich erst mal die Probe stellen.

	AI_UseMob	(self, "FIRE", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "FIRE", -1);

	AI_UseMob	(self, "ANVIL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "ANVIL", -1);

	AI_UseMob	(self, "COOL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "COOL", -1);

	AI_UseMob	(self, "SHARP", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "SHARP", -1);

	AI_GotoNpc	(self, hero);

	AI_TurnToNpc	(self, hero);
	AI_TurnToNpc	(hero, self);

	AI_Output(self, hero, "Info_Mod_Darrion_Urs_11_02"); //So die Klinge wäre dann schon mal geschafft. Ich bringe sie jetzt Gor Na Ran.
	AI_Output(self, hero, "Info_Mod_Darrion_Urs_11_03"); //Er soll sie an den besessenen Pflanzen ausprobieren, die Zurzeit wie Unkraut aus dem Boden schießen.
	AI_Output(hero, self, "Info_Mod_Darrion_Urs_15_04"); //Besessene Pflanzen?
	AI_Output(self, hero, "Info_Mod_Darrion_Urs_11_05"); //Nunja, ein kleines Experiment, das außer Kontrolle geriet.
	AI_Output(self, hero, "Info_Mod_Darrion_Urs_11_06"); //Die Baals hatten versucht die Sumpfkrauternte zu steigern, indem sie das Kraut magisch beeinflussten ... mit Zaubern, die Beschwörungen nicht unähnlich sind.
	AI_Output(self, hero, "Info_Mod_Darrion_Urs_11_07"); //Leider nahm das ganze unkontrollierte, dämonische Auswüchse an.
	AI_Output(self, hero, "Info_Mod_Darrion_Urs_11_08"); //Das besessene Kraut ist äußerst aggressiv und hartnäckig. Kaum hat man mit Mühe eine Pflanze erledigt, schießt schon wo anders eine neue empor.
	AI_Output(self, hero, "Info_Mod_Darrion_Urs_11_09"); //Sollte der Stahl tatsächlich die Fähigkeit in sich bergen, Dämonisches zu bannen, wird er den Templern ihre Aufgabe um einiges erleichtern.
	AI_Output(self, hero, "Info_Mod_Darrion_Urs_11_10"); //Und nun folge mir.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOGORNARAN");
};

INSTANCE Info_Mod_Darrion_Urs2 (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Urs2_Condition;
	information	= Info_Mod_Darrion_Urs2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Darrion_Urs2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_GorNaRan_Urs2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Darrion_Urs2_Info()
{
	AI_Output(self, hero, "Info_Mod_Darrion_Urs2_11_00"); //Gut, diese beeindruckende Demonstration des Stahles soll mir genügen. Er ist jeden Krautstängel in diesem Paket hier Wert.

	B_GiveInvItems	(self, hero, ItMi_HerbPaket, 1);

	AI_Output(self, hero, "Info_Mod_Darrion_Urs2_11_01"); //Ach, nimm diese Stängel hier noch als Bonus ... was zu rauchen für unterwegs.

	CreateInvItems	(hero, ItMi_Addon_Joint_02, 3);
	CreateInvItems	(hero, ItMi_Traumruf, 3);

	B_ShowGivenThings	("3 Schwarzer Weiser und 3 Traumruf erhalten");

	AI_Output(hero, self, "Info_Mod_Darrion_Urs2_15_02"); //Danke. Ich hoffe, ihr habt etwas aus der Sache gelernt.
	AI_Output(self, hero, "Info_Mod_Darrion_Urs2_11_03"); //Selbstverständlich. So was machen wir nie wieder. Es muss bessere Wege geben, die Krauternte zu steigern.
	AI_Output(self, hero, "Info_Mod_Darrion_Urs2_11_04"); //Einige unserer Jungs sind gerade auf ganz Khorinis unterwegs und erproben das Wachstum der Pflanzen auf magisch beeinflussten Böden.

	AI_TurnAway	(hero, self);

	AI_Output(hero, self, "Info_Mod_Darrion_Urs2_15_05"); //(zu sich selbst) Na ja, so meinte ich das eigentlich nicht. Aber was soll’s.
	AI_Output(self, hero, "DEFAULT"); //

	B_GivePlayerXP	(400);

	B_LogEntry	(TOPIC_MOD_URS_HUND, "So, das Krautpaket aus dem Sumpflager hätte ich.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Darrion_Hueterklinge (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Hueterklinge_Condition;
	information	= Info_Mod_Darrion_Hueterklinge_Info;
	permanent	= 1;
	important	= 0;
	description	= "Schmiede mir einer Hüterklinge!";
};

FUNC INT Info_Mod_Darrion_Hueterklinge_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_Hueterklinge))
	&& (Mod_TPL_Hueterklinge == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Darrion_Hueterklinge_Info()
{
	AI_Output(hero, self, "Info_Mod_Darrion_Hueterklinge_15_00"); //Schmiede mir einer Hüterklinge!
	AI_Output(self, hero, "Info_Mod_Darrion_Hueterklinge_13_01"); //Hast du alle Zutaten?

	Info_ClearChoices	(Info_Mod_Darrion_Hueterklinge);

	Info_AddChoice	(Info_Mod_Darrion_Hueterklinge, DIALOG_BACK, Info_Mod_Darrion_Hueterklinge_BACK);

	if (Mod_TPL_Hueterklinge_Art == 2)
	{
		if (Npc_HasItems(hero, ItMi_Nugget) >= 8)
		&& (Npc_HasItems(hero, ItPl_Health_Herb_01) >= 6)
		&& (Npc_HasItems(hero, ItMw_1H_VLK_Dagger) >= 1)
		&& (Npc_HasItems(hero, ItFo_MuttonRaw) >= 1)
		{
			Info_AddChoice	(Info_Mod_Darrion_Hueterklinge, "(falsche Zutaten geben)", Info_Mod_Darrion_Hueterklinge_B2);
		};
		if (Npc_HasItems(hero, ItMi_Nugget) >= 8)
		&& (Npc_HasItems(hero, ItPl_Health_Herb_01_Reisfresser) >= 6)
		&& (Npc_HasItems(hero, ItMw_1H_VLK_Dagger_Blut) >= 1)
		&& (Npc_HasItems(hero, ItFo_MuttonRaw_Scav) >= 1)
		{
			Info_AddChoice	(Info_Mod_Darrion_Hueterklinge, "(richtige Zutaten geben)", Info_Mod_Darrion_Hueterklinge_A2);
		};
	}
	else
	{
		if (Npc_HasItems(hero, ItMi_Nugget) >= 4)
		&& (Npc_HasItems(hero, ItMi_Orkstatuette) >= 1)
		&& (Npc_HasItems(hero, ItAt_SkeletonBone) >= 1)
		&& (Npc_HasItems(hero, ItAt_Teeth) >= 1)
		{
			Info_AddChoice	(Info_Mod_Darrion_Hueterklinge, "(falsche Zutaten geben)", Info_Mod_Darrion_Hueterklinge_B1);
		};
		if (Npc_HasItems(hero, ItMi_Nugget) >= 4)
		&& (Npc_HasItems(hero, ItMi_Orkstatuette_Stonehenge) >= 1)
		&& (Npc_HasItems(hero, ItAt_SkeletonBone_Herrscher) >= 1)
		&& (Npc_HasItems(hero, ItAt_Teeth_Wolf) >= 1)
		{
			Info_AddChoice	(Info_Mod_Darrion_Hueterklinge, "(richtige Zutaten geben)", Info_Mod_Darrion_Hueterklinge_A1);
		};
	};
};

FUNC VOID Info_Mod_Darrion_Hueterklinge_BACK()
{
	Info_ClearChoices	(Info_Mod_Darrion_Hueterklinge);
};

FUNC VOID Info_Mod_Darrion_Hueterklinge_B2()
{
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 8);
	Npc_RemoveInvItems	(hero, ItPl_Health_Herb_01, 6);
	Npc_RemoveInvItems	(hero, ItMw_1H_Vlk_Dagger, 1);
	Npc_RemoveInvItems	(hero, ItFo_MuttonRaw, 1);

	AI_UseMob	(self, "FIRE", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "FIRE", -1);

	AI_UseMob	(self, "ANVIL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "ANVIL", -1);

	AI_UseMob	(self, "COOL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "COOL", -1);

	AI_UseMob	(self, "SHARP", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "SHARP", -1);

	AI_GotoNpc	(self, hero);

	AI_TurnToNpc	(self, hero);
	AI_TurnToNpc	(hero, self);

	B_GiveInvItems	(self, hero, ItMw_FalscheHueterklinge_2H, 1);

	B_LogEntry	(TOPIC_MOD_SL_SCHMIEDEFEUERN, "Ich habe mir von Darrion eine falsche Hüterklinge schmieden lassen. Ich sollte jetzt mal bei Cor Angar vorstellig werden.");

	Mod_TPL_Hueterklinge = 2;

	Info_ClearChoices	(Info_Mod_Darrion_Hueterklinge);
};

FUNC VOID Info_Mod_Darrion_Hueterklinge_A2()
{
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 8);
	Npc_RemoveInvItems	(hero, ItPl_Health_Herb_01_Reisfresser, 6);
	Npc_RemoveInvItems	(hero, ItMw_1H_Vlk_Dagger_Blut, 1);
	Npc_RemoveInvItems	(hero, ItFo_MuttonRaw_Scav, 1);

	AI_UseMob	(self, "FIRE", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "FIRE", -1);

	AI_UseMob	(self, "ANVIL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "ANVIL", -1);

	AI_UseMob	(self, "COOL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "COOL", -1);

	AI_UseMob	(self, "SHARP", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "SHARP", -1);

	AI_GotoNpc	(self, hero);

	AI_TurnToNpc	(self, hero);
	AI_TurnToNpc	(hero, self);

	B_GiveInvItems	(self, hero, ItMw_Hueterklinge_2H, 1);

	B_LogEntry	(TOPIC_MOD_SL_SCHMIEDEFEUERN, "Ich habe mir von Darrion eine Hüterklinge schmieden lassen. Ich sollte jetzt mal bei Cor Angar vorstellig werden.");

	Mod_TPL_Hueterklinge = 3;

	Info_ClearChoices	(Info_Mod_Darrion_Hueterklinge);
};

FUNC VOID Info_Mod_Darrion_Hueterklinge_B1()
{
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 4);
	Npc_RemoveInvItems	(hero, ItMi_Orkstatuette, 1);
	Npc_RemoveInvItems	(hero, ItAt_SkeletonBone, 1);
	Npc_RemoveInvItems	(hero, ItAt_Teeth, 1);

	AI_UseMob	(self, "FIRE", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "FIRE", -1);

	AI_UseMob	(self, "ANVIL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "ANVIL", -1);

	AI_UseMob	(self, "COOL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "COOL", -1);

	AI_UseMob	(self, "SHARP", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "SHARP", -1);

	AI_GotoNpc	(self, hero);

	AI_TurnToNpc	(self, hero);
	AI_TurnToNpc	(hero, self);

	B_GiveInvItems	(self, hero, ItMw_FalscheHueterklinge_1H, 1);

	B_LogEntry	(TOPIC_MOD_SL_SCHMIEDEFEUERN, "Ich habe mir von Darrion eine falsche Hüterklinge schmieden lassen. Ich sollte jetzt mal bei Cor Angar vorstellig werden.");

	Mod_TPL_Hueterklinge = 2;

	Info_ClearChoices	(Info_Mod_Darrion_Hueterklinge);
};

FUNC VOID Info_Mod_Darrion_Hueterklinge_A1()
{
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 4);
	Npc_RemoveInvItems	(hero, ItMi_Orkstatuette_Stonehenge, 1);
	Npc_RemoveInvItems	(hero, ItAt_SkeletonBone_Herrscher, 1);
	Npc_RemoveInvItems	(hero, ItAt_Teeth_Wolf, 1);

	AI_UseMob	(self, "FIRE", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "FIRE", -1);

	AI_UseMob	(self, "ANVIL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "ANVIL", -1);

	AI_UseMob	(self, "COOL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "COOL", -1);

	AI_UseMob	(self, "SHARP", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "SHARP", -1);

	AI_GotoNpc	(self, hero);

	AI_TurnToNpc	(self, hero);
	AI_TurnToNpc	(hero, self);

	B_GiveInvItems	(self, hero, ItMw_Hueterklinge_1H, 1);

	B_LogEntry	(TOPIC_MOD_SL_SCHMIEDEFEUERN, "Ich habe mir von Darrion eine Hüterklinge schmieden lassen. Ich sollte jetzt mal bei Cor Angar vorstellig werden.");

	Mod_TPL_Hueterklinge = 3;

	Info_ClearChoices	(Info_Mod_Darrion_Hueterklinge);
};

INSTANCE Info_Mod_Darrion_Woher (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Woher_Condition;
	information	= Info_Mod_Darrion_Woher_Info;
	permanent	= 1;
	important	= 0;
	description	= "Wie kommt ein Kerl wie du in dieses Lager?";
};

FUNC INT Info_Mod_Darrion_Woher_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Darrion_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Darrion_Woher_Info()
{
	AI_Output(hero, self, "Info_Mod_Darrion_Woher_15_00"); //Wie kommt ein Kerl wie du in dieses Lager?
	AI_Output(self, hero, "Info_Mod_Darrion_Woher_11_01"); //Ich war schon immer Schmied und hier war die einzige Möglichkeit, wieder als Schmied zu arbeiten.
	AI_Output(self, hero, "Info_Mod_Darrion_Woher_11_02"); //Ursprünglich komme ich aus Mora Sul. Ich habe dort als Schmied gearbeitet, doch da ich auch Waffen an die Feinde des Königs verkauft habe, haben sie mich in die Kolonie geworfen.
	AI_Output(self, hero, "Info_Mod_Darrion_Woher_11_03"); //Ich bin dann zuerst ins Neue Lager und hab dort als Schürfer gearbeitet, aber das war nichts für mich.
	AI_Output(self, hero, "Info_Mod_Darrion_Woher_11_04"); //Also bin ich hierher gekommen und hier konnte ich wieder als Schmied arbeiten und das mache ich seitdem auch.
};

INSTANCE Info_Mod_Darrion_Trade (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Trade_Condition;
	information	= Info_Mod_Darrion_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Darrion_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Darrion_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Darrion_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Darrion_Pickpocket (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Pickpocket_Condition;
	information	= Info_Mod_Darrion_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Darrion_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 500);
};

FUNC VOID Info_Mod_Darrion_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Darrion_Pickpocket);

	Info_AddChoice	(Info_Mod_Darrion_Pickpocket, DIALOG_BACK, Info_Mod_Darrion_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Darrion_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Darrion_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Darrion_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Darrion_Pickpocket);
};

FUNC VOID Info_Mod_Darrion_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Darrion_Pickpocket);
};

INSTANCE Info_Mod_Darrion_EXIT (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_EXIT_Condition;
	information	= Info_Mod_Darrion_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Darrion_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Darrion_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};