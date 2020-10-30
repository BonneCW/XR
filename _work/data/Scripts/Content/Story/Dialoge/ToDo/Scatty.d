INSTANCE Info_Mod_Scatty_Hi (C_INFO)
{
	npc		= Mod_962_STT_Scatty_MT;
	nr		= 1;
	condition	= Info_Mod_Scatty_Hi_Condition;
	information	= Info_Mod_Scatty_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Scatty_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Scatty_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Scatty_Hi_01_00"); //Du bist doch der Kerl, der damals fast unser Ende besiegelt hätte!

	Log_CreateTopic	(TOPIC_MOD_ALTESLAGER, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_ALTESLAGER, "Am Eingang des alten Lagers wurde ich von meinem alten Freund Scatty begrüßt. Anscheinend gibt es das alte Lager immer noch.");

	B_StartOtherRoutine	(self, "START");

	Info_ClearChoices	(Info_Mod_Scatty_Hi);

	Info_AddChoice	(Info_Mod_Scatty_Hi, "Reg dich ab, ihr habt doch überlebt, oder?", Info_Mod_Scatty_Hi_C);
	Info_AddChoice	(Info_Mod_Scatty_Hi, "Wenn du ein Problem hast, dann komm doch her.", Info_Mod_Scatty_Hi_B);
	Info_AddChoice	(Info_Mod_Scatty_Hi, "Es war nötig, außer ihr hattet vor alle zu sterben.", Info_Mod_Scatty_Hi_A);
};

FUNC VOID Info_Mod_Scatty_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Scatty_Hi_A_15_00"); //Es war nötig, außer ihr hattet vor alle zu sterben.
	AI_Output(self, hero, "Info_Mod_Scatty_Hi_A_01_01"); //Dann erklär mir doch mal, was nötig war.
	AI_Output(hero, self, "Info_Mod_Scatty_Hi_A_15_02"); //Wenn ich nicht gewesen wäre, dann wäre der Schläfer erwacht und dann würden wir uns hier nicht mehr unterhalten.
	AI_Output(self, hero, "Info_Mod_Scatty_Hi_A_01_03"); //Ja, die Sektenspinner haben etwas in der Richtung erzählt, aber die erzählen viel, wenn es viel Sumpfkraut gibt.
	AI_Output(self, hero, "Info_Mod_Scatty_Hi_A_01_04"); //Jemanden, der so einen Kampf überstanden hat, können wir gut brauchen.

	Scatty_Start_DIA = 1;

	Info_ClearChoices	(Info_Mod_Scatty_Hi);
};

FUNC VOID Info_Mod_Scatty_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Scatty_Hi_B_15_00"); //Wenn du ein Problem hast, dann komm doch her.
	AI_Output(self, hero, "Info_Mod_Scatty_Hi_B_01_01"); //Das lasse ich mir nicht zweimal sagen, komm her, Arschloch.

	Scatty_Start_DIA = 2;

	Info_ClearChoices	(Info_Mod_Scatty_Hi);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_NONE, 0);
};

FUNC VOID Info_Mod_Scatty_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_Scatty_Hi_C_15_00"); //Reg dich ab, ihr habt doch überlebt, oder?
	AI_Output(self, hero, "Info_Mod_Scatty_Hi_C_01_01"); //Soll das ein Witz sein? Sieh dir das Lager doch mal an, dann wirst du schon sehen, wie es uns ergangen ist.
	AI_Output(hero, self, "Info_Mod_Scatty_Hi_C_15_02"); //Muss ich erwähnen, dass ihr es nicht anders verdient habt?
	AI_Output(self, hero, "Info_Mod_Scatty_Hi_C_01_03"); //Ja, ich weiß. Aber das alte Lager ist das einzige, was wir noch haben. Auch wenn es viele Arschlöcher gibt, aber wir können nur damit leben.

	Scatty_Start_DIA = 3;

	Info_ClearChoices	(Info_Mod_Scatty_Hi);
};

INSTANCE Info_Mod_Scatty_Umgehauen (C_INFO)
{
	npc		= Mod_962_STT_Scatty_MT;
	nr		= 1;
	condition	= Info_Mod_Scatty_Umgehauen_Condition;
	information	= Info_Mod_Scatty_Umgehauen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Scatty_Umgehauen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Scatty_Hi))
	&& (Scatty_Start_DIA == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scatty_Umgehauen_Info()
{
	if (self.aivar[AIV_LastPlayerAR] == AR_NONE) //Kampf aus Dialog heraus.
	{
		if (B_GetAivar(self, AIV_LastFightAgainstPlayer) == FIGHT_LOST)
		{
			AI_Output(self, hero, "Info_Mod_Scatty_Umgehauen_01_00"); //Oh, mein armer Schädel.
			AI_Output(hero, self, "Info_Mod_Scatty_Umgehauen_15_01"); //Na, ich denke du weißt, dass man sich keine Probleme mit mir einhandelt.
			AI_Output(self, hero, "Info_Mod_Scatty_Umgehauen_01_02"); //Verdammt, du bist anscheinend immer noch ein guter Kämpfer. Jemanden wie dich können wir brauchen.

			Scatty_Start_DIA = 4;
		}
		else if (B_GetAivar(self, AIV_LastFightAgainstPlayer) == FIGHT_WON)
		{
			AI_Output(self, hero, "Info_Mod_Scatty_Umgehauen_01_03"); //Bist wohl doch nur ein Großmaul.
			AI_Output(hero, self, "Info_Mod_Scatty_Umgehauen_01_04"); //Vielleicht kannst du uns trotzdem helfen.
		};
							
		// ------ In jedem Fall: Arena-Kampf abgeschlossen ------
		self.aivar[AIV_ArenaFight] = AF_NONE;
		
		// ------ AIVAR resetten! ------	
		self.aivar[AIV_LastFightComment] = TRUE;
	};
};

INSTANCE Info_Mod_Scatty_Hilfe (C_INFO)
{
	npc		= Mod_962_STT_Scatty_MT;
	nr		= 1;
	condition	= Info_Mod_Scatty_Hilfe_Condition;
	information	= Info_Mod_Scatty_Hilfe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Warum sollte ich euch helfen?";
};

FUNC INT Info_Mod_Scatty_Hilfe_Condition()
{
	if ((Scatty_Start_DIA == 3)
	|| (Scatty_Start_DIA == 1)
	|| (Scatty_Start_DIA == 4))
	&& (Mod_Gilde > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scatty_Hilfe_Info()
{
	AI_Output(hero, self, "Info_Mod_Scatty_Hilfe_15_00"); //Warum sollte ich euch helfen?
	AI_Output(self, hero, "Info_Mod_Scatty_Hilfe_01_01"); //Wir haben ein Problem und du warst einmal bei uns. Und du hast sicher nicht vergessen, dass wir zusammenhalten.
	AI_Output(hero, self, "Info_Mod_Scatty_Hilfe_15_02"); //Habt ihr vielleicht mir geholfen? Haben wir etwa zusammengehalten, als ihr mich alle umbringen wolltet?
	AI_Output(self, hero, "Info_Mod_Scatty_Hilfe_01_03"); //Wir dachten, du hast uns verraten. Wenn du mit dem neuen Lager paktierst, bist du für uns ein Verräter.

	B_StartOtherRoutine	(self, "START");

	B_LogEntry	(TOPIC_MOD_ALTESLAGER, "Anscheinend sind sie immer noch so gut drauf wie beim letzten Mal, das kann ja lustig werden. Aber diesmal haben sie die Probleme. Und sie kommen mit dem 'Du warst mal einer von uns' Spruch. Ob es wohl klug wäre, ihnen zu helfen?");

	Info_ClearChoices	(Info_Mod_Scatty_Hilfe);

	Info_AddChoice	(Info_Mod_Scatty_Hilfe, "Steckt euch eure Probleme sonst wo hin, ihr dreckigen Verräter!", Info_Mod_Scatty_Hilfe_B);

	if (Mod_AnzahlNebengilden < MaxNebengilden)
	{
		Info_AddChoice	(Info_Mod_Scatty_Hilfe, "Was soll ich für euch tun?", Info_Mod_Scatty_Hilfe_A);
	};
};

FUNC VOID Info_Mod_Scatty_Hilfe_A()
{
	AI_Output(hero, self, "Info_Mod_Scatty_Hilfe_A_15_00"); //Was soll ich für euch tun?
	AI_Output(self, hero, "Info_Mod_Scatty_Hilfe_A_01_01"); //Nun, wir existieren hauptsächlich durch die Arenakämpfe. Nun, leider gewinnen immer weniger Kämpfer für unser Lager, also nehmen wir nichts mehr ein.
	AI_Output(hero, self, "Info_Mod_Scatty_Hilfe_A_15_02"); //Und welche Rolle spiele ich dabei?
	AI_Output(self, hero, "Info_Mod_Scatty_Hilfe_A_01_03"); //Nun, du könntest für das alte Lager in der Arena kämpfen. Und sonstige Sachen bezüglich der Arena regeln.
	AI_Output(hero, self, "Info_Mod_Scatty_Hilfe_A_15_04"); //Verstehe, wo soll ich mich anmelden?
	AI_Output(self, hero, "Info_Mod_Scatty_Hilfe_A_01_05"); //Für alles, was mit der Verwaltung des Lagers zusammenhängt, ist der Erzbaron Bartholo zuständig.
	AI_Output(hero, self, "Info_Mod_Scatty_Hilfe_A_15_06"); //(ironisch) Die Erzbarone werden sich sicher freuen, mich wieder zu sehen.
	AI_Output(self, hero, "Info_Mod_Scatty_Hilfe_A_01_07"); //Ich glaube kaum, dass sie dich töten werden, ohne dich anzuhören. Schließlich sind sie in einer Lage, in der sie über jeden froh sein können.
	AI_Output(hero, self, "Info_Mod_Scatty_Hilfe_A_15_08"); //Sehr beruhigend.

	B_LogEntry	(TOPIC_MOD_ALTESLAGER, "Ich habe mich also entschlossen, ihnen zu helfen. Ich soll für sie in der Arena kämpfen und andere Sachen 'regeln', da kann ich ja gespannt sein. Ich hoffe, das werde ich nicht bereuen. Scatty meinte, ich soll mit Bartholo reden. Der wird sich freuen mich wiederzusehen.");

	Scatty_Start_DIA = 5;

	Info_ClearChoices	(Info_Mod_Scatty_Hilfe);	
};

FUNC VOID Info_Mod_Scatty_Hilfe_B()
{
	AI_Output(hero, self, "Info_Mod_Scatty_Hilfe_B_15_00"); //Steckt euch eure Probleme sonst wo hin, ihr dreckigen Verräter!
	AI_Output(self, hero, "Info_Mod_Scatty_Hilfe_B_01_01"); //Gut, dann verschwinde gefälligst!

	B_LogEntry	(TOPIC_MOD_ALTESLAGER, "Ich habe mich dazu entschlossen, das alte Lager seinem Schicksal zu überlassen.");
	B_SetTopicStatus	(TOPIC_MOD_ALTESLAGER, LOG_FAILED);

	Info_ClearChoices	(Info_Mod_Scatty_Hilfe);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Scatty_ArenaFight (C_INFO)
{
	npc		= Mod_962_STT_Scatty_MT;
	nr		= 1;
	condition	= Info_Mod_Scatty_ArenaFight_Condition;
	information	= Info_Mod_Scatty_ArenaFight_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Scatty_ArenaFight_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorus_Arena))
	&& (Wld_IsTime(08,00,23,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scatty_ArenaFight_Info()
{
	AI_Output(self, hero, "Info_Mod_Scatty_ArenaFight_01_00"); //Werte Mitglieder unseres Lagers und der anderen Lager, heute findet ein Kampf zwischen dem ungeschlagenen Unbekannten und dem angehenden Templer Gor Karanto statt. Die Wetten sind platziert.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_7384_OUT_Dragan_MT, "KAMPF");

	B_Attack	(Mod_1871_TPL_GorKaranto_MT, Mod_1872_NONE_Unbekannt_MT, AR_NONE, 0);

	Wld_SendTrigger	("ARENAKAMERA");
};

INSTANCE Info_Mod_Scatty_WannaFightUB (C_INFO)
{
	npc		= Mod_962_STT_Scatty_MT;
	nr		= 1;
	condition	= Info_Mod_Scatty_WannaFightUB_Condition;
	information	= Info_Mod_Scatty_WannaFightUB_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich will gegen den Unbekannten kämpfen!";
};

FUNC INT Info_Mod_Scatty_WannaFightUB_Condition()
{
	if (Mod_GorKarantoSchwach == 2)
	&& (Wld_IsTime(08,00,23,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scatty_WannaFightUB_Info()
{
	AI_Output(hero, self, "Info_Mod_Scatty_WannaFightUB_15_00"); //Ich will gegen den Unbekannten kämpfen!
	AI_Output(self, hero, "Info_Mod_Scatty_WannaFightUB_01_01"); //Gut, hast du nun also doch Lust zu kämpfen. Ich besorge dir einen Kampf mit ihm.
	AI_Output(hero, self, "Info_Mod_Scatty_WannaFightUB_15_02"); //Trage mich auf den Namen ...
	AI_Output(self, hero, "Info_Mod_Scatty_WannaFightUB_01_03"); //Schon gut, Namen sind nicht wichtig. Ich glaube, es würde zu deinem Stil passen, wenn dein Name nicht erwähnt wird.
	AI_Output(hero, self, "Info_Mod_Scatty_WannaFightUB_15_04"); //Dann will ich kämpfen.
	AI_Output(self, hero, "Info_Mod_Scatty_WannaFightUB_01_05"); //Geh in die Arena, der Unbekannte wird dich erwarten.

	B_StartOtherRoutine	(Mod_1872_NONE_Unbekannt_MT, "ARENAFIGHT");

	B_StartOtherRoutine	(Mod_7384_OUT_Dragan_MT, "KAMPF");

	Mod_1872_NONE_Unbekannt_MT.attribute[ATR_HITPOINTS] = Mod_1872_NONE_Unbekannt_MT.attribute[ATR_HITPOINTS_MAX];

	Mod_GorKarantoSchwach = 3;
};

INSTANCE Info_Mod_Scatty_WannaFightUB_AK (C_INFO)
{
	npc		= Mod_962_STT_Scatty_MT;
	nr		= 1;
	condition	= Info_Mod_Scatty_WannaFightUB_AK_Condition;
	information	= Info_Mod_Scatty_WannaFightUB_AK_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Scatty_WannaFightUB_AK_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Scatty_WannaFightUB))
	&& (Wld_IsTime(08,00,23,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scatty_WannaFightUB_AK_Info()
{
	AI_Output(self, hero, "Info_Mod_Scatty_WannaFightUB_AK_01_00"); //Der ungeschlagene Unbekannte kämpft gegen den namenlosen Kämpfer der Garde. Die Wetten sind platziert.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Scatty_WannaFightUB_2 (C_INFO)
{
	npc		= Mod_962_STT_Scatty_MT;
	nr		= 1;
	condition	= Info_Mod_Scatty_WannaFightUB_2_Condition;
	information	= Info_Mod_Scatty_WannaFightUB_2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich will noch mal gegen den Unbekannten kämpfen.";
};

FUNC INT Info_Mod_Scatty_WannaFightUB_2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorus_Botschaft))
	&& (Wld_IsTime(08,00,23,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scatty_WannaFightUB_2_Info()
{
	AI_Output(hero, self, "Info_Mod_Scatty_WannaFightUB_2_15_00"); //Ich will noch mal gegen den Unbekannten kämpfen.
	AI_Output(self, hero, "Info_Mod_Scatty_WannaFightUB_2_01_01"); //Gut, geh in die Arena, der Unbekannte wird dich erwarten.

	B_StartOtherRoutine	(Mod_1872_NONE_Unbekannt_MT, "ARENAFIGHT");

	B_StartOtherRoutine	(Mod_7384_OUT_Dragan_MT, "KAMPF");

	Mod_1872_NONE_Unbekannt_MT.attribute[ATR_HITPOINTS] = Mod_1872_NONE_Unbekannt_MT.attribute[ATR_HITPOINTS_MAX];

	Mod_GorKarantoSchwach = 8;
};

INSTANCE Info_Mod_Scatty_WannaFightUB_AK_2 (C_INFO)
{
	npc		= Mod_962_STT_Scatty_MT;
	nr		= 1;
	condition	= Info_Mod_Scatty_WannaFightUB_AK_2_Condition;
	information	= Info_Mod_Scatty_WannaFightUB_AK_2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Scatty_WannaFightUB_AK_2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Scatty_WannaFightUB_2))
	&& (Wld_IsTime(08,00,23,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scatty_WannaFightUB_AK_2_Info()
{
	AI_Output(self, hero, "Info_Mod_Scatty_WannaFightUB_AK_2_01_00"); //Der ungeschlagene Unbekannte kämpft gegen den namenlosen Kämpfer der Garde. Die Wetten sind platziert.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Scatty_UB_Besiegt (C_INFO)
{
	npc		= Mod_962_STT_Scatty_MT;
	nr		= 1;
	condition	= Info_Mod_Scatty_UB_Besiegt_Condition;
	information	= Info_Mod_Scatty_UB_Besiegt_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe den Unbekannten Kämpfer besiegt.";
};

FUNC INT Info_Mod_Scatty_UB_Besiegt_Condition()
{
	if (Mod_GorKarantoSchwach == 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scatty_UB_Besiegt_Info()
{
	AI_Output(hero, self, "Info_Mod_Scatty_UB_Besiegt_15_00"); //Ich habe den Unbekannten Kämpfer besiegt.
	AI_Output(self, hero, "Info_Mod_Scatty_UB_Besiegt_01_01"); //Sehr gut, endlich mal wieder einer von unseren Kämpfern, der gewonnen hat.
	AI_Output(self, hero, "Info_Mod_Scatty_UB_Besiegt_01_02"); //Hier hast du deinen Anteil an den Einnahmen.

	B_GiveInvItems	(self, hero, ItMi_Gold, 250);

	B_GivePlayerXP	(250);

	B_StartOtherRoutine	(self, "START");

	Mod_GorKarantoSchwach = 11;
};

INSTANCE Info_Mod_Scatty_AboutSabitsch (C_INFO)
{
	npc		= Mod_962_STT_Scatty_MT;
	nr		= 1;
	condition	= Info_Mod_Scatty_AboutSabitsch_Condition;
	information	= Info_Mod_Scatty_AboutSabitsch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie läuft so das Wettgeschäft.";
};

FUNC INT Info_Mod_Scatty_AboutSabitsch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dexter_TimeOver))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scatty_AboutSabitsch_Info()
{
	AI_Output(hero, self, "Info_Mod_Scatty_AboutSabitsch_15_00"); //Wie läuft so das Wettgeschäft.
	AI_Output(self, hero, "Info_Mod_Scatty_AboutSabitsch_01_01"); //Miserabel. Dieser neue Kämpfer, Sabitsch ist sein Name, ruiniert mir das ganze Wettgeschäft.
	AI_Output(self, hero, "Info_Mod_Scatty_AboutSabitsch_01_02"); //Er hat bislang jeden Kampf für sich entscheiden können, ohne, dass seine Gegner jemals eine echte Chance gehabt hätten.
	AI_Output(self, hero, "Info_Mod_Scatty_AboutSabitsch_01_03"); //Sogar so einen Typen in dunkler Kutte, der eigentlich jeden Gegner nach einigen Sekunden in den Staub schickte, hat er mit einem Schlag umgehauen.
	AI_Output(self, hero, "Info_Mod_Scatty_AboutSabitsch_01_04"); //Zum Glück kämpft er nicht jeden Tag, sondern nur wenn sich ein Gegner findet, der bereit ist einen hohen Wetteinsatz zu zahlen.
	AI_Output(self, hero, "Info_Mod_Scatty_AboutSabitsch_01_05"); //Und das werden, was mich hoffen lässt, immer weniger.
	AI_Output(hero, self, "Info_Mod_Scatty_AboutSabitsch_15_06"); //Was ist so besonderes an diesem Kämpfer?
	AI_Output(self, hero, "Info_Mod_Scatty_AboutSabitsch_01_07"); //Er muss unglaubliche Kraft besitzen, da er die schwerste Axt mit höchstem Geschick schwingen kann.
	AI_Output(self, hero, "Info_Mod_Scatty_AboutSabitsch_01_08"); //Selbst die stärksten Kerle, denen ich bisher begegnete, konnten so eine Waffe nur mit Mühe anlegen und führen.
	AI_Output(self, hero, "Info_Mod_Scatty_AboutSabitsch_01_09"); //Da ist es umso überraschender, dass so ein Typ sich für Schmuck begeistert und den ganzen Tag behangen mit Amuletten und Ringen herumläuft, wie ein eitles Kaufmannsweib.
	AI_Output(self, hero, "Info_Mod_Scatty_AboutSabitsch_01_10"); //Erst nachts habe ich gesehen - er hat seine Hütte nämlich ziemlich nahe meiner Arena – wie er zumindest einen Teil seines Krempels in der Truhe verstaut, seine schwere Rüstung ablegt und sich stattdessen in eine angenehme Bürgerkleidung hüllt, bevor er sich zur Nachtruhe begibt.
	AI_Output(self, hero, "Info_Mod_Scatty_AboutSabitsch_01_11"); //Schon komisch der Typ, aber ein guter Freund von Thorus, wie ich mitbekommen habe.

	B_LogEntry	(TOPIC_MOD_BDT_ORKS, "Scatty meinte, dass Sabitsch ein unglaublich starker Kämpfer sein müsse, um seine Waffe zu führen. Außerdem trägt Sabitsch den ganzen Tag über Schmuck, welchen er nur nachts zum Teil  ablegt und in seiner Truhe verstaut, um sich anschließend in Bürgerkleidung schlafen zu legen. Seine Hütte finde ich bei der Arena.");
};

INSTANCE Info_Mod_Scatty_SabitschTot (C_INFO)
{
	npc		= Mod_962_STT_Scatty_MT;
	nr		= 1;
	condition	= Info_Mod_Scatty_SabitschTot_Condition;
	information	= Info_Mod_Scatty_SabitschTot_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Scatty_SabitschTot_Condition()
{
	if (Mod_SabitschTot == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scatty_SabitschTot_Info()
{
	AI_Output(self, hero, "Info_Mod_Scatty_SabitschTot_01_00"); //So spät abends noch unterwegs?
	AI_Output(self, hero, "Info_Mod_Scatty_SabitschTot_01_01"); //Naja, ich wollte mir gerade auch noch einen grünen Novizen genehmigen.

	Mod_SabitschTotPetze = 1;
};

INSTANCE Info_Mod_Scatty_SlyArena (C_INFO)
{
	npc		= Mod_962_STT_Scatty_MT;
	nr		= 1;
	condition	= Info_Mod_Scatty_SlyArena_Condition;
	information	= Info_Mod_Scatty_SlyArena_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hat sich Sly schon bei dir gemeldet?";
};

FUNC INT Info_Mod_Scatty_SlyArena_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sly_Arena5))
	&& (Wld_IsTime(08,00,16,00))
	&& (Kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scatty_SlyArena_Info()
{
	AI_Output(hero, self, "Info_Mod_Scatty_SlyArena_15_00"); //Hat sich Sly schon bei dir gemeldet?
	AI_Output(self, hero, "Info_Mod_Scatty_SlyArena_01_01"); //Klaro. Ich bin mal gespannt, wie sich der Grünschnabel schlägt. Bisher ist er mir ja nur durch sein Saufen aufgefallen.
	AI_Output(hero, self, "Info_Mod_Scatty_SlyArena_15_02"); //Gibt es schon einen Termin für seinen ersten Kampf?
	AI_Output(self, hero, "Info_Mod_Scatty_SlyArena_01_03"); //Jo. Nachher um 17 Uhr tritt er gegen Gor Karanto an. Das wird ein harter Kampf, sag ich mal.
};

INSTANCE Info_Mod_Scatty_Kap4 (C_INFO)
{
	npc		= Mod_962_STT_Scatty_MT;
	nr		= 1;
	condition	= Info_Mod_Scatty_Kap4_Condition;
	information	= Info_Mod_Scatty_Kap4_Info;
	permanent	= 0;
	important	= 0;
	description	= "Scatty? Du hier?";
};

FUNC INT Info_Mod_Scatty_Kap4_Condition()
{
	if (Kapitel >= 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scatty_Kap4_Info()
{
	AI_Output(hero, self, "Info_Mod_Scatty_Kap4_15_00"); //Scatty? Du hier?
	AI_Output(self, hero, "Info_Mod_Scatty_Kap4_01_01"); //(griesgrämig) Na, wo soll ich denn sonst sein?
	AI_Output(self, hero, "Info_Mod_Scatty_Kap4_01_02"); //Als Leiche im Alten Lager vielleicht, als Fraß für die Orkhunde?
	AI_Output(hero, self, "Info_Mod_Scatty_Kap4_15_03"); //Genau genommen ... ja.
	AI_Output(self, hero, "Info_Mod_Scatty_Kap4_01_04"); //Ahh, verarschen kann ich mich selbst.
	AI_Output(hero, self, "Info_Mod_Scatty_Kap4_15_05"); //Was ist passiert?
	AI_Output(self, hero, "Info_Mod_Scatty_Kap4_01_06"); //Ach, als diese dreckigen Orks ins Lager einfielen habe ich mir gerade ein Bier vor der Arena gegönnt.
	AI_Output(self, hero, "Info_Mod_Scatty_Kap4_01_07"); //Ich hörte das Geschrei und ehe ich mich versah, kam schon 'ne Horde Orks auf mich zu gerannt.
	AI_Output(self, hero, "Info_Mod_Scatty_Kap4_01_08"); //Nach kurzem Kampf erkannte ich, dass es hoffnungslos war und lief in die andere Richtung zum Hinterausgang.
	AI_Output(self, hero, "Info_Mod_Scatty_Kap4_01_09"); //Dort versuchte ich mit den Wachen das Tor zu öffnen, während wir uns gleichzeitig gegen einige von den grünen Bastarden zu wehr setzen mussten.
	AI_Output(self, hero, "Info_Mod_Scatty_Kap4_01_10"); //Mit letzter Mühe gelang es mir noch ... die beiden anderen Jungs haben jedoch ins Gras gebissen.
	AI_Output(self, hero, "Info_Mod_Scatty_Kap4_01_11"); //Als ich dann draußen herumlief überlegte ich mir wohin.
	AI_Output(self, hero, "Info_Mod_Scatty_Kap4_01_12"); //Ich dachte mir: "Hey, die Jungs von den Sumpffritzen haben doch immer in der Arena gezeigt, aus welchem Holz sie geschnitzt sind.
	AI_Output(self, hero, "Info_Mod_Scatty_Kap4_01_13"); //So einen wie mich können die bei den Templern bestimmt gut gebrauchen."
	AI_Output(self, hero, "Info_Mod_Scatty_Kap4_01_14"); //Tja, und was ist jetzt? Ich darf auf die Novizen bei der Ernte aufpassen.
	AI_Output(self, hero, "Info_Mod_Scatty_Kap4_01_15"); //Ich weiß echt nicht, was ich hier soll ...

	if (Npc_KnowsInfo(hero, Info_Mod_Fisk_NW_Hi))
	&& (Mod_Fisk_LeiseHoffnung == 0)
	{
		B_LogEntry	(TOPIC_MOD_LEISEHOFFNUNG, "Ich habe Scatty im Sumpflager getroffen, wo er Aufpasser spielen darf.");
	};

	Info_ClearChoices	(Info_Mod_Scatty_Kap4);

	Info_AddChoice	(Info_Mod_Scatty_Kap4, "Zumindest passt die Frisur jetzt.", Info_Mod_Scatty_Kap4_B);
	Info_AddChoice	(Info_Mod_Scatty_Kap4, "Das wird schon wieder.", Info_Mod_Scatty_Kap4_A);
};

FUNC VOID Info_Mod_Scatty_Kap4_B()
{
	AI_Output(hero, self, "Info_Mod_Scatty_Kap4_B_15_00"); //Zumindest passt die Frisur jetzt.
	AI_Output(self, hero, "Info_Mod_Scatty_Kap4_B_01_01"); //(wütend) Was?! Mach das du Land gewinnst, bevor der Blitz dich beim Kacken trifft ...

	Info_ClearChoices	(Info_Mod_Scatty_Kap4);
};

FUNC VOID Info_Mod_Scatty_Kap4_A()
{
	AI_Output(hero, self, "Info_Mod_Scatty_Kap4_A_15_00"); //Das wird schon wieder.
	AI_Output(self, hero, "Info_Mod_Scatty_Kap4_A_01_01"); //Ach, der Spruch hilft mir jetzt auch nicht weiter.
	AI_Output(self, hero, "Info_Mod_Scatty_Kap4_A_01_02"); //Und jetzt geh ... ich muss aufpassen, dass ja kein Novize gefressen wird ... sonst gibt’s saures vom Baal ... wie auch immer, Schlag-mich-tot.

	Info_ClearChoices	(Info_Mod_Scatty_Kap4);
};

// ------------------------------------------------------------
// 			  				CANYOUTEACH 
// ------------------------------------------------------------ 

INSTANCE Info_Mod_Scatty_CanYouTeach   (C_INFO) 
{ 
	npc     	= Mod_962_STT_Scatty_MT; 
	nr          = 1; 
	condition   = Info_Mod_Scatty_CanYouTeach_Condition; 
	information = Info_Mod_Scatty_CanYouTeach_Info; 
	important   = FALSE; 
	permanent   = FALSE; 
	description = "Trainierst du noch Kämpfer?"; 
}; 
 
FUNC INT Info_Mod_Scatty_CanYouTeach_Condition () 
{ 
	//Bedingung nochmal checken? Scatty_Start_DIA ist 5 wenn man zugesagt hat, zu helfen
	if (Scatty_Start_DIA == 5)
	{
		return TRUE; 
	};
}; 
 
FUNC VOID Info_Mod_Scatty_CanYouTeach_Info () 
{ 
	AI_Output(hero, self, "Info_Mod_Scatty_CanYouTeach_15_00"); //Trainierst du noch Kämpfer? 

	AI_Output(self, hero, "Info_Mod_Scatty_CanYouTeach_01_01"); //Sicher. Ich kann dich im Einhandkampf unterrichten.
	AI_Output(self, hero, "Info_Mod_Scatty_CanYouTeach_01_02"); //Wenn ich mich recht erinnere, habe ich dir damals schon das Kämpfen beigebracht. 

	Log_CreateTopic	(TOPIC_MOD_LEHRER_OLDCAMP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_OLDCAMP, "Scatty kann mir den Umgang mit Einhändern beibringen.");
}; 


// ------------------------------------------------------------
// 			  				   LERNEN 
// ------------------------------------------------------------ 

// fuer den "du bist schon besser geworden"-Dialog
var int Scatty_Merke1H;

INSTANCE Info_Mod_Scatty_Lernen   (C_INFO) 
{ 
	npc     	= Mod_962_STT_Scatty_MT; 
	nr          = 1; 
	condition   = Info_Mod_Scatty_Lernen_Condition; 
	information = Info_Mod_Scatty_Lernen_Info; 
	important   = FALSE; 
	permanent   = TRUE; 
	description = "Unterrichte mich!"; 
}; 
 
FUNC INT Info_Mod_Scatty_Lernen_Condition () 
{ 
    if (Npc_KnowsInfo(hero, Info_Mod_Scatty_CanYouTeach)) 
    { 
  	 	return TRUE; 
    }; 
}; 
 
FUNC VOID Info_Mod_Scatty_Lernen_Info () 
{ 
	AI_Output(hero, self, "Info_Mod_Scatty_Lernen_15_00"); //Unterrichte mich!

	if (hero.HitChance[NPC_TALENT_1H] >= 100)
	{
		AI_Output(self, hero, "Info_Mod_Scatty_Lernen_01_01"); //Ich kann dir nichts mehr beibringen. Du bist schon zu gut.
	}
	else
	{
		Scatty_Merke1H = hero.HitChance[NPC_TALENT_1H];

		Info_ClearChoices	(Info_Mod_Scatty_Lernen);
		Info_AddChoice 		(Info_Mod_Scatty_Lernen, DIALOG_BACK, Info_Mod_Scatty_Lernen_Back);
		Info_AddChoice		(Info_Mod_Scatty_Lernen, B_BuildLearnString(PRINT_Learn1h1,	 B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)),		Info_Mod_Scatty_Lernen_1H_1);
		Info_AddChoice		(Info_Mod_Scatty_Lernen, B_BuildLearnString(PRINT_Learn1h5,	 B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)),		Info_Mod_Scatty_Lernen_1H_5);
	};
}; 

FUNC VOID Info_Mod_Scatty_Lernen_BACK()
{
	Info_ClearChoices	(Info_Mod_Scatty_Lernen);
	if (hero.HitChance[NPC_TALENT_1H] > scatty_merke1H && hero.HitChance[NPC_TALENT_1H] < 100)
	{
		AI_Output(self, hero, "Info_Mod_Scatty_Lernen_01_02"); //Du machst Fortschritte, sehr gut.
	}
	if (hero.HitChance[NPC_TALENT_1H] >= 100)
	{
		AI_Output(self, hero, "Info_Mod_Scatty_Lernen_01_03"); //Wenn du noch besser werden willst, musst du einen anderen Lehrer finden.
		AI_Output(self, hero, "Info_Mod_Scatty_Lernen_01_04"); //Aber so gut, wie du mittlerweile bist, glaube ich nicht, dass du noch jemanden finden wirst. Ich kann dir zumindest nichts mehr beibringen.
	};
};

FUNC VOID Info_Mod_Scatty_Lernen_1H_5()
{
	B_TeachFightTalentPercent_New(self, hero, NPC_TALENT_1H, 5, 100);
	
	Info_ClearChoices	(Info_Mod_Scatty_Lernen);
	Info_AddChoice 		(Info_Mod_Scatty_Lernen, DIALOG_BACK, Info_Mod_Scatty_Lernen_Back);
	Info_AddChoice		(Info_Mod_Scatty_Lernen, B_BuildLearnString(PRINT_Learn1h1,	 B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)),		Info_Mod_Scatty_Lernen_1H_1);
	Info_AddChoice		(Info_Mod_Scatty_Lernen, B_BuildLearnString(PRINT_Learn1h5,	 B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)),		Info_Mod_Scatty_Lernen_1H_5);
	
};

FUNC VOID Info_Mod_Scatty_Lernen_1H_1()
{
	B_TeachFightTalentPercent_New(self, hero, NPC_TALENT_1H, 1, 100);
	
	Info_ClearChoices	(Info_Mod_Scatty_Lernen);
	Info_AddChoice 		(Info_Mod_Scatty_Lernen, DIALOG_BACK, Info_Mod_Scatty_Lernen_Back);
	Info_AddChoice		(Info_Mod_Scatty_Lernen, B_BuildLearnString(PRINT_Learn1h1,	 B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)),		Info_Mod_Scatty_Lernen_1H_1);
	Info_AddChoice		(Info_Mod_Scatty_Lernen, B_BuildLearnString(PRINT_Learn1h5,	 B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)),		Info_Mod_Scatty_Lernen_1H_5);

};

INSTANCE Info_Mod_Scatty_EXIT (C_INFO)
{
	npc		= Mod_962_STT_Scatty_MT;
	nr		= 1;
	condition	= Info_Mod_Scatty_EXIT_Condition;
	information	= Info_Mod_Scatty_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Scatty_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Scatty_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};