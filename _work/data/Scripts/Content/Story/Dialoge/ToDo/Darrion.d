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
	description	= "Schmiede mir eine Hüterklinge!";
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
	AI_Output(hero, self, "Info_Mod_Darrion_Hueterklinge_15_00"); //Schmiede mir eine Hüterklinge!
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

INSTANCE Info_Mod_Darrion_Sumpfmensch (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Sumpfmensch_Condition;
	information	= Info_Mod_Darrion_Sumpfmensch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Fortuno hat mir erzählt, du hast den heulenden Sumpfmenschen gesehen.";
};

FUNC INT Info_Mod_Darrion_Sumpfmensch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fortuno_Sumpfmensch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Darrion_Sumpfmensch_Info()
{
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch_15_00"); //Fortuno hat mir erzählt, du hast den heulenden Sumpfmenschen gesehen.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_11_01"); //Ja, das habe ich, und es hätte mich beinahe das Leben gekostet! Ich weiß nicht, welchem Gott ich danken soll, aber dass ich noch lebe grenzt an ein Wunder.
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch_15_02"); //Wo hast du ihn getroffen?
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_11_03"); //Tief im Sumpf. Ich habe dort früher spezielles Sumpfkraut gepflanzt, das an den Randgebieten einfach nicht gedeiht.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_11_04"); //Als ich vor einigen Wochen dort nach dem Rechten sehen wollte, stand plötzlich diese Kreatur vor mir. Ich hab mir fast in die Hosen geschissen!
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_11_05"); //Da hab sogar ich alter Seebär mich gefühlt, wie ein kleines Mädchen!
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_11_06"); //Ich  hab's den andren gesagt und ich sag's dir: Wenn du diesem Monster jemals begegnen solltest, nimm die Beine in die Hand und renn!

	B_StartOtherRoutine	(Mod_951_PSINOV_Fortuno_MT, "START");
	B_StartOtherRoutine	(Mod_1339_PSINOV_Novize_MT, "START");
	B_StartOtherRoutine	(Mod_2008_PSINOV_Ghorim_MT, "START");
	B_StartOtherRoutine	(Mod_1337_PSINOV_Novize_MT, "START");
	B_StartOtherRoutine	(Mod_1336_PSINOV_Novize_MT, "START");
	B_StartOtherRoutine	(Mod_1338_PSINOV_Novize_MT, "START");

	Info_ClearChoices	(Info_Mod_Darrion_Sumpfmensch);

	Info_AddChoice	(Info_Mod_Darrion_Sumpfmensch, "Wo im Sumpf hast du dein Sumpfkraut gefplanzt?", Info_Mod_Darrion_Sumpfmensch_C);
	Info_AddChoice	(Info_Mod_Darrion_Sumpfmensch, "Du bist früher zur See gefahren?", Info_Mod_Darrion_Sumpfmensch_B);
	Info_AddChoice	(Info_Mod_Darrion_Sumpfmensch, "Was für spezielles Sumpfkraut hast du da gepflanzt?", Info_Mod_Darrion_Sumpfmensch_A);
};

FUNC VOID Info_Mod_Darrion_Sumpfmensch_C()
{
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch_C_15_00"); //Wo im Sumpf hast du dein Sumpfkraut gefplanzt?
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_C_11_01"); //Irgendwo weit drinnen, aber komm ja nicht auf die Idee da zu suchen, Junge, ich sag's nochmals: das Wesen ist gefährlich, das reißt dir den Arsch auf!
};

FUNC VOID Info_Mod_Darrion_Sumpfmensch_B()
{
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch_B_15_00"); //Du bist früher zur See gefahren?
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_B_11_01"); //Ich war früher Pirat, Junge! Und was für einer!
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch_B_15_02"); //Warum hast du die Piraten verlassen?
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_B_11_03"); //Ach, ich hatte das Piratendasein satt, Junge.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_B_11_04"); //Und hier? Hier stampf ich tagsüber etwas Kraut, damit die Muskeln nicht rosten, rauch ein bisschen Sumpfkraut und lass mir den restlichen Tag die Sonne auf den Bauch scheinen.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_B_11_05"); //Und jetzt lass mich in Ruhe.

	Info_ClearChoices	(Info_Mod_Darrion_Sumpfmensch);

	AI_StopProcessInfos	(self);
	
	B_StartOtherRoutine(Mod_3001_PSINOV_Balor_MT, "ATDARRION");
};

FUNC VOID Info_Mod_Darrion_Sumpfmensch_A()
{
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch_A_15_00"); //Was für spezielles Sumpfkraut hast du da gepflanzt?
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_A_11_01"); //Das war ganz was Feines, das hab ich aus dem großen Sumpf der ein bisschen von der Piratenbucht entfernt liegt ausgegraben und mitgebracht.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_A_11_02"); //Musste ein paar ziemlich hässliche Viecher umhaun' um da dran zu kommen.
};

INSTANCE Info_Mod_Darrion_Sumpfmensch2 (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Sumpfmensch2_Condition;
	information	= Info_Mod_Darrion_Sumpfmensch2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Darrion_Sumpfmensch2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_GorNaMon_Sumpfmensch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Darrion_Sumpfmensch2_Info()
{
	AI_TurnAway(self, hero);
	
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch2_11_00"); //(zu sich selbst) Kann es sein, dass er...? Nein nein nein, vollkommen ausgeschlossen, ganz unmöglich!!! Er würde nie... aber was wenn doch? Kann es sein, dass er...?
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch2_15_01"); //Warum so nervös?
	
	AI_TurnToNpc(self, hero);
	
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch2_11_02"); //Was?! Achso, äh... nervös? Wie kommst du den darauf? (Gezwungenes Lachen)
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch2_15_03"); //Was ist los?
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch2_11_04"); //Was los ist? Was soll los sein? (Gezwungenes Lachen) Garnichts, garnichts, aber mir fällt gerade ein, dass ich den Tee noch am Feuer stehen habe, ich sollte mich besser beeilen!
	
	AI_StopProcessInfos(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Darrion_Sumpfmensch3 (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Sumpfmensch3_Condition;
	information	= Info_Mod_Darrion_Sumpfmensch3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Na. Ausgeschlafen?";
};

FUNC INT Info_Mod_Darrion_Sumpfmensch3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Balor_Sumpfmensch4))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Darrion_Sumpfmensch3_Info()
{
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch3_15_00"); //Na. Ausgeschlafen?
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch3_11_01"); //Ich habe gehört, du warst bei den Piraten...
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch3_15_02"); //Ja. Und bei denen habe ich so einige interessante Sachen erfahren.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch3_11_03"); //Da ich meinen alten Schlüssel nirgendwo mehr finde, hast du wohl ziemlich viel erfahren, wie?
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch3_15_04"); //Genug auf jeden Fall. Ich weiß, dass du nur hierhergekommen bist, um einen guten Platz für dein Kraut zu finden.
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch3_15_05"); //Und ich vermute mal, die Blätter auf die du es abgesehen hast waren nicht das einzige, das aus der Pflanze gewachsen ist, stimmt's?
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch3_11_06"); //(seufzt tief) Ja, du hast Recht. Der heulende Sumpfmensch ist in Wirklichkeit ein Sumpfgolem. Er ist an der Pflanze getrieben.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch3_11_07"); //Zuerst habe ich ihn nur für eine seltsame Wurzel gehalten, irgendwann stand plötzlich der kleine Golem vor mir und sah mich mit großen, angsterfüllten Augen an.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch3_11_08"); //Ich weiß, ich hätte das Biest direkt abschlachten sollen, aber ich hab's nicht über mein salzwassergetränktes Herz gebracht.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch3_11_09"); //Ich hab den Kleinen laufen lassen, aber er ist mir im Sumpf nicht mehr von der Seite gewichen. Irgendwann hab ich mich damit abgefunden.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch3_11_10"); //Es mag seltsam klingen, aber wir haben wohl so etwas wie Freundschaft geschlossen.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch3_11_11"); //Ich wusste, dass die Templer diesen Golem bei erstem Kontakt niedermetzeln würden, also habe ich allen die Geschichte vom heulenden Sumpfmenschen erzählt, um sie vom Sumpf fern zu halten.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch3_11_12"); //Aber dann hat er plötzlich begonnen, Leute anzugreifen. Als ich in den Sumpf wollte, um zu sehen was mit ihm los ist, hat er mich einfach umgehauen... und wie ich gehört habe, hast du dann das gleiche mit ihm gemacht.
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch3_15_13"); //Da wär ich mir nicht sicher. Ich war auch bei dem Eremiten, der dir das Buch übersetzt hat.
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch3_15_14"); //Er hat mich gebeten, dir mitzuteilen, dass die Pflanze in irgendeinem Zusammenhang mit fünf Sumpfriesen stehen soll.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch3_11_15"); //Du glaubst... das heißt... das heißt es gibt mehr Golems als nur meinen?!
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch3_15_16"); //Genau das wird es wohl heißen. Und vermutlich waren es die anderen vier, die die Leute und dich angegriffen haben.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch3_11_17"); //Fünf Sumpfriesen... einen davon hast du schon platt gemacht und einer ist harmlos. Dann bleiben noch drei Stück übrig. Die werd' ich erledigen!
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch3_15_18"); //Ich komme mit dir.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch3_11_19"); //Ich schulde dir was.
	
	AI_StopProcessInfos(self);

	B_StartOtherRoutine	(self, "GUIDETOFLOWER");
	B_StartOtherRoutine(Mod_2013_PSINOV_Joru_MT, "START");
	
	Wld_InsertNpc(SwampGolem_Sumpfmensch_02, "PATH_TAKE_HERB_022");
};

INSTANCE Info_Mod_Darrion_Sumpfmensch4 (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Sumpfmensch4_Condition;
	information	= Info_Mod_Darrion_Sumpfmensch4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Darrion_Sumpfmensch4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Darrion_Sumpfmensch3))
	&& (Npc_GetDistToWP(hero, "OW_PATH_BLOODFLY11_SPAWN01") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Darrion_Sumpfmensch4_Info()
{
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch4_11_00"); //Das hier ist die Pflanze. Wir sollten uns wohl trennen. Geh du weiter geradeaus, ich werde die Umgebung hier erkunden.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch4_11_01"); //Ist gut.
	
	AI_StopProcessInfos(self);
	
	Wld_InsertNpc(SwampGolem_Sumpfmensch_03, "FP_ROAM_OW_BLOODFLY_12_02");
};

INSTANCE Info_Mod_Darrion_Sumpfmensch5 (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Sumpfmensch5_Condition;
	information	= Info_Mod_Darrion_Sumpfmensch5_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Darrion_Sumpfmensch5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Joru_Sumpfmensch3))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Darrion_Sumpfmensch5_Info()
{
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch5_11_00"); //Danke. ich stehe tief in deiner Schuld. (Roger heult) Darrion lacht. Ja und Roger natürlich auch.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch5_11_01"); //Hier. Es ist nicht viel, aber lass es mich dir zum Zeichen meiner Dankbarkeit geben. Es ist der Tabak aus dem letzten Blatt der Golempflanze. Vielleicht kannst du ja was damit anfangen.
	
	B_GiveInvItems(self, hero, ItMi_SumpfTabak, 1);
	
	AI_StopProcessInfos(self);
	
	B_GivePlayerXP(500);
	
	B_SetTopicStatus(TOPIC_MOD_SL_SUMPFMENSCH, LOG_SUCCESS);
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
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Darrion_Pickpocket_Condition()
{
	C_Beklauen	(64, ItMiSwordRaw, 5);
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
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Darrion_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Darrion_Pickpocket);

		Info_AddChoice	(Info_Mod_Darrion_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Darrion_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Darrion_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Darrion_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Darrion_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Darrion_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Darrion_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Darrion_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Darrion_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Darrion_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Darrion_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Darrion_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Darrion_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
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