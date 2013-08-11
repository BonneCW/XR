INSTANCE Info_Mod_Andre_Argez (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Argez_Condition;
	information	= Info_Mod_Andre_Argez_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Andre_Argez_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Garond_Argez))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Argez_Info()
{
	AI_Output(self, hero, "Info_Mod_Andre_Argez_08_00"); //(streng) So, jetzt reicht es, mein Freund. Du kommst mit in die Kaserne, und dort haben wir erst mal etwas zu besprechen.

	B_LogEntry	(TOPIC_MOD_ARGEZ, "Ich soll Lord Andre in die Kaserne folgen.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "PRESTART");
};

INSTANCE Info_Mod_Andre_Argez2 (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Argez2_Condition;
	information	= Info_Mod_Andre_Argez2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Andre_Argez2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_Argez))
	&& (Npc_GetDistToWP(self, "NW_CITY_HABOUR_KASERN_MAIN_ENTRY") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Argez2_Info()
{
	AI_Output(self, hero, "Info_Mod_Andre_Argez2_08_00"); //So, so. Neu in der Stadt und gleich Ärger am Hals.
	AI_Output(hero, self, "Info_Mod_Andre_Argez2_15_01"); //Das ist nicht meine Schuld.
	AI_Output(self, hero, "Info_Mod_Andre_Argez2_08_02"); //Ich weiß. Garond ist etwas ... übereifrig bei seiner neuen Aufgabe. Aber er wird sich schon noch daran gewöhnen.
	AI_Output(self, hero, "Info_Mod_Andre_Argez2_08_03"); //Nur - wenn du ein Anliegen hast, ist er die falsche Adresse. Ich habe mitbekommen, dass du jemanden in die Stadt bringen wolltest. Ist das richtig?
	AI_Output(hero, self, "Info_Mod_Andre_Argez2_15_04"); //Ja.
	AI_Output(self, hero, "Info_Mod_Andre_Argez2_08_05"); //Hat er irgendetwas in der Stadt verbrochen, weshalb er verbannt hätte werden können?
	AI_Output(hero, self, "Info_Mod_Andre_Argez2_15_06"); //Er hatte gar keine Gelegenheit dazu, soweit ich weiß.
	AI_Output(self, hero, "Info_Mod_Andre_Argez2_08_07"); //Na schön. Ich schlage vor, du führst deinen Freund durch das andere Stadttor beim Marktplatz. Ich werde veranlassen, dass ihr nicht aufgehalten werdet.
	AI_Output(self, hero, "Info_Mod_Andre_Argez2_08_08"); //Aber lasst euch nicht bei Garond blicken. Er würde wahrscheinlich ... ungehalten reagieren.

	B_LogEntry	(TOPIC_MOD_ARGEZ, "Lord Andre hat empfohlen, dass ich Argez zu dem nördlicheren der beiden Stadttore führe, um Garond aus dem Weg zu gehen.");
};

INSTANCE Info_Mod_Andre_Hi (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Hi_Condition;
	information	= Info_Mod_Andre_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Andre_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_Argez2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Andre_Hi_08_01"); //Ich bin Lord Andre, Befehlshaber der Miliz und Stellvertretender Anführer der Paladine.
	AI_Output(self, hero, "Info_Mod_Andre_Hi_08_02"); //Was kann ich für dich tun?

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Andre_Alvares (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Alvares_Condition;
	information	= Info_Mod_Andre_Alvares_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was muss ich tun damit du Alvares freilässt?";
};

FUNC INT Info_Mod_Andre_Alvares_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Alvares_Soeldner))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Alvares_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_Alvares_15_00"); //Was muss ich tun damit du Alvares freilässt?
	AI_Output(self, hero, "Info_Mod_Andre_Alvares_08_01"); //Er hat sich mit einer unserer Milizen geschlagen. Dafür sitzt er die nächsten Tage erstmal.
};

INSTANCE Info_Mod_Andre_AlvaresSchneller (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_AlvaresSchneller_Condition;
	information	= Info_Mod_Andre_AlvaresSchneller_Info;
	permanent	= 0;
	important	= 0;
	description	= "Gibt es keine Möglichkeit ihn schneller freizulassen?";
};

FUNC INT Info_Mod_Andre_AlvaresSchneller_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_Alvares))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_AlvaresSchneller_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_AlvaresSchneller_15_00"); //Gibt es keine Möglichkeit ihn schneller freizulassen?
	AI_Output(self, hero, "Info_Mod_Andre_AlvaresSchneller_08_01"); //Du könntest seine Strafe bezahlen.
	AI_Output(hero, self, "Info_Mod_Andre_AlvaresSchneller_15_02"); //Wieviel kostet es?
	AI_Output(self, hero, "Info_Mod_Andre_AlvaresSchneller_08_03"); //Nach seinen Missetaten? Das wird nicht billig. Entrichte 500 Goldmünzen.
	AI_Output(self, hero, "Info_Mod_Andre_AlvaresSchneller_08_04"); //Außerdem musst du noch einen anderen Straftäter der Gerichtsbarkeit unsere Stadt überführen.

	if (Mod_AlvaresAndre_Taeter == 1)
	{
		AI_Output(self, hero, "Info_Mod_Andre_AlvaresSchneller_08_07"); //Wenn ich mich recht erinnere, hast du das ja bereits getan.
	};

	AI_Output(self, hero, "Info_Mod_Andre_AlvaresSchneller_08_05"); //Oder bezwinge die Banditen, die irgendwo in der Nähe von Akil’s Hof im Wald ihr Lager haben und bringe mir ihre Waffen.
	AI_Output(self, hero, "Info_Mod_Andre_AlvaresSchneller_08_06"); //Oft genug haben sie fahrende Händler überfallen.

	B_LogEntry	(TOPIC_MOD_TORLOF_NEUERANWÄRTER, "Alvarez könnte ein viel versprechender Söldneranwärter sein. Damit Andre ihn jedoch aus dem Gefängnis entlässt, muss ich nicht nur 500 Goldmünzen zahlen, sondern auch einen anderen Straftäter bei Andre melden oder drei Banditen in der Nähe von Akil’s Hof unschädlich machen und ihm ihre Waffen bringen.");

	Wld_InsertNpc	(Mod_7217_BDT_Bandit_NW, "FARM2");
	Wld_InsertNpc	(Mod_7218_BDT_Bandit_NW, "FARM2");
	Wld_InsertNpc	(Mod_7219_BDT_Bandit_NW, "FARM2");
};

INSTANCE Info_Mod_Andre_AlvaresBanditen (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_AlvaresBanditen_Condition;
	information	= Info_Mod_Andre_AlvaresBanditen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Banditen werden keinen Ärger mehr anrichten.";
};

FUNC INT Info_Mod_Andre_AlvaresBanditen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_Alvares))
	&& (Npc_IsDead(Mod_7217_BDT_Bandit_NW))
	&& (Npc_IsDead(Mod_7218_BDT_Bandit_NW))
	&& (Npc_IsDead(Mod_7219_BDT_Bandit_NW))
	&& (Npc_HasItems(hero, ItMw_Banditenschwert_Andre) == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_AlvaresBanditen_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_AlvaresBanditen_15_00"); //Die Banditen werden keinen Ärger mehr anrichten.
	AI_Output(self, hero, "Info_Mod_Andre_AlvaresBanditen_08_01"); //Sehr gut. Und ihre Waffen?
	AI_Output(hero, self, "Info_Mod_Andre_AlvaresBanditen_15_02"); //Hier sind sie.

	B_GiveInvItems	(hero, self, ItMw_Banditenschwert_Andre, 3);

	AI_Output(self, hero, "Info_Mod_Andre_AlvaresBanditen_08_03"); //Ausgezeichnet. Damit wird die Umgebung der Stadt ein großes Stück sicherer.

	B_GivePlayerXP	(50);
};

INSTANCE Info_Mod_Andre_AlvaresGeld (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_AlvaresGeld_Condition;
	information	= Info_Mod_Andre_AlvaresGeld_Info;
	permanent	= 0;
	important	= 0;
	description	= "Lass Alvares frei (500 Gold geben)";
};

FUNC INT Info_Mod_Andre_AlvaresGeld_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_AlvaresSchneller))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 500)
	&& ((Npc_KnowsInfo(hero, Info_Mod_Andre_AlvaresBanditen))
	|| (Mod_AlvaresAndre_Taeter == 1))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_AlvaresGeld_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_AlvaresGeld_15_00"); //Lass Alvares frei.

	B_GiveInvItems	(hero, self, ItMi_Gold, 500);

	AI_Output(self, hero, "Info_Mod_Andre_AlvaresGeld_08_01"); //Gut, du kannst ihn mitnehmen.

	B_LogEntry	(TOPIC_MOD_TORLOF_NEUERANWÄRTER, "Ich habe das Gold für Alvares bezahlt und ich kann ihn jetzt mitnehmen.");

	B_Göttergefallen(1, 1);

	B_GivePlayerXP	(50);
};

INSTANCE Info_Mod_Andre_Miliz (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Miliz_Condition;
	information	= Info_Mod_Andre_Miliz_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich will mich der Miliz anschließen.";
};

FUNC INT Info_Mod_Andre_Miliz_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_Hi))
	&& (Mod_Gilde == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Miliz_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_Miliz_15_00"); //Ich will mich der Miliz anschließen.
	AI_Output(self, hero, "Info_Mod_Andre_Miliz_08_01"); //Wir nehmen nur die besten auf. Wir veranstalten heute ein Turnier und der Sieger wird bei der Miliz aufgenommen.
	AI_Output(self, hero, "Info_Mod_Andre_Miliz_08_02"); //Du hast Glück, dass noch ein Platz frei ist.

	Mod_MilizTurnier	=	0;

	Log_CreateTopic	(TOPIC_MOD_MILIZTURNIER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_MILIZTURNIER, LOG_RUNNING);
	B_LogEntry_More	(TOPIC_MOD_MILIZ, TOPIC_MOD_MILIZTURNIER, "Wenn ich mich der Miliz anschließen will, dann muss ich das Turnier gewinnen.", "Wenn ich mich der Miliz anschließen will, dann muss ich das Turnier gewinnen.");
};

INSTANCE Info_Mod_Andre_Kristall (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Kristall_Condition;
	information	= Info_Mod_Andre_Kristall_Info;
	permanent	= 0;
	important	= 0;
	description	= "Lothar schickt mich (Kristall geben)";
};

FUNC INT Info_Mod_Andre_Kristall_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lothar_Bier))
	&& (Npc_KnowsInfo(hero, Info_Mod_Lothar_Kristall))
	&& (Npc_HasItems(hero, Mod_PaladinKristall) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Kristall_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_Kristall_15_00"); //Lothar schickt mich. Ich soll dir den Kristall bringen.
	
	B_GiveInvItems	(hero, self, Mod_PaladinKristall, 1);

	AI_Output(self, hero, "Info_Mod_Andre_Kristall_08_01"); //Wo hast du den Kristall her?
	AI_Output(hero, self, "Info_Mod_Andre_Kristall_15_02"); //Ich habe ihn den Dieben abgenommen.
	AI_Output(self, hero, "Info_Mod_Andre_Kristall_08_03"); //Sehr gut. Wenn du willst, kannst du nun der Miliz beitreten.

	B_GivePlayerXP	(200);

	B_LogEntry_More	(TOPIC_MOD_MILIZ, TOPIC_MOD_SÖLDNER, "Lord Andre ist bereit mich bei der Miliz aufzunehmen.", "Ich hab den Kristall Lord Andre gegeben. Torlof wird das sicherlich nicht sehr gefallen.");

	B_SetTopicStatus	(TOPIC_MOD_TORLOFSPIONAGE, LOG_FAILED);

	B_Göttergefallen(1, 3);
};

INSTANCE Info_Mod_Andre_TurnierSinbad (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_TurnierSinbad_Condition;
	information	= Info_Mod_Andre_TurnierSinbad_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe von einem Turnier gehört ...";
};

FUNC INT Info_Mod_Andre_TurnierSinbad_Condition()
{
	if (!Npc_KnowsInfo(hero, Info_Mod_Andre_Regeln))
	&& (Npc_KnowsInfo(hero, Info_Mod_Sinbad_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_TurnierSinbad_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_TurnierSinbad_15_00"); //Ich habe von einem Turnier gehört ...
	AI_Output(self, hero, "Info_Mod_Andre_TurnierSinbad_08_01"); //Das stimmt. Ein Platz ist noch frei, falls du teilnehmen willst.

	Mod_MilizTurnier = 0;
};

INSTANCE Info_Mod_Andre_Regeln (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Regeln_Condition;
	information	= Info_Mod_Andre_Regeln_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie sind die Regeln für das Turnier?";
};

FUNC INT Info_Mod_Andre_Regeln_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_Miliz))
	|| (Npc_KnowsInfo(hero, Info_Mod_Andre_TurnierSinbad))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Regeln_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_Regeln_15_00"); //Wie sind die Regeln für das Turnier?
	AI_Output(self, hero, "Info_Mod_Andre_Regeln_08_01"); //Magie und Fernkampf sind im Turnier nicht erlaubt, weil du nicht töten darfst.
};

INSTANCE Info_Mod_Andre_Turnier1 (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Turnier1_Condition;
	information	= Info_Mod_Andre_Turnier1_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer ist mein erster Gegner?";
};

FUNC INT Info_Mod_Andre_Turnier1_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_Regeln))
	&& (Mod_Gilde == 0)
	&& (Mod_MilizTurnier ==	0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Turnier1_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_Turnier1_15_00"); //Wer ist mein erster Gegner?
	AI_Output(self, hero, "Info_Mod_Andre_Turnier1_08_01"); //Er heißt Till. Er müsste jeden Augenblick hier eintreffen.

	B_StartOtherRoutine	(Mod_541_NONE_Till_NW, "TURNIER");
	B_StartOtherRoutine	(Mod_1176_MIL_Miliz_NW, "KAMPF");
	B_StartOtherRoutine	(Mod_1177_MIL_Miliz_NW, "KAMPF");
	B_StartOtherRoutine	(Mod_1175_MIL_Miliz_NW, "KAMPF");
	B_StartOtherRoutine	(Mod_755_MIL_Wambo_NW, "KAMPF");

	AI_Teleport	(Mod_541_NONE_Till_NW, "NW_CITY_HABOUR_KASERN_11");

	if (Assassinen_Dabei == 0)
	{
		B_LogEntry	(TOPIC_MOD_MILIZTURNIER, "Mein erster Gegner beim Turnier ist Till.");
	};
};

INSTANCE Info_Mod_Andre_Turnier2 (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Turnier2_Condition;
	information	= Info_Mod_Andre_Turnier2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe gegen Till gekämpft.";
};

FUNC INT Info_Mod_Andre_Turnier2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Till_KampfEnde))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Turnier2_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_Turnier2_15_00"); //Ich habe gegen Till gekämpft.

	if (Mod_MilizTurnier	==	2)
	{
		AI_Output(self, hero, "Info_Mod_Andre_Turnier2_08_01"); //Du hast ihn besiegt. Damit bist du in der nächsten Runde.
		AI_Output(self, hero, "Info_Mod_Andre_Turnier2_08_02"); //Dein nächster Gegner ist Alrik.

		AI_Teleport	(Mod_547_NONE_Alrik_NW, "NW_CITY_HABOUR_KASERN_11");
		B_StartOtherRoutine	(Mod_547_NONE_Alrik_NW,	"TURNIER");
		B_StartOtherRoutine	(Mod_1176_MIL_Miliz_NW, "KAMPF");
		B_StartOtherRoutine	(Mod_1177_MIL_Miliz_NW, "KAMPF");
		B_StartOtherRoutine	(Mod_1175_MIL_Miliz_NW, "KAMPF");
		B_StartOtherRoutine	(Mod_755_MIL_Wambo_NW, "KAMPF");

		AI_Teleport	(Mod_547_NONE_Alrik_NW, "NW_CITY_HABOUR_KASERN_11");

		if (Assassinen_Dabei == 0)
		{
			B_LogEntry	(TOPIC_MOD_MILIZTURNIER, "Mein zweiter Gegner ist beim Turnier ist Alrik.");
		};

		Mod_MilizTurnier	=	4;

		B_Göttergefallen(1, 1);

		B_GivePlayerXP	(100);
	}
	else if (Mod_MilizTurnier	==	3)
	{
		AI_Output(self, hero, "Info_Mod_Andre_Turnier2_08_03"); //Du hast verloren. Damit bist du aus dem Turnier ausgeschieden.
		AI_Output(hero, self, "Info_Mod_Andre_Turnier2_15_04"); //Gibt es noch eine andere Möglichkeit mich der Miliz anzuschließen?

		Mod_AndreTurnier = 2;

		Mod_MilizErnst	=	r_max(99);
		
		if (Mod_MilizErnst	<=	25)
		{
			AI_Output(self, hero, "Info_Mod_Andre_Turnier2_08_05"); //Wenn du dich wirklich der Miliz anschließen willst, dann geh mal zu Mortis. Du findest ihn in der Kasernen-Schmiede.

			Mod_MilizTurnier	=	9;

			if (Assassinen_Dabei == 0)
			{
				B_LogEntry	(TOPIC_MOD_MILIZ, "Wenn ich mich trotz der Niederlage im Turnier der Miliz anschließen will, dann soll ich mal zu Mortis gehen.");
			};
		}
		else
		{
			AI_Output(self, hero, "Info_Mod_Andre_Turnier2_08_06"); //Du hast gegen einen Bauer verloren. Jemanden wie dich können wir nicht bei der Miliz gebrauchen.

			if (Assassinen_Dabei == 0)
			{
				B_LogEntry	(TOPIC_MOD_MILIZ, "Lord Andre wird mich wegen meiner Niederlage gegen Till nicht in der Miliz aufnehmen.");
			};
		};
	};
};

INSTANCE Info_Mod_Andre_Turnier3 (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Turnier3_Condition;
	information	= Info_Mod_Andre_Turnier3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe gegen Alrik gekämpft.";
};

FUNC INT Info_Mod_Andre_Turnier3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alrik_KampfEnde))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Turnier3_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_Turnier3_15_00"); //Ich habe gegen Alrik gekämpft.

	if (Mod_MilizTurnier	==	6)
	{
		AI_Output(self, hero, "Info_Mod_Andre_Turnier3_08_01"); //Glückwunsch, du hast ihn besiegt. Damit hast du jetzt du nur noch einen Kampf.
		AI_Output(self, hero, "Info_Mod_Andre_Turnier3_08_06"); //Dein nächster Gegner ist Gidan. Viel Glück!
		
		if (Assassinen_Dabei == 0)
		{
			B_LogEntry	(TOPIC_MOD_MILIZTURNIER, "Ich habe auch Alrik besiegt. Lord Andre sagt, dass ich jetzt nur noch einen Kampf vor mir habe.");

			//B_SetTopicStatus	(TOPIC_MOD_MILIZTURNIER, LOG_SUCCESS);
		};

		B_StartOtherRoutine	(Mod_1176_MIL_Miliz_NW, "KAMPF");
		B_StartOtherRoutine	(Mod_1177_MIL_Miliz_NW, "KAMPF");
		B_StartOtherRoutine	(Mod_1175_MIL_Miliz_NW, "KAMPF");
		B_StartOtherRoutine	(Mod_755_MIL_Wambo_NW, "KAMPF");

		Mod_MilizTurnier	=	8;

		B_Göttergefallen(1, 1);

		B_GivePlayerXP	(200);
	}
	else if (Mod_MilizTurnier	==	7)
	{
		AI_Output(self, hero, "Info_Mod_Andre_Turnier3_08_02"); //Du hast verloren. Damit bist du aus dem Turnier ausgeschieden.
		AI_Output(hero, self, "Info_Mod_Andre_Turnier3_15_03"); //Gibt es noch eine andere Möglichkeit mich der Miliz anzuschließen?

		Mod_AndreTurnier = 2;

		Mod_MilizErnst	=	r_max(99);
		
		if (Mod_MilizErnst	<=	50)
		{
			AI_Output(self, hero, "Info_Mod_Andre_Turnier3_08_04"); //Wenn du dich wirklich der Miliz anschließen willst, dann geh mal zu Mortis. Du findest ihn in der Kasernen-Schmiede.

			Mod_MilizTurnier	=	9;

			if (Assassinen_Dabei == 0)
			{
				B_LogEntry	(TOPIC_MOD_MILIZ, "Wenn ich mich trotz der Niederlage im Turnier der Miliz anschließen will, dann soll ich mal zu Mortis gehen.");
			};
		}
		else
		{
			AI_Output(self, hero, "Info_Mod_Andre_Turnier3_08_05"); //Du hast verloren und hast dir dadurch die Chance verbaut bei der Miliz mitzumachen.

			if (Assassinen_Dabei == 0)
			{
				B_LogEntry	(TOPIC_MOD_MILIZ, "Durch meine Niederlage gegen Alrik hab ich mir den Weg zur Miliz verbaut.");
			};
		};
	};
};

INSTANCE Info_Mod_Andre_Turnier4 (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Turnier4_Condition;
	information	= Info_Mod_Andre_Turnier4_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe gegen Gidan gekämpft.";
};

FUNC INT Info_Mod_Andre_Turnier4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gidan_KampfEnde))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Turnier4_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_Turnier4_15_00"); //Ich habe gegen Gidan gekämpft.

	if (Mod_MilizTurnier	==	11)
	{
		AI_Output(self, hero, "Info_Mod_Andre_Turnier4_08_01"); //Glückwunsch, du hast ihn besiegt. Damit hast du dir eine Aufnahme bei der Miliz verdient.

		if (Mod_Gilde == 0)
		{		
			B_LogEntry	(TOPIC_MOD_MILIZTURNIER, "Ich habe auch Gidan besiegt. Lord Andre sagt, dass ich mich jetzt der Miliz anschließen kann.");
		}
		else
		{
			AI_Output(hero, self, "Info_Mod_Andre_Turnier4_15_06"); //Ich gehöre schon zu einer anderen Gruppe. Das war nur Training für mich.
			AI_Output(self, hero, "Info_Mod_Andre_Turnier4_08_07"); //Du bist ein erstaunlicher Kerl. Schade, ich könnte dich gut gebrauchen.

			if (Npc_KnowsInfo(hero, Info_Mod_Sinbad_Hi))
			{
				AI_Output(self, hero, "Info_Mod_Andre_Turnier4_08_08"); //Aber diese Urkunde nimmst du doch.

				B_GiveInvItems	(self, hero, ItWr_TurnierUrkunde, 1);
			};
		};

		if (Assassinen_Dabei == 0)
		{
			B_SetTopicStatus	(TOPIC_MOD_MILIZTURNIER, LOG_SUCCESS);
		};

		Mod_AndreTurnier = 1;

		Mod_MilizTurnier	=	13;

		B_Göttergefallen(1, 1);

		B_GivePlayerXP	(300);
	}
	else if (Mod_MilizTurnier	==	12)
	{
		AI_Output(self, hero, "Info_Mod_Andre_Turnier4_08_02"); //Du hast verloren. Damit bist du aus dem Turnier ausgeschieden.

		if (Assassinen_Dabei == 0)
		{
			AI_Output(hero, self, "Info_Mod_Andre_Turnier4_15_03"); //Gibt es noch eine andere Möglichkeit mich der Miliz anzuschließen?

			Mod_AndreTurnier = 2;

			Mod_MilizErnst	=	r_max(99);
		
			if (Mod_MilizErnst	<=	75)
			{
				AI_Output(self, hero, "Info_Mod_Andre_Turnier4_08_04"); //Wenn du dich wirklich der Miliz anschließen willst, dann geh mal zu Mortis. Du findest ihn in der Kasernen-Schmiede.

				Mod_MilizTurnier	=	9;

				B_LogEntry	(TOPIC_MOD_MILIZ, "Wenn ich mich trotz der Niederlage im Turnier der Miliz anschließen will, dann soll ich mal zu Mortis gehen.");
			}
			else
			{
				AI_Output(self, hero, "Info_Mod_Andre_Turnier4_08_05"); //Du hast verloren und hast dir dadurch die Chance verbaut bei der Miliz mitzumachen.

				B_LogEntry	(TOPIC_MOD_MILIZ, "Durch meine Niederlage gegen Gidan hab ich mir den Weg zur Miliz verbaut.");
			};
		};
	};
};

INSTANCE Info_Mod_Andre_Aufnahme (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Aufnahme_Condition;
	information	= Info_Mod_Andre_Aufnahme_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich bin bereit mich der Miliz anzuschließen.";
};

FUNC INT Info_Mod_Andre_Aufnahme_Condition()
{
	if (Mod_Gilde	==	0)
	&& ((Npc_KnowsInfo(hero, Info_Mod_Andre_Kristall))
	|| (Mod_MilizTurnier == 13)
	|| (Npc_KnowsInfo(hero, Info_Mod_Mortis_OK)))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Aufnahme_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_Aufnahme_15_00"); //Ich bin bereit mich der Miliz anzuschließen.
	
	if (hero.level	>=	5)
	&& (Diebe_Dabei == FALSE)
	{
		AI_Output(self, hero, "Info_Mod_Andre_Aufnahme_08_01"); //Du bist bereit dich der Miliz anzuschließen.
		AI_Output(self, hero, "Info_Mod_Andre_Aufnahme_08_02"); //Doch wenn du einmal die Rüstung unserer Soldaten trägst, dann gibt es kein zurück mehr.
		
		if (Mod_HatPlayerNeutraleKlamotten())
		{
			if (Mod_Gottstatus <= 8)
			{
				AI_Output(self, hero, "Info_Mod_Andre_Aufnahme_08_05"); //Du solltest allerdings vorher noch ein paar Taten zu Gunsten von Innos vollbringen.
			}
			else
			{
				Info_ClearChoices	(Info_Mod_Andre_Aufnahme);

				Info_AddChoice	(Info_Mod_Andre_Aufnahme, "Ich habs mir anders überlegt.", Info_Mod_Andre_Aufnahme_Nein);
				Info_AddChoice	(Info_Mod_Andre_Aufnahme, "Ich will mich euch anschließen.", Info_Mod_Andre_Aufnahme_Ja);
			};
		}
		else
		{
			AI_Output(self, hero, "Info_Mod_Andre_Aufnahme_08_04"); //Du solltest dir vorher aber noch eine neutrale Rüstung besorgen.
		};
	}
	else if (Diebe_Dabei == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_Andre_Aufnahme_08_06"); //Wie ich hörte sollst du dich mit dem Gesindel im Hafenviertel herumtreiben. So jemanden können wir nicht bei der Miliz gebrauchen.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Andre_Aufnahme_08_03"); //Du solltest lieber noch etwas Erfahrung sammeln.
	};
};

FUNC VOID Info_Mod_Andre_Aufnahme_Nein()
{
	AI_Output(hero, self, "Info_Mod_Andre_Aufnahme_Nein_15_00"); //Ich hab's mir anders überlegt.
	AI_Output(self, hero, "Info_Mod_Andre_Aufnahme_Nein_08_01"); //Wie du meinst.

	Info_ClearChoices	(Info_Mod_Andre_Aufnahme);
};

FUNC VOID Info_Mod_Andre_Aufnahme_Ja()
{
	AI_Output(hero, self, "Info_Mod_Andre_Aufnahme_Ja_15_00"); //Ich will mich euch anschließen.
	AI_Output(self, hero, "Info_Mod_Andre_Aufnahme_Ja_08_01"); //Gut. Hier ist deine Rüstung.

	CreateInvItems	(self, ITAR_MIL_L, 1);
	B_GiveInvItems	(self, hero, ITAR_MIL_L, 1);

	AI_UnequipArmor	(hero);
	AI_EquipArmor	(hero, ItAr_Mil_L);

	AI_Output(self, hero, "Info_Mod_Andre_Aufnahme_Ja_08_02"); //Pass aber auf, wo du dich damit sehen lässt, die Söldner und die Beliaranhänger werden nicht zögern dich zu töten.
	AI_Output(hero, self, "Info_Mod_Andre_Aufnahme_Ja_15_03"); //Wie steht's mit einer Waffe?
	AI_Output(self, hero, "Info_Mod_Andre_Aufnahme_Ja_08_04"); //Die Milizen haben bei uns Schwerter. Geh auf den Marktplatz, da werden welche verkauft.

	B_LogEntry_More	(TOPIC_MOD_GILDENAUFNAHME, TOPIC_MOD_Miliz, "Ich bin jetzt ein Mitglied der Miliz.", "Ich bin jetzt ein Mitglied der Miliz.");
	B_SetTopicStatus	(TOPIC_MOD_Miliz, LOG_SUCCESS);
	B_SetTopicStatus	(TOPIC_MOD_GILDENAUFNAHME, LOG_SUCCESS);

	B_SetTopicStatus	(TOPIC_MOD_FEUERMAGIER, LOG_FAILED);
	B_SetTopicStatus	(TOPIC_MOD_DAEMONENBESCHWOERER, LOG_FAILED);
	B_SetTopicStatus	(TOPIC_MOD_WASSERMAGIER, LOG_FAILED);
	B_SetTopicStatus	(TOPIC_MOD_SÖLDNER, LOG_FAILED);

	Info_ClearChoices	(Info_Mod_Andre_Aufnahme);

	Mod_Gilde	=	1;

	hero.guild = GIL_PAL;
	Npc_SetTrueGuild	(hero, GIL_PAL);

	Snd_Play ("LEVELUP");

	B_GivePlayerXP	(400);

	Monster_Max += 7;

	B_Göttergefallen(1, 5);

	AI_UnequipArmor	(Mod_1723_MIL_Gidan_NW);

	CreateInvItems	(Mod_1723_MIL_Gidan_NW, ItAr_Mil_M, 1);

	AI_EquipArmor	(Mod_1723_MIL_Gidan_NW, ItAr_Mil_M);
};

INSTANCE Info_Mod_Andre_Sinbad01 (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Sinbad01_Condition;
	information	= Info_Mod_Andre_Sinbad01_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kennst du mich noch?";
};

FUNC INT Info_Mod_Andre_Sinbad01_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sinbad_Hi))
	&& (Mod_AndreTurnier == 1)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Sinbad_Urkunde))
	&& (Npc_HasItems(hero, ItWr_TurnierUrkunde) == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Sinbad01_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_Sinbad01_15_00"); //Kennst du mich noch?
	AI_Output(self, hero, "Info_Mod_Andre_Sinbad01_08_01"); //Natürlich. Du hast den Wettkampf gewonnen.
	AI_Output(hero, self, "Info_Mod_Andre_Sinbad01_15_02"); //Genau. Nun hätte ich gerne so was wie eine Urkunde.
	AI_Output(self, hero, "Info_Mod_Andre_Sinbad01_08_03"); //Hab ich dir die nicht gegeben.
	AI_Output(hero, self, "Info_Mod_Andre_Sinbad01_15_04"); //Nein.
	AI_Output(self, hero, "Info_Mod_Andre_Sinbad01_08_05"); //Steht dir natürlich zu. Bitte sehr.

	B_GiveInvItems	(self, hero, ItWr_TurnierUrkunde, 1);
};

INSTANCE Info_Mod_Andre_Sinbad02 (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Sinbad02_Condition;
	information	= Info_Mod_Andre_Sinbad02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich will noch mal zum Turnier antreten.";
};

FUNC INT Info_Mod_Andre_Sinbad02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sinbad_Hi))
	&& (Mod_AndreTurnier == 2)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Sinbad_Urkunde))
	&& (Npc_HasItems(hero, ItWr_TurnierUrkunde) == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Sinbad02_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_Sinbad02_15_00"); //Ich will noch mal zum Turnier antreten.
	AI_Output(self, hero, "Info_Mod_Andre_Sinbad02_08_01"); //Du hast doch schon verloren. Gidan ist Turniersieger. Allerdings ist der abgehauen.
	AI_Output(hero, self, "Info_Mod_Andre_Sinbad02_15_02"); //(interressiert) Und das heißt?
	AI_Output(self, hero, "Info_Mod_Andre_Sinbad02_08_03"); //Man sagt, er hat sich besoffen und sich dann mit dem Schattenläufer im Tal am Osttor angelegt. Jedenfalls ist er nicht wieder aufgetaucht.
	AI_Output(hero, self, "Info_Mod_Andre_Sinbad02_15_04"); //(eifrig) Dann ist der Platz wieder frei?
	AI_Output(self, hero, "Info_Mod_Andre_Sinbad02_08_05"); //Im Prinzip ja. Also gut: Du gehst runter und schaust nach, was da los ist.
	AI_Output(self, hero, "Info_Mod_Andre_Sinbad02_08_06"); //Ist Gidan tot, hast du den Schattenläufer als Gegner. Wenn du den besiegst, kannst du den Pokal behalten.
	AI_Output(hero, self, "Info_Mod_Andre_Sinbad02_15_07"); //Bin schon weg.

	B_KillNpc	(Mod_1723_MIL_Gidan_NW);
};

INSTANCE Info_Mod_Andre_Sinbad03 (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Sinbad03_Condition;
	information	= Info_Mod_Andre_Sinbad03_Info;
	permanent	= 0;
	important	= 0;
	description	= "Gidan ist Vergangenheit und der Schattenläufer Geschichte.";
};

FUNC INT Info_Mod_Andre_Sinbad03_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_Sinbad02))
	&& (Npc_HasItems(hero, ItMi_TurnierPokal) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Sinbad03_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_Sinbad03_15_00"); //Gidan ist Vergangenheit und der Schattenläufer Geschichte. Hier, der Pokal.
	AI_Output(self, hero, "Info_Mod_Andre_Sinbad03_08_01"); //Saubere Arbeit. Kannst ihn behalten. Und wenn du uns beitreten willst ...
	AI_Output(hero, self, "Info_Mod_Andre_Sinbad03_15_02"); //Werde es mir überlegen. Bis dann.
};

INSTANCE Info_Mod_Andre_Auftrag (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Auftrag_Condition;
	information	= Info_Mod_Andre_Auftrag_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Andre_Auftrag_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gidan_Andre))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Auftrag_Info()
{
	AI_Output(self, hero, "Info_Mod_Andre_Auftrag_08_00"); //Gut, dass du kommst, es gibt jede Menge zu tun!
	AI_Output(hero, self, "Info_Mod_Andre_Auftrag_15_01"); //Ach ja? Was denn?
	AI_Output(self, hero, "Info_Mod_Andre_Auftrag_08_02"); //Nun zum Einen ist ein Wissenschaftler aus der Oberstadt verschwunden, vermutlich entführt worden.
	AI_Output(self, hero, "Info_Mod_Andre_Auftrag_08_03"); //Zum Andren scheinen die alten fanatischen Sektenspinner irgendwas zu planen. Und zu allem Überfluss wurde auch die letzte Karawane, die Richtung Kloster unterwegs war, von seltsamen Golems überfallen.
	AI_Output(hero, self, "Info_Mod_Andre_Auftrag_15_04"); //Wow, ziemlich viel auf einmal.
	AI_Output(self, hero, "Info_Mod_Andre_Auftrag_08_05"); //Ja, deswegen arbeitest du auch nicht alleine daran.
	AI_Output(hero, self, "Info_Mod_Andre_Auftrag_15_06"); //Was meinst du mir "nicht alleine"?
	AI_Output(self, hero, "Info_Mod_Andre_Auftrag_08_07"); //Gidan wird die Karawanen überwachen.
	AI_Output(hero, self, "Info_Mod_Andre_Auftrag_15_08"); //Na gut ... dann kümmere ich mich um die Sekte und den Erfinder.
	AI_Output(self, hero, "Info_Mod_Andre_Auftrag_08_09"); //Gut, sag bescheid, wenn du etwas herausfindest.

	Wld_InsertNpc	(Mod_1745_PSIGUR_Guru_NW, "BIGFARM");
	Wld_InsertNpc	(Mod_7392_PSITPL_Templer_NW, "BIGFARM");
	Wld_InsertNpc	(Mod_7393_PSITPL_Templer_NW, "BIGFARM");
	Wld_InsertNpc	(Mod_7394_PSINOV_Novize_NW, "BIGFARM");
	Wld_InsertNpc	(Mod_7395_PSINOV_Novize_NW, "BIGFARM");
	Wld_InsertNpc	(Mod_7396_PSINOV_Novize_NW, "BIGFARM");

	Wld_InsertItem	(ItWr_SektisTeleport2, "FP_ITEM_OV_02");
	Wld_InsertItem	(ItWr_ErfinderBrief, "FP_ITEM_ERFINDERBRIEF");

	Wld_InsertNpc	(Mod_1729_PSINOV_Novize_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1727_PSINOV_Novize_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1725_PSINOV_Novize_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1726_PSINOV_Novize_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1728_PSINOV_Novize_NW,	"NW_CITY_ENTRANCE_01");

	Mob_CreateItems	("SEKTENTRUHE1", ItWr_SektisTeleport1, 1);

	Log_CreateTopic	(TOPIC_MOD_MILIZ_WISSENSCHAFTLER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_MILIZ_wISSENSCHAFTLER, LOG_RUNNING);
	Log_CreateTopic	(TOPIC_MOD_MILIZ_SEKTENSPINNER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_MILIZ_SEKTENSPINNER, LOG_RUNNING);
	B_LogEntry_More	(TOPIC_MOD_MILIZ_WISSENSCHAFTLER, TOPIC_MOD_MILIZ_SEKTENSPINNER, "Ich muss herausfinden, was es mit dem Verschwinden des Erfinders auf sich hat.", "Irgendetwas stimmt mit den Sektenspinnern nicht. Ich sollte im Minental mal mit Cor Angar sprechen.");

	B_StartOtherRoutine	(Mod_1723_MIL_Gidan_NW,	"TOT");

	B_StartOtherRoutine	(Mod_586_NONE_Jack_NW, "ATCITY");
};

INSTANCE Info_Mod_Andre_WoErfinder (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_WoErfinder_Condition;
	information	= Info_Mod_Andre_WoErfinder_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wo gibt es Hinweise zum Erfinder?";
};

FUNC INT Info_Mod_Andre_WoErfinder_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_Auftrag))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_WoErfinder_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_WoErfinder_15_00"); //Wo gibt es Hinweise zum Erfinder?
	AI_Output(self, hero, "Info_Mod_Andre_WoErfinder_08_01"); //Sieh dich am besten in seinem Haus um. Geh ins obere Viertel und durch den Torbogen in Richtung des Händlers Salandril.
	AI_Output(self, hero, "Info_Mod_Andre_WoErfinder_08_02"); //Dort auf der linken Seite das Haus gehört dem Erfinder.

	B_LogEntry	(TOPIC_MOD_MILIZ_WISSENSCHAFTLER, "Ich sollte mich im Haus des Erfinders umsehen. Ich finde es im oberen Viertel auf dem Weg zu Salandril auf der linken Seite nach dem Torbogen.");

};

INSTANCE Info_Mod_Andre_WoFanatiker (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_WoFanatiker_Condition;
	information	= Info_Mod_Andre_WoFanatiker_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wo gibt es Hinweise zu den Sektenspinnern?";
};

FUNC INT Info_Mod_Andre_WoFanatiker_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_Auftrag))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_WoFanatiker_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_WoFanatiker_15_00"); //Wo gibt es Hinweise zu den Sektenspinnern?
	AI_Output(self, hero, "Info_Mod_Andre_WoFanatiker_08_01"); //Hör dich am besten im Sumpflager im Minental um. Oder bei deinem Freund, von dem mir Gidan erzählt hat, dieser Lester.

	B_LogEntry	(TOPIC_MOD_MILIZ_SEKTENSPINNER, "Lord Andre meint ich sollte mich im Sumpflager oder bei Lester umhören, um etwas über die fanatischen Sektenspinner zu erfahren.");

};

INSTANCE Info_Mod_Andre_Erfahrung_Erfinder (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Erfahrung_Erfinder_Condition;
	information	= Info_Mod_Andre_Erfahrung_Erfinder_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab etwas über den Erfinder herausgefunden!";
};

FUNC INT Info_Mod_Andre_Erfahrung_Erfinder_Condition()
{
	if (Mod_MitLawrenceGesprochen == 13)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Erfahrung_Erfinder_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_Erfahrung_Erfinder_15_00"); //Ich hab etwas über den Erfinder herausgefunden!
	AI_Output(self, hero, "Info_Mod_Andre_Erfahrung_Erfinder_08_01"); //Gut, berichte.
	AI_Output(hero, self, "Info_Mod_Andre_Erfahrung_Erfinder_15_02"); //Der Erfinder wurde auf Anweisung eines gewissen Cor Kolam entführt. Dieser will mit seiner Hilfe den Schläfer wiedererwecken.
	AI_Output(hero, self, "Info_Mod_Andre_Erfahrung_Erfinder_15_03"); //Der Statthalter Larius, der Händler Lutero und die Miliz Lawrence scheinen alle mit ihm zusammengearbeitet zu haben.
	AI_Output(hero, self, "Info_Mod_Andre_Erfahrung_Erfinder_15_04"); //Ich habe sie getötet, als sie versucht haben mich zu töten. Außerdem habe ich noch eine Pergamenthälfte gefunden.
	AI_Output(self, hero, "Info_Mod_Andre_Erfahrung_Erfinder_08_05"); //Das sind wichtige Informationen.

	B_SetTopicStatus	(TOPIC_MOD_MILIZ_WISSENSCHAFTLER, LOG_SUCCESS);

	B_GivePlayerXP	(500);

	B_Göttergefallen(1, 1);
};

INSTANCE Info_Mod_Andre_Erfahrung_Fanatiker (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Erfahrung_Fanatiker_Condition;
	information	= Info_Mod_Andre_Erfahrung_Fanatiker_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab etwas über die Fanatiker herausgefunden!";
};

FUNC INT Info_Mod_Andre_Erfahrung_Fanatiker_Condition()
{
	if (Npc_HasItems(hero, ItWr_SektisTeleport1) == 1)
	&& (Npc_HasItems(hero, ItWr_SektisTeleport2) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Erfahrung_Fanatiker_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_Erfahrung_Fanatiker_15_00"); //Ich hab etwas über die Fanatiker herausgefunden!
	AI_Output(self, hero, "Info_Mod_Andre_Erfahrung_Fanatiker_08_01"); //Gut, berichte.
	AI_Output(hero, self, "Info_Mod_Andre_Erfahrung_Fanatiker_15_02"); //In der Gegend um Khorinis befinden sich mehrere Gruppen von ehemaligen Sektenmitgliedern.
	AI_Output(hero, self, "Info_Mod_Andre_Erfahrung_Fanatiker_15_03"); //Diese scheinen zu versuchen, den Schläfer wiederzuerwecken. Eine dieser Gruppen hat den Leuchtturm in Besitz genommen, die andere auf der Südseite der Stadt habe ich vernichtet.
	AI_Output(hero, self, "Info_Mod_Andre_Erfahrung_Fanatiker_15_04"); //Ich habe dort eine Pergamenthälfte gefunden.
	AI_Output(self, hero, "Info_Mod_Andre_Erfahrung_Fanatiker_08_05"); //Hm, wir müssen aufpassen ...

	B_SetTopicStatus	(TOPIC_MOD_MILIZ_SEKTENSPINNER, LOG_SUCCESS);

	B_GivePlayerXP	(500);

	B_Göttergefallen(1, 1);
};

INSTANCE Info_Mod_Andre_Erfahrung (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Erfahrung_Condition;
	information	= Info_Mod_Andre_Erfahrung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Das war erstmal alles, was ich herausfinden konnte.";
};

FUNC INT Info_Mod_Andre_Erfahrung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_Erfahrung_Erfinder))
	&& (Npc_KnowsInfo(hero, Info_Mod_Andre_Erfahrung_Fanatiker))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Erfahrung_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_Erfahrung_15_00"); //Das war erstmal alles, was ich herausfinden konnte.
	AI_Output(self, hero, "Info_Mod_Andre_Erfahrung_08_01"); //Nun, das hört sich nicht gut an. Gidan ist noch nicht zurückgekehrt, dass heißt wir müssen warten, bis er zurück ist, bevor wir mehr wissen.
	AI_Output(self, hero, "Info_Mod_Andre_Erfahrung_08_02"); //Du gehst solange ins Minental. Dort hatten wir eine Mine im Orkgebiet in der Nähe des Turms. Doch sie wurde vor kurzem überfallen. Du musst sie befreien!
	AI_Output(hero, self, "Info_Mod_Andre_Erfahrung_15_03"); //Von wem wurde die Mine überfallen?
	AI_Output(self, hero, "Info_Mod_Andre_Erfahrung_08_04"); //Unseren Berichten nach von Banditen. Wollen sich vermutlich etwas bereichern, magisches Erz ist zurzeit verdammt teuer.
	AI_Output(hero, self, "Info_Mod_Andre_Erfahrung_15_05"); //Ich mach mich sofort auf den Weg!

	B_GivePlayerXP	(500);

	Log_CreateTopic	(TOPIC_MOD_MILIZ_MINE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_MILIZ_MINE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_MILIZ_MINE, "In einer Mine der Paladine im Minental im Orkgebiet nahe Xardas' Turm gab es einen Banditenüberfall. Ich sollte mich mal um diese Banditen kümmern.");

	B_Göttergefallen(1, 1);
};

INSTANCE Info_Mod_Andre_Banditen (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Banditen_Condition;
	information	= Info_Mod_Andre_Banditen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Mine ist befreit.";
};

FUNC INT Info_Mod_Andre_Banditen_Condition()
{
	if (Mod_PalaStory_Mine_Sektis == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Banditen_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_Banditen_15_00"); //Die Mine ist befreit. Es waren Schläferanhänger, die sie besetzt hatten.
	AI_Output(self, hero, "Info_Mod_Andre_Banditen_08_01"); //Verdammt! Die haben wohl überall ihre Finger im Spiel.

	B_GivePlayerXP	(1000);

	B_SetTopicStatus	(TOPIC_MOD_MILIZ_MINE, LOG_SUCCESS);

	B_Göttergefallen(1, 2);
};

INSTANCE Info_Mod_Andre_GidanBack (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_GidanBack_Condition;
	information	= Info_Mod_Andre_GidanBack_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ist Gidan schon zurück?";
};

FUNC INT Info_Mod_Andre_GidanBack_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_Banditen))
	&& (Mod_PalaKapitel3 == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_GidanBack_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_GidanBack_15_00"); //Ist Gidan schon zurück?

	if (Kapitel < 3)
	{
		AI_Output(self, hero, "Info_Mod_Andre_GidanBack_08_01"); //Nein, noch nicht. Komm später wieder.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Andre_GidanBack_08_02"); //Ja, allerdings ist er schon wieder weg!
		AI_Output(hero, self, "Info_Mod_Andre_GidanBack_15_03"); //Wohin?
		AI_Output(hero, self, "Info_Mod_Andre_GidanBack_15_04"); //Eines unserer Überwachungslager wurde angegriffen ...
		AI_Output(hero, self, "Info_Mod_Andre_GidanBack_15_05"); //Überwachungslager?
		AI_Output(self, hero, "Info_Mod_Andre_GidanBack_08_06"); //Ja. Die haben wir eingerichtet um die Karawanen zu überwachen, die vom Kloster zur Stadt kommen. Kurz bevor du kamst erreichte uns ein Bote der gesagt hat, dass wir angegriffen wurden.
		AI_Output(hero, self, "Info_Mod_Andre_GidanBack_15_07"); //Wo ist dieses Lager?
		AI_Output(self, hero, "Info_Mod_Andre_GidanBack_08_08"); //Unter der Brücke auf dem Weg zur Taverne.
		AI_Output(hero, self, "Info_Mod_Andre_GidanBack_15_09"); //Gut, ich mach mich sofort auf den Weg.

		AI_StopProcessInfos	(self);

		Mod_PalaKapitel3 = 1;

		Npc_ExchangeRoutine	(Mod_1723_MIL_Gidan_NW,	"GOLEM");
		Wld_InsertNpc	(EisenGolem,	"FP_ROAM_CITY_TO_FOREST_42");

		Mod_1723_MIL_Gidan_NW.flags = 2;

		Log_CreateTopic	(TOPIC_MOD_MILIZ_GIDAN, LOG_MISSION);
		B_SetTopicStatus	(TOPIC_MOD_MILIZ_GIDAN, LOG_RUNNING);
		B_LogEntry	(TOPIC_MOD_MILIZ_GIDAN, "Gidan ist in einem Überwachungslager der Miliz in der Nähe der Taverne unter einer Brücke, welches Überfallen wurde. Ich sollte zu ihm gehen und sehen, was er herausgefunden hat.");		
	};
};

INSTANCE Info_Mod_Andre_FIFinished (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_FIFinished_Condition;
	information	= Info_Mod_Andre_FIFinished_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe das Rätsel um die Sekte gelüftet und den Erfinder zerschlagen.";
};

FUNC INT Info_Mod_Andre_FIFinished_Condition()
{
	if (FI_Story == 11)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_FIFinished_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_FIFinished_15_00"); //Ich habe das Rätsel um die Sekte gelüftet und den Erfinder zerschlagen.
	AI_Output(self, hero, "Info_Mod_Andre_FIFinished_08_01"); //Du hast WAS? Das sollte doch umgekehrt geschehen.
	AI_Output(hero, self, "Info_Mod_Andre_FIFinished_15_02"); //Das war so: Der Erfinder wurde nicht entführt, sondern diente nur als Köder für mich.
	AI_Output(hero, self, "Info_Mod_Andre_FIFinished_15_03"); //Cor Kalom's Bruder Cor Kolam hatte einen Roboter gebaut, der wie der Schläfer aussah, und hat damit die Sektenanhänger zu seinen Gefolgsleuten gemacht.
	AI_Output(hero, self, "Info_Mod_Andre_FIFinished_15_04"); //Er faselte von der perfekten Maschine und ich dachte natürlich, dass dies der Schläfer-Bot sei. Doch nachdem ich ihn vernichtet hatte, hat er die eigentliche Wunderwaffe gezeigt.
	AI_Output(hero, self, "Info_Mod_Andre_FIFinished_15_05"); //Als er diese auf mich hetzen wollte kam jedoch Gidan und hat die beiden mit in die Tiefe gerissen. Er hat sich für die Gerechtigkeit geopfert.
	AI_Output(self, hero, "Info_Mod_Andre_FIFinished_08_06"); //So war das ... Naja du hast dir jedenfalls eine Belohnung verdient.
	AI_Output(self, hero, "Info_Mod_Andre_FIFinished_08_07"); //Ich ernenne dich hiermit zum Ritter. Hier ist deine Rüstung.

	CreateInvItems	(hero, ItAr_Pal_M, 1);

	AI_UnequipArmor	(hero);
	AI_EquipArmor	(hero, ItAr_Pal_M);

	B_ShowGivenThings	("Ritterrüstung erhalten");

	AI_Output(self, hero, "Info_Mod_Andre_FIFinished_08_08"); //Zur Zeit ist alles ruhig, Wenn's wieder was zu tun gibt erfährst du es hier.

	B_GivePlayerXP	(2000);

	B_Göttergefallen(1, 5);

	Mod_Gilde = 2;

	B_SetTopicStatus	(TOPIC_MOD_PAL_FI, LOG_SUCCESS);
};

INSTANCE Info_Mod_Andre_RLMord (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_RLMord_Condition;
	information	= Info_Mod_Andre_RLMord_Info;
	permanent	= 0;
	important	= 0;
	description	= "Na, gibt’s was zu tun?";
};

FUNC INT Info_Mod_Andre_RLMord_Condition()
{
	if (FI_Story == 12)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_RLMord_Info()
{
	if (!Npc_KnowsInfo(hero, Info_Mod_Neron_Hi))
	{
		AI_Output(hero, self, "Info_Mod_Andre_RLMord_15_00"); //Na, gibt’s was zu tun?
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Andre_RLMord_15_01"); //Neron schickt mich.
	};

	AI_Output(self, hero, "Info_Mod_Andre_RLMord_08_02"); //Gut, dass du das bist! Im Hafenviertel ist die Hölle los. Ein Milize, Jason, wurde umgebracht!

	B_StartOtherRoutine	(Mod_1260_RIT_Neron_NW, "START");

	Log_CreateTopic	(TOPIC_MOD_PAL_RL, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_PAL_RL, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_PAL_RL, "Der Milizsoldat Jason wurde im Hafenviertel ermordet.");

	Info_ClearChoices	(Info_Mod_Andre_RLMord);

	Info_AddChoice	(Info_Mod_Andre_RLMord, "Wo?", Info_Mod_Andre_RLMord_C);
	Info_AddChoice	(Info_Mod_Andre_RLMord, "Von wem?", Info_Mod_Andre_RLMord_B);
	Info_AddChoice	(Info_Mod_Andre_RLMord, "Wie?", Info_Mod_Andre_RLMord_A);
};

FUNC VOID Info_Mod_Andre_RLMord_C()
{
	AI_Output(hero, self, "Info_Mod_Andre_RLMord_C_15_00"); //Wo?
	AI_Output(self, hero, "Info_Mod_Andre_RLMord_C_08_01"); //In der roten Laterne.
	AI_Output(hero, self, "Info_Mod_Andre_RLMord_C_15_02"); //Er war im Bordell? Dienstlich?
	AI_Output(self, hero, "Info_Mod_Andre_RLMord_C_08_03"); //Wohl kaum. Er war nackt ...

	B_LogEntry	(TOPIC_MOD_PAL_RL, "Der Mord wurde in der Roten Laterne ausgeführt.");

	Mod_PAL_RLChoices += 1;

	if (Mod_PAL_RLChoices == 3)
	{
		Info_ClearChoices	(Info_Mod_Andre_RLMord);
	};
};

FUNC VOID Info_Mod_Andre_RLMord_B()
{
	AI_Output(hero, self, "Info_Mod_Andre_RLMord_B_15_00"); //Von wem?
	AI_Output(self, hero, "Info_Mod_Andre_RLMord_B_08_01"); //Wenn wir das wüssten würde dieser Mistkerl schon hängen!

	Mod_PAL_RLChoices += 1;

	if (Mod_PAL_RLChoices == 3)
	{
		Info_ClearChoices	(Info_Mod_Andre_RLMord);
	};
};

FUNC VOID Info_Mod_Andre_RLMord_A()
{
	AI_Output(hero, self, "Info_Mod_Andre_RLMord_A_15_00"); //Wie?
	AI_Output(self, hero, "Info_Mod_Andre_RLMord_A_08_01"); //Erstochen.

	Mod_PAL_RLChoices += 1;

	if (Mod_PAL_RLChoices == 3)
	{
		Info_ClearChoices	(Info_Mod_Andre_RLMord);
	};
};

INSTANCE Info_Mod_Andre_Giselle (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Giselle_Condition;
	information	= Info_Mod_Andre_Giselle_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Andre_Giselle_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Giselle_Galf))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Giselle_Info()
{
	AI_Output(self, hero, "Info_Mod_Andre_Giselle_08_00"); //Gute Arbeit, Soldat. Du hast’s nicht nur in den Muskeln sondern auch im Kopf! Jason wird auf dem Friedhof beigesetzt, wir erweisen ihm die letzte Ehre.
	AI_Output(self, hero, "Info_Mod_Andre_Giselle_08_01"); //Hier hast du deinen Sold. Ich hoffe wir steuern jetzt auf ruhigere Zeiten zu ...

	B_GiveInvItems	(self, hero, ItMi_Gold, 2000);

	AI_Output(hero, self, "Info_Mod_Andre_Giselle_15_02"); //Was ist mit der "Dunklen Gestalt"?
	AI_Output(self, hero, "Info_Mod_Andre_Giselle_08_03"); //Wir fahnden verdeckt nach ihr. Das letzte, was wir brauchen, ist eine Massenpanik.
	AI_Output(hero, self, "Info_Mod_Andre_Giselle_15_04"); //Habt ihr schon was rausgefunden?
	AI_Output(self, hero, "Info_Mod_Andre_Giselle_08_05"); //Nein, bisher noch nicht.

	B_StartOtherRoutine	(Mod_744_MIL_Pablo_NW, "START");
	B_StartOtherRoutine	(Mod_7234_OUT_Giselle_NW, "KNAST");
	B_StartOtherRoutine	(Mod_7235_NONE_Galf_NW, "KNAST");

	B_GivePlayerXP	(2000);

	B_LogEntry	(TOPIC_MOD_PAL_RL, "Der Fall sollte abgeschlossen sein, jetzt wird nur noch verdeckt nach der dunkle Gestalt gefahndet, um eine Massenpanik zu verhindern.");

	Mod_PAL_MISH_Day = Wld_GetDay();
};

INSTANCE Info_Mod_Andre_Bernd (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Bernd_Condition;
	information	= Info_Mod_Andre_Bernd_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Andre_Bernd_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_Giselle))
	&& (Wld_GetDay() > Mod_PAL_MISH_Day)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Bernd_Info()
{
	AI_Output(self, hero, "Info_Mod_Andre_Bernd_08_00"); //Gut, dass du gerade kommst. Ich hab grad eine Meldung wegen häuslicher Gewalt entgegengenommen.
	AI_Output(self, hero, "Info_Mod_Andre_Bernd_08_01"); //Bernd, ein Säufer aus dem Hafenviertel, hat wiedermal einen über den Durst getrunken und lässt seinen Kater gerade an seiner Frau aus, geh da bitte mal hin und „beruhige“ ihn.
	AI_Output(hero, self, "Info_Mod_Andre_Bernd_15_02"); //Wird erledigt.

	B_StartOtherRoutine	(Mod_1062_VLK_Bernd_NW, "GEKILLT");
	B_StartOtherRoutine	(Mod_1064_VLK_Jana_NW, "BERND");

	B_KillNpc	(Mod_1062_VLK_Bernd_NW);

	B_LogEntry	(TOPIC_MOD_PAL_RL, "Bernd, ein Säufer aus dem Hafenviertel, soll seine Frau schlagen. Ich soll ihn beruhigen.");
};

INSTANCE Info_Mod_Andre_Jana (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Jana_Condition;
	information	= Info_Mod_Andre_Jana_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bernd ist beruhigt.";
};

FUNC INT Info_Mod_Andre_Jana_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jana_BerndTot))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Jana_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_Jana_15_00"); //Bernd ist beruhigt.
	AI_Output(self, hero, "Info_Mod_Andre_Jana_08_01"); //So? Das ging aber schnell.
	AI_Output(hero, self, "Info_Mod_Andre_Jana_15_02"); //Ja, und dazu noch dauerhaft. Er ist tot.
	AI_Output(self, hero, "Info_Mod_Andre_Jana_08_03"); //Ach verflucht, du kannst doch nicht jeden dahergelaufenen Säufer erschlagen, nur weil du dir den Papierkram sparen willst!
	AI_Output(hero, self, "Info_Mod_Andre_Jana_15_04"); //Ich war‘s nicht, sondern ein "dunkler Typ in einer Milizrüstung".
	AI_Output(self, hero, "Info_Mod_Andre_Jana_08_05"); //Du meinst doch nicht etwa ...
	AI_Output(hero, self, "Info_Mod_Andre_Jana_15_06"); //Doch. Wir haben es hier mit einem Serienmörder zu tun, der ganz nebenbei Jason's Rüstung trägt.
	AI_Output(self, hero, "Info_Mod_Andre_Jana_08_07"); //Dann müssen wir wohl an die Öffentlichkeit treten ...
	AI_Output(self, hero, "Info_Mod_Andre_Jana_08_08"); //Ich werde hier alles vorbereiten, geh du inzwischen bitte kurz zum Marktplatz, da ist ein Spinner, vermutlich ein alter Guru aus dem Sektenlager, der die Leute vor dem Ende der Welt warnt und dabei ziemlich indiskret ist. Schmeiß ihn aus der Stadt.

	B_LogEntry	(TOPIC_MOD_PAL_RL, "Lord Andre meint, dass wir an die Öffentlichkeit gehen müssen. Während er alles vorbereitet soll ich einen verrückten Guru, der auf dem Marktplatz das Ende der Welt prophezeit, aus der Stadt schmeißen.");

	Wld_InsertNpc	(Mod_7236_GUR_Guru_NW, "MARKT");
};

INSTANCE Info_Mod_Andre_HeroBot (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_HeroBot_Condition;
	information	= Info_Mod_Andre_HeroBot_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich weiß jetzt, wer unser Serienkiller ist.";
};

FUNC INT Info_Mod_Andre_HeroBot_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HeroBot_Weg))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_HeroBot_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_HeroBot_15_00"); //Ich weiß jetzt, wer unser Serienkiller ist.
	AI_Output(self, hero, "Info_Mod_Andre_HeroBot_08_01"); //Du weißt es? Wer?
	AI_Output(hero, self, "Info_Mod_Andre_HeroBot_15_02"); //Kolam's Kampfroboter.
	AI_Output(self, hero, "Info_Mod_Andre_HeroBot_08_03"); //Was? Wie kommst du darauf?
	AI_Output(hero, self, "Info_Mod_Andre_HeroBot_15_04"); //Ich hab ihn gesehen. Er hat den Verrückten am Marktplatz umgehauen.
	AI_Output(self, hero, "Info_Mod_Andre_HeroBot_08_05"); //Ich nehm an ich muss mir keine Gedanken darüber machen, wie er noch funktionieren kann oder warum er bis jetzt nur Verbrecher abgestochen hat, weil du ihn erledigt hast ... richtig?
	AI_Output(hero, self, "Info_Mod_Andre_HeroBot_15_06"); //Falsch. Ich hab versucht, ihn zu erledigen, allerdings hat Kolam bei dem Gerät ganze Arbeit geleistet. Ich konnte ihn kaum anritzen, dafür hab ich mit jedem Schlag Energie verloren.
	AI_Output(self, hero, "Info_Mod_Andre_HeroBot_08_07"); //Warum stehst du dann noch hier?
	AI_Output(hero, self, "Info_Mod_Andre_HeroBot_15_08"); //Der Roboter hat mich nicht angegriffen. Er faselte irgendwas von "Bedrohen von sowieso ist als Straftat anzusehen" oder was weiß ich und hat sich wegteleportiert.
	AI_Output(self, hero, "Info_Mod_Andre_HeroBot_08_09"); //"Bedrohen als Strafttat anzusehen" ... das kommt mir merkwürdig bekannt vor. Hat der Roboter sonst noch was gesagt?
	AI_Output(hero, self, "Info_Mod_Andre_HeroBot_15_10"); //Ja ... zu Jana hat er irgendwas davon gefaselt, dass "ein guter Milize stets die Schwachen schützt" ...
	AI_Output(self, hero, "Info_Mod_Andre_HeroBot_08_11"); //Das kommt mir alles so vertraut vor. Woher kenne ich das bloß? Hat der Roboter vielleicht nochwas gesagt?
	AI_Output(hero, self, "Info_Mod_Andre_HeroBot_15_12"); //Nicht, dass ich wüsste.
	AI_Output(self, hero, "Info_Mod_Andre_HeroBot_08_13"); //Damit hast du einen neuen Auftrag. Finde noch was raus. Ich versuch inzwischen eine Massenpanik zu verhindern! Und beeil dich gefälligst.

	B_GivePlayerXP	(500);

	B_LogEntry	(TOPIC_MOD_PAL_RL, "Die Sprüche des Roboters kommen Lord Andre sehr bekannt vor, er kann sie jedoch noch nicht einordnen. Ich soll nun einen weiteren Spruch von ihm herausfinden. Ich sollte also mal mit Giselle im Gefängnis reden.");
};

INSTANCE Info_Mod_Andre_Kerze (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Kerze_Condition;
	information	= Info_Mod_Andre_Kerze_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Andre_Kerze_Condition()
{
	if (Mod_PAL_HeroBot == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Kerze_Info()
{
	AI_Output(self, hero, "Info_Mod_Andre_Kerze_08_00"); //Wird auch Zeit, dass du kommst, irgendwas ist durchgesicktert, hier ist die Hölle los.
	AI_Output(self, hero, "Info_Mod_Andre_Kerze_08_01"); //Wir haben eine Ausgangssperre verhängt, aber das beeindruckt hier niemanden.
	AI_Output(self, hero, "Info_Mod_Andre_Kerze_08_02"); //Wir müssen dieses Problem augenblicklich lösen! Ich hoffe du weißt wie.
	AI_Output(hero, self, "Info_Mod_Andre_Kerze_15_03"); //Ich habe mit Giselle gesprochen. Laut ihrer Aussage hat der Roboter etwas gesagt wie "Milizen ist es in ihrer Vorbildw ..."
	AI_Output(self, hero, "Info_Mod_Andre_Kerze_08_04"); //(setzt in den Satz des Helden ein) "... es in ihrer Vorbildwirkung nicht erlaubt unlautere Taten auszuüben". Natürlich! Das sind alles Grundregeln der Milizenschule.
	AI_Output(hero, self, "Info_Mod_Andre_Kerze_15_05"); //Milizenschule?
	AI_Output(self, hero, "Info_Mod_Andre_Kerze_08_06"); //Der bist du entgangen will du das Turnier gewonnen hast, schon vergessen? Kolam muss den Roboter falsch Programmiert haben.
	AI_Output(self, hero, "Info_Mod_Andre_Kerze_08_07"); //Er hat nicht nur deinen Kampfstil aufgenommen sondern du hast vermutlich auch irgendeine Maxime der Miliz auf ihn übertragen. Und jetzt zerschlägt er Verbrechen und Unrecht.
	AI_Output(hero, self, "Info_Mod_Andre_Kerze_15_08"); //Warum sollten wir dann etwas dagegen tun?
	AI_Output(self, hero, "Info_Mod_Andre_Kerze_08_09"); //Sieh dir an was das bringt! Der Roboter geht über Leichen.
	AI_Output(self, hero, "Info_Mod_Andre_Kerze_08_10"); //Und wenn wir uns nicht bald etwas einfallen lassen, wie wir ihn erledigen können dann wird das jeder tun, weil die Straßen mit den leblosen Körpern der Verbrecher gepflastert sein werden!
	AI_Output(self, hero, "Info_Mod_Andre_Kerze_08_11"); //Wir müssen ihn vernichten, ruf die gesamten Milizen zusammen, wir werden ihn offen angreifen.
	AI_Output(hero, self, "Info_Mod_Andre_Kerze_15_12"); //Zum einen: Wie willst du ihn finden, außerdem kann er sich Teleportieren.
	AI_Output(hero, self, "Info_Mod_Andre_Kerze_15_13"); //Und zum andren: Wie willst du ihn verletzen? Ich hab dir doch gesagt, dass der Roboter unverwüstlich ist!
	AI_Output(hero, self, "Info_Mod_Andre_Kerze_15_14"); //Der ist aus massivem Magischem Erz! Gegen den könnten wir nicht mal antreten wenn wir Erz-Schwerter hätten.
	AI_Output(self, hero, "Info_Mod_Andre_Kerze_08_15"); //Dann müssen wir ihn eben in eine Falle locken. Zuerst erledigen wir das mit dem finden, dann mit dem Zerstören.
	AI_Output(self, hero, "Info_Mod_Andre_Kerze_08_16"); //Warte kurz ... ich hab hier noch irgendwo alte Steckbriefe, die dürften uns nützlich sein.

	AI_GotoWp	(self, "WP_ANDRE_STECKBRIEFE");

	AI_PlayAni	(self, "T_PLUNDER");

	AI_GotoWP	(self, "NW_CITY_ANDRE");

	AI_TurnToNpc	(self, hero);

	AI_Output(self, hero, "Info_Mod_Andre_Kerze_08_17"); //Die sind von einem alten Fall. Der Gesuchte ist immer in einem bunten Kostüm mit Schachkragen aufgetreten. Das machen wir uns jetzt zunutze.
	AI_Output(self, hero, "Info_Mod_Andre_Kerze_08_18"); //Ich werde dafür sorgen, dass jeder Wache einer gebracht wird. Sie sollen sie überall herumzeigen.
	AI_Output(self, hero, "Info_Mod_Andre_Kerze_08_19"); //Währenddessen sagst du dem Herold am Marktplatzt er soll die Leute vor einem gefährlichen Irren warnen, der in buntem Kostüm mit Schachkragen rumläuft und letzte Nacht im vier Milizsoldaten erstach während sie schliefen.
	AI_Output(hero, self, "Info_Mod_Andre_Kerze_15_20"); //Das wird die Panik aber nur noch verstärken.
	AI_Output(self, hero, "Info_Mod_Andre_Kerze_08_21"); //Lass das meine Sorge sein. Beeil dich.

	B_GivePlayerXP	(1000);

	B_SetTopicStatus	(TOPIC_MOD_PAL_RL, LOG_SUCCESS);

	Log_CreateTopic	(TOPIC_MOD_PAL_BOT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_PAL_BOT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_PAL_BOT, "Lord Andre hat einen Plan, wie wir den Roboter vernichten können. Er wird Steckbriefe an die Wachen verteilen lassen. Währenddessen soll ich dem Herold sagen, dass er vor einem Mörder in buntem Kostüm mit Schachkragen warnen soll, der letzte Nacht vier Milizsoldaten getötet haben soll.");

	B_Göttergefallen(1, 2);
};

INSTANCE Info_Mod_Andre_Herold (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Herold_Condition;
	information	= Info_Mod_Andre_Herold_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Andre_Herold_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Herold_Verbrecher))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Herold_Info()
{
	AI_Output(self, hero, "Info_Mod_Andre_Herold_08_00"); //Sehr gut. Ich habe inzwischen alle Vorbereitungen getroffen. Hier, nimm das.

	B_GiveInvItems	(self, hero, ItPo_Speed_Andre, 1);

	AI_Output(self, hero, "Info_Mod_Andre_Herold_08_01"); //Und das musst du anziehen.

	CreateInvItems	(hero, ItAr_Gangster, 1);

	B_ShowGivenThings	("Kostüm erhalten");

	AI_Output(hero, self, "Info_Mod_Andre_Herold_15_02"); //Was soll ich damit?
	AI_Output(self, hero, "Info_Mod_Andre_Herold_08_03"); //Wir haben nur eine Chance diesen Roboter zur Strecke zu bringen, wir müssen ihn einschmelzen.
	AI_Output(self, hero, "Info_Mod_Andre_Herold_08_04"); //Dazu müssen wir ihn in den Hochofen in Khorata locken, das ist der einzige Platz, der heiß genug ist, magisches Erz zu schmelzen und von dem er sich nicht wegteleportieren kann.
	AI_Output(self, hero, "Info_Mod_Andre_Herold_08_05"); //Die Wände sind ja auch aus magischem Erz, da kommt keine Magie durch. Du wirst den Lockvogel spielen.
	AI_Output(hero, self, "Info_Mod_Andre_Herold_15_06"); //Ich soll in den Hochofen? Mir wäre ein Plan lieber, bei dem ich nicht geröstet werde.
	AI_Output(self, hero, "Info_Mod_Andre_Herold_08_07"); //Lass das meine Sorge sein. Zieh jetzt das Kostüm an und trink den Trank.
	AI_Output(self, hero, "Info_Mod_Andre_Herold_08_08"); //Dann läufst du auf dem schnellsten Wege nach Khorata und direkt in den Hochofen. Ich werde mich unterdessen dorthin teleportieren und alles vorbereiten.
	AI_Output(self, hero, "Info_Mod_Andre_Herold_08_09"); //Der Ofen wird ausgeschalten sein wenn du reinläufst und ich werde einen Ausweg für dich vorbereiten.
	AI_Output(self, hero, "Info_Mod_Andre_Herold_08_10"); //Los jetzt, lauf mit dem Kostüm einige Runden durch die Stadt bis dich der Roboter erwischt, er wird dich dann verfolgen. Wir sehen uns in Khorata.

	B_GivePlayerXP	(250);

	B_LogEntry	(TOPIC_MOD_PAL_BOT, "Ich habe von Lord Andre einen Geschwindigkeitstrank und ein Kostüm bekommen. Das Kostüm soll ich anziehen und damit den Roboter auf mich hetzen. Wenn er mich verfolgt, so soll ich den schnellsten Weg nach Khorata nehmen und dort direkt in den Hochofen laufen. Lord Andre wird derzeit dort einen Ausgang für mich bereithalten.");
};

INSTANCE Info_Mod_Andre_Ramirez (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Ramirez_Condition;
	information	= Info_Mod_Andre_Ramirez_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Andre_Ramirez_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ramirez_ZuAndre))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Ramirez_Info()
{
	AI_Output(self, hero, "Info_Mod_Andre_Ramirez_08_00"); //Was führt dich zu mir?
	AI_Output(hero, self, "Info_Mod_Andre_Ramirez_15_01"); //Ich habe einen Dieb dabei erwischt, wie er einen unschuldigen Bürger dieser Stadt bestehlen wollte.
	AI_Output(self, hero, "Info_Mod_Andre_Ramirez_08_02"); //Innos sei Dank, es gibt noch Gerechtigkeit. Moment, das ist doch Ramirez, der Anführer der Diebesbande.
	AI_Output(self, hero, "Info_Mod_Andre_Ramirez_08_03"); //Wie konntest du ihn fangen?
	AI_Output(hero, self, "Info_Mod_Andre_Ramirez_15_04"); //Als er sich gerade umgedreht hat konnte ich ihn von hinten überwältigen.
	AI_Output(self, hero, "Info_Mod_Andre_Ramirez_08_05"); //Ich sehe Innos' Feuer in deinem Herzen, du hast mich überzeugt.
	AI_Output(self, hero, "Info_Mod_Andre_Ramirez_08_06"); //Einen wie dich können wir hier gut gebrauchen. Das ist schon der zweite Schwerverbrecher, den wir jetzt haben. Der andere heißt Attila und ist ein Mörder.
	AI_Output(self, hero, "Info_Mod_Andre_Ramirez_08_07"); //Wenn wir so weitermachen, können die Bürger bald unbesorgt schlafen.

	if (Mod_Gilde < 1)
	|| (Mod_Gilde > 3)
	{
		AI_Output(hero, self, "Info_Mod_Andre_Ramirez_15_08"); //Gehöre ich nun zur Miliz?
		AI_Output(self, hero, "Info_Mod_Andre_Ramirez_08_09"); //Bei dir lässt sich eine Ausnahme machen, aber prahle nicht damit rum, sonst werden wir beide Probleme bekommen.
		AI_Output(hero, self, "Info_Mod_Andre_Ramirez_15_10"); //Verstehe.
		AI_Output(self, hero, "Info_Mod_Andre_Ramirez_08_11"); //Gut, hier ist deine Rüstung.

		CreateInvItems	(self, ItAr_Mil_L, 1);
		B_GiveInvItems	(self, hero, ItAr_Mil_L, 1);
	};

	AI_Output(self, hero, "Info_Mod_Andre_Ramirez_08_12"); //Hier hast du noch das Kopfgeld für Ramirez.

	CreateInvItems	(self, ItMi_Gold, 1000);
	B_GiveInvItems	(self, hero, ItMi_Gold, 1000);

	B_StartOtherRoutine	(Mod_746_NONE_Ramirez_NW, "KNAST");
	AI_Teleport	(Mod_746_NONE_Ramirez_NW, "NW_CITY_HABOUR_KASERN_NAGUR");

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_DIEB_ATTILA, "Lord Andre denkt, ich hätte Ramirez festgenommen. Ich bin jetzt Mitglied der Miliz. Mal sehen, ob alles so klappt, wie Cassia es geplant hat.");
};

INSTANCE Info_Mod_Andre_Keller (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Keller_Condition;
	information	= Info_Mod_Andre_Keller_Info;
	permanent	= 0;
	important	= 0;
	description	= "Gibt es was zu tun?";
};

FUNC INT Info_Mod_Andre_Keller_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_Ramirez))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Keller_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_Keller_15_00"); //Gibt es was zu tun?
	AI_Output(self, hero, "Info_Mod_Andre_Keller_08_01"); //Du kommst genau richtig. Einer der Händler hat mir über seltsame Dinge im schlafendem Geldsack berichtet.
	AI_Output(self, hero, "Info_Mod_Andre_Keller_08_02"); //Nachts sollen aus der Kellertür mehrere merkwürdige Gestalten rausgekommen sein.
	AI_Output(self, hero, "Info_Mod_Andre_Keller_08_03"); //Geh dieser Sache auf den Grund.
	AI_Output(hero, self, "Info_Mod_Andre_Keller_15_04"); //Werde ich machen.

	Log_CreateTopic	(TOPIC_MOD_DIEB_ANDRE_HANNA, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_DIEB_ANDRE_HANNA, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_DIEB_ANDRE_HANNA, "Ein Händler scheint gesehen zu haben, wie nachts einige Diebe aus Hanna's Keller gekommen sind. Lord Andre will, dass ich der Sache auf den Grund gehe. Ich sollte mal mit Hanna reden.");
};

INSTANCE Info_Mod_Andre_Hanna (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Hanna_Condition;
	information	= Info_Mod_Andre_Hanna_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich war im Keller vom schlafendem Geldsack.";
};

FUNC INT Info_Mod_Andre_Hanna_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hanna_Keller))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Hanna_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_Hanna_15_00"); //Ich war im Keller vom schlafendem Geldsack.
	AI_Output(self, hero, "Info_Mod_Andre_Hanna_08_01"); //Und was hast du gefunden?
	AI_Output(hero, self, "Info_Mod_Andre_Hanna_15_02"); //In dem dunklen Loch gabs nur Ratten, sonst nichts.
	AI_Output(self, hero, "Info_Mod_Andre_Hanna_08_03"); //Da hat wahrscheinlich der Händler geträumt.
	AI_Output(hero, self, "Info_Mod_Andre_Hanna_15_04"); //Das hat er sicherlich.
	AI_Output(self, hero, "Info_Mod_Andre_Hanna_08_05"); //Gut, hier ist dein Sold.

	B_GiveInvItems	(self, hero, ItMi_Gold, 200);

	AI_Output(self, hero, "Info_Mod_Andre_Hanna_08_06"); //Komm später wieder, momentan ist alles ruhig.

	B_GivePlayerXP	(200);

	B_SetTopicStatus	(TOPIC_MOD_DIEB_ANDRE_HANNA, LOG_SUCCESS);

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Andre_NewsMilizDead (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_NewsMilizDead_Condition;
	information	= Info_Mod_Andre_NewsMilizDead_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ist in der Zwischenzeit etwas passiert?";
};

FUNC INT Info_Mod_Andre_NewsMilizDead_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Rengaru_Milizangriff))
	&& (Npc_IsDead(Mod_1893_MIL_Miliz_NW))
	&& (Npc_IsDead(Mod_1894_MIL_Miliz_NW))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_NewsMilizDead_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_NewsMilizDead_15_00"); //Ist in der Zwischenzeit etwas passiert?
	AI_Output(self, hero, "Info_Mod_Andre_NewsMilizDead_08_01"); //Wie es nicht anders kommen konnte vermissen wir zwei Milizen, die seit geraumer Zeit nicht mehr hier sind.
	AI_Output(hero, self, "Info_Mod_Andre_NewsMilizDead_15_02"); //Worum geht es?
	AI_Output(self, hero, "Info_Mod_Andre_NewsMilizDead_08_03"); //Mortis, unser Schmied, hat uns berichtet, dass Meldor wahrscheinlich irgendein Sumpfkrautgeschäft abzuschließen versucht.
	AI_Output(hero, self, "Info_Mod_Andre_NewsMilizDead_15_04"); //Kann ich mich nicht dieser Sache annehmen?
	AI_Output(self, hero, "Info_Mod_Andre_NewsMilizDead_08_05"); //Wie es aussieht bist du wohl der Einzige hier. Nun gut, geh und halt die Augen offen nach den zwei Anderen.

	B_SetTopicStatus	(TOPIC_MOD_DIEB_MILIZANGRIFF, LOG_SUCCESS);

	Log_CreateTopic	(TOPIC_MOD_DIEB_ANDRE_MELDOR, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_DIEB_ANDRE_MELDOR, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_DIEB_ANDRE_MELDOR, "Mortis hat Lord Andre etwas von einem Krauthandel von Meldor erzählt. Ich sollte Meldor warnen und eine Lüge erfinden, um ihn zu schützen.");

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Andre_Meldor (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Meldor_Condition;
	information	= Info_Mod_Andre_Meldor_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab Meldor beobachtet und durchsucht, war ein falscher Alarm.";
};

FUNC INT Info_Mod_Andre_Meldor_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Meldor_Mortis))
	&& (Mob_HasItems("MORTISTRUHE", ItMi_HerbPaket) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Meldor_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_Meldor_15_00"); //Ich hab Meldor beobachtet und durchsucht, war ein falscher Alarm.
	AI_Output(self, hero, "Info_Mod_Andre_Meldor_08_01"); //Wie das letzte Mal. Mortis wird auch immer unverlässlicher.
	AI_Output(self, hero, "Info_Mod_Andre_Meldor_08_02"); //Was soll's hier ist dein Sold.

	CreateInvItems	(self, ItMi_Gold, 200);
	B_GiveInvItems	(self, hero, ItMi_Gold, 200);

	AI_Output(hero, self, "Info_Mod_Andre_Meldor_15_03"); //Kann ich auch mal eine etwas ruhigere Stelle bekommen, vielleicht die Gefangenen bewachen?
	AI_Output(self, hero, "Info_Mod_Andre_Meldor_08_04"); //Warum nicht, du hast schon einiges geleistet.
	AI_Output(self, hero, "Info_Mod_Andre_Meldor_08_05"); //Ich werde es der Wache sagen, morgen kannst du dann die Gefangenen bewachen.

	B_SetTopicStatus	(TOPIC_MOD_DIEB_ANDRE_MELDOR, LOG_SUCCESS);

	B_GivePlayerXP	(250);

	Mod_Andre_WaitForKnast = Wld_GetDay();

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Andre_RamirezAttilaFlucht (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_RamirezAttilaFlucht_Condition;
	information	= Info_Mod_Andre_RamirezAttilaFlucht_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Andre_RamirezAttilaFlucht_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ramirez_WelcomeBack))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_RamirezAttilaFlucht_Info()
{
	AI_Output(self, hero, "Info_Mod_Andre_RamirezAttilaFlucht_08_00"); //Wo warst du? Wo sind die Diebe? Wo ist das gesamte Gold aus meiner Truhe?
	AI_Output(hero, self, "Info_Mod_Andre_RamirezAttilaFlucht_15_01"); //Ich ...
	AI_Output(self, hero, "Info_Mod_Andre_RamirezAttilaFlucht_08_02"); //Du bist genauso unzuverlässlich wie die anderen zwei, die noch immer nicht da sind. Ich warte auf eine gute Erklärung.
	AI_Output(hero, self, "Info_Mod_Andre_RamirezAttilaFlucht_15_03"); //Ramirez und Attila haben mich reingelegt. Als sie draußen waren hat Ramirez die Truhe geknackt und ich hab gegen Attila gekämpft.
	AI_Output(hero, self, "Info_Mod_Andre_RamirezAttilaFlucht_15_04"); //Danach bin ich ihnen hinter gerannt und hab sie verloren.
	AI_Output(self, hero, "Info_Mod_Andre_RamirezAttilaFlucht_08_05"); //Wie konnte das alles passieren?
	AI_Output(hero, self, "Info_Mod_Andre_RamirezAttilaFlucht_15_06"); //Ich Weiß nicht, es ging so schnell. Sie sind geflohen und haben sich bei Mortis bedankt!
	AI_Output(self, hero, "Info_Mod_Andre_RamirezAttilaFlucht_08_07"); //Bei Mortis? Hat er ihnen etwa geholfen?
	AI_Output(hero, self, "Info_Mod_Andre_RamirezAttilaFlucht_15_08"); //Vielleicht solltest du seine Schmiede genauer anschauen.
	AI_Output(self, hero, "Info_Mod_Andre_RamirezAttilaFlucht_08_09"); //Ich werde das sofort in Auftrag geben. Komm morgen wieder.

	Mod_Andre_WaitForKnast = Wld_GetDay();
};

INSTANCE Info_Mod_Andre_MortisBadGuy (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_MortisBadGuy_Condition;
	information	= Info_Mod_Andre_MortisBadGuy_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Andre_MortisBadGuy_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_RamirezAttilaFlucht))
	&& (Mod_Andre_WaitForKnast < Wld_GetDay())
	&& (Npc_HasItems(hero, ItAr_Mil_L) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_MortisBadGuy_Info()
{
	AI_Output(self, hero, "Info_Mod_Andre_MortisBadGuy_08_00"); //Du hattest Recht, Mortis hatte ein Sumpfkrautpäcken in seiner Truhe versteckt. Er hat uns wahrscheinlich alle auf eine falsche Spur geführt.
	AI_Output(self, hero, "Info_Mod_Andre_MortisBadGuy_08_01"); //Wir werden zum größten Gespött der Stadt. Zwei Schwerverbrecher sind uns entwischt, einer unserer eigenen Leute hat uns verraten und das gesamte Gold der Miliz ist verschwunden.
	AI_Output(hero, self, "Info_Mod_Andre_MortisBadGuy_15_02"); //Da kann man nichts mehr ändern.
	AI_Output(self, hero, "Info_Mod_Andre_MortisBadGuy_08_03"); //Was hast du nun vor? Dich als Gefängiswache werde ich niemals wieder nehmen.
	
	if (Mod_Gilde < 1)
	|| (Mod_Gilde > 3)
	{
		AI_Output(hero, self, "Info_Mod_Andre_MortisBadGuy_15_04"); //Ich wollte Bekannt geben, dass ich aus der Stadt reisen will. Deshalb lege ich meinen Milizjob nieder.
		AI_Output(self, hero, "Info_Mod_Andre_MortisBadGuy_08_05"); //Bist du dir da auch wirklich sicher?
		AI_Output(hero, self, "Info_Mod_Andre_MortisBadGuy_15_06"); //Ich habe mich schon entschieden.
		AI_Output(self, hero, "Info_Mod_Andre_MortisBadGuy_08_07"); //Nun gut, vergiss nie, dass du hier herzlich Willkommen bist, wenn du wieder von neu anfangen willst.
		AI_Output(hero, self, "Info_Mod_Andre_MortisBadGuy_15_08"); //Ich werde es mir merken.
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Andre_MortisBadGuy_15_09"); //Ich werde jetzt meinen anderen Aufgaben nachgehen.
	};

	var C_Item itm;
	
	itm = Npc_GetEquippedArmor(hero);

	if (Hlp_IsItem(itm, ITAR_MIL_L) == TRUE)
	{
		AI_UnequipArmor	(hero);

		AI_EquipBestArmor	(hero);
	};

	Npc_RemoveInvItems	(hero, ItAr_MIL_L, 1);

	B_StartOtherRoutine	(Mod_564_MIL_Boltan_NW, "START");
	B_StartOtherRoutine	(Mod_742_MIL_Mortis_NW, "KNAST");

	AI_Teleport	(Mod_742_MIL_Mortis_NW, "NW_CITY_HABOUR_KASERN_HALVOR");
};

INSTANCE Info_Mod_Andre_Rangar (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Rangar_Condition;
	information	= Info_Mod_Andre_Rangar_Info;
	permanent	= 0;
	important	= 0;
	description	= "Es gibt Gerüchte über eine Miliz.";
};

FUNC INT Info_Mod_Andre_Rangar_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Den_Problem))
	&& (Mod_DensGeruechtVerbreitet == TRUE)
	&& ((Mob_HasItems("RANGARSTRUHE", ItMi_Joint) > 0)
	|| (Mob_HasItems("RANGARSTRUHE", ItMi_HerbPaket) > 0))
	&& (Mod_DenVerpfiffen == 0)
	&& (Mod_Den_Problem == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Rangar_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_Rangar_15_00"); //Es gibt Gerüchte über eine Miliz.
	AI_Output(self, hero, "Info_Mod_Andre_Rangar_08_01"); //Über wen?
	AI_Output(hero, self, "Info_Mod_Andre_Rangar_15_02"); //Rangar. Die Bürger erzählen sich da die verschiedensten Sachen.

	if (Mob_HasItems("RANGARSTRUHE", ItMi_HerbPaket) > 0)
	{
		AI_Output(hero, self, "Info_Mod_Andre_Rangar_15_03"); //Außerdem hab ich gesehen, wie er ein Paket Sumpfkraut in seine Truhe gelegt hat.

		B_GivePlayerXP	(100);
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Andre_Rangar_15_04"); //Außerdem hab ich gesehen, wie er Sumpfkrautstängel in seine Truhe getan hat.

		B_GivePlayerXP	(250);
	};

	AI_Output(self, hero, "Info_Mod_Andre_Rangar_08_05"); //Ich werde das sofort überprüfen lassen. Danke, dass du mich benachrichtigt hast.
	AI_Output(self, hero, "Info_Mod_Andre_Rangar_08_06"); //Hier ist eine kleine Belohnung.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	B_LogEntry	(TOPIC_MOD_DENSPROBLEM, "Lord Andre wird der Sache mit Rangar nachgehen. Ich sollte jetzt Den bescheid geben.");
};

INSTANCE Info_Mod_Andre_Ole (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Ole_Condition;
	information	= Info_Mod_Andre_Ole_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich soll dir diesen Brief von Ole von der königlichen Garde geben.";
};

FUNC INT Info_Mod_Andre_Ole_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Ole_Aufgabe))
	&& (Npc_HasItems(hero, ItWr_OleForAndre) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Ole_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_Ole_15_00"); //Ich soll dir diesen Brief von Ole von der königlichen Garde geben.

	B_GiveInvItems	(hero, self, ItWr_OleForAndre, 1);

	AI_Output(self, hero, "Info_Mod_Andre_Ole_08_01"); //In Ordnung, lass mal sehen.

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Andre_Ole_08_02"); //Sag Ole, solange er mir kein Erz garantieren kann, bekommt er auch keine Paladine als zusätzliche Männer zur Verfügung gestellt.
	AI_Output(self, hero, "Info_Mod_Andre_Ole_08_03"); //Er soll mir mindestens Fünfzig Erzbrocken bringen, als Beweis dass er wieder Erz abbaut, dann können wir über zusätzliche Leute reden.
	AI_Output(self, hero, "Info_Mod_Andre_Ole_08_04"); //Geh und sag ihm das.

	B_LogEntry	(TOPIC_MOD_KG_OLEBRIEF, "Lord Andre scheint keine Verstärkung zur Garde schicken zu wollen, solange es keine Garantien für Erz gibt. Das wird Ole sicher nicht gefallen.");
};

INSTANCE Info_Mod_Andre_Knast (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Knast_Condition;
	information	= Info_Mod_Andre_Knast_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Andre_Knast_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Mil_305_Torwache_ToHagen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Knast_Info()
{
	AI_Output(self, hero, "Info_Mod_Andre_Knast_08_00"); //Du wurdest von einem angesehen Bürger als Verbrecher angezeigt. Was hast du zu dieser Anschuldigung zu sagen?
	
	Info_ClearChoices	(Info_Mod_Andre_Knast);

	Info_AddChoice	(Info_Mod_Andre_Knast, "Gibt es irgendwelche Beweise gegen mich?", Info_Mod_Andre_Knast_C);
	Info_AddChoice	(Info_Mod_Andre_Knast, "Ich bin kein Verbrecher.", Info_Mod_Andre_Knast_B);
	Info_AddChoice	(Info_Mod_Andre_Knast, "Dieser Bürger ist ein Betrüger.", Info_Mod_Andre_Knast_A);
};

FUNC VOID Info_Mod_Andre_Knast_Ok ()
{
	AI_Output(self, hero, "Info_Mod_Andre_Knast_Ok_08_00"); //Ich werde das nachprüfen. Danke für deine Antworten.
	
	Info_ClearChoices	(Info_Mod_Andre_Knast);

	AI_StopProcessInfos	(self);

	AI_GotoWP	(self, "KASERNE");
};

FUNC VOID Info_Mod_Andre_Knast_C ()
{
	AI_Output(hero, self, "Info_Mod_Andre_Knast_C_15_00"); //Gibt es irgendwelche Beweise gegen mich?
	AI_Output(self, hero, "Info_Mod_Andre_Knast_C_08_01"); //Es ist nicht schwer eine Bestätigung dafür zu bekommen, dass du aus der Strafkolonie stammst, und die Mitglieder des Alten Lagers sind noch immer alles andere als seriöse Geschäftsleute, somit bist du nachweislich Mitglied einer kriminellen Vereinigung.
	
	Info_ClearChoices	(Info_Mod_Andre_Knast);

	Info_AddChoice	(Info_Mod_Andre_Knast, "Ich wurde von Alissandro, einem Bekannten von Lord Hagen, geschickt.", Info_Mod_Andre_Knast_C_B);
	Info_AddChoice	(Info_Mod_Andre_Knast, "Bodo trägt die Waffe eines Dämonenritters.", Info_Mod_Andre_Knast_C_A);
};

FUNC VOID Info_Mod_Andre_Knast_C_B ()
{
	AI_Output(hero, self, "Info_Mod_Andre_Knast_C_B_15_00"); //Ich wurde von Alissandro, einem Bekannten von Lord Hagen, geschickt.
	
	Info_Mod_Andre_Knast_Ok();
};

FUNC VOID Info_Mod_Andre_Knast_C_A ()
{
	AI_Output(hero, self, "Info_Mod_Andre_Knast_C_A_15_00"); //Bodo trägt die Waffe eines Dämonenritters.
	
	Info_Mod_Andre_Knast_Ok();
};

FUNC VOID Info_Mod_Andre_Knast_B ()
{
	AI_Output(hero, self, "Info_Mod_Andre_Knast_B_15_00"); //Ich bin kein Verbrecher.
	AI_Output(self, hero, "Info_Mod_Andre_Knast_B_08_01"); //Hast du dafür irgendwelche Beweise oder sind diese Behauptungen aus der Luft gegriffen?
	
	Info_ClearChoices	(Info_Mod_Andre_Knast);

	Info_AddChoice	(Info_Mod_Andre_Knast, "Ich bin allerdings kein Verbrecher, Im Gegensatz zu Bodo.", Info_Mod_Andre_Knast_AB_C);
	Info_AddChoice	(Info_Mod_Andre_Knast, "Ich wurde von Alissandro, einem Bekannten von Lord Hagen, geschickt.", Info_Mod_Andre_Knast_C_B);
	Info_AddChoice	(Info_Mod_Andre_Knast, "Bodo trägt die Waffe eines Dämonenritters.", Info_Mod_Andre_Knast_C_A);
};

FUNC VOID Info_Mod_Andre_Knast_A ()
{
	AI_Output(hero, self, "Info_Mod_Andre_Knast_A_15_00"); //Dieser Bürger ist ein Betrüger.
	AI_Output(self, hero, "Info_Mod_Andre_Knast_A_08_01"); //Hast du dafür irgendwelche Beweise oder sind diese Behauptungen aus der Luft gegriffen?
	
	Info_ClearChoices	(Info_Mod_Andre_Knast);

	Info_AddChoice	(Info_Mod_Andre_Knast, "Ich bin allerdings kein Verbrecher, Im Gegensatz zu Bodo.", Info_Mod_Andre_Knast_AB_C);
	Info_AddChoice	(Info_Mod_Andre_Knast, "Ich wurde von Alissandro, einem Bekannten von Lord Hagen, geschickt.", Info_Mod_Andre_Knast_C_B);
	Info_AddChoice	(Info_Mod_Andre_Knast, "Bodo trägt die Waffe eines Dämonenritters.", Info_Mod_Andre_Knast_C_A);
};

FUNC VOID Info_Mod_Andre_Knast_AB_C ()
{
	AI_Output(hero, self, "Info_Mod_Andre_Knast_AB_C_15_00"); //Ich bin allerdings kein Verbrecher, Im Gegensatz zu Bodo.
	AI_Output(self, hero, "Info_Mod_Andre_Knast_AB_C_08_01"); //Kannst du das beweisen?
	
	Info_ClearChoices	(Info_Mod_Andre_Knast);

	Info_AddChoice	(Info_Mod_Andre_Knast, "Ich wurde von Alissandro, einem Bekannten von Lord Hagen, geschickt.", Info_Mod_Andre_Knast_C_B);
	Info_AddChoice	(Info_Mod_Andre_Knast, "Bodo trägt die Waffe eines Dämonenritters.", Info_Mod_Andre_Knast_C_A);
};

INSTANCE Info_Mod_Andre_Knast2 (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Knast2_Condition;
	information	= Info_Mod_Andre_Knast2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Andre_Knast2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_Knast))
	&& (Npc_GetDistToWP(self, "NW_CITY_HABOUR_KASERN_PRISON_02") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Knast2_Info()
{
	AI_Output(self, hero, "Info_Mod_Andre_Knast2_08_00"); //Wir haben deine Aussagen überprüft und sie scheinen korrekt zu sein. Ich entschuldige mich für die Umstände die wir dir bereitet haben.
	AI_Output(self, hero, "Info_Mod_Andre_Knast2_08_01"); //Lord Hagen wird dich empfangen, weiterhin weise ich dich daraufhin dass der Bürger Bodo die Stadt verlassen hat.

	if (Wld_IsMobAvailable(self,"LEVER"))
	{
		AI_UseMob (self, "LEVER", 1);
	};

	B_LogEntry	(TOPIC_MOD_AL_FLUCHT, "Ich habe ihm alles erzählt und wurde wieder freigelassen. Lord Hagen empfängt mich nun.");

	B_StartOtherRoutine	(Mod_516_SNOV_Bodo_NW, "TOT");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Andre_Steinmonster (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Steinmonster_Condition;
	information	= Info_Mod_Andre_Steinmonster_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier sind die fünfzig Erzbrocken als Beweis.";
};

FUNC INT Info_Mod_Andre_Steinmonster_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Granmar_VM_SpecialErzguardian))
	&& (Npc_HasItems(hero, ItMi_ErzPaketAndre) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Steinmonster_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_Steinmonster_15_00"); //Hier sind die fünfzig Erzbrocken als Beweis. Wie sieht es jetzt aus mit der Verstärkung?

	B_GiveInvItems	(hero, self, ItMi_ErzPaketAndre, 1);

	AI_Output(self, hero, "Info_Mod_Andre_Steinmonster_08_01"); //Ah, sehr schön. Nun gut, ich glaube, es lohnt sich in die Mine zu investieren.
	AI_Output(self, hero, "Info_Mod_Andre_Steinmonster_08_02"); //Vor kurzem ist der Paladin Trent von den Südlichen Inseln bei uns angekommen. Ich denke, er ist genau der richtige für den Job.
	AI_Output(self, hero, "Info_Mod_Andre_Steinmonster_08_03"); //Leider hat er sich bisher noch nicht bei mir gemeldet. Du solltest als erstes im Hafenviertel nach ihm suchen.
	AI_Output(self, hero, "Info_Mod_Andre_Steinmonster_08_04"); //Bring ihn danach erst einmal zu mir, ich werde dann alles weitere mit ihm klären.
	AI_Output(hero, self, "Info_Mod_Andre_Steinmonster_15_05"); //Na schön, dann werd ich mal nach ihm suchen.

	B_LogEntry	(TOPIC_MOD_KG_STEINMONSTER, "Der Paladin Trent soll mir in der Mine helfen, jedoch ist er noch nicht bei Lord Andre aufgetaucht. Ich sollte mich im Hafenviertel bei den anderen Paladinen umsehen.");
};

INSTANCE Info_Mod_Andre_Steinmonster2 (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Steinmonster2_Condition;
	information	= Info_Mod_Andre_Steinmonster2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Andre_Steinmonster2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Trent_Shadowbeast))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Steinmonster2_Info()
{
	AI_Output(self, hero, "Info_Mod_Andre_Steinmonster2_08_00"); //Und, hast du ihn gefunden?
	AI_Output(hero, self, "Info_Mod_Andre_Steinmonster2_15_01"); //Gefunden habe ich ihn, allerdings ist er schon ins Minental aufgebrochen.
	AI_Output(self, hero, "Info_Mod_Andre_Steinmonster2_08_02"); //Wie? Ich verstehe nicht richtig, er sollte sich doch zuerst bei mir melden.
	AI_Output(hero, self, "Info_Mod_Andre_Steinmonster2_15_03"); //Anscheinend wollte er lieber handeln als reden.
	AI_Output(self, hero, "Info_Mod_Andre_Steinmonster2_08_04"); //Was fällt ihm ein, den Befehl eines Vorgesetzten zu missachten? Er soll sich unverzüglich bei mir melden, ansonsten bin ich gezwungen in zu degradieren.
	AI_Output(self, hero, "Info_Mod_Andre_Steinmonster2_08_05"); //Ich weiß, dass er viele Auszeichnungen in Myrtana bekommen hat, aber so kann er sich mir gegenüber nicht verhalten.
	AI_Output(hero, self, "Info_Mod_Andre_Steinmonster2_15_06"); //Glaubst du nicht, dass du ein wenig überreagierst?
	AI_Output(self, hero, "Info_Mod_Andre_Steinmonster2_08_07"); //Keineswegs. Er hat sich nach meinen Regeln zu richten. Und nun geh und überbring ihm das.
};

INSTANCE Info_Mod_Andre_Trent (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Trent_Condition;
	information	= Info_Mod_Andre_Trent_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Andre_Trent_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Trent))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Trent_Info()
{
	AI_Output(self, hero, "Info_Mod_Andre_Trent_08_00"); //Was hast du dir eigentlich dabei gedacht, aus einem meiner Paladine ein psychisches Wrack zu machen?
	AI_Output(hero, self, "Info_Mod_Andre_Trent_15_01"); //Er wurde durch schwarzes Erz verflucht, wie hätte man das denn wissen können?
	AI_Output(self, hero, "Info_Mod_Andre_Trent_08_02"); //Indem man bei mir eine Vorbesprechung macht!
	AI_Output(self, hero, "Info_Mod_Andre_Trent_08_03"); //Aber gut, ihr habt ja die Mine zum Laufen gebracht, und du bist bei dieser Mission nicht mir, sondern Hymir zugeteilt gewesen.
	AI_Output(self, hero, "Info_Mod_Andre_Trent_08_04"); //Der Paladin Trent allerdings muss mit den Konsequenzen leben.
	AI_Output(hero, self, "Info_Mod_Andre_Trent_15_05"); //Was sollen das für Konsequenzen sein?
	AI_Output(self, hero, "Info_Mod_Andre_Trent_08_06"); //Nun ja, ich habe volle Befehlsgewalt über ihn, und deswegen führt er jetzt einen Spionagetrupp im Minental an, um herauszufinden, was der nächste Schritt der Orks ist.
	AI_Output(hero, self, "Info_Mod_Andre_Trent_15_07"); //Und wo genau sollen sie spionieren?
	AI_Output(self, hero, "Info_Mod_Andre_Trent_08_08"); //In der Nähe des alten Kastells, am großen See, wo der alte Turm des Dämonenbeschwörers ist. Dort scheinen die Orks eine Art Ritualstätte gebaut zu haben.
	AI_Output(self, hero, "Info_Mod_Andre_Trent_08_09"); //Wenn du willst kannst du sie unterstützen. Damit kannst du auch mein Vertrauen wiedergewinnen.
	AI_Output(hero, self, "Info_Mod_Andre_Trent_15_10"); //Wenn es sein muss.

	AI_TurnAway	(hero, self);

	AI_Output(hero, self, "Info_Mod_Andre_Trent_15_11"); //(zu sich selbst) Sich bei mir beschweren, aber ein psychisches Wrack mitten ins Orkgebiet schicken ...

	B_LogEntry	(TOPIC_MOD_KG_RITUAL, "Ich sollte Trent bei seiner Spionagemission im Minental unterstützen. Er müsste irgendwo in der Nähe des alten Kastells bei Xardas' altem Turm sein.");
};

INSTANCE Info_Mod_Andre_Trent2 (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Trent2_Condition;
	information	= Info_Mod_Andre_Trent2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Andre_Trent2_Condition()
{
	if (Mod_KG_OrkTot == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Trent2_Info()
{
	AI_Output(self, hero, "Info_Mod_Andre_Trent2_08_00"); //Ist jetzt schon ein paar Tage her, was gibt es denn Neues von den Orks.
	AI_Output(hero, self, "Info_Mod_Andre_Trent2_15_01"); //Die Orks in der Höhle sind tot. Sie wurden von einem Schamanen angeführt, der einige fiese Sachen drauf hatte.
	AI_Output(self, hero, "Info_Mod_Andre_Trent2_08_02"); //Das klingt doch gut, wenn der Job erledigt ist. Wo sind dann die anderen?
	AI_Output(hero, self, "Info_Mod_Andre_Trent2_15_03"); //Sie sind alle tot! Drei von ihnen waren schon tot, als ich ankam, der Rest wurde durch die Magie des Schamanen getötet.
	AI_Output(self, hero, "Info_Mod_Andre_Trent2_08_04"); //Und was ist mit dem Paladin?
	AI_Output(hero, self, "Info_Mod_Andre_Trent2_15_05"); //Er war während des ganzen Kampfes nicht bei der Sache und hat im richtigen Moment nicht aufgepasst. Er hätte sich vielleicht erst mal erholen sollen.
	AI_Output(self, hero, "Info_Mod_Andre_Trent2_08_06"); //Nun, trotz alledem ist es einen gute Nachricht, die Orks tot zu wissen.
	AI_Output(self, hero, "Info_Mod_Andre_Trent2_08_07"); //Hier, 500 Goldmünzen sollten dich der Verluste entschädigen.

	B_GiveInvItems	(self, hero, ItMi_Gold, 500);

	AI_Output(self, hero, "Info_Mod_Andre_Trent2_08_08"); //Wir werden bald mit unseren Leute die verlassene Mine übernehmen, aber natürlich erhältst du weiterhin deinen Anteil.

	B_GivePlayerXP	(500);
};

INSTANCE Info_Mod_Andre_Mario (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Mario_Condition;
	information	= Info_Mod_Andre_Mario_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Andre_Mario_Condition()
{
	if (Mod_Mario == 11)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Mario_Info()
{
	AI_Output(self, hero, "Info_Mod_Andre_Mario_08_00"); //Wir müssen uns mal ernsthaft über deine Rolle bei Marios Verschwinden unterhalten.
	AI_Output(hero, self, "Info_Mod_Andre_Mario_15_01"); //Was soll ich denn darüber wissen?
	AI_Output(self, hero, "Info_Mod_Andre_Mario_08_02"); //Du warst einer seiner engsten Vertrauten. Hat er dir irgendwas erzählt, bevor er geflohen ist?
	AI_Output(hero, self, "Info_Mod_Andre_Mario_15_03"); //Nein, ich kann mich nicht erinnern.
	AI_Output(self, hero, "Info_Mod_Andre_Mario_08_04"); //Er hat einen Triebtäter aus dem Gefängnis befreit und konnte dann unbemerkt entwischen.
	AI_Output(self, hero, "Info_Mod_Andre_Mario_08_05"); //Keine Wache der Miliz in der ganzen Stadt kann sich erinnern, ihn gesehen zu haben.
	AI_Output(hero, self, "Info_Mod_Andre_Mario_15_06"); //Dann hat er vielleicht einen geheimen Weg genommen? Mit einem Boot hinaus aufs Meer?
	AI_Output(self, hero, "Info_Mod_Andre_Mario_08_07"); //Ich weiß es nicht. Aber ich werde diesen Weg nun verstärkt kontrollieren.
	AI_Output(hero, self, "Info_Mod_Andre_Mario_15_08"); //War's das dann?
	AI_Output(self, hero, "Info_Mod_Andre_Mario_08_09"); //Ja, hau schon ab.
};

INSTANCE Info_Mod_Andre_TomKraut (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_TomKraut_Condition;
	information	= Info_Mod_Andre_TomKraut_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich wollte Tom freikaufen.";
};

FUNC INT Info_Mod_Andre_TomKraut_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Tom_Krautquest))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_TomKraut_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_TomKraut_15_00"); //Ich wollte Tom freikaufen.
	AI_Output(self, hero, "Info_Mod_Andre_TomKraut_08_01"); //Diesen Verbrecher freikaufen? So leicht ist das in diesem Fall nicht zu regeln.
	AI_Output(self, hero, "Info_Mod_Andre_TomKraut_08_02"); //Es gab schon zuvor einige Indizien, dass er in das Sumpfkrautgeschäft innerhalb unserer Stadtmauern verstrickt ist ... aber eben nicht genug, um ihn dingfest zu machen.
	AI_Output(self, hero, "Info_Mod_Andre_TomKraut_08_03"); //Die Sumpfkrautpflanzen, die er hier einschmuggeln wollte, sind nun endlich der handfeste Beweis seiner Verwicklungen ins kriminelle Milieu.
	AI_Output(self, hero, "Info_Mod_Andre_TomKraut_08_04"); //Er wird hier seine Strafe absitzen, bis er schwarz wird. Und nun behellige mich nicht weiter damit.

	B_LogEntry	(TOPIC_MOD_TOM_KRAUT, "Nun, dass sieht nicht gut aus. Andre ist fest entschlossen Tom im Gefängnis zu lassen. Ich sollte ihm die Situation erklären ...");
};

INSTANCE Info_Mod_Andre_TomKraut2 (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_TomKraut2_Condition;
	information	= Info_Mod_Andre_TomKraut2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Andre_TomKraut2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Boltan_TomKraut))
	&& (Mob_HasItems("ASSERVATENTRUHE", ItPl_SwampHerb) == 0)
	&& (Mob_HasItems("ASSERVATENTRUHE", ItPl_Weed) == 3)
	&& (Mod_SenyanTom_Kraut == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_TomKraut2_Info()
{
	AI_Output(self, hero, "Info_Mod_Andre_TomKraut2_08_00"); //He, was machst du wieder hier?
	AI_Output(hero, self, "Info_Mod_Andre_TomKraut2_15_01"); //Ich zweifele an Toms Schuld.
	AI_Output(self, hero, "Info_Mod_Andre_TomKraut2_08_02"); //(verärgert) Ich glaube wirklich, ich muss dich vorerst dieser Räumlichkeiten verweisen.
	AI_Output(hero, self, "Info_Mod_Andre_TomKraut2_15_03"); //Tom meinte, er habe nur irgendwelches Unkraut gesammelt, dass Sumpfkraut ähnlich sehe.
	AI_Output(hero, self, "Info_Mod_Andre_TomKraut2_15_04"); //Er sei dann aber so eingeschüchtert gewesen, dass er sich nicht getraut habe es zu sagen.
	AI_Output(self, hero, "Info_Mod_Andre_TomKraut2_08_05"); //(um Fassung ringend) Das ... das ist ja wirklich die Höhe.
	AI_Output(hero, self, "Info_Mod_Andre_TomKraut2_15_06"); //Ich meine das ernst ... vielleicht könnte ja eine Kräuterkundiger ...
	AI_Output(self, hero, "Info_Mod_Andre_TomKraut2_08_07"); //(die Wut unterdrückend) In Ordnung. Ich werde jemanden holen.
	AI_Output(self, hero, "Info_Mod_Andre_TomKraut2_08_08"); //Aber ich will dir schon sagen: Das wird ein Nachspiel haben. Und jetzt raus hier!

	AI_StopProcessInfos	(self);

	AI_GotoWP	(hero, "NW_CITY_HABOUR_KASERN_MAIN_ENTRY");
};

FUNC VOID Info_Mod_Andre_TomKraut5()
{
	AI_Output(hero, self, "Info_Mod_Andre_TomKraut5_15_00"); //Dann kommt Tom jetzt frei?
	AI_Output(self, hero, "Info_Mod_Andre_TomKraut5_08_01"); //Ja, ja, bald. Nur noch einige Formalitäten ... und etwas mit den Torwachen zu klären ...

	B_LogEntry	(TOPIC_MOD_TOM_KRAUT, "Tom sollte bald wieder auf freiem Fuß sein.");

	B_GivePlayerXP	(400);

	Mod_SenyanTom_Kraut = 3;

	Mod_SenyanTom_Kraut_Tag = Wld_GetDay();
};

INSTANCE Info_Mod_Andre_TomKraut3 (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_TomKraut3_Condition;
	information	= Info_Mod_Andre_TomKraut3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Andre_TomKraut3_Condition()
{
	if (Mod_SenyanTom_Kraut == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_TomKraut3_Info()
{
	AI_Output(self, hero, "Info_Mod_Andre_TomKraut3_08_00"); //(verlegen) Ähhm ... es scheint, als habe es hier ein unglückliches Missverständnis gegeben.
	AI_Output(self, hero, "Info_Mod_Andre_TomKraut3_08_01"); //Das vermeintliche Sumpfkraut ... es war tatsächlich nur gewöhnliches Unkraut.

	Info_Mod_Andre_TomKraut5();

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Andre_TomKraut4 (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_TomKraut4_Condition;
	information	= Info_Mod_Andre_TomKraut4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Andre_TomKraut4_Condition()
{
	if (Mod_SenyanTom_Kraut_Wache_01 == 1)
	&& (Mod_SenyanTom_Kraut_Wache_02 == 1)
	&& (Mod_SenyanTom_Kraut_Mika == 1)
	&& (Mod_SenyanTom_Kraut == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_TomKraut4_Info()
{
	AI_Output(self, hero, "Info_Mod_Andre_TomKraut4_08_00"); //(zu sich selbst) Hmm, merkwürdig, das mit den Torwachen ... ich sollte man schauen, ob da auch wirklich Kraut in der Truhe ist.

	AI_UseMob	(self, "CHESTBIG", 1);
	AI_UseMob	(self, "CHESTBIG", -1);

	AI_GotoNpc	(self, hero);

	AI_TurnToNpc	(self, hero);

	AI_Output(self, hero, "Info_Mod_Andre_TomKraut4_08_01"); //(zu sich selbst) So was aber auch ... kein Kraut.
	AI_Output(hero, self, "Info_Mod_Andre_TomKraut4_15_02"); //Dann ist Tom also unschuldig?
	AI_Output(self, hero, "Info_Mod_Andre_TomKraut4_08_03"); //(überrascht) Ähhm ... ja ... es scheint ganz so, als hätte es da wohl einige Missverständnisse gegeben.

	Info_Mod_Andre_TomKraut5();

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Andre_HaradLehrling (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_HaradLehrling_Condition;
	information	= Info_Mod_Andre_HaradLehrling_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe ein Anliegen wegen Harad vorzutragen.";
};

FUNC INT Info_Mod_Andre_HaradLehrling_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Harad_LehrlingQuest8))
	&& (Mod_HaradLehrling_Kap4 == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_HaradLehrling_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_HaradLehrling_15_00"); //Ich habe ein Anliegen wegen Harad vorzutragen.
	AI_Output(self, hero, "Info_Mod_Andre_HaradLehrling_08_01"); //Dann sprich!
	AI_Output(hero, self, "Info_Mod_Andre_HaradLehrling_15_02"); //Harad soll freikommen. Er hat kein Verbrechen begangen.
	AI_Output(self, hero, "Info_Mod_Andre_HaradLehrling_08_03"); //Wenn dem nur so wäre!
	AI_Output(self, hero, "Info_Mod_Andre_HaradLehrling_08_04"); //Wir können es uns nicht leisten, dass unser einziger Schmied in der Stadt unsere Konkurrenten beliefert. Das ist nicht schön, aber nicht zu ändern.
	AI_Output(self, hero, "Info_Mod_Andre_HaradLehrling_08_05"); //Und da er sich nicht einsichtig zeigt, müssen wir ihn wenigstens davon abhalten, uns weiter zu schaden.
};

INSTANCE Info_Mod_Andre_HaradLehrling2 (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_HaradLehrling2_Condition;
	information	= Info_Mod_Andre_HaradLehrling2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wenn er wieder für die Paladine schmieden würde... dann würdet ihr ihn freilassen?";
};

FUNC INT Info_Mod_Andre_HaradLehrling2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_HaradLehrling))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_HaradLehrling2_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_HaradLehrling2_15_00"); //Wenn er wieder für die Paladine schmieden würde... dann würdet ihr ihn freilassen?
	AI_Output(self, hero, "Info_Mod_Andre_HaradLehrling2_08_01"); //Wenn er es versprechen würde, müsste man darüber nachdenken.
	AI_Output(self, hero, "Info_Mod_Andre_HaradLehrling2_08_02"); //Immerhin brauchen wir dringend neuen Waffennachschub.
	AI_Output(hero, self, "Info_Mod_Andre_HaradLehrling2_15_03"); //Ich werde mal sehen, was sich machen lässt.
	AI_Output(self, hero, "Info_Mod_Andre_HaradLehrling2_08_04"); //Viel Glück.

	B_LogEntry	(TOPIC_MOD_LEHRLING_HARAD_FOUR, "Ich muss Harad davon überzeugen, für die Paladine zu arbeiten. Nur dann lassen sie ihn frei.");
};

INSTANCE Info_Mod_Andre_HaradLehrling3 (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_HaradLehrling3_Condition;
	information	= Info_Mod_Andre_HaradLehrling3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe mich von Harad losgesagt und bin jetzt selbstständig.";
};

FUNC INT Info_Mod_Andre_HaradLehrling3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Harad_LehrlingQuest9))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_HaradLehrling3_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_HaradLehrling3_15_00"); //Ich habe mich von Harad losgesagt und bin jetzt selbstständig.
	AI_Output(hero, self, "Info_Mod_Andre_HaradLehrling3_15_01"); //Kann ich der Miliz und den Paladinen behilflich sein?
	AI_Output(self, hero, "Info_Mod_Andre_HaradLehrling3_08_02"); //Das ist eine gute Nachricht. Ja, tatsächlich, wir haben momentan enormen Bedarf.
	AI_Output(self, hero, "Info_Mod_Andre_HaradLehrling3_08_03"); //Die Schwerter der Milizionäre und Paladine könnten fast sämtlich gegen neuere getauscht werden.
	AI_Output(self, hero, "Info_Mod_Andre_HaradLehrling3_08_04"); //Ich beauftrage dich hiermit mit der Anfertigung von sieben Edlen Schwertern, fünf Edlen Langschwertern und drei Rubinklingen.
	AI_Output(self, hero, "Info_Mod_Andre_HaradLehrling3_08_05"); //Die Waffen kannst du mir bringen, sobald sie fertig sind.

	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_HARAD_FOUR, LOG_SUCCESS);
};

INSTANCE Info_Mod_Andre_HaradLehrling4 (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_HaradLehrling4_Condition;
	information	= Info_Mod_Andre_HaradLehrling4_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier, die Waffenlieferung.";
};

FUNC INT Info_Mod_Andre_HaradLehrling4_Condition()
{
	var int ES;
	ES = Npc_HasItems(hero, ItMw_Schwert1)+Npc_HasItems(hero, ItMw_Schwert1_Bonus)+Npc_HasItems(hero, ItMw_Schwert1_Stark)+Npc_HasItems(hero, ItMw_Schwert1_StarkBonus);

	if (ES < 7)
	{
		return 0;
	};

	var int EL;
	EL = Npc_HasItems(hero, ItMw_Schwert4)+Npc_HasItems(hero, ItMw_Schwert4_Bonus)+Npc_HasItems(hero, ItMw_Schwert4_Stark)+Npc_HasItems(hero, ItMw_Schwert4_StarkBonus);

	if (ES < 5)
	{
		return 0;
	};

	var int RK;
	RK = Npc_HasItems(hero, ItMw_Rubinklinge)+Npc_HasItems(hero, ItMw_Rubinklinge_Bonus)+Npc_HasItems(hero, ItMw_Rubinklinge_Stark)+Npc_HasItems(hero, ItMw_Rubinklinge_StarkBonus);

	if (ES < 3)
	{
		return 0;
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Andre_HaradLehrling3))
	{
		if (Npc_HasItems(hero, ItMw_Schwert1) < 7)
		{
			if (Npc_HasItems(hero, ItMw_Schwert1_Bonus) > 0)
			{
				CreateInvItems (hero, ItMw_Schwert1, Npc_HasItems(hero, ItMw_Schwert1_Bonus));
				Npc_RemoveInvItems (hero, ItMw_Schwert1_Bonus, Npc_HasItems(hero, ItMw_Schwert1_Bonus));
			};
		};
		if (Npc_HasItems(hero, ItMw_Schwert1) < 7)
		{
			if (Npc_HasItems(hero, ItMw_Schwert1_Stark) > 0)
			{
				CreateInvItems (hero, ItMw_Schwert1, Npc_HasItems(hero, ItMw_Schwert1_Stark));
				Npc_RemoveInvItems (hero, ItMw_Schwert1_Stark, Npc_HasItems(hero, ItMw_Schwert1_Stark));
			};
		};
		if (Npc_HasItems(hero, ItMw_Schwert1) < 7)
		{
			if (Npc_HasItems(hero, ItMw_Schwert1_StarkBonus) > 0)
			{
				CreateInvItems (hero, ItMw_Schwert1, Npc_HasItems(hero, ItMw_Schwert1_StarkBonus));
				Npc_RemoveInvItems (hero, ItMw_Schwert1_StarkBonus, Npc_HasItems(hero, ItMw_Schwert1_StarkBonus));
			};
		};

		if (Npc_HasItems(hero, ItMw_Schwert4) < 5)
		{
			if (Npc_HasItems(hero, ItMw_Schwert4_Bonus) > 0)
			{
				CreateInvItems (hero, ItMw_Schwert4, Npc_HasItems(hero, ItMw_Schwert4_Bonus));
				Npc_RemoveInvItems (hero, ItMw_Schwert4_Bonus, Npc_HasItems(hero, ItMw_Schwert4_Bonus));
			};
		};
		if (Npc_HasItems(hero, ItMw_Schwert4) < 5)
		{
			if (Npc_HasItems(hero, ItMw_Schwert4_Stark) > 0)
			{
				CreateInvItems (hero, ItMw_Schwert4, Npc_HasItems(hero, ItMw_Schwert4_Stark));
				Npc_RemoveInvItems (hero, ItMw_Schwert4_Stark, Npc_HasItems(hero, ItMw_Schwert4_Stark));
			};
		};
		if (Npc_HasItems(hero, ItMw_Schwert4) < 5)
		{
			if (Npc_HasItems(hero, ItMw_Schwert4_StarkBonus) > 0)
			{
				CreateInvItems (hero, ItMw_Schwert4, Npc_HasItems(hero, ItMw_Schwert4_StarkBonus));
				Npc_RemoveInvItems (hero, ItMw_Schwert4_StarkBonus, Npc_HasItems(hero, ItMw_Schwert4_StarkBonus));
			};
		};

		if (Npc_HasItems(hero, ItMw_Rubinklinge) < 3)
		{
			if (Npc_HasItems(hero, ItMw_Rubinklinge_Bonus) > 0)
			{
				CreateInvItems (hero, ItMw_Rubinklinge, Npc_HasItems(hero, ItMw_Rubinklinge_Bonus));
				Npc_RemoveInvItems (hero, ItMw_Rubinklinge_Bonus, Npc_HasItems(hero, ItMw_Rubinklinge_Bonus));
			};
		};
		if (Npc_HasItems(hero, ItMw_Rubinklinge) < 3)
		{
			if (Npc_HasItems(hero, ItMw_Rubinklinge_Stark) > 0)
			{
				CreateInvItems (hero, ItMw_Rubinklinge, Npc_HasItems(hero, ItMw_Rubinklinge_Stark));
				Npc_RemoveInvItems (hero, ItMw_Rubinklinge_Stark, Npc_HasItems(hero, ItMw_Rubinklinge_Stark));
			};
		};
		if (Npc_HasItems(hero, ItMw_Rubinklinge) < 3)
		{
			if (Npc_HasItems(hero, ItMw_Rubinklinge_StarkBonus) > 0)
			{
				CreateInvItems (hero, ItMw_Rubinklinge, Npc_HasItems(hero, ItMw_Rubinklinge_StarkBonus));
				Npc_RemoveInvItems (hero, ItMw_Rubinklinge_StarkBonus, Npc_HasItems(hero, ItMw_Rubinklinge_StarkBonus));
			};
		};

		return 1;
	};
};

FUNC VOID Info_Mod_Andre_HaradLehrling4_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_HaradLehrling4_15_00"); //Hier, die Waffenlieferung.

	B_ShowGivenThings	("7 Edle Schwerter, 5 Edle Langschwerter und 3 Rubinklingen gegeben");

	Npc_RemoveInvItems	(hero, ItMw_Schwert1, 7);
	Npc_RemoveInvItems	(hero, ItMw_Schwert4, 5);
	Npc_RemoveInvItems	(hero, ItMw_Rubinklinge, 3);

	AI_Output(self, hero, "Info_Mod_Andre_HaradLehrling4_08_01"); //Saubere Arbeit. Deine Fertigkeiten sind beeindruckend.
	AI_Output(hero, self, "Info_Mod_Andre_HaradLehrling4_15_02"); //Gibt es noch mehr zu tun?
	AI_Output(self, hero, "Info_Mod_Andre_HaradLehrling4_08_03"); //Gerade nicht. Sollte sich etwas ergeben, werde ich dir aber wieder Bescheid geben.
	AI_Output(self, hero, "Info_Mod_Andre_HaradLehrling4_08_04"); //Danke noch mal für deine Zusammenarbeit.

	B_LogEntry	(TOPIC_MOD_LEHRLING_HARAD_FOUR, "Lord Andre gab mir den Auftrag, sieben Edle Schwerter, fünf Edle Langschwerter und drei Rubinklingen zu schmieden. An die Arbeit!");

	B_GivePlayerXP	(1000);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Andre_Kompass (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Kompass_Condition;
	information	= Info_Mod_Andre_Kompass_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe diesen goldenen Kompass gefunden.";
};

FUNC INT Info_Mod_Andre_Kompass_Condition()
{
	if (Npc_HasItems(hero, ItMi_GoldKompass) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Kompass_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_Kompass_15_00"); //Ich habe diesen goldenen Kompass gefunden.

	B_GiveInvItems	(hero, self, ItMi_GoldKompass, 1);

	AI_Output(self, hero, "Info_Mod_Andre_Kompass_08_01"); //Zeig mal ... Das ist er, der Kompass der Esmeralda. Vortrefflich! Hmm, und der Dieb?
	AI_Output(hero, self, "Info_Mod_Andre_Kompass_15_02"); //Er hat mit seinem Leben dafür bezahlt.
	AI_Output(self, hero, "Info_Mod_Andre_Kompass_08_03"); //Damit wurde diese Tat gesühnt. Du hast dir das Kopfgeld, sowie die Belohnung für die Wiederbeschaffung des Kompasses verdient.
	AI_Output(self, hero, "Info_Mod_Andre_Kompass_08_04"); //Darüber hinaus möchte ich dir im Namen der Paladine danken. Du bist ein Vorbild für jeden Bürger dieser Stadt.

	B_GiveInvItems	(self, hero, ItMi_Gold, 600);

	B_GivePlayerXP	(800);

	CurrentNQ += 1;

	B_SetTopicStatus	(TOPIC_MOD_HEROLD_KOMPASS, LOG_SUCCESS);
};

var int Andre_LastPetzCounter;
var int Andre_LastPetzCrime;

INSTANCE Info_Mod_Andre_PMSchulden (C_INFO)
{
	npc         	= Mod_540_PAL_Andre_NW;
	nr          	= 1;
	condition   	= Info_Mod_Andre_PMSchulden_Condition;
	information 	= Info_Mod_Andre_PMSchulden_Info;
	permanent   	= 1;
	important 	= 1; 
};

FUNC INT Info_Mod_Andre_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Andre_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Andre_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Andre_PMSchulden_Info()
{
	AI_Output (self, hero, "Info_Mod_Andre_PMSchulden_08_00"); //Bist du gekommen, um deine Strafe zu zahlen?

	if (B_GetTotalPetzCounter(self) > Andre_LastPetzCounter)
	{
		AI_Output (self, hero, "Info_Mod_Andre_PMSchulden_08_01"); //Ich hatte mich schon gefragt, ob du es überhaupt noch wagst, hierher zu kommen!
		AI_Output (self, hero, "Info_Mod_Andre_PMSchulden_08_02"); //Anscheinend ist es nicht bei den letzten Anschuldigungen geblieben!

		if (Andre_Schulden < 1000)
		{
			AI_Output (self, hero, "Info_Mod_Andre_PMSchulden_08_03"); //Ich hatte dich gewarnt! Die Strafe, die du jetzt zahlen musst, ist höher!
			AI_Output (hero, self, "Info_Mod_Andre_PMAdd_15_00"); //Wieviel?
			
			var int diff; diff = (B_GetTotalPetzCounter(self) - Andre_LastPetzCounter);
		
			if (diff > 0)
			{
				Andre_Schulden = Andre_Schulden + (diff * 50);
			};
		
			if (Andre_Schulden > 1000)	{	Andre_Schulden = 1000;	};
		
			B_Say_Gold (self, hero, Andre_Schulden);
		}
		else
		{
			AI_Output (self, hero, "Info_Mod_Andre_PMSchulden_08_04"); //Du hast mich schwer enttäuscht!
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Andre_LastPetzCrime)
	{
		AI_Output (self, hero, "Info_Mod_Andre_PMSchulden_08_05"); //Es haben sich einige neue Dinge ergeben.
		
		if (Andre_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, hero, "Info_Mod_Andre_PMSchulden_08_06"); //Plötzlich gibt es niemanden mehr, der dich des Mordes bezichtigt.
		};
		
		if (Andre_LastPetzCrime == CRIME_THEFT)
		|| ( (Andre_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, hero, "Info_Mod_Andre_PMSchulden_08_07"); //Niemand erinnert sich mehr, dich bei einem Diebstahl gesehen zu haben.
		};
		
		if (Andre_LastPetzCrime == CRIME_ATTACK)
		|| ( (Andre_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, hero, "Info_Mod_Andre_PMSchulden_08_08"); //Es gibt keine Zeugen mehr dafür, dass du jemals in eine Schlägerei verwickelt warst.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, hero, "Info_Mod_Andre_PMSchulden_08_09"); //Anscheinend haben sich alle Anklagen gegen dich in Wohlgefallen aufgelöst.
		};
		
		AI_Output (self, hero, "Info_Mod_Andre_PMSchulden_08_10"); //Ich weiß nicht, was da gelaufen ist, aber ich warne dich: Spiel keine Spielchen mit mir.
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, hero, "Info_Mod_Andre_PMSchulden_08_11"); //Ich habe mich jedenfalls entschieden, dir deine Schulden zu erlassen.
			AI_Output (self, hero, "Info_Mod_Andre_PMSchulden_08_12"); //Sieh zu, dass du nicht wieder in Schwierigkeiten kommst.
	
			Andre_Schulden			= 0;
			Andre_LastPetzCounter 	= 0;
			Andre_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, hero, "Info_Mod_Andre_PMSchulden_08_13"); //Damit eins klar ist: Deine Strafe musst du trotzdem in voller Höhe zahlen.
			B_Say_Gold (self, hero, Andre_Schulden);
			AI_Output (self, hero, "Info_Mod_Andre_PMSchulden_08_14"); //Also, was ist?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(Info_Mod_Andre_PMSchulden);
		Info_ClearChoices  	(Info_Mod_Andre_PETZMASTER);
		Info_AddChoice		(Info_Mod_Andre_PMSchulden,"Ich habe nicht genug Gold!",Info_Mod_Andre_PETZMASTER_PayLater);
		Info_AddChoice		(Info_Mod_Andre_PMSchulden,"Wieviel war es nochmal?",Info_Mod_Andre_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(hero, itmi_gold) >= Andre_Schulden)
		{
			Info_AddChoice 	(Info_Mod_Andre_PMSchulden,"Ich will die Strafe zahlen.",Info_Mod_Andre_PETZMASTER_PayNow);
		};
	};
};

func void Info_Mod_Andre_PMSchulden_HowMuchAgain()
{
	AI_Output (hero, self, "Info_Mod_Andre_PMSchulden_HowMuchAgain_15_00"); //Wie viel war es noch mal?
	B_Say_Gold (self, hero, Andre_Schulden);

	Info_ClearChoices  	(Info_Mod_Andre_PMSchulden);
	Info_ClearChoices  	(Info_Mod_Andre_PETZMASTER);
	Info_AddChoice		(Info_Mod_Andre_PMSchulden,"Ich habe nicht genug Gold!",Info_Mod_Andre_PETZMASTER_PayLater);
	Info_AddChoice		(Info_Mod_Andre_PMSchulden,"Wieviel war es nochmal?",Info_Mod_Andre_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(hero, itmi_gold) >= Andre_Schulden)
	{
		Info_AddChoice 	(Info_Mod_Andre_PMSchulden,"Ich will die Strafe zahlen.",Info_Mod_Andre_PETZMASTER_PayNow);
	};
};

INSTANCE Info_Mod_Andre_PETZMASTER   (C_INFO)
{
	npc         	= Mod_540_PAL_Andre_NW;
	nr          	= 1;
	condition   	= Info_Mod_Andre_PETZMASTER_Condition;
	information 	= Info_Mod_Andre_PETZMASTER_Info;
	permanent   	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Andre_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Andre_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Andre_PETZMASTER_Info()
{
	Andre_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...
	
	// ------ SC hat mit Andre noch nicht gesprochen ------
	if (B_GetAivar(self, AIV_TalkedToPlayer) == FALSE)
	{
		AI_Output (self, hero, "Info_Mod_Andre_PETZMASTER_08_00"); //Du musst der Neue sein, der hier in der Stadt Ärger gemacht hat.
	};	
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, hero, "Info_Mod_Andre_PETZMASTER_08_01"); //Gut, dass du zu mir kommst, bevor alles noch schlimmer für dich wird.
		AI_Output (self, hero, "Info_Mod_Andre_PETZMASTER_08_02"); //Mord ist ein schweres Vergehen!

		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50

		Andre_Schulden = Andre_Schulden + 500;						//PLUS Mörder-Malus

		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Andre_PETZMASTER_08_03"); //Ganz zu schweigen von den anderen Sachen, die du angerichtet hast.
		};

		AI_Output (self, hero, "Info_Mod_Andre_PETZMASTER_08_04"); //Die Wachen haben Befehl, jeden Mörder auf der Stelle zu richten.
		AI_Output (self, hero, "Info_Mod_Andre_PETZMASTER_08_05"); //Und auch die meisten Bürger werden einen Mörder in der Stadt nicht dulden!
		AI_Output (self, hero, "Info_Mod_Andre_PETZMASTER_08_06"); //Ich habe kein Interesse daran, dich an den Galgen zu bringen. Wir sind im Krieg und wir brauchen jeden Mann.
		AI_Output (self, hero, "Info_Mod_Andre_PETZMASTER_08_07"); //Aber es wird nicht leicht sein, die Leute wieder gnädig zu stimmen.
		AI_Output (self, hero, "Info_Mod_Andre_PETZMASTER_08_08"); //Du könntest deine Reue zeigen, indem du eine Strafe zahlst - natürlich muss die Strafe angemessen hoch sein.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, hero, "Info_Mod_Andre_PETZMASTER_08_09"); //Gut, dass du kommst! Du wirst des Diebstahls bezichtigt! Es gibt Zeugen!

		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Andre_PETZMASTER_08_10"); //Von den anderen Dingen, die mir zu Ohren gekommen sind, will ich gar nicht erst reden.
		};

		AI_Output (self, hero, "Info_Mod_Andre_PETZMASTER_08_11"); //Ich werde so ein Verhalten in der Stadt nicht dulden!
		AI_Output (self, hero, "Info_Mod_Andre_PETZMASTER_08_12"); //Du wirst eine Strafe zahlen müssen, um dein Verbrechen wieder gutzumachen!
		
		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, hero, "Info_Mod_Andre_PETZMASTER_08_13"); //Wenn du dich mit dem Gesindel im Hafen herumprügelst, ist das eine Sache ...
		AI_Output (self, hero, "Info_Mod_Andre_PETZMASTER_08_14"); //Aber wenn du Bürger oder Soldaten des Königs angreifst, muss ich dich zur Rechenschaft ziehen.

		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, hero, "Info_Mod_Andre_PETZMASTER_08_15"); //Und die Sache mit den Schafen musste wohl auch nicht sein.
		};

		AI_Output (self, hero, "Info_Mod_Andre_PETZMASTER_08_16"); //Wenn ich dir das durchgehen lasse, macht hier bald jeder, was er will.
		AI_Output (self, hero, "Info_Mod_Andre_PETZMASTER_08_17"); //Also wirst du eine angemessene Strafe zahlen - und die Sache ist vergessen.
		
		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, hero, "Info_Mod_Andre_PETZMASTER_08_18"); //Mir ist zu Ohren gekommen, du hättest dich an unseren Schafen vergriffen.
		AI_Output (self, hero, "Info_Mod_Andre_PETZMASTER_08_19"); //Dir ist klar, dass ich das nicht durchgehen lassen kann.
		AI_Output (self, hero, "Info_Mod_Andre_PETZMASTER_08_20"); //Du wirst eine Entschädigung zahlen müssen!
		
		Andre_Schulden = 100;
	};
	
	AI_Output (hero, self, "Info_Mod_Andre_PETZMASTER_15_21"); //Wie viel?
	
	if (Andre_Schulden > 1000)	{	Andre_Schulden = 1000;	};
		
	B_Say_Gold (self, hero, Andre_Schulden);
	
	Info_ClearChoices  	(Info_Mod_Andre_PMSchulden);
	Info_ClearChoices  	(Info_Mod_Andre_PETZMASTER);
	Info_AddChoice		(Info_Mod_Andre_PETZMASTER,"Ich habe nicht genug Gold!",Info_Mod_Andre_PETZMASTER_PayLater);
	if (Npc_HasItems(hero, itmi_gold) >= Andre_Schulden)
	{
		Info_AddChoice 	(Info_Mod_Andre_PETZMASTER,"Ich will die Strafe zahlen.",Info_Mod_Andre_PETZMASTER_PayNow);
	};
};

func void Info_Mod_Andre_PETZMASTER_PayNow()
{
	AI_Output (hero, self, "Info_Mod_Andre_PETZMASTER_PayNow_15_00"); //Ich will die Strafe zahlen!
	B_GiveInvItems (hero, self, itmi_gold, Andre_Schulden);
	AI_Output (self, hero, "Info_Mod_Andre_PETZMASTER_PayNow_08_01"); //Gut! Ich werde dafür sorgen, dass es jeder in der Stadt erfährt - damit wäre dein Ruf einigermaßen wiederhergestellt.

	B_GrantAbsolution (LOC_CITY);
	
	Andre_Schulden			= 0;
	Andre_LastPetzCounter 	= 0;
	Andre_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(Info_Mod_Andre_PETZMASTER);
	Info_ClearChoices  	(Info_Mod_Andre_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void Info_Mod_Andre_PETZMASTER_PayLater()
{
	AI_Output (hero, self, "Info_Mod_Andre_PETZMASTER_PayLater_15_00"); //Ich habe nicht genug Gold!
	AI_Output (self, hero, "Info_Mod_Andre_PETZMASTER_PayLater_08_01"); //Dann sieh zu, dass du das Gold so schnell wie möglich beschaffst.
	AI_Output (self, hero, "Info_Mod_Andre_PETZMASTER_PayLater_08_02"); //Und ich warne dich: Wenn du dir noch was zu schulden kommen lässt, wird die Sache noch schlimmer für dich!
	
	Andre_LastPetzCounter 	= B_GetTotalPetzCounter(self);
	Andre_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	AI_StopProcessInfos (self);
};

INSTANCE Info_Mod_Andre_Kopfgeld (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Kopfgeld_Condition;
	information	= Info_Mod_Andre_Kopfgeld_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will Kopfgeld für einen Verbrecher kassieren.";
};

FUNC INT Info_Mod_Andre_Kopfgeld_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Andre_Kopfgeld_Info()
{
	AI_Output(hero, self, "Info_Mod_Andre_Kopfgeld_15_00"); //Ich will Kopfgeld für einen Verbrecher kassieren.

	Info_ClearChoices	(Info_Mod_Andre_Kopfgeld);

	Info_AddChoice	(Info_Mod_Andre_Kopfgeld, "Zurück.", Info_Mod_Andre_Kopfgeld_Zurueck);
	
	if (Npc_KnowsInfo(hero, Info_Mod_Tom_Hi))
	&& (Mod_Tom_Boese	==	TRUE)
	{
		Info_AddChoice	(Info_Mod_Andre_Kopfgeld, "Tom versucht einen Freund vor einem Miliztrupp zu warnen.", Info_Mod_Andre_Kopfgeld_Tom);
	};
	if (Npc_KnowsInfo(hero, Info_Mod_Nagur_Hi))
	&& (Nagur_KillAkahasch == TRUE)
	&& (!Npc_IsDead(Mod_4016_NOV_Akahasch_NW))
	{
		Info_AddChoice	(Info_Mod_Andre_Kopfgeld, "Nagur will den Novizen Akahasch tot sehen.", Info_Mod_Andre_Kopfgeld_Nagur);
	};
	if (Npc_KnowsInfo(hero, Info_Mod_Meldor_Hilfe))
	&& (Npc_HasItems(hero, ItMi_HerbPaket) >= 1)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Meldor_PaketSicher))
	&& (Mob_HasItems("CHEST_ANDRE_WAREHOUSE_PACKET", ItMi_HerbPaket) == 0)
	{
		Info_AddChoice	(Info_Mod_Andre_Kopfgeld, "Meldor hat Sumpfkraut, welches er illegal verkauft.", Info_Mod_Andre_Kopfgeld_Meldor);
	};
	if (Npc_KnowsInfo(hero, Info_Mod_Diego_HabBeweise))
	&& (Npc_HasItems(hero, ItWr_AL_GebrandtDokumente) == 1)
	{
		Info_AddChoice	(Info_Mod_Andre_Kopfgeld, "Gerbrandt, Valentino, Cornelius und Fernando haben Dreck am Stecken.", Info_Mod_Andre_Kopfgeld_Gerbrandt);
	};
	if (Npc_KnowsInfo(hero, Info_Mod_Kardif_KnowsRukhar))
	&& (Npc_HasItems(hero, ItWr_Rukhar_Wacholder) == 1)
	&& (Mod_KnowsRukharWacholder == 5)
	{
		Info_AddChoice	(Info_Mod_Andre_Kopfgeld, "Kardif hat Rukhar beauftragt eine Lieferung Wacholder von Coragon zu stehlen.", Info_Mod_Andre_Kopfgeld_Kardif);
	};
	if (Npc_KnowsInfo(hero, Info_Mod_Den_Problem))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Andre_Rangar))
	&& (Mod_DenVerpfiffen == 0)
	&& (Mod_Den_Problem == 1)
	{
		Info_AddChoice	(Info_Mod_Andre_Kopfgeld, "Den will Rangar in Verruf bringen.", Info_Mod_Andre_Kopfgeld_Den);
	};
	if (Mod_WilfriedsQuest == 7)
	&& (Npc_HasItems(hero, ItWr_WilfriedsListe) == 1)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 500)
	{
		Info_AddChoice	(Info_Mod_Andre_Kopfgeld, "Der Bürger Wilfried war ein Betrüger.", Info_Mod_Andre_Kopfgeld_Wilfried);
	};
	if (Nagur_KillAkahasch == 6)
	{
		Info_AddChoice	(Info_Mod_Andre_Kopfgeld, "Kardif hat Nagur und seiner Bande dabei geholfen mir eine Falle zu stellen.", Info_Mod_Andre_Kopfgeld_Kardif2);
	};
};

FUNC VOID Info_Mod_Andre_Kopfgeld_Zurueck()
{
	Info_ClearChoices	(Info_Mod_Andre_Kopfgeld);
};

FUNC VOID Info_Mod_Andre_Kopfgeld_Tom()
{
	AI_Output(hero, self, "Info_Mod_Andre_Kopfgeld_Tom_15_00"); //Tom versucht einen Freund vor einem Miliztrupp zu warnen.
	AI_Output(self, hero, "Info_Mod_Andre_Kopfgeld_Tom_08_01"); //Gut, dass du mir bescheid gesagt hast. Hier hast du deine Belohnung.

	B_GiveInvITems	(self, hero, ItMi_Gold, 100);

	B_GivePlayerXP	(100);

	AI_Teleport	(Mod_967_BDT_Tom_NW, "NW_CITY_HABOUR_KASERN_HALVOR");

	B_StartOtherRoutine	(Mod_967_BDT_Tom_NW, "GEFANGEN");

	Mod_Tom_Boese = FALSE;

	B_LogEntry	(TOPIC_MOD_TOMSFREUND, "Ich hab Tom bei Lord Andre verpfiffen.");
	B_SetTopicStatus	(TOPIC_MOD_TOMSFREUND, LOG_FAILED);

	Info_ClearChoices	(Info_Mod_Andre_Kopfgeld);

	B_Göttergefallen(1, 1);

	Mod_AlvaresAndre_Taeter = 1;
};

FUNC VOID Info_Mod_Andre_Kopfgeld_Nagur()
{
	AI_Output(hero, self, "Info_Mod_Andre_Kopfgeld_Nagur_15_00"); //Nagur will den Novizen Akahasch tot sehen und hat einen Auftragsmörder geschickt.
	AI_Output(self, hero, "Info_Mod_Andre_Kopfgeld_Nagur_08_01"); //Das werden wir zu verhindern wissen. Danke für deine Hilfe.

	B_GiveInvITems	(self, hero, ItMi_Gold, 100);

	B_GivePlayerXP	(100);

	AI_Teleport	(Mod_743_NONE_Nagur_NW, "NW_CITY_HABOUR_KASERN_HALVOR");

	B_StartOtherRoutine	(Mod_743_NONE_Nagur_NW, "GEFANGEN");

	B_LogEntry	(TOPIC_MOD_ASS_AUFNAHME, "Ich hab Nagur bei Lord Andre verpfiffen.");
	B_SetTopicStatus	(TOPIC_MOD_ASS_AUFNAHME, LOG_FAILED);

	Info_ClearChoices	(Info_Mod_Andre_Kopfgeld);

	B_Göttergefallen(1, 1);

	Nagur_KillAkahasch = 2;

	Mod_AlvaresAndre_Taeter = 1;
};

FUNC VOID Info_Mod_Andre_Kopfgeld_Meldor()
{
	AI_Output(hero, self, "Info_Mod_Andre_Kopfgeld_Meldor_15_00"); //Meldor hat Sumpfkraut, welches er illegal verkauft.
	AI_Output(self, hero, "Info_Mod_Andre_Kopfgeld_Meldor_08_01"); //Hast du dafür auch Beweise?
	AI_Output(hero, self, "Info_Mod_Andre_Kopfgeld_Meldor_15_02"); //Dieses Paket Sumpfkraut sollte ich für ihn verschwinden lassen.

	B_GiveInvItems	(hero, self, ItMi_HerbPaket, 1);

	AI_Output(self, hero, "Info_Mod_Andre_Kopfgeld_Meldor_08_03"); //Das ist ausreichend. Hier hast du deine Belohnung.

	B_GiveInvITems	(self, hero, ItMi_Gold, 100);

	B_GivePlayerXP	(100);

	Mod_MeldorVerpfiffen = 1;

	AI_Teleport	(Mod_597_NONE_Meldor_NW, "NW_CITY_HABOUR_KASERN_HALVOR");

	B_StartOtherRoutine	(Mod_597_NONE_Meldor_NW, "GEFANGEN");

	B_LogEntry	(TOPIC_MOD_MELDOR_PAKET, "Ich hab Meldor bei Lord Andre verpfiffen.");
	B_SetTopicStatus	(TOPIC_MOD_MELDOR_PAKET, LOG_FAILED);

	Info_ClearChoices	(Info_Mod_Andre_Kopfgeld);

	B_Göttergefallen(1, 1);

	Mod_AlvaresAndre_Taeter = 1;
};

FUNC VOID Info_Mod_Andre_Kopfgeld_Gerbrandt()
{
	AI_Output(hero, self, "Info_Mod_Andre_Kopfgeld_Gerbrandt_15_00"); //Gerbrandt, Valentino, Cornelius und Fernando haben Dreck am Stecken. Beweise habe ich dabei.

	B_GiveInvItems	(hero, self, ItWr_AL_GebrandtDokumente, 1);
	B_UseFakeScroll ();

	AI_Output(self, hero, "Info_Mod_Andre_Kopfgeld_Gerbrandt_08_01"); //Gut, wir werden sie sofort festnehmen.
	AI_Output(self, hero, "Info_Mod_Andre_Kopfgeld_Gerbrandt_08_02"); //Hier hast du deine Belohnung.

	B_GiveInvITems	(self, hero, ItMi_Gold, 300);

	B_GivePlayerXP	(300);

	AI_Teleport	(Mod_576_NONE_Fernando_NW, "NW_CITY_HABOUR_KASERN_HALVOR");

	B_StartOtherRoutine	(Mod_576_NONE_Fernando_NW, "GEFANGEN");

	AI_Teleport	(Mod_578_NONE_Gerbrandt_NW, "NW_CITY_HABOUR_KASERN_HALVOR");

	B_StartOtherRoutine	(Mod_578_NONE_Gerbrandt_NW, "GEFANGEN");

	AI_Teleport	(Mod_754_NONE_Valentino_NW, "NW_CITY_HABOUR_KASERN_HALVOR");

	B_StartOtherRoutine	(Mod_754_NONE_Valentino_NW, "GEFANGEN");

	B_LogEntry	(TOPIC_MOD_AL_MORGAHARD, "Lord Andre hat alle Mitglieder der Bande festnehmen lassen. Nun sollte ich mich mit Diego unterhalten.");

	Info_ClearChoices	(Info_Mod_Andre_Kopfgeld);

	B_Göttergefallen(1, 2);

	Mod_AL_Gebrandt_Gefangen = TRUE;

	Mod_AlvaresAndre_Taeter = 1;
	
	B_StartOtherRoutine	(Mod_588_WNOV_Joe_NW, "DIEGO");
};

FUNC VOID Info_Mod_Andre_Kopfgeld_Kardif()
{
	AI_Output(hero, self, "Info_Mod_Andre_Kopfgeld_Kardif_15_00"); //Kardif hat Rukhar beauftragt eine Lieferung Wacholder von Coragon zu stehlen.
	AI_Output(self, hero, "Info_Mod_Andre_Kopfgeld_Kardif_08_01"); //Hast du für diese Anschuldigung auch einen Beweis?
	AI_Output(hero, self, "Info_Mod_Andre_Kopfgeld_Kardif_15_02"); //Hier, dieses Schreiben hatte Rukhar bei sich.

	B_GiveInvItems	(hero, self, ItWr_Rukhar_Wacholder, 1);

	B_UseFakeScroll	();

	AI_Output(self, hero, "Info_Mod_Andre_Kopfgeld_Kardif_08_03"); //Gut, wir werden die Verhaftung veranlassen. Hier hast du das Kopfgeld.

	B_GiveInvITems	(self, hero, ItMi_Gold, 100);

	B_GivePlayerXP	(100);

	AI_Teleport	(Mod_590_NONE_Kardif_NW, "NW_CITY_HABOUR_KASERN_HALVOR");

	B_StartOtherRoutine	(Mod_590_NONE_Kardif_NW, "GEFANGEN");

	B_LogEntry	(TOPIC_MOD_CORAGON_WACHOLDER, "Kardif sitzt jetzt im Knast. Jetzt sollte ich zu Coragon gehen und ihm davon berichten.");

	Mod_KnowsRukharWacholder = 6;

	Info_ClearChoices	(Info_Mod_Andre_Kopfgeld);

	B_Göttergefallen(1, 1);

	Mod_AlvaresAndre_Taeter = 1;
};

FUNC VOID Info_Mod_Andre_Kopfgeld_Kardif2()
{
	AI_Output(hero, self, "Info_Mod_Andre_Kopfgeld_Kardif2_15_00"); //Kardif hat Nagur und seiner Bande dabei geholfen mir eine Falle zu stellen.
	AI_Output(hero, self, "Info_Mod_Andre_Kopfgeld_Kardif2_15_01"); //Nagur hatte schon den Novizen Akahasch auf dem Gewissen und ich konnte mich nur mit Mühe meines Lebens erwehren.
	AI_Output(self, hero, "Info_Mod_Andre_Kopfgeld_Kardif2_08_02"); //Was?! Wo ist dieser Verbrecher jetzt?
	AI_Output(hero, self, "Info_Mod_Andre_Kopfgeld_Kardif2_15_03"); //Nagur hat sich mit dem Falschen angelegt. Er wird keinen Ärger mehr machen.
	AI_Output(self, hero, "Info_Mod_Andre_Kopfgeld_Kardif2_08_04"); //Da bin ich erleichtert. Ich hatte doch geahnt, dass es keine gute Idee war ihn laufen zu lassen ... aber die Gesetze der Stadt haben es nun mal verlangt, nachdem er seine Strafe verbüßt hatte.
	AI_Output(hero, self, "Info_Mod_Andre_Kopfgeld_Kardif2_15_05"); //Kardif scheint außerdem mit Schmugglern gemeinsame Sache zu machen, die ihre Sachen in den Kisten und Fässern im Hafenviertel verstecken.
	AI_Output(self, hero, "Info_Mod_Andre_Kopfgeld_Kardif2_08_06"); //So ist das also. Ich werde meine Männer sofort alle Kisten durchsuchen lassen. Und dieser delinquente Kardif wird seine gerechte Strafe bekommen.
	AI_Output(self, hero, "Info_Mod_Andre_Kopfgeld_Kardif2_08_07"); //Jedenfalls hast du dabei geholfen, dem Verbrechen in dieser Stadt einen empfindlichen Schlag zu verpassen.
	AI_Output(self, hero, "Info_Mod_Andre_Kopfgeld_Kardif2_08_08"); //Dir steht damit eine größere Belohnung aus unserer Stadtkasse zu.

	B_GiveInvItems	(self, hero, ItMi_Gold, 500);

	AI_Output(self, hero, "Info_Mod_Andre_Kopfgeld_Kardif2_08_09"); //Innos begleite dich auf deinen weiteren Wegen.

	AI_Teleport	(Mod_590_NONE_Kardif_NW, "NW_CITY_HABOUR_KASERN_HALVOR");

	B_StartOtherRoutine	(Mod_590_NONE_Kardif_NW, "GEFANGEN");

	Info_ClearChoices	(Info_Mod_Andre_Kopfgeld);

	B_Göttergefallen(1, 1);

	Mod_AlvaresAndre_Taeter = 1;

	Nagur_KillAkahasch = 7;
};

FUNC VOID Info_Mod_Andre_Kopfgeld_Den()
{
	AI_Output(hero, self, "Info_Mod_Andre_Kopfgeld_Den_15_00"); //Den will Rangar in Verruf bringen. Er scheint eifersüchtig auf ihn zu sein.
	AI_Output(self, hero, "Info_Mod_Andre_Kopfgeld_Den_08_01"); //Den von der Miliz?
	AI_Output(hero, self, "Info_Mod_Andre_Kopfgeld_Den_15_02"); //Ja.
	AI_Output(self, hero, "Info_Mod_Andre_Kopfgeld_Den_08_03"); //So ein Verhalten kann ich bei der Miliz nicht dulden. Ich werde ihn rauswerfen.
	AI_Output(self, hero, "Info_Mod_Andre_Kopfgeld_Den_08_04"); //Hier ist eine kleine Belohnung für dich.

	B_GiveInvITems	(self, hero, ItMi_Gold, 50);

	B_GivePlayerXP	(50);

	B_StartOtherRoutine	(Mod_969_MIL_Den_NW, "NOMILIZ");

	AI_UnequipArmor	(Mod_969_MIL_Den_NW);

	Mod_DenVerpfiffen = 1;

	Npc_RemoveInvItems	(Mod_969_MIL_Den_NW, ItAr_Mil_L, 1);
	CreateInvItems	(Mod_969_MIL_Den_NW, ItAr_Bau_L, 1);
	AI_EquipBestArmor	(Mod_969_MIL_Den_NW);

	B_LogEntry	(TOPIC_MOD_DENSPROBLEM, "Ich hab Den bei Lord Andre verpfiffen.");
	B_SetTopicStatus	(TOPIC_MOD_DENSPROBLEM, LOG_FAILED);

	Info_ClearChoices	(Info_Mod_Andre_Kopfgeld);

	B_Göttergefallen(1, 1);

	Mod_AlvaresAndre_Taeter = 1;

	CurrentNQ += 1;
};

FUNC VOID Info_Mod_Andre_Kopfgeld_Wilfried()
{
	AI_Output(hero, self, "Info_Mod_Andre_Kopfgeld_Wilfried_15_00"); //Der Bürger Wilfried war ein Betrüger.
	AI_Output(self, hero, "Info_Mod_Andre_Kopfgeld_Wilfried_08_01"); //War?
	AI_Output(hero, self, "Info_Mod_Andre_Kopfgeld_Wilfried_15_02"); //Ich habe ihn zur Strecke gebracht. Es war Notwehr.
	AI_Output(self, hero, "Info_Mod_Andre_Kopfgeld_Wilfried_08_03"); //Hast du Beweise?
	AI_Output(hero, self, "Info_Mod_Andre_Kopfgeld_Wilfried_15_04"); //Ja, die habe ich.

	Npc_RemoveInvItems	(hero, ItWr_WilfriedsListe, 1);
	Npc_RemoveInvItems	(hero, ItMi_Gold, 500);

	B_ShowGivenThings("Liste und 500 Gold gegeben");

	B_UseFakeScroll ();

	AI_Output(self, hero, "Info_Mod_Andre_Kopfgeld_Wilfried_08_05"); //(unmotiviert) Glückwunsch. Das hast du ganz toll gemacht.
	AI_Output(hero, self, "Info_Mod_Andre_Kopfgeld_Wilfried_15_06"); //Bekomme ich noch eine Belohnung?
	AI_Output(self, hero, "Info_Mod_Andre_Kopfgeld_Wilfried_08_07"); //Nicht von mir. Aber frag' doch die Geschädigten.

	B_GivePlayerXP	(300);

	Mod_WilfriedsQuest = 8;

	B_SetTopicStatus	(TOPIC_MOD_WILFRIED_GOLD, LOG_SUCCESS);

	Mod_AlvaresAndre_Taeter = 1;

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Andre_Pickpocket (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_Pickpocket_Condition;
	information	= Info_Mod_Andre_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_210;
};

FUNC INT Info_Mod_Andre_Pickpocket_Condition()
{
	C_Beklauen	(199, ItMi_Gold, 175);
};

FUNC VOID Info_Mod_Andre_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Andre_Pickpocket);

	Info_AddChoice	(Info_Mod_Andre_Pickpocket, DIALOG_BACK, Info_Mod_Andre_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Andre_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Andre_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Andre_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Andre_Pickpocket);
};

FUNC VOID Info_Mod_Andre_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Andre_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Andre_Pickpocket);

		Info_AddChoice	(Info_Mod_Andre_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Andre_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Andre_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Andre_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Andre_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Andre_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Andre_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Andre_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Andre_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Andre_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Andre_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Andre_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Andre_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Andre_EXIT (C_INFO)
{
	npc		= Mod_540_PAL_Andre_NW;
	nr		= 1;
	condition	= Info_Mod_Andre_EXIT_Condition;
	information	= Info_Mod_Andre_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Andre_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Andre_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};