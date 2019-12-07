INSTANCE Info_Mod_Whistler_NW_Hi (C_INFO)
{
	npc		= Mod_1927_STT_Whistler_NW;
	nr		= 1;
	condition	= Info_Mod_Whistler_NW_Hi_Condition;
	information	= Info_Mod_Whistler_NW_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Alissandro schickt mich.";
};

FUNC INT Info_Mod_Whistler_NW_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_WasTunAlsErzbaron))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Whistler_NW_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Whistler_NW_Hi_15_00"); //Alissandro hat mich zu dir geschickt. Er meint, du könntest uns helfen unsere Geschäfte hier zu verbreiten.
	AI_Output(self, hero, "Info_Mod_Whistler_NW_Hi_11_01"); //Ja, ich habe uns einige Informationen besorgt, die uns weiterhelfen könnten:
	AI_Output(self, hero, "Info_Mod_Whistler_NW_Hi_11_02"); //Aufgrund der Paladine sind wir in der Stadt unerwünscht, daher wäre sie kein guter Ausgangspunkt. Das Feuermagierkloster können wir gleich vergessen.
	AI_Output(self, hero, "Info_Mod_Whistler_NW_Hi_11_03"); //Beim Großbauern sind zu viele vom neuen Lager, also können wir auch nicht auf ein Geschäft mit ihm hoffen.
	AI_Output(self, hero, "Info_Mod_Whistler_NW_Hi_11_04"); //Zwischen uns und den Dämonenrittern und Beschwörern hat sich wegen der Sache mit der alten Mine eine Spannung entwickelt, also fallen auch sie weg.
	AI_Output(self, hero, "Info_Mod_Whistler_NW_Hi_11_05"); //Natürlich wollen uns auch die Wassermagier nicht unterstützen. Wir haben allerdings die Diebe und die Banditen auf unserer Seite.
	AI_Output(hero, self, "Info_Mod_Whistler_NW_Hi_15_06"); //Die Diebe und die Banditen? Und die sollen uns helfen können?
	AI_Output(self, hero, "Info_Mod_Whistler_NW_Hi_11_07"); //Unterschätze sie besser nicht, die Leute fürchten sich vor ihnen, das verleiht ihnen Einfluss.
	AI_Output(hero, self, "Info_Mod_Whistler_NW_Hi_15_08"); //Verstehe, und was soll ich jetzt machen?
	AI_Output(self, hero, "Info_Mod_Whistler_NW_Hi_11_09"); //Esteban ist in die Stadt gekommen, er wollte sich mit dir treffen.
	AI_Output(self, hero, "Info_Mod_Whistler_NW_Hi_11_10"); //Geh zum Marktplatz, dort wartet er auf dich.

	B_LogEntry	(TOPIC_MOD_AL_AUSBREITUNGK, "Whistler meinte, wir arbeiten mit den Banditen zusammen. Ich soll zu Esteban gehen, den ich am Marktplatz finde.");
};

INSTANCE Info_Mod_Whistler_NW_WasGeht (C_INFO)
{
	npc		= Mod_1927_STT_Whistler_NW;
	nr		= 1;
	condition	= Info_Mod_Whistler_NW_WasGeht_Condition;
	information	= Info_Mod_Whistler_NW_WasGeht_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie geht es voran?";
};

FUNC INT Info_Mod_Whistler_NW_WasGeht_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Morgahard_NW_AtLagerhaus))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Whistler_NW_WasGeht_Info()
{
	AI_Output(hero, self, "Info_Mod_Whistler_NW_WasGeht_15_00"); //Wie geht es voran?
	AI_Output(self, hero, "Info_Mod_Whistler_NW_WasGeht_11_01"); //Verdammt nochmal überhaupt nicht. Irgendein Kerl schickt uns immer Drohbriefe und meint, wenn wir ihm kein Schutzgeld zahlen, reißt er uns die ganze Bude ein.
	AI_Output(hero, self, "Info_Mod_Whistler_NW_WasGeht_15_02"); //Und ihr habt ihn bezahlt?
	AI_Output(self, hero, "Info_Mod_Whistler_NW_WasGeht_11_03"); //Nein, mit was denn auch? Wir haben nur Erz und das will er nicht annehmen. Und jetzt will er in regelmäßigen Abständen dieses Lagerhaus demolieren.
	AI_Output(hero, self, "Info_Mod_Whistler_NW_WasGeht_15_04"); //Wie viel Gold will er denn?
	AI_Output(self, hero, "Info_Mod_Whistler_NW_WasGeht_11_05"); //500 Goldmünzen hinter dem Lagerhaus, wo tagsüber die Kämpfe von diesem Alrik stattfinden.
	AI_Output(hero, self, "Info_Mod_Whistler_NW_WasGeht_15_06"); //Wann will er das Geld?
	AI_Output(self, hero, "Info_Mod_Whistler_NW_WasGeht_11_07"); //Heute um Mitternacht.
	AI_Output(hero, self, "Info_Mod_Whistler_NW_WasGeht_15_08"); //Gut, ich werde um Mitternacht hinter das Lagerhaus gehen und mir das mal ansehen.

	Log_CreateTopic	(TOPIC_MOD_AL_LAGERHAUS, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_AL_LAGERHAUS, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_AL_LAGERHAUS, "Ich habe mit Whistler gesprochen. Er meinte, jemand würde Geld erpressen und unser Lagerhaus zerstören wollen. Um Mitternacht holt er sich hinter dem Lagerhaus das Geld, das sehe ich mir mal an.");

	B_StartOtherRoutine	(Mod_563_NONE_Borka_NW, "ERPRESSER");
};

INSTANCE Info_Mod_Whistler_NW_BromorSchuld (C_INFO)
{
	npc		= Mod_1927_STT_Whistler_NW;
	nr		= 1;
	condition	= Info_Mod_Whistler_NW_BromorSchuld_Condition;
	information	= Info_Mod_Whistler_NW_BromorSchuld_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bromor von der roten Laterne will uns Sträflinge nicht hier haben.";
};

FUNC INT Info_Mod_Whistler_NW_BromorSchuld_Condition()
{
	if (Mod_AL_BorkaAusgequetscht == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Whistler_NW_BromorSchuld_Info()
{
	AI_Output(hero, self, "Info_Mod_Whistler_NW_BromorSchuld_15_00"); //Bromor von der roten Laterne will uns Sträflinge nicht hier haben und behindert uns jetzt.
	AI_Output(self, hero, "Info_Mod_Whistler_NW_BromorSchuld_11_01"); //Dann müssen wir uns rächen und ich hätte da schon einen Plan.
	AI_Output(hero, self, "Info_Mod_Whistler_NW_BromorSchuld_15_02"); //Der wäre?
	AI_Output(self, hero, "Info_Mod_Whistler_NW_BromorSchuld_11_03"); //Von 5 bis 10 Uhr morgens ist die Rote Laterne für Besucher geschlossen, während dieser Zeit erholen sich Bromor und seine Mädchen.
	AI_Output(self, hero, "Info_Mod_Whistler_NW_BromorSchuld_11_04"); //In der Zeit werden wir seine Mädchen entführen und sein Gold stehlen.
	AI_Output(self, hero, "Info_Mod_Whistler_NW_BromorSchuld_11_05"); //Das wäre der erste Schritt.
	AI_Output(hero, self, "Info_Mod_Whistler_NW_BromorSchuld_15_06"); //Und der Zweite?
	AI_Output(self, hero, "Info_Mod_Whistler_NW_BromorSchuld_11_07"); //Dazu komm ich später.
	AI_Output(hero, self, "Info_Mod_Whistler_NW_BromorSchuld_15_08"); //Gut, dann kümmern wir uns erst um den ersten Schritt.
	AI_Output(self, hero, "Info_Mod_Whistler_NW_BromorSchuld_11_09"); //Gut, wir treffen uns dort zwischen 5 und 10 Uhr.
	AI_Output(self, hero, "Info_Mod_Whistler_NW_BromorSchuld_11_10"); //Du besorgst das Gold, ich die Mädchen.

	B_LogEntry	(TOPIC_MOD_AL_LAGERHAUS, "Whistler hat schon einen Plan, wie wir uns rächen können. Er entführt Bromors Prostituierte, während ich ihm sein Geld stehle.");

	B_StartOtherRoutine	(Mod_563_NONE_Borka_NW, "START");
	B_StartOtherRoutine	(self, "PUFF");
};

INSTANCE Info_Mod_Whistler_NW_HabSeinGold (C_INFO)
{
	npc		= Mod_1927_STT_Whistler_NW;
	nr		= 1;
	condition	= Info_Mod_Whistler_NW_HabSeinGold_Condition;
	information	= Info_Mod_Whistler_NW_HabSeinGold_Info;
	permanent	= 0;
	important	= 0;
	description	= "Und jetzt?";
};

FUNC INT Info_Mod_Whistler_NW_HabSeinGold_Condition()
{
	if (Mob_HasItems("BROMORSTRUHE", Itmi_Gold) == 0)
	&& (Wld_IsTime(05,00,10,00))
	&& (Npc_KnowsInfo(hero, Info_Mod_Whistler_NW_BromorSchuld))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Whistler_NW_HabSeinGold_Info()
{
	AI_Output(hero, self, "Info_Mod_Whistler_NW_HabSeinGold_15_00"); //Und jetzt?
	AI_Output(self, hero, "Info_Mod_Whistler_NW_HabSeinGold_11_01"); //Wir haben eine Abmachung mit Bromors Mädels. Wir bringen sie erstmal weg von hier, sie kommen allerdings wieder her, wenn Bromor aufgibt.
	AI_Output(hero, self, "Info_Mod_Whistler_NW_HabSeinGold_15_02"); //Und was soll ich machen?
	AI_Output(self, hero, "Info_Mod_Whistler_NW_HabSeinGold_11_03"); //Für dich hätte ich noch etwas zu tun. Ich habe hier eine Spruchrolle, die einige Ratten beschwört.

	CreateInvItems	(self, ItSc_SummonRats, 1);
	B_GiveInvItems	(self, hero, ItSc_SummonRats, 1);

	AI_Output(self, hero, "Info_Mod_Whistler_NW_HabSeinGold_11_04"); //Lass sie los und Bromor wird eine nette Überraschung erleben.

	B_LogEntry	(TOPIC_MOD_AL_LAGERHAUS, "Wir haben den Einbruch hinter uns. Jetzt soll ich noch eine Spruchrolle loslassen, die Ratten beschwört.");

	B_StartOtherRoutine	(Mod_522_NONE_Vanja_NW, "ERPRESSUNG");
	B_StartOtherRoutine	(Mod_752_NONE_Sonja_NW, "ERPRESSUNG");
	B_StartOtherRoutine	(Mod_7115_NONE_Nadja_NW, "ERPRESSUNG");
	B_StartOtherRoutine	(self, "ATLAGERHAUS");
};

INSTANCE Info_Mod_Whistler_NW_RattenGespawnt (C_INFO)
{
	npc		= Mod_1927_STT_Whistler_NW;
	nr		= 1;
	condition	= Info_Mod_Whistler_NW_RattenGespawnt_Condition;
	information	= Info_Mod_Whistler_NW_RattenGespawnt_Info;
	permanent	= 0;
	important	= 0;
	description	= "Gut, das hätte ich erledigt, was jetzt?";
};

FUNC INT Info_Mod_Whistler_NW_RattenGespawnt_Condition()
{
	if (Mod_AL_Rattengespawnt == TRUE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Whistler_NW_HabSeinGold))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Whistler_NW_RattenGespawnt_Info()
{
	AI_Output(hero, self, "Info_Mod_Whistler_NW_RattenGespawnt_15_00"); //Gut, das hätte ich erledigt, was jetzt?
	AI_Output(self, hero, "Info_Mod_Whistler_NW_RattenGespawnt_11_01"); //Jetzt warten wir und schauen, was sch entwickelt. Nachts gehen wir alle mal in die rote Laterne und genießen Bromors Probleme.

	B_LogEntry	(TOPIC_MOD_AL_LAGERHAUS, "Whistler meint, jetzt sollten wir Bromor beobachten. Nachts sollte ich mal bei ihm vorbei sehen.");

	B_StartOtherRoutine	(self, "NACHTIMPUFF");
};

INSTANCE Info_Mod_Whistler_NW_NachtImPuff (C_INFO)
{
	npc		= Mod_1927_STT_Whistler_NW;
	nr		= 1;
	condition	= Info_Mod_Whistler_NW_NachtImPuff_Condition;
	information	= Info_Mod_Whistler_NW_NachtImPuff_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bromor gibt auf.";
};

FUNC INT Info_Mod_Whistler_NW_NachtImPuff_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bromor_Aufgeben))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Whistler_NW_NachtImPuff_Info()
{
	AI_Output(hero, self, "Info_Mod_Whistler_NW_NachtImPuff_15_00"); //Bromor gibt auf.
	AI_Output(self, hero, "Info_Mod_Whistler_NW_NachtImPuff_11_01"); //Gut, dann bringen wir seinen Laden wieder in Ordnung.

	B_LogEntry	(TOPIC_MOD_AL_LAGERHAUS, "Ich habe Whistler gesagt, dass Bromor aufgibt.");
	B_SetTopicStatus	(TOPIC_MOD_AL_LAGERHAUS, LOG_SUCCESS);

	B_Göttergefallen(2, 1);

	B_GivePlayerXP	(500);

	if (hero.guild != GIL_KDF)
	{
		Wld_InsertNpc	(Mod_1933_BUD_Buddler_NW,	"HAFEN");
	};

	B_StartOtherRoutine	(self, "NACHTIMPUFF");
	B_StartOtherRoutine	(Mod_522_NONE_Vanja_NW, "START");
	B_StartOtherRoutine	(Mod_752_NONE_Sonja_NW, "START");
	B_StartOtherRoutine	(Mod_7115_NONE_Nadja_NW, "DOWN");
};

INSTANCE Info_Mod_Whistler_NW_Daemonen (C_INFO)
{
	npc		= Mod_1927_STT_Whistler_NW;
	nr		= 1;
	condition	= Info_Mod_Whistler_NW_Daemonen_Condition;
	information	= Info_Mod_Whistler_NW_Daemonen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich war bei den Dämonenrittern.";
};

FUNC INT Info_Mod_Whistler_NW_Daemonen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_MT_Angebot))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Whistler_NW_Daemonen_Info()
{
	AI_Output(hero, self, "Info_Mod_Whistler_NW_Daemonen_15_00"); //Ich war bei den Dämonenrittern.
	AI_Output(hero, self, "Info_Mod_Whistler_NW_Daemonen_15_01"); //Dort meinte Gomez, er wolle das Lager zurückerobern.
	AI_Output(self, hero, "Info_Mod_Whistler_NW_Daemonen_11_02"); //Was?! Verdammt, er wird vermutlich schon einen seiner Leute zum Lager geschickt haben, Alissandro muss sofort gewarnt werden!

	B_LogEntry	(TOPIC_MOD_AL_MINE, "Whistler sagte, ich sollte so schnell wie möglich Alissandro warnen.");

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Whistler_NW_Pickpocket (C_INFO)
{
	npc		= Mod_1927_STT_Whistler_NW;
	nr		= 1;
	condition	= Info_Mod_Whistler_NW_Pickpocket_Condition;
	information	= Info_Mod_Whistler_NW_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Whistler_NW_Pickpocket_Condition()
{
	C_Beklauen	(52, ItMi_Gold, 15);
};

FUNC VOID Info_Mod_Whistler_NW_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Whistler_NW_Pickpocket);

	Info_AddChoice	(Info_Mod_Whistler_NW_Pickpocket, DIALOG_BACK, Info_Mod_Whistler_NW_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Whistler_NW_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Whistler_NW_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Whistler_NW_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Whistler_NW_Pickpocket);
};

FUNC VOID Info_Mod_Whistler_NW_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Whistler_NW_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Whistler_NW_Pickpocket);

		Info_AddChoice	(Info_Mod_Whistler_NW_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Whistler_NW_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Whistler_NW_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Whistler_NW_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Whistler_NW_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Whistler_NW_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Whistler_NW_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Whistler_NW_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Whistler_NW_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Whistler_NW_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Whistler_NW_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Whistler_NW_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Whistler_NW_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Whistler_NW_EXIT (C_INFO)
{
	npc		= Mod_1927_STT_Whistler_NW;
	nr		= 1;
	condition	= Info_Mod_Whistler_NW_EXIT_Condition;
	information	= Info_Mod_Whistler_NW_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Whistler_NW_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Whistler_NW_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};