INSTANCE Info_Mod_Fester_Hi (C_INFO)
{
	npc		= Mod_784_SLD_Fester_MT;
	nr		= 1;
	condition	= Info_Mod_Fester_Hi_Condition;
	information	= Info_Mod_Fester_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo.";
};

FUNC INT Info_Mod_Fester_Hi_Condition()
{
	if (hero.guild == GIL_MIL)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fester_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Fester_Hi_15_00"); //Hallo.
	AI_Output(self, hero, "Info_Mod_Fester_Hi_02_01"); //Hey, du bist doch neu im Lager. Du willst doch bestimmt schnell aufsteigen und es bei uns zu was bringen.
	AI_Output(hero, self, "Info_Mod_Fester_Hi_15_02"); //Sicher, warum nicht.
	AI_Output(self, hero, "Info_Mod_Fester_Hi_02_03"); //Sehr gut. Dann müsstest du nur mich und zwei andere Jungs auf die Jagd begleiten, paar Molerat und Scavenger erlegen, gar nicht schwer. Was sagst du?

	Info_ClearChoices	(Info_Mod_Fester_Hi);

	Info_AddChoice	(Info_Mod_Fester_Hi, "Nö, ist mir zu öde.", Info_Mod_Fester_Hi_B);
	Info_AddChoice	(Info_Mod_Fester_Hi, "Klar, bin dabei.", Info_Mod_Fester_Hi_A);
};

FUNC VOID Info_Mod_Fester_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Fester_Hi_B_15_00"); //Nö, ist mir zu öde.
	AI_Output(self, hero, "Info_Mod_Fester_Hi_B_02_01"); //Soso, aber bestimmt der erste, der herumjammert, wenn es nichts im Lager zu essen gibt. Tse, tse, tse, so ein Taugenichts.
	
	Info_ClearChoices	(Info_Mod_Fester_Hi);
};

FUNC VOID Info_Mod_Fester_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Fester_Hi_A_15_00"); //Klar, bin dabei.
	AI_Output(self, hero, "Info_Mod_Fester_Hi_A_02_01"); //Fantastisch. Engardo und Nodrak sollten eigentlich schon losgelaufen sein und vor dem Lager auf uns warten. Los geht’s.
	
	Info_ClearChoices	(Info_Mod_Fester_Hi);

	B_StartOtherRoutine	(Mod_904_SLD_Engardo_MT, "WAITFORPLAYER");
	B_StartOtherRoutine	(Mod_1275_SLD_Nodrak_MT, "WAITFORPLAYER");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "WAITFORPLAYER");

	Mod_SLD_Fester = 1;

	Log_CreateTopic	(TOPIC_MOD_SLD_FESTER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SLD_FESTER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SLD_FESTER, "Ich laufe jetzt mit Fester vor das Lager, um dort mit ihm, Engardo und Nodrak jagen zu gehen.");
};

INSTANCE Info_Mod_Fester_VorLager (C_INFO)
{
	npc		= Mod_784_SLD_Fester_MT;
	nr		= 1;
	condition	= Info_Mod_Fester_VorLager_Condition;
	information	= Info_Mod_Fester_VorLager_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Fester_VorLager_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fester_Hi))
	&& (Npc_GetDistToWP(hero, "OW_PATH_07_21") < 300)
	&& (Mod_SLD_Fester == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fester_VorLager_Info()
{
	AI_Output(self, hero, "Info_Mod_Fester_VorLager_02_00"); //Auf geht’s.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SMALLCAVE");
	B_StartOtherRoutine	(Mod_904_SLD_Engardo_MT, "SMALLCAVE");
	B_StartOtherRoutine	(Mod_1275_SLD_Nodrak_MT, "SMALLCAVE");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_904_SLD_Engardo_MT.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_1275_SLD_Nodrak_MT.aivar[AIV_PARTYMEMBER] = TRUE;
};

INSTANCE Info_Mod_Fester_AtSmallCave (C_INFO)
{
	npc		= Mod_784_SLD_Fester_MT;
	nr		= 1;
	condition	= Info_Mod_Fester_AtSmallCave_Condition;
	information	= Info_Mod_Fester_AtSmallCave_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Fester_AtSmallCave_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fester_VorLager))
	&& (Npc_GetDistToWP(hero, "LOCATION_24_IN") < 300)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fester_AtSmallCave_Info()
{
	AI_Output(self, hero, "Info_Mod_Fester_AtSmallCave_02_00"); //Ahh, hier ist ein gutes Plätzchen.
	AI_Output(hero, self, "Info_Mod_Fester_AtSmallCave_15_01"); //Hä, wollen wir uns hier auf die Lauer legen?
	AI_Output(self, hero, "Info_Mod_Fester_AtSmallCave_02_02"); //Ähh, ja, so ähnlich.

	CreateInvItems	(self, ItMi_Joint, 1);

	B_UseItem	(self, ItMi_Joint);

	AI_Output(self, hero, "Info_Mod_Fester_AtSmallCave_02_03"); //Ahh, herrlich.
	AI_Output(hero, self, "Info_Mod_Fester_AtSmallCave_15_04"); //Ähh, was ist nun ...
	AI_Output(self, hero, "Info_Mod_Fester_AtSmallCave_02_05"); //Achso, die Jagd. Tjaa, siehst du die wohlgenährten Scavanger und Molerat dort hinten? Erlege sie und bringe mir jeweils zehn Scavanger- und Moleratkeulen. Noch Fragen?

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SMOKEPAUSE");
	B_StartOtherRoutine	(Mod_904_SLD_Engardo_MT, "SMOKEPAUSE");
	B_StartOtherRoutine	(Mod_1275_SLD_Nodrak_MT, "SMOKEPAUSE");

	B_LogEntry	(TOPIC_MOD_SLD_FESTER, "Na toll. Während sich die drei bekiffen, darf ich die wohlgenährten Scavanger und Molerat erlegen und je zehn Fleischkeulen der Viecher zu Fester bringen.");

	Wld_InsertNpc	(Scavenger_Fett_01, "SPAWN_OW_WARAN_NC_03");
	Wld_InsertNpc	(Scavenger_Fett_02, "SPAWN_OW_WARAN_NC_03");
	Wld_InsertNpc	(Scavenger_Fett_03, "SPAWN_OW_WARAN_NC_03");
	Wld_InsertNpc	(Scavenger_Fett_04, "SPAWN_OW_WARAN_NC_03");
	Wld_InsertNpc	(Scavenger_Fett_05, "SPAWN_OW_WARAN_NC_03");

	Wld_InsertNpc	(Molerat_Fett_01, "OW_PATH_158");
	Wld_InsertNpc	(Molerat_Fett_02, "OW_PATH_158");
	Wld_InsertNpc	(Molerat_Fett_03, "OW_PATH_158");
	Wld_InsertNpc	(Molerat_Fett_04, "OW_PATH_158");
	Wld_InsertNpc	(Molerat_Fett_05, "OW_PATH_158");
};

INSTANCE Info_Mod_Fester_HabFleisch (C_INFO)
{
	npc		= Mod_784_SLD_Fester_MT;
	nr		= 1;
	condition	= Info_Mod_Fester_HabFleisch_Condition;
	information	= Info_Mod_Fester_HabFleisch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier sind je zehn Scavanger- und Moleratkeulen.";
};

FUNC INT Info_Mod_Fester_HabFleisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fester_AtSmallCave))
	&& (Npc_IsDead(Scavenger_Fett_01))
	&& (Npc_IsDead(Scavenger_Fett_02))
	&& (Npc_IsDead(Scavenger_Fett_03))
	&& (Npc_IsDead(Scavenger_Fett_04))
	&& (Npc_IsDead(Scavenger_Fett_05))
	&& (Npc_IsDead(Molerat_Fett_01))
	&& (Npc_IsDead(Molerat_Fett_02))
	&& (Npc_IsDead(Molerat_Fett_03))
	&& (Npc_IsDead(Molerat_Fett_04))
	&& (Npc_IsDead(Molerat_Fett_05))
	&& (Npc_HasItems(hero, ItFo_MuttonRaw) >= 20)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fester_HabFleisch_Info()
{
	AI_Output(hero, self, "Info_Mod_Fester_HabFleisch_15_00"); //Hier sind je zehn Scavanger- und Moleratkeulen.

	B_ShowGivenThings	("20 rohes Fleisch gegeben");

	Npc_RemoveInvItems	(hero, ItFo_MuttonRaw, 20);

	AI_Output(self, hero, "Info_Mod_Fester_HabFleisch_02_01"); //(benommen) Wäs? Achso, das Fleisch. Gut gemacht, Jungchen.
	AI_Output(self, hero, "Info_Mod_Fester_HabFleisch_02_02"); //Nun gehen wir noch ein Stückchen weiter, um etwas anderes in einer Höhle zu erlegen.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "GREATCAVE");
	B_StartOtherRoutine	(Mod_904_SLD_Engardo_MT, "GREATCAVE");
	B_StartOtherRoutine	(Mod_1275_SLD_Nodrak_MT, "GREATCAVE");

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Fester_AtGreatCave (C_INFO)
{
	npc		= Mod_784_SLD_Fester_MT;
	nr		= 1;
	condition	= Info_Mod_Fester_AtGreatCave_Condition;
	information	= Info_Mod_Fester_AtGreatCave_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Fester_AtGreatCave_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fester_HabFleisch))
	&& (Npc_GetDistToWP(hero, "LOCATION_23_CAVE_1_OUT") < 400)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fester_AtGreatCave_Info()
{
	AI_Output(hero, self, "Info_Mod_Fester_AtGreatCave_15_00"); //Ähh, und was wollen wir hier erlegen?
	AI_Output(self, hero, "Info_Mod_Fester_AtGreatCave_02_01"); //(bekifft) Habe ich erlegen gesagt? Ich meinte selbstverständlich erledigen.
	AI_Output(self, hero, "Info_Mod_Fester_AtGreatCave_02_02"); //Ähh, aber einen Augenblick mal. Da haben sich einige riesen fette Orks in der Höhle eingenistet. Geh rein und erledige sie.
	AI_Output(hero, self, "Info_Mod_Fester_AtGreatCave_15_03"); //Ähh, sieht mir mehr nach einigen jungen Goblins aus ... ach egal.
	
	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "WAITING");
	B_StartOtherRoutine	(Mod_904_SLD_Engardo_MT, "WAITING");
	B_StartOtherRoutine	(Mod_1275_SLD_Nodrak_MT, "WAITING");

	B_LogEntry	(TOPIC_MOD_SLD_FESTER, "Jetzt darf ich die drei jungen Goblins in der Höhle erledigen.");

	Wld_InsertNpc	(Gobbo_Fester_01, "LOCATION_23_CAVE_1_02");
	Wld_InsertNpc	(Gobbo_Fester_02, "LOCATION_23_CAVE_1_02");
	Wld_InsertNpc	(Gobbo_Fester_03, "LOCATION_23_CAVE_1_02");
};

INSTANCE Info_Mod_Fester_GobbosTot (C_INFO)
{
	npc		= Mod_784_SLD_Fester_MT;
	nr		= 1;
	condition	= Info_Mod_Fester_GobbosTot_Condition;
	information	= Info_Mod_Fester_GobbosTot_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Fester_GobbosTot_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fester_AtGreatCave))
	&& (Npc_IsDead(Gobbo_Fester_01))
	&& (Npc_IsDead(Gobbo_Fester_02))
	&& (Npc_IsDead(Gobbo_Fester_03))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fester_GobbosTot_Info()
{
	AI_Output(self, hero, "Info_Mod_Fester_GobbosTot_02_00"); //Seehr gut, jetzt können wir etwas Sumpfkraut herstell ... ähh, uns in der Alchemie üben. Warte ne Minute, bis wie fertig sind.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "POTIONPAUSE");
	B_StartOtherRoutine	(Mod_904_SLD_Engardo_MT, "POTIONPAUSE");
	B_StartOtherRoutine	(Mod_1275_SLD_Nodrak_MT, "POTIONPAUSE");

	B_LogEntry	(TOPIC_MOD_SLD_FESTER, "Jetzt darf ich auch noch auf die drei warten, bis sie neue Sumfkrautstängel hergestellt haben.");
};

INSTANCE Info_Mod_Fester_PotionReady (C_INFO)
{
	npc		= Mod_784_SLD_Fester_MT;
	nr		= 1;
	condition	= Info_Mod_Fester_PotionReady_Condition;
	information	= Info_Mod_Fester_PotionReady_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Fester_PotionReady_Condition()
{
	if (Mod_SLD_Fester == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fester_PotionReady_Info()
{
	AI_Output(self, hero, "Info_Mod_Fester_PotionReady_02_00"); //So, jetzt kann’s zurückgehen. Geh vor, wie folgen dir.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOWTOCAMP");
	B_StartOtherRoutine	(Mod_904_SLD_Engardo_MT, "FOLLOWTOCAMP");
	B_StartOtherRoutine	(Mod_1275_SLD_Nodrak_MT, "FOLLOWTOCAMP");

	Wld_InsertNpc	(Gobbo_Fester_04, "OW_PATH_161");

	B_LogEntry	(TOPIC_MOD_SLD_FESTER, "Grmpf, zuletzt darf ich noch Geleitschutz für die zugedröhnten Jungs zum Lager spielen.");

	Wld_InsertItem	(ItWr_Weisenchronik,	"FP_ITEM_FESTER_WEISENCHRONIK");
};

INSTANCE Info_Mod_Fester_BackAtCamp (C_INFO)
{
	npc		= Mod_784_SLD_Fester_MT;
	nr		= 1;
	condition	= Info_Mod_Fester_BackAtCamp_Condition;
	information	= Info_Mod_Fester_BackAtCamp_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Fester_BackAtCamp_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fester_PotionReady))
	&& (Npc_GetDistToWP(hero, "OW_PATH_07_21") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fester_BackAtCamp_Info()
{
	AI_Output(self, hero, "Info_Mod_Fester_BackAtCamp_02_00"); //Hey, du hast deine Sache echt gut gemacht ... für einen Neuling. Werde Lee und Sylvio davon berichten, dass du dich einigermaßen gut angestellt hast.
	AI_Output(self, hero, "Info_Mod_Fester_BackAtCamp_02_01"); //Hier hast du etwas Sumpfkraut und Erz zur Belohnung.

	B_ShowGivenThings	("4 Stängel Sumpfkraut und 3 Erz erhalten");

	CreateInvItems	(hero, ItMi_Joint, 4);
	CreateInvItems	(hero, ItMi_Nugget, 3);

	B_GivePlayerXP	(400);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
	B_StartOtherRoutine	(Mod_904_SLD_Engardo_MT, "START");
	B_StartOtherRoutine	(Mod_1275_SLD_Nodrak_MT, "START");

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_904_SLD_Engardo_MT.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_1275_SLD_Nodrak_MT.aivar[AIV_PARTYMEMBER] = FALSE;

	B_SetTopicStatus	(TOPIC_MOD_SLD_FESTER, LOG_SUCCESS);
};

INSTANCE Info_Mod_Fester_KesselProblem (C_INFO)
{
	npc		= Mod_784_SLD_Fester_MT;
	nr		= 1;
	condition	= Info_Mod_Fester_KesselProblem_Condition;
	information	= Info_Mod_Fester_KesselProblem_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo Fester. Heute Abend wieder einen Spaziergang?";
};

FUNC INT Info_Mod_Fester_KesselProblem_Condition()
{
	if (Mod_NL_TalkesselProblem == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fester_KesselProblem_Info()
{
	AI_Output(hero, self, "Info_Mod_Fester_KesselProblem_15_00"); //Hallo Fester. Heute Abend wieder einen Spaziergang?
	AI_Output(self, hero, "Info_Mod_Fester_KesselProblem_02_01"); //(beunruhigt) Was ...?! Wer bist du denn und was willst du?
	AI_Output(hero, self, "Info_Mod_Fester_KesselProblem_15_02"); //Die Frage ist, was du mir zu sagen hast ... über deine kleinen Geschäfte.
	AI_Output(self, hero, "Info_Mod_Fester_KesselProblem_02_03"); //(erschrocken) Was ...?! Verdammt! Hey, Mann, mach mir bloß keinen Ärger.
	AI_Output(self, hero, "Info_Mod_Fester_KesselProblem_02_04"); //Ich habe bloß ein paar Sachen gegen Erz getauscht.
	AI_Output(hero, self, "Info_Mod_Fester_KesselProblem_15_05"); //Paar Sachen?
	AI_Output(self, hero, "Info_Mod_Fester_KesselProblem_02_06"); //Ja, gut, etwas Sumpfkraut. Mann, was ist schon dabei.
	AI_Output(self, hero, "Info_Mod_Fester_KesselProblem_02_07"); //Das meiste habe ich ja mit anderem Krempel verdient, zum Beispiel diesem Schattenläuferfell, das er haben wollte.

	AI_TurnAway	(hero, self);

	AI_Output(hero, self, "Info_Mod_Fester_KesselProblem_15_08"); //(zu sich selbst) Was, das Schattenläuferfell? Dann ...

	AI_TurnToNpc	(hero, self);

	AI_Output(self, hero, "Info_Mod_Fester_KesselProblem_02_09"); //Hey, komm. Erzähl das mit dem Sumpfkraut bloß nicht herum.
	AI_Output(self, hero, "Info_Mod_Fester_KesselProblem_02_10"); //Wenn du dicht hältst, wirst du es auch nicht bereuen.

	if (Npc_HasItems(hero, ItWr_KesselProblem) == 0)
	{
		AI_TurnAway	(hero, self);

		AI_Output(hero, self, "Info_Mod_Fester_KesselProblem_15_11"); //Ich sollte Bruce mal zur Rede stellen.
	};

	B_LogEntry	(TOPIC_MOD_NL_TALKESSELPROB, "Bruce hat gar keinen Schattenläufer erschlagen. Er hat das Fell gegen Erz erstanden.");
};

INSTANCE Info_Mod_Fester_KesselProblem2 (C_INFO)
{
	npc		= Mod_784_SLD_Fester_MT;
	nr		= 1;
	condition	= Info_Mod_Fester_KesselProblem2_Condition;
	information	= Info_Mod_Fester_KesselProblem2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Fester_KesselProblem2_Condition()
{
	if (Mod_NL_TalKesselProblem >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fester_KesselProblem2_Info()
{
	if (Mod_NL_TalkesselProblem == 5)
	{
		AI_Output(self, hero, "Info_Mod_Fester_KesselProblem2_02_00"); //Puh, vielen Dank, dass du Lee nichts von dem Kraut erzählt hast.
		AI_Output(self, hero, "Info_Mod_Fester_KesselProblem2_02_01"); //Da bin ich grade noch mit einem blauen Auge davongekommen.
		AI_Output(self, hero, "Info_Mod_Fester_KesselProblem2_02_02"); //Naja, in nächster Zeit muss ich etwas vorsichtiger sein. Daher ... hier nimm das Kraut.

		B_ShowGivenThings	("2 schwarzer Weise, 2 grüne Novizen, 1 Traumruf und 5 Stengel erhalten");

		CreateInvItems	(hero, ItMi_Joint, 5);
		CreateInvItems	(hero, ItMi_Addon_Joint_01, 2);
		CreateInvItems	(hero, ItMi_Addon_Joint_02, 2);
		CreateInvItems	(hero, ItMi_Traumruf, 1);

		AI_Output(self, hero, "Info_Mod_Fester_KesselProblem2_02_03"); //Und ... ähh ... noch ein kleines Rezept.

		B_GiveInvItems	(self, hero, ItWr_Weisenchronik, 1);

		AI_Output(self, hero, "Info_Mod_Fester_KesselProblem2_02_04"); //Am besten vor dem Schlafen ... dann wirst du eine super entspannte Nacht haben und am nächsten Morgen gut drauf sein.
		AI_Output(self, hero, "Info_Mod_Fester_KesselProblem2_02_05"); //Viel Spaß damit. Aber nicht übertreiben, hähä.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Fester_KesselProblem2_02_06"); //(verärgert) Super, wegen dir darf ich jetzt die nächsten Wochen von früh bis spät schuften.
		AI_Output(self, hero, "Info_Mod_Fester_KesselProblem2_02_07"); //Hast du wirklich großartig gemacht ... Mistkerl!
	};
};

INSTANCE Info_Mod_Fester_Pickpocket (C_INFO)
{
	npc		= Mod_784_SLD_Fester_MT;
	nr		= 1;
	condition	= Info_Mod_Fester_Pickpocket_Condition;
	information	= Info_Mod_Fester_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Fester_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_Fester_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Fester_Pickpocket);

	Info_AddChoice	(Info_Mod_Fester_Pickpocket, DIALOG_BACK, Info_Mod_Fester_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Fester_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Fester_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Fester_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Fester_Pickpocket);
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

INSTANCE Info_Mod_Fester_EXIT (C_INFO)
{
	npc		= Mod_784_SLD_Fester_MT;
	nr		= 1;
	condition	= Info_Mod_Fester_EXIT_Condition;
	information	= Info_Mod_Fester_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Fester_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fester_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};