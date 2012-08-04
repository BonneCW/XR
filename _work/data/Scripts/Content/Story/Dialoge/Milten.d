INSTANCE Info_Mod_Milten_Hi (C_INFO)
{
	npc		= Mod_534_KDF_Milten_NW;
	nr		= 1;
	condition	= Info_Mod_Milten_Hi_Condition;
	information	= Info_Mod_Milten_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Milten_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Milten_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Milten_Hi_03_00"); //Du lebst ja noch?
	AI_Output(hero, self, "Info_Mod_Milten_Hi_15_01"); //Sieht so aus.
	AI_Output(self, hero, "Info_Mod_Milten_Hi_03_02"); //Was kann ich für dich tun?
};

INSTANCE Info_Mod_Milten_Daemonisch (C_INFO)
{
	npc		= Mod_534_KDF_Milten_NW;
	nr		= 1;
	condition	= Info_Mod_Milten_Daemonisch_Condition;
	information	= Info_Mod_Milten_Daemonisch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Milten_Daemonisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_UrnolKap4))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Milten_Daemonisch_Info()
{
	AI_Output(self, hero, "Info_Mod_Milten_Daemonisch_03_00"); //Hallo, ich hoffe, ich habe euch nicht gerade unterbrochen ...
	AI_Output(hero, self, "Info_Mod_Milten_Daemonisch_15_01"); //Nein, nein, wird waren gerade fertig.
	AI_Output(self, hero, "Info_Mod_Milten_Daemonisch_03_02"); //Scheint ja wieder sehr viel Geheimniskrämerei im Spiel zu sein, so, wie ihr euch von den anderen abgesetzt habt ... na ja, wie dem auch sei, ich komme von Lester.
	AI_Output(hero, self, "Info_Mod_Milten_Daemonisch_15_03"); //Lester? Was ist mit ihm?
	AI_Output(self, hero, "Info_Mod_Milten_Daemonisch_03_04"); //Ich soll dir von ihm ausrichten, dass er einige Spruchrollen für dich modifiziert.
	AI_Output(self, hero, "Info_Mod_Milten_Daemonisch_03_05"); //Sie könnten dir bei deiner Suche nach den Götterwaffen behilflich sein.
	AI_Output(hero, self, "Info_Mod_Milten_Daemonisch_15_06"); //Ok, danke. Dann werde ich mal bei ihm vorbeischauen.
	AI_Output(self, hero, "Info_Mod_Milten_Daemonisch_03_07"); //Ja, mach das. Ich werde mich indes dem Zwischenfall mit dem verstorbenen Novizen annehmen.
	AI_Output(hero, self, "Info_Mod_Milten_Daemonisch_15_08"); //Verstorbener Novize?!
	AI_Output(self, hero, "Info_Mod_Milten_Daemonisch_03_09"); //Dyrian, er viel heute morgen ganz plötzlich tot um. Babo hat es mit angesehen.
	AI_Output(self, hero, "Info_Mod_Milten_Daemonisch_03_10"); //Muss dem Armen ziemlich mitgenommen haben, da er seit dem kaum ein Wort herausbekommen hat.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
	AI_Teleport	(self, "ALTAR");

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Milten berichtete, dass Dyrian plötzlich verstorben sei. Augenzeuge Babo scheint ziemlich mitgenommen.");

	B_StartOtherRoutine	(Mod_793_BAU_Pepe_NW, "DAEMONISCH");
	B_StartOtherRoutine	(Mod_1205_SLD_Soeldner_NW, "DAEMONISCH");
	B_StartOtherRoutine	(Mod_566_NONE_Brian_NW, "DAEMONISCH");
	B_StartOtherRoutine	(Mod_981_RIT_Tengron_NW, "DAEMONISCH");
	B_StartOtherRoutine	(Mod_914_NOV_Babo_NW, "DAEMONISCH2");
	B_StartOtherRoutine	(Mod_538_RDW_Diego_NW, "DAEMONISCH");

	B_KillNpc	(Mod_1205_SLD_Soeldner_NW);

	B_RemoveNpc	(Mod_777_NONE_Rukhar_NW);
	B_RemoveNpc	(Mod_915_NOV_Dyrian_NW);

	Wld_InsertNpc	(Zombie_Paladin_01, "NW_CITY_SMFOREST_03");
	Wld_InsertNpc	(Zombie_Paladin_02, "NW_CITY_SMFOREST_03");

	Wld_InsertNpc	(Mod_13000_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_03");
	Wld_InsertNpc	(Mod_13001_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_03");
	Wld_InsertNpc	(Mod_13002_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_03");
	Wld_InsertNpc	(Mod_13003_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_03");
	Wld_InsertNpc	(Mod_13004_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_03");

	Wld_InsertNpc	(Mod_13005_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_03");
	Wld_InsertNpc	(Mod_13006_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_03");
	Wld_InsertNpc	(Mod_13007_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_03");
	Wld_InsertNpc	(Mod_13008_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_03");

	Wld_InsertNpc	(Mod_13009_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_03");
	Wld_InsertNpc	(Mod_13010_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_03");
	Wld_InsertNpc	(Mod_13011_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_03");
	Wld_InsertNpc	(Mod_13012_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_03");

	Wld_InsertNpc	(Mod_13013_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_03");
	Wld_InsertNpc	(Mod_13014_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_03");
	Wld_InsertNpc	(Mod_13015_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_03");
	Wld_InsertNpc	(Mod_13016_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_03");
};

INSTANCE Info_Mod_Milten_Daemonisch2 (C_INFO)
{
	npc		= Mod_534_KDF_Milten_NW;
	nr		= 1;
	condition	= Info_Mod_Milten_Daemonisch2_Condition;
	information	= Info_Mod_Milten_Daemonisch2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich würde gerne etwas wissen.";
};

FUNC INT Info_Mod_Milten_Daemonisch2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ulthar_Daemonisch))
	&& (hero.guild != GIL_VLK)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Milten_Daemonisch2_Info()
{
	AI_Output(hero, self, "Info_Mod_Milten_Daemonisch2_15_00"); //Ich würde gerne etwas wissen.
	AI_Output(self, hero, "Info_Mod_Milten_Daemonisch2_03_01"); //Ja, worum geht es?
	AI_Output(hero, self, "Info_Mod_Milten_Daemonisch2_15_02"); //Woraus besteht Klosterwein?
	AI_Output(self, hero, "Info_Mod_Milten_Daemonisch2_03_03"); //Hmm, ich weiß nicht, ob ich dir das sagen sollte. Eigentlich ist dieses Wissen nur Feuermagiern bestimmt.
	AI_Output(hero, self, "Info_Mod_Milten_Daemonisch2_15_04"); //Es könnte sich als wichtig erweisen.
	AI_Output(self, hero, "Info_Mod_Milten_Daemonisch2_03_05"); //Na gut. Also, man nehme fünf Flaschen ganz gewöhnlichen Wein, gehe damit zu einem Schrein Innos, weihe sie und verteile einen Trank zur Heilung von Besessenheit auf sie. Das war es auch schon.

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Für den Klosterwein nimmt man fünf normale Flaschen Wein, verteilt an einem Innosschrein eine Flasche Heilung der Besessenheit auf diese und segnet sie.");
};

INSTANCE Info_Mod_Milten_Irdorath (C_INFO)
{
	npc		= Mod_534_KDF_Milten_NW;
	nr		= 1;
	condition	= Info_Mod_Milten_Irdorath_Condition;
	information	= Info_Mod_Milten_Irdorath_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie du vermutlich weißt, muss ich zu der Insel aufbrechen.";
};

FUNC INT Info_Mod_Milten_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Irdorath))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Milten_Irdorath_Info()
{
	AI_Output(hero, self, "Info_Mod_Milten_Irdorath_15_00"); //Wie du vermutlich weißt, muss ich zu der Insel aufbrechen.
	AI_Output(hero, self, "Info_Mod_Milten_Irdorath_15_01"); //Fällt dir jemand ein, der mich begleiten könnte?
	AI_Output(self, hero, "Info_Mod_Milten_Irdorath_03_02"); //Hmm, unter den Feuermagiern des Kloster hat jeder seine zugewiesenen Aufgaben.
	AI_Output(self, hero, "Info_Mod_Milten_Irdorath_03_03"); //Da wird es nicht ganz einfach jemanden zu finden, der sich entbehren lässt ...
	AI_Output(self, hero, "Info_Mod_Milten_Irdorath_03_04"); //Unter den Paladinen wirst du am ehesten noch auf Tengron als Begleiter zählen können, der schon bei der Bedrohung durch die Seelenpeiniger Gewissenhaftigkeit bewiesen hat und bestimmt für die Mission freigestellt wird ...

	B_LogEntry	(TOPIC_MOD_HQ_CREW, "Milten meinte, dass sich vielleicht noch Paladin Tengron für die Reise gewinnen ließe.");
};

INSTANCE Info_Mod_Milten_Irdorath2 (C_INFO)
{
	npc		= Mod_534_KDF_Milten_NW;
	nr		= 1;
	condition	= Info_Mod_Milten_Irdorath2_Condition;
	information	= Info_Mod_Milten_Irdorath2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Und was ist mit dir?";
};

FUNC INT Info_Mod_Milten_Irdorath2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Milten_Irdorath))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Milten_Irdorath2_Info()
{
	AI_Output(hero, self, "Info_Mod_Milten_Irdorath2_15_00"); //Und was ist mit dir?
	AI_Output(self, hero, "Info_Mod_Milten_Irdorath2_03_01"); //Ich bin dem Kloster nicht verpflichtet. So wie du mich fragst, wird es mir eine Freude sein, dich auf dieses Abenteuer zu begleiten.
	AI_Output(hero, self, "Info_Mod_Milten_Irdorath2_15_02"); //Dann darf ich dich hiermit an Bord willkommen heißen. Wir sehen uns dann am Hafen.
	AI_Output(self, hero, "Info_Mod_Milten_Irdorath2_03_03"); //Ausgezeichnet. Bis später.

	B_LogEntry	(TOPIC_MOD_HQ_CREW, "Super, mit Milten hätte ich schon mal einen Magier des Feuers mit an Bord.");

	B_GivePlayerXP	(150);

	Mod_MiltenDabei = 1;

	Mod_CrewCount += 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SCHIFF");
};

INSTANCE Info_Mod_Milten_Irdorath3 (C_INFO)
{
	npc		= Mod_534_KDF_Milten_NW;
	nr		= 1;
	condition	= Info_Mod_Milten_Irdorath3_Condition;
	information	= Info_Mod_Milten_Irdorath3_Info;
	permanent	= 1;
	important	= 0;
	description	= "Tut mir leid, aber es scheint das wir zu viele sind.";
};

FUNC INT Info_Mod_Milten_Irdorath3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Milten_Irdorath2))
	&& (Mod_Irdorath == 0)
	&& (Mod_MiltenDabei == 1)
	&& (Mod_JackDabei == 1)
	&& (Mod_CrewCount > 15)
	&& ((Mod_VatrasDabei > 0)
	|| (Mod_NamibDabei > 0)
	|| (Mod_MyxirDabei > 0))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Milten_Irdorath3_Info()
{
	AI_Output(hero, self, "Info_Mod_Milten_Irdorath3_15_00"); //Tut mir leid, aber es scheint das wir zu viele sind. Ich kann dich doch nicht mitnehmen.
	AI_Output(self, hero, "Info_Mod_Milten_Irdorath3_03_01"); //Schade. Ich gehe dann wieder zurück. Du weißt wo du mich findest, wenn doch noch ein Platz frei werden sollte.

	Mod_MiltenDabei = 0;

	Mod_CrewCount -= 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Milten_Irdorath4 (C_INFO)
{
	npc		= Mod_534_KDF_Milten_NW;
	nr		= 1;
	condition	= Info_Mod_Milten_Irdorath4_Condition;
	information	= Info_Mod_Milten_Irdorath4_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich kann dich doch mitnehmen.";
};

FUNC INT Info_Mod_Milten_Irdorath4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Milten_Irdorath2))
	&& (Mod_Irdorath == 0)
	&& (Mod_MiltenDabei == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Milten_Irdorath4_Info()
{
	AI_Output(hero, self, "Info_Mod_Milten_Irdorath4_15_00"); //Ich kann dich doch mitnehmen. Es hat sich noch ein Platz auf dem Schiff gefunden.
	AI_Output(self, hero, "Info_Mod_Milten_Irdorath4_03_01"); //Sehr gut, ich bin dann wieder am Hafen.

	Mod_MiltenDabei = 1;

	Mod_CrewCount += 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SCHIFF");
};

INSTANCE Info_Mod_Milten_Aufgabe (C_INFO)
{
	npc		= Mod_534_KDF_Milten_NW;
	nr		= 1;
	condition	= Info_Mod_Milten_Aufgabe_Condition;
	information	= Info_Mod_Milten_Aufgabe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du eine Aufgabe für mich?";
};

FUNC INT Info_Mod_Milten_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Pyrokar_Mitglied))
	&& (Mod_Gilde	==	0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Milten_Aufgabe_Info()
{
	AI_Output(hero, self, "Info_Mod_Milten_Aufgabe_15_00"); //Hast du eine Aufgabe für mich? Pyrokar sagt ich muss für jeden Feuermagier etwas tun um aufgenommen zu werden.
	AI_Output(self, hero, "Info_Mod_Milten_Aufgabe_03_01"); //Hmmm ...
	AI_Output(self, hero, "Info_Mod_Milten_Aufgabe_03_02"); //Es gibt etwas wobei du mir helfen könntest. Das ist allerdings ziemlich gefährlich.

	Info_ClearChoices	(Info_Mod_Milten_Aufgabe);

	Info_AddChoice	(Info_Mod_Milten_Aufgabe, "Wie kann ich dir helfen?", Info_Mod_Milten_Aufgabe_Wie);
};

FUNC VOID Info_Mod_Milten_Aufgabe_Wie()
{
	AI_Output(hero, self, "Info_Mod_Milten_Aufgabe_Wie_15_00"); //Wie kann ich dir helfen?
	AI_Output(self, hero, "Info_Mod_Milten_Aufgabe_Wie_03_01"); //Mein Lehrer Neoras hat mich damit beauftragt einen Trank zu brauen.
	AI_Output(self, hero, "Info_Mod_Milten_Aufgabe_Wie_03_02"); //Doch man braucht dazu eine sehr seltene Pflanze und die ist nicht einfach zu beschaffen.

	Info_ClearChoices	(Info_Mod_Milten_Aufgabe);
	
	Info_AddChoice	(Info_Mod_Milten_Aufgabe, "Was für eine Pflanze ist das?", Info_Mod_Milten_Aufgabe_Pflanze);
};

FUNC VOID Info_Mod_Milten_Aufgabe_Pflanze()
{
	AI_Output(hero, self, "Info_Mod_Milten_Aufgabe_Pflanze_15_00"); //Was für eine Pflanze ist das?
	AI_Output(self, hero, "Info_Mod_Milten_Aufgabe_Pflanze_03_01"); //Die Pflanze heißt Sonnenaloe und wächst nur in der Nähe von einem Schwarzen Troll.
	AI_Output(hero, self, "Info_Mod_Milten_Aufgabe_Pflanze_15_02"); //EINEM SCHWARZEN TROLL ???
	AI_Output(self, hero, "Info_Mod_Milten_Aufgabe_Pflanze_03_03"); //Ja, deswegen konnte ich den Trank bisher nicht fertig brauen. Alleine ist es für einen Magier wie mich unmöglich den Troll zu töten.
	AI_Output(self, hero, "Info_Mod_Milten_Aufgabe_Pflanze_03_04"); //Ich könnte dir ein wenig mit meiner Magie helfen und du schnappst dir dann schnell die Pflanze.
	AI_Output(hero, self, "Info_Mod_Milten_Aufgabe_Pflanze_15_05"); //Und wo ist dieser Troll?
	AI_Output(self, hero, "Info_Mod_Milten_Aufgabe_Pflanze_03_06"); //Er lebt in einer Höhle ganz im Norden der Insel. Ich kann uns ein Stück vom Weg ersparen indem ich uns aus dem Kloster teleportiere.
	AI_Output(self, hero, "Info_Mod_Milten_Aufgabe_Pflanze_03_07"); //Den Rest müssen wir dann zu Fuß zurücklegen. Sag Bescheid, wenn es losgehen kann.

	Info_ClearChoices	(Info_Mod_Milten_Aufgabe);

	Log_CreateTopic	(TOPIC_MOD_MILTEN_TROLL, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_MILTEN_TROLL, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_MILTEN_TROLL, "Milten will, dass ich zusammen mit ihm zu einem Schwarzen Troll gehe um eine Pflanze zu beschaffen.");
};

INSTANCE Info_Mod_Milten_Teleport_Hin (C_INFO)
{
	npc		= Mod_534_KDF_Milten_NW;
	nr		= 1;
	condition	= Info_Mod_Milten_Teleport_Hin_Condition;
	information	= Info_Mod_Milten_Teleport_Hin_Info;
	permanent	= 0;
	important	= 0;
	description	= "Lass uns gehen!";
};

FUNC INT Info_Mod_Milten_Teleport_Hin_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Milten_Aufgabe))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Milten_Fertig))
	&& ((!Npc_KnowsInfo(hero, Info_Mod_Milten_Treffen))
	|| (Npc_KnowsInfo(hero, Info_Mod_Gorn_Treffen)))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Milten_Teleport_Hin_Info()
{
	AI_StopProcessInfos	(self);

	AI_Teleport	(self, "NW_TROLLAREA_PATH_47B");
	AI_Teleport	(hero, "NW_TROLLAREA_PATH_47A");

	Wld_PlayEffect("spellFX_Teleport_RING",  hero  , hero	, 0, 0, 0, FALSE );
	Wld_PlayEffect("spellFX_Teleport_RING",  self  , self	, 0, 0, 0, FALSE );
	
	B_StartOtherRoutine	(self, "GUIDETOTROLLPARTONE");

	AI_Teleport	(self, "NW_TROLLAREA_PATH_47B");
	AI_Teleport	(hero, "NW_TROLLAREA_PATH_47A");
};

INSTANCE Info_Mod_Milten_Teleport_Da (C_INFO)
{
	npc		= Mod_534_KDF_Milten_NW;
	nr		= 1;
	condition	= Info_Mod_Milten_Teleport_Da_Condition;
	information	= Info_Mod_Milten_Teleport_Da_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Milten_Teleport_Da_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Milten_Teleport_Hin))
	&& (Hlp_StrCmp	(Npc_GetNearestWP(self), "NW_TROLLAREA_PATH_47B"))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Milten_Teleport_Da_Info()
{
	AI_Output(self, hero, "Info_Mod_Milten_Teleport_Da_03_00"); //Ab hier müssen wir zu Fuß weiter, folge mir.

	AI_StopProcessInfos	(self);

	Npc_ExchangeRoutine	(self, "GUIDETOTROLLPARTTWO");

	self.aivar[AIV_Partymember] = TRUE;
};

INSTANCE Info_Mod_Milten_Station (C_INFO)
{
	npc		= Mod_534_KDF_Milten_NW;
	nr		= 1;
	condition	= Info_Mod_Milten_Station_Condition;
	information	= Info_Mod_Milten_Station_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Milten_Station_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Milten_Teleport_Da))
	&& (Hlp_StrCmp	(Npc_GetNearestWP(self), "NW_TROLLAREA_PATH_41"))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Milten_Station_Info()
{
	AI_Output(self, hero, "Info_Mod_Milten_Station_03_00"); //Wenn du hier den Weg verlässt kommst du zur Ausgrabungsstätte der Wassermagier. Aber die kannst du dir ja später mal anschauen.

	AI_StopProcessInfos	(self);

	Npc_ExchangeRoutine	(self, "GUIDETOTROLLPARTTHREE");
};

INSTANCE Info_Mod_Milten_AnSee (C_INFO)
{
	npc		= Mod_534_KDF_Milten_NW;
	nr		= 1;
	condition	= Info_Mod_Milten_AnSee_Condition;
	information	= Info_Mod_Milten_AnSee_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Milten_AnSee_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Milten_Station))
	&& (Hlp_StrCmp	(Npc_GetNearestWP(self), "NW_TROLLAREA_PATH_13"))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Milten_AnSee_Info()
{
	AI_Output(self, hero, "Info_Mod_Milten_AnSee_03_00"); //Wir sind fast da. Auf der anderen Seite dieses Sees ist die Höhle.
	AI_Output(hero, self, "Info_Mod_Milten_AnSee_15_01"); //Lass uns weitergehen.
	AI_Output(self, hero, "Info_Mod_Milten_AnSee_03_02"); //Ok, folge mir.

	AI_StopProcessInfos	(self);

	Npc_ExchangeRoutine	(self, "GUIDETOTROLLPARTFOUR");
};

INSTANCE Info_Mod_Milten_BeiTroll (C_INFO)
{
	npc		= Mod_534_KDF_Milten_NW;
	nr		= 1;
	condition	= Info_Mod_Milten_BeiTroll_Condition;
	information	= Info_Mod_Milten_BeiTroll_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Milten_BeiTroll_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Milten_AnSee))
	&& (Hlp_StrCmp	(Npc_GetNearestWP(self), "NW_TROLLAREA_PATH_81"))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Milten_BeiTroll_Info()
{
	AI_Output(self, hero, "Info_Mod_Milten_BeiTroll_03_00"); //Da wären wir. Ich habe einen Trank für dich der dich schneller macht.
	AI_Output(self, hero, "Info_Mod_Milten_BeiTroll_03_01"); //Du musst nur schnell die Pflanze holen und dann zu mir kommen. Ich werde uns ins Kloster zurück teleportieren.
	
	CreateInvItems	(self, ItPo_Speed, 1);

	B_GiveInvItems	(self, hero, ItPo_Speed, 1);

	AI_StopProcessInfos	(self);

	Npc_ExchangeRoutine	(self, "STAYATTROLL");
};

INSTANCE Info_Mod_Milten_HabPflanze (C_INFO)
{
	npc		= Mod_534_KDF_Milten_NW;
	nr		= 1;
	condition	= Info_Mod_Milten_HabPflanze_Condition;
	information	= Info_Mod_Milten_HabPflanze_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Milten_HabPflanze_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Milten_BeiTroll))
	&& (Npc_HasItems(hero, ItPl_Sagitta_Herb_MIS) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Milten_HabPflanze_Info()
{
	AI_StopProcessInfos	(self);
	
	AI_Teleport	(self, "NW_MONASTERY_ALCHEMY_01");
	AI_Teleport	(hero, "NW_MONASTERY_ALCHEMY_01");

	Wld_PlayEffect("spellFX_Teleport_RING",  hero  , hero	, 0, 0, 0, FALSE );
	Wld_PlayEffect("spellFX_Teleport_RING",  self  , self	, 0, 0, 0, FALSE );
	
	B_StartOtherRoutine	(self, "WAITFORPLAYER");
	
	AI_Teleport	(self, "NW_MONASTERY_ALCHEMY_01");
	AI_Teleport	(hero, "NW_MONASTERY_ALCHEMY_01");

	B_Göttergefallen(1, 1);

	B_GivePlayerXP	(50);
};

INSTANCE Info_Mod_Milten_Fertig (C_INFO)
{
	npc		= Mod_534_KDF_Milten_NW;
	nr		= 1;
	condition	= Info_Mod_Milten_Fertig_Condition;
	information	= Info_Mod_Milten_Fertig_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Milten_Fertig_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Milten_HabPflanze))
	&& (Npc_HasItems(hero, ItPl_Sagitta_Herb_MIS) == 1)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), "NW_MONASTERY_ALCHEMY_01"))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Milten_Fertig_Info()
{
	AI_Output(self, hero, "Info_Mod_Milten_Fertig_03_00"); //Endlich wieder hier.
	AI_Output(hero, self, "Info_Mod_Milten_Fertig_15_01"); //Hier ist die Sonnenaloe.

	B_GiveInvItems	(hero, self, ItPl_Sagitta_Herb_MIS, 1);

	AI_Output(self, hero, "Info_Mod_Milten_Fertig_03_02"); //Danke. Jetzt kann ich endlich den Trank für Meister Neoras fertigstellen.
	AI_Output(self, hero, "Info_Mod_Milten_Fertig_03_03"); //Am besten gibts du ihm den Trank, dann kannst du auch ihn überzeugen. Komm morgen wieder, dann bin ich fertig.

	MiltenBrautTrank = Wld_GetDay();

	Log_CreateTopic	(TOPIC_MOD_NEORAS_TRANK, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_NEORAS_TRANK, LOG_RUNNING);
	B_LogEntry_NMore	(TOPIC_MOD_FEUERMAGIER, TOPIC_MOD_NEORAS_TRANK,TOPIC_MOD_MILTEN_TROLL, "Milten wird für mich stimmen.", "Mit der Sonnenaloe die ich Milten gebracht hab soll er einen Trank für Neoras brauen. Diesen will er mir geben, damit ich ihn Neoras gebe.", "Ich habe Milten die Pflanze besorgt.");

	B_SetTopicStatus	(TOPIC_MOD_MILTEN_TROLL, LOG_SUCCESS);

	B_GivePlayerXP	(150);

	AI_StopProcessInfos	(self);

	Npc_ExchangeRoutine	(self, "START");
};

INSTANCE Info_Mod_Milten_HabTrank (C_INFO)
{
	npc		= Mod_534_KDF_Milten_NW;
	nr		= 1;
	condition	= Info_Mod_Milten_HabTrank_Condition;
	information	= Info_Mod_Milten_HabTrank_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ist der Trank schon fertig?";
};

FUNC INT Info_Mod_Milten_HabTrank_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Milten_Fertig))
	&& (Wld_GetDay() > MiltenBrautTrank)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Milten_HabTrank_Info()
{
	AI_Output(hero, self, "Info_Mod_Milten_HabTrank_15_00"); //Ist der Trank schon fertig?
	AI_Output(self, hero, "Info_Mod_Milten_HabTrank_03_01"); //Ja, ich bin gerade fertig geworden.
	AI_Output(self, hero, "Info_Mod_Milten_HabTrank_03_02"); //Hier ist er.

	B_GiveInvItems	(self, hero, NeorasTrankVonMilten, 1);

	AI_Output(self, hero, "Info_Mod_Milten_HabTrank_03_03"); //Bring ihn zu Neoras, dann wird er von dir überzeugt sein.
	
	B_LogEntry	(TOPIC_MOD_NEORAS_TRANK, "Milten hat mir den Trank gegeben.");

	B_GivePlayerXP	(50);
};

INSTANCE Info_Mod_Milten_MardukAufgabe (C_INFO)
{
	npc		= Mod_534_KDF_Milten_NW;
	nr		= 1;
	condition	= Info_Mod_Milten_MardukAufgabe_Condition;
	information	= Info_Mod_Milten_MardukAufgabe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Meister Marduk trug mir auf ihm eine solche Rune zu besorgen.";
};

FUNC INT Info_Mod_Milten_MardukAufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Milten_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Marduk_Aufgabe))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Marduk_FeuerballRune))
	&& (Hlp_StrCmp	(Npc_GetNearestWP(self), "NW_MONASTERY_ALCHEMY_01"))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Milten_MardukAufgabe_Info()
{
	AI_Output(hero, self, "Info_Mod_Milten_MardukAufgabe_15_00"); //Meister Marduk trug mir auf ihm eine solche Rune zu besorgen.
	AI_Output(self, hero, "Info_Mod_Milten_MardukAufgabe_03_01"); //Na, du musst ja einen schönen Eindruck bei ihm hinterlassen haben.
	AI_Output(self, hero, "Info_Mod_Milten_MardukAufgabe_03_02"); //Ihm dürfte genauso klar sein wie mir, dass du das aus eigener Kraft, ohne die Unterstützung eines Magiers, niemals schaffen kannst ...
	AI_Output(hero, self, "Info_Mod_Milten_MardukAufgabe_15_03"); //Deshalb frage ich ja dich.
	AI_Output(self, hero, "Info_Mod_Milten_MardukAufgabe_03_04"); //Also gut, ich helfe dir dabei… aber das bleibt unter uns, klar?
	AI_Output(self, hero, "Info_Mod_Milten_MardukAufgabe_03_05"); //Ich brauche einen Runenstein, Pech und eine Feuerball-Spruchrolle.

	B_LogEntry	(TOPIC_MOD_MARDUK_FEUERBALL, "Milten hat sich bereit erklärt mir bei der Herstellung der Rune zu helfen. Dafür benötigt er folgende Zutaten: ein Runenstein, Pech und eine Feuerball-Spruchrolle.");
};

INSTANCE Info_Mod_Milten_HabZutatenRune (C_INFO)
{
	npc		= Mod_534_KDF_Milten_NW;
	nr		= 1;
	condition	= Info_Mod_Milten_HabZutatenRune_Condition;
	information	= Info_Mod_Milten_HabZutatenRune_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab die Sachen.";
};

FUNC INT Info_Mod_Milten_HabZutatenRune_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Milten_MardukAufgabe))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Marduk_FeuerballRune))
	&& (Npc_HasItems(hero, ItMi_RuneBlank) >= 1)
	&& (Npc_HasItems(hero, ItMi_Pitch) >= 1)
	&& (Npc_HasItems(hero, ItSc_InstantFireball) >= 1)
	&& (Hlp_StrCmp	(Npc_GetNearestWP(self), "NW_MONASTERY_ALCHEMY_01"))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Milten_HabZutatenRune_Info()
{
	AI_Output(hero, self, "Info_Mod_Milten_HabZutatenRune_15_00"); //Ich hab die Sachen.
	AI_Output(self, hero, "Info_Mod_Milten_HabZutatenRune_03_01"); //Mal sehen. Als erstes einen Runenstein.
	AI_Output(hero, self, "Info_Mod_Milten_HabZutatenRune_15_02"); //Hier ist er.

	B_GiveInvItems	(hero, self, ItMi_RuneBlank, 1);

	AI_Output(self, hero, "Info_Mod_Milten_HabZutatenRune_03_03"); //Dann das Pech.
	AI_Output(hero, self, "Info_Mod_Milten_HabZutatenRune_15_04"); //Bitte schön.

	B_GiveInvItems	(hero, self, ItMi_Pitch, 1);

	AI_Output(self, hero, "Info_Mod_Milten_HabZutatenRune_03_05"); //Und eine Feuerball-Spruchrolle.
	AI_Output(hero, self, "Info_Mod_Milten_HabZutatenRune_15_06"); //Hab ich auch.

	B_GiveInvItems	(hero, self, ItSc_InstantFireball, 1);

	AI_Output(self, hero, "Info_Mod_Milten_HabZutatenRune_03_07"); //Gut, das ist alles. Komm morgen wieder, dann sollte die Rune fertig sein.

	MiltenBautRune	=	Wld_GetDay();

	B_LogEntry	(TOPIC_MOD_MARDUK_FEUERBALL, "Ich habe Milten alle Zutaten gebracht. Er sagt ich soll morgen wieder kommen.");

	B_GivePlayerXP	(50);
};

INSTANCE Info_Mod_Milten_RuneFertig (C_INFO)
{
	npc		= Mod_534_KDF_Milten_NW;
	nr		= 1;
	condition	= Info_Mod_Milten_RuneFertig_Condition;
	information	= Info_Mod_Milten_RuneFertig_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ist die Rune fertig?";
};

FUNC INT Info_Mod_Milten_RuneFertig_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Milten_HabZutatenRune))
	&& (Wld_GetDay() > MiltenBautRune)
	&& (Hlp_StrCmp	(Npc_GetNearestWP(self), "NW_MONASTERY_ALCHEMY_01"))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Milten_RuneFertig_Info()
{
	AI_Output(hero, self, "Info_Mod_Milten_RuneFertig_15_00"); //Ist die Rune fertig?
	AI_Output(self, hero, "Info_Mod_Milten_RuneFertig_03_01"); //Hier ist sie.

	B_GiveInvItems	(self, hero, ItRu_InstantFireball, 1);

	AI_Output(hero, self, "Info_Mod_Milten_RuneFertig_15_02"); //Vielen Dank.
	AI_Output(self, hero, "Info_Mod_Milten_RuneFertig_03_03"); //Aber wie gesagt bleibt das unter uns. (grinst) Ich bin nur zu neugierig auf Marduk’s Gesichtsausdruck, wenn du ihm die Rune bringst.

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_MARDUK_FEUERBALL, "Milten hat mir die Rune gegeben. Ich brauch sie jetzt nur noch zu Marduk zu bringen.");
};

INSTANCE Info_Mod_Milten_MardukRune (C_INFO)
{
	npc		= Mod_534_KDF_Milten_NW;
	nr		= 1;
	condition	= Info_Mod_Milten_MardukRune_Condition;
	information	= Info_Mod_Milten_MardukRune_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Milten_MardukRune_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Marduk_FeuerballRune))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Milten_MardukRune_Info()
{
	AI_Output(self, hero, "Info_Mod_Milten_MardukRune_03_00"); //(grinst) Marduks Reaktion hat meine Erwartungen übertroffen.
	AI_Output(hero, self, "Info_Mod_Milten_MardukRune_15_01"); //Milten?
	AI_Output(self, hero, "Info_Mod_Milten_MardukRune_03_02"); //Ich habe doch gesagt, ich lasse mir das nicht entgehen. Es war ein bisschen wie in alten Zeiten, als Marduk rot anlief, wenn du verstehst ...
	AI_Output(hero, self, "Info_Mod_Milten_MardukRune_15_03"); //Hmm ... wütender Magier ... Erzhaufen?
	AI_Output(self, hero, "Info_Mod_Milten_MardukRune_03_04"); //Genau.
	AI_Output(hero, self, "Info_Mod_Milten_MardukRune_15_05"); //Und ich war wieder froh dich dabei zu haben.
	AI_Output(self, hero, "Info_Mod_Milten_MardukRune_03_06"); //Jederzeit wieder. Ich bin sicher, das war nicht unser letzter Streich. Bis dahin.

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Milten_Treffen (C_INFO)
{
	npc		= Mod_534_KDF_Milten_NW;
	nr		= 1;
	condition	= Info_Mod_Milten_Treffen_Condition;
	information	= Info_Mod_Milten_Treffen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Gorn schickt mich.";
};

FUNC INT Info_Mod_Milten_Treffen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gorn_AtCastlemine))
	&& (Npc_KnowsInfo(hero, Info_Mod_Milten_Hi))
	&& (Hlp_StrCmp	(Npc_GetNearestWP(self), "NW_MONASTERY_ALCHEMY_01"))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Milten_Treffen_Info()
{
	AI_Output(hero, self, "Info_Mod_Milten_Treffen_15_00"); //Gorn schickt mich. Ich soll dir sagen, dass ihr euch in der Taverne 'Zur Toten Harpie'.
	AI_Output(self, hero, "Info_Mod_Milten_Treffen_03_01"); //Gut, ich mach mich sofort auf den Weg.

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_TREFFEN, "Milten macht sich sofort auf den Weg zum Treffen.");

	Npc_ExchangeRoutine	(self, "TREFFEN");
	B_StartOtherRoutine	(Mod_533_SLD_Gorn_NW,	"TREFFEN");
};

INSTANCE Info_Mod_Milten_HaveYouCrawlerEggs (C_INFO)
{
	npc		= Mod_534_KDF_Milten_NW;
	nr		= 1;
	condition	= Info_Mod_Milten_HaveYouCrawlerEggs_Condition;
	information	= Info_Mod_Milten_HaveYouCrawlerEggs_Info;
	permanent	= 0;
	important	= 0;
	description	= "Weißt du, woher ich Minecrawlereier bekomme?";
};

FUNC INT Info_Mod_Milten_HaveYouCrawlerEggs_Condition()
{
	if (Mod_MinecrawlerEi >= 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Milten_HaveYouCrawlerEggs_Info()
{
	AI_Output(hero, self, "Info_Mod_Milten_HaveYouCrawlerEggs_15_00"); //Weißt du, woher ich Minecrawlereier bekomme?
	AI_Output(self, hero, "Info_Mod_Milten_HaveYouCrawlerEggs_03_01"); //Gorn hat mir damals welche aus der freien Mine mitgebracht. Schöne Exemplare.
	AI_Output(self, hero, "Info_Mod_Milten_HaveYouCrawlerEggs_03_02"); //Wusste gar nicht, dass in der freien Mine auch eine Königin war.
	
	Mod_MinecrawlerEi = 2;
};

INSTANCE Info_Mod_Milten_MinecrawlerEi (C_INFO)
{
	npc		= Mod_534_KDF_Milten_NW;
	nr		= 1;
	condition	= Info_Mod_Milten_MinecrawlerEi_Condition;
	information	= Info_Mod_Milten_MinecrawlerEi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du die Minecrawlereier von Gorn noch?";
};

FUNC INT Info_Mod_Milten_MinecrawlerEi_Condition()
{
	if (Mod_MinecrawlerEi	==	2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Milten_MinecrawlerEi_Info()
{
	AI_Output(hero, self, "Info_Mod_Milten_MinecrawlerEi_15_00"); //Hast du die Minecrawlereier von Gorn noch?
	AI_Output(self, hero, "Info_Mod_Milten_MinecrawlerEi_03_01"); //Eins hab ich schon verbraucht, aber das andere kannst du haben.
	
	CreateInvItems	(self, ItAt_Crawlerqueen, 1);
	B_GiveInvItems	(self, hero, ItAt_Crawlerqueen, 1);

	Mod_MinecrawlerEi	=	3;
};

INSTANCE Info_Mod_Milten_Drachen (C_INFO)
{
	npc		= Mod_534_KDF_Milten_NW;
	nr		= 1;
	condition	= Info_Mod_Milten_Drachen_Condition;
	information	= Info_Mod_Milten_Drachen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Milten_Drachen_Condition()
{
	if (Mod_NL_DragonKloster == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Milten_Drachen_Info()
{
	AI_Output(self, hero, "Info_Mod_Milten_Drachen_03_00"); //Hey, ich habe da vielleicht etwas für dich.
	AI_Output(self, hero, "Info_Mod_Milten_Drachen_03_01"); //Nach dem Angriff dieser Feuerechsen habe ich in alten Schriften nachgeforscht.
	AI_Output(self, hero, "Info_Mod_Milten_Drachen_03_02"); //In einem uralten stark verwitterten Buch stieß ich dabei auf dieses ominöse Rezept.
	AI_Output(self, hero, "Info_Mod_Milten_Drachen_03_03"); //Vielleicht kannst du ja etwas damit anfangen.

	B_GiveInvItems	(self, hero, ItWr_DrachensudManaverbrennung, 1);
};

INSTANCE Info_Mod_Milten_Leichengase (C_INFO)
{
	npc		= Mod_534_KDF_Milten_NW;
	nr		= 1;
	condition	= Info_Mod_Milten_Leichengase_Condition;
	information	= Info_Mod_Milten_Leichengase_Info;
	permanent	= 0;
	important	= 0;
	description	= "Milten, ich brauche deine Hilfe!";
};

FUNC INT Info_Mod_Milten_Leichengase_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Caine_Leichengase4))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Lobart_Leichengase2))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Dragomir_Leichengase))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Milten_Leichengase_Info()
{
	AI_Output(hero, self, "Info_Mod_Milten_Leichengase_15_00"); //Milten, ich brauche deine Hilfe!
	AI_Output(self, hero, "Info_Mod_Milten_Leichengase_03_01"); //Klar, worum geht’s?
	AI_Output(hero, self, "Info_Mod_Milten_Leichengase_15_02"); //Ich muss einen Troll dazu bringen, diesen Sack voll Kräuter hier zu fressen.
	AI_Output(self, hero, "Info_Mod_Milten_Leichengase_03_03"); //Was?! Naja du wirst schon deine Gründe haben.
	AI_Output(hero, self, "Info_Mod_Milten_Leichengase_15_04"); //Kannst du mir helfen oder nicht?
	AI_Output(self, hero, "Info_Mod_Milten_Leichengase_03_05"); //Ich hätte da schon eine Idee.
	AI_Output(self, hero, "Info_Mod_Milten_Leichengase_03_06"); //Geh zu Hyglas, er ist hier im Kloster für die Spruchrollen zuständig. Bitte ihn um Hilfe.

	B_LogEntry	(TOPIC_MOD_SL_LEICHENGASE, "Milten hat mich an Hyglas verwiesen.");
};

INSTANCE Info_Mod_Milten_Pickpocket (C_INFO)
{
	npc		= Mod_534_KDF_Milten_NW;
	nr		= 1;
	condition	= Info_Mod_Milten_Pickpocket_Condition;
	information	= Info_Mod_Milten_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Milten_Pickpocket_Condition()
{
	C_Beklauen	(120, ItMi_Gold, 1200);
};

FUNC VOID Info_Mod_Milten_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Milten_Pickpocket);

	Info_AddChoice	(Info_Mod_Milten_Pickpocket, DIALOG_BACK, Info_Mod_Milten_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Milten_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Milten_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Milten_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Milten_Pickpocket);
};

FUNC VOID Info_Mod_Milten_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Milten_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Milten_Pickpocket);

		Info_AddChoice	(Info_Mod_Milten_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Milten_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Milten_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Milten_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Milten_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Milten_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Milten_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Milten_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Milten_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Milten_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Milten_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Milten_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Milten_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Milten_EXIT (C_INFO)
{
	npc		= Mod_534_KDF_Milten_NW;
	nr		= 1;
	condition	= Info_Mod_Milten_EXIT_Condition;
	information	= Info_Mod_Milten_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Milten_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Milten_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};