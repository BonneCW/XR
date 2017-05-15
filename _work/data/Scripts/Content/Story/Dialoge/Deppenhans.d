INSTANCE Info_Mod_Deppenhans_Truhe (C_INFO)
{
	npc		= Mod_7411_BAU_Deppenhans_REL;
	nr		= 1;
	condition	= Info_Mod_Deppenhans_Truhe_Condition;
	information	= Info_Mod_Deppenhans_Truhe_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Deppenhans_Truhe_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Deppenhans_Truhe_Info()
{
	AI_Output(self, hero, "Info_Mod_Deppenhans_Truhe_01_00"); //Hey, kannst du mir mal helfen? Ich habe Probleme mir meiner Truhe.
	AI_Output(self, hero, "Info_Mod_Deppenhans_Truhe_01_01"); //Ich komme nicht an meine Ersparnisse.
	AI_Output(hero, self, "Info_Mod_Deppenhans_Truhe_15_02"); //Ärger mit dem Schloss?
	AI_Output(self, hero, "Info_Mod_Deppenhans_Truhe_01_03"); //Nee, die braucht mal wieder eins auf den Deckel.
	AI_Output(hero, self, "Info_Mod_Deppenhans_Truhe_15_04"); //Wie?
	AI_Output(self, hero, "Info_Mod_Deppenhans_Truhe_01_05"); //Naja, die springt und beißt mal wieder wie verrückt.
	AI_Output(self, hero, "Info_Mod_Deppenhans_Truhe_01_06"); //Diesmal ganz doll, sodass ich sie nicht alleine zu züchtigen vermag.
	AI_Output(hero, self, "Info_Mod_Deppenhans_Truhe_15_07"); //Was ist das für ein Unsinn?
	AI_Output(self, hero, "Info_Mod_Deppenhans_Truhe_01_08"); //Ja, hast Recht, ist Unsinn, was die mal wieder macht.
	AI_Output(self, hero, "Info_Mod_Deppenhans_Truhe_01_09"); //Konnte sich aber schon als Baum nicht benehmen. Ist durch das Feld gerannt und hat alles auf den Kopf gestellt.
	AI_Output(self, hero, "Info_Mod_Deppenhans_Truhe_01_10"); //Irgendwann habe ich dann meine Axt genommen und ihn zu der Truhe gemacht.
	AI_Output(self, hero, "Info_Mod_Deppenhans_Truhe_01_11"); //Aber mit dem Benehmen ist es immer noch nicht besser.

	AI_TurnAway	(hero, self);

	AI_Output(hero, self, "Info_Mod_Deppenhans_Truhe_15_12"); //(zu sich selbst) Und ich dachte in der Kolonie gab es damals die schrägsten Vögel.

	AI_TurnToNpc	(hero, self);

	AI_Output(self, hero, "Info_Mod_Deppenhans_Truhe_01_13"); //Ja, ist schon schräg drauf, die Gute.
	AI_Output(self, hero, "Info_Mod_Deppenhans_Truhe_01_14"); //Wenn du mir hilfst, sie zur Ruhe zu bringen, bekommst du auch einen Teil meiner Ersparnisse.
	AI_Output(self, hero, "Info_Mod_Deppenhans_Truhe_01_15"); //Ich geh schon mal rein und schau nach ihr.

	Log_CreateTopic	(TOPIC_MOD_DEPPENHANS_TRUHE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_DEPPENHANS_TRUHE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_DEPPENHANS_TRUHE, "In Khorata begegnet man ja einigen Kuriositäten. Der Bauer Deppenhans bat mich darum, seiner Truhe mit ein paar Schlägen Benehmen beizubringen, da diese angeblich wie wild herumspringt und beißt. Was davon zu halten ist ... na ja. Da er mir aber einen Teil seiner Ersparnisse zur Belohnung versprochen hat, sollte ich vielleicht doch mal einen Blick hinein werfen, was da so vor sich geht.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TRUHE");

	Wld_InsertNpc	(Truhe_Deppenhans, "FP_ROAM_DEPPENHANS_TRUHE");
};

INSTANCE Info_Mod_Deppenhans_Truhe2 (C_INFO)
{
	npc		= Mod_7411_BAU_Deppenhans_REL;
	nr		= 1;
	condition	= Info_Mod_Deppenhans_Truhe2_Condition;
	information	= Info_Mod_Deppenhans_Truhe2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Deppenhans_Truhe2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Deppenhans_Truhe))
	&& (Npc_GetDistToWP(self, "REL_SURFACE_220") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Deppenhans_Truhe2_Info()
{
	AI_Output(self, hero, "Info_Mod_Deppenhans_Truhe2_01_00"); //Da schau. So garstig war sie schon lange nicht mehr.
	AI_Output(self, hero, "Info_Mod_Deppenhans_Truhe2_01_01"); //Verpass ihr bitte eins, dass sie es so schnell nicht mehr vergisst.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Deppenhans_Truhe3 (C_INFO)
{
	npc		= Mod_7411_BAU_Deppenhans_REL;
	nr		= 1;
	condition	= Info_Mod_Deppenhans_Truhe3_Condition;
	information	= Info_Mod_Deppenhans_Truhe3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Deppenhans_Truhe3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Deppenhans_Truhe2))
	&& (Npc_IsDead(Truhe_Deppenhans))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Deppenhans_Truhe3_Info()
{
	AI_Output(self, hero, "Info_Mod_Deppenhans_Truhe3_01_00"); //Großartig, du hast es geschafft.

	AI_GotoNpc	(self, Truhe_Deppenhans);

	AI_TurnToNpc	(self, Truhe_Deppenhans);

	AI_PlayAni	(self, "T_PLUNDER");

	AI_GotoNpc	(self, hero);

	AI_TurnToNpc	(self, hero);

	AI_Output(self, hero, "Info_Mod_Deppenhans_Truhe3_01_01"); //Und hier, wie versprochen ein Teil meiner Ersparnisse.
	AI_Output(self, hero, "Info_Mod_Deppenhans_Truhe3_01_02"); //Hier, nimm ruhig die Hälfte. Du hast ja auch echt gute Arbeit geleistet und es dir wirklich verdient.

	B_GiveInvItems	(self, hero, ItPl_Beet, 6);

	AI_Output(hero, self, "Info_Mod_Deppenhans_Truhe3_15_03"); //Ohh, toll, Rüben.
	AI_Output(self, hero, "Info_Mod_Deppenhans_Truhe3_01_04"); //Ja, schön, dass sie dir gefallen.

	B_SetTopicStatus	(TOPIC_MOD_DEPPENHANS_TRUHE, LOG_SUCCESS);

	B_GivePlayerXP	(150);

	B_StartOtherRoutine	(self, "START");

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Deppenhans_Kaninchenplage (C_INFO)
{
	npc		= Mod_7411_BAU_Deppenhans_REL;
	nr		= 1;
	condition	= Info_Mod_Deppenhans_Kaninchenplage_Condition;
	information	= Info_Mod_Deppenhans_Kaninchenplage_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du hast hier ja eine ganz schöne Kaninchenplage auf deinem Feld.";
};

FUNC INT Info_Mod_Deppenhans_Kaninchenplage_Condition()
{
	if (Mod_WM_UnheilFertig == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Deppenhans_Kaninchenplage_Info()
{
	AI_Output(hero, self, "Info_Mod_Deppenhans_Kaninchenplage_15_00"); //Du hast hier ja eine ganz schöne Kaninchenplage auf deinem Feld.
	AI_Output(self, hero, "Info_Mod_Deppenhans_Kaninchenplage_01_01"); //(leicht debil) Ja, überall lustige, flauschige Hoppelhasen. Komisch, dass seitdem mein Gemüse Stück für Stück verschwindet. Muss hier irgendwo ein Dieb sein ...
	AI_Output(hero, self, "Info_Mod_Deppenhans_Kaninchenplage_15_02"); //Ähh, ja, wie dem auch sei, hast du eine Ahnung, woher die alle kommen könnten?
	AI_Output(self, hero, "Info_Mod_Deppenhans_Kaninchenplage_01_03"); //Nö, die tauchen einfach so auf.
	AI_Output(hero, self, "Info_Mod_Deppenhans_Kaninchenplage_15_04"); //Na schön, dann darf ich die Gegend nach Hinweisen durchkämmen.
	AI_Output(self, hero, "Info_Mod_Deppenhans_Kaninchenplage_01_05"); //Durchkämmen?! Hey, da habe ich was für dich.
	AI_Output(hero, self, "Info_Mod_Deppenhans_Kaninchenplage_15_06"); //(erwartungsvoll) Ja?! Hinweise?
	AI_Output(self, hero, "Info_Mod_Deppenhans_Kaninchenplage_01_07"); //Nee, ich hatte die tolle Idee, einen überdimensionalen Kamm an einen Holzstil zu basteln. Da habe ich das dabei herausbekommen.

	B_GiveInvItems	(self, hero, ItMi_Rake, 1);

	AI_Output(hero, self, "Info_Mod_Deppenhans_Kaninchenplage_15_08"); //(etwas enttäuscht) Ohh, toll, eine Harke, danke.
	AI_Output(self, hero, "Info_Mod_Deppenhans_Kaninchenplage_01_09"); //Aber kannst du ja auch diesen schwarz angezogenen Typen fragen, der hier immer so herumläuft und komische Lichter mit seiner Hand macht.
	AI_Output(self, hero, "Info_Mod_Deppenhans_Kaninchenplage_01_10"); //Gerade dann tauchen immer besonders viele Kaninchen auf ... er hat's bestimmt auch gesehen.

	B_LogEntry	(TOPIC_MOD_ADANOS_PLAGE, "Hmpf ... na ja, immerhin weiß ich jetzt, dass ich nach einem Magier in schwarzer Kleidung Ausschau halten muss.");

	Wld_InsertNpc	(Mod_7412_SNOV_Novize_REL, "REL_SURFACE_110");

	Wld_InsertNpc	(Rabbit, "REL_SURFACE_110");
	Wld_InsertNpc	(Rabbit, "REL_SURFACE_110");
	Wld_InsertNpc	(Rabbit, "REL_SURFACE_110");
	Wld_InsertNpc	(Rabbit, "REL_SURFACE_110");
	Wld_InsertNpc	(Rabbit, "REL_SURFACE_110");
};

INSTANCE Info_Mod_Deppenhans_NovizeWeg (C_INFO)
{
	npc		= Mod_7411_BAU_Deppenhans_REL;
	nr		= 1;
	condition	= Info_Mod_Deppenhans_NovizeWeg_Condition;
	information	= Info_Mod_Deppenhans_NovizeWeg_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Deppenhans_NovizeWeg_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_SchwarzerNovizeKaninchen_Umgehauen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Deppenhans_NovizeWeg_Info()
{
	AI_Output(self, hero, "Info_Mod_Deppenhans_NovizeWeg_01_00"); //Hey, mein Gemüse hat aufgehört zu verschwinden.
	AI_Output(self, hero, "Info_Mod_Deppenhans_NovizeWeg_01_01"); //Wie du das auch gemacht hast, nimm diese Kürbisse als Dankeschön.

	B_GiveInvItems	(self, hero, ItFo_Kuerbis, 5);

	AI_Output(hero, self, "Info_Mod_Deppenhans_NovizeWeg_15_02"); //Ohh, wie reizend.

	B_GivePlayerXP	(200);
};

INSTANCE Info_Mod_Deppenhans_WoherBaum (C_INFO)
{
	npc		= Mod_7411_BAU_Deppenhans_REL;
	nr		= 1;
	condition	= Info_Mod_Deppenhans_WoherBaum_Condition;
	information	= Info_Mod_Deppenhans_WoherBaum_Info;
	permanent	= 0;
	important	= 0;
	description	= "Woher hattest du den laufenden Baum?";
};

FUNC INT Info_Mod_Deppenhans_WoherBaum_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Deppenhans_Truhe3))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Deppenhans_WoherBaum_Info()
{
	AI_Output(hero, self, "Info_Mod_Deppenhans_WoherBaum_15_00"); //Woher hattest du den laufenden Baum?
	AI_Output(self, hero, "Info_Mod_Deppenhans_WoherBaum_01_01"); //Den hatte ich neben meinem Feld gepflanzt ... mit Setzlingen aus dem verfluchten Moor.
	AI_Output(self, hero, "Info_Mod_Deppenhans_WoherBaum_01_02"); //Aber scheinbar wurden die schlecht aufgezogen, so wie er sich benommen hat. Du hast es ja selbst gesehen.
};

INSTANCE Info_Mod_Deppenhans_Landarbeit (C_INFO)
{
	npc		= Mod_7411_BAU_Deppenhans_REL;
	nr		= 1;
	condition	= Info_Mod_Deppenhans_Landarbeit_Condition;
	information	= Info_Mod_Deppenhans_Landarbeit_Info;
	permanent	= 0;
	important	= 0;
	description	= "Und was macht sonst die Landarbeit?";
};

FUNC INT Info_Mod_Deppenhans_Landarbeit_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Deppenhans_Truhe3))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Deppenhans_Landarbeit_Info()
{
	AI_Output(hero, self, "Info_Mod_Deppenhans_Landarbeit_15_00"); //Und was macht sonst die Landarbeit?
	AI_Output(self, hero, "Info_Mod_Deppenhans_Landarbeit_01_01"); //Die läuft wunderprächtig. Ich weiß ja auch, wie es geht.
	AI_Output(self, hero, "Info_Mod_Deppenhans_Landarbeit_01_02"); //Die Samen und Knollen kommen in die Erde aufs Feld und dann wachsen sie.
	AI_Output(self, hero, "Info_Mod_Deppenhans_Landarbeit_01_03"); //Mein Chef, der Erhard, der macht das ganz falsch.
	AI_Output(self, hero, "Info_Mod_Deppenhans_Landarbeit_01_04"); //Hat komische gelb und blau glänzende Brocken bei der Wand seines Hauses vergraben, zwischen den ganzen Heuballen und Fässern.
	AI_Output(self, hero, "Info_Mod_Deppenhans_Landarbeit_01_05"); //Dass aus denen nichts Anständiges wachsen würde, hatte ich mir gleich gedacht.
	AI_Output(self, hero, "Info_Mod_Deppenhans_Landarbeit_01_06"); //Aber es gibt ja komische Leute.
};

INSTANCE Info_Mod_Deppenhans_Pickpocket (C_INFO)
{
	npc		= Mod_7411_BAU_Deppenhans_REL;
	nr		= 1;
	condition	= Info_Mod_Deppenhans_Pickpocket_Condition;
	information	= Info_Mod_Deppenhans_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Deppenhans_Pickpocket_Condition()
{
	C_Beklauen	(76, ItMi_Gold, 21);
};

FUNC VOID Info_Mod_Deppenhans_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Deppenhans_Pickpocket);

	Info_AddChoice	(Info_Mod_Deppenhans_Pickpocket, DIALOG_BACK, Info_Mod_Deppenhans_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Deppenhans_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Deppenhans_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Deppenhans_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Deppenhans_Pickpocket);
};

FUNC VOID Info_Mod_Deppenhans_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Deppenhans_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Deppenhans_Pickpocket);

		Info_AddChoice	(Info_Mod_Deppenhans_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Deppenhans_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Deppenhans_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Deppenhans_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Deppenhans_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Deppenhans_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Deppenhans_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Deppenhans_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Deppenhans_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Deppenhans_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Deppenhans_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Deppenhans_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Deppenhans_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Deppenhans_EXIT (C_INFO)
{
	npc		= Mod_7411_BAU_Deppenhans_REL;
	nr		= 1;
	condition	= Info_Mod_Deppenhans_EXIT_Condition;
	information	= Info_Mod_Deppenhans_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Deppenhans_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Deppenhans_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};