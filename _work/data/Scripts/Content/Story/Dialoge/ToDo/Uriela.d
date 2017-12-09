INSTANCE Info_Mod_Uriela_GoOutOfHere (C_INFO)
{
	npc		= Mod_7167_HEX_Uriela_NW;
	nr		= 1;
	condition	= Info_Mod_Uriela_GoOutOfHere_Condition;
	information	= Info_Mod_Uriela_GoOutOfHere_Info;
	permanent	= 1;
	important	= 0;
	description	= "Verlasst dieses Haus und macht, dass ihr weg kommt!";
};

FUNC INT Info_Mod_Uriela_GoOutOfHere_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Telbor_Hausbesetzer))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Uriela_GoOutOfHere_Info()
{
	AI_Output(hero, self, "Info_Mod_Uriela_GoOutOfHere_15_00"); //Verlasst dieses Haus und macht, dass ihr weg kommt!
	AI_Output(self, hero, "Info_Mod_Uriela_GoOutOfHere_17_01"); //Nein, von hier lassen wir uns nicht mehr wegjagen.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Uriela_WhoAreYou (C_INFO)
{
	npc		= Mod_7167_HEX_Uriela_NW;
	nr		= 1;
	condition	= Info_Mod_Uriela_WhoAreYou_Condition;
	information	= Info_Mod_Uriela_WhoAreYou_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer seid ihr und was macht ihr hier?";
};

FUNC INT Info_Mod_Uriela_WhoAreYou_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Telbor_Hausbesetzer))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Uriela_WhoAreYou_Info()
{
	AI_Output(hero, self, "Info_Mod_Uriela_WhoAreYou_15_00"); //Wer seid ihr und was macht ihr hier?
	AI_Output(self, hero, "Info_Mod_Uriela_WhoAreYou_17_01"); //Wir sind gläubige Beliaranhänger, die von der Insel Khorala fliehen mussten und auf der Suche nach einer neuen Bleibe sind.
};

INSTANCE Info_Mod_Uriela_WhyFlight (C_INFO)
{
	npc		= Mod_7167_HEX_Uriela_NW;
	nr		= 1;
	condition	= Info_Mod_Uriela_WhyFlight_Condition;
	information	= Info_Mod_Uriela_WhyFlight_Info;
	permanent	= 0;
	important	= 0;
	description	= "Weshalb musstet ihr die Flucht ergreifen?";
};

FUNC INT Info_Mod_Uriela_WhyFlight_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Uriela_WhoAreYou))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Uriela_WhyFlight_Info()
{
	AI_Output(hero, self, "Info_Mod_Uriela_WhyFlight_15_00"); //Weshalb musstet ihr die Flucht ergreifen?
	AI_Output(self, hero, "Info_Mod_Uriela_WhyFlight_17_01"); //Die Schergen eines niederträchtigen Magiers Namens Xeres betraten unsere Siedlung und verlangten von uns Beliar zu verleugnen und stattdessen ihrem Herrn zu dienen.
	AI_Output(self, hero, "Info_Mod_Uriela_WhyFlight_17_02"); //Wir weigerten uns standhaft und wurden von ihnen angegriffen.
	AI_Output(self, hero, "Info_Mod_Uriela_WhyFlight_17_03"); //Wie sich zeigte, waren auch sie Herr über die sphärische Manifestation und sie schafften es zudem, einige unserer Kreaturen unter ihre Kontrolle zu bringen.
	AI_Output(self, hero, "Info_Mod_Uriela_WhyFlight_17_04"); //Wir unterlagen und konnten uns nur durch einen raschen Teleportzauber auf dieses Eiland hier retten – als einige der wenigen Überlebenden.
};

INSTANCE Info_Mod_Uriela_FarmWorking (C_INFO)
{
	npc		= Mod_7167_HEX_Uriela_NW;
	nr		= 1;
	condition	= Info_Mod_Uriela_FarmWorking_Condition;
	information	= Info_Mod_Uriela_FarmWorking_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dieser Hof wird bereits von einigen Leuten bewohnt.";
};

FUNC INT Info_Mod_Uriela_FarmWorking_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Uriela_WhyFlight))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Uriela_FarmWorking_Info()
{
	AI_Output(hero, self, "Info_Mod_Uriela_FarmWorking_15_00"); //Dieser Hof wird bereits von einigen Leuten bewohnt.
	AI_Output(self, hero, "Info_Mod_Uriela_FarmWorking_17_01"); //Und?! Was sollen wir denn machen? Auch wir brauchen Obdach.
};

INSTANCE Info_Mod_Uriela_LiveTogether (C_INFO)
{
	npc		= Mod_7167_HEX_Uriela_NW;
	nr		= 1;
	condition	= Info_Mod_Uriela_LiveTogether_Condition;
	information	= Info_Mod_Uriela_LiveTogether_Info;
	permanent	= 0;
	important	= 0;
	description	= "Könntet ihr nicht zusammen mit ihnen hier leben?";
};

FUNC INT Info_Mod_Uriela_LiveTogether_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Uriela_FarmWorking))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Uriela_LiveTogether_Info()
{
	AI_Output(hero, self, "Info_Mod_Uriela_LiveTogether_15_00"); //Könntet ihr nicht zusammen mit ihnen hier leben?
	AI_Output(self, hero, "Info_Mod_Uriela_LiveTogether_17_01"); //Mit denen?! Es sind doch vermutlich Diener Innos’. Wie sollte das klappen?
	AI_Output(hero, self, "Info_Mod_Uriela_LiveTogether_15_02"); //Auch sie haben Verluste erlitten, durch genau denselben Unhold. Er ist eine Gefahr für alle, die Diener Innos’, wie auch die Diener Beliars’.
	AI_Output(self, hero, "Info_Mod_Uriela_LiveTogether_17_03"); //Hmm, du magst vielleicht Recht haben. Unter diesen Umständen habe ich gegen eine Zusammenarbeit auf Zeit nichts einzuwenden.

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_TELBOR_HAUSBESETZER, "Es sind Diener Beliar’s, die vor Xeres’ Schergen fliehen mussten. Sie wären damit einverstanden für einige Zeit mit den anderen gemeinsam auf dem Hof zu leben. Ich hoffe, dass auch Telbor dafür zu gewinnen ist.");
};

INSTANCE Info_Mod_Uriela_LiveOtherway (C_INFO)
{
	npc		= Mod_7167_HEX_Uriela_NW;
	nr		= 1;
	condition	= Info_Mod_Uriela_LiveOtherway_Condition;
	information	= Info_Mod_Uriela_LiveOtherway_Info;
	permanent	= 0;
	important	= 0;
	description	= "Könntet ihr euch nicht doch vorstellen, woanders hin zu gehen?";
};

FUNC INT Info_Mod_Uriela_LiveOtherway_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Telbor_TalkAgain))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Uriela_LiveOtherway_Info()
{
	AI_Output(hero, self, "Info_Mod_Uriela_LiveOtherway_15_00"); //Könntet ihr euch nicht doch vorstellen, woanders hin zu gehen?
	AI_Output(self, hero, "Info_Mod_Uriela_LiveOtherway_17_01"); //Was?! Aber wohin denn. Ehe wir nicht eine andere Möglichkeit haben, bleiben wir hier.
};

INSTANCE Info_Mod_Uriela_ThinkForPlace (C_INFO)
{
	npc		= Mod_7167_HEX_Uriela_NW;
	nr		= 1;
	condition	= Info_Mod_Uriela_ThinkForPlace_Condition;
	information	= Info_Mod_Uriela_ThinkForPlace_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hmm, lass mich nachdenken, vielleicht fällt mir ja was ein.";
};

FUNC INT Info_Mod_Uriela_ThinkForPlace_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Uriela_LiveOtherway))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Uriela_ThinkForPlace_Info()
{
	AI_Output(hero, self, "Info_Mod_Uriela_ThinkForPlace_15_00"); //Hmm, lass mich nachdenken, vielleicht fällt mir ja was ein.
};

INSTANCE Info_Mod_Uriela_MageAndFighter (C_INFO)
{
	npc		= Mod_7167_HEX_Uriela_NW;
	nr		= 1;
	condition	= Info_Mod_Uriela_MageAndFighter_Condition;
	information	= Info_Mod_Uriela_MageAndFighter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ihr seid doch magisch begabt, kennt euch bestimmt in der Landwirtschaft etwas aus (...)";
};

FUNC INT Info_Mod_Uriela_MageAndFighter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Uriela_ThinkForPlace))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Uriela_MageAndFighter_Info()
{
	AI_Output(hero, self, "Info_Mod_Uriela_MageAndFighter_15_00"); //Ihr seid doch magisch begabt, kennt euch bestimmt in der Landwirtschaft etwas aus und könnt vermutlich auch mit Waffen kämpfen.
	AI_Output(hero, self, "Info_Mod_Uriela_MageAndFighter_15_01"); //Bei den Dämonenmagiern oder -kriegern oder auf dem Großbauernhof wird man euch bestimmt aufnehmen.
	AI_Output(self, hero, "Info_Mod_Uriela_MageAndFighter_17_02"); //Magisch begabt sind wir zwar, aber wir verstehen uns dennoch nicht auf runengebundene Magie.
	AI_Output(self, hero, "Info_Mod_Uriela_MageAndFighter_17_03"); //Und mein Sohn ist im Kampf mit den Waffen auch noch nicht so geschickt.
};

INSTANCE Info_Mod_Uriela_Bengar (C_INFO)
{
	npc		= Mod_7167_HEX_Uriela_NW;
	nr		= 1;
	condition	= Info_Mod_Uriela_Bengar_Condition;
	information	= Info_Mod_Uriela_Bengar_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bengar’s Hof ist verlassen.";
};

FUNC INT Info_Mod_Uriela_Bengar_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Uriela_ThinkForPlace))
	&& (Mod_BengarsHofLeer == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Uriela_Bengar_Info()
{
	AI_Output(hero, self, "Info_Mod_Uriela_Bengar_15_00"); //Bengar’s Hof ist verlassen. Ihr müsst dazu die Brücke überqueren und das nächste mal rechts einbiegen, auf das Weidenplateau.
	AI_Output(self, hero, "Info_Mod_Uriela_Bengar_17_01"); //Hört sich gut an, und wenn wir auf diesem Weg weiteren Konflikten aus dem Weg gehen können ...

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ATBENGAR");
	B_StartOtherRoutine	(Mod_7168_HEX_Hexe_NW, "ATBENGAR");
	B_StartOtherRoutine	(Mod_7169_OUT_Mann_NW, "ATBENGAR");
	B_StartOtherRoutine	(Mod_7170_OUT_Mann_NW, "ATBENGAR");

	Wld_InsertNpc	(FeldarbeiterSkelett_Bengar, "FARM3");

	B_GivePlayerXP	(300);

	B_LogEntry	(TOPIC_MOD_TELBOR_HAUSBESETZER, "So, die Belianer machen sich auf den Weg zu ihrer neuen Bleibe. Jetzt brauche ich nur noch Telbor bescheid zu geben, dass das Haus wieder frei ist.");
};

INSTANCE Info_Mod_Uriela_TeachMage (C_INFO)
{
	npc		= Mod_7167_HEX_Uriela_NW;
	nr		= 1;
	condition	= Info_Mod_Uriela_TeachMage_Condition;
	information	= Info_Mod_Uriela_TeachMage_Info;
	permanent	= 0;
	important	= 0;
	description	= "(Kreis 1 und 2 der Runenmagie lehren)";
};

FUNC INT Info_Mod_Uriela_TeachMage_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Uriela_MageAndFighter))
	&& (Mod_MagieKreis >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Uriela_TeachMage_Info()
{
	AI_Output(hero, self, "Info_Mod_Uriela_TeachMage_15_00"); //Der erste Kreis erlaubt es dir, Runen, die du erschaffen hast, anzuwenden.
	AI_Output(hero, self, "Info_Mod_Uriela_TeachMage_15_01"); //Du kannst jetzt die Formeln der Zaubersprüche lernen, um deine eigenen Runen herzustellen.
	AI_Output(hero, self, "Info_Mod_Uriela_TeachMage_15_02"); //Tritt nun in den zweiten Kreis und lerne, noch mächtigere Zauber zu wirken.

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Uriela_TeachingFinished (C_INFO)
{
	npc		= Mod_7167_HEX_Uriela_NW;
	nr		= 1;
	condition	= Info_Mod_Uriela_TeachingFinished_Condition;
	information	= Info_Mod_Uriela_TeachingFinished_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe euch unterwiesen.";
};

FUNC INT Info_Mod_Uriela_TeachingFinished_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Uriela_TeachMage))
	|| (Npc_KnowsInfo(hero, Info_Mod_Mann_TeachFight))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Uriela_TeachingFinished_Info()
{
	AI_Output(hero, self, "Info_Mod_Uriela_TeachingFinished_15_00"); //Ich habe euch unterwiesen.

	if (Npc_KnowsInfo(hero, Info_Mod_Uriela_TeachMage))
	{
		AI_Output(hero, self, "Info_Mod_Uriela_TeachingFinished_15_01"); //Du bist jetzt der Runenmagie mächtig.
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Mann_TeachFight))
	{
		AI_Output(hero, self, "Info_Mod_Uriela_TeachingFinished_15_02"); //Dein Sohn kann kämpfen.
	};

	AI_Output(self, hero, "Info_Mod_Uriela_TeachingFinished_17_03"); //Hab vielen Dank. Jetzt können wir uns woanders umsehen und mehr tun, als nur Rüben pflücken.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ATDEMON");
	B_StartOtherRoutine	(Mod_7168_HEX_Hexe_NW, "ATDEMON");
	B_StartOtherRoutine	(Mod_7169_OUT_Mann_NW, "ATDEMON");
	B_StartOtherRoutine	(Mod_7170_OUT_Mann_NW, "ATDEMON");

	B_GivePlayerXP	(300);

	B_LogEntry	(TOPIC_MOD_TELBOR_HAUSBESETZER, "So, die Belianer machen sich auf den Weg zu ihrer neuen Bleibe. Jetzt brauche ich nur noch Telbor bescheid zu geben, dass das Haus wieder frei ist.");
};

INSTANCE Info_Mod_Uriela_Verbatscht (C_INFO)
{
	npc		= Mod_7167_HEX_Uriela_NW;
	nr		= 1;
	condition	= Info_Mod_Uriela_Verbatscht_Condition;
	information	= Info_Mod_Uriela_Verbatscht_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Uriela_Verbatscht_Condition()
{
	if (Mod_UrielaCo_Weg == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Uriela_Verbatscht_Info()
{
	AI_Output(self, hero, "Info_Mod_Uriela_Verbatscht_17_00"); //Verdammt, Beliar soll dich dafür strafen du Schuft.

	AI_StopProcessInfos	(self);

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Uriela_Irdorath (C_INFO)
{
	npc		= Mod_7167_HEX_Uriela_NW;
	nr		= 1;
	condition	= Info_Mod_Uriela_Irdorath_Condition;
	information	= Info_Mod_Uriela_Irdorath_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Uriela_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Irdorath))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Uriela_Irdorath_Info()
{
	AI_Output(self, hero, "Info_Mod_Uriela_Irdorath_17_00"); //Schön dich mal wieder zu Gesicht zu bekommen. Wie ist es dir ergangen?
	AI_Output(self, hero, "Info_Mod_Uriela_Irdorath_17_01"); //Gibt es vielleicht irgendwelche nennenswerten Neuigkeiten?
	AI_Output(hero, self, "Info_Mod_Uriela_Irdorath_15_02"); //Naja, ich lebe noch und schickte manch garstiges Untier in das Reich Beliars.
	AI_Output(hero, self, "Info_Mod_Uriela_Irdorath_15_03"); //Mit Magie und auf Schusters Rappen besuchte ich viele Flecken der Insel, aber wo ich als nächstes hin muss, kann mich nur ein Schiff befördern.
	AI_Output(self, hero, "Info_Mod_Uriela_Irdorath_17_04"); //Tatsächlich, du planst eine Seereise?
	AI_Output(hero, self, "Info_Mod_Uriela_Irdorath_15_05"); //Ja, zu einer Insel, um den Lakaien des finsteren Xeres zu stellen ...
	AI_Output(self, hero, "Info_Mod_Uriela_Irdorath_17_06"); //Was?! Jenes abscheulichen Magiers, der für die Vernichtung meiner Siedlung verantwortlich ist, jener, der die Verbannung meines Herrn Beliar anstrebt?
	AI_Output(hero, self, "Info_Mod_Uriela_Irdorath_15_07"); //Genau dieser.
	AI_Output(self, hero, "Info_Mod_Uriela_Irdorath_17_08"); //Wenn es im Rahmen deiner Möglichkeiten liegt, so bitte ich darum, dich bei dieser Exkursion begleiten zu dürfen.
	AI_Output(self, hero, "Info_Mod_Uriela_Irdorath_17_09"); //Es wäre mir ein wichtiges Anliegen. Endlich die Genugtuung Rache an dem Frevler für seine Missetaten zu nehmen zu können ...
};

INSTANCE Info_Mod_Uriela_Irdorath2 (C_INFO)
{
	npc		= Mod_7167_HEX_Uriela_NW;
	nr		= 1;
	condition	= Info_Mod_Uriela_Irdorath2_Condition;
	information	= Info_Mod_Uriela_Irdorath2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dann freut es mich meinerseits, die Mannschaft um jemanden bereichern zu können, der sich auf Hexenmagie versteht.";
};

FUNC INT Info_Mod_Uriela_Irdorath2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Uriela_Irdorath))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Uriela_Irdorath2_Info()
{
	AI_Output(hero, self, "Info_Mod_Uriela_Irdorath2_15_00"); //Dann freut es mich meinerseits, die Mannschaft um jemanden bereichern zu können, der sich auf Hexenmagie versteht. Komm in die Stadt zum Hafen.
	AI_Output(self, hero, "Info_Mod_Uriela_Irdorath2_17_01"); //Das werde ich.

	B_LogEntry	(TOPIC_MOD_HQ_CREW, "Uriela sinnt auf Rache an Xeres und wird am Hafen warten.");

	B_GivePlayerXP	(100);

	Mod_UrielaDabei = 1;

	Mod_CrewCount += 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SCHIFF");
};

INSTANCE Info_Mod_Uriela_Irdorath3 (C_INFO)
{
	npc		= Mod_7167_HEX_Uriela_NW;
	nr		= 1;
	condition	= Info_Mod_Uriela_Irdorath3_Condition;
	information	= Info_Mod_Uriela_Irdorath3_Info;
	permanent	= 1;
	important	= 0;
	description	= "Tut mir leid, aber es scheint das wir zu viele sind.";
};

FUNC INT Info_Mod_Uriela_Irdorath3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Uriela_Irdorath2))
	&& (Mod_Irdorath == 0)
	&& (Mod_UrielaDabei == 1)
	&& (((Mod_JackDabei == 1)
	&& (Mod_CrewCount > 15))
	|| (Mod_CedricDabei == 1))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Uriela_Irdorath3_Info()
{
	AI_Output(hero, self, "Info_Mod_Uriela_Irdorath3_15_00"); //Tut mir leid, aber es scheint das wir zu viele sind. Ich kann dich doch nicht mitnehmen.
	AI_Output(self, hero, "Info_Mod_Uriela_Irdorath3_17_01"); //Schade. Ich gehe dann wieder zurück. Du weißt wo du mich findest, wenn doch noch ein Platz frei werden sollte.

	Mod_UrielaDabei = 0;

	Mod_CrewCount -= 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Uriela_Irdorath4 (C_INFO)
{
	npc		= Mod_7167_HEX_Uriela_NW;
	nr		= 1;
	condition	= Info_Mod_Uriela_Irdorath4_Condition;
	information	= Info_Mod_Uriela_Irdorath4_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich kann dich doch mitnehmen.";
};

FUNC INT Info_Mod_Uriela_Irdorath4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Uriela_Irdorath2))
	&& (Mod_Irdorath == 0)
	&& (Mod_UrielaDabei == 0)
	&& (Mod_CedricDabei == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Uriela_Irdorath4_Info()
{
	AI_Output(hero, self, "Info_Mod_Uriela_Irdorath4_15_00"); //Ich kann dich doch mitnehmen. Es hat sich noch ein Platz auf dem Schiff gefunden.
	AI_Output(self, hero, "Info_Mod_Uriela_Irdorath4_17_01"); //Sehr gut, ich bin dann wieder am Hafen.

	Mod_UrielaDabei = 1;

	Mod_CrewCount += 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SCHIFF");
};

INSTANCE Info_Mod_Uriela_EXIT (C_INFO)
{
	npc		= Mod_7167_HEX_Uriela_NW;
	nr		= 1;
	condition	= Info_Mod_Uriela_EXIT_Condition;
	information	= Info_Mod_Uriela_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Uriela_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Uriela_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};