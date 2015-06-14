INSTANCE Info_Mod_Esteban_Hi (C_INFO)
{
	npc		= Mod_948_BDT_Esteban_MT;
	nr		= 1;
	condition	= Info_Mod_Esteban_Hi_Condition;
	information	= Info_Mod_Esteban_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Esteban_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dexter_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Esteban_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Esteban_Hi_15_00"); //Wer bist du?
	AI_Output(self, hero, "Info_Mod_Esteban_Hi_07_01"); //Ich bin Esteban, zweites Oberhaupt dieses Lagers. Du hast sicher schon von mir gehört.
	AI_Output(self, hero, "Info_Mod_Esteban_Hi_07_02"); //Außerdem bin ich noch der Verwalter der Banditen auf dieser Insel. Ich sorge dafür, dass jeder einen Teil der Beute bekommt und dass jeder seine Pflichten erfüllt.
	AI_Output(self, hero, "Info_Mod_Esteban_Hi_07_03"); //Du musst der Neue sein. Ich will garnicht lange um den heißen Brei herumreden.
	AI_Output(self, hero, "Info_Mod_Esteban_Hi_07_04"); //Es gibt da eine Sache, bei welcher du unseren Jungs helfen könntest, um dich erst einmal im Lager zu bewähren.
	AI_Output(hero, self, "Info_Mod_Esteban_Hi_15_05"); //Worum geht’s?
	AI_Output(self, hero, "Info_Mod_Esteban_Hi_07_06"); //Nichts besonders schweres, eine Aufgabe, wie sie einem Banditen jeden Tag zufällt, mit welcher du dich für den Anfang schon mal gut beweisen kannst in deinem Talent als Bandit.
	AI_Output(self, hero, "Info_Mod_Esteban_Hi_07_07"); //Einer unserer Kundschafter hat spitzgekriegt, dass einige Händler, die nach dem Fall der Barriere hier her kamen, um einträgliche Geschäfte zu machen, morgen früh aus dem Alten Lager zurück nach Khorinis reisen wollen.
	AI_Output(self, hero, "Info_Mod_Esteban_Hi_07_08"); //Diese wollen wir um Gold, Erz und Handelswaren erleichtern. Wir werden ihnen also morgen um 9h im Eingang der verlassenen Mine auflauern.
	AI_Output(self, hero, "Info_Mod_Esteban_Hi_07_09"); //Einige andere Banditen werden sie bei der ehemaligen Übergabestelle erwarten, sodass jede Flucht unmöglich ist.
	AI_Output(self, hero, "Info_Mod_Esteban_Hi_07_10"); //Da sie von einer Gruppe Gardisten zu ihrem Schutz bis kurz nach der verlassenen Mine begleitet werden, müssen wir ruhig verharren und den richtigen Zeitpunkt abwarten zuzuschlagen.
	AI_Output(self, hero, "Info_Mod_Esteban_Hi_07_11"); //Jeder kriegt seinen Anteil von der Beute. Bist du dabei?

	Info_ClearChoices	(Info_Mod_Esteban_Hi);

	Info_AddChoice	(Info_Mod_Esteban_Hi, "Nein, Ich überfalle doch keine wehrlosen Händler.", Info_Mod_Esteban_Hi_B);
	Info_AddChoice	(Info_Mod_Esteban_Hi, "Selbstverständlich. Das Gold und den Spaß lasse ich mir nicht entgehen.", Info_Mod_Esteban_Hi_A);
};

FUNC VOID Info_Mod_Esteban_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Esteban_Hi_B_15_00"); //Nein, Ich überfalle doch keine wehrlosen Händler.
	AI_Output(self, hero, "Info_Mod_Esteban_Hi_B_07_01"); //Was?! Wenn du dazu nicht in der Lage bist, weiß ich wirklich nicht, was du bei uns zu suchen hast.
	
	Info_ClearChoices	(Info_Mod_Esteban_Hi);

	AI_StopProcessInfos	(self);

	Mod_EstebanBeleidigt = 1;
};

FUNC VOID Info_Mod_Esteban_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Esteban_Hi_A_15_00"); //Selbstverständlich. Das Gold und den Spaß lasse ich mir nicht entgehen.
	AI_Output(self, hero, "Info_Mod_Esteban_Hi_A_07_01"); //Sehr gut, ich habe auch nichts anderes von dir erwartet Wir sehen uns dann morgen um 9 Uhr vor der verlassenen Mine.
	
	Info_ClearChoices	(Info_Mod_Esteban_Hi);

	AI_StopProcessInfos	(self);

	Mod_Banditenueberfall_Esteban = 1;
	Mod_UeberfallTag = Wld_GetDay();

	Log_CreateTopic	(TOPIC_MOD_BDT_ESTEBAN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BDT_ESTEBAN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BDT_ESTEBAN, "Mein erster Raubüberfall als Bandit steht bevor. Morgen um 9 Uhr sollte ich bei der verlassenen Mine sein, um mit Esteban und paar seiner Jungs einige Händler zu überraschen.");
};

INSTANCE Info_Mod_Esteban_AtVM (C_INFO)
{
	npc		= Mod_948_BDT_Esteban_MT;
	nr		= 1;
	condition	= Info_Mod_Esteban_AtVM_Condition;
	information	= Info_Mod_Esteban_AtVM_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Esteban_AtVM_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Esteban_Hi))
	&& (Mod_Banditenueberfall_Esteban == 2)
	&& (Wld_IsTime(08,00,10,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Esteban_AtVM_Info()
{
	AI_Output(self, hero, "Info_Mod_Esteban_AtVM_07_00"); //Da bist du ja. Drei der Jungs gehen jetzt zum Austauschplatz und wir verbergen uns einige Schritte im Eingang der Mine.

	Mod_Banditenueberfall_Esteban = 3;

	AI_StopProcessInfos	(self);

	Wld_InsertNpc	(Mod_4076_VLK_Haendler_MT,	"OW_PATH_1_14");
	Wld_InsertNpc	(Mod_4077_VLK_Haendler_MT,	"OW_PATH_1_14");
	Wld_InsertNpc	(Mod_4078_GRD_Gardist_MT,	"OW_PATH_1_14");
	Wld_InsertNpc	(Mod_4079_GRD_Gardist_MT,	"OW_PATH_1_14");
	Wld_InsertNpc	(Mod_4080_GRD_Gardist_MT,	"OW_PATH_1_14");
	Wld_InsertNpc	(Mod_4081_GRD_Gardist_MT,	"OW_PATH_1_14");

	B_StartOtherRoutine	(Mod_4073_BDT_Bandit_MT, "INVM");
	B_StartOtherRoutine	(Mod_4074_BDT_Bandit_MT, "INVM");
	B_StartOtherRoutine	(Mod_4075_BDT_Bandit_MT, "INVM");
};

INSTANCE Info_Mod_Esteban_AtVM2 (C_INFO)
{
	npc		= Mod_948_BDT_Esteban_MT;
	nr		= 1;
	condition	= Info_Mod_Esteban_AtVM2_Condition;
	information	= Info_Mod_Esteban_AtVM2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Esteban_AtVM2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Esteban_AtVM))
	&& (Mod_Banditenueberfall_Esteban == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Esteban_AtVM2_Info()
{
	AI_Output(self, hero, "Info_Mod_Esteban_AtVM2_07_00"); //Ahh, da kommen sie. Jetzt seid ganz still, damit uns die Gardisten nicht bemerken.

	Mod_Banditenueberfall_Esteban = 4;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "INVM");
	B_StartOtherRoutine	(Mod_4072_BDT_Bandit_MT, "INVM");

	B_StartOtherRoutine	(Mod_4076_VLK_Haendler_MT, "NEXT");
	B_StartOtherRoutine	(Mod_4077_VLK_Haendler_MT, "NEXT");
	B_StartOtherRoutine	(Mod_4078_GRD_Gardist_MT, "NEXT");
	B_StartOtherRoutine	(Mod_4079_GRD_Gardist_MT, "NEXT");
	B_StartOtherRoutine	(Mod_4080_GRD_Gardist_MT, "NEXT");
	B_StartOtherRoutine	(Mod_4081_GRD_Gardist_MT, "NEXT");
};

INSTANCE Info_Mod_Esteban_AtVM3 (C_INFO)
{
	npc		= Mod_948_BDT_Esteban_MT;
	nr		= 1;
	condition	= Info_Mod_Esteban_AtVM3_Condition;
	information	= Info_Mod_Esteban_AtVM3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Esteban_AtVM3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Esteban_AtVM2))
	&& (Mod_Banditenueberfall_Esteban == 5)
	&& (Npc_GetDistToWP(Mod_4076_VLK_Haendler_MT, "OW_PATH_1_15") > 1500)
	&& (Npc_GetDistToWP(Mod_4077_VLK_Haendler_MT, "OW_PATH_1_15") > 1500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Esteban_AtVM3_Info()
{
	AI_Output(self, hero, "Info_Mod_Esteban_AtVM3_07_00"); //Los jetzt!

	Mod_Banditenueberfall_Esteban = 6;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ANGRIFF");
	B_StartOtherRoutine	(Mod_4072_BDT_Bandit_MT, "ANGRIFF");
	B_StartOtherRoutine	(Mod_4073_BDT_Bandit_MT, "ANGRIFF");
	B_StartOtherRoutine	(Mod_4074_BDT_Bandit_MT, "ANGRIFF");
	B_StartOtherRoutine	(Mod_4075_BDT_Bandit_MT, "ANGRIFF");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_4072_BDT_Bandit_MT.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_4073_BDT_Bandit_MT.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_4074_BDT_Bandit_MT.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_4075_BDT_Bandit_MT.aivar[AIV_PARTYMEMBER] = TRUE;

	B_RemoveNpc	(Mod_4078_GRD_Gardist_MT);
	B_RemoveNpc	(Mod_4079_GRD_Gardist_MT);
	B_RemoveNpc	(Mod_4080_GRD_Gardist_MT);
	B_RemoveNpc	(Mod_4081_GRD_Gardist_MT);

	Wld_InsertNpc	(Mod_7326_VLK_Haendler_MT, "WP_INTRO_FALL3");
	Wld_InsertNpc	(Mod_7327_VLK_Haendler_MT, "WP_INTRO_FALL3");
};

INSTANCE Info_Mod_Esteban_AtVM4 (C_INFO)
{
	npc		= Mod_948_BDT_Esteban_MT;
	nr		= 1;
	condition	= Info_Mod_Esteban_AtVM4_Condition;
	information	= Info_Mod_Esteban_AtVM4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Esteban_AtVM4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Esteban_AtVM3))
	&& (Mod_Banditenueberfall_Esteban == 7)
	&& (Npc_IsDead(Mod_7326_VLK_Haendler_MT))
	&& (Npc_IsDead(Mod_7327_VLK_Haendler_MT))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Esteban_AtVM4_Info()
{
	AI_Output(self, hero, "Info_Mod_Esteban_AtVM4_07_00"); //Gute Arbeit. Jetzt durchsuch die Beiden, sie müssten etwas wertvolles dabei haben.

	Mod_Banditenueberfall_Esteban = 8;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
	B_StartOtherRoutine	(Mod_4072_BDT_Bandit_MT, "START");
	B_StartOtherRoutine	(Mod_4073_BDT_Bandit_MT, "START");
	B_StartOtherRoutine	(Mod_4074_BDT_Bandit_MT, "START");
	B_StartOtherRoutine	(Mod_4075_BDT_Bandit_MT, "START");

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_4072_BDT_Bandit_MT.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_4073_BDT_Bandit_MT.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_4074_BDT_Bandit_MT.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_4075_BDT_Bandit_MT.aivar[AIV_PARTYMEMBER] = FALSE;

	B_SetAttitude (self, ATT_FRIENDLY);
	B_SetAttitude (Mod_4072_BDT_Bandit_MT, ATT_FRIENDLY);
	B_SetAttitude (Mod_4073_BDT_Bandit_MT, ATT_FRIENDLY);
	B_SetAttitude (Mod_4074_BDT_Bandit_MT, ATT_FRIENDLY);
	B_SetAttitude (Mod_4075_BDT_Bandit_MT, ATT_FRIENDLY);
};

INSTANCE Info_Mod_Esteban_AtVM5 (C_INFO)
{
	npc		= Mod_948_BDT_Esteban_MT;
	nr		= 1;
	condition	= Info_Mod_Esteban_AtVM5_Condition;
	information	= Info_Mod_Esteban_AtVM5_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Esteban_AtVM5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Esteban_AtVM3))
	&& (Mod_Banditenueberfall_Esteban == 8)
	&& (Npc_HasItems(hero, ItMi_BDTKiste_01) == 1)
	&& (Npc_HasItems(hero, ItMi_BDTKiste_02) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Esteban_AtVM5_Info()
{
	AI_Output(self, hero, "Info_Mod_Esteban_AtVM5_07_00"); //Genau danach haben wir gesucht. Jetzt gib mir die zwei Kisten, damit ich sie öffnen und die Beute verteilen kann.

	Mod_Banditenueberfall_Esteban = 9;

	Info_ClearChoices	(Info_Mod_Esteban_AtVM5);

	Info_AddChoice	(Info_Mod_Esteban_AtVM5, "Ich glaube ich behalte die Kisten lieber für mich.", Info_Mod_Esteban_AtVM5_B);
	Info_AddChoice	(Info_Mod_Esteban_AtVM5, "Hier hast du sie.", Info_Mod_Esteban_AtVM5_A);
};

FUNC VOID Info_Mod_Esteban_AtVM5_B()
{
	AI_Output(hero, self, "Info_Mod_Esteban_AtVM5_B_15_00"); //Ich glaube ich behalte die Kisten lieber für mich.
	AI_Output(self, hero, "Info_Mod_Esteban_AtVM5_B_07_01"); //Was? Dann holen wir sie uns eben. Los Männer!

	Mod_Banditenueberfall_Esteban = 10;

	Mod_EstebanBeleidigt = 1;

	Info_ClearChoices	(Info_Mod_Esteban_AtVM5);

	B_SetTopicStatus	(TOPIC_MOD_BDT_ESTEBAN, LOG_FAILED);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
	B_StartOtherRoutine	(Mod_4072_BDT_Bandit_MT, "START");
	B_StartOtherRoutine	(Mod_4073_BDT_Bandit_MT, "START");
	B_StartOtherRoutine	(Mod_4074_BDT_Bandit_MT, "START");
	B_StartOtherRoutine	(Mod_4075_BDT_Bandit_MT, "START");
};

FUNC VOID Info_Mod_Esteban_AtVM5_A()
{
	AI_Output(hero, self, "Info_Mod_Esteban_AtVM5_A_15_00"); //Hier hast du sie.

	Npc_RemoveInvItems	(hero, ItMi_BDTKiste_01, 1);
	Npc_RemoveInvItems	(hero, ItMi_BDTKiste_02, 1);

	B_ShowGivenThings	("2 Schatzkisten gegeben");

	AI_Output(self, hero, "Info_Mod_Esteban_AtVM5_A_07_01"); //Ahh, jetzt habe ich sie endlich mit zwei meiner Spezialdietriche öffnen können. Hier ist dein Anteil.

	CreateInvItems	(hero, ItMi_Nugget, 9);
	CreateInvItems	(hero, ItMi_Gold, 160);
	CreateInvItems	(hero, ItMi_GoldNugget_Addon, 7);
	CreateInvItems	(hero, ItMi_GoldRing, 2);
	CreateInvItems	(hero, ItMi_SilverCup, 2);
	CreateInvItems	(hero, ItAt_ShadowHorn, 1);

	B_ShowGivenThings	("Diverse Items erhalten");

	AI_Output(self, hero, "Info_Mod_Esteban_AtVM5_A_07_02"); //Komm später noch mal vorbei, da habe ich wieder was zu tun für dich.

	Mod_Banditenueberfall_Esteban = 11;

	Info_ClearChoices	(Info_Mod_Esteban_AtVM5);

	B_GivePlayerXP	(500);

	B_LogEntry	(TOPIC_MOD_BDT_ESTEBAN, "Der Überfall ist geglückt. Die Händler wurden um ihre Lasten erleichtert und wir haben paar Münzen und Habseeligkeiten mehr.");
	B_SetTopicStatus	(TOPIC_MOD_BDT_ESTEBAN, LOG_SUCCESS);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
	B_StartOtherRoutine	(Mod_4072_BDT_Bandit_MT, "START");
	B_StartOtherRoutine	(Mod_4073_BDT_Bandit_MT, "START");
	B_StartOtherRoutine	(Mod_4074_BDT_Bandit_MT, "START");
	B_StartOtherRoutine	(Mod_4075_BDT_Bandit_MT, "START");
};

INSTANCE Info_Mod_Esteban_OrkAttack (C_INFO)
{
	npc		= Mod_948_BDT_Esteban_MT;
	nr		= 1;
	condition	= Info_Mod_Esteban_OrkAttack_Condition;
	information	= Info_Mod_Esteban_OrkAttack_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Esteban_OrkAttack_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dexter_AmulettAbgegeben))
	&& (Mod_Dexter_AmulettParty == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Esteban_OrkAttack_Info()
{
	AI_Output(self, hero, "Info_Mod_Esteban_OrkAttack_07_00"); //Los, aufstehen, keine Zeit für Trödeleien.
	AI_Output(self, hero, "Info_Mod_Esteban_OrkAttack_07_01"); //Die letzte Nacht mag dir zwar noch in den Knochen liegen, aber die Horde Orks, die sich durch den Wald unserem Lager nährt, wird nicht darauf warten, bis du deinen Rausch ausgeschlafen hast.
	AI_Output(hero, self, "Info_Mod_Esteban_OrkAttack_15_02"); //(verschlafen) Wa ... was, Orks, schon wieder?
	AI_Output(self, hero, "Info_Mod_Esteban_OrkAttack_07_03"); //Ja, los, komm. Einer unserer Jungs hat sie gesehen, als er im Wald Pilze suche wollte. Ich verlasse mich lieber darauf, dass das nicht nur eine Halluzination war.
	AI_Output(self, hero, "Info_Mod_Esteban_OrkAttack_07_04"); //Sie nehmen den Weg über den Durchgang und wir werden sie mit Bögen und Keulen am Ausgang begrüßen, bevor sie die Stärke ihrer Streitmacht entfalten können. Also, auf geht’s.

	B_LogEntry	(TOPIC_MOD_BDT_ORKS, "Noch ist es nicht vorbei. Ein Trupp Orks nährt sich dem Lager. Ich werde sie mit Esteban und einigen seiner Jungs beim Durchgang im Wald erwarten.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "OSCHUST");
	B_StartOtherRoutine	(Mod_955_BDT_Juan_MT, "OSCHUST");
	B_StartOtherRoutine	(Mod_957_BDT_Logan_MT, "OSCHUST");
	B_StartOtherRoutine	(Mod_958_BDT_Miguel_MT, "OSCHUST");
	B_StartOtherRoutine	(Mod_964_BDT_Skinner_MT, "OSCHUST");
	B_StartOtherRoutine	(Mod_4074_BDT_Bandit_MT, "OSCHUST");
	B_StartOtherRoutine	(Mod_4075_BDT_Bandit_MT, "OSCHUST");
	B_StartOtherRoutine	(Mod_790_BDT_Morgahard_MT, "OSCHUST");
};

INSTANCE Info_Mod_Esteban_FirstOrkWave (C_INFO)
{
	npc		= Mod_948_BDT_Esteban_MT;
	nr		= 1;
	condition	= Info_Mod_Esteban_FirstOrkWave_Condition;
	information	= Info_Mod_Esteban_FirstOrkWave_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Esteban_FirstOrkWave_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Esteban_OrkAttack))
	&& (Npc_GetDistToWP(self, self.wp) < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Esteban_FirstOrkWave_Info()
{
	AI_Output(self, hero, "Info_Mod_Esteban_FirstOrkWave_07_00"); //So, da kommen sie.
	
	AI_StopProcessInfos	(self);

	Wld_InsertNpc	(OrcScout_Oschust_01, "FP_ROAM_ORCSCOUT_OSCHUST_01");
	Wld_InsertNpc	(OrcScout_Oschust_02, "FP_ROAM_ORCSCOUT_OSCHUST_02");
	Wld_InsertNpc	(OrcWarrior_Oschust_01, "FP_ROAM_ORCSCOUT_OSCHUST_03");
};

INSTANCE Info_Mod_Esteban_SecondOrkWave (C_INFO)
{
	npc		= Mod_948_BDT_Esteban_MT;
	nr		= 1;
	condition	= Info_Mod_Esteban_SecondOrkWave_Condition;
	information	= Info_Mod_Esteban_SecondOrkWave_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Esteban_SecondOrkWave_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Esteban_FirstOrkWave))
	&& (Npc_GetDistToWP(self, self.wp) < 500)
	&& (Npc_IsDead(OrcScout_Oschust_01))
	&& (Npc_IsDead(OrcScout_Oschust_02))
	&& (Npc_IsDead(OrcWarrior_Oschust_01))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Esteban_SecondOrkWave_Info()
{
	AI_Output(self, hero, "Info_Mod_Esteban_SecondOrkWave_07_00"); //Das soll die Streitmacht gewesen sein? Entweder hat jemand zu viele Pilze gefressen oder ...
	
	AI_StopProcessInfos	(self);

	AI_Wait	(hero, 5);

	Wld_InsertNpc	(Mod_7175_BDT_Oschust_MT, "WP_MT_ORKS_OSCHUST_03");

	// + Orks

	Wld_InsertNpc	(Mod_10021_ORC_Elite_MT, "WP_MT_ORKS_OSCHUST_03");
	Wld_InsertNpc	(Mod_10022_ORC_Elite_MT, "WP_MT_ORKS_OSCHUST_03");

	Wld_InsertNpc	(Mod_10029_Orc_Warrior_MT, "WP_MT_ORKS_OSCHUST_03");
	Wld_InsertNpc	(Mod_10030_Orc_Warrior_MT, "WP_MT_ORKS_OSCHUST_03");
	Wld_InsertNpc	(Mod_10031_Orc_Warrior_MT, "WP_MT_ORKS_OSCHUST_03");
};

INSTANCE Info_Mod_Esteban_Unterlegen (C_INFO)
{
	npc		= Mod_948_BDT_Esteban_MT;
	nr		= 1;
	condition	= Info_Mod_Esteban_Unterlegen_Condition;
	information	= Info_Mod_Esteban_Unterlegen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Esteban_Unterlegen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Oschust_BadOne_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Esteban_Unterlegen_Info()
{
	AI_Output(self, hero, "Info_Mod_Esteban_Unterlegen_07_00"); //Verdammter Verräter ... Jungs, tut was er sagt. Gegen so viele Orks kommen wir nicht an.
	
	AI_StopProcessInfos	(self);

	Wld_PlayEffect	("BLACK_SCREEN_LONG", hero, hero, 0, 0, 0, FALSE);
};

INSTANCE Info_Mod_Esteban_FluchtHappy (C_INFO)
{
	npc		= Mod_948_BDT_Esteban_MT;
	nr		= 1;
	condition	= Info_Mod_Esteban_FluchtHappy_Condition;
	information	= Info_Mod_Esteban_FluchtHappy_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Esteban_FluchtHappy_Condition()
{
	if (Mod_AlbertTransforms == 6)
	&& (Npc_GetDistToWP(self, "OW_PATH_1_5_B") < 1000)
	&& (Npc_KnowsInfo(hero, Info_Mod_Albert_Safety))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Esteban_FluchtHappy_Info()
{
	AI_Output(self, hero, "Info_Mod_Esteban_FluchtHappy_07_00"); //Hörst du das?
	AI_Output(self, hero, "Info_Mod_Esteban_FluchtHappy_07_01"); //Das scheint von unserem Lager zu kommen. Schnell, bevor wir zu spät kommen.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "RETTUNG");
	self.aivar[AIV_PARTYMEMBER] = TRUE;

	if (Mod_OC_Miguel == 0)
	{
		B_StartOtherRoutine	(Mod_958_BDT_Miguel_MT, "RETTUNG");
		Mod_958_BDT_Miguel_MT.aivar[AIV_PARTYMEMBER] = TRUE;
	};
	if (Mod_OC_Juan == 0)
	{
		B_StartOtherRoutine	(Mod_955_BDT_Juan_MT, "RETTUNG");
		Mod_955_BDT_Juan_MT.aivar[AIV_PARTYMEMBER] = TRUE;
	};
	if (Mod_OC_Logan == 0)
	{
		B_StartOtherRoutine	(Mod_957_BDT_Logan_MT, "RETTUNG");
		Mod_957_BDT_Logan_MT.aivar[AIV_PARTYMEMBER] = TRUE;
	};
	if (Mod_OC_Skinner == 0)
	{
		B_StartOtherRoutine	(Mod_964_BDT_Skinner_MT, "RETTUNG");
		Mod_964_BDT_Skinner_MT.aivar[AIV_PARTYMEMBER] = TRUE;
	};
	if (Mod_OC_Morgahard == 0)
	{
		B_StartOtherRoutine	(Mod_790_BDT_Morgahard_MT, "RETTUNG");
		Mod_790_BDT_Morgahard_MT.aivar[AIV_PARTYMEMBER] = TRUE;
	};
	if (Mod_OC_Bandit_01 == 0)
	{
		B_StartOtherRoutine	(Mod_4074_BDT_Bandit_MT, "RETTUNG");
		Mod_4074_BDT_Bandit_MT.aivar[AIV_PARTYMEMBER] = TRUE;
	};
	if (Mod_OC_Bandit_02 == 0)
	{
		B_StartOtherRoutine	(Mod_4075_BDT_Bandit_MT, "RETTUNG");
		Mod_4075_BDT_Bandit_MT.aivar[AIV_PARTYMEMBER] = TRUE;
	};

	B_StartOtherRoutine	(Mod_1120_BDT_Ratford_MT, "RETTUNG");
	Mod_1120_BDT_Ratford_MT.aivar[AIV_PARTYMEMBER] = TRUE;

	B_StartOtherRoutine	(Mod_961_BDT_Sancho_MT, "RETTUNG");
	Mod_961_BDT_Sancho_MT.aivar[AIV_PARTYMEMBER] = TRUE;

	B_StartOtherRoutine	(Mod_1121_BDT_Drax_MT, "RETTUNG");
	Mod_1121_BDT_Drax_MT.aivar[AIV_PARTYMEMBER] = TRUE;

	B_StartOtherRoutine	(Mod_4072_BDT_Bandit_MT, "RETTUNG");
	Mod_4072_BDT_Bandit_MT.aivar[AIV_PARTYMEMBER] = TRUE;

	B_StartOtherRoutine	(Mod_4073_BDT_Bandit_MT, "RETTUNG");
	Mod_4073_BDT_Bandit_MT.aivar[AIV_PARTYMEMBER] = TRUE;

	// Vor dem Lager

	Wld_InsertNpc	(OrcWarrior_Banditenangriff, "OW_PATH_189B");
	Wld_InsertNpc	(OrcWarrior_Banditenangriff, "OW_PATH_189B");
	Wld_InsertNpc	(OrcWarrior_Banditenangriff, "OW_PATH_189B");
	Wld_InsertNpc	(Warg, "OW_PATH_189B");
	Wld_InsertNpc	(Warg, "OW_PATH_189B");
	Wld_InsertNpc	(Warg, "OW_PATH_189B");
	Wld_InsertNpc	(Warg, "OW_PATH_189B");

	// Im Lager

	Wld_InsertNpc	(OrcWarrior_Banditenangriff, "LOCATION_11_12");
	Wld_InsertNpc	(OrcWarrior_Banditenangriff, "LOCATION_11_12");
	Wld_InsertNpc	(OrcScout_Banditenangriff, "LOCATION_11_12");
	Wld_InsertNpc	(OrcScout_Banditenangriff, "LOCATION_11_12");
	Wld_InsertNpc	(OrcScout_Banditenangriff, "LOCATION_11_12");
	Wld_InsertNpc	(OrcScout_Banditenangriff, "LOCATION_11_12");
	Wld_InsertNpc	(Warg, "LOCATION_11_12");
	Wld_InsertNpc	(Warg, "LOCATION_11_12");
	Wld_InsertNpc	(Warg, "LOCATION_11_12");
	Wld_InsertNpc	(Warg, "LOCATION_11_12");

	B_StartOtherRoutine	(Mod_7175_BDT_Oschust_MT, "ANGRIFF");

	Mod_7175_BDT_Oschust_MT.guild = GIL_ORC;

	B_LogEntry	(TOPIC_MOD_BDT_ORKS, "Zwar haben wir es nach draußen geschafft. Unser Lager scheint jedoch in größter Bedrängnis. Eile ist jetzt geboten ...");
};

INSTANCE Info_Mod_Esteban_Lehrer (C_INFO)
{
	npc		= Mod_948_BDT_Esteban_MT;
	nr		= 1;
	condition	= Info_Mod_Esteban_Lehrer_Condition;
	information	= Info_Mod_Esteban_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir was beibringen?";
};

FUNC INT Info_Mod_Esteban_Lehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Esteban_Hi))
	&& ((Banditen_Dabei == TRUE)
	|| (HoheBanditen_Dabei == TRUE))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Esteban_Lehrer_Info()
{
	B_Say	(hero, self, "$KANNSTDUMIRWASBEIBRINGEN");

	AI_Output(self, hero, "Info_Mod_Esteban_Lehrer_07_00"); //Ich kann dir helfen stärker und geschickter zu werden.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_BANDITEN, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_BANDITEN, "Esteban kann mich in Stärke und Geschick trainieren.");
};

INSTANCE Info_Mod_Esteban_Lernen (C_INFO)
{
	npc		= Mod_948_BDT_Esteban_MT;
	nr		= 1;
	condition	= Info_Mod_Esteban_Lernen_Condition;
	information	= Info_Mod_Esteban_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Bring mir was bei.";
};

FUNC INT Info_Mod_Esteban_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Esteban_Lehrer))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Esteban_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Esteban_Lernen_15_00"); //Bring mir was bei.

	Info_ClearChoices	(Info_Mod_Esteban_Lernen);

	Info_AddChoice	(Info_Mod_Esteban_Lernen, DIALOG_BACK, Info_Mod_Esteban_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Esteban_Lernen, B_BuildLearnString_New(PRINT_LearnDEX5, B_GetLearnCostAttribute_New(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Esteban_Lernen_DEX_5);
	Info_AddChoice	(Info_Mod_Esteban_Lernen, B_BuildLearnString_New(PRINT_LearnDEX1, B_GetLearnCostAttribute(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Esteban_Lernen_DEX_1);
	Info_AddChoice	(Info_Mod_Esteban_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Esteban_Lernen_STR_5);
	Info_AddChoice	(Info_Mod_Esteban_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Esteban_Lernen_STR_1);
};

FUNC VOID Info_Mod_Esteban_Lernen_BACK()
{
	Info_ClearChoices	(Info_Mod_Esteban_Lernen);
};

FUNC VOID Info_Mod_Esteban_Lernen_DEX_5()
{
	B_TeachAttributePoints_New	(self, hero, ATR_DEXTERITY, 5, 100);

	Info_ClearChoices	(Info_Mod_Esteban_Lernen);

	Info_AddChoice	(Info_Mod_Esteban_Lernen, DIALOG_BACK, Info_Mod_Esteban_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Esteban_Lernen, B_BuildLearnString_New(PRINT_LearnDEX5, B_GetLearnCostAttribute_New(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Esteban_Lernen_DEX_5);
	Info_AddChoice	(Info_Mod_Esteban_Lernen, B_BuildLearnString_New(PRINT_LearnDEX1, B_GetLearnCostAttribute(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Esteban_Lernen_DEX_1);
	Info_AddChoice	(Info_Mod_Esteban_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Esteban_Lernen_STR_5);
	Info_AddChoice	(Info_Mod_Esteban_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Esteban_Lernen_STR_1);
};

FUNC VOID Info_Mod_Esteban_Lernen_DEX_1()
{
	B_TeachAttributePoints	(self, hero, ATR_DEXTERITY, 1, 100);

	Info_ClearChoices	(Info_Mod_Esteban_Lernen);

	Info_AddChoice	(Info_Mod_Esteban_Lernen, DIALOG_BACK, Info_Mod_Esteban_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Esteban_Lernen, B_BuildLearnString_New(PRINT_LearnDEX5, B_GetLearnCostAttribute_New(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Esteban_Lernen_DEX_5);
	Info_AddChoice	(Info_Mod_Esteban_Lernen, B_BuildLearnString_New(PRINT_LearnDEX1, B_GetLearnCostAttribute(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Esteban_Lernen_DEX_1);
	Info_AddChoice	(Info_Mod_Esteban_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Esteban_Lernen_STR_5);
	Info_AddChoice	(Info_Mod_Esteban_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Esteban_Lernen_STR_1);
};

FUNC VOID Info_Mod_Esteban_Lernen_STR_5()
{
	B_TeachAttributePoints_New	(self, hero, ATR_STRENGTH, 5, 100);

	Info_ClearChoices	(Info_Mod_Esteban_Lernen);

	Info_AddChoice	(Info_Mod_Esteban_Lernen, DIALOG_BACK, Info_Mod_Esteban_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Esteban_Lernen, B_BuildLearnString_New(PRINT_LearnDEX5, B_GetLearnCostAttribute_New(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Esteban_Lernen_DEX_5);
	Info_AddChoice	(Info_Mod_Esteban_Lernen, B_BuildLearnString_New(PRINT_LearnDEX1, B_GetLearnCostAttribute(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Esteban_Lernen_DEX_1);
	Info_AddChoice	(Info_Mod_Esteban_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Esteban_Lernen_STR_5);
	Info_AddChoice	(Info_Mod_Esteban_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Esteban_Lernen_STR_1);
};

FUNC VOID Info_Mod_Esteban_Lernen_STR_1()
{
	B_TeachAttributePoints	(self, hero, ATR_STRENGTH, 1, 100);

	Info_ClearChoices	(Info_Mod_Esteban_Lernen);

	Info_AddChoice	(Info_Mod_Esteban_Lernen, DIALOG_BACK, Info_Mod_Esteban_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Esteban_Lernen, B_BuildLearnString_New(PRINT_LearnDEX5, B_GetLearnCostAttribute_New(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Esteban_Lernen_DEX_5);
	Info_AddChoice	(Info_Mod_Esteban_Lernen, B_BuildLearnString_New(PRINT_LearnDEX1, B_GetLearnCostAttribute(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Esteban_Lernen_DEX_1);
	Info_AddChoice	(Info_Mod_Esteban_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Esteban_Lernen_STR_5);
	Info_AddChoice	(Info_Mod_Esteban_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Esteban_Lernen_STR_1);
};

INSTANCE Info_Mod_Esteban_Pickpocket (C_INFO)
{
	npc		= Mod_948_BDT_Esteban_MT;
	nr		= 1;
	condition	= Info_Mod_Esteban_Pickpocket_Condition;
	information	= Info_Mod_Esteban_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Esteban_Pickpocket_Condition()
{
	C_Beklauen	(82, ItMi_Gold, 36);
};

FUNC VOID Info_Mod_Esteban_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Esteban_Pickpocket);

	Info_AddChoice	(Info_Mod_Esteban_Pickpocket, DIALOG_BACK, Info_Mod_Esteban_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Esteban_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Esteban_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Esteban_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Esteban_Pickpocket);
};

FUNC VOID Info_Mod_Esteban_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Esteban_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Esteban_Pickpocket);

		Info_AddChoice	(Info_Mod_Esteban_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Esteban_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Esteban_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Esteban_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Esteban_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Esteban_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Esteban_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Esteban_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Esteban_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Esteban_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Esteban_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Esteban_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Esteban_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Esteban_EXIT (C_INFO)
{
	npc		= Mod_948_BDT_Esteban_MT;
	nr		= 1;
	condition	= Info_Mod_Esteban_EXIT_Condition;
	information	= Info_Mod_Esteban_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Esteban_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Esteban_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};