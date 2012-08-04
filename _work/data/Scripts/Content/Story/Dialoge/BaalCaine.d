INSTANCE Info_Mod_Caine_Hi (C_INFO)
{
	npc		= Mod_1116_PSINOV_Caine_MT;
	nr		= 1;
	condition	= Info_Mod_Caine_Hi_Condition;
	information	= Info_Mod_Caine_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hi.";
};

FUNC INT Info_Mod_Caine_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Caine_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Caine_Hi_15_00"); //Hi.
	AI_Output(self, hero, "Info_Mod_Caine_Hi_09_01"); //Oh, dich wiederzusehen hätte ich nicht gedacht.
	AI_Output(self, hero, "Info_Mod_Caine_Hi_09_02"); //Da ich jetzt der Zuständige für Tränke und Spruchrollen bin, kann ich sie dir auch verkaufen.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_PSICAMP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_PSICAMP, "Baal Caine kann mir Tränke und Spruchrollen verkaufen.");
};

INSTANCE Info_Mod_Caine_GotoTempel (C_INFO)
{
	npc		= Mod_1116_PSINOV_Caine_MT;
	nr		= 1;
	condition	= Info_Mod_Caine_GotoTempel_Condition;
	information	= Info_Mod_Caine_GotoTempel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du wirst am Tempel erwartet.";
};

FUNC INT Info_Mod_Caine_GotoTempel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Namib_KarrasDa))
	&& (Npc_KnowsInfo(hero, Info_Mod_Caine_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Caine_GotoTempel_Info()
{
	AI_Output(hero, self, "Info_Mod_Caine_GotoTempel_15_00"); //Du wirst am Tempel erwartet.

	AI_StopProcessInfos	(hero);

	B_StartOtherRoutine	(self, "TEMPEL");
};

INSTANCE Info_Mod_Caine_Leichengase (C_INFO)
{
	npc		= Mod_1116_PSINOV_Caine_MT;
	nr		= 1;
	condition	= Info_Mod_Caine_Leichengase_Condition;
	information	= Info_Mod_Caine_Leichengase_Info;
	permanent	= 0;
	important	= 0;
	description	= "Na, ein Problem wegen des Gestanks gefunden?";
};

FUNC INT Info_Mod_Caine_Leichengase_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Namib_Leichengase))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Caine_Leichengase_Info()
{
	AI_Output(hero, self, "Info_Mod_Caine_Leichengase_15_00"); //Na, ein Problem wegen des Gestanks gefunden?
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase_09_01"); //Ja ... Nein ... Vielleicht. Ich habe verschiedene Geruchstöter, -überdecker und –neutralisatoren entwickelt.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase_09_02"); //Aber ich weiß nicht ob und falls ja welcher funktioniert. Ich brauche als erstes eine Geruchs-, oder besser Gestanksprobe.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase_09_03"); //Wärst du so nett ...?
	AI_Output(hero, self, "Info_Mod_Caine_Leichengase_15_04"); //Was? Der eine ist erblindet! Ich geh da doch nicht einfach rein!
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase_09_05"); //Jaja ... ich verstehe. Hier, nimm das.

	B_GiveInvItems	(self, hero, ItSc_TrfGolem, 1);

	AI_Output(self, hero, "Info_Mod_Caine_Leichengase_09_06"); //Also, wir haben die Sumpfhaileichen zu zwei Bergen aufgehäuft.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase_09_07"); //Geh zu einem Berg und reiß einfach ein Stückchen heraus.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase_09_08"); //Danach verwandelst du dich zurück und bringst mir die Probe.

	B_LogEntry	(TOPIC_MOD_SL_LEICHENGASE, "Baal Caine braucht eine Probe. Dazu soll ich die Verwandlungsrolle benutzen, die er mir gegeben hat und von einem der Sumpfhaileichenberge ein Stück ausreißen.");
};

INSTANCE Info_Mod_Caine_Leichengase2 (C_INFO)
{
	npc		= Mod_1116_PSINOV_Caine_MT;
	nr		= 1;
	condition	= Info_Mod_Caine_Leichengase2_Condition;
	information	= Info_Mod_Caine_Leichengase2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Deine ... Probe.";
};

FUNC INT Info_Mod_Caine_Leichengase2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Caine_Leichengase))
	&& (Npc_HasItems(hero, ItMi_Sumpfhaiprobe) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Caine_Leichengase2_Info()
{
	AI_Output(hero, self, "Info_Mod_Caine_Leichengase2_15_00"); //Deine ... Probe.

	B_GiveInvItems	(hero, self, ItMi_Sumpfhaiprobe, 1);

	AI_Output(self, hero, "Info_Mod_Caine_Leichengase2_09_01"); //Ausgezeichnet! Das hast du sehr gut gemacht und ich bin stolz auch dich!
	AI_Output(hero, self, "Info_Mod_Caine_Leichengase2_15_02"); //Danke ...
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase2_09_03"); //Jetzt brauche ich noch ein paar "Freiweillige".
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase2_09_04"); //Komm dann auf die Templer-Plattofrm. Ich möchte von möglich viel frischer Luft umgeben sein.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase2_09_05"); //Ich werde inzwischen die nötigen Vorbereitungen treffen.

	B_LogEntry	(TOPIC_MOD_SL_LEICHENGASE, "Ich soll später auf den Templer-Plattform gehen. Baal Caine wird alles für den Versuch vorbereiten.");

	B_StartOtherRoutine	(self, "LEICHENGASE");
	B_StartOtherRoutine	(Mod_106_TPL_Angar_MT, "LEICHENGASE");
	B_StartOtherRoutine	(Mod_1221_TPL_Templer_MT, "LEICHENGASE");
	B_StartOtherRoutine	(Mod_1218_TPL_Templer_MT, "LEICHENGASE");
	B_StartOtherRoutine	(Mod_1219_TPL_Templer_MT, "LEICHENGASE");
	B_StartOtherRoutine	(Mod_1226_TPL_Templer_MT, "LEICHENGASE");
	B_StartOtherRoutine	(Mod_1322_PSINOV_Novize_MT, "LEICHENGASE");
	B_StartOtherRoutine	(Mod_1324_PSINOV_Novize_MT, "LEICHENGASE");
	B_StartOtherRoutine	(Mod_1325_PSINOV_Novize_MT, "LEICHENGASE");
	B_StartOtherRoutine	(Mod_1326_PSINOV_Novize_MT, "LEICHENGASE");
};

INSTANCE Info_Mod_Caine_Leichengase3 (C_INFO)
{
	npc		= Mod_1116_PSINOV_Caine_MT;
	nr		= 1;
	condition	= Info_Mod_Caine_Leichengase3_Condition;
	information	= Info_Mod_Caine_Leichengase3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Caine_Leichengase3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Caine_Leichengase2))
	&& (Npc_GetDistToWP(self, "PSI_TRAINING_TEACHER") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Caine_Leichengase3_Info()
{
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase3_09_00"); //Da kommst du ja endlich. Es ist schon alles vorbereitet.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase3_09_01"); //Ich habe die "Probe" mit verschiedenen Substanzen bearbeitet.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase3_09_02"); //Jetzt ist es an den Testern herauszufinden, welches funktioniert hat.
	AI_Output(hero, self, "Info_Mod_Caine_Leichengase3_15_03"); //Und wie machen wir das?
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase3_09_04"); //Ich habe ein paar Glasphiolen an Pfeile gebunden.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase3_09_05"); //Beim Aufprall zerbrechen sie und geben uns schmierige, stinkende Wahrheit Preis.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase3_09_06"); //(schreit) Freiwillige AUFSTELLEN; Templer AUFSTELLEN!

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_1221_TPL_Templer_MT, "LEICHENGASE2");
	B_StartOtherRoutine	(Mod_1218_TPL_Templer_MT, "LEICHENGASE2");
	B_StartOtherRoutine	(Mod_1219_TPL_Templer_MT, "LEICHENGASE2");
	B_StartOtherRoutine	(Mod_1226_TPL_Templer_MT, "LEICHENGASE2");
};

INSTANCE Info_Mod_Caine_Leichengase4 (C_INFO)
{
	npc		= Mod_1116_PSINOV_Caine_MT;
	nr		= 1;
	condition	= Info_Mod_Caine_Leichengase4_Condition;
	information	= Info_Mod_Caine_Leichengase4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Caine_Leichengase4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Caine_Leichengase3))
	&& (Mod_Caine_Leichengase == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Caine_Leichengase4_Info()
{
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_09_00"); //Ha! Sieh, einer steht noch. Novize Nummer 3 ... das heißt Reagenz 3 ist die Lösung unseres Problems!
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_09_01"); //Alles was wir jetzt noch tun müssen ist, das Zeug im großen Maßstab zu produzieren. Dazu brauchen wir nur ... oha.
	AI_Output(hero, self, "Info_Mod_Caine_Leichengase4_15_02"); //Was?
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_09_03"); //Das dürfte etwas kompliziert werden. Reagenz 3 war Trollkot.
	AI_Output(hero, self, "Info_Mod_Caine_Leichengase4_15_04"); //Das heißt ich darf jetzt in Trollhaufen rumwühlen?
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_09_05"); //Wäre die Sache doch nur so einfach. Es ist ... "besonderer" Trollkot.
	AI_Output(hero, self, "Info_Mod_Caine_Leichengase4_15_06"); //Inwiefern besonders?
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_09_07"); //Der Troll war vegetarisch.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_09_08"); //Er hat früher im Sumpf gelebt, keine Ahnung wie er dort hingekommen ist.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_09_09"); //Hat hauptsächlich Sumpfhaie gefressen.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_09_10"); //Aber vermutlich hat ihm der ganze Rauch des Sumpfkrauts den Kopf etwas vernebelt.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_09_11"); //Eines Tages hat er nur noch Pflanzen gefressen. Sumpfkraut, Farne, Beeren.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_09_12"); //Was halt so im Sumpf herumwuchert.
	AI_Output(hero, self, "Info_Mod_Caine_Leichengase4_15_13"); //Und was ist dann mit ihm passiert?
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_09_14"); //Was wohl? Er ist natürlich verhungert. Ein vegetarischer Troll, ist ja lächerlich.
	AI_Output(hero, self, "Info_Mod_Caine_Leichengase4_15_15"); //Und warum hast du nochmal seinen Kot aufbewahrt?!?
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_09_16"); //Das ist jetzt doch unwichtig.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_09_17"); //Wichtig ist, dass du ein paar Trolle dazu bringst, dieses Sumpfkräutergemisch hier zu fressen und mir dann ihre warmen weichen dampfenden Trollhaufen bringst!!!

	B_GiveInvItems	(self, hero, ItMi_Sumpfkraeuter, 1);

	AI_Output(hero, self, "Info_Mod_Caine_Leichengase4_15_18"); //Und wie soll ich das machen?
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_09_19"); //Du findest sicher einen Weg. Frag am besten Leute die sich mit sowas auskennen.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_09_20"); //Jäger, Bauern, vielleicht kann dir ja auch ein Magier helfen.

	B_LogEntry	(TOPIC_MOD_SL_LEICHENGASE, "Für das Gegenmittel benötigt Baal Caine den Kot eines vegetarischen Trolls. Er hat mir eine Kräutermischung gegeben, die ich jetzt irgendwie an den Troll bringen muss. Ich sollte mich bei jemandem erkundigen, der Ahnung von soetwas hat. In Frage käme ein Bauer, ein Jäger oder vielleicht auch ein Magier. Hm, da wären wohl am ehesten Lobart, Dragomir und Milten geeignet.");

	B_StartOtherRoutine	(self, "START");
	B_StartOtherRoutine	(Mod_106_TPL_Angar_MT, "START");
	B_StartOtherRoutine	(Mod_1221_TPL_Templer_MT, "START");
	B_StartOtherRoutine	(Mod_1218_TPL_Templer_MT, "START");
	B_StartOtherRoutine	(Mod_1219_TPL_Templer_MT, "START");
	B_StartOtherRoutine	(Mod_1226_TPL_Templer_MT, "START");
	B_StartOtherRoutine	(Mod_1322_PSINOV_Novize_MT, "START");
	B_StartOtherRoutine	(Mod_1325_PSINOV_Novize_MT, "START");
	B_StartOtherRoutine	(Mod_1326_PSINOV_Novize_MT, "START");
};

INSTANCE Info_Mod_Caine_Leichengase5 (C_INFO)
{
	npc		= Mod_1116_PSINOV_Caine_MT;
	nr		= 1;
	condition	= Info_Mod_Caine_Leichengase5_Condition;
	information	= Info_Mod_Caine_Leichengase5_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier, dein Trollkot!";
};

FUNC INT Info_Mod_Caine_Leichengase5_Condition()
{
	if (Npc_HasItems(hero, ItMi_Trollhaufen) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Caine_Leichengase5_Info()
{
	AI_Output(hero, self, "Info_Mod_Caine_Leichengase5_15_00"); //Hier, dein Trollkot!

	B_GiveInvItems	(hero, self, ItMi_Trollhaufen, 1);

	AI_Output(self, hero, "Info_Mod_Caine_Leichengase5_09_01"); //Ich bin dir zu tiefstem Dank verpflichtet!
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase5_09_02"); //Geh zu Baal Namib und sag ihm, dass seine Novizen wieder durchatmen können.

	B_GivePlayerXP	(150);
};

INSTANCE Info_Mod_Caine_Woher (C_INFO)
{
	npc		= Mod_1116_PSINOV_Caine_MT;
	nr		= 1;
	condition	= Info_Mod_Caine_Woher_Condition;
	information	= Info_Mod_Caine_Woher_Info;
	permanent	= 1;
	important	= 0;
	description	= "Wie bist du in dieses Lager gekommen?";
};

FUNC INT Info_Mod_Caine_Woher_Condition()
{
	if (Guru_Dabei == 1)
	|| (Templer_Dabei == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Caine_Woher_Info()
{
	AI_Output(hero, self, "Info_Mod_Caine_Woher_15_00"); //Wie bist du in dieses Lager gekommen?
	AI_Output(self, hero, "Info_Mod_Caine_Woher_09_01"); //Früher war ich ein Lehrling in Khorinis beim Alchemisten Constantino, vielleicht kennst du ihn.
	AI_Output(self, hero, "Info_Mod_Caine_Woher_09_02"); //Jedenfalls habe ich damals etwas mit Sumpfkraut experimentiert und als ich erwischt wurde, haben sie mich in die Kolonie geworfen.
	AI_Output(self, hero, "Info_Mod_Caine_Woher_09_03"); //Da ich selbst auch gerne etwas Sumpfkraut rauche, bin ich dann zur Bruderschaft gegangen und wurde Kaloms Lehrling.
	AI_Output(self, hero, "Info_Mod_Caine_Woher_09_04"); //Er war immer mein großes Vorbild und ich hab versucht so zu leben wie er, doch nachdem er auszog, den Schläfer zu suchen, bin ich hier geblieben.
	AI_Output(self, hero, "Info_Mod_Caine_Woher_09_05"); //Erst vor kurzem haben mich dann Cor Cadar und Cor Angar zum Guru ernannt und zum Alchemistenmeister.
};

INSTANCE Info_Mod_Caine_BistGuru (C_INFO)
{
	npc		= Mod_1116_PSINOV_Caine_MT;
	nr		= 1;
	condition	= Info_Mod_Caine_BistGuru_Condition;
	information	= Info_Mod_Caine_BistGuru_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Caine_BistGuru_Condition()
{
	if (Guru_Dabei == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Caine_BistGuru_Info()
{
	AI_Output(self, hero, "Info_Mod_Caine_BistGuru_09_00"); //Jetzt, wo du zu uns Gurus gehörtst, kann ich dich in der Alchemie unterrichten.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_SUMPF, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_SUMPF, "Baal Caine kann mir etwas über die Alchemie beibringen.");
};

INSTANCE Info_Mod_Caine_Lehrer (C_INFO)
{
	npc		= Mod_1116_PSINOV_Caine_MT;
	nr		= 1;
	condition	= Info_Mod_Caine_Lehrer_Condition;
	information	= Info_Mod_Caine_Lehrer_Info;
	permanent	= 1;
	important	= 0;
	description	= "Bring mir etwas über die Alchemie bei.";
};

FUNC INT Info_Mod_Caine_Lehrer_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Mod_Caine_BistGuru))
	&& (Mod_IstLehrling == 1)
	{	
		return 1;
	};
};

FUNC VOID Info_Mod_Caine_Lehrer_Info()
{
	AI_Output (hero, self, "Info_Mod_Caine_Lehrer_15_00"); //Bring mir etwas über die Alchemie bei.	
	AI_Output (self, hero, "Info_Mod_Caine_Lehrer_09_01"); //Was willst du wissen?
		
	Info_ClearChoices 	(Info_Mod_Caine_Lehrer);
	Info_AddChoice 		(Info_Mod_Caine_Lehrer,DIALOG_BACK,Info_Mod_Caine_Lehrer_BACK);

	if (PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice (Info_Mod_Caine_Lehrer, B_BuildLearnString ("Trank der Geschwindigkeit", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Speed)), Info_Mod_Caine_Lehrer_Speed);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	&& (Mod_LehrlingBei != 1)
	{
		Info_AddChoice 		(Info_Mod_Caine_Lehrer,B_BuildLearnString ("Essenz der Heilung", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_01)),Info_Mod_Caine_Lehrer_HEALTH_01);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Caine_Lehrer, B_BuildLearnString ("Extrakt der Heilung", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_02)), Info_Mod_Caine_Lehrer_Health_02);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Caine_Lehrer, B_BuildLearnString ("Elixier der Heilung", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_03)), Info_Mod_Caine_Lehrer_Health_03);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	&& (Mod_LehrlingBei != 1)
	{
		Info_AddChoice	  (Info_Mod_Caine_Lehrer, B_BuildLearnString ("Mana Essenz", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_01)), Info_Mod_Caine_Lehrer_Mana_01);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Caine_Lehrer, B_BuildLearnString ("Mana Extrakt", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_02)), Info_Mod_Caine_Lehrer_Mana_02);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Caine_Lehrer, B_BuildLearnString ("Mana Elixier", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_03)), Info_Mod_Caine_Lehrer_Mana_03);
	};
};
FUNC VOID Info_Mod_Caine_Lehrer_BACK()
{
	Info_ClearChoices 	(Info_Mod_Caine_Lehrer);
};
FUNC VOID Info_Mod_Caine_Lehrer_HEALTH_01()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_01);
};
FUNC VOID Info_Mod_Caine_Lehrer_HEALTH_02()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_02);
};
FUNC VOID Info_Mod_Caine_Lehrer_Health_03()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_03);
};
FUNC VOID Info_Mod_Caine_Lehrer_MANA_01()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_01);
};
FUNC VOID Info_Mod_Caine_Lehrer_MANA_02()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_02);
};
FUNC VOID Info_Mod_Caine_Lehrer_MANA_03()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_03);
};
FUNC VOID Info_Mod_Caine_Lehrer_Speed()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Speed);
};

INSTANCE Info_Mod_Caine_Trade (C_INFO)
{
	npc		= Mod_1116_PSINOV_Caine_MT;
	nr		= 1;
	condition	= Info_Mod_Caine_Trade_Condition;
	information	= Info_Mod_Caine_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Caine_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Caine_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Caine_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Caine_EXIT (C_INFO)
{
	npc		= Mod_1116_PSINOV_Caine_MT;
	nr		= 1;
	condition	= Info_Mod_Caine_EXIT_Condition;
	information	= Info_Mod_Caine_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Caine_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Caine_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};