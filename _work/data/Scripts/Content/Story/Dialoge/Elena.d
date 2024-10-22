INSTANCE Info_Mod_Elena_Hi (C_INFO)
{
	npc		= Mod_783_BAU_Elena_NW;
	nr		= 1;
	condition	= Info_Mod_Elena_Hi_Condition;
	information	= Info_Mod_Elena_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hi.";
};

FUNC INT Info_Mod_Elena_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Elena_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Elena_Hi_15_00"); //Wie gehts?
	AI_Output(self, hero, "Info_Mod_Elena_Hi_12_01"); //Mir gehts gut. Was willst du von mir?
	AI_Output(hero, self, "Info_Mod_Elena_Hi_15_02"); //Was hast du denn für mich?
	AI_Output(self, hero, "Info_Mod_Elena_Hi_12_03"); //Ich könnte dir ein paar Sachen verkaufen. Mehr ist aber nicht drin.
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_ONAR, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_ONAR, "Elena kann mir ein paar Waren verkaufen.");
};

INSTANCE Info_Mod_Elena_Hexenparty_01 (C_INFO)
{
	npc		= Mod_783_BAU_Elena_NW;
	nr		= 1;
	condition	= Info_Mod_Elena_Hexenparty_01_Condition;
	information	= Info_Mod_Elena_Hexenparty_01_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Elena_Hexenparty_01_Condition()
{
	if (Mod_TrfWoman == 1)
	|| ((Mod_WM_Boeden == 13)
	&& (Mod_WM_Boeden == 14))
	&& (Npc_GetDistToWP(hero, "NW_BIGFARM_FOREST_08") < 1000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Elena_Hexenparty_01_Info()
{
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_01_12_00"); //Was machst du hier? Ich spüre magische Befähigung in dir und die Restaura eines mächtigen Dämons.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_01_12_01"); //Du scheinst kein gewöhnliches Bauernweib zu sein, sonst hätten wir dich schon zum Teufel gejagt. Also sprich!

	B_RemoveNpc	(Mod_7198_HEX_AttraktiveFrau_NW);
	
	Info_ClearChoices	(Info_Mod_Elena_Hexenparty_01);

	Info_AddChoice	(Info_Mod_Elena_Hexenparty_01, "Ich will eurer Schwesternschaft beitreten.", Info_Mod_Elena_Hexenparty_01_C);
	Info_AddChoice	(Info_Mod_Elena_Hexenparty_01, "Ich wollte mich nur mal umsehen.", Info_Mod_Elena_Hexenparty_01_B);
	Info_AddChoice	(Info_Mod_Elena_Hexenparty_01, "Ich bin hier um euch zu vernichten.", Info_Mod_Elena_Hexenparty_01_A);
};

FUNC VOID Info_Mod_Elena_Hexenparty_01_C()
{
	AI_Output(hero, self, "Info_Mod_Elena_Hexenparty_01_C_15_00"); //Ich will eurer Schwesternschaft beitreten.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_01_C_12_01"); //(lacht) Eine neue Anwärterin für unseren Bund.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_01_C_12_02"); //(ernster) In der Tat, deine magischen Fähigkeiten sprechen für dich, werfen aber auch einige Fragen auf: Wo hast du sie erlernt?
	
	Info_ClearChoices	(Info_Mod_Elena_Hexenparty_01);

	Info_AddChoice	(Info_Mod_Elena_Hexenparty_01, "Ich kann mich nicht mehr erinnern.", Info_Mod_Elena_Hexenparty_01_F);
	Info_AddChoice	(Info_Mod_Elena_Hexenparty_01, "Ich habe sie mich selbst gelehrt.", Info_Mod_Elena_Hexenparty_01_E);
	Info_AddChoice	(Info_Mod_Elena_Hexenparty_01, "Ein Wassermagier lehrte sie mich.", Info_Mod_Elena_Hexenparty_01_D);
};

FUNC VOID Info_Mod_Elena_Hexenparty_01_B()
{
	AI_Output(hero, self, "Info_Mod_Elena_Hexenparty_01_B_15_00"); //Ich wollte mich nur mal umsehen.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_01_B_12_01"); //Du törichtes Ding willst mich wohl zum Besten halten. Sag mir auf der Stelle, was du hier suchst, und überlege wohl, was du sagst.
	
	Info_ClearChoices	(Info_Mod_Elena_Hexenparty_01);

	Info_AddChoice	(Info_Mod_Elena_Hexenparty_01, "Ich will eurer Schwesternschaft beitreten.", Info_Mod_Elena_Hexenparty_01_C);
	Info_AddChoice	(Info_Mod_Elena_Hexenparty_01, "Ich bin hier, um euch zu vernichten.", Info_Mod_Elena_Hexenparty_01_A);
};

FUNC VOID Info_Mod_Elena_Hexenparty_01_A()
{
	AI_Output(hero, self, "Info_Mod_Elena_Hexenparty_01_A_15_00"); //Ich bin hier, um euch zu vernichten.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_01_A_12_01"); //Was?! Du Närrin hast wohl keine Vorstellung, mit wem du dich hier messen willst?!
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_01_A_12_02"); //Los, Schwestern, zeigt ihr, wie wir mit ungebetenen Gästen verfahren.
	
	Info_ClearChoices	(Info_Mod_Elena_Hexenparty_01);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Kill, 0);
	B_Attack	(Mod_104_BAU_Rega_NW, hero, AR_Kill, 0);
	B_Attack	(Mod_1403_BAU_Baeuerin_NW, hero, AR_Kill, 0);

	Mod_HexenAttack = 1;
};

FUNC VOID Info_Mod_Elena_Hexenparty_01_G()
{
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_01_G_12_00"); //Gut, wir wollen dir eine Chance geben. Wenn du dich unserer Schwesternschaft als würdig erwiesen hast, werden wir dich in unsere Gemeinschaft aufnehmen.
	AI_Output(hero, self, "Info_Mod_Elena_Hexenparty_01_G_15_01"); //Was soll ich tun?
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_01_G_12_02"); //Dieser Pepe ist uns schon seit langem ein Dorn im Auge. Er steht viel zu nah an unserem Versteck.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_01_G_12_03"); //Wir werden ihm einen kleinen Besuch abstatten ... das heißt, du wirst in Warggestalt erscheinen und seine Herde dezimieren. Wir werden dieses Mal nur zusehen.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_01_G_12_04"); //Das sollte reichen, um ihn zukünftig vom Wald fernzuhalten, damit wir unser Werk des Chaos ungestört fortsetzen können.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_01_G_12_05"); //Nimm dazu diese verzauberte Warghaut, lege sie an und folge uns.

	B_GiveInvItems	(self, hero, ItRu_Verwandlungsfell, 1);

	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_01_G_12_06"); //Wenn du willst, kann ich dich auch noch lehren, deine tierische Form geschickter einzusetzen, deine aggressiven Triebe zu zähmen, Kadaver zu fressen und andere Wölfe und Warge dir folgen zu lassen.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_01_G_12_07"); //Außerdem würdest du deine Tiergestalt an den Erfahrungen teilhaben lassen, die du als Mensch machst und so mit der Zeit als Warg an Stärke und Macht gewinnen.
	
	Info_ClearChoices	(Info_Mod_Elena_Hexenparty_01);

	if (hero.lp >= 3)
	{
		Info_AddChoice	(Info_Mod_Elena_Hexenparty_01, "Bring mir bei, meine tierische Gestalt besser kontrollieren zu können. (3 Lernpunkte)", Info_Mod_Elena_Hexenparty_01_H);
	};

	Info_AddChoice	(Info_Mod_Elena_Hexenparty_01, "Lass uns aufbrechen.", Info_Mod_Elena_Hexenparty_01_I);
};

FUNC VOID Info_Mod_Elena_Hexenparty_01_F()
{
	AI_Output(hero, self, "Info_Mod_Elena_Hexenparty_01_F_15_00"); //Ich kann mich nicht mehr erinnern.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_01_F_12_01"); //Hmm, sie hat ihr Gedächtnis verloren. Die Begegnung mit einem Dämonen könnte natürlich so etwas hervorrufen.
	
	Info_Mod_Elena_Hexenparty_01_G();
};

FUNC VOID Info_Mod_Elena_Hexenparty_01_E()
{
	AI_Output(hero, self, "Info_Mod_Elena_Hexenparty_01_E_15_00"); //Ich habe es mich selbst gelehrt.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_01_E_12_01"); //Beeindruckend, du musst Hexenblut in dir haben.
	
	Info_Mod_Elena_Hexenparty_01_G();
};

FUNC VOID Info_Mod_Elena_Hexenparty_01_D()
{
	AI_Output(hero, self, "Info_Mod_Elena_Hexenparty_01_D_15_00"); //Ein Wassermagier lehrte sie mich.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_01_D_12_01"); //Du willst meiner spotten?! Weidet sie aus, Schwestern ...
	
	Info_ClearChoices	(Info_Mod_Elena_Hexenparty_01);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Kill, 0);
	B_Attack	(Mod_104_BAU_Rega_NW, hero, AR_Kill, 0);
	B_Attack	(Mod_1403_BAU_Baeuerin_NW, hero, AR_Kill, 0);

	Mod_HexenAttack = 1;
};

FUNC VOID Info_Mod_Elena_Hexenparty_01_I()
{
	AI_Output(hero, self, "Info_Mod_Elena_Hexenparty_01_I_15_00"); //Lass uns aufbrechen.

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Unglaublich. Die Hexen sind doch tatsächlich auf meine Tarnung hereingefallen. Ich soll mir jetzt die Warghaut anlegen und mit meinen 'Schwestern' Pepe verscheuchen.");
	
	Info_ClearChoices	(Info_Mod_Elena_Hexenparty_01);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Elena_Hexenparty_01_H()
{
	AI_Output(hero, self, "Info_Mod_Elena_Hexenparty_01_H_15_00"); //Bring mir bei, meine tierische Gestalt besser kontrollieren zu können.

	hero.lp -= 3;

	Mod_WM_Tiergestalt = 1;
	
	Info_Mod_Elena_Hexenparty_01_I();
};

INSTANCE Info_Mod_Elena_Hexenparty_07 (C_INFO)
{
	npc		= Mod_783_BAU_Elena_NW;
	nr		= 1;
	condition	= Info_Mod_Elena_Hexenparty_07_Condition;
	information	= Info_Mod_Elena_Hexenparty_07_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Elena_Hexenparty_07_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Elena_Hexenparty_01))
	&& (Mod_WM_IsWarg == 1)
	&& (Mod_TrfWoman == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Elena_Hexenparty_07_Info()
{
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_07_12_00"); //Gut, und nun folge uns.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOPEPE");
	B_StartOtherRoutine	(Mod_104_BAU_Rega_NW, "TOPEPE");
	B_StartOtherRoutine	(Mod_1403_BAU_Baeuerin_NW, "TOPEPE");
};

INSTANCE Info_Mod_Elena_Hexenparty_08 (C_INFO)
{
	npc		= Mod_783_BAU_Elena_NW;
	nr		= 1;
	condition	= Info_Mod_Elena_Hexenparty_08_Condition;
	information	= Info_Mod_Elena_Hexenparty_08_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Elena_Hexenparty_08_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Elena_Hexenparty_07))
	&& (Mod_WM_IsWarg == 1)
	&& (Mod_TrfWoman == 1)
	&& (Npc_GetDistToWP(self, "NW_BIGFARM_FOREST_03_NAVIGATION3") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Elena_Hexenparty_08_Info()
{
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_08_12_00"); //Na dann los, du weißt, was du zu tun hast.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Elena_Hexenparty_09 (C_INFO)
{
	npc		= Mod_783_BAU_Elena_NW;
	nr		= 1;
	condition	= Info_Mod_Elena_Hexenparty_09_Condition;
	information	= Info_Mod_Elena_Hexenparty_09_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Elena_Hexenparty_09_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Elena_Hexenparty_08))
	&& (Mod_WM_IsWarg == 1)
	&& (Mod_TrfWoman == 1)
	&& (Npc_GetDistToWP(self, "NW_BIGFARM_SHEEP2_02") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Elena_Hexenparty_09_Info()
{
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_09_12_00"); //Hast du dich schön am Blut der Schafe gelabt? Keine schlechte Arbeit ... für eine beginnende Hexe.

	AI_StopProcessInfos	(self);

	Mod_WM_HexenVerwandlung = 1;
};

INSTANCE Info_Mod_Elena_Hexenparty_02 (C_INFO)
{
	npc		= Mod_783_BAU_Elena_NW;
	nr		= 1;
	condition	= Info_Mod_Elena_Hexenparty_02_Condition;
	information	= Info_Mod_Elena_Hexenparty_02_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Elena_Hexenparty_02_Condition()
{
	if (Mod_WM_HexenVerwandlung == 2)
	&& (Mod_TrfWoman == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Elena_Hexenparty_02_Info()
{
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_02_12_00"); //Das war doch eine erbauliche, wie auch vergnügsame Erfahrung, meine Schwester, meinst du nicht auch?

	B_GivePlayerXP	(200);

	B_StartOtherRoutine	(self, "HEXE");
	B_StartOtherRoutine	(Mod_104_BAU_Rega_NW, "HEXE");
	B_StartOtherRoutine	(Mod_1403_BAU_Baeuerin_NW, "HEXE");

	B_StartOtherRoutine	(Mod_793_BAU_Pepe_NW, "SCHAFETOT");
	
	Info_ClearChoices	(Info_Mod_Elena_Hexenparty_02);

	Info_AddChoice	(Info_Mod_Elena_Hexenparty_02, "Weiß nicht.", Info_Mod_Elena_Hexenparty_02_B);
	Info_AddChoice	(Info_Mod_Elena_Hexenparty_02, "Ja, gewiss.", Info_Mod_Elena_Hexenparty_02_A);
};

FUNC VOID Info_Mod_Elena_Hexenparty_02_C()
{
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_02_C_12_00"); //Wie dem auch sei, ich hoffe, du bist bereit, dein Werk der Zerstörung und Zersetzung fortzuführen.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_02_C_12_01"); //Nimm diese Spruchrolle des Hagelschauers, warte, bis ein Bauer und die Bäuerin auf dem Feld vor Onars Gehöft arbeiten und wende sie dort an.

	B_GiveInvItems	(self, hero, ItSc_Hagel, 1);

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Diesmal haben mir meine Schwestern aufgetragen, die Hagelspruchrolle bei dem Bauern und der Bäuerin auf dem Feld vor Onars Hof anzuwenden.");
	
	Info_ClearChoices	(Info_Mod_Elena_Hexenparty_02);
};

FUNC VOID Info_Mod_Elena_Hexenparty_02_B()
{
	AI_Output(hero, self, "Info_Mod_Elena_Hexenparty_02_B_15_00"); //Weiß nicht.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_02_B_12_01"); //Aber, aber. Du musst noch viel lernen.
	
	Info_Mod_Elena_Hexenparty_02_C();
};

FUNC VOID Info_Mod_Elena_Hexenparty_02_A()
{
	AI_Output(hero, self, "Info_Mod_Elena_Hexenparty_02_A_15_00"); //Ja, gewiss.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_02_A_12_01"); //Das will ich meinen.
	
	Info_Mod_Elena_Hexenparty_02_C();
};

INSTANCE Info_Mod_Elena_Hexenparty_03 (C_INFO)
{
	npc		= Mod_783_BAU_Elena_NW;
	nr		= 1;
	condition	= Info_Mod_Elena_Hexenparty_03_Condition;
	information	= Info_Mod_Elena_Hexenparty_03_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe die Spruchrolle angewendet.";
};

FUNC INT Info_Mod_Elena_Hexenparty_03_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Elena_Hexenparty_02))
	&& (Mod_WM_HexenHagel > 0)
	&& (Mod_TrfWoman == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Elena_Hexenparty_03_Info()
{
	AI_Output(hero, hero, "Info_Mod_Elena_Hexenparty_03_15_00"); //Ich habe die Spruchrolle angewendet.

	if (Mod_WM_HexenHagel == 1)
	{
		AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_03_12_01"); //Ausgezeichnet. Das hat wieder für zauberhafte Unruhe auf dem Hof gesorgt.

		B_GivePlayerXP	(250);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_03_12_02"); //Aber ohne die gewünschte Wirkung. Sehr enttäuschend, meine Schwester.
		AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_03_12_03"); //Wenn du dir noch mehr Fehler dieser Art erlaubst, werden wir dich irgendwann noch für deine Unfähigkeit bestrafen müssen.
	};

	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_03_12_04"); //So, bevor wir dich in unsere Schwesternschaft aufnehmen, musst du noch die Macht jener Zauber erlernen, die ihre Opfer beeinflussen.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_03_12_05"); //Nimm diese Spruchrolle der Beeinflussung, wende sie an und sprich danach mit Torlof.

	B_GiveInvItems	(self, hero, ItSc_Beeinflussung, 1);

	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_03_12_06"); //Bring ihn dazu, sich unmöglich vor den anderen Söldnern zu verhalten.

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Nun soll ich noch Torlof mit der Spruchrolle der Beeinflussung dazu bringen, unmögliche Dinge zu tun.");
};

INSTANCE Info_Mod_Elena_Hexenparty_04 (C_INFO)
{
	npc		= Mod_783_BAU_Elena_NW;
	nr		= 1;
	condition	= Info_Mod_Elena_Hexenparty_04_Condition;
	information	= Info_Mod_Elena_Hexenparty_04_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Elena_Hexenparty_04_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Elena_Hexenparty_03))
	&& (Npc_KnowsInfo(hero, Info_Mod_Torlof_Hexen))
	&& (Mod_TrfWoman == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Elena_Hexenparty_04_Info()
{
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_04_12_00"); //Das hast du großartig gemacht. Es hätte jeder von uns zur Ehre gereicht. Was für ein Spaß!
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_04_12_01"); //Damit hast du der Moral der Söldner geschadet und ein würdiges Zeugnis deiner magischen Künste, wie auch deines listenreichen Verstandes abgegeben.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_04_12_02"); //Nun bist du bereit, eine von uns zu werden. Komm bei Nacht in unser Versteck.

	B_GivePlayerXP	(250);

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Verquer. Meine Schwestern ... ähh, die Hexen wollen mich doch tatsächlich in ihre Gemeinschaft aufnehmen. Bei Nacht soll ich sie in der Höhle aufsuchen.");
};

INSTANCE Info_Mod_Elena_Hexenparty_05 (C_INFO)
{
	npc		= Mod_783_BAU_Elena_NW;
	nr		= 1;
	condition	= Info_Mod_Elena_Hexenparty_05_Condition;
	information	= Info_Mod_Elena_Hexenparty_05_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Elena_Hexenparty_05_Condition()
{
	if (Mod_TrfWoman == 1)
	&& (Npc_GetDistToWP(hero, "NW_BIGFARM_FOREST_08") < 1000)
	&& (Npc_KnowsInfo(hero, Info_Mod_Elena_Hexenparty_04))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Elena_Hexenparty_05_Info()
{
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_05_12_00"); //So, Schwestern. Nun haben wir uns hier versammelt, einer neuen Anwärterin ihre dämonische Weihe zu geben.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_05_12_01"); //(zum Helden) Ja, meine Schwester, dir werden sich nun ganz neue Türen öffnen, die Macht, deine Umgebung zu beeinflussen und zu verheeren.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_05_12_02"); //Ohne Zweifel hast du schon die Ungetüme bemerkt, die in der Umgebung entstanden sind. Sie stehen zum großen Teil unter unserer Kontrolle.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_05_12_03"); //Unsere Verbündeten des Blutkults mögen zwar die Macht absorbiert haben, um diese zu erschaffen. Ohne unseren Einfluss könnten sie diese Kreaturen jedoch nie unter solcher Kontrolle halten.
	
	Info_ClearChoices	(Info_Mod_Elena_Hexenparty_05);

	Info_AddChoice	(Info_Mod_Elena_Hexenparty_05, "Lass uns mit dem Ritual beginnen.", Info_Mod_Elena_Hexenparty_05_B);
	Info_AddChoice	(Info_Mod_Elena_Hexenparty_05, "Blutkult?", Info_Mod_Elena_Hexenparty_05_A);
};

FUNC VOID Info_Mod_Elena_Hexenparty_05_C()
{
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_05_C_12_00"); //Schwestern, lasst uns nun in Meditation verfallen, unsere Kräfte sammeln, um ein neues Mitglied in unsere Gemeinschaft aufzunehmen und ihm den Teil dämonischer Macht zukommen zu lassen, der ihm zusteht.
	
	Info_ClearChoices	(Info_Mod_Elena_Hexenparty_05);

	AI_StopProcessInfos	(self);

	Mod_WM_Hexenritual = 1;
};

FUNC VOID Info_Mod_Elena_Hexenparty_05_B()
{
	AI_Output(hero, self, "Info_Mod_Elena_Hexenparty_05_B_15_00"); //Lass uns mit dem Ritual beginnen.
	
	Info_Mod_Elena_Hexenparty_05_C();
};

FUNC VOID Info_Mod_Elena_Hexenparty_05_A()
{
	AI_Output(hero, self, "Info_Mod_Elena_Hexenparty_05_A_15_00"); //Blutkult?
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_05_A_12_01"); //Eine uralte Bruderschaft. Einer ihrer Clans hat vor einiger Zeit Kontakt zu uns aufgenommen und das Bündnis mit uns geschlossen, auf dass wir mit vereinten Kräften alles ins Chaos stürzen.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_05_A_12_02"); //Sie haben ihr Refugium in der Nähe des Weidenplateaus.

	if (Npc_KnowsInfo(hero, Info_Mod_AttraktiveFrau_Sex))
	{
		AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_05_A_12_03"); //Ja, die Taverne beim Weidenplateau ... da habe ich die köstliche Lebenskraft eines Mannes in mich aufgesogen, der von besonderer Art war.
		AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_05_A_12_04"); //Wie dem auch sei, beginnen wir mit dem Ritual.
	};

	Mod_WM_Blutkultinfos = 1;
	
	Info_Mod_Elena_Hexenparty_05_C();
};

INSTANCE Info_Mod_Elena_Hexenparty_06 (C_INFO)
{
	npc		= Mod_783_BAU_Elena_NW;
	nr		= 1;
	condition	= Info_Mod_Elena_Hexenparty_06_Condition;
	information	= Info_Mod_Elena_Hexenparty_06_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Elena_Hexenparty_06_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Elena_Hexenparty_05))
	&& (Mod_WM_Hexenritual == 2)
	&& (Mod_TrfWoman == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Elena_Hexenparty_06_Info()
{
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_06_12_00"); //(benommen) Was, wie ... Schwestern, wir wurden hereingelegt.

	Mod_HexenAttack = 1;

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Elena_Hexenparty_10 (C_INFO)
{
	npc		= Mod_783_BAU_Elena_NW;
	nr		= 1;
	condition	= Info_Mod_Elena_Hexenparty_10_Condition;
	information	= Info_Mod_Elena_Hexenparty_10_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Elena_Hexenparty_10_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Elena_Hexenparty_01))
	&& (Mod_WM_HexenVerwandlung < 2)
	&& (Mod_WM_IsWarg == 0)
	&& (Npc_RefuseTalk(self) == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Elena_Hexenparty_10_Info()
{
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_10_12_00"); //Was soll das? Nimm deine Tiergestalt wieder an und verrichte, was dir aufgetragen wurde.

	AI_StopProcessInfos	(self);

	Npc_SetRefuseTalk (self, 10);
};

INSTANCE Info_Mod_Elena_Trade (C_INFO)
{
	npc		= Mod_783_BAU_Elena_NW;
	nr		= 1;
	condition	= Info_Mod_Elena_Trade_Condition;
	information	= Info_Mod_Elena_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Elena_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Elena_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Elena_Trade_Info()
{
	B_GiveTradeInv	(self);
	B_Say	(hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Elena_Pickpocket (C_INFO)
{
	npc		= Mod_783_BAU_Elena_NW;
	nr		= 1;
	condition	= Info_Mod_Elena_Pickpocket_Condition;
	information	= Info_Mod_Elena_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60_Female;
};

FUNC INT Info_Mod_Elena_Pickpocket_Condition()
{
	C_Beklauen	(34, ItFo_Apple, 2);
};

FUNC VOID Info_Mod_Elena_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Elena_Pickpocket);

	Info_AddChoice	(Info_Mod_Elena_Pickpocket, DIALOG_BACK, Info_Mod_Elena_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Elena_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Elena_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Elena_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Elena_Pickpocket);
};

FUNC VOID Info_Mod_Elena_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Elena_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Elena_Pickpocket);

		Info_AddChoice	(Info_Mod_Elena_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Elena_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Elena_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Elena_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Elena_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Elena_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Elena_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Elena_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Elena_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Elena_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Elena_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Elena_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Elena_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Elena_EXIT (C_INFO)
{
	npc		= Mod_783_BAU_Elena_NW;
	nr		= 1;
	condition	= Info_Mod_Elena_EXIT_Condition;
	information	= Info_Mod_Elena_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Elena_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Elena_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};