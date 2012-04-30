INSTANCE Info_Mod_Gorn_Hi (C_INFO)
{
	npc		= Mod_533_SLD_Gorn_NW;
	nr		= 1;
	condition	= Info_Mod_Gorn_Hi_Condition;
	information	= Info_Mod_Gorn_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gorn_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gorn_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Gorn_Hi_12_00"); //Ich glaub’s ja nicht ... du?! Dich kann auch wirklich kein Monster oder Erzdämon erledigen ...
	AI_Output(hero, self, "Info_Mod_Gorn_Hi_15_01"); //Freut mich auch dich zu sehen.
	AI_Output(self, hero, "Info_Mod_Gorn_Hi_12_02"); //Mann ... da werden einige Erinnerungen wach. Was wir alles zusammen erlebt haben.
	AI_Output(self, hero, "Info_Mod_Gorn_Hi_12_03"); //Es ist, als wäre es erst gestern gewesen, wo wir die Gardisten mit einem Arschtritt aus unserer Mine vertrieben haben.
	AI_Output(hero, self, "Info_Mod_Gorn_Hi_15_04"); //Oder gemeinsam den fetten Troll in der Klosterfestung erledigt haben.
	AI_Output(self, hero, "Info_Mod_Gorn_Hi_12_05"); //Klar, wie könnte ich das fette Biest vergessen. Und schon wieder bist du zur rechten Zeit am rechten Ort.
	AI_Output(hero, self, "Info_Mod_Gorn_Hi_15_06"); //Wieso?
	AI_Output(self, hero, "Info_Mod_Gorn_Hi_12_07"); //Nun, ich hatte mir gerade vorgenommen die verfluchte Festung da oben einzunehmen. Viele Schätze soll es da zu holen geben, aber eben auch voller untoter Mistkerle.
	AI_Output(self, hero, "Info_Mod_Gorn_Hi_12_08"); //Hartes Stück Arbeit, dachte ich mir. Bis du gekommen bist. Mit dir sollte es ein Spaziergang werden.
};

INSTANCE Info_Mod_Gorn_GotoCastlemine (C_INFO)
{
	npc		= Mod_533_SLD_Gorn_NW;
	nr		= 1;
	condition	= Info_Mod_Gorn_GotoCastlemine_Condition;
	information	= Info_Mod_Gorn_GotoCastlemine_Info;
	permanent	= 0;
	important	= 0;
	description	= "Na dann lass uns den Untoten mal einen Besuch abzustatten.";
};

FUNC INT Info_Mod_Gorn_GotoCastlemine_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gorn_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorn_GotoCastlemine_Info()
{
	AI_Output(hero, self, "Info_Mod_Gorn_GotoCastlemine_15_00"); //Na dann lass uns den Untoten mal einen Besuch abzustatten.
	AI_Output(self, hero, "Info_Mod_Gorn_GotoCastlemine_12_01"); //Nichts anderes hatte ich von dir erwartet. Dann zeigen wir es diesen Bastarden mal.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "CASTLEMINE");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
};

INSTANCE Info_Mod_Gorn_AtCastlemine (C_INFO)
{
	npc		= Mod_533_SLD_Gorn_NW;
	nr		= 1;
	condition	= Info_Mod_Gorn_AtCastlemine_Condition;
	information	= Info_Mod_Gorn_AtCastlemine_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gorn_AtCastlemine_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gorn_GotoCastlemine))
	&& (Npc_GetDistToWP(hero, "NW_CASTLEMINE_HUT_10_B") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorn_AtCastlemine_Info()
{
	AI_Output(self, hero, "Info_Mod_Gorn_AtCastlemine_12_00"); //So, das war es also. Ein paar Goldmünzen sind zusammengekommen, aber doch nicht ganz so viel, wie ich erhofft hatte.
	AI_Output(self, hero, "Info_Mod_Gorn_AtCastlemine_12_01"); //Und die Mine scheint auch verschüttet zu sein. Zu holen gibt es hier auf jeden Fall nichts mehr.
	AI_Output(self, hero, "Info_Mod_Gorn_AtCastlemine_12_02"); //War aber trotzdem ein Riesenspaß mit dir mal wieder unterwegs zu sein ... und Grund genug mich mit den anderen Jungs zu treffen, um einige Dinge zu besprechen.
	AI_Output(self, hero, "Info_Mod_Gorn_AtCastlemine_12_03"); //Kannst du mir einen Gefallen tun?
	AI_Output(hero, self, "Info_Mod_Gorn_AtCastlemine_15_04"); //Klar, worum geht's?
	AI_Output(self, hero, "Info_Mod_Gorn_AtCastlemine_12_05"); //Sag Diego, Milten und Lester bescheid, dass wir uns in Taverne 'Zur Toten Harpie' treffen.
	AI_Output(self, hero, "Info_Mod_Gorn_AtCastlemine_12_06"); //Da du auch einer von uns geworden bist, kannst du natürlich auch kommen.
	AI_Output(self, hero, "Info_Mod_Gorn_AtCastlemine_12_07"); //Und solltest jemals Hilfe brauchen, kannst du zu uns kommen, dann werden wir versuchen, dir zu helfen.
	
	Log_CreateTopic	(TOPIC_MOD_TREFFEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_TREFFEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_TREFFEN, "Gorn bat mich Diego, Milten und Lester zu sagen, dass sie sich in der Taverne 'Zur Toten Harpie' treffen wollen");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");

	self.aivar[AIV_PARTYMEMBER] = FALSE;

	B_GivePlayerXP	(200);
};

INSTANCE Info_Mod_Gorn_Daemonisch (C_INFO)
{
	npc		= Mod_533_SLD_Gorn_NW;
	nr		= 1;
	condition	= Info_Mod_Gorn_Daemonisch_Condition;
	information	= Info_Mod_Gorn_Daemonisch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gorn_Daemonisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Milten_Daemonisch))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Daemonisch3))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorn_Daemonisch_Info()
{
	AI_Output(self, hero, "Info_Mod_Gorn_Daemonisch_12_00"); //Hey, wieder auf der Suche nach Abenteuern?
	AI_Output(hero, self, "Info_Mod_Gorn_Daemonisch_15_01"); //Nein, eigentlich wollte ich mich nur mal ein bisschen umhören, was es so in letzter Zeit an Außergewöhnlichem bei euch gab.
	AI_Output(self, hero, "Info_Mod_Gorn_Daemonisch_12_02"); //Ach, Pepe ist mit paar Söldner in den Wald gegangen um Wölfe zujagen und ist dann durchgedreht und abgehauen.
	AI_Output(self, hero, "Info_Mod_Gorn_Daemonisch_12_03"); //Lares kann dir mehr darüber erzählen. Jedenfalls fressen die Jungs aus dem Wald seit dem für drei.
	AI_Output(self, hero, "Info_Mod_Gorn_Daemonisch_12_04"); //Thekla kommt kaum mit dem Kochen nach und ist schon außer sich.
	AI_Output(hero, self, "Info_Mod_Gorn_Daemonisch_15_05"); //Dann gibt es bei euch ja immer Grund zur Unterhaltung. Nun denn, bis bald.
	AI_Output(self, hero, "Info_Mod_Gorn_Daemonisch_12_06"); //Mach's gut.

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Gorn berichtete mir, dass Lares Söldner zum Wölfejagen mit Pepe in den Wald geschickt hatte, wobei Pepe durchgedreht sei. Entsprechende Söldner sollen seit dem Thekla die Haare vom Kopf fressen.");
};

INSTANCE Info_Mod_Gorn_Irdorath (C_INFO)
{
	npc		= Mod_533_SLD_Gorn_NW;
	nr		= 1;
	condition	= Info_Mod_Gorn_Irdorath_Condition;
	information	= Info_Mod_Gorn_Irdorath_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich werde mit dem Schiff im Hafen zu einer Insel aufbrechen müssen (...)";
};

FUNC INT Info_Mod_Gorn_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Irdorath))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorn_Irdorath_Info()
{
	AI_Output(hero, self, "Info_Mod_Gorn_Irdorath_15_00"); //Ich werde mit dem Schiff im Hafen zu einer Insel aufbrechen müssen, um Xeres’ Vernichtung einen Schritt näher zu kommen.
	AI_Output(hero, self, "Info_Mod_Gorn_Irdorath_15_01"); //Fällt dir jemand ein, den ich für die Mannschaft rekrutieren könnte?
	AI_Output(self, hero, "Info_Mod_Gorn_Irdorath_12_02"); //Ein Trip zu einer Insel? Man, du bist immer für eine Überraschung gut ...
	AI_Output(self, hero, "Info_Mod_Gorn_Irdorath_12_03"); //Tja, der Orkjäger Cord wäre bestimmt dabei.
	AI_Output(self, hero, "Info_Mod_Gorn_Irdorath_12_04"); //Trainiert ja den ganzen Tag wie ein Verrückter und würde sich die Chance auf so ein Abenteuer bestimmt nicht entgehen lassen.
	AI_Output(self, hero, "Info_Mod_Gorn_Irdorath_12_05"); //Und dann vielleicht noch Bennet, da es bestimmt nicht schlecht wäre, einen Schmied mit an Bord zu haben, wenn man ein paar scharfe Klingen braucht.

	B_LogEntry	(TOPIC_MOD_HQ_CREW, "Gorn nannte mir Orkjäger Cord und Schmied Bennet als potentielle Begleiter.");
};

INSTANCE Info_Mod_Gorn_Irdorath2 (C_INFO)
{
	npc		= Mod_533_SLD_Gorn_NW;
	nr		= 1;
	condition	= Info_Mod_Gorn_Irdorath2_Condition;
	information	= Info_Mod_Gorn_Irdorath2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Und du wirst es dir bestimmt auch nicht nehmen lassen mitzukommen ...";
};

FUNC INT Info_Mod_Gorn_Irdorath2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gorn_Irdorath))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorn_Irdorath2_Info()
{
	AI_Output(hero, self, "Info_Mod_Gorn_Irdorath2_15_00"); //Und du wirst es dir bestimmt auch nicht nehmen lassen mitzukommen ...
	AI_Output(self, hero, "Info_Mod_Gorn_Irdorath2_12_01"); //Du sagst es. Bei einen abenteuerlichen Trip wie diesen sage ich bestimmt nicht nein ...
	AI_Output(hero, self, "Info_Mod_Gorn_Irdorath2_15_02"); //Dann freut es mich dich an Bord willkommen zu heißen.
	AI_Output(self, hero, "Info_Mod_Gorn_Irdorath2_12_03"); //Ich mach mich sofort auf den Weg zum Hafen.

	B_LogEntry	(TOPIC_MOD_HQ_CREW, "Ausgezeichnet, Gorn wird für mich die Axt schwingen, wenn wir zur Insel segeln.");

	B_GivePlayerXP	(150);

	Mod_GornDabei = 1;

	Mod_CrewCount += 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SCHIFF");
};

INSTANCE Info_Mod_Gorn_Irdorath3 (C_INFO)
{
	npc		= Mod_533_SLD_Gorn_NW;
	nr		= 1;
	condition	= Info_Mod_Gorn_Irdorath3_Condition;
	information	= Info_Mod_Gorn_Irdorath3_Info;
	permanent	= 1;
	important	= 0;
	description	= "Tut mir leid, aber es scheint das wir zu viele sind.";
};

FUNC INT Info_Mod_Gorn_Irdorath3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gorn_Irdorath2))
	&& (Mod_Irdorath == 0)
	&& (Mod_GornDabei == 1)
	&& (((Mod_JackDabei == 1)
	&& (Mod_CrewCount > 15))
	|| (Mod_CedricDabei == 1))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorn_Irdorath3_Info()
{
	AI_Output(hero, self, "Info_Mod_Gorn_Irdorath3_15_00"); //Tut mir leid, aber es scheint das wir zu viele sind. Ich kann dich doch nicht mitnehmen.
	AI_Output(self, hero, "Info_Mod_Gorn_Irdorath3_12_01"); //Schade. Ich gehe dann wieder zurück. Du weißt wo du mich findest, wenn doch noch ein Platz frei werden sollte.

	Mod_GornDabei = 0;

	Mod_CrewCount -= 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Gorn_Irdorath4 (C_INFO)
{
	npc		= Mod_533_SLD_Gorn_NW;
	nr		= 1;
	condition	= Info_Mod_Gorn_Irdorath4_Condition;
	information	= Info_Mod_Gorn_Irdorath4_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich kann dich doch mitnehmen.";
};

FUNC INT Info_Mod_Gorn_Irdorath4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gorn_Irdorath2))
	&& (Mod_Irdorath == 0)
	&& (Mod_GornDabei == 0)
	&& (Mod_CedricDabei == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorn_Irdorath4_Info()
{
	AI_Output(hero, self, "Info_Mod_Gorn_Irdorath4_15_00"); //Ich kann dich doch mitnehmen. Es hat sich noch ein Platz auf dem Schiff gefunden.
	AI_Output(self, hero, "Info_Mod_Gorn_Irdorath4_12_01"); //Sehr gut, ich bin dann wieder am Hafen.

	Mod_GornDabei = 1;

	Mod_CrewCount += 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SCHIFF");
};

INSTANCE Info_Mod_Gorn_Treffen (C_INFO)
{
	npc		= Mod_533_SLD_Gorn_NW;
	nr		= 1;
	condition	= Info_Mod_Gorn_Treffen_Condition;
	information	= Info_Mod_Gorn_Treffen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gorn_Treffen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Diego_Treffen))
	&& (Npc_KnowsInfo(hero, Info_Mod_Lester_Treffen))
	&& (Npc_KnowsInfo(hero, Info_Mod_Milten_Treffen))
	&& (Npc_KnowsInfo(hero, Info_Mod_Gorn_Hi))
	&& (Npc_GetDistToWP(self, "NW_TAVERNE_IN_RANGERMEETING_LARES") < 1000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorn_Treffen_Info()
{
	AI_Output(self, hero, "Info_Mod_Gorn_Treffen_12_00"); //Gut das du kommst, wir haben ein paar Infos für dich.
	AI_Output(hero, self, "Info_Mod_Gorn_Treffen_15_01"); //Erzähl.
	AI_Output(self, hero, "Info_Mod_Gorn_Treffen_12_02"); //Gut. Also Diego wird vorerst in Khorinis bleiben und den Wassermagiern helfen.
	AI_Output(self, hero, "Info_Mod_Gorn_Treffen_12_03"); //Lester wird wahrscheinlich bald zurück ins Minental gehen.
	AI_Output(self, hero, "Info_Mod_Gorn_Treffen_12_04"); //Milten bleibt im Kloster, um ein wenig Magie zu lernen, im Minental kann ihm schließlich keiner mehr was beibringen.
	AI_Output(self, hero, "Info_Mod_Gorn_Treffen_12_05"); //Ich werde zurück zu Lares und den anderen gehen.

	B_LogEntry	(TOPIC_MOD_TREFFEN, "Das Treffen ist vorbei und folgende Sachen haben sich ergeben: Diego bleibt in Khorinis, Lester geht wahrscheinlich bald zurück ins Minental, Milten bleibt im Kloster und Gorn geht zurück zu Lares auf Onars Hof.");

	B_GivePlayerXP	(400);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
	B_StartOtherRoutine	(Mod_534_KDF_Milten_NW, "START");
	B_StartOtherRoutine	(Mod_538_RDW_Diego_NW, "START");
	B_StartOtherRoutine	(Mod_557_PSINOV_Lester_NW, "START");

	AI_Teleport	(Mod_534_KDF_Milten_NW, "KLOSTER");

	B_SetTopicStatus	(TOPIC_MOD_TREFFEN, LOG_SUCCESS);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Gorn_Hexen_04 (C_INFO)
{
	npc		= Mod_533_SLD_Gorn_NW;
	nr		= 1;
	condition	= Info_Mod_Gorn_Hexen_04_Condition;
	information	= Info_Mod_Gorn_Hexen_04_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gorn_Hexen_04_Condition()
{
	if (Mod_WM_Boeden >= 14)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Gorn_Hexen))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Lares_Hexen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorn_Hexen_04_Info()
{
	AI_Output(self, hero, "Info_Mod_Gorn_Hexen_04_12_00"); //Ohh man, diese schrecklichen Ungetüme auf dem Plateau, da wagen wir uns lieber nicht heran.
	AI_Output(self, hero, "Info_Mod_Gorn_Hexen_04_12_01"); //Die Untoten auf Sekobs sind zwar auch nicht ohne, aber doch zu schaffen.
	AI_Output(self, hero, "Info_Mod_Gorn_Hexen_04_12_02"); //Lares zögert aber noch etwas, wartet auf den richtigen Augenblick zum Angriff ...
};

INSTANCE Info_Mod_Gorn_Hexen (C_INFO)
{
	npc		= Mod_533_SLD_Gorn_NW;
	nr		= 1;
	condition	= Info_Mod_Gorn_Hexen_Condition;
	information	= Info_Mod_Gorn_Hexen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gorn_Hexen_Condition()
{
	if (Mod_WM_HexenTot == 1)
	&& (!Npc_IsDead(DienerDesBoesen_01))
	&& (Mod_WM_GornAttack == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorn_Hexen_Info()
{
	AI_Output(self, hero, "Info_Mod_Gorn_Hexen_12_00"); //Hey, die Untoten bei Sekobs Hof haben sich zerstreut. Jetzt könnten wir sie aufmischen.
	AI_Output(self, hero, "Info_Mod_Gorn_Hexen_12_01"); //Wenn du mitmachst müsste unsere Schlagkraft ausreichen.
	
	Info_ClearChoices	(Info_Mod_Gorn_Hexen);

	Info_AddChoice	(Info_Mod_Gorn_Hexen, "Nein, ich habe gerade wichtigeres zu tun.", Info_Mod_Gorn_Hexen_B);
	Info_AddChoice	(Info_Mod_Gorn_Hexen, "Klar, ich bin dabei.", Info_Mod_Gorn_Hexen_A);
};

FUNC VOID Info_Mod_Gorn_Hexen_B()
{
	AI_Output(hero, self, "Info_Mod_Gorn_Hexen_B_15_00"); //Nein, ich habe gerade wichtigeres zu tun.
	AI_Output(self, hero, "Info_Mod_Gorn_Hexen_B_12_01"); //Hmm, schade, hätte ich nicht gedacht, dass du dir das entgehen lassen willst.
	AI_Output(self, hero, "Info_Mod_Gorn_Hexen_B_12_02"); //Dann müssen wir eben noch etwas mit dem Angriff warten, bis wir Verstärkung bekommen.

	Info_ClearChoices	(Info_Mod_Gorn_Hexen);
	
	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Gorn_Hexen_A()
{
	AI_Output(hero, self, "Info_Mod_Gorn_Hexen_A_15_00"); //Klar, ich bin dabei.
	AI_Output(self, hero, "Info_Mod_Gorn_Hexen_A_12_01"); //Sehr gut, ich habe auch nichts anderes von dir erwartet. Dann kann es ja losgehen.
	AI_Output(self, hero, "Info_Mod_Gorn_Hexen_A_12_02"); //Wir sammeln uns dann an der Kreuzung. Wie in alten Zeiten.

	Mod_WM_GornAttack = 1;

	Info_ClearChoices	(Info_Mod_Gorn_Hexen);
	
	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_798_SLD_Wolf_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_527_SLD_Torlof_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_526_SLD_Lares_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_528_SLD_Cord_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_533_SLD_Gorn_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_1200_SLD_Soeldner_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_1201_SLD_Soeldner_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_1202_SLD_Soeldner_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_1203_SLD_Soeldner_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_1204_SLD_Soeldner_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_1205_SLD_Soeldner_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_1206_SLD_Soeldner_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_1207_SLD_Soeldner_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_1208_SLD_Soeldner_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_1209_SLD_Soeldner_NW, "HEXEN");
};

INSTANCE Info_Mod_Gorn_Hexen_02 (C_INFO)
{
	npc		= Mod_533_SLD_Gorn_NW;
	nr		= 1;
	condition	= Info_Mod_Gorn_Hexen_02_Condition;
	information	= Info_Mod_Gorn_Hexen_02_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gorn_Hexen_02_Condition()
{
	if (Mod_WM_HexenTot == 1)
	&& (!Npc_IsDead(DienerDesBoesen_01))
	&& (Npc_GetDistToWP(self, "NW_BIGFARM_CROSS") < 500)
	&& (Mod_WM_GornAttack == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorn_Hexen_02_Info()
{
	AI_Output(self, hero, "Info_Mod_Gorn_Hexen_02_12_00"); //Auf geht’s, treten wir diesen Untoten in den Hintern.
	
	Mod_WM_GornAttack = 2;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_798_SLD_Wolf_NW, "DIENER");
	B_StartOtherRoutine	(Mod_527_SLD_Torlof_NW, "DIENER");
	B_StartOtherRoutine	(Mod_526_SLD_Lares_NW, "DIENER");
	B_StartOtherRoutine	(Mod_528_SLD_Cord_NW, "DIENER");
	B_StartOtherRoutine	(Mod_533_SLD_Gorn_NW, "DIENER");
	B_StartOtherRoutine	(Mod_1200_SLD_Soeldner_NW, "DIENER");
	B_StartOtherRoutine	(Mod_1201_SLD_Soeldner_NW, "DIENER");
	B_StartOtherRoutine	(Mod_1202_SLD_Soeldner_NW, "DIENER");
	B_StartOtherRoutine	(Mod_1203_SLD_Soeldner_NW, "DIENER");
	B_StartOtherRoutine	(Mod_1204_SLD_Soeldner_NW, "DIENER");
	B_StartOtherRoutine	(Mod_1205_SLD_Soeldner_NW, "DIENER");
	B_StartOtherRoutine	(Mod_1206_SLD_Soeldner_NW, "DIENER");
	B_StartOtherRoutine	(Mod_1207_SLD_Soeldner_NW, "DIENER");
	B_StartOtherRoutine	(Mod_1208_SLD_Soeldner_NW, "DIENER");
	B_StartOtherRoutine	(Mod_1209_SLD_Soeldner_NW, "DIENER");

	Mod_798_SLD_Wolf_NW.aivar[AIV_Partymember] = TRUE;
	Mod_527_SLD_Torlof_NW.aivar[AIV_Partymember] = TRUE;
	Mod_526_SLD_Lares_NW.aivar[AIV_Partymember] = TRUE;
	Mod_528_SLD_Cord_NW.aivar[AIV_Partymember] = TRUE;
	Mod_533_SLD_Gorn_NW.aivar[AIV_Partymember] = TRUE;
	Mod_1200_SLD_Soeldner_NW.aivar[AIV_Partymember] = TRUE;
	Mod_1201_SLD_Soeldner_NW.aivar[AIV_Partymember] = TRUE;
	Mod_1202_SLD_Soeldner_NW.aivar[AIV_Partymember] = TRUE;
	Mod_1203_SLD_Soeldner_NW.aivar[AIV_Partymember] = TRUE;
	Mod_1204_SLD_Soeldner_NW.aivar[AIV_Partymember] = TRUE;
	Mod_1205_SLD_Soeldner_NW.aivar[AIV_Partymember] = TRUE;
	Mod_1206_SLD_Soeldner_NW.aivar[AIV_Partymember] = TRUE;
	Mod_1207_SLD_Soeldner_NW.aivar[AIV_Partymember] = TRUE;
	Mod_1208_SLD_Soeldner_NW.aivar[AIV_Partymember] = TRUE;
	Mod_1209_SLD_Soeldner_NW.aivar[AIV_Partymember] = TRUE;
};

INSTANCE Info_Mod_Gorn_Hexen_03 (C_INFO)
{
	npc		= Mod_533_SLD_Gorn_NW;
	nr		= 1;
	condition	= Info_Mod_Gorn_Hexen_03_Condition;
	information	= Info_Mod_Gorn_Hexen_03_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gorn_Hexen_03_Condition()
{
	if (Mod_WM_HexenTot == 1)
	&& (Npc_IsDead(DienerDesBoesen_01))
	&& (Npc_GetDistToWP(self, "NW_FARM4_WOOD_MONSTER_MORE_03") < 500)
	&& (Mod_WM_GornAttack == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorn_Hexen_03_Info()
{
	AI_Output(self, hero, "Info_Mod_Gorn_Hexen_03_12_00"); //Na also, denen haben wir es gezeigt. War mir ein Vergnügen mal wieder an deiner Seite gekämpft zu haben.

	B_GivePlayerXP	(200);
	
	Mod_WM_GornAttack = 3;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_798_SLD_Wolf_NW, "START");
	B_StartOtherRoutine	(Mod_527_SLD_Torlof_NW, "PRESTART");
	B_StartOtherRoutine	(Mod_526_SLD_Lares_NW, "START");
	B_StartOtherRoutine	(Mod_528_SLD_Cord_NW, "START");
	B_StartOtherRoutine	(Mod_533_SLD_Gorn_NW, "START");
	B_StartOtherRoutine	(Mod_1200_SLD_Soeldner_NW, "START");
	B_StartOtherRoutine	(Mod_1201_SLD_Soeldner_NW, "START");
	B_StartOtherRoutine	(Mod_1202_SLD_Soeldner_NW, "START");
	B_StartOtherRoutine	(Mod_1203_SLD_Soeldner_NW, "START");
	B_StartOtherRoutine	(Mod_1204_SLD_Soeldner_NW, "START");
	B_StartOtherRoutine	(Mod_1205_SLD_Soeldner_NW, "START");
	B_StartOtherRoutine	(Mod_1206_SLD_Soeldner_NW, "START");
	B_StartOtherRoutine	(Mod_1207_SLD_Soeldner_NW, "START");
	B_StartOtherRoutine	(Mod_1208_SLD_Soeldner_NW, "START");
	B_StartOtherRoutine	(Mod_1209_SLD_Soeldner_NW, "START");

	Mod_798_SLD_Wolf_NW.aivar[AIV_Partymember] = FALSE;
	Mod_527_SLD_Torlof_NW.aivar[AIV_Partymember] = FALSE;
	Mod_526_SLD_Lares_NW.aivar[AIV_Partymember] = FALSE;
	Mod_528_SLD_Cord_NW.aivar[AIV_Partymember] = FALSE;
	Mod_533_SLD_Gorn_NW.aivar[AIV_Partymember] = FALSE;
	Mod_1200_SLD_Soeldner_NW.aivar[AIV_Partymember] = FALSE;
	Mod_1201_SLD_Soeldner_NW.aivar[AIV_Partymember] = FALSE;
	Mod_1202_SLD_Soeldner_NW.aivar[AIV_Partymember] = FALSE;
	Mod_1203_SLD_Soeldner_NW.aivar[AIV_Partymember] = FALSE;
	Mod_1204_SLD_Soeldner_NW.aivar[AIV_Partymember] = FALSE;
	Mod_1205_SLD_Soeldner_NW.aivar[AIV_Partymember] = FALSE;
	Mod_1206_SLD_Soeldner_NW.aivar[AIV_Partymember] = FALSE;
	Mod_1207_SLD_Soeldner_NW.aivar[AIV_Partymember] = FALSE;
	Mod_1208_SLD_Soeldner_NW.aivar[AIV_Partymember] = FALSE;
	Mod_1209_SLD_Soeldner_NW.aivar[AIV_Partymember] = FALSE;
};

INSTANCE Info_Mod_Gorn_BalrogGigantTot (C_INFO)
{
	npc		= Mod_533_SLD_Gorn_NW;
	nr		= 1;
	condition	= Info_Mod_Gorn_BalrogGigantTot_Condition;
	information	= Info_Mod_Gorn_BalrogGigantTot_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gorn_BalrogGigantTot_Condition()
{
	if (Mod_WM_CronosAttack == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorn_BalrogGigantTot_Info()
{
	AI_Output(self, hero, "Info_Mod_Gorn_BalrogGigantTot_12_00"); //Hey, ich habe gehört, die Monster und Riesen auf dem Plateau sind weg ... und irgendwie glaube ich, dass du nicht ganz unbeteiligt daran warst.
	AI_Output(self, hero, "Info_Mod_Gorn_BalrogGigantTot_12_01"); //Tolle Leistung. Ich wäre gerne mit von der Party gewesen, als du diesen Ungetümen den Hintern versohlt hast.
};

INSTANCE Info_Mod_Gorn_Drachen (C_INFO)
{
	npc		= Mod_533_SLD_Gorn_NW;
	nr		= 1;
	condition	= Info_Mod_Gorn_Drachen_Condition;
	information	= Info_Mod_Gorn_Drachen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gorn_Drachen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Drachen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorn_Drachen_Info()
{
	AI_Output(self, hero, "Info_Mod_Gorn_Drachen_12_00"); //Man, ohh man. Da glaubt man im Minental allen Herausforderungen getrotzt zu haben, die es auf der Welt gibt und dann stehen diese Riesenechsen vor der Tür.
	AI_Output(hero, self, "Info_Mod_Gorn_Drachen_15_01"); //Nun, ohne neue Herausforderungen würde doch alles eintönig und sinnlos.
	AI_Output(self, hero, "Info_Mod_Gorn_Drachen_12_02"); //Wie immer unerschütterlich vor jeder noch so großen Aufgabe. Ja, da hast du wohl Recht.
	AI_Output(self, hero, "Info_Mod_Gorn_Drachen_12_03"); //Und ich bin mir auch sicher, dass sich wieder eine Gelegenheit finden wird gemeinsam ein Abenteuer zu bestreiten. Pass auf dich auf.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Gorn_Knucker (C_INFO)
{
	npc		= Mod_533_SLD_Gorn_NW;
	nr		= 1;
	condition	= Info_Mod_Gorn_Knucker_Condition;
	information	= Info_Mod_Gorn_Knucker_Info;
	permanent	= 0;
	important	= 0;
	description	= "Na, du warst nicht mit von der Party?";
};

FUNC INT Info_Mod_Gorn_Knucker_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lares_KnuckerTot))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorn_Knucker_Info()
{
	AI_Output(hero, self, "Info_Mod_Gorn_Knucker_15_00"); //Na, du warst nicht mit von der Party? Es ist doch sonst nicht deine Art, dich vor einem Schlagabtausch zu drücken.
	AI_Output(self, hero, "Info_Mod_Gorn_Knucker_12_01"); //Ach, du hast gut reden. Ich und Cord wurden dazu verdonnert am Rande des Waldes Wache zu schieben, seit dem einige Schafe draufgegangen sind und zwei Bauern verschwanden.
	AI_Output(hero, self, "Info_Mod_Gorn_Knucker_15_02"); //Tote Schafe, verschwundene Bauern? Klingt für mich, als müsstest du dir hier wegen junger Wölfe und fortgelaufener Bauern die Beine in den Bauch stehen.
	AI_Output(self, hero, "Info_Mod_Gorn_Knucker_12_03"); //Ja, wenn Wölfe dazu in der Lage sind den Schafen ihr Blut, bis auf den letzten Tropfen auszusaugen, dann schon.
	AI_Output(self, hero, "Info_Mod_Gorn_Knucker_12_04"); //Genauso wie die Bauern, die Nachts wie in Trance in den Wald gingen und verschwanden ...
	AI_Output(hero, self, "Info_Mod_Gorn_Knucker_15_05"); //Hmm, das hört sich natürlich schon etwas mysteriöser an. Wäre das nicht mal wieder eine Gelegenheit für ein Abenteuer, was wir zusammen bestreiten könnten?
	AI_Output(self, hero, "Info_Mod_Gorn_Knucker_12_06"); //Du meinst in den Wald gehen und nachsehen? Ich weiß nicht. Immerhin müsste ich meinen Posten dafür verlassen ...
	AI_Output(hero, self, "Info_Mod_Gorn_Knucker_15_07"); //Ach komm, wegen der fünf Minuten, die wir den Wald erkunden ...
	AI_Output(self, hero, "Info_Mod_Gorn_Knucker_12_08"); //Und wenn irgendwelche der dämonischen Viecher, die sich hier zurzeit herumtreiben während dessen angreifen? Nein, so geht das wirklich nicht.
	AI_Output(self, hero, "Info_Mod_Gorn_Knucker_12_09"); //(überlegt) Hmm, aber ab nächsten Abend werde ich abgelöst. Dann können wir loslegen und den Wald unsicher machen.
	AI_Output(hero, self, "Info_Mod_Gorn_Knucker_15_10"); //Ok, ich werde dich dann abholen. Dann wirst du dich dann hoffentlich nicht mehr drücken.
	AI_Output(self, hero, "Info_Mod_Gorn_Knucker_12_11"); //Worauf du dich verlassen kannst.

	Log_CreateTopic	(TOPIC_MOD_NL_GORN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_NL_GORN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_NL_GORN, "Gorn wurde zum Wachehalten vorm Wald verdammt, da Schafe das Leben verloren, Bauern dort verschwanden. Abends will ich mit ihm erkunden, was dort vor sich geht.");
};

INSTANCE Info_Mod_Gorn_WaldSpaziergang (C_INFO)
{
	npc		= Mod_533_SLD_Gorn_NW;
	nr		= 1;
	condition	= Info_Mod_Gorn_WaldSpaziergang_Condition;
	information	= Info_Mod_Gorn_WaldSpaziergang_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gorn_WaldSpaziergang_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gorn_Knucker))
	&& (Wld_IsTime(20,00,04,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorn_WaldSpaziergang_Info()
{
	AI_Output(self, hero, "Info_Mod_Gorn_WaldSpaziergang_12_00"); //Da bist du ja. Wollen wir dann mal losziehen?
	AI_Output(hero, self, "Info_Mod_Gorn_WaldSpaziergang_15_01"); //Ja, lass uns nicht noch mehr Zeit vergeuden.
	AI_Output(self, hero, "Info_Mod_Gorn_WaldSpaziergang_12_02"); //Na dann, folge mir.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_527_SLD_Torlof_NW, "DRAGON");
	B_StartOtherRoutine	(self, "WALDTOUR");

	self.aivar[AIV_PARTYMEMBER] = TRUE;

	Wld_InsertNpc	(Warg, "NW_CRYPT_MONSTER07");
	Wld_InsertNpc	(Warg, "NW_CRYPT_MONSTER07");
	Wld_InsertNpc	(Warg, "NW_CRYPT_MONSTER07");
};

INSTANCE Info_Mod_Gorn_NichtsLosImWald (C_INFO)
{
	npc		= Mod_533_SLD_Gorn_NW;
	nr		= 1;
	condition	= Info_Mod_Gorn_NichtsLosImWald_Condition;
	information	= Info_Mod_Gorn_NichtsLosImWald_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gorn_NichtsLosImWald_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gorn_WaldSpaziergang))
	&& (Npc_GetDistToWP(hero, "NW_CRYPT_MONSTER07") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorn_NichtsLosImWald_Info()
{
	AI_Output(self, hero, "Info_Mod_Gorn_NichtsLosImWald_12_00"); //Na, besonders viel war hier noch nicht los, außer den paar Viechern.
	AI_Output(self, hero, "Info_Mod_Gorn_NichtsLosImWald_12_01"); //Wir sollten mal bei der Krypta vorbeischauen.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "VORKRYPTA");

	Wld_InsertNpc	(Zombie_Hel_01, "NW_CRYPT_01");
	Wld_InsertNpc	(Zombie_Hel_02, "NW_CRYPT_01");
	Wld_InsertNpc	(Zombie_Hel_03, "NW_CRYPT_01");
	Wld_InsertNpc	(Zombie_Hel_04, "NW_CRYPT_01");
	Wld_InsertNpc	(Zombie_Hel_05, "NW_CRYPT_01");
	Wld_InsertNpc	(Zombie_Hel_06, "NW_CRYPT_01");
	Wld_InsertNpc	(Zombie_Hel_07, "NW_CRYPT_01");
	Wld_InsertNpc	(Zombie_Hel_08, "NW_CRYPT_01");
	Wld_InsertNpc	(Zombie_Hel_09, "NW_CRYPT_01");
	Wld_InsertNpc	(Zombie_Hel_10, "NW_CRYPT_01");
};

INSTANCE Info_Mod_Gorn_VorKrypta (C_INFO)
{
	npc		= Mod_533_SLD_Gorn_NW;
	nr		= 1;
	condition	= Info_Mod_Gorn_VorKrypta_Condition;
	information	= Info_Mod_Gorn_VorKrypta_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gorn_VorKrypta_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gorn_NichtsLosImWald))
	&& (Npc_GetDistToWP(hero, "NW_CRYPT_MONSTER01") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorn_VorKrypta_Info()
{
	AI_Output(self, hero, "Info_Mod_Gorn_VorKrypta_12_00"); //Meine Fresse, siehst du auch diese ganzen Untoten auf dem Friedhof der Krypta? Vielleicht haben die ja was mit dem Verschwinden der Bauern zu tun.
	AI_Output(self, hero, "Info_Mod_Gorn_VorKrypta_12_01"); //Na dann los, lass uns die aufmischen.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "BEIKRYPTA");
};

INSTANCE Info_Mod_Gorn_Hel (C_INFO)
{
	npc		= Mod_533_SLD_Gorn_NW;
	nr		= 1;
	condition	= Info_Mod_Gorn_Hel_Condition;
	information	= Info_Mod_Gorn_Hel_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gorn_Hel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hel_GhuleFutsch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorn_Hel_Info()
{
	AI_Output(self, hero, "Info_Mod_Gorn_Hel_12_00"); //Verdammt, wo ist sie hin?
	AI_Output(hero, self, "Info_Mod_Gorn_Hel_15_01"); //Vielleicht hat sie sich in der Krypta verkrochen. Lass und runtergehen.
	AI_Output(self, hero, "DEFAULT"); //

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "KRYPTA");
};

INSTANCE Info_Mod_Gorn_WaldFertig (C_INFO)
{
	npc		= Mod_533_SLD_Gorn_NW;
	nr		= 1;
	condition	= Info_Mod_Gorn_WaldFertig_Condition;
	information	= Info_Mod_Gorn_WaldFertig_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gorn_WaldFertig_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hel_InKrypta))
	&& (Npc_IsDead(Mod_7299_OUT_Hel_NW))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorn_WaldFertig_Info()
{
	AI_Output(self, hero, "Info_Mod_Gorn_WaldFertig_12_00"); //(außer Atem) Boah, die war vielleicht ein hartes Biest. Gegen die ist sogar Thekla sanft wie ein Lamm.
	AI_Output(self, hero, "Info_Mod_Gorn_WaldFertig_12_01"); //Naja, so schnell werde ich nicht mehr über die Kampfeskünste von Frauen lachen.
	AI_Output(hero, self, "Info_Mod_Gorn_WaldFertig_15_02"); //Nun, auf jeden Fall dürften wir in dieser Blut dürstenden Dämonin die Ursache für die Vorkommnisse gefunden haben.
	AI_Output(self, hero, "Info_Mod_Gorn_WaldFertig_12_03"); //Und ich kann nun endlich wieder anderen Dingen nachgehen, als den ganzen Tag untätig vor der Kapelle herumzustehen. Hey, ich bin dir was schuldig.
	AI_Output(hero, self, "Info_Mod_Gorn_WaldFertig_15_04"); //Ach, lass gut sein. (vergnügt) Mal wieder ein Abenteuer mit dir zu bestreiten und einigen Dämonen und Untoten in den Hintern treten zu können war mir Lohn genug.
	AI_Output(self, hero, "Info_Mod_Gorn_WaldFertig_12_05"); //Na dann, bis zum nächsten Mal. Pass auf dich auf.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
	B_StartOtherRoutine	(Mod_527_SLD_Torlof_NW, "PRESTART");

	self.aivar[AIV_PARTYMEMBER] = FALSE;

	B_GivePlayerXP	(500);
};

INSTANCE Info_Mod_Gorn_ZweihandAlsEinhand (C_INFO)
{
	npc		= Mod_533_SLD_Gorn_NW;
	nr		= 1;
	condition	= Info_Mod_Gorn_ZweihandAlsEinhand_Condition;
	information	= Info_Mod_Gorn_ZweihandAlsEinhand_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gorn_ZweihandAlsEinhand_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gorn_Hi))
	&& (hero.attribute[ATR_STRENGTH] >= 120)
	&& (hero.hitChance[NPC_TALENT_1H] >= 50)
	&& (hero.hitChance[NPC_TALENT_2H] >= 50)
	&& ((Mod_Gilde == 2)
	|| (Mod_Gilde == 3)
	|| (Mod_Gilde == 5)
	|| (Mod_Gilde == 19)
	|| (Mod_Gilde == 15)
	|| (Mod_Gilde == 16)
	|| (Mod_Gilde == 17)
	|| (Mod_Gilde == 18))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorn_ZweihandAlsEinhand_Info()
{
	AI_Output(self, hero, "Info_Mod_Gorn_ZweihandAlsEinhand_12_00"); //Wie ich sehe, benutzt du Zweihänder immer noch mit beiden Händen, Kumpel.
	AI_Output(hero, self, "Info_Mod_Gorn_ZweihandAlsEinhand_15_01"); //Ja. Was ist daran falsch?
	AI_Output(self, hero, "Info_Mod_Gorn_ZweihandAlsEinhand_12_02"); //Für einen normalen Krieger ist es unmöglich, aber so starke Kerle wie du und ich können Zweihänder wie Einhänder führen.
	AI_Output(self, hero, "Info_Mod_Gorn_ZweihandAlsEinhand_12_03"); //Wenn du Lust und Zeit hast, zeig ich dir, wie's geht.
};

INSTANCE Info_Mod_Gorn_ZweihandAlsEinhand2 (C_INFO)
{
	npc		= Mod_533_SLD_Gorn_NW;
	nr		= 1;
	condition	= Info_Mod_Gorn_ZweihandAlsEinhand2_Condition;
	information	= Info_Mod_Gorn_ZweihandAlsEinhand2_Info;
	permanent	= 1;
	important	= 0;
};

FUNC INT Info_Mod_Gorn_ZweihandAlsEinhand2_Condition()
{
	if (Mod_Schwierigkeit == 4)
	{
		Info_Mod_Gorn_ZweihandAlsEinhand2.description = "Zeig mir, wie ich Zweihänder als Einhänder benutzen kann. (500 Gold)";
	}
	else
	{
		Info_Mod_Gorn_ZweihandAlsEinhand2.description = "Zeig mir, wie ich Zweihänder als Einhänder benutzen kann. (5 LP)";
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Gorn_ZweihandAlsEinhand))
	&& (ZweihandAlsEinhand_Perk == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorn_ZweihandAlsEinhand2_Info()
{
	AI_Output(hero, self, "Info_Mod_Gorn_ZweihandAlsEinhand2_15_00"); //Zeig mir, wie ich Zweihänder als Einhänder benutzen kann.

	if ((Mod_Schwierigkeit == 4)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 500))
	|| ((Mod_Schwierigkeit != 4)
	&& (hero.lp >= 5))
	{
		AI_Output(self, hero, "Info_Mod_Gorn_ZweihandAlsEinhand2_12_01"); //Das Wichtigste ist, dass das Gefühl von Einhändern und Zweihändern unterschiedlich ist.
		AI_Output(self, hero, "Info_Mod_Gorn_ZweihandAlsEinhand2_12_02"); //Der Schwerpunkt der Waffe ist bei Zweihändern weiter von deinem Körper entfernt.
		AI_Output(self, hero, "Info_Mod_Gorn_ZweihandAlsEinhand2_12_03"); //Deswegen solltest du darauf aufpassen, den Arm nie vollständig durchzustrecken, denn dann wird das Gewicht der Waffe zu groß.
		AI_Output(self, hero, "Info_Mod_Gorn_ZweihandAlsEinhand2_12_04"); //Winkle den Arm leicht an, und du solltest keine Probleme haben.
		AI_Output(self, hero, "Info_Mod_Gorn_ZweihandAlsEinhand2_12_05"); //Worauf wartest du noch? Ich will dich üben sehen!

		ZweihandAlsEinhand_Perk = TRUE;

		if (hero.HitChance[NPC_TALENT_1H] >= 60)
		{
			Mdl_ApplyOverlayMds	(hero, "HUMANS_1H2HST2.MDS");
		}
		else if (hero.HitChance[NPC_TALENT_1H] >= 30)
		{
			Mdl_ApplyOverlayMds	(hero, "HUMANS_1H2HST1.MDS");
		};

		if (Mod_Schwierigkeit == 4)
		{
			Npc_RemoveInvItems	(hero, ItMi_Gold, 500);
		}
		else
		{
			hero.lp -= 5;
		};
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Gorn_ZweihandAlsEinhand2_12_06"); //Komm wieder, wenn du bereit bist.
	};
};

INSTANCE Info_Mod_Gorn_Standfest (C_INFO)
{
	npc		= Mod_533_SLD_Gorn_NW;
	nr		= 1;
	condition	= Info_Mod_Gorn_Standfest_Condition;
	information	= Info_Mod_Gorn_Standfest_Info;
	permanent	= 0;
	important	= 0;
	description	= "Weißt du, wie ich verhindern kann, dass bestimmte Gegner mich durch die Luft werfen?";
};

FUNC INT Info_Mod_Gorn_Standfest_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gorn_Hi))
	&& (hero.attribute[ATR_STRENGTH] >= 60)
	&& (hero.attribute[ATR_DEXTERITY] >= 60)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorn_Standfest_Info()
{
	AI_Output(hero, self, "Info_Mod_Gorn_Standfest_15_00"); //Weißt du, wie ich verhindern kann, dass bestimmte Gegner mich durch die Luft werfen?
	AI_Output(self, hero, "Info_Mod_Gorn_Standfest_12_01"); //Da gibt es schon einen Weg. Hast du etwas Zeit?
};

INSTANCE Info_Mod_Gorn_Standfest2 (C_INFO)
{
	npc		= Mod_533_SLD_Gorn_NW;
	nr		= 1;
	condition	= Info_Mod_Gorn_Standfest2_Condition;
	information	= Info_Mod_Gorn_Standfest2_Info;
	permanent	= 1;
	important	= 0;
};

FUNC INT Info_Mod_Gorn_Standfest2_Condition()
{
	if (Mod_Schwierigkeit == 4)
	{
		Info_Mod_Gorn_Standfest2.description = "Wie kann ich standfester werden? (500 Gold)";
	}
	else
	{
		Info_Mod_Gorn_Standfest2.description = "Wie kann ich standfester werden? (5 LP)";
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Gorn_Standfest))
	&& (Standfest_Perk == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorn_Standfest2_Info()
{
	AI_Output(hero, self, "Info_Mod_Gorn_Standfest2_15_00"); //Wie kann ich standfester werden?

	if ((Mod_Schwierigkeit == 4)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 500))
	|| ((Mod_Schwierigkeit != 4)
	&& (hero.lp >= 5))
	{
		AI_Output(self, hero, "Info_Mod_Gorn_Standfest2_12_01"); //Am Ende zählt nur die richtige Mischung aus Stärke und Geschicklichkeit.
		AI_Output(self, hero, "Info_Mod_Gorn_Standfest2_12_02"); //Wenn du siehst, dass einer der Gegner zu einem mächtigen Schlag ausholt, bereitest du dich vor.
		AI_Output(self, hero, "Info_Mod_Gorn_Standfest2_12_03"); //Kurz bevor er dich erwischt, machst du dich klein und verlegst deinen Körperschwerpunkt Richtung Boden.
		AI_Output(self, hero, "Info_Mod_Gorn_Standfest2_12_04"); //Wenn du dann noch deine gesamte Kraft gegen den Schlag stellst, wird er zwar immer noch schmerzhaft, aber du segelst nicht mehrere Meter durch die Luft.
		AI_Output(hero, self, "Info_Mod_Gorn_Standfest2_15_05"); //Ich denke, ich hab's verstanden. Danke.
		AI_Output(self, hero, "Info_Mod_Gorn_Standfest2_12_06"); //Gern geschehen.

		Standfest_Perk = TRUE;

		if (Mod_Schwierigkeit == 4)
		{
			Npc_RemoveInvItems	(hero, ItMi_Gold, 500);
		}
		else
		{
			hero.lp -= 5;
		};
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Gorn_Standfest2_12_07"); //Komm wieder, wenn du bereit bist.
	};
};

INSTANCE Info_Mod_Gorn_Hilfe (C_INFO)
{
	npc		= Mod_533_SLD_Gorn_NW;
	nr		= 1;
	condition	= Info_Mod_Gorn_Hilfe_Condition;
	information	= Info_Mod_Gorn_Hilfe_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich brauche deine Hilfe";
};

FUNC INT Info_Mod_Gorn_Hilfe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gorn_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorn_Hilfe_Info()
{
	AI_Output(hero, self, "Info_Mod_Gorn_Hilfe_15_00"); //Ich brauche deine Hilfe.
	AI_Output(self, hero, "Info_Mod_Gorn_Hilfe_12_01"); //Wobei?

	Info_ClearChoices	(Info_Mod_Gorn_Hilfe);

	Info_AddChoice	(Info_Mod_Gorn_Hilfe, DIALOG_BACK, Info_Mod_Gorn_Hilfe_BACK);

	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_Lehrling))
	&& (Mod_MinecrawlerEi >= 0)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Constantino_Stimme))
	{
		Info_AddChoice	(Info_Mod_Gorn_Hilfe, "Weißt du, woher ich starkes Minecrawler-Sekret bekomme?", Info_Mod_Gorn_Hilfe_MinecrawlerSekret);
	};
	if (Npc_KnowsInfo(hero, Info_Mod_Torlof_NeueAufgabe))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Alvares_Knast))
	{
		Info_AddChoice	(Info_Mod_Gorn_Hilfe, "Ich soll einen Söldneranwärter finden.", Info_Mod_Gorn_Hilfe_Alvares);
	};
	if (Npc_KnowsInfo(hero, Info_Mod_Torlof_Auftrag))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Torlof_Kristall))
	{
		Info_AddChoice	(Info_Mod_Gorn_Hilfe, "Ich muss irgendetwas in der Stadt finden, womit sich die Paladine erpressen lassen.", Info_Mod_Gorn_Hilfe_Kristall);
	};
};

FUNC VOID Info_Mod_Gorn_Hilfe_BACK()
{
	Info_ClearChoices	(Info_Mod_Gorn_Hilfe);
};

FUNC VOID Info_Mod_Gorn_Hilfe_Kristall()
{
	AI_Output(hero, self, "Info_Mod_Gorn_Hilfe_Kristall_15_00"); //Ich muss irgendetwas in der Stadt finden, womit sich die Paladine erpressen lassen. Informationen, Artefakte ... was auch immer.
	AI_Output(self, hero, "Info_Mod_Gorn_Hilfe_Kristall_12_01"); //Hmm, lass mich überlegen. Viel fällt mir auf die Schnelle auch nicht ein ... aber warte mal.
	AI_Output(self, hero, "Info_Mod_Gorn_Hilfe_Kristall_12_02"); //Ich habe mal Lee über einen Paladin sprechen hören, den er von früher kannte. Der fette Lothar im oberen Viertel soll ein ziemlicher Schluckspecht sein.
	AI_Output(self, hero, "Info_Mod_Gorn_Hilfe_Kristall_12_03"); //Er bläst sich gerne auf, nimmt es jedoch mit der Disziplin nicht so eng ...
	AI_Output(self, hero, "Info_Mod_Gorn_Hilfe_Kristall_12_04"); //Bei ihm könntest du vielleicht etwas erfahren.

	B_LogEntry	(TOPIC_MOD_TORLOFSPIONAGE, "Von Gorn konnte ich erfahren, dass Paladin Lothar im oberen Viertel eine schwäche für Alkohol und eine große Klappe hat.");
};

FUNC VOID Info_Mod_Gorn_Hilfe_MinecrawlerSekret()
{
	AI_Output(hero, self, "Info_Mod_Gorn_Hilfe_MinecrawlerSekret_15_00"); //Weißt du, woher ich starkes Minecrawler-Sekret bekomme?
	AI_Output(self, hero, "Info_Mod_Gorn_Hilfe_MinecrawlerSekret_12_01"); //Lester hat mir mal erzählt, dass in den Eiern der Minecrawler ein stärkeres Sekret ist als in den Zangen.
	AI_Output(self, hero, "Info_Mod_Gorn_Hilfe_MinecrawlerSekret_12_02"); //Ich hatte zwei Minecrawlereier aus der Freien Mine, als wir sie zusammen von den Gardisten befreit haben, aber ich hab sie Milten gegeben.
	AI_Output(self, hero, "Info_Mod_Gorn_Hilfe_MinecrawlerSekret_12_03"); //Ich konnte mit den Eiern nichts anfangen, aber er als Magier kann sie sicher gebrauchen. Geh mal zu ihm und frag ihn, vielleicht hat er sie ja noch.

	Mod_MinecrawlerEi = 2;
	
	B_LogEntry	(TOPIC_MOD_CONSTANTINOSZUTATEN, "Starkes Minecrawler-Sekret bekomme ich aus einem Minecrawlerei. Gorn sagte mir, dass er Milten zwei Minecrawlereier gegeben hat.");
};

FUNC VOID Info_Mod_Gorn_Hilfe_Alvares()
{
	AI_Output(hero, self, "Info_Mod_Gorn_Hilfe_Alvares_15_00"); //Ich soll einen Söldneranwärter finden.
	AI_Output(self, hero, "Info_Mod_Gorn_Hilfe_Alvares_12_01"); //Einen Söldneranwärter ... hmm, auf den Bauernhöfen wird es wohl kaum einen qualifizierten Kämpfer geben.
	AI_Output(self, hero, "Info_Mod_Gorn_Hilfe_Alvares_12_02"); //Am ehesten wirst du in der Stadt jemanden finden, vielleicht Leute, die gerade nicht so gut auf die Stadtwachen und Paladine zu sprechen sind, wenn du verstehst, was ich meine.
};

INSTANCE Info_Mod_Gorn_Pickpocket (C_INFO)
{
	npc		= Mod_533_SLD_Gorn_NW;
	nr		= 1;
	condition	= Info_Mod_Gorn_Pickpocket_Condition;
	information	= Info_Mod_Gorn_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Gorn_Pickpocket_Condition()
{
	C_Beklauen	(109, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Gorn_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Gorn_Pickpocket);

	Info_AddChoice	(Info_Mod_Gorn_Pickpocket, DIALOG_BACK, Info_Mod_Gorn_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Gorn_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Gorn_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Gorn_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Gorn_Pickpocket);
};

FUNC VOID Info_Mod_Gorn_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Gorn_Pickpocket);
};

INSTANCE Info_Mod_Gorn_EXIT (C_INFO)
{
	npc		= Mod_533_SLD_Gorn_NW;
	nr		= 1;
	condition	= Info_Mod_Gorn_EXIT_Condition;
	information	= Info_Mod_Gorn_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Gorn_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gorn_EXIT_Info()
{
	AI_Output(self, hero, "Info_Mod_Gorn_EXIT_12_00"); //Mögest du nie deinen Meister finden!

	AI_StopProcessInfos	(self);
};