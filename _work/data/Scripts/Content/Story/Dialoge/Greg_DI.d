INSTANCE Info_Mod_Greg_DI_Hi (C_INFO)
{
	npc		= Mod_1541_PIR_Greg_DI;
	nr		= 1;
	condition	= Info_Mod_Greg_DI_Hi_Condition;
	information	= Info_Mod_Greg_DI_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Greg_DI_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Greg_DI_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Greg_DI_Hi_01_00"); //Hab nicht gedacht, dass du überhaupt nochmal aufwachst. Das war letzte Nacht wohl 'ne Flasche Grog zu viel.
	AI_Output(self, hero, "Info_Mod_Greg_DI_Hi_01_01"); //Jetzt wirst du mal für deinen Grog arbeiten.
	AI_Output(hero, self, "Info_Mod_Greg_DI_Hi_15_02"); //Was soll ich machen?
	AI_Output(self, hero, "Info_Mod_Greg_DI_Hi_01_03"); //Nun, wir sind hier auf Schatzsuche, also such den Schatz. Geh mal in die Höhlen und sieh dich dort um.
	AI_Output(self, hero, "Info_Mod_Greg_DI_Hi_01_04"); //Vorher bekommst du aber noch 'ne neue Rüstung.

	CreateInvItems	(self, ITAR_PIR_M_Addon, 1);
	B_GiveInvItems	(self, hero, ITAR_PIR_M_Addon, 1);

	AI_Output(self, hero, "Info_Mod_Greg_DI_Hi_01_07"); //Und jetzt mal los!
	AI_Output(hero, self, "Info_Mod_Greg_DI_Hi_15_06"); //Aye, aye Käpt'n!

	Log_CreateTopic	(TOPIC_MOD_PIRATEN_DI,	LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_PIRATEN_DI, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_PIRATEN_DI, "Greg hat mich damit beauftragt, die Höhlen nach dem Schatz zu durchsuchen.");
};

INSTANCE Info_Mod_Greg_DI_Skelett (C_INFO)
{
	npc		= Mod_1541_PIR_Greg_DI;
	nr		= 1;
	condition	= Info_Mod_Greg_DI_Skelett_Condition;
	information	= Info_Mod_Greg_DI_Skelett_Info;
	permanent	= 0;
	important	= 0;
	description	= "Es gibt Schwierigkeiten.";
};

FUNC INT Info_Mod_Greg_DI_Skelett_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Greg_DI_Hi))
	&& (Mod_HatSkeletonBook_Gelesen == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Greg_DI_SKelett_Info()
{
	AI_Output(hero, self, "Info_Mod_Greg_DI_Skelett_15_00"); //Es gibt Schwierigkeiten.
	AI_Output(self, hero, "Info_Mod_Greg_DI_Skelett_01_01"); //Schwierigkeiten? Was für Schwierigkeiten?!
	AI_Output(hero, self, "Info_Mod_Greg_DI_Skelett_15_02"); //In einer der Höhlen wurde ich von einem toten Piraten angegriffen.
	AI_Output(self, hero, "Info_Mod_Greg_DI_Skelett_01_03"); //Hast wohl zuviel Rum getrunken? Wie will dich 'n toter Pirat denn angreifen?
	AI_Output(hero, self, "Info_Mod_Greg_DI_Skelett_15_04"); //Dieses Buch hatte er dabei. Darin steht dass sie einen Eid auf Adanos gebrochen haben, mit dem sie ihrem Käptn treue schworen.

	B_GiveInvItems	(hero, self, ItWr_BookFromSkeleton, 1);

	AI_Output(hero, self, "Info_Mod_Greg_DI_Skelett_15_05"); //Daraufhin wurden sie dazu verflucht auf Ewig den Schatz auf dieser Insel zu bewachen.
	AI_Output(self, hero, "Info_Mod_Greg_DI_Skelett_01_06"); //Geisterpiraten? Na das is doch ma ein Abenteuer!

	B_UseItem	(self, ItWr_BookFromSkeleton);

	AI_Output(self, hero, "Info_Mod_Greg_DI_SKelett_01_07"); //Nach dem was in dem Logbuch steht muss der Schatz riesig sein!
	AI_Output(self, hero, "Info_Mod_Greg_DI_Skelett_01_08"); //Ich werde einige Dinge veranlassen. Soviel ich weiß, war ein Freund von Bones Novize bei den Wassermagiern.
	AI_Output(self, hero, "Info_Mod_Greg_DI_Skelett_01_09"); //Ich werde Skip schicken ihn zu holen, der wird uns da besser helfen können.
	AI_Output(hero, self, "Info_Mod_Greg_DI_Skelett_15_10"); //Und was soll ich solange machen?
	AI_Output(self, hero, "Info_Mod_Greg_DI_Skelett_01_11"); //Na du schnappst dir Alligator Jack und gehst mit ihm die Insel erkunden.

	Npc_ExchangeRoutine	(Mod_1540_PIR_Skip_DI, "UNTERWEGS");
	AI_Teleport	(Mod_1540_PIR_Skip_DI, "WP_DI_SKIP_WAITFORPLAYER");

	Mod_DI_InselErkunden = 1;

	B_LogEntry	(TOPIC_MOD_PIRATEN_DI, "Ich habe Greg von dem Skelett berichtet. Er scheint keineswegs beunruhigt, sondern sieht dies als großartiges Abenteuer an. Er schickt Skip nach einem Wassermagier aus. Bis Skip zurück ist soll ich mit Alligator Jack die Insel erkunden.");

	Wld_InsertNpc	(Mod_7642_OUT_Brunhild_DI,	"WP_DI_BRUNHILD_02");
};

INSTANCE Info_Mod_Greg_DI_Brunhild (C_INFO)
{
	npc		= Mod_1541_PIR_Greg_DI;
	nr		= 1;
	condition	= Info_Mod_Greg_DI_Brunhild_Condition;
	information	= Info_Mod_Greg_DI_Brunhild_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Greg_DI_Brunhild_Condition()
{
	if (Mod_DI_InselErkunden == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Greg_DI_Brunhild_Info()
{
	AI_Output(self, hero, "Info_Mod_Greg_DI_Brunhild_01_00"); //Nanu. Was habt ihr denn da mitgebracht?
	AI_Output(hero, self, "Info_Mod_Greg_DI_Brunhild_15_01"); //Gold und Silber ist es nicht. Kann sich aber vielleicht als Schatz in der Küche erweisen.
	AI_Output(self, hero, "Info_Mod_Greg_DI_Brunhild_01_02"); //Und woher ...?
	AI_Output(hero, self, "Info_Mod_Greg_DI_Brunhild_15_03"); //Eine Schiffbrüchige. Sie hat die Flaschenpost geschrieben. Ihre Leute sind alle tot. Sie hat gefragt, ob sie mit uns mitfahren kann.
	AI_Output(self, hero, "Info_Mod_Greg_DI_Brunhild_01_04"); //Weiß sie, wo der Schatz verborgen ist? Oder habt ihr ihn schon gefunden?
	AI_Output(hero, self, "Info_Mod_Greg_DI_Brunhild_15_05"); //Weder noch. Aber wir haben ein paar blockierte Gänge gesehen. Einen davon sollte man freilegen können. Scheint nur verschüttet zu sein.
	AI_Output(hero, self, "Info_Mod_Greg_DI_Brunhild_15_06"); //Die anderen sind mit massivem Fels verschlossen.
	AI_Output(self, hero, "Info_Mod_Greg_DI_Brunhild_01_07"); //Nun dann. Ich werde zwei Mann zum Gang räumen schicken.
	AI_Output(self, hero, "Info_Mod_Greg_DI_Brunhild_01_08"); //Du sprichst mit Skip. Er soll die Maid aufs Schiff bringen. Sie wird Samuel in der Küche ablösen.

	B_LogEntry	(TOPIC_MOD_PIRATEN_DI, "Während ich Brunhild von Skip aufs Schiff bringen lasse, will Greg zwei seiner Jungs losschicken, um den Stollen freizulegen.");

	B_StartOtherRoutine	(Mod_1546_PIR_Francis_DI, "STOLLEN");
	B_StartOtherRoutine	(Mod_1549_PIR_Malcom_DI, "STOLLEN");
};

INSTANCE Info_Mod_Greg_DI_StollenFrei (C_INFO)
{
	npc		= Mod_1541_PIR_Greg_DI;
	nr		= 1;
	condition	= Info_Mod_Greg_DI_StollenFrei_Condition;
	information	= Info_Mod_Greg_DI_StollenFrei_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie geht’s weiter?";
};

FUNC INT Info_Mod_Greg_DI_StollenFrei_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skip_DI_Brunhild))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Greg_DI_StollenFrei_Info()
{
	AI_Output(hero, self, "Info_Mod_Greg_DI_StollenFrei_15_01"); //Wie geht’s weiter?
	AI_Output(self, hero, "Info_Mod_Greg_DI_StollenFrei_01_02"); //Malcom ist zurück und sagt, dass der Gang frei ist. Francis ist noch dort und sichert die Stelle.
	AI_Output(hero, self, "Info_Mod_Greg_DI_StollenFrei_15_03"); //Und jetzt soll ich ...?
	AI_Output(self, hero, "Info_Mod_Greg_DI_StollenFrei_01_04"); //Genau Bursche. Du bist am zuverlässigsten vom ganzen Haufen. Spute dich!

	B_LogEntry	(TOPIC_MOD_PIRATEN_DI, "Der Gang ist frei und ich soll nun sehen, ob ich den Schatz finden kann.");

	Wld_SendTrigger	("EVT_STOLLEN_01");

	B_StartOtherRoutine	(Mod_1549_PIR_Malcom_DI, "START");
};

INSTANCE Info_Mod_Greg_DI_Amulett (C_INFO)
{
	npc		= Mod_1541_PIR_Greg_DI;
	nr		= 1;
	condition	= Info_Mod_Greg_DI_Amulett_Condition;
	information	= Info_Mod_Greg_DI_Amulett_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Greg_DI_Amulett_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Francis_DI_Amulett))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Greg_DI_Amulett_Info()
{
	AI_Output(self, hero, "Info_Mod_Greg_DI_Amulett_01_00"); //Ihr seid zurück? Berichte vom Schatz.
	AI_Output(hero, self, "Info_Mod_Greg_DI_Amulett_15_01"); //Nichts mit Schatz. Dieses Alumett und ein paar Kelche, Erzbrocken und so weiter hab ich in dem Stollen gefunden. Sonst nichts.
	AI_Output(self, hero, "Info_Mod_Greg_DI_Amulett_01_02"); //Hmm. Dann bleiben die blockieren Gänge. Aber wie ...?
	AI_Output(hero, self, "Info_Mod_Greg_DI_Amulett_15_03"); //Ich werde mir etwas einfallen lassen.

	B_LogEntry	(TOPIC_MOD_PIRATEN_DI, "Wir müssen eine Möglichkeit finden, die verschlossenen Gänge zu öffnen.");
};

INSTANCE Info_Mod_Greg_DI_Los (C_INFO)
{
	npc		= Mod_1541_PIR_Greg_DI;
	nr		= 1;
	condition	= Info_Mod_Greg_DI_Los_Condition;
	information	= Info_Mod_Greg_DI_Los_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Greg_DI_Los_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jones_Los))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Greg_DI_Los_Info()
{
	AI_Output(self, hero, "Info_Mod_Greg_DI_Los_01_00"); //Warte, Junge, ich komm auch mit. Das will ich nicht verpassen.

	AI_StopProcessInfos	(self);

	Npc_ExchangeRoutine	(self, "SKELETT");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
};

INSTANCE Info_Mod_Greg_DI_Ende (C_INFO)
{
	npc		= Mod_1541_PIR_Greg_DI;
	nr		= 1;
	condition	= Info_Mod_Greg_DI_Ende_Condition;
	information	= Info_Mod_Greg_DI_Ende_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Greg_DI_Ende_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jones_Ende))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Greg_DI_Ende_Info()
{
	AI_Output(self, hero, "Info_Mod_Greg_DI_Ende_01_00"); //Großartig! Jetzt können wir endlich den Schatz heben. Und den Gang, den Jones eben erwähnt hat, solltest du dir vor der Abreise auch noch genauer ansehen.
	AI_Output(self, hero, "Info_Mod_Greg_DI_Ende_01_01"); //Ich geh zurück zum Strand und bereite die Abreise vor, geh du in die Höhlen und hol die Schätze.

	B_LogEntry	(TOPIC_MOD_PIRATEN_DI, "Greg hat mich damit beauftragt die Schätze aus den Höhlen zu bergen.");

	AI_StopProcessInfos	(self);

	B_GivePlayerXP	(100);

	Npc_ExchangeRoutine	(self, "START");

	Adanos_Gefallen += 1;

	B_Göttergefallen(2, 1);

	self.aivar[AIV_PARTYMEMBER] = FALSE;
};

INSTANCE Info_Mod_Greg_DI_Alles (C_INFO)
{
	npc		= Mod_1541_PIR_Greg_DI;
	nr		= 1;
	condition	= Info_Mod_Greg_DI_Alles_Condition;
	information	= Info_Mod_Greg_DI_Alles_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe den wahren Schatz der Insel gefunden.";
};

FUNC INT Info_Mod_Greg_DI_Alles_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Greg_DI_Ende))
	&& (Mod_PirInsel_Teleport == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Greg_DI_Alles_Info()
{
	AI_Output(hero, self, "Info_Mod_Greg_DI_Alles_15_00"); //Ich habe den wahren Schatz der Insel gefunden.
	AI_Output(hero, self, "Info_Mod_Greg_DI_Alles_15_01"); //Durch die Wand bin ich in ein großes Höhlensystem gekommen und in einer riesigen Halle war alles voller Gold.
	AI_Output(hero, self, "Info_Mod_Greg_DI_Alles_15_02"); //Du solltest noch ein paar von den Jungs runterschicken, um das Gold hochzuschaffen.
	AI_Output(self, hero, "Info_Mod_Greg_DI_Alles_01_03"); //Gut, min jung, ich werde das veranlassen!
	AI_Output(self, hero, "Info_Mod_Greg_DI_Alles_01_04"); //Ich werde währenddessen die Abreise vorbereiten. Die Beute wird im Lager aufgeteilt, wenn wir zurück sind.
	AI_Output(self, hero, "Info_Mod_Greg_DI_Alles_01_05"); //Sprich mit Skip, wenn du hier alles erledigt hast. Er wird uns zum Schiff bringen und dann fahren wir gleich los.

	B_LogEntry	(TOPIC_MOD_PIRATEN_DI, "Ich hab Greg über die Höhle informiert und er wird ein paar der Jungs hinunter schicken. Er bereitet solange die Abreise vor. Wenn ich bereit bin, soll ich mit Skip reden und wir werden alle zum Schiff übergesetzt.");
	B_SetTopicStatus	(TOPIC_MOD_PIRATEN_DI, LOG_SUCCESS);

	B_Göttergefallen(2, 2);

	B_GivePlayerXP	(1000);
};

INSTANCE Info_Mod_Greg_DI_EXIT (C_INFO)
{
	npc		= Mod_1541_PIR_Greg_DI;
	nr		= 1;
	condition	= Info_Mod_Greg_DI_EXIT_Condition;
	information	= Info_Mod_Greg_DI_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Greg_DI_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Greg_DI_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};