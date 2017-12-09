INSTANCE Info_Mod_Velaya_NW_Irdorath (C_INFO)
{
	npc		= Mod_7416_BAU_Velaya_NW;
	nr		= 1;
	condition	= Info_Mod_Velaya_NW_Irdorath_Condition;
	information	= Info_Mod_Velaya_NW_Irdorath_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Velaya_NW_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Irdorath))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Velaya_NW_Irdorath_Info()
{
	AI_Output(self, hero, "Info_Mod_Velaya_NW_Irdorath_17_00"); //(erfreut) Das gibt’s doch nicht, du hier?
	AI_Output(hero, self, "Info_Mod_Velaya_NW_Irdorath_15_01"); //Ohh, ich bin auch überrascht dich hier anzutreffen ...
	AI_Output(self, hero, "Info_Mod_Velaya_NW_Irdorath_17_02"); //Naja, ohne dich könnte ich ja auch nicht hier sein, würde immer noch im Minental sitzen, mich beim Baden begaffen lassen und das Bett mit den Erzbaronen teilen ... auch wenn es nicht ganz so schlimm war, wie zu Zeiten von Gomez.
	AI_Output(hero, self, "Info_Mod_Velaya_NW_Irdorath_15_03"); //(halblaut) Hmm, da werden Erinnerungen wach ...
	AI_Output(self, hero, "Info_Mod_Velaya_NW_Irdorath_17_04"); //Was sagst du?
	AI_Output(hero, self, "Info_Mod_Velaya_NW_Irdorath_15_05"); //Ähh, ach nichts. Ich meinte nur ... dass ich mich daran erinnert habe, ja noch alles für die anstehende Seereise vorbereiten zu müssen.
	AI_Output(self, hero, "Info_Mod_Velaya_NW_Irdorath_17_06"); //Seereise? Die große weite Welt? Wie herrlich ...
	AI_Output(self, hero, "Info_Mod_Velaya_NW_Irdorath_17_07"); //Ach, wenn ich dich doch nur begleiten könnte ...
	AI_Output(hero, self, "Info_Mod_Velaya_NW_Irdorath_15_08"); //Na ja, es wird nicht ganz ungefährlich. Es heißt einen üblen Magier für seine Schandtaten zur Rechenschaft zu ziehen.
	AI_Output(hero, self, "Info_Mod_Velaya_NW_Irdorath_15_09"); //Ich weiß nicht, ob das das richtige für dich wäre ...
	AI_Output(self, hero, "Info_Mod_Velaya_NW_Irdorath_17_10"); //(freundlich, ironisch) Ach hör schon auf den Kavalier geben. Ich habe in den letzten Wochen einiges gelernt ...
	AI_Output(hero, self, "Info_Mod_Velaya_NW_Irdorath_15_11"); //Nun, ich vermute, du meinst nicht die Feldarbeit ...
	AI_Output(self, hero, "Info_Mod_Velaya_NW_Irdorath_17_12"); //Tja, mit meinem Bogen kann ich einem Eber auf 10m das Auge ausschießen ...
	AI_Output(self, hero, "Info_Mod_Velaya_NW_Irdorath_17_13"); //... und aufdringlichen Kerlen mit dem Degen Zurückhaltung lehren, wenn es dahin geht, wo es weh tut ...
	AI_Output(hero, self, "Info_Mod_Velaya_NW_Irdorath_15_14"); //(halblaut) Soso, klingt, als würde da jemand aus Erfahrung sprechen.
};

INSTANCE Info_Mod_Velaya_NW_Irdorath2 (C_INFO)
{
	npc		= Mod_7416_BAU_Velaya_NW;
	nr		= 1;
	condition	= Info_Mod_Velaya_NW_Irdorath2_Condition;
	information	= Info_Mod_Velaya_NW_Irdorath2_Info;
	permanent	= 0;
	important	= 0;
	description	= "In Ordnung, wer sich so in wenigen Wochen gemausert hat, wird auch auf dem Schiff nichts anbrennen lassen.";
};

FUNC INT Info_Mod_Velaya_NW_Irdorath2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Velaya_NW_Irdorath))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Velaya_NW_Irdorath2_Info()
{
	AI_Output(hero, self, "Info_Mod_Velaya_NW_Irdorath2_15_00"); //In Ordnung, wer sich so in wenigen Wochen gemausert hat, wird auch auf dem Schiff nichts anbrennen lassen.
	AI_Output(self, hero, "Info_Mod_Velaya_NW_Irdorath2_17_01"); //Toll! Und das Schiff, ist das das fantastische große hinten im Hafen?
	AI_Output(self, hero, "Info_Mod_Velaya_NW_Irdorath2_17_02"); //Man, dass muss ich mir gleich näher ansehen.

	B_LogEntry	(TOPIC_MOD_HQ_CREW, "Wen man nicht alles so in Khorinis antrifft ... mit meiner 'alten Bekannten' Velaya ist jetzt meine Mannschaft um ein Crewmitglied reicher.");

	B_GivePlayerXP	(100);

	Mod_VelayaDabei = 1;

	Mod_CrewCount += 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SCHIFF");
};

INSTANCE Info_Mod_Velaya_NW_Irdorath3 (C_INFO)
{
	npc		= Mod_7416_BAU_Velaya_NW;
	nr		= 1;
	condition	= Info_Mod_Velaya_NW_Irdorath3_Condition;
	information	= Info_Mod_Velaya_NW_Irdorath3_Info;
	permanent	= 1;
	important	= 0;
	description	= "Tut mir leid, aber es scheint das wir zu viele sind.";
};

FUNC INT Info_Mod_Velaya_NW_Irdorath3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Velaya_NW_Irdorath2))
	&& (Mod_Irdorath == 0)
	&& (Mod_VelayaDabei == 1)
	&& (((Mod_JackDabei == 1)
	&& (Mod_CrewCount > 15))
	|| (Mod_CedricDabei == 1))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Velaya_NW_Irdorath3_Info()
{
	AI_Output(hero, self, "Info_Mod_Velaya_NW_Irdorath3_15_00"); //Tut mir leid, aber es scheint das wir zu viele sind. Ich kann dich doch nicht mitnehmen.
	AI_Output(self, hero, "Info_Mod_Velaya_NW_Irdorath3_17_01"); //Schade. Ich gehe dann wieder zurück. Du weißt wo du mich findest, wenn doch noch ein Platz frei werden sollte.

	Mod_VelayaDabei = 0;

	Mod_CrewCount -= 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Velaya_NW_Irdorath4 (C_INFO)
{
	npc		= Mod_7416_BAU_Velaya_NW;
	nr		= 1;
	condition	= Info_Mod_Velaya_NW_Irdorath4_Condition;
	information	= Info_Mod_Velaya_NW_Irdorath4_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich kann dich doch mitnehmen.";
};

FUNC INT Info_Mod_Velaya_NW_Irdorath4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Velaya_NW_Irdorath2))
	&& (Mod_Irdorath == 0)
	&& (Mod_VelayaDabei == 0)
	&& (Mod_CedricDabei == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Velaya_NW_Irdorath4_Info()
{
	AI_Output(hero, self, "Info_Mod_Velaya_NW_Irdorath4_15_00"); //Ich kann dich doch mitnehmen. Es hat sich noch ein Platz auf dem Schiff gefunden.
	AI_Output(self, hero, "Info_Mod_Velaya_NW_Irdorath4_17_01"); //Sehr gut, ich bin dann wieder am Hafen.

	Mod_VelayaDabei = 1;

	Mod_CrewCount += 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SCHIFF");
};

INSTANCE Info_Mod_Velaya_NW_EXIT (C_INFO)
{
	npc		= Mod_7416_BAU_Velaya_NW;
	nr		= 1;
	condition	= Info_Mod_Velaya_NW_EXIT_Condition;
	information	= Info_Mod_Velaya_NW_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Velaya_NW_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Velaya_NW_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};