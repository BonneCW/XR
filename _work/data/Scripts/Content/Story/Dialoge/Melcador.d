INSTANCE Info_Mod_Melcador_Hi (C_INFO)
{
	npc		= Mod_1024_KGD_Melcador_MT;
	nr		= 1;
	condition	= Info_Mod_Melcador_Hi_Condition;
	information	= Info_Mod_Melcador_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du siehst irgendwie ein wenig gereizt aus.";
};

FUNC INT Info_Mod_Melcador_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Melcador_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Melcador_Hi_15_00"); //Du siehst irgendwie ein wenig gereizt aus.
	AI_Output(self, hero, "Info_Mod_Melcador_Hi_06_01"); //Was du nicht sagst! Wenn du mit so vielen beschissenen Aufgaben betraut werden würdest wie ich, dann würdest du auch so eine Fresse ziehen.
	AI_Output(hero, self, "Info_Mod_Melcador_Hi_15_02"); //Was hast du denn für beschissene Aufgaben?
	AI_Output(self, hero, "Info_Mod_Melcador_Hi_06_03"); //Ole hat mich mit der wunderbaren Aufgabe betraut, darauf zu achten, dass jeder hier im Lager seine zugewiesene Aufgabe erfüllt.
	AI_Output(self, hero, "Info_Mod_Melcador_Hi_06_04"); //Und da du hier außer Heidrek und Jerry keinen was arbeiten siehst, heißt das, dass ich meine Aufgabe nicht erfüllt habe.
	AI_Output(self, hero, "Info_Mod_Melcador_Hi_06_05"); //Das ist schlussendlich dann auch der Grund, das mir dann wiederrum Ole immer in den Ohren liegt, dass ich meinen Job nicht erfülle und somit tischt er mir jetzt allen möglichen Scheiß auf, den ich zu erfüllen hab.
	AI_Output(self, hero, "Info_Mod_Melcador_Hi_06_06"); //Ich kann dir sagen, hier werd ich bald noch bescheuert.
	AI_Output(hero, self, "Info_Mod_Melcador_Hi_15_07"); //Vielleicht kann ich dir ja ein wenig bei deinen Aufgaben helfen.
	AI_Output(self, hero, "Info_Mod_Melcador_Hi_06_08"); //Ein wenig Hilfe könnte ich natürlich gebrauchen, aber du solltest vorher mit Ole gesprochen haben, nicht dass es so aussieht, als würde ich mich vor der Arbeit drücken.
};

INSTANCE Info_Mod_Melcador_Buddler (C_INFO)
{
	npc		= Mod_1024_KGD_Melcador_MT;
	nr		= 1;
	condition	= Info_Mod_Melcador_Buddler_Condition;
	information	= Info_Mod_Melcador_Buddler_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich soll dir von Ole aus helfen.";
};

FUNC INT Info_Mod_Melcador_Buddler_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ole_Vorbereitungen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Melcador_Buddler_Info()
{
	AI_Output(hero, self, "Info_Mod_Melcador_Buddler_15_00"); //Ich soll dir von Ole aus helfen. Also was sollst du machen?
	AI_Output(self, hero, "Info_Mod_Melcador_Buddler_06_01"); //Ich soll mich um neue Buddler kümmern. Wenn du willst, kannst du mit ins alte Lager kommen, dort finden wir am ehesten neue Leute.
	AI_Output(hero, self, "Info_Mod_Melcador_Buddler_15_02"); //Dann geh du vor ich folge dir.

	Log_CreateTopic	(TOPIC_MOD_KG_BUDDLER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_KG_BUDDLER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_KG_BUDDLER, "Ich soll Melcador ins alte Lager begleiten, um dort Buddler abzuwerben.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOOC");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
};

INSTANCE Info_Mod_Melcador_Buddler2 (C_INFO)
{
	npc		= Mod_1024_KGD_Melcador_MT;
	nr		= 1;
	condition	= Info_Mod_Melcador_Buddler2_Condition;
	information	= Info_Mod_Melcador_Buddler2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Melcador_Buddler2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Melcador_Buddler))
	&& (Npc_GetDistToWP(self, "OCR_OUTSIDE_HUT_2") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Melcador_Buddler2_Info()
{
	AI_Output(self, hero, "Info_Mod_Melcador_Buddler2_06_00"); //So, ich unterhalte mich mal mit Ian, vielleicht weiß er ja, wen wir gebrauchen könnten.
	AI_Output(self, hero, "Info_Mod_Melcador_Buddler2_06_01"); //Du solltest derweil mal im Lager herum fragen, kann ja sein, dass du Glück hast und jemanden findest.

	B_LogEntry	(TOPIC_MOD_KG_BUDDLER, "Während sich Melcador mit Ian unterhält, soll ich mich im Lager umsehen. Vielleicht finde ich ja einen Buddler für unsere Sache.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TALKWITH");
	B_StartOtherRoutine	(Mod_1902_STT_Ian_MT, "TALKWITH");
};

INSTANCE Info_Mod_Melcador_Buddler3 (C_INFO)
{
	npc		= Mod_1024_KGD_Melcador_MT;
	nr		= 1;
	condition	= Info_Mod_Melcador_Buddler3_Condition;
	information	= Info_Mod_Melcador_Buddler3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab einen Buddler gefunden!";
};

FUNC INT Info_Mod_Melcador_Buddler3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Costa_Buddler))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Melcador_Buddler3_Info()
{
	AI_Output(hero, self, "Info_Mod_Melcador_Buddler3_15_00"); //Ich hab einen Buddler gefunden!
	AI_Output(self, hero, "Info_Mod_Melcador_Buddler3_06_01"); //Sehr schön, dann lass uns jetzt gehen.
	AI_Output(hero, self, "Info_Mod_Melcador_Buddler3_15_02"); //Er braucht aber noch sein altes Buddlerbuch, um sich wieder in die Materie einzuarbeiten.
	AI_Output(self, hero, "Info_Mod_Melcador_Buddler3_06_03"); //Wäre auch zu schön gewesen. Und wo ist es?!
	AI_Output(hero, self, "Info_Mod_Melcador_Buddler3_15_04"); //Ein Skelett hat es ihm abgenommen.
	AI_Output(self, hero, "Info_Mod_Melcador_Buddler3_06_05"); //Das wird ja immer besser. Ok, ich mach dir einen Vorschlag, du gehst vor und ich folge dir.
	AI_Output(hero, self, "Info_Mod_Melcador_Buddler3_15_06"); //Gut folge mir.

	B_LogEntry	(TOPIC_MOD_KG_BUDDLER, "Melcador wird mir zum Lager folgen.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOWTOCOSTA");
	B_StartOtherRoutine	(Mod_1902_STT_Ian_MT, "START");

	Wld_InsertNpc	(Skeleton_Costa, "SPAWN_TALL_PATH_BANDITOS2_03");
};

INSTANCE Info_Mod_Melcador_Buddler4 (C_INFO)
{
	npc		= Mod_1024_KGD_Melcador_MT;
	nr		= 1;
	condition	= Info_Mod_Melcador_Buddler4_Condition;
	information	= Info_Mod_Melcador_Buddler4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Melcador_Buddler4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Melcador_Buddler3))
	&& (Npc_HasItems(hero, ItKe_Costa) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Melcador_Buddler4_Info()
{
	AI_Output(self, hero, "Info_Mod_Melcador_Buddler4_06_00"); //Na super, kein Buch da.
	AI_Output(self, hero, "Info_Mod_Melcador_Buddler4_06_01"); //Wahrscheinlich hat dieses verdammte Skelett das Buch in irgendeinen unterirdischen Tempel gebracht, wo wir uns durch Horden von Skelettkriegern kämpfen dürfen.
	AI_Output(hero, self, "Info_Mod_Melcador_Buddler4_15_02"); //Mach doch nicht gleich so einen Wind. Der Schlüssel ist bestimmt für eine der Truhen hier.
};

INSTANCE Info_Mod_Melcador_Buddler5 (C_INFO)
{
	npc		= Mod_1024_KGD_Melcador_MT;
	nr		= 1;
	condition	= Info_Mod_Melcador_Buddler5_Condition;
	information	= Info_Mod_Melcador_Buddler5_Info;
	permanent	= 0;
	important	= 0;
	description	= "Siehst du.";
};

FUNC INT Info_Mod_Melcador_Buddler5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Melcador_Buddler4))
	&& (Npc_HasItems(hero, ItWr_Buddlerbuch) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Melcador_Buddler5_Info()
{
	AI_Output(hero, self, "Info_Mod_Melcador_Buddler5_15_00"); //Siehst du. Das Skelett hat es einfach in eine Truhe getan und in keinen gottverdammten Tempel.
	AI_Output(self, hero, "Info_Mod_Melcador_Buddler5_06_01"); //In Ordnung. Bring dem Buddler jetzt sein Buch, ich geh schon mal zum Lager zurück.

	B_LogEntry	(TOPIC_MOD_KG_BUDDLER, "Ich soll Costa nun sein Buch bringen. Melcador geht schon zurück zum Lager.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");

	self.aivar[AIV_PARTYMEMBER] = FALSE;
};

INSTANCE Info_Mod_Melcador_Buddler6 (C_INFO)
{
	npc		= Mod_1024_KGD_Melcador_MT;
	nr		= 1;
	condition	= Info_Mod_Melcador_Buddler6_Condition;
	information	= Info_Mod_Melcador_Buddler6_Info;
	permanent	= 0;
	important	= 0;
	description	= "Der Buddler wartet jetzt an der Mine.";
};

FUNC INT Info_Mod_Melcador_Buddler6_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Costa_Buddler2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Melcador_Buddler6_Info()
{
	AI_Output(hero, self, "Info_Mod_Melcador_Buddler6_15_00"); //Der Buddler wartet jetzt an der Mine.
	AI_Output(self, hero, "Info_Mod_Melcador_Buddler6_06_01"); //Gut, allerdings bräuchten wir noch einen.
	AI_Output(self, hero, "Info_Mod_Melcador_Buddler6_06_02"); //Ich habe gehört, in einem Tal namens Relendel hier auf der Insel, soll es noch eine größere Stadt geben.
	AI_Output(self, hero, "Info_Mod_Melcador_Buddler6_06_03"); //Vielleicht findest du dort noch jemanden, der für uns arbeitet.
	AI_Output(hero, self, "Info_Mod_Melcador_Buddler6_15_04"); //Ok, dann werde ich mich dort mal umsehen.

	B_LogEntry	(TOPIC_MOD_KG_BUDDLER, "Nun soll ich auch noch nach Relendel gehen und mich dort nach einem zweiten Buddler umsehen ...");
};

INSTANCE Info_Mod_Melcador_Buddler7 (C_INFO)
{
	npc		= Mod_1024_KGD_Melcador_MT;
	nr		= 1;
	condition	= Info_Mod_Melcador_Buddler7_Condition;
	information	= Info_Mod_Melcador_Buddler7_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ein weiterer Buddler wartet jetzt vor der Mine!";
};

FUNC INT Info_Mod_Melcador_Buddler7_Condition()
{
	if (Mod_KG_Sterling == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Melcador_Buddler7_Info()
{
	AI_Output(hero, self, "Info_Mod_Melcador_Buddler7_15_00"); //Ein weiterer Buddler wartet jetzt vor der Mine!
	AI_Output(self, hero, "Info_Mod_Melcador_Buddler7_06_01"); //Sehr schön, du bist ja wirklich zu was zu gebrauchen. Hier hast du ein wenig Gold.

	B_GiveInvItems	(self, hero, ItMi_Gold, 150);

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_KG_VORBEREITUNGEN, "Ich habe Melcador geholfen, Buddler für die Mine zu besorgen.");
	B_SetTopicStatus	(TOPIC_MOD_KG_BUDDLER, LOG_SUCCESS);
};

INSTANCE Info_Mod_Melcador_Trent (C_INFO)
{
	npc		= Mod_1024_KGD_Melcador_MT;
	nr		= 1;
	condition	= Info_Mod_Melcador_Trent_Condition;
	information	= Info_Mod_Melcador_Trent_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hymir schickt mich, ich soll mich zur Ruhe setzen.";
};

FUNC INT Info_Mod_Melcador_Trent_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hymir_Trent))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Melcador_Trent_Info()
{
	AI_Output(hero, self, "Info_Mod_Melcador_Trent_15_00"); //Hymir schickt mich, ich soll mich zur Ruhe setzen.
	AI_Output(self, hero, "Info_Mod_Melcador_Trent_06_01"); //Du Glücklicher! Hier ist der Kram den ich dir geben soll.

	CreateInvItems	(hero, ItMw_KGErzwaffe, 1);

	CreateInvItems	(hero, ItFo_Beer, 6);

	B_ShowGivenThings	("Königliche Erzwaffe und 6 Bier erhalten");

	AI_Output(self, hero, "Info_Mod_Melcador_Trent_06_02"); //Lass uns darauf erst mal einen trinken.

	B_UseItem	(self, ItFo_Beer);
	B_UseItem	(hero, ItFo_Beer);
};

INSTANCE Info_Mod_Melcador_Lehrer (C_INFO)
{
	npc		= Mod_1024_KGD_Melcador_MT;
	nr		= 1;
	condition	= Info_Mod_Melcador_Lehrer_Condition;
	information	= Info_Mod_Melcador_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du kämpfst doch mit einer Einhandwaffe?!";
};

FUNC INT Info_Mod_Melcador_Lehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Melcador_Hi))
	&& (KG_Dabei == 1)
	&& (hero.Hitchance[NPC_TALENT_1H] < 80)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Melcador_Lehrer_Info()
{
	AI_Output(hero, self, "Info_Mod_Melcador_Lehrer_15_00"); //Du kämpfst doch mit einer Einhandwaffe?! Wie sieht es aus, bist du gut genug um mir was bei zu bringen?
	AI_Output(self, hero, "Info_Mod_Melcador_Lehrer_06_01"); //Ich könnte dir schon was beibringen, aber ich weise niemanden in die Grundtechniken ein. Also komm erst zu mir, wenn du wenig Erfahrung gesammelt hast.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_KG, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_KG, "Melcador kann mir den Kampf mit Einhändern beibringen.");
};

INSTANCE Info_Mod_Melcador_LernenMelcador (C_INFO)
{
	npc		= Mod_1024_KGD_Melcador_MT;
	nr		= 1;
	condition	= Info_Mod_Melcador_LernenMelcador_Condition;
	information	= Info_Mod_Melcador_LernenMelcador_Info;
	permanent	= 1;
	important	= 0;
	description	= "Hab ich genug Erfahrung gesammelt?";
};

FUNC INT Info_Mod_Melcador_LernenMelcador_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Melcador_Lehrer))
	&& (hero.hitchance[NPC_TALENT_1H] >= 50)
	&& (hero.hitchance[NPC_TALENT_1H] < 80)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Melcador_LernenMelcador_Info()
{
	AI_Output(hero, self, "Info_Mod_Melcador_LernenMelcador_15_00"); //Hab ich genug Erfahrung gesammelt?
	AI_Output(self, hero, "Info_Mod_Melcador_LernenMelcador_06_01"); //Ja, aber vergiss nicht: Wer ein Meister im einhändigen Kampf werden will, muss viel Erfahrung investieren.

	Info_ClearChoices	(Info_Mod_Melcador_LernenMelcador);
	
	Info_AddChoice	(Info_Mod_Melcador_LernenMelcador, "Zurück.", Info_Mod_Melcador_LernenMelcador_BACK);
	Info_AddChoice	(Info_Mod_Melcador_LernenMelcador, B_BuildLearnString(PRINT_Learn1H5, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Melcador_LernenMelcador_5);
	Info_AddChoice	(Info_Mod_Melcador_LernenMelcador, B_BuildLearnString(PRINT_Learn1H1, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Melcador_LernenMelcador_1);
};

FUNC VOID Info_Mod_Melcador_LernenMelcador_BACK()
{
	Info_ClearChoices	(Info_Mod_Melcador_LernenMelcador);
};

FUNC VOID Info_Mod_Melcador_LernenMelcador_5()
{
	B_TeachFightTalentPercent_New (self, hero, NPC_TALENT_1H, 5, 80);

	Info_ClearChoices	(Info_Mod_Melcador_LernenMelcador);

	Info_AddChoice	(Info_Mod_Melcador_LernenMelcador, "Zurück.", Info_Mod_Melcador_LernenMelcador_BACK);
	Info_AddChoice	(Info_Mod_Melcador_LernenMelcador, B_BuildLearnString(PRINT_Learn1H5, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Melcador_LernenMelcador_5);
	Info_AddChoice	(Info_Mod_Melcador_LernenMelcador, B_BuildLearnString(PRINT_Learn1H1, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Melcador_LernenMelcador_1);
};

FUNC VOID Info_Mod_Melcador_LernenMelcador_1()
{
	B_TeachFightTalentPercent (self, hero, NPC_TALENT_1H, 1, 80);

	Info_ClearChoices	(Info_Mod_Melcador_LernenMelcador);

	Info_AddChoice	(Info_Mod_Melcador_LernenMelcador, "Zurück.", Info_Mod_Melcador_LernenMelcador_BACK);
	Info_AddChoice	(Info_Mod_Melcador_LernenMelcador, B_BuildLearnString(PRINT_Learn1H5, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Melcador_LernenMelcador_5);
	Info_AddChoice	(Info_Mod_Melcador_LernenMelcador, B_BuildLearnString(PRINT_Learn1H1, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Melcador_LernenMelcador_1);
};

INSTANCE Info_Mod_Melcador_Pickpocket (C_INFO)
{
	npc		= Mod_1024_KGD_Melcador_MT;
	nr		= 1;
	condition	= Info_Mod_Melcador_Pickpocket_Condition;
	information	= Info_Mod_Melcador_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Melcador_Pickpocket_Condition()
{
	C_Beklauen	(93, ItMi_Gold, 37);
};

FUNC VOID Info_Mod_Melcador_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Melcador_Pickpocket);

	Info_AddChoice	(Info_Mod_Melcador_Pickpocket, DIALOG_BACK, Info_Mod_Melcador_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Melcador_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Melcador_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Melcador_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Melcador_Pickpocket);
};

FUNC VOID Info_Mod_Melcador_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Melcador_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Melcador_Pickpocket);

		Info_AddChoice	(Info_Mod_Melcador_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Melcador_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Melcador_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Melcador_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Melcador_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Melcador_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Melcador_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Melcador_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Melcador_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Melcador_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Melcador_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Melcador_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Melcador_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Melcador_EXIT (C_INFO)
{
	npc		= Mod_1024_KGD_Melcador_MT;
	nr		= 1;
	condition	= Info_Mod_Melcador_EXIT_Condition;
	information	= Info_Mod_Melcador_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Melcador_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Melcador_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};