INSTANCE Info_Mod_Xardas_NW_Hallo (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_Hallo_Condition;
	information	= Info_Mod_Xardas_NW_Hallo_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Xardas_NW_Hallo_Condition()
{
	if (HeroIstKeinZombie == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_Hallo_Info()
{
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Hallo_14_00"); //Was?! Bei Beliar! Du hier?! Wie ist das möglich? Es ist jetzt drei Wochen her, seitdem du den Schläfer verbannt hast.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Hallo_14_01"); //Ich war mir sicher, du seiest tot ...
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Hallo_15_02"); //So war es auch.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Hallo_14_03"); //Was sagst du? Das musst du mir erklären ...
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Hallo_15_04"); //Nachdem deine Diener das Geröll zur Seite geschafft hatten, erwachte ich zu neuem Bewusstsein.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Hallo_15_05"); //Ich vermochte zwar meinen Körper zu lenken, musste jedoch schnell feststellen, dass er im Begriff war zu verwesen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Hallo_14_06"); //Das ist höchst ungewöhnlich. Wobei ... mir fällt da eine antike Überlieferung ein, nach welcher der Träger einer magischen Rüstung in einer Schlacht selbst dann den Kampf fortführte, ...
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Hallo_14_07"); //... als sein Körper von unzähligen Waffen durchbohrt und von Flammen verbrannt worden war.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Hallo_14_08"); //Sein Geist wurde scheinbar durch die magische Rüstung im toten Leib zurückgehalten, wie in einem Käfig. Das Gleiche muss auch bei dir geschehen sein.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Hallo_14_09"); //Die magische Explosion nach dem Fall der Barriere mag auch ihren Anteil daran gehabt haben.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Hallo_14_10"); //Hmm ... aber wie ist es dann möglich, dass du wieder lebendig vor mir stehst? Was ist geschehen?
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Hallo_15_11"); //In den Trümmern fand ich ein Buch, das eine Formel preisgab, mit welcher Rüstung und Heilrune gekoppelt werden konnten.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Hallo_15_12"); //Mit der magischen Energie der Rüstung kann auf diesem Weg eine völlige Heilung des Trägers erwirkt werden.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Hallo_14_13"); //(erstaunt) Du hattest großes Glück, dass dir solch ein Buch in die Hände fiel. Bücher, die solch altes Wissen enthalten, sind höchst selten.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Hallo_14_14"); //Wie dem auch sei, so stehst du jetzt wieder lebend vor mir.

	B_GivePlayerXP	(100);

	Mod_RealStrength	=	10;
	Mod_RealDexterity	=	10;
	Mod_RealMana		=	10;
	Mod_KenntBodo	=	0;
	FokiEingesetzt	=	0;
	Monster_Max = 2307;
	Erzhackchance = 10;

	Mod_Gottstatus = 8;

	Mod_Verhandlungsgeschick = 10;

	Npc_RemoveInvItems	(hero, ItWr_XardasLetterForHeroOT, 1);

	Npc_SetTalentSkill (hero, NPC_TALENT_GOTTSTATUS, 8);

	B_LogEntry	(TOPIC_MOD_ANFANG, "Ich habe Xardas gefunden und ihm meine Geschichte erzählt. Jetzt werde ich hoffentlich erfahren, wie es weitergeht.");
	B_SetTopicStatus	(TOPIC_MOD_ANFANG, LOG_SUCCESS);

	if (Mod_OT_Geheimkammer == 1)
	{
		B_SetTopicStatus	(TOPIC_MOD_OT_GEHEIMKAMMER, LOG_FAILED);
	};
};

INSTANCE Info_Mod_Xardas_NW_WasJetzt (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_WasJetzt_Condition;
	information	= Info_Mod_Xardas_NW_WasJetzt_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was soll ich jetzt machen?";
};

FUNC INT Info_Mod_Xardas_NW_WasJetzt_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Hallo))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_WasJetzt_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_WasJetzt_15_00"); //Was soll ich jetzt machen?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_WasJetzt_14_01"); //Du hast den Schläfer verbannt und die Barriere vernichtet. Ein unbedarfter Beobachter würde nun vielleicht meinen, alles sei friedlich.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_WasJetzt_14_02"); //Aber der Friede ist trügerisch.
};

INSTANCE Info_Mod_Xardas_NW_Vorahnung (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_Vorahnung_Condition;
	information	= Info_Mod_Xardas_NW_Vorahnung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Woher willst du das wissen?";
};

FUNC INT Info_Mod_Xardas_NW_Vorahnung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_WasJetzt))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_Vorahnung_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Vorahnung_15_00"); //Woher willst du das wissen?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Vorahnung_14_01"); //In den letzten Tagen wurde ich öfters von Visionen geplagt. Eine dunkle Gestalt streifte über Khorinis und verbreitete Unheil.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Vorahnung_15_02"); //Das klingt nicht gut. Weißt du denn nichts Genaueres?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Vorahnung_14_03"); //Nein, bisher habe ich nur diese Visionen. Jedoch forsche ich in meinen Büchern nach Informationen.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Vorahnung_15_04"); //Kann ich dir dabei helfen?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Vorahnung_14_05"); //In deinem geschwächten Zustand kannst du mir kaum eine Hilfe sein. Du solltest erst wieder Kräfte sammeln.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Vorahnung_14_06"); //Sicherlich wäre es von Vorteil, wenn du dich dazu einer der Gilden hier anschließt. Die haben immer noch die besten Lehrer.

	Log_CreateTopic	(TOPIC_MOD_DIEBEDROHUNG, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_DIEBEDROHUNG, LOG_RUNNING);
	
	Log_CreateTopic	(TOPIC_MOD_GILDENAUFNAHME, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_GILDENAUFNAHME, LOG_RUNNING);
	B_LogEntry_More	(TOPIC_MOD_GILDENAUFNAHME, TOPIC_MOD_DIEBEDROHUNG, "Xardas hat gesagt ich solle zuerst Kräfte sammeln und mich dazu einer Gilde anschließen.", "Xardas hat in letzter Zeit einige Visionen gehabt. Eine dunkle Gestalt wird Unheil über Khorinis verbreiten. Xardas forscht derzeit in seinen Büchern noch Informationen. Bis er etwas neues herausgefunden hat soll ich mich einer Gilde anschließen.");
};

INSTANCE Info_Mod_Xardas_NW_WasFuerGilden (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_WasFuerGilden_Condition;
	information	= Info_Mod_Xardas_NW_WasFuerGilden_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was für Gilden gibt es?";
};

FUNC INT Info_Mod_Xardas_NW_WasFuerGilden_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Vorahnung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_WasFuerGilden_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_WasFuerGilden_15_00"); //Was für Gilden gibt es?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_WasFuerGilden_14_01"); //Es gibt in der Stadt die Miliz, welche sich gut aufs Kämpfen versteht.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_WasFuerGilden_14_02"); //Ich habe gehört, dass auf einem Bauernhof ein paar Söldner sind. Ich glaube, dass du sie kennst.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_WasFuerGilden_14_03"); //In einem Kloster leben Feuermagier. Auch ihnen kannst du dich anschließen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_WasFuerGilden_14_04"); //Außerdem gibt es noch die Wassermagier, die sich momentan an einer alten Ruine zu schaffen machen. Einer von ihnen soll sich jedoch in der Stadt aufhalten.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_WasFuerGilden_14_05"); //Oder aber du entscheidest dich für den Weg Beliars.

	Mod_Gilde	=	0;

	B_LogEntry	(TOPIC_MOD_GILDENAUFNAHME, "Ich kann entweder ein Mitglied der Miliz, ein Söldner, ein Feuer Novize, ein Wasser Novize oder ein Schwarzer Novize werden.");

	Mil_310_schonmalreingelassen = TRUE;

	Log_CreateTopic	(TOPIC_MOD_MILIZ, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_MILIZ, LOG_RUNNING);
	Log_CreateTopic	(TOPIC_MOD_SÖLDNER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SÖLDNER, LOG_RUNNING);
	Log_CreateTopic	(TOPIC_MOD_DAEMONENBESCHWOERER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_DAEMONENBESCHWOERER, LOG_RUNNING);
	Log_CreateTopic	(TOPIC_MOD_FEUERMAGIER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_FEUERMAGIER, LOG_RUNNING);
	Log_CreateTopic	(TOPIC_MOD_WASSERMAGIER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_WASSERMAGIER, LOG_RUNNING);

	B_LogEntry_NS	(TOPIC_MOD_MILIZ, "Ich kann mich der Miliz in der Stadt anschließen.");
	B_LogEntry_NS	(TOPIC_MOD_SÖLDNER, "Die Söldner finde ich auf einem Bauernhof. Xardas meint, dass ich sie kenne.");
	B_LogEntry_NS	(TOPIC_MOD_DAEMONENBESCHWOERER, "Bei Xardas kann mich den schwarzen Novizen anschließen.");
	B_LogEntry_NS	(TOPIC_MOD_FEUERMAGIER, "In einem Kloster auf der Insel leben die Feuermagier, denen ich mich anschließen kann.");
	B_LogEntry_NS	(TOPIC_MOD_WASSERMAGIER, "Die Wassermagier sind in einer alten Ruine im Norden der Insel. Jedoch soll einer in der Stadt Khorinis zu finden sein.");

	B_Kapitelwechsel (1, NEWWORLD_ZEN);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine (self, "START");
};

INSTANCE Info_Mod_Xardas_NW_Urnol (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_Urnol_Condition;
	information	= Info_Mod_Xardas_NW_Urnol_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Xardas_NW_Urnol_Condition()
{
	if (!Npc_KnowsInfo(hero, Info_Mod_Urnol_WerBistDu))
	&& (Mod_Gilde > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_Urnol_Info()
{
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Urnol_14_00"); //Ahh. Da bist du ja. Bist du einer Gilde beigetreten?
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Urnol_15_01"); //Ja. Aber es war nicht ganz einfach.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Urnol_14_02"); //Sehr schön. Und hast du auch den dunklen Pilger gesprochen?
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Urnol_15_03"); //Bis jetzt noch nicht. Er ist mir immer einen Schritt voraus.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Urnol_14_04"); //(zornig) Papperlapapp! Wir müssen unbedingt wissen, was ihn umtreibt. Mir schwant Schlimmes.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Urnol_14_05"); //Geh und finde diesen Pilger. Und dann berichte mir.

	B_LogEntry	(TOPIC_MOD_DIEBEDROHUNG, "Es scheint, als wäre der Pilger wichtig. Xardas will, dass ich ihn unbedingt aufsuche.");
};

INSTANCE Info_Mod_Xardas_NW_Urnol1 (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_Urnol1_Condition;
	information	= Info_Mod_Xardas_NW_Urnol1_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe einen Schattenlord getroffen.";
};

FUNC INT Info_Mod_Xardas_NW_Urnol1_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Urnol_WerBistDu))
	&& (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_WasFuerGilden))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_Urnol1_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Urnol1_15_00"); //Ich habe einen Schattenlord getroffen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Urnol1_14_01"); //Dann scheint die Bedrohung schon näher zu sein, als ich erwartet hatte. Was hat er dir erzählt?
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Urnol1_15_02"); //Er hat gesagt, dass sein Meister zurückkehren würde, um mich zu töten, weil ich einen seiner Diener getötet hätte.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Urnol1_14_03"); //Und der Diener war wahrscheinlich der Schläfer.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Urnol1_15_04"); //Ja, das hat der Schattenlord gesagt. Aber der Schläfer war doch der Gott der Orks und wurde auch von ihnen erschaffen?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Urnol1_14_05"); //Das dachte ich auch, doch scheinbar war ich nicht richtig informiert. Ich werde versuchen, mehr über die Sache rauszufinden.

	if (Mod_Gilde == 0)
	{
		AI_Output(self, hero, "Info_Mod_Xardas_NW_Urnol1_14_06"); //Schließ du dich erstmal einer Gilde an.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Xardas_NW_Urnol1_14_07"); //Komm morgen wieder, dann habe ich sicher Neuigkeiten für dich.

		Mod_HS_UrnolXardas_NextDay = Wld_GetDay();
	};

	AI_Output(self, hero, "Info_Mod_Xardas_NW_Urnol1_14_08"); //Übrigens: Diese dunkle Kreatur ist nicht das Einzige, was mich beschäftigt.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Urnol1_14_09"); //Auf einem Streifzug durch  Khorinis bin ich einem weiteren Wanderer begegnet.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Urnol1_14_10"); //Er nannte sich Argez, konnte mir aber nicht sagen, woher er kam.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Urnol1_14_11"); //Das Gespräch hätte nicht meine Aufmerksamkeit erregt, wenn ich nicht das dumpfe Gefühl hätte, den Namen schon einmal gehört zu haben. Vor einer langen Zeit ...
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Urnol1_14_12"); //Es kann gut sein, dass er in nebligen Spiel, das momentan mit uns gespielt wird, eine wichtige Figur ist.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Urnol1_14_13"); //Vielleicht triffst du ihn ja; er wollte nach Khorinis.

	B_GivePlayerXP	(250);

	if (!Npc_KnowsInfo(hero, Info_Mod_Argez_NW_Hi))
	{
		Log_CreateTopic	(TOPIC_MOD_ARGEZ, LOG_MISSION);
		B_SetTopicStatus	(TOPIC_MOD_ARGEZ, LOG_RUNNING);
	};

	B_LogEntry_More	(TOPIC_MOD_DIEBEDROHUNG, TOPIC_MOD_ARGEZ, "Nachdem ich Xardas von dem Treffen mit Urnol berichtet hatte, war dieser sehr überrascht, doch sein verdacht schien sich bestätigt zu haben. Besonders erstaunt hat ihn die Tatsache mit dem Schläfer.", "Xardas sprach von einer möglichen Schlüsselfigur bei seiner Vorahnung, die sich Argez nennt. Als Xardas ihn traf, war er gerade auf dem Weg nach Khorinis.");
};

INSTANCE Info_Mod_Xardas_NW_InGilde (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_InGilde_Condition;
	information	= Info_Mod_Xardas_NW_InGilde_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Xardas_NW_InGilde_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Urnol1))
	&& (Mod_Gilde > 0)
	&& (Mod_HS_UrnolXardas_NextDay < Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_InGilde_Info()
{
	AI_Output(self, hero, "Info_Mod_Xardas_NW_InGilde_14_00"); //Ah, gut, dass du kommst. Ich hab ein paar Sachen rausgefunden.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_InGilde_15_01"); //Das hatte ich gehofft.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_InGilde_14_02"); //Nun, ich fürchte beinahe, die Bedrohung ist größer als erwartet.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_InGilde_15_03"); //Geht's auch etwas konkreter?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_InGilde_14_04"); //Fürs Erste: nein. Ich bin zwar auf eine Spur gestoßen, aber ich möchte dich nicht mit Dingen belasten, bei denen ich mir nicht sicher bin, ob sie überhaupt existieren.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_InGilde_14_05"); //Du kannst mir allerdings einen großen Gefallen tun und den Wassermagiern an ihrer Ausgrabungsstätte helfen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_InGilde_14_06"); //Wenn ich richtig liege, wird uns das Portal, das sie entdeckt haben, einige wichtige Fragen beantworten.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_InGilde_15_07"); //(klagt) Aber meine wichtigen Fragen willst du nicht beantworten.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_InGilde_14_08"); //Dafür lasse ich dich an einem historischen Moment teilhaben. Nicht jeder darf in seinem Leben ein Jahrtausende altes Portal durchqueren.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_InGilde_15_09"); //Es gehörte auch bisher nicht zu meinen Lebenszielen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_InGilde_14_10"); //(streng) Aber jetzt!

	B_LogEntry	(TOPIC_MOD_DIEBEDROHUNG, "Xardas hat mich damit beauftragt, mit den Wassermagiern das Portal, welches sie entdeckt haben, zu durchschreiten.");
};

INSTANCE Info_Mod_Xardas_NW_Saturas (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_Saturas_Condition;
	information	= Info_Mod_Xardas_NW_Saturas_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Wassermagier werden mich sicher nicht mitnehmen wollen.";
};

FUNC INT Info_Mod_Xardas_NW_Saturas_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_InGilde))
	&& ((Mod_Gilde == 1)
	|| (Mod_Gilde == 6)
	|| (Mod_Gilde == 12))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_Saturas_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Saturas_15_00"); //Die Wassermagier werden mich sicher nicht mitnehmen wollen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Saturas_14_01"); //Dann übergib Saturas diese Botschaft von mir.

	B_GiveInvItems	(self, hero, XardasLetterForSaturas, 1);
};

INSTANCE Info_Mod_Xardas_NW_XeresLebt (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_XeresLebt_Condition;
	information	= Info_Mod_Xardas_NW_XeresLebt_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Xardas_NW_XeresLebt_Condition()
{
	if (Kapitel == 4)
	&& (Npc_KnowsInfo(hero, Info_Mod_Xeres_Beliar))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_XeresLebt_Info()
{
	AI_Output(self, hero, "Info_Mod_Xardas_NW_XeresLebt_14_00"); //Hast du Xeres vernichten können?
	AI_Output(hero, self, "Info_Mod_Xardas_NW_XeresLebt_15_01"); //Nein, er hat mich wieder besiegt. Ich lebe nur dank deinem Amulett noch.

	Log_CreateTopic	(TOPIC_MOD_MAGIERRAT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_MAGIERRAT, LOG_RUNNING);

	if (hero.guild == GIL_VLK)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Aaron_BarriereWeg))
	{
		AI_Output(self, hero, "Info_Mod_Xardas_NW_XeresLebt_14_02"); //Ich muss den Rat wieder einberufen. Jedoch werden meine Untergebenen, die zur Zeit in Patherion sind, dem nicht zustimmen.
		AI_Output(self, hero, "Info_Mod_Xardas_NW_XeresLebt_14_03"); //Du musst dafür sorgen, dass das Problem dort beseitigt wird, ehe ich den Rat einberufen kann.

		B_LogEntry	(TOPIC_MOD_MAGIERRAT, "Xardas will den Rat wieder einberufen, doch vorher muss ich die Probleme in Patherion lösen.");
	}
	else if (hero.guild == GIL_KDF)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Xardas_AW_Bshydal))
	{
		AI_Output(self, hero, "Info_Mod_Xardas_NW_XeresLebt_14_04"); //Ich muss den Rat wieder einberufen. Jedoch gibt es derzeit Dringlicheres.
		AI_Output(self, hero, "Info_Mod_Xardas_NW_XeresLebt_14_05"); //Du musst aber vorher noch etwas für Myxir erledigen. Komm wieder, wenn du es erledigt hast.

		B_LogEntry	(TOPIC_MOD_MAGIERRAT, "Xardas will den Rat wieder einberufen, doch vorher muss ich noch etwas für Myxir erledigen.");

		B_StartOtherRoutine	(self, "BUMMEL");
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Xardas_NW_XeresLebt_14_06"); //Ich werde den Magierrat wieder einberufen. Ich mache mich sofort auf den Weg.
		AI_Output(self, hero, "Info_Mod_Xardas_NW_XeresLebt_14_07"); //Er wird im Klosterkeller stattfinden. Wir treffen uns dann dort. Nimm diesen Ring, er wird dich dorthin bringen.

		B_GiveInvItems	(self, hero, Mod_XardasBeamRing, 1);

		B_LogEntry	(TOPIC_MOD_MAGIERRAT, "Xardas hat sich auf den Weg zur Einberufung des Magierrates gemacht. Dieser findet im Klosterkeller statt. Er hat mir einen Ring gegeben, welcher mich dorthin bringen wird.");

		if (Mod_Gilde != 2)
		&& (Mod_Gilde != 19)
		&& (Mod_Gilde != 7)
		&& (Mod_Gilde != 10)
		&& (Mod_Gilde != 13)
		&& (Mod_Gilde != 15)
		&& (Mod_Gilde != 17)
		{
			AI_Output(self, hero, "Info_Mod_Xardas_NW_XeresLebt_14_08"); //Allerdings solltest du erst den nächsthöheren Rang deiner Gilde erlangen.
		};

		Mod_HS_XardasRat = 1;

		AI_StopProcessInfos	(self);

		AI_Teleport	(self, "WP_KLOSTER_KELLER_RAT_VERTEILER");

		Npc_ExchangeRoutine	(self, "RAT");

		if (hero.guild == GIL_MIL)
		&& (!Npc_KnowsInfo(hero, Info_Mod_Dragon_KlosterErfolg))
		&& (!Npc_IsDead(Dragon_11009_NW))
		{
			Mod_HSNL_RatProblem = 1;
		}
		else if (hero.guild == GIL_NOV)
		&& (!Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_26))
		{
			Mod_HSWM_RatProblem = 1;

			// ToDo

			//Npc_ExchangeRoutine	(Mod_520_DMR_Raven_NW, "RAT");
			//Npc_ExchangeRoutine	(Mod_517_DMR_Gomez_NW, "RAT");
			Npc_ExchangeRoutine	(Mod_551_KDF_Pyrokar_NW, "RAT");
			Npc_ExchangeRoutine	(Mod_592_PAL_Hagen_NW, "RAT");
			Npc_ExchangeRoutine	(Mod_925_KDF_Talamon_NW, "RAT");
		}
		else
		{
			//Npc_ExchangeRoutine	(Mod_520_DMR_Raven_NW, "RAT");
			//Npc_ExchangeRoutine	(Mod_517_DMR_Gomez_NW, "RAT");
			Npc_ExchangeRoutine	(Mod_551_KDF_Pyrokar_NW, "RAT");
			Npc_ExchangeRoutine	(Mod_774_KDW_Saturas_NW, "RAT");
			Npc_ExchangeRoutine	(Mod_527_SLD_Torlof_NW, "RAT");
			Npc_ExchangeRoutine	(Mod_925_KDF_Talamon_NW, "RAT");

			if (hero.guild != GIL_PAL)
			{
				Npc_ExchangeRoutine	(Mod_592_PAL_Hagen_NW, "RAT");
			};
		};
	};
};

INSTANCE Info_Mod_Xardas_NW_PatherionOk (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_PatherionOk_Condition;
	information	= Info_Mod_Xardas_NW_PatherionOk_Info;
	permanent	= 0;
	important	= 0;
	description	= "Patherion ist sicher.";
};

FUNC INT Info_Mod_Xardas_NW_PatherionOk_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_XeresLebt))
	&& (Mod_HS_XardasRat == 0)
	&& (Npc_KnowsInfo(hero, Info_Mod_Aaron_BarriereWeg))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_PatherionOk_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_PatherionOk_15_00"); //Patherion ist sicher und die Schwarzmagier geschlagen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_PatherionOk_14_01"); //Das ist gut. Nun kann ich den Magierrat wieder einberufen. Ich werde sofort aufbrechen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_PatherionOk_14_02"); //Wir werden uns im Klosterkeller treffen. Mit diesem Ring kommst du dort hin.

	B_GiveInvItems	(self, hero, Mod_XardasBeamRing, 1);

	B_LogEntry	(TOPIC_MOD_MAGIERRAT, "Xardas hat sich auf den Weg zur Einberufung des Magierrates gemacht. Dieser findet im Klosterkeller statt. Er hat mir einen Ring gegeben, welcher mich dorthin bringen wird.");

	Mod_HS_XardasRat = 1;

	AI_StopProcessInfos	(self);

	AI_Teleport	(self, "WP_KLOSTER_KELLER_RAT_VERTEILER");

	// ToDo

	Npc_ExchangeRoutine	(self, "RAT");
	//Npc_ExchangeRoutine	(Mod_520_DMR_Raven_NW, "RAT");
	//Npc_ExchangeRoutine	(Mod_517_DMR_Gomez_NW, "RAT");
	Npc_ExchangeRoutine	(Mod_551_KDF_Pyrokar_NW, "RAT");
	Npc_ExchangeRoutine	(Mod_592_PAL_Hagen_NW, "RAT");
	Npc_ExchangeRoutine	(Mod_774_KDW_Saturas_NW, "RAT");
	Npc_ExchangeRoutine	(Mod_527_SLD_Torlof_NW, "RAT");
	Npc_ExchangeRoutine	(Mod_925_KDF_Talamon_NW, "RAT");
};

INSTANCE Info_Mod_Xardas_NW_BshydalOk (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_BshydalOk_Condition;
	information	= Info_Mod_Xardas_NW_BshydalOk_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du jetzt den Rat einberufen?";
};

FUNC INT Info_Mod_Xardas_NW_BshydalOk_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_XeresLebt))
	&& (Mod_HS_XardasRat == 0)
	&& (Npc_KnowsInfo(hero, Info_Mod_Xardas_AW_Bshydal))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_BshydalOk_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_BshydalOk_15_00"); //Kannst du jetzt den Rat einberufen?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_BshydalOk_14_01"); //Ja, ich werde sofort aufbrechen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_BshydalOk_14_02"); //Wir werden uns im Klosterkeller treffen. Mit diesem Ring kommst du dort hin.

	B_GiveInvItems	(self, hero, Mod_XardasBeamRing, 1);

	B_LogEntry	(TOPIC_MOD_MAGIERRAT, "Xardas hat sich auf den Weg zur Einberufung des Magierrates gemacht. Dieser findet im Klosterkeller statt. Er hat mir einen Ring gegeben, welcher mich dorthin bringen wird.");

	Mod_HS_XardasRat = 1;

	AI_StopProcessInfos	(self);

	AI_Teleport	(self, "WP_KLOSTER_KELLER_RAT_VERTEILER");

	// ToDo

	Npc_ExchangeRoutine	(self, "RAT");
	//Npc_ExchangeRoutine	(Mod_520_DMR_Raven_NW, "RAT");
	//Npc_ExchangeRoutine	(Mod_517_DMR_Gomez_NW, "RAT");
	Npc_ExchangeRoutine	(Mod_551_KDF_Pyrokar_NW, "RAT");
	Npc_ExchangeRoutine	(Mod_592_PAL_Hagen_NW, "RAT");
	Npc_ExchangeRoutine	(Mod_774_KDW_Saturas_NW, "RAT");
	Npc_ExchangeRoutine	(Mod_527_SLD_Torlof_NW, "RAT");
	Npc_ExchangeRoutine	(Mod_925_KDF_Talamon_NW, "RAT");
};

INSTANCE Info_Mod_Xardas_NW_Rat_Dragon (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_Rat_Dragon_Condition;
	information	= Info_Mod_Xardas_NW_Rat_Dragon_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Xardas_NW_Rat_Dragon_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_XeresLebt))
	&& (Mod_HS_XardasRat == 1)
	&& (Mod_HSNL_RatProblem == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_Rat_Dragon_Info()
{
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rat_Dragon_14_00"); //(aufgebracht) Diese engstirnigen Ignoranten ...
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Rat_Dragon_15_01"); //Was ist los?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rat_Dragon_14_02"); //Ach, die Feuermagier haben Zweifel daran, ob die Bedrohung wirklich so groß ist, dass sie ihr Schicksal in die Hände eine "gottlosen Söldners und Delinquenten aus der Strafkolonie" legen müssten, wie sie es nannten.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rat_Dragon_14_03"); //Es muss wohl erst etwas Fatales geschehen, was sie von der Unmittelbarkeit der Gefahr überzeugt ...

	B_LogEntry	(TOPIC_MOD_MAGIERRAT, "Xardas ist zwar beim Rat, der Rest will jedoch nicht teilnehmen, weil er die Bedrohung nicht wahrhaben will.");
};

INSTANCE Info_Mod_Xardas_NW_Rat_Dragon2 (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_Rat_Dragon2_Condition;
	information	= Info_Mod_Xardas_NW_Rat_Dragon2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Xardas_NW_Rat_Dragon2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_XeresLebt))
	&& (Mod_HS_XardasRat == 1)
	&& (Mod_HSNL_RatProblem == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_Rat_Dragon2_Info()
{
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rat_Dragon2_14_00"); //(süffisant) So, der Überfall dämonischer Kreaturen auf das Kloster hat die Feuermagier doch noch von der Dringlichkeit unseres Anliegens überzeugen können.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rat_Dragon2_14_01"); //Bevor sie jedoch die weiterführenden Schritte im Kampf gegen Xeres erörtern werden, möchten sie die Gefahr gebannt sehen, die ihr Kloster heimgesucht hat.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rat_Dragon2_14_02"); //Du weißt vermutlich, was zu tun ist.

	B_LogEntry	(TOPIC_MOD_MAGIERRAT, "Bevor die Feuermagier zum Treffen kommen, muss die Sache mit Drachen geklärt werden.");

	Mod_HSNL_RatProblem = 0;
};

INSTANCE Info_Mod_Xardas_NW_Rat_Unheil (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_Rat_Unheil_Condition;
	information	= Info_Mod_Xardas_NW_Rat_Unheil_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Xardas_NW_Rat_Unheil_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_XeresLebt))
	&& (Mod_HS_XardasRat == 1)
	&& (Mod_HSWM_RatProblem == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_Rat_Unheil_Info()
{
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rat_Unheil_14_00"); //Leider sind wir noch nicht vollständig und können somit auch die weiteren Schritte im Kampf gegen Xeres nicht erörtern.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rat_Unheil_14_01"); //Saturas sieht sich bei den Geschehnissen auf dem Weidenplateau mit nicht minder Bedrohlichem konfrontiert und wird erst zu uns stoßen, wenn diese Gefahr gebannt ist.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rat_Unheil_14_02"); //Du solltest ihn dabei nach deinen Möglichkeiten unterstützen.

	B_LogEntry	(TOPIC_MOD_MAGIERRAT, "Saturas wird erst zum Rat stoßen, wenn die Probleme auf dem Weidenplateau beseitigt sind.");
};

INSTANCE Info_Mod_Xardas_NW_Rat_Ende (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_Rat_Ende_Condition;
	information	= Info_Mod_Xardas_NW_Rat_Ende_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Xardas_NW_Rat_Ende_Condition()
{
	var int dialog;

	dialog = FALSE;

	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_XeresLebt))
	&& (Mod_HS_XardasRat == 1)
	&& (Mod_HSNL_RatProblem == 0)
	&& (Mod_HSWM_RatProblem == 0)
	{
		if (Hlp_IsValidNpc(Dragon_11009_NW))
		{
			if (Npc_IsDead(Dragon_11009_NW))
			{
				dialog = TRUE;
			}
			else
			{
				dialog = FALSE;

				return FALSE;
			};
		}
		else
		{
			dialog = TRUE;
		};
		if (Hlp_IsValidNpc(Knucker_11001_NW))
		{
			if (Npc_IsDead(Knucker_11001_NW))
			{
				dialog = TRUE;
			}
			else
			{
				dialog = FALSE;

				return FALSE;
			};
		}
		else
		{
			dialog = TRUE;
		};
		if (Hlp_IsValidNpc(Feuerdrache_11002_NW))
		{
			if (Npc_IsDead(Feuerdrache_11002_NW))
			{
				dialog = TRUE;
			}
			else
			{
				dialog = FALSE;

				return FALSE;
			};
		}
		else
		{
			dialog = TRUE;
		};
	};

	return dialog;
};

FUNC VOID Info_Mod_Xardas_NW_Rat_Ende_Info()
{
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rat_Ende_14_00"); //Wir haben nur noch eine Möglichkeit. Wir brauchen Uriziel. Du wirst in den Schläfertempel gehen und es holen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rat_Ende_14_01"); //Nur damit haben wir jetzt noch eine Chance. Nimm diese Teleportrune, damit kommst du hier raus und vor das Kloster.

	B_GiveInvItems	(self, hero, ItRu_TeleportMonastery, 1);

	Log_CreateTopic	(TOPIC_MOD_URIZIEL, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_URIZIEL, LOG_RUNNING);
	B_SetTopicStatus	(TOPIC_MOD_MAGIERRAT, LOG_SUCCESS);
	B_LogEntry	(TOPIC_MOD_URIZIEL, "Xardas sagt, dass ich Uriziel aus dem Schläfertempel holen muss. Es ist unsere einzige Chance.");
};

INSTANCE Info_Mod_Xardas_NW_WoTempel (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_WoTempel_Condition;
	information	= Info_Mod_Xardas_NW_WoTempel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wo war doch gleih der Eingang zum Tempel?";
};

FUNC INT Info_Mod_Xardas_NW_WoTempel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Rat_Ende))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_WoTempel_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_WoTempel_15_00"); //Wo war doch gleich der Eingang zum Tempel?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_WoTempel_14_01"); //In der Stadt der Orks. Dort wirst du einen Platz mit einer Säule finden. Von dort aus bist du in Xeres' Kammer gelangt.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_WoTempel_14_02"); //Dort ist jedenfalls ein Gitter, hinter welchem sich der Schläfertempel erstreckt.
};

INSTANCE Info_Mod_Xardas_NW_WieInTempel (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_WieInTempel_Condition;
	information	= Info_Mod_Xardas_NW_WieInTempel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie soll ich in den Tempel kommen?";
};

FUNC INT Info_Mod_Xardas_NW_WieInTempel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Rat_Ende))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_WieInTempel_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_WieInTempel_15_00"); //Wie soll ich in den Tempel kommen?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_WieInTempel_14_01"); //Du musst vorsichtig sein, die Orks wurden stark von Xeres beeinflusst. Sie werden dein Ulu-Mulu nicht mehr anerkennen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_WieInTempel_14_02"); //Ich weiß auch nicht, wie es im Tempel aussieht, also sei auf der Hut.
};

INSTANCE Info_Mod_Xardas_NW_UrizielKaputt (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_UrizielKaputt_Condition;
	information	= Info_Mod_Xardas_NW_UrizielKaputt_Info;
	permanent	= 0;
	important	= 0;
	description	= "Uriziel ist zerstört.";
};

FUNC INT Info_Mod_Xardas_NW_UrizielKaputt_Condition()
{
	if (Mod_HasUrizielKaputt == 1)
	&& (Npc_HasItems(hero, ItMi_UrizielKaputt) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_UrizielKaputt_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_UrizielKaputt_15_00"); //Uriziel ist zerstört.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_UrizielKaputt_14_01"); //Das ist nicht gut. Uriziel war meine letzte und größte Hoffnung. Wir sind Xeres nun schutzlos ausgeliefert.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_UrizielKaputt_15_02"); //Nicht unbedingt.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_UrizielKaputt_14_03"); //Was meinst du?
	AI_Output(hero, self, "Info_Mod_Xardas_NW_UrizielKaputt_15_04"); //Ich habe im Tempel einen Schamanen getroffen und er hat mir gesagt, dass Uriziel zerbrochen wurde.

	B_GiveInvItems	(hero, self, ItMi_UrizielKaputt, 1);

	AI_Output(hero, self, "Info_Mod_Xardas_NW_UrizielKaputt_15_05"); //Er meinte auch, dass nun die Macht der drei Götter gebrochen sei. Was bedeutet das?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_UrizielKaputt_14_06"); //Das bedeutet, dass wir noch eine Chance haben. Wie ich dir erzählt habe, gibt es den Göttern geweihte Waffen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_UrizielKaputt_14_07"); //Wenn wir nun von jedem Gott eine Waffe haben und diese vereinen ...
	AI_Output(hero, self, "Info_Mod_Xardas_NW_UrizielKaputt_15_08"); //... dann können wir Uriziel wieder herstellen. Was ist also zu tun?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_UrizielKaputt_14_09"); //Wir brauchen die restlichen zwei Götterwaffen. Du musst sie suchen. Wir werde versuchen, eine Methode zu finden, um sie zu vereinen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_UrizielKaputt_14_10"); //Geh zu Saturas, er hat sich mit der Geschichte der Götterwaffen beschäftigt.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_UrizielKaputt_14_11"); //Hier habe ich noch einige Beschwörungsspruchrollen, die dir vielleicht bei deiner Suche behilflich sein könnten.

	B_ShowGivenThings	("7 Spruchrollen erhalten");

	CreateInvItems	(hero, ItSc_SumSkel, 5);
	CreateInvItems	(hero, ItSc_SumRabbit, 2);

	AI_Output(self, hero, "Info_Mod_Xardas_NW_UrizielKaputt_14_12"); //Und dann gibt es noch etwas, was ich unter vier Augen mit dir besprechen möchte.

	B_LogEntry	(TOPIC_MOD_URIZIEL, "Xardas hat eine Idee, wie wir Uriziel wiederherstellen können. Dazu brauchen wir allerdings noch die restlichen zwei Götterwaffen. Saturas weiß mehr darüber.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "PRIVAT");
};

INSTANCE Info_Mod_Xardas_NW_UrnolKap4 (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_UrnolKap4_Condition;
	information	= Info_Mod_Xardas_NW_UrnolKap4_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ja, ich bin ganz Ohr.";
};

FUNC INT Info_Mod_Xardas_NW_UrnolKap4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_UrizielKaputt))
	&& (Npc_GetDistToWP(self, "NW_KDF_LIBRARY_15") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_UrnolKap4_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_UrnolKap4_15_00"); //Ja, ich bin ganz Ohr.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_UrnolKap4_14_01"); //Ich kann spüren, dass Urnol sich auf Khorinis befindet ... und erscheint sich frei umherzubewegen, auch in bewohnten Gebieten.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_UrnolKap4_15_02"); //Was?! Und es ist keinem etwas aufgefallen?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_UrnolKap4_14_03"); //Das ist ja eben das Beunruhigende. Er muss einen Weg gefunden zu haben, sich zu tarnen, zu verbergen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_UrnolKap4_14_04"); //Und dann kann ich noch zahlreiche andere diffuse dämonische Energien spüren, die ebenfalls zu Tag, als auch bei Nacht ihren Standort wechseln ...
	AI_Output(self, hero, "Info_Mod_Xardas_NW_UrnolKap4_14_05"); //Es scheinen merkwürdige Dinge im Verborgenen abzulaufen. Du musst versuchen zu ergründen, was vor sich geht. Nur so kannst du Urnol finden.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_UrnolKap4_15_06"); //Gut, ich verstehe ... hmm, wo sollte ich am besten meine Suche beginnen?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_UrnolKap4_14_07"); //Benutze deinen Verstand. Dort, wo viele Menschen aufeinander treffen, ist auch die Chance am größten, dass jemandem etwas auffällt.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_UrnolKap4_14_08"); //Tavernen sind immer eine gute Anlaufstelle. Höre und schaue dich aber auch in der Stadt und den Bauernhöfen um.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_UrnolKap4_14_09"); //Aber sei vorsichtig ... das Böse könnte in nächster Nähe lauern, ohne, dass es sich als solches zu erkennen gibt.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "RAT");

	AI_Teleport	(Mod_534_KDF_Milten_NW, "NW_KDF_LIBRARY_21");
	B_StartOtherRoutine	(Mod_534_KDF_Milten_NW, "PRIVAT");
	AI_Teleport	(Mod_534_KDF_Milten_NW, "NW_KDF_LIBRARY_21");

	Log_CreateTopic	(TOPIC_MOD_DAEMONISCH, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_DAEMONISCH, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Xardas spürt Urnols Anwesenheit auf bewohntem Terrain um Khorinis, wie auch andere diffuse dämonische Energien. Ich soll mich umhören und umsehen, ob mir ungewöhnliche Dinge auffallen, und ihm dann Bericht erstatten. Ich sollte mich bei Tavernen, aber auch auf den Bauernhöfen und in der Stadt umhören.");
};

INSTANCE Info_Mod_Xardas_NW_Daemonisch (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_Daemonisch_Condition;
	information	= Info_Mod_Xardas_NW_Daemonisch_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich habe Neues zu berichten.";
};

FUNC INT Info_Mod_Xardas_NW_Daemonisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_UrnolKap4))
	&& (Mod_HQ_Daemonisch == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_Daemonisch_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Daemonisch_15_00"); //Ich habe Neues zu berichten.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Daemonisch_14_01"); //Ja, was hast du herausgefunden?

	if (Npc_KnowsInfo(hero, Info_Mod_Rosi_Daemonisch))
	{
		AI_Output(hero, self, "Info_Mod_Xardas_NW_Daemonisch_15_02"); //Leute verändern sich schlagartig, wenn sie in der Dunkelheit unterwegs waren.
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Babo_Daemonisch))
	|| (Npc_KnowsInfo(hero, Info_Mod_Orlan_Daemonisch))
	|| (Npc_KnowsInfo(hero, Info_Mod_Opolos_Daemonisch))
	{
		AI_Output(hero, self, "Info_Mod_Xardas_NW_Daemonisch_15_03"); //In Zusammenhang mit dem Klosterwein gibt es Seltsames zu erzählen.

		if (Npc_KnowsInfo(hero, Info_Mod_Babo_Daemonisch))
		{
			AI_Output(hero, self, "Info_Mod_Xardas_NW_Daemonisch_15_04"); //Der Novize Dyrian starb plötzlich, nachdem er in der Messe Klosterwein genossen hatte.
			AI_Output(hero, self, "Info_Mod_Xardas_NW_Daemonisch_15_05"); //Ein anderer Novize hat dabei gesehen, wie schwarzer Rauch aus ihm ausgetreten ist.
		};
		if (Npc_KnowsInfo(hero, Info_Mod_Orlan_Daemonisch))
		{
			AI_Output(hero, self, "Info_Mod_Xardas_NW_Daemonisch_15_06"); //Rukhar trank viel Klosterwein, bevor er einige Leute abends nach draußen begleitete.
			AI_Output(hero, self, "Info_Mod_Xardas_NW_Daemonisch_15_07"); //Er kam alleine in die Taverne zurückgelaufen und war völlig verstört.
			AI_Output(hero, self, "Info_Mod_Xardas_NW_Daemonisch_15_08"); //Seine Begleiter kamen nach ihm unversehrt zurück.
			AI_Output(hero, self, "Info_Mod_Xardas_NW_Daemonisch_15_09"); //Am nächsten Morgen war Rukhar tot.
			AI_Output(hero, self, "Info_Mod_Xardas_NW_Daemonisch_15_10"); //In Orlans Taverne trinkt kaum noch jemand den Wein des Klosters.
		};
		if (Npc_KnowsInfo(hero, Info_Mod_Opolos_Daemonisch))
		{
			AI_Output(hero, self, "Info_Mod_Xardas_NW_Daemonisch_15_11"); //Im Kloster sollen viele Novizen an Magenerkrankungen leiden und können keinen Klosterwein mehr genießen.
		};
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Thekla_Daemonisch))
	|| (Npc_KnowsInfo(hero, Info_Mod_Orlan_Daemonisch))
	|| (Npc_KnowsInfo(hero, Info_Mod_Coragon_Daemonisch))
	{
		AI_Output(hero, self, "Info_Mod_Xardas_NW_Daemonisch_15_12"); //Es gibt zahlreiche Menschen, die ungewöhnlich viel essen.
		AI_Output(hero, self, "Info_Mod_Xardas_NW_Daemonisch_15_13"); //Und dennoch erscheinen sie alle ausgezehrt, verfallen körperlich zusehends.
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Tengron_Daemonisch))
	|| (Npc_KnowsInfo(hero, Info_Mod_Brian_Daemonisch))
	|| (Npc_KnowsInfo(hero, Info_Mod_Orlan_Daemonisch))
	|| (Npc_KnowsInfo(hero, Info_Mod_Pepe_Daemonisch))
	{
		AI_Output(hero, self, "Info_Mod_Xardas_NW_Daemonisch_15_14"); //Einige Menschen wollen schwarze Schatten im Dunkeln erblickt haben.
		AI_Output(hero, self, "Info_Mod_Xardas_NW_Daemonisch_15_15"); //Doch diesen Augenzeugen ergeht es zumeist nicht gut.

		if (Npc_KnowsInfo(hero, Info_Mod_Tengron_Daemonisch))
		{
			AI_Output(hero, self, "Info_Mod_Xardas_NW_Daemonisch_15_16"); //Tengron sitzt im Kerker.
		};
		if (Npc_KnowsInfo(hero, Info_Mod_Brian_Daemonisch))
		{
			AI_Output(hero, self, "Info_Mod_Xardas_NW_Daemonisch_15_17"); //Brian wurde von Paladinen getötet.

			if (Mod_HQ_BrianDaemonisch == 2)
			{
				AI_Output(hero, self, "Info_Mod_Xardas_NW_Daemonisch_15_18"); //Mich versuchten sie auch zu töten, als sie erfuhren, was Brian mir berichtet hatte.
			};
		};
		if (Npc_KnowsInfo(hero, Info_Mod_Orlan_Daemonisch))
		{
			AI_Output(hero, self, "Info_Mod_Xardas_NW_Daemonisch_15_19"); //Rukhar ist tot.
		};
		if (Npc_KnowsInfo(hero, Info_Mod_Pepe_Daemonisch))
		{
			AI_Output(hero, self, "Info_Mod_Xardas_NW_Daemonisch_15_20"); //Pepe hält sich versteckt und fürchtet um sein Leben.
		};
	};

	if (Mod_HQ_PaladineDaemonisch == TRUE)
	{
		AI_Output(hero, self, "Info_Mod_Xardas_NW_Daemonisch_15_21"); //Ich sah untote Paladine nahe der Stadt, die nicht lange zuvor noch lebendig waren.
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Tengron_Daemonisch))
	|| (Npc_KnowsInfo(hero, Info_Mod_Pepe_Daemonisch))
	{
		AI_Output(hero, self, "Info_Mod_Xardas_NW_Daemonisch_15_22"); //Manche sahen sogar, wie Menschen unter dem Einfluss der Schatten zu Boden sanken, zunächst wie leblos schienen und sich dann zuckend erhoben.
	};

	if (Mod_HQ_SPGesehen == TRUE)
	{
		AI_Output(hero, self, "Info_Mod_Xardas_NW_Daemonisch_15_23"); //Ich begegnete selbst schwarzen Schatten in der Nacht, die mich attackierten.

		if (Npc_KnowsInfo(hero, Info_Mod_Rupert_Daemonisch3))
		{
			AI_Output(hero, self, "Info_Mod_Xardas_NW_Daemonisch_15_24"); //Der Bürger Rupert war es sogar, der mich zu ihnen lockte und davon sprach, ich würde ihnen beitreten, oder sterben.
		};
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Tengron_Daemonisch))
	|| (Npc_KnowsInfo(hero, Info_Mod_Pepe_Daemonisch))
	|| (Mod_HQ_SPGesehen == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_Xardas_NW_Daemonisch_14_25"); //Bei Beliar, wir schweben alle in größter Gefahr.
		AI_Output(self, hero, "Info_Mod_Xardas_NW_Daemonisch_14_26"); //Selbst ich hätte den Wald vor lauter Bäumen nicht gesehen ...
		AI_Output(hero, self, "Info_Mod_Xardas_NW_Daemonisch_15_27"); //Wovon sprichst du?
		AI_Output(self, hero, "Info_Mod_Xardas_NW_Daemonisch_14_28"); //Während wir unsere Augen auf die orkischen Horden im Minental richten und uns auf eine kriegerische Auseinandersetzung vorbereiten, infiltriert Xeres unbemerkt mit seinen Schattenwesen ganz Khorinis.
		AI_Output(self, hero, "Info_Mod_Xardas_NW_Daemonisch_14_29"); //Sie ergreifen Besitz von jedem Menschen, der ihnen begegnet, kontrollieren ihn und zehren ihn allmählich aus.
		AI_Output(self, hero, "Info_Mod_Xardas_NW_Daemonisch_14_30"); //Was zum Schluss bleibt, ist die leblose Hülle, die zum Untoten wird.
		AI_Output(self, hero, "Info_Mod_Xardas_NW_Daemonisch_14_31"); //Wenn wir uns nicht beeilen, wird bald jede Siedlung unter Xeres' Einfluss stehen.
		AI_Output(hero, self, "Info_Mod_Xardas_NW_Daemonisch_15_32"); //Was können wir tun, um die Schattenwesen aufzuhalten?

		if (Npc_KnowsInfo(hero, Info_Mod_Babo_Daemonisch))
		|| (Npc_KnowsInfo(hero, Info_Mod_Orlan_Daemonisch))
		|| (Npc_KnowsInfo(hero, Info_Mod_Opolos_Daemonisch))
		{
			AI_Output(self, hero, "Info_Mod_Xardas_NW_Daemonisch_14_33"); //Nun, deine Ausführungen in Zusammenhang mit dem Klosterwein lassen gesegnete Getränke als Möglichkeit erkennen, die Besessenen von ihrem Parasiten zu befreien.
			AI_Output(hero, self, "Info_Mod_Xardas_NW_Daemonisch_15_34"); //Soll ich jetzt etwa zu jedem hinrennen und ihn zu einem Schluck Klosterwein oder "Heilung der Besessenheit" überreden?
			AI_Output(self, hero, "Info_Mod_Xardas_NW_Daemonisch_14_35"); //Um Beliars Willen, nein, natürlich nicht. Jetzt ist auch nicht der rechte Zeitpunkt für Possen.
			AI_Output(self, hero, "Info_Mod_Xardas_NW_Daemonisch_14_36"); //Die Verbundenheit der Schattenwesen mit der Lebenskraft ihrer Wirte ist zu stark.
			AI_Output(self, hero, "Info_Mod_Xardas_NW_Daemonisch_14_37"); //Ein so starker Trank würde zwar schlagartig den Dämonen bannen, aber auch das Leben der Betroffenen erlöschen lassen.
			AI_Output(self, hero, "Info_Mod_Xardas_NW_Daemonisch_14_38"); //Versuche es ihnen unbemerkt in einer der Gaststätten beizumischen, oder die Nahrung an einem Alchemietisch damit zu tränken.
			AI_Output(hero, self, "Info_Mod_Xardas_NW_Daemonisch_15_39"); //(unwillig) In Ordnung, dann darf ich jetzt also einige Tränke zur Heilung von Besessenheit auftreiben.
			AI_Output(self, hero, "Info_Mod_Xardas_NW_Daemonisch_14_40"); //Das wird glaube ich nicht notwendig sein. Hier.

			B_GiveInvItems	(self, hero, ItMi_HolyWater, 3);

			AI_Output(hero, self, "Info_Mod_Xardas_NW_Daemonisch_15_41"); //Und was soll ich jetzt damit?
			AI_Output(self, hero, "Info_Mod_Xardas_NW_Daemonisch_14_42"); //An einem Alchemietisch einen Feldknöterich zu den geweihten Wässerchen mischen und damit drei Tränke zur Heilung der Besessenheit erhalten ...
			AI_Output(hero, self, "Info_Mod_Xardas_NW_Daemonisch_15_43"); //Woher ...
			AI_Output(self, hero, "Info_Mod_Xardas_NW_Daemonisch_14_44"); //Ich war einst selbst Feuermagier - vergiss das nicht - und weiß somit Bescheid, woraus sich die überteuerten Tränke des Klosters zusammensetzen.
			AI_Output(hero, self, "Info_Mod_Xardas_NW_Daemonisch_15_45"); //Ach so, stimmt, vergesse ich bisweilen, da ich dich bisher immer nur in der dunklen Robe zu Gesicht bekam ...
			AI_Output(self, hero, "Info_Mod_Xardas_NW_Daemonisch_14_46"); //Und vergiss nicht, sowohl bei der Stadt als auch bei Orlan und Großbauernhof vorbeizuschauen ... und vergewissere dich jeweils, ob du auch Erfolg hattest.

			Mod_HQ_Daemonisch = 1;

			B_GivePlayerXP	(800);

			B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Aha, also übernehmen die Schattenwesen die Kontrolle über Menschen. Ich soll bei der Gaststätte in der Stadt, bei Orlan und dem Großbauernhof vorbeischauen, um geheiligte Tränke ins Essen und Trinken zu mischen. Das sollte die Parasiten aus ihren Wirten bannen ... wovon ich mich aber jedes Mal selbst überzeugen sollte.");

			if (Npc_KnowsInfo(hero, Info_Mod_Babo_Daemonisch))
			{
				B_StartOtherRoutine	(Mod_914_NOV_Babo_NW, "DAEMONISCH3");
			};
		}
		else
		{
			AI_Output(self, hero, "Info_Mod_Xardas_NW_Daemonisch_14_47"); //Nun, das weiß ich selbst leider noch nicht so genau.
			AI_Output(self, hero, "Info_Mod_Xardas_NW_Daemonisch_14_48"); //Du musst unbedingt versuchen, noch mehr bei Gaststätten und Siedlungen in der Umgebung herauszufinden.

			B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Ich muss versuchen, noch mehr bei Siedlungen und Gaststätten der Umgebung in Erfahrung zu bringen.");
		};
	}
	else if (Npc_KnowsInfo(hero, Info_Mod_Tengron_Daemonisch))
	|| (Npc_KnowsInfo(hero, Info_Mod_Brian_Daemonisch))
	|| (Npc_KnowsInfo(hero, Info_Mod_Orlan_Daemonisch))
	|| (Npc_KnowsInfo(hero, Info_Mod_Pepe_Daemonisch))
	|| (Mod_HQ_PaladineDaemonisch == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_Xardas_NW_Daemonisch_14_49"); //Was du mir berichtest, ist äußert beunruhigend. Versuch unbedingt mehr zu erfahren. Mir schwant Böses ...
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Xardas_NW_Daemonisch_14_50"); //Sehr mysteriös. Das könnten wichtige Anhaltspunkte sein. Versuch mehr herauszufinden.
	};
};

INSTANCE Info_Mod_Xardas_NW_Daemonisch2 (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_Daemonisch2_Condition;
	information	= Info_Mod_Xardas_NW_Daemonisch2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe die Tränke an die Befallenen gebracht.";
};

FUNC INT Info_Mod_Xardas_NW_Daemonisch2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_UrnolKap4))
	&& (Mod_HQ_Daemonisch == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_Daemonisch2_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Daemonisch2_15_00"); //Ich habe die Tränke an die Befallenen gebracht. Die Gefahr sollte somit erkannt und gebannt sein.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Daemonisch2_14_01"); //Wirklich, gebannt? Sehr nachlässig, während doch noch die Horden dieser Seelenpeiniger durch die Nacht streifen.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Daemonisch2_15_02"); //Ich soll doch nicht etwa ...?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Daemonisch2_14_03"); //Doch, du sollst ... und bei der Gelegenheit kannst du dich gleich noch nach Hinweisen umblicken.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Daemonisch2_14_04"); //Urnol treibt sich noch immer hier irgendwo umher, vergiss das nicht ...
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Daemonisch2_14_05"); //Und denk daran, die Schatten meiden das Licht. Nutze dieses Wissen, wenn du ihnen gegenübertrittst.

	B_GivePlayerXP	(400);

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Xardas will, dass ich die Seelenpeiniger besiege und dabei gleich nach weiteren Hinweisen Ausschau halte. Schließlich treibt sich Urnol noch immer irgendwo hier herum.");

	Mod_HQ_Daemonisch = 3;

	Wld_InsertNpc	(Mod_13021_SP_Seelenpeiniger_NW, "TAVERNE");
	Wld_InsertNpc	(Mod_13022_SP_Seelenpeiniger_NW, "TAVERNE");
	Wld_InsertNpc	(Mod_13023_SP_Seelenpeiniger_NW, "TAVERNE");
	Wld_InsertNpc	(Mod_13024_SP_Seelenpeiniger_NW, "TAVERNE");
	Wld_InsertNpc	(Mod_13025_SP_Seelenpeiniger_NW, "TAVERNE");
	Wld_InsertNpc	(Mod_13026_SP_Seelenpeiniger_NW, "TAVERNE");
};

INSTANCE Info_Mod_Xardas_NW_Daemonisch3 (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_Daemonisch3_Condition;
	information	= Info_Mod_Xardas_NW_Daemonisch3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Xardas_NW_Daemonisch3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Urnol_Daemonisch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_Daemonisch3_Info()
{
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Daemonisch3_14_00"); //Ich spüre Urnols Präsenz nicht mehr in der Umgebung. Folglich warst du erfolgreich?
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Daemonisch3_15_01"); //Ja, seine Maskerade hat ein Ende. Er sprach davon, Xeres’ Armeen zu befehligen und dürfte sich zurück ins Minental begeben haben.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Daemonisch3_14_02"); //Ausgezeichnet. Sobald du alle Götterwaffen bei dir hast, sollte dem Ende von Xeres' Lakaien nichts mehr im Wege stehen.

	AI_Output(self, hero, "Info_Mod_Xardas_NW_Daemonisch3_14_03"); //Hmm, Urnol sprach also von der orkischen Armee.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Daemonisch3_14_04"); //Wie ich gehört habe, machten sie das alte Lager nieder und richteten dort ihren neuen Stützpunkt ein. Vielleicht wirst du ihn dort vorfinden.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Daemonisch3_14_05"); //Hier hast du eine Teleportspruchrolle in das Alte Lager und Spruchrollen, welche dafür sorgen werden, dass du unerkannt bleibst.

	CreateInvItems	(hero, ItSc_TeleportOldcamp, 1);
	CreateInvItems	(hero, ItSc_TrfSkeleton, 2);

	B_ShowGivenThings	("3 Spruchrollen erhalten");	

	AI_Output(self, hero, "Info_Mod_Xardas_NW_Daemonisch3_14_06"); //Viel Erfolg.

	B_GivePlayerXP	(400);

	B_SetTopicStatus	(TOPIC_MOD_DAEMONISCH, LOG_SUCCESS);

	B_StartOtherRoutine	(Mod_981_RIT_Tengron_NW, "START");

	Mod_SenyanTom_Kraut_Tag = Wld_GetDay();
	Mod_SP_Killed_Day = Wld_GetDay();
};

INSTANCE Info_Mod_Xardas_NW_HolyHammer (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_HolyHammer_Condition;
	information	= Info_Mod_Xardas_NW_HolyHammer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du den Heiligen Hammer noch?";
};

FUNC INT Info_Mod_Xardas_NW_HolyHammer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andokai_Hammer))
	&& (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_UrizielKaputt))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_HolyHammer_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_HolyHammer_15_00"); //Hast du den Heiligen Hammer noch?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_HolyHammer_14_01"); //Natürlich habe ich den Hammer noch. Du denkst doch nicht etwa, dass ich nicht weiß, was es mit ihm auf sich hat.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_HolyHammer_14_02"); //Schließlich war ich vor der Erschaffung der Barriere Oberhaupt der Feuermagier. Hier ist er.

	B_GiveInvItems	(self, hero, Holy_Hammer_MIS, 1);

	B_LogEntry	(TOPIC_MOD_URIZIEL, "Xardas hat mit den heiligen Hammer gegeben.");
};

INSTANCE Info_Mod_Xardas_NW_Goetterschwerter (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_Goetterschwerter_Condition;
	information	= Info_Mod_Xardas_NW_Goetterschwerter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab die drei Waffen.";
};

FUNC INT Info_Mod_Xardas_NW_Goetterschwerter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_UrizielKaputt))
	&& ((Npc_HasItems(hero, ItMw_Adanos_Stab_Magieteil) == 1)
	|| (Npc_HasItems(hero, ItMw_Adanos_Stab_Kampfteil) == 1))
	&& (Npc_HasItems(hero, Holy_Hammer_MIS) == 1)
	&& ((Npc_HasItems(hero, ItMw_BeliarWeapon_1H_01) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_02) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_03) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_04) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_05) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_06) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_07) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_08) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_09) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_10) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_11) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_12) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_13) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_14) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_15) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_16) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_17) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_18) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_19) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_1H_20) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_01) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_02) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_03) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_04) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_05) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_06) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_07) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_08) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_09) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_10) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_11) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_12) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_13) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_14) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_15) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_16) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_17) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_18) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_19) == 1)
	|| (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_20) == 1))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_Goetterschwerter_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Goetterschwerter_15_00"); //Ich hab die drei Waffen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Goetterschwerter_14_01"); //Ausgezeichnet! Mit der Macht der drei Götter sollten wir prinzipiell dazu in der Lage sein, Uriziel wiederherzustellen.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Goetterschwerter_15_02"); //Gut. Wann werdet ihr das Ritual vollziehen?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Goetterschwerter_14_03"); //Nun ... die Frage sollte viel eher lauten, "wo".
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Goetterschwerter_14_04"); //Wir haben intensiv nach einem geeigneten Ritualplatz gesucht ... sind jedoch nicht fündig geworden auf Khorinis.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Goetterschwerter_15_05"); //Was? Wie kann das sein? Jharkendar ist doch der Ursprung der alten Kultur.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Goetterschwerter_14_06"); //Ja, zweifelsohne gab es hier auch einst solche Ritualstätten ...
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Goetterschwerter_14_07"); //Während der Schreckensherrschaft von Xeres müssen diese jedoch zerstört worden sein ... oder von den Gezeiten abgetragen.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Goetterschwerter_15_08"); //Und wie wollen wir dann Uriziel wiederherstellen?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Goetterschwerter_14_09"); //Darauf wollte ich gerade zu sprechen kommen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Goetterschwerter_14_10"); //Quellen geben preis, dass viele Erbauer sich der Verfolgung durch Xeres entzogen, indem sie Portale zu anderen Regionen der Welt öffneten.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Goetterschwerter_14_11"); //Unter ihnen waren auch einige Priester und Gelehrte, welche dem Morden entkommen waren.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Goetterschwerter_14_12"); //Ohne sie wären die Teleportationsvorgänge über große Distanz so vieler Menschen auch nicht möglich gewesen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Goetterschwerter_14_13"); //Wir konnten die Zielkoordinaten eines ihrer Portale entschlüsseln und glauben, dass es sich um eine Insel handeln muss, weitab vom Festland.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Goetterschwerter_15_14"); //Und ihr erhofft euch nun, dort die benötigte Ritualstätte zu finden?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Goetterschwerter_14_15"); //Ja, so unsere Erwartung.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Goetterschwerter_14_16"); //Wir haben nun unter großem Aufwand Foki aus magischem Erz so justiert, dass sie den Teleport nachvollziehen sollten.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Goetterschwerter_15_17"); //Dann muss man also nur noch die Teleportflamme durchschreiten und sich dort umsehen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Goetterschwerter_14_18"); //Genau. Vorerst kann jedoch nur eine Person hindurchgehen. Das magische Gefüge ist noch sehr instabil.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Goetterschwerter_14_19"); //Dieser Pionier müsste dann eine der Teleportplattformen aktivieren, die sich zweifelsohne auf der Insel befinden.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Goetterschwerter_14_20"); //Dann bestünde nämlich eine stabile magische Verbindung zwischen hier und dort.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Goetterschwerter_15_21"); //Ach so. Ich vermute mal, dass die Wahl auf mich gefallen ist?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Goetterschwerter_14_22"); //Genau. Wir wissen nämlich nicht genau, was uns dort erwartet.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Goetterschwerter_14_23"); //Die Insel ist aller Voraussicht nach seit langem wieder verlassen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Goetterschwerter_14_24"); //Es könnten dort viele Gefahren lauern, Kreaturen längst vergangener Zeit, magische Geschöpfe und Wächter.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Goetterschwerter_14_25"); //Auch heißt es, die Insel sei aus Feuer geboren, welches den Tiefen des Ozeans entsprang.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Goetterschwerter_14_26"); //Es könnte sich also als Umgebung herausstellen, der nicht jeder gewachsen ist.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Goetterschwerter_14_27"); //Da wir jedoch möglicherweise nur einen einzigen Versuch haben, fiel unsere Wahl auf den Mann, der sich schon oft durch seine Taten hervorgehoben hat, denjenigen, der dem Tode viele Male entrann und dem die Götter stets gewogen waren. Auf dich.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Goetterschwerter_15_28"); //Verstehe.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Goetterschwerter_14_29"); //Wir haben bereits einen magischen Fokus aus Erz durch die Teleportflamme geschickt.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Goetterschwerter_14_30"); //Sobald du dort bist, musst du nur noch eine Teleportplattform finden und sie mit dem Fokus aktivieren ...
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Goetterschwerter_15_31"); //In Ordnung. Wann soll ich losgehen?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Goetterschwerter_14_32"); //Die Teleportflamme steht für dich bereit und du kannst jederzeit durchgehen, wenn du dich so weit fühlst.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Goetterschwerter_14_33"); //Hier hast du den Schlüssel zur Tür, damit du den Teleporter erreichen kannst.

	B_GiveInvItems	(self, hero, ItKe_RitualsinselDoor, 1);

	AI_Output(self, hero, "Info_Mod_Xardas_NW_Goetterschwerter_14_34"); //Der Segen der Götter möge dich begleiten.

	B_LogEntry	(TOPIC_MOD_URIZIEL, "Na schön, das Ritual soll auf einer fernen Insel erfolgen. Dazu muss ich jedoch durch die Teleportflamme im Klosterkeller und eine Teleportplattform auf der Insel aktivieren. Der magische Fokus dafür befindet sich bereits vor Ort.");

	B_GivePlayerXP	(1000);

	B_Kapitelwechsel	(5, NEWWORLD_ZEN);

	if (Mod_Gilde == 2)
	{
		Npc_ExchangeRoutine (Mod_579_RIT_Girion_NW, "SLD");

		AI_UnequipArmor	(Mod_579_RIT_Girion_NW);
		CreateInvItems	(Mod_579_RIT_Girion_NW, ItAr_Sld_M, 1);
		AI_EquipArmor	(Mod_579_RIT_Girion_NW, ItAr_Sld_M);

		Wld_InsertNpc	(Demon, "FP_ROAM_NW_TROLLAREA_RIVERSIDECAVE_07_02");
		Wld_InsertItem	(Pala_Feuer_Amulett, "FP_ROAM_NW_TROLLAREA_RIVERSIDECAVE_07_03");
	};
};

INSTANCE Info_Mod_Xardas_NW_Trimedron (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_Trimedron_Condition;
	information	= Info_Mod_Xardas_NW_Trimedron_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Xardas_NW_Trimedron_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Trimedron_Formel))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_Trimedron_Info()
{
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Trimedron_14_00"); //Du bist zurück! Ich darf also annehmen, dass du erfolgreich warst?
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Trimedron_15_01"); //Ja, der Teleporter ist aktiviert. Und ich konnte Neues in Erfahrung bringen ...
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Trimedron_14_02"); //Berichte ...
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Trimedron_15_03"); //Auf der Insel befindet sich tatsächlich eine Zeremoniestätte.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Trimedron_15_04"); //Diese wird von einem Geist der alten Kultur bewacht.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Trimedron_14_05"); //Ein potentieller Zeuge vorangegangener Jahrhunderte? Vortrefflich! Erzähl weiter ...
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Trimedron_15_06"); //Er berichtete mir, dass die Kultur auf der Insel durch eine Naturkatastrophe ausgelöscht wurde. Ihre Siedlung ...
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Trimedron_14_07"); //(unterbricht) Das ist tragisch ... aber von größerer Wichtigkeit als diese Einzelheiten ist der Zugang zur Ritualstätte. Wie steht es darum?
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Trimedron_15_08"); //Er hat Bedingungen gestellt, ehe er uns Einlass gewährt.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Trimedron_15_09"); //Ich soll ihm als Zeugnis der drohenden Gefahr die Seelensteine der Machtträger bringen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Trimedron_14_10"); //Die fünf Machtträger?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Trimedron_14_11"); //Nun, da wir uns ihrer früher oder später hätten entledigen müssen, wird es nur bedeuten, diese Aufgabe vorzuziehen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Trimedron_14_12"); //Den Seelenstein des Schläfers werden wir jedoch schwerlich bergen können.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Trimedron_14_13"); //Er wird der Zwischenwelt nicht mehr so schnell entrinnen können.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Trimedron_15_14"); //Was ist mit den anderen?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Trimedron_14_15"); //Nun, ein weiterer Machtträger, war, wie schon erwähnt, schwächlicher Art.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Trimedron_14_16"); //Dies geben die lückenhaften Quellen von Xeres' Gefolgsleuten aus der Zeit seiner Schreckensherrschaft preis.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Trimedron_14_17"); //Jedoch können wir nichts Näheres zu diesem Geschöpf sagen ... weder, wo es sich zur Zeit befindet, noch, ob es überhaupt erwacht ist.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Trimedron_14_18"); //Geh zu Pyrokar, er hat sich mehr mit den Machtträgern befasst.

	B_LogEntry	(TOPIC_MOD_URIZIEL, "Pyrokar kann mir hoffentlich mehr über die Aufenthaltsorte der Machtträger sagen.");

	if (Mod_Gilde == 2)
	{
		Npc_ExchangeRoutine (Mod_579_RIT_Girion_NW, "SLD");

		AI_UnequipArmor	(Mod_579_RIT_Girion_NW);
		CreateInvItems	(Mod_579_RIT_Girion_NW, ItAr_Sld_M, 1);
		AI_EquipArmor	(Mod_579_RIT_Girion_NW, ItAr_Sld_M);

		Wld_InsertNpc	(Demon, "FP_ROAM_NW_TROLLAREA_RIVERSIDECAVE_07_02");
		Wld_InsertItem	(Pala_Feuer_Amulett, "FP_ROAM_NW_TROLLAREA_RIVERSIDECAVE_07_03");
	};

	if (hero.guild == GIL_VLK)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Aaron_Party))
	{
		AI_Output(self, hero, "Info_Mod_Xardas_NW_Trimedron_14_19"); //Pyrokar will Khorinis übrigens erst verlassen, wenn er Patherion in Sicherheit weiß.
		AI_Output(self, hero, "Info_Mod_Xardas_NW_Trimedron_14_20"); //Du solltest dich also noch darum kümmern, bevor wir Khorinis verlassen werden.
	}
	else
	{
		AUFSUCHENACHSEELENSTEINE = 1;

		AI_Output(self, hero, "Info_Mod_Xardas_NW_Trimedron_14_21"); //Wir werden uns dann schon auf den Weg zur Insel machen. Triff mich dort, wenn du den Aufenthaltsort der Ritualstätte gefunden hast.
	};
};

INSTANCE Info_Mod_Xardas_NW_Irdorath (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_Irdorath_Condition;
	information	= Info_Mod_Xardas_NW_Irdorath_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Xardas_NW_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Pyrokar_Machttraeger))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_Irdorath_Info()
{
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Irdorath_14_00"); //Für den Seelenstein auf der Insel wirst du ein Schiff und eine Mannschaft brauchen.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Irdorath_15_01"); //Schiff und Mannschaft?! Wo soll ich das auf die Schnelle herbekommen?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Irdorath_14_02"); //Nun, im Hafen der Stadt Khorinis liegt ein Schiff vor Anker.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Irdorath_14_03"); //Die Feuermagier des Klosters könnten versuchen positiv auf die Paladine einzuwirken, sodass sie es dir zur Verfügung stellen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Irdorath_14_04"); //Und eine Mannschaft ... nun, der Besuch der Insel wird wohl kein leichtes Unterfangen werden.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Irdorath_14_05"); //Neben Männern, die im Kampf mit dem Schwert geschult sind, solltest du unter allen Umständen auch Magier mit an Bord haben.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Irdorath_14_06"); //Deine Weggefährten aus der Strafkolonie sollten dir auf jeden Fall bei der Suche nach geeigneten Leuten helfen können.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Irdorath_15_07"); //Gut, dann kann ich also daran gehen, Leute anzuheuern.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Irdorath_14_08"); //Ja, mach das ... von meiner Seite kann ich dich noch auf Myxir und Raven hinweisen, als mögliche Begleiter ...
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Irdorath_14_09"); //Nun gut. Beliar möge dich bei deiner Suche unterstützen.

	Pal_213_Schiffswache.aivar[AIV_PASSGATE] = TRUE;

	if (Mod_VelayaFrei == 1)
	{
		Mod_VelayaFrei = 2;

		Wld_InsertNpc	(Mod_7416_BAU_Velaya_NW, "BIGFARM");
	};

	B_RemoveNpc	(Pal_212_Schiffswache);
	B_RemoveNpc	(Pal_213_Schiffswache);

	Log_CreateTopic	(TOPIC_MOD_HQ_CREW, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_HQ_CREW, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_HQ_CREW, "Ok, dann darf ich mir also eine Mannschaft zusammensuchen, mit welcher ich zur Insel aufbreche, um den Seelenstein zu bergen. Xardas riet mir, auch Magier mitzunehmen und bei der Suche nach fähigen Leuten meine Freunde Milten, Gorn, Diego und Lester zu konsultieren. Er selbst schlug mir noch Myxir und Raven als mögliche Kandidaten vor.");
};

INSTANCE Info_Mod_Xardas_NW_Kap6 (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_Kap6_Condition;
	information	= Info_Mod_Xardas_NW_Kap6_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Xardas_NW_Kap6_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Diego_Kap6))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_Kap6_Info()
{
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Kap6_14_00"); //Freust du dich über meine kleine Überraschung?
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Kap6_15_01"); //Es ist schon beruhigend, nicht allein zu sein.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Kap6_14_02"); //Ich habe da aber noch etwas für dich.

	B_GiveInvItems	(self, hero, ItRu_TeleportUW, 1);

	AI_Output(self, hero, "Info_Mod_Xardas_NW_Kap6_14_03"); //Das ist das Produkt langer schweißtreibender Nächte. Ich habe einen Weg gefunden, wie ich euch direkt in Xeres' Welt bringen kann.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Kap6_14_04"); //Wenn meine Berechnungen stimmen, solltet ihr ganz in der Nähe von Xeres' Tempel materialisieren. Der Rest liegt dann an euch.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Kap6_15_05"); //Solange wir nicht direkt in seiner Arena auftauchen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Kap6_14_06"); //Das wird schon nicht.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Kap6_14_07"); //(holt tief Luft) Damit ist nun alles gesagt. Mögen die Götter mit euch sein.

	B_LogEntry	(TOPIC_MOD_XERES, "Diego, Lester, Milten und Gorn sind zu meiner Unterstützung herangeeilt. Xardas hat uns alle mit Teleportern in die Nähe von Xeres' Tempel ausgestattet. Nun kann es losgehen!");
};

INSTANCE Info_Mod_Xardas_NW_Argez (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_Argez_Condition;
	information	= Info_Mod_Xardas_NW_Argez_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe Argez getroffen.";
};

FUNC INT Info_Mod_Xardas_NW_Argez_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Urnol1))
	&& (Npc_KnowsInfo(hero, Info_Mod_Argez_NW_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_Argez_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Argez_15_00"); //Ich habe Argez getroffen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Argez_14_01"); //Sehr gut! Behalte ihn, wenn möglich, im Auge.

	B_GivePlayerXP	(50);
};

INSTANCE Info_Mod_Xardas_NW_NachAufnahmeQuest (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_NachAufnahmeQuest_Condition;
	information	= Info_Mod_Xardas_NW_NachAufnahmeQuest_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Xardas_NW_NachAufnahmeQuest_Condition()
{
	if (hero.guild == GIL_KDF)
	&& (Wld_GetDay() > BeliarAufnahme)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_NachAufnahmeQuest_Info()
{
	AI_Output(self, hero, "Info_Mod_Xardas_NW_NachAufnahmeQuest_14_00"); //Du kommst mir genau richtig. Ich habe etwas entdeckt, was mit diesem Buch, welches du Ryan abgenommen hast, zu tun hat.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_NachAufnahmeQuest_15_01"); //Um was geht es?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_NachAufnahmeQuest_14_02"); //Auf dem Buch scheint ein Schutzzauber zu liegen, welcher verhindern soll, dass man es lesen kann. Dieser Zauber macht den Inhalt nur noch interessanter.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_NachAufnahmeQuest_14_03"); //Deshalb brauche ich deine Hilfe.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_NachAufnahmeQuest_15_04"); //Was soll ich tun?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_NachAufnahmeQuest_14_05"); //Das Buch kann nur durch einen passenden Bannbrecher geöffnet werden. Dazu fehlt mir aber hier das nötige Wissen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_NachAufnahmeQuest_14_06"); //Ironischerweise befindet sich die Lösung, wie der Schutzzauber zu brechen ist, in einem weiteren Buch, einem Almanach.

	AI_StopProcessInfos	(self);

	Wld_InsertNpc	(OrcScout,	"FP_ROAM_FARM1_GOBBO_04");
	Wld_InsertNpc	(OrcScout,	"FP_ROAM_FARM1_GOBBO_06");
	Wld_InsertNpc	(OrcWarrior_Almanach,	"FP_ROAM_FARM1_GOBBO_02");

	Log_CreateTopic	(TOPIC_MOD_BEL_ALMANACH, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_ALMANACH, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BEL_ALMANACH, "Das Buch, welches ich bei meiner Aufnahmeprüfung Ryan abgenommen habe, ist magisch versiegelt. Um es zu öffnen, braucht Xardas einen Almanach, in dem der passende Bannbrecher steht. Dieses Buch wurde jedoch von Orks bei einem Überfall gestohlen. Die Orks sollen sich im Wald bei Lobarts Hof aufhalten.");

	Info_ClearChoices	(Info_Mod_Xardas_NW_NachAufnahmeQuest);

	Info_AddChoice	(Info_Mod_Xardas_NW_NachAufnahmeQuest, "Wo finde ich den Schinken?", Info_Mod_Xardas_NW_NachAufnahmeQuest_B);
	Info_AddChoice	(Info_Mod_Xardas_NW_NachAufnahmeQuest, "Woher weißt du, was in dem Almanach steht?", Info_Mod_Xardas_NW_NachAufnahmeQuest_A);
};

FUNC VOID Info_Mod_Xardas_NW_NachAufnahmeQuest_B()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_NachAufnahmeQuest_B_15_00"); //Wo finde ich den Schinken?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_NachAufnahmeQuest_B_14_01"); //Jetzt wird es spannend. Der fahrende Händler, der die Bücher verliehen hat, wurde - sicher rein zufällig - gestern ganz in der Nähe von Orks überfallen, und sein ganzer Bestand geraubt.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_NachAufnahmeQuest_B_15_02"); //Orks? Hier? Und Bücher gestohlen?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_NachAufnahmeQuest_B_14_03"); //Merkwürdig, nicht wahr?
	AI_Output(hero, self, "Info_Mod_Xardas_NW_NachAufnahmeQuest_B_15_04"); //Dann muss ich die Orks finden.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_NachAufnahmeQuest_B_14_05"); //Du hast es verstanden. Die Bauern auf Lobarts Hof berichteten mir, dass die Orks im Wald vor den Stadtmauern verschwunden sind.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_NachAufnahmeQuest_B_14_06"); //Und ich fürchte, sie haben dort Ärgeres vor, als einen Lesewettbewerb zu veranstalten. Vielleicht treffen sie sich dort mit einem Auftraggeber.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_NachAufnahmeQuest_B_14_07"); //Du musst sie sofort verfolgen und ihnen das Buch abnehmen!
	AI_Output(hero, self, "Info_Mod_Xardas_NW_NachAufnahmeQuest_B_15_08"); //Dann werde ich sofort aufbrechen.

	Info_ClearChoices	(Info_Mod_Xardas_NW_NachAufnahmeQuest);

	AI_StopProcessInfos	(self);

	Wld_InsertNpc	(OrcScout,	"FP_ROAM_FARM1_GOBBO_04");
	Wld_InsertNpc	(OrcScout,	"FP_ROAM_FARM1_GOBBO_06");
	Wld_InsertNpc	(OrcWarrior_Almanach,	"FP_ROAM_FARM1_GOBBO_02");

	Log_CreateTopic	(TOPIC_MOD_BEL_ALMANACH, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_ALMANACH, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BEL_ALMANACH, "Das Buch, welches ich bei meiner Aufnahmeprüfung Ryan abgenommen habe, ist magisch versiegelt. Um es zu öffnen, braucht Xardas einen Almanach, in dem der passende Bannbrecher steht. Dieses Buch wurde jedoch von Orks bei einem Überfall gestohlen. Die Orks sollen sich im Wald bei Lobarts Hof aufhalten.");
};

FUNC VOID Info_Mod_Xardas_NW_NachAufnahmeQuest_A()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_NachAufnahmeQuest_A_15_00"); //Woher weißt du, was in dem Almanach steht?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_NachAufnahmeQuest_A_14_01"); //Weil ich ihn früher selbst besessen habe. Ich habe ihn dann irgendwann einmal, als ich ausgemistet habe, einer Wanderbibliothek vermacht.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_NachAufnahmeQuest_A_14_02"); //Wer konnte schon ahnen, dass ich ihn später mal brauchen würde?
};

INSTANCE Info_Mod_Xardas_NW_HabAlmanach (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_HabAlmanach_Condition;
	information	= Info_Mod_Xardas_NW_HabAlmanach_Info;
	permanent	= 0;
	important	= 0;
	description	= "Da bin ich wieder.";
};

FUNC INT Info_Mod_Xardas_NW_HabAlmanach_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_NachAufnahmeQuest))
	&& (Npc_HasItems(hero, ItWr_XardasAlmanach) == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Drach_Besiegt))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_HabAlmanach_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_HabAlmanach_15_00"); //Da bin ich wieder.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_HabAlmanach_14_01"); //Und hast du den Almanach?
	AI_Output(hero, self, "Info_Mod_Xardas_NW_HabAlmanach_15_02"); //Ja, hier ist er.

	B_GiveInvItems	(hero, self, ItWr_XardasAlmanach, 1);

	AI_Output(self, hero, "Info_Mod_Xardas_NW_HabAlmanach_14_03"); //Gut, dann werde ich gleich mit der Öffnung beginnen!
	AI_Output(hero, self, "Info_Mod_Xardas_NW_HabAlmanach_15_04"); //Da ist noch etwas.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_HabAlmanach_14_05"); //Um was geht es?
	AI_Output(hero, self, "Info_Mod_Xardas_NW_HabAlmanach_15_06"); //Als ich das Buch geborgen hatte und an deinem Turm angekommen bin, wurde ich von einem Schattenkrieger aufgehalten, der behauptet hat, dass er zu einer Gruppe von sechs Kriegern gehört.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_HabAlmanach_15_07"); //Danach wollte er die Bücher und hat mich angegriffen. Nachdem ich ihn besiegt hatte, verschwand er und erklärte, dass die Krieger nun kommen werden.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_HabAlmanach_14_08"); //Bei Beliar! Die alten Krieger sind zurück!
	AI_Output(hero, self, "Info_Mod_Xardas_NW_HabAlmanach_15_09"); //Was meinst du damit?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_HabAlmanach_14_10"); //Die sechs Krieger sind die Leibgarde eines Abtrünnigen. Sie kommen nur zum Vorschein, wenn etwas Wichtiges zu erledigen ist. Anscheinend sind sie es, die hinter dem Buch her sind.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_HabAlmanach_14_11"); //Gib mir einen Tag Zeit und ich habe das Buch geöffnet und herausgefunden, weshalb es so wichtig für die Krieger ist.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_HabAlmanach_15_12"); //Gut, dann bis morgen.

	B_LogEntry	(TOPIC_MOD_BEL_ALMANACH, "Ich hab Xardas den Almanach gegeben und auch von Drach berichtet. Ich soll morgen wieder kommen.");
	B_SetTopicStatus	(TOPIC_MOD_BEL_ALMANACH, LOG_SUCCESS);

	OpenRyanBook = Wld_GetDay();

	B_GivePlayerXP	(600);

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Xardas_NW_AlmanachOffen (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_AlmanachOffen_Condition;
	information	= Info_Mod_Xardas_NW_AlmanachOffen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bist du fertig?";
};

FUNC INT Info_Mod_Xardas_NW_AlmanachOffen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_HabAlmanach))
	&& (Wld_GetDay() > OpenRyanBook)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_AlmanachOffen_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_AlmanachOffen_15_00"); //Bist du fertig?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_AlmanachOffen_14_01"); //Gut, dass du kommst. Es ist schrecklich, was ich entdeckt habe!
	AI_Output(hero, self, "Info_Mod_Xardas_NW_AlmanachOffen_15_02"); //Was hast du herausgefunden?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_AlmanachOffen_14_03"); //In dem Buch steht eine genaue Beschreibung, wie man es schaffen kann, an die Axt des Untergangs zu kommen.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_AlmanachOffen_15_04"); //Die was?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_AlmanachOffen_14_05"); //Die Axt des Untergangs! Diese Waffe ist ein uraltes Stück Macht Beliars. Sie wurde damals von einem mächtigen Schwarzmagier geschaffen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_AlmanachOffen_14_06"); //Er erkannte aber den dämonischen Eigenwillen der Waffe und verbarg sie vor dem Rest der Welt mit einem Rätsel. Nur, wer dieses Rätsel lösen kann, ist bereit die Waffe zu tragen!
	AI_Output(self, hero, "Info_Mod_Xardas_NW_AlmanachOffen_14_07"); //Deshalb sind die Krieger hinter ihr her.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_AlmanachOffen_15_08"); //Was für ein Rätsel ist das?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_AlmanachOffen_14_09"); //Der Schwarzmagier hat die Axt an einem sicheren Ort verwahrt und sechs Almanache hinterlassen, in denen steht, wo sich der nächste Almanach befindet. Allerdings in einem Rätsel, das nur durch logisches Denken gelöst werden kann.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_AlmanachOffen_14_10"); //Im letzten Almanach steht, wo sich die Axt des Untergangs befindet. In dem Buch, das ich geöffnet habe, steht der Standort des ersten Almanachs.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_AlmanachOffen_14_11"); //Dein Auftrag wird es sein das Rätsel zu lösen, die sechs Krieger zu töten, die ebenfalls hinter der Axt her sind, und die Axt schließlich zu sichern.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_AlmanachOffen_15_12"); //(zynisch) Das mach ich doch mit Links!
	AI_Output(self, hero, "Info_Mod_Xardas_NW_AlmanachOffen_14_13"); //(ärgerlich) Ich weiß, die Aufgabe ist schwer, aber somit können wir ihnen eine mächtige Waffe entreißen.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_AlmanachOffen_15_14"); //(seufzt) Dann werde ich schnell aufbrechen!
	AI_Output(self, hero, "Info_Mod_Xardas_NW_AlmanachOffen_14_15"); //Gut, und sei vorsichtig! Sie sind hinterhältig! Hier ist das Buch mit dem ersten Rätsel!

	B_GiveInvItems	(self, hero, ItWr_AxtAlmanach_Pre, 1);

	GardeBeliars_1989_Drach.attribute[ATR_HITPOINTS] = GardeBeliars_1989_Drach.attribute[ATR_HITPOINTS_MAX];

	Log_CreateTopic	(TOPIC_MOD_BEL_RAETSEL, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_RAETSEL, LOG_RUNNING);
	Log_CreateTopic	(TOPIC_MOD_BEL_AXT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_AXT, LOG_RUNNING);
	B_LogEntry_NMore	(TOPIC_MOD_BEL_RAETSEL, TOPIC_MOD_BEL_AXT, TOPIC_MOD_BEL_FIVEKNIGHTS, "Xardas hat den Almanach geöffnet. Darin ist ein Rätsel, welches mir den Weg zur Axt des Untergangs eröffnet. Ich sollte das Buch lesen und das Rätsel lösen.", "In dem Almanach stand etwas über die Axt des Untergangs. Diese Waffe scheint sehr mächtig zu sein. Xardas will, dass ich sie finde.", "Wie es scheint sind die sechs Krieger hinter der Axt des Untergangs her. Ich muss ihnen zuvorkommen.");
};

INSTANCE Info_Mod_Xardas_NW_HabAxt (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_HabAxt_Condition;
	information	= Info_Mod_Xardas_NW_HabAxt_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich bin wieder da!";
};

FUNC INT Info_Mod_Xardas_NW_HabAxt_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Frowin_HatAxt))
	&& (Npc_HasItems(hero, ItMw_AxtDesUntergangs) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_HabAxt_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_HabAxt_15_00"); //Ich bin wieder da!
	AI_Output(self, hero, "Info_Mod_Xardas_NW_HabAxt_14_01"); //Und was ist passiert?
	AI_Output(hero, self, "Info_Mod_Xardas_NW_HabAxt_15_02"); //Ich habe alles gemacht, was du gesagt hast. Die dunkle Garde ist vernichtet, das Rätsel gelöst und die Axt gesichert.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_HabAxt_14_03"); //Zeig die Axt her!
	AI_Output(hero, self, "Info_Mod_Xardas_NW_HabAxt_15_04"); //Hier.

	B_GiveInvItems	(hero, self, ItMw_AxtDesUntergangs, 1);

	AI_UnequipWeapons	(self);

	EquipItem	(self, ItMw_AxtDesUntergangs);

	AI_ReadyMeleeWeapon	(self);

	AI_PlayAni	(self, "T_1HSINSPECT");

	AI_Output(self, hero, "Info_Mod_Xardas_NW_HabAxt_14_05"); //Was für eine Macht. Ich habe nachgedacht, als du weg warst, und habe entschieden, dass du die Axt behalten sollst.

	AI_RemoveWeapon	(self);

	AI_UnequipWeapons	(self);

	B_GiveInvItems	(self, hero, ItMw_AxtDesUntergangs, 1);

	AI_EquipBestMeleeWeapon	(self);

	AI_Output(hero, self, "Info_Mod_Xardas_NW_HabAxt_15_06"); //Danke, ich werde gut auf sie achten.

	B_LogEntry_More	(TOPIC_MOD_BEL_AXT, TOPIC_MOD_BEL_FIVEKNIGHTS, "Ich hab die Axt des Untergangs geborgen und Xardas will, dass ich sie bewahre.", "Die sechs Krieger sind Geschichte. Wieder ein Problem weniger.");
	B_SetTopicStatus	(TOPIC_MOD_BEL_RAETSEL, LOG_SUCCESS);
	B_SetTopicStatus	(TOPIC_MOD_BEL_AXT, LOG_SUCCESS);
	B_SetTopicStatus	(TOPIC_MOD_BEL_FIVEKNIGHTS, LOG_SUCCESS);

	B_GivePlayerXP	(1000);

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Xardas_NW_Argibast (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_Argibast_Condition;
	information	= Info_Mod_Xardas_NW_Argibast_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich bin zurück.";
};

FUNC INT Info_Mod_Xardas_NW_Argibast_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raven_ArgibastDead))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_Argibast_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Argibast_15_00"); //Ich bin zurück.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Argibast_14_01"); //Und?
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Argibast_15_02"); //Die Belagerung ist beendet und einer der sechs Gardisten Innos' hat das Zeitliche gesegnet!
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Argibast_14_03"); //Sehr gut. Was hat der Gardist gesagt?
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Argibast_15_04"); //Nicht viel. Er sprach wie immer über die unentwegte Macht seines Meisters und etwas von einer mächtigen Waffe, die die anderen Gardisten suchen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Argibast_14_05"); //(scharf) Was für eine Waffe soll das sein?
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Argibast_15_06"); //Er nannte sie das Schwert Innos'.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Argibast_14_07"); //Bei Beliar. Schlimmer konnte es nicht kommen.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Argibast_15_08"); //Was hat es damit auf sich?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Argibast_14_09"); //Vor 1000 Jahren, zu der Zeit, als die Garde Beliars und die Garde Innos' entstanden und dann verbannt wurden, entstanden auch zwei göttliche Waffen mit ihnen, die das Gleichgewicht der Welt bedrohten.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Argibast_15_10"); //Ich nehme an du sprichst von der Axt des Untergangs und dem Schwert Innos'?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Argibast_14_11"); //Ja, das tue ich. Adanos versiegelte die beiden Waffen, um die Welt vor dem Chaos zu bewahren. Die Axt hast du bereits geborgen, doch das Schwert Innos' ist wohl ebenfalls auf Khorinis und die Garde Innos' sucht danach.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Argibast_15_12"); //Was soll ich tun?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Argibast_14_13"); //Du must das Schwert Innos' erbeuten, um es vor den Händen des Bösen zu schützen. Desweiteren musst du die Garde Innos' aufhalten, um somit Khorinis vor einer weiteren Bedrohung zu bewahren.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Argibast_15_14"); //Wo soll ich anfangen zu suchen?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Argibast_14_15"); //Das ist das Rätsel, welches du lösen musst. Wir wissen es nicht genau. Jedoch hat sich die Aktivität magischer Energie im Tal der Wassermagier drastisch verstärkt, was beunruhigend ist. Beginne dort mit deiner Suche.

	B_GivePlayerXP	(250);

	Wld_SendTrigger	("EVT_PORTAL_EINGANG_TOR_01");

	Log_CreateTopic	(TOPIC_MOD_BEL_INNOSSCHWERT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_INNOSSCHWERT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BEL_INNOSSCHWERT, "Es scheint so, als würde die Garde Innos' nach dem mächtigen Schwert Innos' suchen. Ich muss das Schwert vor ihnen finden. Wo es zu finden ist, weiß jedoch nicht mal Xardas, allerdings gibt es Andeutungen auf Jharkendar.");

	Wld_InsertNpc	(Mod_4085_HoherUntoterMagier_NW,	"TAVERNE");
	Wld_InsertNpc	(Mod_4084_UntoterEliteNovize_NW,	"TAVERNE");
	Wld_InsertNpc	(Mod_4083_UntoterKrieger_NW,		"TAVERNE");

	Wld_InsertNpc	(Mod_4088_HoherUntoterMagier_NW,	"TAVERNE");
	Wld_InsertNpc	(Mod_4087_UntoterEliteNovize_NW,	"TAVERNE");
	Wld_InsertNpc	(Mod_4086_UntoterKrieger_NW,		"TAVERNE");

	Wld_InsertNpc	(Mod_4091_HoherUntoterMagier_NW,	"TAVERNE");
	Wld_InsertNpc	(Mod_4090_UntoterEliteNovize_NW,	"TAVERNE");
	Wld_InsertNpc	(Mod_4089_UntoterKrieger_NW,		"TAVERNE");

	B_StartOtherRoutine	(Mod_512_RDW_Cavalorn_NW, "START");

	B_StartOtherRoutine	(Mod_771_KDW_Riordian_NW, "VORTEMPEL");

	B_StartOtherRoutine	(Mod_1538_WKR_Wasserkrieger_NW, "GEFANGEN");
	B_StartOtherRoutine	(Mod_1537_WKR_Vanas_NW, "GEFANGEN");
	B_StartOtherRoutine	(Mod_1536_WKR_Roka_NW, "GEFANGEN");
	B_StartOtherRoutine	(Mod_1532_HTR_Ethan_NW, "GEFANGEN");

	B_KillNpc	(Mod_1539_WKR_Wasserkrieger_NW);
};

INSTANCE Info_Mod_Xardas_NW_Uriela (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_Uriela_Condition;
	information	= Info_Mod_Xardas_NW_Uriela_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Xardas_NW_Uriela_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Uriela_TeachingFinished))
	&& (Npc_KnowsInfo(hero, Info_Mod_Uriela_TeachMage))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_Uriela_Info()
{
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Uriela_14_00"); //Zwei in der Runenmagie begabte Hexen hatten das Gesuch gestellt, in die Reihen der Schwarzmagier einzutreten.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Uriela_14_01"); //Ich habe sie gewähren lassen, da wir in der gegenwärtigen Situation auf Unterstützung jedweder Art angewiesen sind und das Wissen um die Hexenmagie uns im Kampf gegen Xeres sicher bereichern kann.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Uriela_14_02"); //Aber irgendwie habe ich den starken Verdacht, dass du deine Finger mit im Spiel hattest.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Uriela_15_03"); //Nun ...
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Uriela_14_04"); //(drohend) Ich warne dich. Die Kunst Runen zu wirken wird nicht leichtfertig an Dritte weitergegeben.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Uriela_14_05"); //Im dem Umgang mit Magie sollte man etwas mehr Ernsthaftigkeit walten lassen.
};

INSTANCE Info_Mod_Xardas_NW_Randolph (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_Randolph_Condition;
	information	= Info_Mod_Xardas_NW_Randolph_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich brauche deinen Rat.";
};

FUNC INT Info_Mod_Xardas_NW_Randolph_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HalbinfernalischerRandolph_GoodOne))
	&& (Mod_Randolph_Started == 11)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_Randolph_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Randolph_15_00"); //Ich brauche deinen Rat. Der Bauer Randolph scheint nicht nur unter dämonischer Kontrolle zu stehen, nein, er scheint selbst zu einem zu werden.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Randolph_15_01"); //Horden von Dämonen hat er um sich geschart und bedroht die Stadt.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Randolph_14_02"); //Nun, dann wirst du einen Weg finden müssen ihn zu vernichten, um dieser Bedrohung Herr zu werden.

	Info_ClearChoices	(Info_Mod_Xardas_NW_Randolph);

	Info_AddChoice	(Info_Mod_Xardas_NW_Randolph, "Aber kann man ihm denn nicht helfen?", Info_Mod_Xardas_NW_Randolph_B);
	Info_AddChoice	(Info_Mod_Xardas_NW_Randolph, "Ok, das werde ich tun.", Info_Mod_Xardas_NW_Randolph_A);
};

FUNC VOID Info_Mod_Xardas_NW_Randolph_B()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Randolph_B_15_00"); //Aber kann man ihm denn nicht helfen?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Randolph_B_14_01"); //Nun, in dem Stadion der Verbundenheit mit dem Dämonischen kommt wohl jede Hilfe zu spät.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Randolph_B_14_02"); //Und selbst wenn noch ein Funken seines ursprünglichen Wesens in ihm existieren sollte, so würdest du ihn doch kaum dazu bewegen können Pyrokars Trank einzunehmen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Randolph_B_14_03"); //Folglich wirst du dieses Wesen - auch wenn noch ein Rest Menschlichkeit ihn ihm sein sollte - vernichten müssen, da du nicht über die Mittel verfügst, selektiv das Dämonische aus ihm zu bannen.

	B_LogEntry	(TOPIC_MOD_AKIL_RANDOLPH, "Xardas meint, ich solle Randoplh, oder das, wozu er geworden ist, vernichten. Wenn es denn keine andere Möglichkeit gibt ...");

	Info_ClearChoices	(Info_Mod_Xardas_NW_Randolph);
};

FUNC VOID Info_Mod_Xardas_NW_Randolph_A()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Randolph_A_15_00"); //Ok, das werde ich tun.

	B_LogEntry	(TOPIC_MOD_AKIL_RANDOLPH, "Xardas meint, ich solle Randoplh, oder das, wozu er geworden ist, vernichten. Wenn es denn keine andere Möglichkeit gibt ...");

	Info_ClearChoices	(Info_Mod_Xardas_NW_Randolph);
};

INSTANCE Info_Mod_Xardas_NW_RandolphGeheilt (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_RandolphGeheilt_Condition;
	information	= Info_Mod_Xardas_NW_RandolphGeheilt_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich konnte Randolph doch retten.";
};

FUNC INT Info_Mod_Xardas_NW_RandolphGeheilt_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Randolph))
	&& (Mod_Randolph_Started == 16)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_RandolphGeheilt_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_RandolphGeheilt_15_00"); //Ich konnte Randolph doch retten.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_RandolphGeheilt_14_01"); //Hmm, dann hast du dich also der Magie der Paladine bedient.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_RandolphGeheilt_15_02"); //Was?! Du wusstest von der Möglichkeit?! Aber warum ...
	AI_Output(self, hero, "Info_Mod_Xardas_NW_RandolphGeheilt_14_03"); //Du musst verstehen. Die Aussicht auf Erfolg war gering.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_RandolphGeheilt_14_04"); //Ich wollte dich davon abhalten weiter Zeit, Mühen und Risiken für ein Menschenleben aufzuwenden und damit ganz Khorinis in Gefahr zu bringen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_RandolphGeheilt_14_05"); //Wenn es denn fehlgeschlagen wäre ...
};

INSTANCE Info_Mod_Xardas_NW_Gidan1 (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_Gidan1_Condition;
	information	= Info_Mod_Xardas_NW_Gidan1_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du diese Pergamenthälften zusammensetzen?";
};

FUNC INT Info_Mod_Xardas_NW_Gidan1_Condition()
{
	if (Npc_HasItems(hero, ItWr_SektisTeleport2) == 1)
	&& (Npc_HasItems(hero, ItWr_SektisTeleport1) == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Andre_Erfahrung))
	&& (Mod_PalaKapitel3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_Gidan1_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Gidan1_15_00"); //Kannst du diese Pergamenthälften zusammensetzen?

	AI_PrintScreen	("Pergamenthälften gegeben!", -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);

	Npc_RemoveInvItems	(hero, ItWr_SektisTeleport2, 1);
	Npc_RemoveInvItems	(hero, ItWr_SektisTeleport1, 1);

	AI_Output(self, hero, "Info_Mod_Xardas_NW_Gidan1_14_01"); //Das sollte kein Problem sein. Komm später wieder.

	B_LogEntry	(TOPIC_MOD_MILIZ_GIDAN, "Xardas wird die zwei Pergamenthälften zusammen setzen.");
};

INSTANCE Info_Mod_Xardas_NW_Gidan2 (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_Gidan2_Condition;
	information	= Info_Mod_Xardas_NW_Gidan2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Xardas_NW_Gidan2_Condition()
{
	if (Mod_PalaKapitel3 == 4)
	&& (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Gidan1))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_Gidan2_Info()
{
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Gidan2_14_00"); //Hier hast du deine Spruchrolle.

	B_GiveInvItems	(self, hero, ItWr_SektisTeleport3, 1);

	AI_Output(self, hero, "Info_Mod_Xardas_NW_Gidan2_14_01"); //Es scheint allerdings so, als hätte sie eine lokale Abghängigkeit.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Gidan2_14_02"); //Also muss sie an einem bestimmten Ort gesprochen werden, damit sie funktioniert.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Gidan2_15_03"); //Ich hab auch schon eine Vermutung, wo.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Gidan2_14_04"); //Dann mach dich auf den Weg, ich hab zu tun.

	Mod_PalaKapitel3 = 5;

	B_LogEntry	(TOPIC_MOD_MILIZ_GIDAN, "Es handelt sich um eine Spruchrolle, die aber nur an einem bestimmten Ort benutzt werden kann. Ich sollte es mal am Leuchtturm versuchen.");
};

INSTANCE Info_Mod_Xardas_NW_Namib (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_Namib_Condition;
	information	= Info_Mod_Xardas_NW_Namib_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe hier einen Brief, den ich euch von Baal Namib überstellen soll.";
};

FUNC INT Info_Mod_Xardas_NW_Namib_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Namib_DuengerVerteilt))
	&& (Npc_HasItems(hero, ItWr_NamibForBeliar) == 1)
	&& (Npc_HasItems(hero, ItMi_HerbPaket) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_Namib_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Namib_15_00"); //Ich habe hier einen Brief, den ich dir von Baal Namib überstellen soll.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Namib_14_01"); //Gib den Brief Karras in unserer Festung. Er ist für so was zuständig.
};

INSTANCE Info_Mod_Xardas_NW_Drachen (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_Drachen_Condition;
	information	= Info_Mod_Xardas_NW_Drachen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Xardas_NW_Drachen_Condition()
{
	if (Mod_NL_Siegelbuch == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_Drachen_Info()
{
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Drachen_14_00"); //Ahh, gut, dass ich dich noch rechtzeitig erreiche. Du solltest das Buch nämlich unter keinen Umständen öffnen.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Drachen_15_01"); //Ähh, Xardas ...
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Drachen_14_02"); //Wie ich im Rahmen meiner Nachforschungen herausgefunden habe, besteht auch gar nicht die Notwendigkeit.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Drachen_14_03"); //Indem wir nämlich einen Spalt im Raum Zeitgefüge des Buches erzeugen ...
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Drachen_15_04"); //(energischer) Xardas, das Buch ist bereits geöffnet!
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Drachen_14_05"); //Ohh ... nun in dem Fall sollte das Chromaninbuch seine Botschaft wiedererlangt haben.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Drachen_14_06"); //Und mit den anderen Folgen durch das Öffnen des Buches – nun – müssen wir uns wohl irgendwie arrangieren.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Drachen_15_07"); //Was zum Teufel ist da geschehen? Ich hatte den Eindruck, als würde mir der Himmel gleich auf den Kopf fallen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Drachen_14_08"); //Nun, das werde ich dir erklären.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Drachen_14_09"); //Wie ich inzwischen herausgefunden habe, war Pondaros ein mächtiger Magier, der vor Äonen gelebt hat, kurz nach dem Zeitpunkt, als die Gottheit Radanos auf der Erde zu wirken begann.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Drachen_14_10"); //Er erschuf dieses Buch, welches im Stande ist magische Energien zu absorbieren und verbannte darin zahlreiche Kreaturen, die magischen Ursprungs waren.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Drachen_15_11"); //Magische Kreaturen? Welcher Art?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Drachen_14_12"); //Nun, alles vom Bodensatz magischer Geschöpfe, über Kobolde und Magier bis hin zu mächtigen Wesen wie ... Drachen.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Drachen_15_13"); //(ungläubig) Drachen?!
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Drachen_14_14"); //Ja, Drachen, Feuer speiende Wesen von uralter Macht, die jetzt mit ihrer Präsenz alle menschlichen Siedlungen und Städte auf Khorinis gefährden könnten ... und Xeres bei der Umsetzung seiner Ziele somit von nicht unerheblichem Nutzen sein würden.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Drachen_15_15"); //Xeres ... Und das Buch in den Händen seines Lakaien. Was hat das alles zu bedeuten?
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Drachen_15_16"); //Hätte der Schamane nicht schon viel früher die Siegel brechen und diesen Ungeheuern ihre Freiheit schenken können?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Drachen_14_17"); //Das hätte er mit Bestimmtheit, wenn es in seiner Macht gelegen hätte.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Drachen_14_18"); //Aber zweifelsfrei hatte Pondaros die Steinkreise mit Schutzmechanismen versehen, die im Besondern Geschöpfen der Finsternis – wie diesem untoten Ork – das Vorhaben vereitelt hätten.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Drachen_14_19"); //Diesem Schamanen, Herrscher über Geister, Elemente und belebte Natur und ein Scherge der Finsternis, wäre es nicht vergönnt gewesen, auch nur das Erste der drei Siegel zu brechen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Drachen_14_20"); //So, nun aber genug der Worte. Ganz gleich, was du aus dem Buch entfesselt haben magst, versuche deine Aufmerksamkeit weiterhin vor allem auf das eine Ziel zu richten: Xeres' Vernichtung.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Drachen_14_21"); //Hier etwas Gold für deine Ausrüstung.

	B_GiveInvItems	(self, hero, ItMi_Gold, 400);

	AI_Output(self, hero, "Info_Mod_Xardas_NW_Drachen_14_22"); //Nun solltest du aber machen, dass du hier wegkommst, bevor dir üble Geschöpfe begegnen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Drachen_14_23"); //Ich teleportiere dich sicher zu Orlans Taverne.

	Log_CreateTopic	(TOPIC_MOD_NL_DRACHEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_NL_DRACHEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_NL_DRACHEN, "Na toll. Wenn Xardas es sich angewöhnen würde nur eine Minute früher zu erscheinen ... Dass Drachen und andere Ungetüme dem Buch entkommen sind, scheint ihn ja nicht sonderlich zu berühren. Einfach weiter Xeres jagen, als ob nichts wäre. Na ja, zumindest bin ich Chromanin einen entscheidenden Schritt näher gekommen.");
	B_LogEntry	(TOPIC_MOD_NL_DRACHEN, "Dann werde ich mal Xardas Rat befolgen und mich aus der akuten Gefahrenzone herausteleportieren, bevor ich noch über einen dieser Drachen stolpere ... Orlans Taverne, da bin ich. Aber verdammt, was ist das? Ich ... mir ... schwinden die Sinne ...");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");

	Mdl_RemoveOverlayMDS	(hero, "HUMANS_REGEN.MDS");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Xardas_NW_Lich (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_Lich_Condition;
	information	= Info_Mod_Xardas_NW_Lich_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ein untoter Magier treibt sein Unwesen auf Khorinis.";
};

FUNC INT Info_Mod_Xardas_NW_Lich_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lich_Unbesiegbar))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_Lich_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Lich_15_00"); //Ein untoter Magier treibt sein Unwesen auf Khorinis.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Lich_15_01"); //Im Kampf vermochte ich ihm nichts anzuhaben und hätte fast mein Leben dabei gelassen.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Lich_15_02"); //Er sprach davon, man bräuchte viel und doch wenig, ihn zu vernichten.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Lich_14_03"); //(ungeduldig) Nun, ich darf annehmen, dass du nicht von Xeres sprichst, sondern von einem der Geschöpf aus dem Buch.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Lich_14_04"); //Wenn du ihn nicht bezwingen kannst, dann gehe ihm aus dem Weg ...
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Lich_14_05"); //Da ich aber auch weiß, dass du dich nicht durch meine Worte von weiteren Narreteien abhalten lässt: Begib dich in unsere Festung.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Lich_14_06"); //Dort wirst du in der Bibliothek ein Buch finden, das dir die Antworten geben sollte, nach denen du suchst.
};

INSTANCE Info_Mod_Xardas_NW_Gormgniez (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_Gormgniez_Condition;
	information	= Info_Mod_Xardas_NW_Gormgniez_Info;
	permanent	= 0;
	important	= 0;
	description	= "Es gibt da etwas, das mir keine Ruhe lässt ...";
};

FUNC INT Info_Mod_Xardas_NW_Gormgniez_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gormgniez_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_Gormgniez_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Gormgniez_15_00"); //Es gibt da etwas, das mir keine Ruhe lässt ... Was haben Drachen, Schlaf und Sprechen miteinander gemeinsam?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Gormgniez_14_01"); //Mit sonderbaren Fragen beschäftigst du dich, wo du doch eigentlich Xeres bezwingen solltest.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Gormgniez_15_02"); //Nun, ein kleiner Dämon hat mir so ein Geheimnis verraten ...
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Gormgniez_14_03"); //Geheimnis eines Dämonen, Drachen, sprechen und Schlaf?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Gormgniez_14_04"); //Hmm, ich beginne zu begreifen und werde auf deine Frage eingehen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Gormgniez_14_05"); //Wie jedes Lebewesen benötigen auch Drachen hin und wieder Schlaf.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Gormgniez_14_06"); //Jedoch ist ihr Schlaf immer dann besonders fest und beständig, wenn sie auf Raubzug waren, erschöpft durch die Anstrengungen, zufrieden über reiche Beute.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Gormgniez_15_07"); //Reiche Beute?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Gormgniez_14_08"); //Gold, Silber und Edelsteine. Güter, die beispielsweise Gläubige in Massen den Stellvertretern ihres Gottes Innos übereignen ...
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Gormgniez_15_09"); //... die sich in nicht unerheblicher Menge in ihrer Residenz angehäuft haben. Ich verstehe.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Gormgniez_14_10"); //(nachdenklicher) Hmm, und nicht unweit, westlich vom Kloster spüre ich auch eine starke magische Präsenz.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Gormgniez_14_11"); //Was wohl wäre, wenn jemand dem Informationsfluss unter den Dämonen etwas, nun ja, helfen würde ...
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Gormgniez_14_12"); //(wieder zum Helden) Ich hoffe, ich konnte alle Fragen damit zu deiner Zufriedenheit beantworten.

	Log_CreateTopic	(TOPIC_MOD_NL_DRAGON, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_NL_DRAGON, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_NL_DRAGON, "Von Xardas erfuhr ich, dass Drachen immer nach erfolgreichen Raubzügen besonders fest schlafen. Das Innoskloster mit seinen Schätzen wäre dabei prädestiniert für einen solchen Raubzug, hatte Xardas zu verstehen gegeben.");
	B_LogEntry	(TOPIC_MOD_NL_DRAGON, "Der im Schlaf sprechende Drache würde sich das bestimmt nicht entgehen lassen, wenn er davon wüsste ...");
};

INSTANCE Info_Mod_Xardas_NW_Moorhexe (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_Moorhexe_Condition;
	information	= Info_Mod_Xardas_NW_Moorhexe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Es hat geklappt, der Drache gab einiges preis.";
};

FUNC INT Info_Mod_Xardas_NW_Moorhexe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragon_KlosterErfolg))
	&& (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Lich))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_Moorhexe_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Moorhexe_15_00"); //Es hat geklappt, der Drache gab einiges preis.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Moorhexe_14_01"); //(leicht höhnisch) Ja, ich hörte, was sich im Kloster ereignet hat.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Moorhexe_15_02"); //Nur war ich eben nicht in der Lage alles in Erfahrung zu bringen.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Moorhexe_15_03"); //Er sprach von "dem Land des Korns der Mutter" und von einem Moor und seiner Bewohnerin.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Moorhexe_14_04"); //Hmm, Land des Korns der Mutter ... es dürfte sich um eine Umschreibung für ein Gebiet im Norden von Khorinis gehandelt haben: Relendel.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Moorhexe_14_05"); //Und ein Moor ... ja, tatsächlich, ich hörte mal von einem, auf dem ein Fluch lasten soll.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Moorhexe_15_06"); //Was für ein Fluch, und wo liegt dieses Moor genau?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Moorhexe_14_07"); //Beim besten Willen, über alles bin ich nun auch nicht in der Lage Auskunft zu erteilen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Moorhexe_14_08"); //Frag jemanden, der mit der Region im Norden bestens vertraut ist, zum Beispiel einen Waldläufer. Beim schwarzen Troll soll ja einer ansässig sein.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Moorhexe_15_09"); //Gut, dann sprach der Drache aber noch von einer Bewohnerin, welche sich dem Mächtigen verbergen soll.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Moorhexe_14_10"); //(uninteressiert) Sehr rätselhaft, aber die Bibliothek unserer Festung ist umfangreich. Dort kannst du Rat finden.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Moorhexe_14_11"); //Ich muss nun Andokai mit einigen Nachforschungen unterstützen, Wissen erschließen, das in den Büchern dieser Festung verborgen liegt.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Moorhexe_14_12"); //Er erwarb einige Spruchrollen und Runen der Verwandlungsmagier.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Moorhexe_14_13"); //Wir wollen versuchen zu ergründen, ob sich daraus Plagen-Zauber generieren lassen.

	if (!Npc_KnowsInfo(hero, Info_Mod_Lich_Hi))
	{
		B_RemoveNpc	(Mod_7290_PAL_Athos_NW);
		B_RemoveNpc	(Mod_7291_PAL_Aramis_NW);
		B_RemoveNpc	(Mod_7292_PAL_Porthos_NW);

		Wld_InsertNpc	(Lich_11008_NW, "NW_TROLLAREA_TROLLROCKCAVE_02");

		if (!Npc_KnowsInfo(hero, Info_Mod_Porthos_Hi))
		{
			Wld_SendTrigger	("LICHDUNGEON");
		};
	};

	B_SetTopicStatus	(TOPIC_MOD_NL_DRAGON, LOG_SUCCESS);

	Log_CreateTopic	(TOPIC_MOD_NL_MOORHEXE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_NL_MOORHEXE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_NL_MOORHEXE, "Xardas sprach von dem Gebiet Relendel im Norden von Khorinis, wo ein Moor zu finden sei. Den Weg dorthin könnte mir vermutlich ein Waldläufer beim schwarzen Troll zeigen.");
	B_LogEntry	(TOPIC_MOD_NL_MOORHEXE, "Xardas versucht mit Andokai einige Zauber der Verwandlungsmagier zu Plagen-Zaubern umsetzen. Er verwies mich daher wegen meiner restlichen Fragen an die Bibliothek der Schwarzmagier.");
};

INSTANCE Info_Mod_Xardas_NW_WasMussIchTun (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_WasMussIchTun_Condition;
	information	= Info_Mod_Xardas_NW_WasMussIchTun_Info;
	permanent	= 0;
	important	= 0;
	description	= "Der Weg Beliars? Wie kann ich den einschlagen?";
};

FUNC INT Info_Mod_Xardas_NW_WasMussIchTun_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_WasFuerGilden))
	&& (Mod_Gilde == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_WasMussIchTun_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_WasMussIchTun_15_00"); //Der Weg Beliars? Wie kann ich den einschlagen?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_WasMussIchTun_14_01"); //Ich fürchte, dazu muss ich zuerst ein Geheimnis lüften.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_WasMussIchTun_14_02"); //Du erinnerst dich sicher an die drei Lager im Minental, also das Alte Lager, das Neue Lager und das Sumpflager.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_WasMussIchTun_14_03"); //Tatsache ist, dass es ein viertes Lager gab.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_WasMussIchTun_15_04"); //(skeptisch) Und wo soll das gelegen haben?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_WasMussIchTun_14_05"); //Hoch oben in den Bergen, in der Nähe des Neuen Lagers.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_WasMussIchTun_14_06"); //In der Zeit des ersten Orkkrieges wurde in dieser unwirtlichen Gegend eine Festung errichtet.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_WasMussIchTun_14_07"); //Nach der Erschaffung der Barriere siedelten dort die Menschen an, die gute Gründe dafür hatten, nicht mit den anderen Lagern in Kontakt zu kommen - Anhänger Beliars.
};

INSTANCE Info_Mod_Xardas_NW_WasDuMitGruppe (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_WasDuMitGruppe_Condition;
	information	= Info_Mod_Xardas_NW_WasDuMitGruppe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was hast du mit der Gruppe zu tun?";
};

FUNC INT Info_Mod_Xardas_NW_WasDuMitGruppe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_WasMussIchTun))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_WasDuMitGruppe_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_WasDuMitGruppe_15_00"); //Was hast du mit der Gruppe zu tun?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_WasDuMitGruppe_14_01"); //Sie existierte schon, bevor ich mich von den Feuermagiern abwandte, aber ich kann nicht leugnen, dass ich dort großen Einfluss gewonnen habe.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_WasDuMitGruppe_14_02"); //Du kannst dir meine Überraschung vorstellen, als ich zufällig auf diese Gruppierung stieß.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_WasDuMitGruppe_14_03"); //Nach dem Fall der Barriere hat sie größere Bekanntheit erlangt, und einige namhafte Magier und Krieger der Kolonie sind zu ihr gestoßen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_WasDuMitGruppe_14_04"); //Den einen oder anderen dürftest auch du noch gut im Gedächtnis haben, auch wenn es andersrum nicht der Fall sein wird.
};

INSTANCE Info_Mod_Xardas_NW_WarumNovize (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_WarumNovize_Condition;
	information	= Info_Mod_Xardas_NW_WarumNovize_Info;
	permanent	= 0;
	important	= 0;
	description	= "Angenommen, ich wollte diesem Verein beitreten ...";
};

FUNC INT Info_Mod_Xardas_NW_WarumNovize_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_WasDuMitGruppe))
	&& (Mod_Gilde == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_WarumNovize_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_WarumNovize_15_00"); //Angenommen, ich wollte diesem Verein beitreten ...
	AI_Output(self, hero, "Info_Mod_Xardas_NW_WarumNovize_14_01"); //Wende dich an Andokai. Er ist der oberste Schwarzmagier der Festung und zuständig für die Rekrutierung.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_WarumNovize_14_02"); //Wenn du ihm sagst, dass ich dir vertraue, wird er dich gut behandeln.

	B_LogEntry	(TOPIC_MOD_DAEMONENBESCHWOERER, "Wenn ich mich den Beliaranhängern anschließen will, soll ich mich an Andokai wenden, den obersten Schwarzmagier der alten Festung.");
};

INSTANCE Info_Mod_Xardas_NW_WelcherVorteil (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_WelcherVorteil_Condition;
	information	= Info_Mod_Xardas_NW_WelcherVorteil_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was hätte ich davon, ein Beliaranhänger zu sein?";
};

FUNC INT Info_Mod_Xardas_NW_WelcherVorteil_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_WasDuMitGruppe))
	&& (Mod_Gilde	==	0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_WelcherVorteil_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_WelcherVorteil_15_00"); //Was hätte ich davon, ein Beliaranhänger zu sein?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_WelcherVorteil_14_01"); //(belehrend) Du wendest deine Gebete nicht an Beliar, weil du dir davon etwas versprichst, sondern weil du von seiner Lehre überzeugt bist.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_WelcherVorteil_14_02"); //Abgesehen davon... Auch unsere Krieger sind in der Magieanwendung geschult.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_WelcherVorteil_14_03"); //Die Grundausbildung besteht aus den ersten beiden Kreisen der Magie.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_WelcherVorteil_14_04"); //Erst danach musst du dich für eine Spezialisierung entscheiden. Die mächtigen Kampfzauber kannst du aber nur als Magier erlernen.

	B_LogEntry	(TOPIC_MOD_DAEMONENBESCHWOERER, "Bei den Beliaranhängern erlernt jeder Novize die zwei ersten Magiekreise, bevor er sich zu einem Krieger oder Magier spezialisiert.");
};

INSTANCE Info_Mod_Xardas_NW_WoSindAndere (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_WoSindAndere_Condition;
	information	= Info_Mod_Xardas_NW_WoSindAndere_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie komme ich zu dieser Bergfestung?";
};

FUNC INT Info_Mod_Xardas_NW_WoSindAndere_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_WasMussIchTun))
	&& (Mod_Gilde	==	0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_WoSindAndere_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_WoSindAndere_15_00"); //Wie komme ich zu dieser Bergfestung?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_WoSindAndere_14_01"); //Die Frage lässt sich ganz einfach beantworten. Schau mal ein Stockwerk höher. Dort steht mein eigener Schrein.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_WoSindAndere_15_02"); //Und weiter? Ich wollte nicht beten.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_WoSindAndere_14_03"); //(spöttisch) Dir sei deine freche Unwissenheit noch einmal verziehen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_WoSindAndere_14_04"); //Wir benutzen die Beliarschreine als Teleporter. Du musst jeden Schrein aktivieren, um damit reisen zu können, aber dann kannst du zwischen ihnen wechseln, wie du willst.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_WoSindAndere_14_05"); //Mein Schrein ist bisher nur mit dem der Festung verbunden. Du kannst sie also gar nicht verfehlen.

	B_LogEntry	(TOPIC_MOD_DAEMONENBESCHWOERER, "Die Festung der Beliaranhänger erreiche ich über den Beliarschrein in Xardas' Turm, der gleichzeitig als Teleporter funktioniert.");

	Mod_BeliarStatue_Krieger_Dabei = 1;
};

INSTANCE Info_Mod_Xardas_NW_VonWemKannIchLernen (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_VonWemKannIchLernen_Condition;
	information	= Info_Mod_Xardas_NW_VonWemKannIchLernen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bei wem kann ich was lernen?";
};

FUNC INT Info_Mod_Xardas_NW_VonWemKannIchLernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_WasMussIchTun))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_VonWemKannIchLernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_VonWemKannIchLernen_15_00"); //Bei wem kann ich was lernen?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_VonWemKannIchLernen_14_01"); //Ich kann dir etwas über die Magie beibringen.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_BELIARFESTUNG, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_BELIARFESTUNG, "Xardas kann mir helfen mein Mana zu steigern.");
};

INSTANCE Info_Mod_Xardas_NW_GomezHier (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_GomezHier_Condition;
	information	= Info_Mod_Xardas_NW_GomezHier_Info;
	permanent	= 0;
	important	= 0;
	description	= "Warum lebt Gomez noch?";
};

FUNC INT Info_Mod_Xardas_NW_GomezHier_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gomez_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_GomezHier_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_GomezHier_15_00"); //Warum lebt Gomez noch?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_GomezHier_14_01"); //Er ist einer unserer Krieger.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_GomezHier_15_02"); //Aber ich habe ihn und die anderen im Alten Lager damals umgebracht.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_GomezHier_14_03"); //Auf eine gewisse Weise schon. Aber vom endgültigen Tod war er noch weit entfernt.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_GomezHier_15_04"); //Und warum erinnert er sich nicht an mich?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_GomezHier_14_05"); //Ich habe über ihn und seine Handlanger einen starken Vergessenszauber gelegt.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_GomezHier_14_06"); //Sie haben alles vergessen, was im Minental passiert ist.
};

INSTANCE Info_Mod_Xardas_NW_WannNovize (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_WannNovize_Condition;
	information	= Info_Mod_Xardas_NW_WannNovize_Info;
	permanent	= 0;
	important	= 0;
	description	= "Andokai ist von mir überzeugt und würde mich aufnehmen.";
};

FUNC INT Info_Mod_Xardas_NW_wannNovize_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andokai_WarInBib))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_WannNovize_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_WannNovize_15_00"); //Andokai ist von mir überzeugt und würde mich aufnehmen.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_WannNovize_15_01"); //Er meint aber, er brauche noch deine Zustimmung.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_WannNovize_14_02"); //Du weißt, dass ich viel von dir halte, und dass ich dich nicht erst auf die Probe stellen muss, um das herauszufinden.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_WannNovize_15_03"); //Danke. Aber?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_WannNovize_14_04"); //Es wäre anderen Bewerbern gegenüber unfair, dich bevorzugt zu behandeln. Deshalb werde ich dir noch eine Prüfung auftragen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_WannNovize_14_05"); //Daran, dass sie anspruchsvoll ist, siehst du, dass ich dir vertraue.
};

INSTANCE Info_Mod_Xardas_NW_LetzterTest (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_LetzterTest_Condition;
	information	= Info_Mod_Xardas_NW_LetzterTest_Info;
	permanent	= 0;
	important	= 0;
	description	= "Schön, was soll das für eine Prüfung sein?";
};

FUNC INT Info_Mod_Xardas_NW_LetzterTest_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_WannNovize))
	&& (Mod_Gilde == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_LetzterTest_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_LetzterTest_15_00"); //Schön, was soll das für eine Prüfung sein?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_LetzterTest_14_01"); //Es geht um eine Splittergruppe von Gläubigen, die sich unter der Führung eines gewissen Ryan zusammengefunden hat.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_LetzterTest_15_02"); //Wo denn?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_LetzterTest_14_03"); //Im Allerheiligsten der Feuermagier, der Höhle der Feuerprüfung, ganz im Norden von Khorinis gelegen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_LetzterTest_14_04"); //Eigentlich sollte uns das nicht stören, sondern viel eher belustigen - würden Ryan und seine Gruppe nicht einen verderblichen Einfluss ausüben.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_LetzterTest_14_05"); //Mit seinen sadistischen Ritualen, die er im Namen Beliars ausführt, lästert er unserem Gott.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_LetzterTest_14_06"); //Wie ich hören musste, sind sogar zwei unserer Novizen zu ihm übergelaufen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_LetzterTest_14_07"); //Es wird also Zeit, Ryan Einhalt zu gebieten. Allerdings hat Ryan auch gemerkt, dass er zu weit gegangen ist, und schützt sich mit starken Zaubern.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_LetzterTest_14_08"); //Wie mir unser Spion mitteilte, gibt es nur eine Waffe, die imstande ist, ihm signifikant Schaden zuzufügen - und die besitzt ausgerechnet der Priester der Sekte.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_LetzterTest_14_09"); //Es handelt sich um den Drei-Götter-Stab.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_LetzterTest_15_10"); //Oho.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_LetzterTest_14_11"); //Eine schreckliche Götterlästerung, nicht wahr? Mit diesem Stecken verhauen sich die notgeilen Spinner ihre Ärsche und rufen dabei Beliar an!
	AI_Output(self, hero, "Info_Mod_Xardas_NW_LetzterTest_14_12"); //Du musst dir also diesen Stab besorgen und Ryan damit beseitigen.

	B_LogEntry	(TOPIC_MOD_DAEMONENBESCHWOERER, "Xardas hat mir einem abtrünnigen Magier namens Ryan erzählt, der in der Höhle der Feuerprüfung der Feuermagier dunkle Rituale abhält. Ich soll ihn aufhalten. Um ihn zu töten, benötige ich jedoch den sogenannten Drei-Götter-Stab. Diesen trägt laut Xardas der Priester der Gruppe bei sich.");

	Info_ClearChoices	(Info_Mod_Xardas_NW_LetzterTest);

	Info_AddChoice	(Info_Mod_Xardas_NW_LetzterTest, "Ich werde sehen, was ich tun kann.", Info_Mod_Xardas_NW_LetzterTest_B);
	Info_AddChoice	(Info_Mod_Xardas_NW_LetzterTest, "Kann ich Ryan nicht anders überzeugen als mit dem Schwert?", Info_Mod_Xardas_NW_LetzterTest_A);
};

FUNC VOID Info_Mod_Xardas_NW_LetzterTest_B()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_LetzterTest_B_15_00"); //Ich werde sehen, was ich tun kann.

	Wld_InsertNpc	(Mod_1942_Ryan_NW, "TAVERNE");
	Wld_InsertNpc	(Mod_1943_Waechter_01_NW, "TAVERNE");
	Wld_InsertNpc	(Mod_1944_Waechter_02_NW, "TAVERNE");
	Wld_InsertNpc	(Mod_1945_Waechter_03_NW, "TAVERNE");
	Wld_InsertNpc	(Mod_1946_Waechter_04_NW, "TAVERNE");
	Wld_InsertNpc	(Mod_1947_Waechter_05_NW, "TAVERNE");
	Wld_InsertNpc	(Mod_1948_Waechter_06_NW, "TAVERNE");
	Wld_InsertNpc	(Mod_1949_Waechter_07_NW, "TAVERNE");
	Wld_InsertNpc	(Mod_1952_Waechter_08_NW, "TAVERNE");
	Wld_InsertNpc	(Mod_1951_Priester_NW, "TAVERNE");

	Info_ClearChoices	(Info_Mod_Xardas_NW_LetzterTest);
};

FUNC VOID Info_Mod_Xardas_NW_LetzterTest_A()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_LetzterTest_A_15_00"); //Kann ich Ryan nicht anders überzeugen als mit dem Schwert?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_LetzterTest_A_14_01"); //Nein. Ryan hat sein Ende selbst gewählt. Er hat gewusst, worauf er sich einlässt.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_LetzterTest_A_14_02"); //Du musst als Anhänger Beliars lernen, dass der Tod nur ein Bestandteil der Natur ist.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_LetzterTest_A_14_03"); //Dies ist nicht die schrecklichste Bestrafung, die wir uns für Ryan einfallen lassen könnten.
};

INSTANCE Info_Mod_Xardas_NW_LetzterTest_Success (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_LetzterTest_Success_Condition;
	information	= Info_Mod_Xardas_NW_LetzterTest_Success_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ryan ist tot und seine Sekte zerschlagen.";
};

FUNC INT Info_Mod_Xardas_NW_LetzterTest_Success_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_LetzterTest))
	&& (Npc_IsDead(Mod_1942_Ryan_NW))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_LetzterTest_Success_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_LetzterTest_Success_15_00"); //Ryan ist tot und seine Sekte zerschlagen.

	if (Npc_HasItems(hero, Ryans_Almanach) == 1)
	{
		AI_Output(hero, self, "Info_Mod_Xardas_NW_LetzterTest_Success_15_01"); //Das habe ich dort gefunden. Es enthält sicher einige lasterhafte Praktiken.

		B_GiveInvItems	(hero, self, Ryans_Almanach, 1);

		AI_Output(self, hero, "Info_Mod_Xardas_NW_LetzterTest_Success_14_02"); //Ein wertvolles Überbleibsel eines falschen Glaubens. Du tatest richtig daran, es mitzubringen.

		B_GivePlayerXP	(400);
	}
	else
	{

		B_GivePlayerXP	(300);
	};

	AI_Output(self, hero, "Info_Mod_Xardas_NW_LetzterTest_Success_14_03"); //Wie ich erwartet habe, hast du diese Prüfung mit Bravour bestanden. Deiner Aufnahme als Schwarzer Novize steht damit nichts mehr im Weg.

	B_LogEntry_More	(TOPIC_MOD_GILDENAUFNAHME, TOPIC_MOD_DAEMONENBESCHWOERER, "Ich kann jetzt Schwarzer Novize werden.", "Ich kann jetzt Schwarzer Novize werden.");

	B_GiveInvItems	(self, hero, ItMi_Gold, 200);

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Xardas_NW_Rasend (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_Rasend_Condition;
	information	= Info_Mod_Xardas_NW_Rasend_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ein gigantischer Dämon hat auf Khorinis gewütet.";
};

FUNC INT Info_Mod_Xardas_NW_Rasend_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_NW_Rasend))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_Rasend_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Rasend_15_00"); //Ein gigantischer Dämon hat auf Khorinis gewütet und verheerende Blutbäder unter den Paladinen in der Stadt, dem Kloster und der Ausgrabungsstätte der Wassermagier angerichtet.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Rasend_15_01"); //Was hat das zu bedeuten? Warum gezielt die Diener Innos' und Adanos'?
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Rasend_15_02"); //Mir ist nicht zu Ohren gekommen, dass er auch die Magier und Krieger Beliars heimgesucht hätte ...
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rasend_14_03"); //Was, ein mächtiges dämonisches Wesen, sagst du? Dann hat mich also meine Wahrnehmung nicht getäuscht ...
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Rasend_15_04"); //Wovon sprichst du?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rasend_14_05"); //Ich spürte die Präsenz eben dieses gewaltigen Dämons in der Umgebung und kann sie immer noch wahrnehmen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rasend_14_06"); //Wenn ich mich nicht täusche, ist es ein mächtiger Diener Beliars, genannt Shivar.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rasend_14_07"); //Und du berichtest, er hätte persönlich das alles zu verantworten?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rasend_14_08"); //Keine Dienerkreaturen oder dergleichen, die ihn unterstützt hätten?
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Rasend_15_09"); //Ja, so wie ich es berichte.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rasend_14_10"); //Das ist mehr als ungewöhnlich.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rasend_14_11"); //Er ist ein Fürst unter den Dämonen und verfügt über einen riesigen Stab an niederen Dienerkreaturen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rasend_14_12"); //Dass er selbst in Erscheinung tritt und solches Übel verbreitet, wirft viele Fragen auf ...
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rasend_14_13"); //Lass mich nachdenken. (überlegt) Ich hörte von seltsamen Vorkommnissen auf dem Weidenplateau und der Umgebung.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rasend_14_14"); //Böden wurden gesegnet und verflucht und dann traten Ungetüme in Erscheinung ...
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rasend_14_15"); //Du kannst mir doch bestimmt mehr darüber berichten.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Rasend_15_16"); //Ja, ich hatte tatsächlich einen unmittelbaren Einfluss auf diese Geschehnisse.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Rasend_15_17"); //Im Auftrag der Wassermagier reinigte ich die Böden von den Einflüssen der beiden Gottheiten wieder.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Rasend_15_18"); //Und dann bemächtigte sich eine finstere Macht der freigesetzten Kräfte und rief damit die Kreaturen auf dem Weidenplateau herbei.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rasend_14_19"); //Die Magie der beiden Gottheiten absorbiert und damit die Geschöpfe beschworen?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rasend_14_20"); //Das ist höchst interessant und könnte wichtige Rückschlüsse auf die jetzigen Ereignisse geben.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rasend_14_21"); //Ich hatte nämlich davon gelesen, dass die Diener des Xeres die Macht dazu besessen hätten, Kontrolle über Magie anderer Gottheiten und damit auch über ihre magischen Geschöpfe an sich zu reißen.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Rasend_15_22"); //(erschüttert) Willst du damit sagen, dass dieser grauenvolle Dämon jetzt unter dem Einfluss von Xeres steht?
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Rasend_15_23"); //Dann wäre es in der tat schlecht um uns alle bestellt ...
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rasend_14_24"); //Ich weiß es nicht. Hat Xeres' Einfluss so zugenommen, dass er sogar Kontrolle über die ergebensten Geschöpfe Beliars erlangen kann?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rasend_14_25"); //Ich wage es mir kaum vorzustellen. Es würde auch immer noch einige Widersprüche und Fragen aufwerfen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rasend_14_26"); //Warum kam er ohne Dienerkreaturen und weshalb ließ er bislang die Anhänger Beliars gänzlich verschont ...
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Rasend_15_27"); //Die Hauptsache ist, dass ich eine Möglichkeit finden kann, seinem Treiben ein Ende zu setzen.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Rasend_15_28"); //Wenn es nicht anders geht, werde ich wohl mit Schwert und Magie gegen ihn vorrücken müssen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rasend_14_29"); //Shivar im Kampf bezwingen? Dies zu versuchen wäre glatter Wahnsinn.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rasend_14_30"); //Er ist weit mächtiger, als jeder Gegner, dem du bislang im direkten Kampf gegenüberstandest.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rasend_14_31"); //Du würdest vermutlich nicht mal nahe genug an ihn herankommen können, um eine einzige Attacke gegen ihn führen zu können ...
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Rasend_15_32"); //Aber irgendetwas muss ich doch tun können. Nur tatenlos zusehen, wie er auf Khorinis mordet?!
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Rasend_15_33"); //Gibt es wirklich nichts, was mir bei dem Aufeinandertreffen mit ihm helfen könnte?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rasend_14_34"); //Nun, er ist ein Dämon voll Hybris und toleriert nur seinesgleichen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rasend_14_35"); //Selbst ich als hoher Würdenträger der Dämonenmagier könnte mir nicht sicher sein, ob er sich nicht auch gegen mich wendet ...
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rasend_14_36"); //Du müsstest folglich einen Teil dämonischer Macht in dich selbst aufnehmen. Die Diener des Xeres sollen dazu in der Lage gewesen sein.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rasend_14_37"); //Schaue dich also in der Nähe des Weidenplateaus um, ob du nicht irgendwelche wichtigen Anhaltspunkte dazu findest.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rasend_14_38"); //Wenn du etwas gefunden hast, komm wieder zu mir.

	B_LogEntry	(TOPIC_MOD_ADANOS_RASEND, "Xardas forderte mich dazu auf, in der Nähe des Weidenplateaus nach einem Mittel zu suchen, dass dämonische Kräfte in mir wecken könnte. Die Schöpfer der Ungetüme auf dem Plateau könnten so etwas besitzen.");

	Wld_InsertNpc	(Mod_7497_BlutkultMagier_NW, "TAVERNE");

	B_KillNpc	(Mod_7497_BlutkultMagier_NW);

	Mod_WM_BlutkultAttack = 1;
};

INSTANCE Info_Mod_Xardas_NW_Rasend02 (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_Rasend02_Condition;
	information	= Info_Mod_Xardas_NW_Rasend02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich war bereits im 'Genuss' eines solchen Mittels.";
};

FUNC INT Info_Mod_Xardas_NW_Rasend02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Rasend))
	&& (Mod_WM_HeroHatDaemonInSich == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_Rasend02_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Rasend02_15_00"); //Ich war bereits im 'Genuss' eines solchen Mittels, mit welchem ich einige Zeit selbst zum teildämonischen Wesen wurde.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Rasend02_15_01"); //Die Schergen des Xeres hatten es bei sich.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rasend02_14_02"); //Tatsächlich? Ja, du sprichst wahr, ich kann immer noch einen kleinen, aber deutlichen dämonischen Funken in dir wahrnehmen. Es scheint von Bestand zu sein ...
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Rasend02_15_03"); //Und wie kann ich das jetzt für mich nutzen?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rasend02_14_04"); //Hmm, Dämonen solcher Macht, wie Shivar, sind immer von einer starken Aura umgeben.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rasend02_14_05"); //Wenn du in seine Nähe gelangst und dich fest auf das Dämonische in dir fokussierst, könntest du zumindest für eine Weile das Dämonische in seiner ganzen Blüte zum Vorschein kommen lassen.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Rasend02_15_06"); //Blüte des Dämonischen?

	AI_TurnAway	(hero, self);

	AI_Output(hero, self, "Info_Mod_Xardas_NW_Rasend02_15_07"); //(zu sich selbst) So eine Umschreibung kann auch nur einem Dämonenmagier in den Sinn kommen.

	AI_TurnToNpc	(hero, self);

	AI_Output(hero, self, "Info_Mod_Xardas_NW_Rasend02_15_08"); //(wieder zu Xardas) Zum Dämonen zu werden empfinde ich zwar nicht als besonders erstrebenswert, aber wenn es meine einzige Möglichkeit ist ...
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rasend02_14_09"); //Es würde dir auf jeden Fall neue Möglichkeiten eröffnen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rasend02_14_10"); //Wenn du so weit bist, versuche mit Shivar in den Dialog zu treten und zu erfahren, was vor sich geht.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Rasend02_14_11"); //Beliar möge dich behüten.

	B_LogEntry	(TOPIC_MOD_ADANOS_RASEND, "Na schön. Da das Dämonische nach dem Eintopf der Blutkultfritzen immer noch in mir weilt, soll ich mich in der Nähe des Dämonen Shivar voll darauf konzentrieren, um zum vollwertigen Dämonen zu werden. Anschließend könnte ich so manches von ihm erfahren ...");
};

INSTANCE Info_Mod_Xardas_NW_Trent (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_Trent_Condition;
	information	= Info_Mod_Xardas_NW_Trent_Info;
	permanent	= 0;
	important	= 0;
	description	= "In der verlassenen Mine hab ich das hier gefunden. Es hat einen Paladin verzaubert, sodass er mich töten wollte.";
};

FUNC INT Info_Mod_Xardas_NW_Trent_Condition()
{
	if (Mod_KG_SchwarzesErz == 1)
	&& (Npc_HasItems(hero, ItMi_SchwarzesErz_Trent) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_Trent_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Trent_15_00"); //In der verlassenen Mine hab ich das hier gefunden. Es hat einen Paladin verzaubert, sodass er mich töten wollte.

	B_GiveInvItems	(hero, self, ItMi_SchwarzesErz_Trent, 1);

	AI_Output(self, hero, "Info_Mod_Xardas_NW_Trent_14_01"); //Das ist wirklich interessant ... dieses Erz scheint verflucht zu sein.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Trent_14_02"); //Wenn ich die genauen Eigenschaften herausfinden kann, könnten es eine starke Waffe gegen deine Feinde sein.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Trent_14_03"); //Komm in ein paar Tagen wieder, dann werde ich mehr wissen.

	AI_TurnAway	(hero, self);

	AI_Output(hero, self, "Info_Mod_Xardas_NW_Trent_15_04"); //(zu sich selbst) Hm, dann solle ich jetzt wohl zu Lord Andre gehen ...

	B_LogEntry	(TOPIC_MOD_KG_RITUAL, "Xardas wird das schwarze Erz untersuchen. Ich sollte derweil zu Lord André gehen.");
};

INSTANCE Info_Mod_Xardas_NW_Trent2 (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_Trent2_Condition;
	information	= Info_Mod_Xardas_NW_Trent2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du etwas über das Erz erfahren?";
};

FUNC INT Info_Mod_Xardas_NW_Trent2_Condition()
{
	if (Mod_KG_NachOrkZauber == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_Trent2_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Trent2_15_00"); //Hast du etwas über das Erz erfahren? Ich bin gerade an einem Punkt, wo ich eine Wunderwaffe gebrauchen könnte.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Trent2_14_01"); //Leider ist es nicht so mächtig, wie ich gedacht habe. Gegen Xeres wird es uns nichts bringen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Trent2_14_02"); //Allerdings kannst du damit gegen gewisse Wesen Unsterblichkeit erlangen.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Trent2_15_03"); //Und wenn ich bereits eine Waffe habe, die das Gleiche kann? Könnte das Erz die Wirkung dann nicht auflösen?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Trent2_14_04"); //Ja ... an sich schon, aber was wäre das denn für ein Zufall ... Hast du noch so ein Erz gefunden?
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Trent2_15_05"); //Ja und nein. Ein unsterblicher Orkschamane hat mir etwas von einer schwarzen Lunge mit Menschenblut erzählt.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Trent2_14_06"); //Nun, so würde es wohl ein Ork nennen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Trent2_14_07"); //Nun gut, auch wenn wir das hier auch anders einsetzen könnten, haben wir wohl keine andere Wahl. Ein unbesiegbarer Schamane ist zu gefährlich.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Trent2_14_08"); //Nimm diesen Ring, ich habe ihn aus dem Erz machen lassen. Damit sollte deine Waffe ihm schaden können.

	B_GiveInvItems	(self, hero, ItRi_SchwarzesErz, 1);

	AI_Output(hero, self, "Info_Mod_Xardas_NW_Trent2_15_09"); //Hoffentlich klappt es!

	B_LogEntry	(TOPIC_MOD_KG_RITUAL, "Um den Schamanen töten zu können, muss ich den Ring, den Xardas aus dem schwarzen Erz hergestellt hat, anlegen und ihm dann gegenüber treten.");
};

INSTANCE Info_Mod_Xardas_NW_Aufnahme (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_Aufnahme_Condition;
	information	= Info_Mod_Xardas_NW_Aufnahme_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich möchte Schwarzer Novize werden.";
};

FUNC INT Info_Mod_Xardas_NW_Aufnahme_Condition()
{
	if (Mod_Gilde	==	0)
	&& (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_LetzterTest_Success))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_Aufnahme_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Aufnahme_15_00"); //Ich möchte Schwarzer Novize werden.
	
	if (hero.level >= 5)
	{
		AI_Output(self, hero, "Info_Mod_Xardas_NW_Aufnahme_14_01"); //Du weißt, dass es kein Zurück gibt? Dass deine Entscheidung endgültig ist?
		
		if (Mod_HatPlayerNeutraleKlamotten())
		{
			if (Mod_Gottstatus > 4)
			{
				AI_Output(self, hero, "Info_Mod_Xardas_NW_Aufnahme_14_02"); //Du solltest allerdings vorher noch ein paar Taten zu Gunsten von Beliar vollbringen.
			}
			else
			{
				Info_ClearChoices	(Info_Mod_Xardas_NW_Aufnahme);

				Info_AddChoice	(Info_Mod_Xardas_NW_Aufnahme, "Gib mir doch noch etwas Zeit.", Info_Mod_Xardas_NW_Aufnahme_Nein);
				Info_AddChoice	(Info_Mod_Xardas_NW_Aufnahme, "Ja.", Info_Mod_Xardas_NW_Aufnahme_Ja);
			};
		}
		else
		{
			AI_Output(self, hero, "Info_Mod_Xardas_NW_Aufnahme_14_03"); //Du solltest dir vorher aber noch eine neutrale Rüstung besorgen.
		};
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Xardas_NW_Aufnahme_14_04"); //Sammle noch etwas Erfahrung, dann werde ich dich mit Freuden aufnehmen.
	};
};

FUNC VOID Info_Mod_Xardas_NW_Aufnahme_Nein()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Aufnahme_Nein_15_00"); //Gib mir doch noch etwas Zeit.

	Info_ClearChoices	(Info_Mod_Xardas_NW_Aufnahme);
};

FUNC VOID Info_Mod_Xardas_NW_Aufnahme_Ja()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Aufnahme_Ja_15_00"); //Ja.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Aufnahme_Ja_14_01"); //Dann darf ich dich hiermit stellvertretend für Andokai willkommen heißen!
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Aufnahme_Ja_14_02"); //Er wird es mir schon nicht übelnehmen, wenn ich dir deine Rüstung und die traditionelle Waffe übergebe.

	CreateInvItems	(hero, ITAR_NOV_DMB_01, 1);
	CreateInvItems	(hero, ItMw_1h_SNov_Mace, 1);

	B_ShowGivenThings	("Schwarze Novizenrobe und Kampfstab erhalten");

	AI_UnequipArmor	(hero);
	AI_EquipArmor	(hero, ItAr_Nov_DMB_01);

	AI_Output(self, hero, "Info_Mod_Xardas_NW_Aufnahme_Ja_14_03"); //Du solltest dich damit besser nicht in der Nähe dieser Innosanbeter in der Stadt und im Innoskloster zeigen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Aufnahme_Ja_14_04"); //Wenn du eine bessere Waffe brauchst, dann solltest du zu Scar gehen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Aufnahme_Ja_14_05"); //Zu deinen Rechten und Pflichten sprich aber wirklich besser mit Andokai.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Aufnahme_Ja_14_06"); //Ich werde dich nun in Magie unterweisen, wenn du wünschst.

	B_LogEntry_More	(TOPIC_MOD_GILDENAUFNAHME, TOPIC_MOD_DAEMONENBESCHWOERER, "Ich bin jetzt ein Schwarzer Novize.", "Ich bin jetzt ein Schwarzer Novize.");
	B_SetTopicStatus	(TOPIC_MOD_GILDENAUFNAHME, LOG_SUCCESS);
	B_SetTopicStatus	(TOPIC_MOD_DAEMONENBESCHWOERER, LOG_SUCCESS);

	B_SetTopicStatus	(TOPIC_MOD_FEUERMAGIER, LOG_FAILED);
	B_SetTopicStatus	(TOPIC_MOD_MILIZ, LOG_FAILED);
	B_SetTopicStatus	(TOPIC_MOD_WASSERMAGIER, LOG_FAILED);
	B_SetTopicStatus	(TOPIC_MOD_SÖLDNER, LOG_FAILED);

	Mod_Gilde = 12;

	Info_ClearChoices	(Info_Mod_Xardas_NW_Aufnahme);

	Monster_Max += 6;
	
	hero.guild = GIL_KDF;
	Npc_SetTrueGuild	(hero, GIL_KDF);

	BeliarAufnahme = Wld_GetDay();

	Snd_Play ("LEVELUP");

	B_GivePlayerXP	(400);

	B_Göttergefallen(3, 5);
};

INSTANCE Info_Mod_Xardas_NW_AxtDesUntergangs (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_AxtDesUntergangs_Condition;
	information	= Info_Mod_Xardas_NW_AxtDesUntergangs_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was genau bewirkt die Axt denn?";
};

FUNC INT Info_Mod_Xardas_NW_AxtDesUntergangs_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_HabAxt))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_AxtDesUntergangs_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_AxtDesUntergangs_15_00"); //Was genau bewirkt die Axt denn? Besonders stark sieht sie nicht aus ...
	AI_Output(self, hero, "Info_Mod_Xardas_NW_AxtDesUntergangs_14_01"); //Momentan ist sie ihrer Stärke beraubt. Du wirst sie häufig benutzen müssen, um ihre ehemalige Stärke wiederzuerlangen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_AxtDesUntergangs_14_02"); //Sie entzieht jedem getöteten Feind einen Teil seiner Kraft und wird immer stärker.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_AxtDesUntergangs_15_03"); //Klingt interessant.
};

INSTANCE Info_Mod_Xardas_NW_MilizVorTurm (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_MilizVorTurm_Condition;
	information	= Info_Mod_Xardas_NW_MilizVorTurm_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Xardas_NW_MilizVorTurm_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Diego_VermissteFertig))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_MilizVorTurm_Info()
{
	AI_Output(self, hero, "Info_Mod_Xardas_NW_MilizVorTurm_14_00"); //Sofern du dich über die Kreaturen vor meinem Turm wunderst ... ein kleiner Mob aus der Stadt war unterwegs zu meinem Turm.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_MilizVorTurm_14_01"); //Meine Delegation hat sie gebührend begrüßt.
};

INSTANCE Info_Mod_Xardas_NW_AlteMineQuest (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_AlteMineQuest_Condition;
	information	= Info_Mod_Xardas_NW_AlteMineQuest_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Xardas_NW_AlteMineQuest_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Daemonisch3))
	&& (Wld_GetDay()-6 >= Mod_SP_Killed_Day)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_AlteMineQuest_Info()
{
	AI_Output(self, hero, "Info_Mod_Xardas_NW_AlteMineQuest_14_00"); //In der alten Mine haben sich beunruhigende Dinge ergeben, wie ich gerade erfuhr.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_AlteMineQuest_14_01"); //Mord und Totschlag ohne erkennbare Motive ... Näheres weiß ich noch nicht.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_AlteMineQuest_14_02"); //Ich denke jedoch, dass deine Fertigkeiten und Kenntnisse in der Situation dort von Nutzen sein könnten.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_AlteMineQuest_15_03"); //Gut, ich werde beizeiten dort vorbeischauen.

	Log_CreateTopic	(TOPIC_MOD_XARDAS_ALTEMINE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_XARDAS_ALTEMINE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_XARDAS_ALTEMINE, "Xardas bat mich darum in der Alten Mine vorbeizuschauen. Scheinbar hat es dort einige ungewöhnliche Gewalttaten gegeben.");

	Wld_InsertNpc	(Mod_7713_DMR_Daemonenritter_NW, "BIGFARM");
};

INSTANCE Info_Mod_Xardas_NW_AlteMineQuest2 (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_AlteMineQuest2_Condition;
	information	= Info_Mod_Xardas_NW_AlteMineQuest2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Xeres hatte wieder einmal seine Finger im Spiel.";
};

FUNC INT Info_Mod_Xardas_NW_AlteMineQuest2_Condition()
{
	if (Mod_AMQ_Viper == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_AlteMineQuest2_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_AlteMineQuest2_15_00"); //Xeres hatte wieder einmal seine Finger im Spiel.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_AlteMineQuest2_15_01"); //Ich habe jedoch seine dunklen Machenschaften in der Alten Mine vereitelt.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_AlteMineQuest2_14_02"); //Ja, ich habe gerade von den Ereignissen gehört.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_AlteMineQuest2_14_03"); //Den Weg über die Alte Mine wollte er sich erschließen, um seine Streitkräfte nach Khorinis zu bringen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_AlteMineQuest2_14_04"); //Sehr gerissen ... immer dort, wo es niemand erwartet.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_AlteMineQuest2_15_05"); //Stimmt ... alle Augen waren auf den Pass gerichtet.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_AlteMineQuest2_14_06"); //Nun, es ist müßig zu erwähnen, dass du nicht nur unsere Gemeinschaft, sondern ganz Khorinis wieder einmal vor einer Bedrohung bewahrt hast.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_AlteMineQuest2_14_07"); //Die Hinterlassenschaften des Feindes bei dieser Geschichte waren zudem nicht ganz wertlos.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_AlteMineQuest2_14_08"); //Ich habe unseren Schmied daher dazu angewiesen, dir etwas Schönes daraus anzufertigen.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_AlteMineQuest2_15_09"); //Wie meinst du das?
	AI_Output(self, hero, "Info_Mod_Xardas_NW_AlteMineQuest2_14_10"); //Unwichtig. Wenn du dich in unsere Festung begibst, wirst du es erfahren.

	B_SetTopicStatus	(TOPIC_MOD_XARDAS_ALTEMINE, LOG_SUCCESS);

	B_GivePlayerXP	(500);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Xardas_NW_Schreine (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_Schreine_Condition;
	information	= Info_Mod_Xardas_NW_Schreine_Info;
	permanent	= 0;
	important	= 0;
	description	= "Der Teleport vom Beliarschrein aus hat funktioniert.";
};

FUNC INT Info_Mod_Xardas_NW_Schreine_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andokai_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_Schreine_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Schreine_15_00"); //Der Teleport vom Beliarschrein aus hat funktioniert.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Schreine_14_01"); //Ich habe nichts anderes erwartet.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Schreine_14_02"); //Da das System recht jung ist, sind noch nicht viele Beliarschreine untereinander vernetzt.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Schreine_14_03"); //Deshalb bitte ich dich, auf deinen Reisen nach bisher nicht angeschlossenen Schreinen Ausschau zu halten.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Schreine_14_04"); //Sollte es dir gelingen, alle Schreine zu aktivieren, werde ich mir eine kleine Belohnung für dich ausdenken.

	Log_CreateTopic	(TOPIC_MOD_BELIAR_SCHREINE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BELIAR_SCHREINE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BELIAR_SCHREINE, "Xardas hat mir aufgetragen, alle Beliarschreine zu aktivieren, die ich auf meinem Weg finde. Sobald ich alle verfügbaren Schreine angeschlossen habe, will er sich eine Belohnung für mich ausdenken.");
};

INSTANCE Info_Mod_Xardas_NW_Schreine2 (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_Schreine2_Condition;
	information	= Info_Mod_Xardas_NW_Schreine2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich glaube, ich habe alle Beliarschreine untereinander angeschlossen.";
};

FUNC INT Info_Mod_Xardas_NW_Schreine2_Condition()
{
	if (Mod_Beliarschreine == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_Schreine2_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Schreine2_15_00"); //Ich glaube, ich habe alle Beliarschreine untereinander angeschlossen.
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Schreine2_14_01"); //Das nenne ich eine respektable Leistung. Ich bin dir zu großem Dank verpflichtet.
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Schreine2_15_02"); //Du erwähntest eine Belohnung...
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Schreine2_14_03"); //Richtig. (sucht) Ich hatte ihn doch letztens noch hier irgendwo...
	AI_Output(self, hero, "Info_Mod_Xardas_NW_Schreine2_14_04"); //Ah, genau. Hier ist er.

	B_GiveInvItems	(self, hero, ItPo_Perm_Mana, 1);

	AI_Output(self, hero, "Info_Mod_Xardas_NW_Schreine2_14_06"); //Den Trank habe ich schon seit Ewigkeiten. Ich hoffe, er wirkt noch.

	B_SetTopicStatus	(TOPIC_MOD_BELIAR_SCHREINE, LOG_SUCCESS);
};

var int Xardas_LastPetzCounter;
var int Xardas_LastPetzCrime;

INSTANCE Info_Mod_Xardas_PMSchulden (C_INFO)
{
	npc         	= Mod_513_DMB_Xardas_NW;
	nr          	= 1;
	condition   	= Info_Mod_Xardas_PMSchulden_Condition;
	information 	= Info_Mod_Xardas_PMSchulden_Info;
	permanent   	= 1;
	important 	= 1; 
};

FUNC INT Info_Mod_Xardas_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Xardas_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Xardas_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Xardas_PMSchulden_Info()
{
	AI_Output (self, hero, "Info_Mod_Xardas_PMSchulden_14_00"); //Bist du gekommen, um deine Strafe zu zahlen?

	if (B_GetTotalPetzCounter(self) > Xardas_LastPetzCounter)
	{
		AI_Output (self, hero, "Info_Mod_Xardas_PMSchulden_14_01"); //Ich hatte mich schon gefragt, ob du es überhaupt noch wagst, hierher zu kommen!
		AI_Output (self, hero, "Info_Mod_Xardas_PMSchulden_14_02"); //Anscheinend ist es nicht bei den letzten Anschuldigungen geblieben!

		if (Xardas_Schulden < 1000)
		{
			AI_Output (self, hero, "Info_Mod_Xardas_PMSchulden_14_03"); //Ich hatte dich gewarnt! Die Strafe, die du jetzt zahlen musst, ist höher!
			AI_Output (hero, self, "Info_Mod_Xardas_PMAdd_15_00"); //Wieviel?
			
			var int diff; diff = (B_GetTotalPetzCounter(self) - Xardas_LastPetzCounter);
		
			if (diff > 0)
			{
				Xardas_Schulden = Xardas_Schulden + (diff * 50);
			};
		
			if (Xardas_Schulden > 1000)	{	Xardas_Schulden = 1000;	};
		
			B_Say_Gold (self, hero, Xardas_Schulden);
		}
		else
		{
			AI_Output (self, hero, "Info_Mod_Xardas_PMSchulden_14_04"); //Du hast mich schwer enttäuscht!
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Xardas_LastPetzCrime)
	{
		AI_Output (self, hero, "Info_Mod_Xardas_PMSchulden_14_05"); //Es haben sich einige neue Dinge ergeben.
		
		if (Xardas_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, hero, "Info_Mod_Xardas_PMSchulden_14_06"); //Plötzlich gibt es niemanden mehr, der dich des Mordes bezichtigt.
		};
		
		if (Xardas_LastPetzCrime == CRIME_THEFT)
		|| ( (Xardas_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, hero, "Info_Mod_Xardas_PMSchulden_14_07"); //Niemand erinnert sich mehr, dich bei einem Diebstahl gesehen zu haben.
		};
		
		if (Xardas_LastPetzCrime == CRIME_ATTACK)
		|| ( (Xardas_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, hero, "Info_Mod_Xardas_PMSchulden_14_08"); //Es gibt keine Zeugen mehr dafür, dass du jemals in eine Schlägerei verwickelt warst.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, hero, "Info_Mod_Xardas_PMSchulden_14_09"); //Anscheinend haben sich alle Anklagen gegen dich in Wohlgefallen aufgelöst.
		};
		
		AI_Output (self, hero, "Info_Mod_Xardas_PMSchulden_14_10"); //Ich weiß nicht, was da gelaufen ist, aber ich warne dich: Spiel keine Spielchen mit mir.
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, hero, "Info_Mod_Xardas_PMSchulden_14_11"); //Ich habe mich jedenfalls entschieden, dir deine Schulden zu erlassen.
			AI_Output (self, hero, "Info_Mod_Xardas_PMSchulden_14_12"); //Sieh zu, dass du nicht wieder in Schwierigkeiten kommst.
	
			Xardas_Schulden			= 0;
			Xardas_LastPetzCounter 	= 0;
			Xardas_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, hero, "Info_Mod_Xardas_PMSchulden_14_13"); //Damit eins klar ist: Deine Strafe musst du trotzdem in voller Höhe zahlen.
			B_Say_Gold (self, hero, Xardas_Schulden);
			AI_Output (self, hero, "Info_Mod_Xardas_PMSchulden_14_14"); //Also, was ist?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(Info_Mod_Xardas_PMSchulden);
		Info_ClearChoices  	(Info_Mod_Xardas_PETZMASTER);
		Info_AddChoice		(Info_Mod_Xardas_PMSchulden,"Ich habe nicht genug Gold!",Info_Mod_Xardas_PETZMASTER_PayLater);
		Info_AddChoice		(Info_Mod_Xardas_PMSchulden,"Wieviel war es nochmal?",Info_Mod_Xardas_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(hero, itmi_gold) >= Xardas_Schulden)
		{
			Info_AddChoice 	(Info_Mod_Xardas_PMSchulden,"Ich will die Strafe zahlen.",Info_Mod_Xardas_PETZMASTER_PayNow);
		};
	};
};

func void Info_Mod_Xardas_PMSchulden_HowMuchAgain()
{
	AI_Output (hero, self, "Info_Mod_Xardas_PMSchulden_HowMuchAgain_15_00"); //Wie viel war es noch mal?
	B_Say_Gold (self, hero, Xardas_Schulden);

	Info_ClearChoices  	(Info_Mod_Xardas_PMSchulden);
	Info_ClearChoices  	(Info_Mod_Xardas_PETZMASTER);
	Info_AddChoice		(Info_Mod_Xardas_PMSchulden,"Ich habe nicht genug Gold!",Info_Mod_Xardas_PETZMASTER_PayLater);
	Info_AddChoice		(Info_Mod_Xardas_PMSchulden,"Wieviel war es nochmal?",Info_Mod_Xardas_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(hero, itmi_gold) >= Xardas_Schulden)
	{
		Info_AddChoice 	(Info_Mod_Xardas_PMSchulden,"Ich will die Strafe zahlen.",Info_Mod_Xardas_PETZMASTER_PayNow);
	};
};

INSTANCE Info_Mod_Xardas_PETZMASTER   (C_INFO)
{
	npc         	= Mod_513_DMB_Xardas_NW;
	nr          	= 1;
	condition   	= Info_Mod_Xardas_PETZMASTER_Condition;
	information 	= Info_Mod_Xardas_PETZMASTER_Info;
	permanent   	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Xardas_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Xardas_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Xardas_PETZMASTER_Info()
{
	Xardas_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...	
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, hero, "Info_Mod_Xardas_PETZMASTER_14_01"); //Gut, dass du zu mir kommst, bevor alles noch schlimmer für dich wird.
		AI_Output (self, hero, "Info_Mod_Xardas_PETZMASTER_14_02"); //Mord ist ein schweres Vergehen!

		Xardas_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50

		Xardas_Schulden = Xardas_Schulden + 500;						//PLUS Mörder-Malus

		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Xardas_PETZMASTER_14_03"); //Ganz zu schweigen von den anderen Sachen, die du angerichtet hast.
		};

		AI_Output (self, hero, "Info_Mod_Xardas_PETZMASTER_14_06"); //Ich habe kein Interesse daran, dich an den Galgen zu bringen.
		AI_Output (self, hero, "Info_Mod_Xardas_PETZMASTER_14_07"); //Aber es wird nicht leicht sein, die Leute wieder gnädig zu stimmen.
		AI_Output (self, hero, "Info_Mod_Xardas_PETZMASTER_14_08"); //Du könntest deine Reue zeigen, indem du eine Strafe zahlst - natürlich muss die Strafe angemessen hoch sein.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, hero, "Info_Mod_Xardas_PETZMASTER_14_09"); //Gut, dass du kommst! Du wirst des Diebstahls bezichtigt! Es gibt Zeugen!

		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Xardas_PETZMASTER_14_10"); //Von den anderen Dingen, die mir zu Ohren gekommen sind, will ich gar nicht erst reden.
		};

		AI_Output (self, hero, "Info_Mod_Xardas_PETZMASTER_14_11"); //Ich werde so ein Verhalten hier nicht dulden!
		AI_Output (self, hero, "Info_Mod_Xardas_PETZMASTER_14_12"); //Du wirst eine Strafe zahlen müssen, um dein Verbrechen wieder gutzumachen!
		
		Xardas_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, hero, "Info_Mod_Xardas_PETZMASTER_14_13"); //Wenn du dich mit der Miliz oder den Feuermagiern herumprügelst, ist das eine Sache ...
		AI_Output (self, hero, "Info_Mod_Xardas_PETZMASTER_14_14"); //Aber wenn du unsere Leute angreifst, muss ich dich zur Rechenschaft ziehen.

		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, hero, "Info_Mod_Xardas_PETZMASTER_14_15"); //Und die Sache mit den Schafen musste wohl auch nicht sein.
		};

		AI_Output (self, hero, "Info_Mod_Xardas_PETZMASTER_14_16"); //Wenn ich dir das durchgehen lasse, macht hier bald jeder, was er will.
		AI_Output (self, hero, "Info_Mod_Xardas_PETZMASTER_14_17"); //Also wirst du eine angemessene Strafe zahlen - und die Sache ist vergessen.
		
		Xardas_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, hero, "Info_Mod_Xardas_PETZMASTER_14_18"); //Mir ist zu Ohren gekommen, du hättest dich an unseren Schafen vergriffen.
		AI_Output (self, hero, "Info_Mod_Xardas_PETZMASTER_14_19"); //Dir ist klar, dass ich das nicht durchgehen lassen kann.
		AI_Output (self, hero, "Info_Mod_Xardas_PETZMASTER_14_20"); //Du wirst eine Entschädigung zahlen müssen!
		
		Xardas_Schulden = 100;
	};
	
	AI_Output (hero, self, "Info_Mod_Xardas_PETZMASTER_15_21"); //Wie viel?
	
	if (Xardas_Schulden > 1000)	{	Xardas_Schulden = 1000;	};
		
	B_Say_Gold (self, hero, Xardas_Schulden);
	
	Info_ClearChoices  	(Info_Mod_Xardas_PMSchulden);
	Info_ClearChoices  	(Info_Mod_Xardas_PETZMASTER);
	Info_AddChoice		(Info_Mod_Xardas_PETZMASTER,"Ich habe nicht genug Gold!",Info_Mod_Xardas_PETZMASTER_PayLater);
	if (Npc_HasItems(hero, itmi_gold) >= Xardas_Schulden)
	{
		Info_AddChoice 	(Info_Mod_Xardas_PETZMASTER,"Ich will die Strafe zahlen.",Info_Mod_Xardas_PETZMASTER_PayNow);
	};
};

func void Info_Mod_Xardas_PETZMASTER_PayNow()
{
	AI_Output (hero, self, "Info_Mod_Xardas_PETZMASTER_PayNow_15_00"); //Ich will die Strafe zahlen!
	B_GiveInvItems (hero, self, itmi_gold, Xardas_Schulden);
	AI_Output (self, hero, "Info_Mod_Xardas_PETZMASTER_PayNow_14_01"); //Gut! Ich werde dafür sorgen, dass es jeder von uns erfährt - damit wäre dein Ruf einigermaßen wiederhergestellt.

	B_GrantAbsolution (LOC_SMCAMP);
	
	Xardas_Schulden			= 0;
	Xardas_LastPetzCounter 	= 0;
	Xardas_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(Info_Mod_Xardas_PETZMASTER);
	Info_ClearChoices  	(Info_Mod_Xardas_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void Info_Mod_Xardas_PETZMASTER_PayLater()
{
	AI_Output (hero, self, "Info_Mod_Xardas_PETZMASTER_PayLater_15_00"); //Ich habe nicht genug Gold!
	AI_Output (self, hero, "Info_Mod_Xardas_PETZMASTER_PayLater_14_01"); //Dann sieh zu, dass du das Gold so schnell wie möglich beschaffst.
	AI_Output (self, hero, "Info_Mod_Xardas_PETZMASTER_PayLater_14_02"); //Und ich warne dich: Wenn du dir noch was zu schulden kommen lässt, wird die Sache noch schlimmer für dich!
	
	Xardas_LastPetzCounter 	= B_GetTotalPetzCounter(self);
	Xardas_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	AI_StopProcessInfos (self);
};

INSTANCE Info_Mod_Xardas_NW_Lernen_MANA (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_Lernen_MANA_Condition;
	information	= Info_Mod_Xardas_NW_Lernen_MANA_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will meine magischen Kräfte steigern.";
};

FUNC INT Info_Mod_Xardas_NW_Lernen_MANA_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_VonWemKannIchLernen))
	&& (hero.attribute[ATR_MANA_MAX]	<=	300)
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_Lernen_MANA_Info()
{
	AI_Output(hero, self, "Info_Mod_Xardas_NW_Lernen_MANA_15_00"); //Ich will meine magischen Kräfte steigern.

	Info_ClearChoices	(Info_Mod_Xardas_NW_Lernen_MANA);

	Info_AddChoice		(Info_Mod_Xardas_NW_Lernen_MANA, DIALOG_BACK, Info_Mod_Xardas_NW_Lernen_MANA_BACK);
	Info_AddChoice		(Info_Mod_Xardas_NW_Lernen_MANA, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Xardas_NW_Lernen_MANA_5);
	Info_AddChoice		(Info_Mod_Xardas_NW_Lernen_MANA, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Xardas_NW_Lernen_MANA_1);
};

FUNC VOID Info_Mod_Xardas_NW_Lernen_MANA_BACK()
{
	if (hero.attribute[ATR_MANA_MAX] >= 300)
	{
		AI_Output(self, hero, "Info_Mod_Xardas_NW_Lernen_MANA_BACK_14_01"); //Deine magischen Kenntnisse sind jetzt so gut, dass ich dir nichts mehr beibringen kann.
	};

	Info_ClearChoices	(Info_Mod_Xardas_NW_Lernen_MANA);
};

FUNC VOID Info_Mod_Xardas_NW_Lernen_MANA_5()
{
	B_TeachAttributePoints_New (self, hero, ATR_MANA_MAX, 5, 300);

	Info_ClearChoices	(Info_Mod_Xardas_NW_Lernen_MANA);

	Info_AddChoice		(Info_Mod_Xardas_NW_Lernen_MANA, DIALOG_BACK, Info_Mod_Xardas_NW_Lernen_MANA_BACK);
	Info_AddChoice		(Info_Mod_Xardas_NW_Lernen_MANA, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Xardas_NW_Lernen_MANA_5);
	Info_AddChoice		(Info_Mod_Xardas_NW_Lernen_MANA, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Xardas_NW_Lernen_MANA_1);
};

FUNC VOID Info_Mod_Xardas_NW_Lernen_MANA_1()
{
	B_TeachAttributePoints (self, hero, ATR_MANA_MAX, 1, 300);

	Info_ClearChoices	(Info_Mod_Xardas_NW_Lernen_MANA);

	Info_AddChoice		(Info_Mod_Xardas_NW_Lernen_MANA, DIALOG_BACK, Info_Mod_Xardas_NW_Lernen_MANA_BACK);
	Info_AddChoice		(Info_Mod_Xardas_NW_Lernen_MANA, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Xardas_NW_Lernen_MANA_5);
	Info_AddChoice		(Info_Mod_Xardas_NW_Lernen_MANA, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Xardas_NW_Lernen_MANA_1);
};

INSTANCE Info_Mod_Xardas_NW_Lehrer (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_Lehrer_Condition;
	information	= Info_Mod_Xardas_NW_Lehrer_Info;
	permanent	= 1;
	important	= 0;
	description	= "Kann ich bei dir lernen?";
};

FUNC INT Info_Mod_Xardas_NW_Lehrer_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Hallo))
	&& ((Mod_Gilde == 12)
	|| (Mod_Gilde == 13)
	|| (Mod_Gilde == 14)
	|| (Mod_Gilde == 15)
	|| (Mod_Gilde == 16))
	&& (Mod_IstLehrling == 1)
	{	
		return 1;
	};
};
FUNC VOID Info_Mod_Xardas_NW_Lehrer_Info()
{
	AI_Output (hero, self, "Info_Mod_Xardas_NW_Lehrer_15_00"); //Kann ich bei dir lernen?
	
	if (Mod_Gilde == 12)
	|| (Mod_Gilde == 13)
	|| (Mod_Gilde == 14)
	|| (Mod_Gilde == 15)
	|| (Mod_Gilde == 16)
	{
		AI_Output (self, hero, "Info_Mod_Xardas_NW_Lehrer_14_01"); //Ich werde dich in die Geheimnisse der Alchemie einweihen.
		
		if (Mod_XardasAlchemie == FALSE)
		{
			Mod_XardasAlchemie = TRUE;

			Log_CreateTopic	(TOPIC_MOD_LEHRER_BELIARFESTUNG, LOG_NOTE);
			B_LogEntry	(TOPIC_MOD_LEHRER_BELIARFESTUNG, "Xardas kann mir etwas über die Alchemie beibringen.");
		};

		Info_ClearChoices 	(Info_Mod_Xardas_NW_Lehrer);
		Info_AddChoice 		(Info_Mod_Xardas_NW_Lehrer,DIALOG_BACK,Info_Mod_Xardas_NW_Lehrer_BACK);
	
		if ( PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
		&& (Mod_LehrlingBei != 1)
		{
			Info_AddChoice 		(Info_Mod_Xardas_NW_Lehrer,B_BuildLearnString ("Essenz der Heilung", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_01)),Info_Mod_Xardas_NW_Lehrer_HEALTH_01);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
		&& ( PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
		{
			Info_AddChoice	  (Info_Mod_Xardas_NW_Lehrer, B_BuildLearnString ("Extrakt der Heilung", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_02)), Info_Mod_Xardas_NW_Lehrer_Health_02);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)
		&& ( PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)
		{
			Info_AddChoice	  (Info_Mod_Xardas_NW_Lehrer, B_BuildLearnString ("Elixier der Heilung", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_03)), Info_Mod_Xardas_NW_Lehrer_Health_03);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE)
		&& ( PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)
		&& (Mod_LehrlingBei != 1)
		&& (Kapitel >= 4)
		{
			Info_AddChoice	  (Info_Mod_Xardas_NW_Lehrer, B_BuildLearnString ("Elixier des Lebens", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Perm_Health)), Info_Mod_Xardas_NW_Lehrer_Perm_Health);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
		&& (Mod_LehrlingBei != 1)
		{
			Info_AddChoice	  (Info_Mod_Xardas_NW_Lehrer, B_BuildLearnString ("Mana Essenz", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_01)), Info_Mod_Xardas_NW_Lehrer_Mana_01);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
		&& ( PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
		{
			Info_AddChoice	  (Info_Mod_Xardas_NW_Lehrer, B_BuildLearnString ("Mana Extrakt", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_02)), Info_Mod_Xardas_NW_Lehrer_Mana_02);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
		&& ( PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
		{
			Info_AddChoice	  (Info_Mod_Xardas_NW_Lehrer, B_BuildLearnString ("Mana Elixier", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_03)), Info_Mod_Xardas_NW_Lehrer_Mana_03);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
		&& ( PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE)
		&& (Kapitel >= 4)
		{
			Info_AddChoice	  (Info_Mod_Xardas_NW_Lehrer, B_BuildLearnString ("Elixier des Geistes", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Perm_Mana)), Info_Mod_Xardas_NW_Lehrer_Perm_Mana);
		};                                                                                                                                                                                   
		if (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE) 
		&& (Kapitel >= 4)
		{                                                                                                                                                                                     
			Info_AddChoice (Info_Mod_Xardas_NW_Lehrer, B_BuildLearnString ("Elixier der Stärke", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Perm_STR)), Info_Mod_Xardas_NW_Lehrer_PermSTR);               
		};
		if (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
		&& (Kapitel >= 4)
		{
			Info_AddChoice (Info_Mod_Xardas_NW_Lehrer,B_BuildLearnString ("Elixier der Geschicklichkeit", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Perm_DEX)), Info_Mod_Xardas_NW_Lehrer_Perm_DEX);
		};		
	};
};
FUNC VOID Info_Mod_Xardas_NW_Lehrer_BACK()
{
	Info_ClearChoices 	(Info_Mod_Xardas_NW_Lehrer);
};
FUNC VOID Info_Mod_Xardas_NW_Lehrer_HEALTH_01()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_01);
};
FUNC VOID Info_Mod_Xardas_NW_Lehrer_PermStr()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Perm_STR);
};
FUNC VOID Info_Mod_Xardas_NW_Lehrer_Perm_DEX()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Perm_DEX);
};
FUNC VOID Info_Mod_Xardas_NW_Lehrer_HEALTH_02()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_02);
};
FUNC VOID Info_Mod_Xardas_NW_Lehrer_Health_03()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_03);
};
FUNC VOID Info_Mod_Xardas_NW_Lehrer_Perm_Health()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Perm_Health);
};
FUNC VOID Info_Mod_Xardas_NW_Lehrer_MANA_01()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_01);
};
FUNC VOID Info_Mod_Xardas_NW_Lehrer_MANA_02()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_02);
};
FUNC VOID Info_Mod_Xardas_NW_Lehrer_MANA_03()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_03);
};
FUNC VOID Info_Mod_Xardas_NW_Lehrer_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Perm_Mana);
};

INSTANCE Info_Mod_Xardas_NW_Pickpocket (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_Pickpocket_Condition;
	information	= Info_Mod_Xardas_NW_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_210;
};

FUNC INT Info_Mod_Xardas_NW_Pickpocket_Condition()
{
	C_Beklauen	(210, ItPo_MegaDrink, 1);
};

FUNC VOID Info_Mod_Xardas_NW_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Xardas_NW_Pickpocket);

	Info_AddChoice	(Info_Mod_Xardas_NW_Pickpocket, DIALOG_BACK, Info_Mod_Xardas_NW_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Xardas_NW_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Xardas_NW_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Xardas_NW_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Xardas_NW_Pickpocket);
};

FUNC VOID Info_Mod_Xardas_NW_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Xardas_NW_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Xardas_NW_Pickpocket);

		Info_AddChoice	(Info_Mod_Xardas_NW_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Xardas_NW_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Xardas_NW_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Xardas_NW_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Xardas_NW_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Xardas_NW_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Xardas_NW_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Xardas_NW_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Xardas_NW_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Xardas_NW_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Xardas_NW_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Xardas_NW_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Xardas_NW_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Xardas_NW_EXIT (C_INFO)
{
	npc		= Mod_513_DMB_Xardas_NW;
	nr		= 1;
	condition	= Info_Mod_Xardas_NW_EXIT_Condition;
	information	= Info_Mod_Xardas_NW_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Xardas_NW_EXIT_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_WasFuerGilden))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Xardas_NW_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};