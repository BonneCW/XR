INSTANCE Info_Mod_Buff_TUG_Hi (C_INFO)
{
	npc		= Mod_7362_OUT_Buff_TUG;
	nr		= 1;
	condition	= Info_Mod_Buff_TUG_Hi_Condition;
	information	= Info_Mod_Buff_TUG_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Buff_TUG_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Setta_TUG_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Buff_TUG_Hi_Info()
{
	AI_TurnToNPC(self, Mod_7352_OUT_Trador_TUG);
	
	AI_Output(self, hero, "Info_Mod_Buff_TUG_Hi_06_00"); //Das stimmt. Wir sind euch auf die Schliche gekommen.
	AI_Output(self, hero, "Info_Mod_Buff_TUG_Hi_06_01"); //Dieser Mann hat uns die Hoffnung wiedergegeben. Wir sind ihm durch den Teleporter gefolgt.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Buff_TUG_Trador (C_INFO)
{
	npc		= Mod_7362_OUT_Buff_TUG;
	nr		= 1;
	condition	= Info_Mod_Buff_TUG_Trador_Condition;
	information	= Info_Mod_Buff_TUG_Trador_Info;
	permanent	= 0;
	important	= 0;
	description	= "So, das hätten wir. Was hattest du mit Trador zu schaffen?";
};

FUNC INT Info_Mod_Buff_TUG_Trador_Condition()
{
	if (Mod_VMG_WSTrador == 4)
	|| (Mod_VMG_WSTrador == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Buff_TUG_Trador_Info()
{
	AI_Output(hero, self, "Info_Mod_Buff_TUG_Trador_15_00"); //So, das hätten wir. Was hattest du mit Trador zu schaffen?
	AI_Output(self, hero, "Info_Mod_Buff_TUG_Trador_06_01"); //Da muss ich ausholen. In jungen Jahren war ich Aufseher im Minental.
	AI_Output(self, hero, "Info_Mod_Buff_TUG_Trador_06_02"); //Einige Gefangene planten eine Verschwörung gegen die Magier.
	AI_Output(self, hero, "Info_Mod_Buff_TUG_Trador_06_03"); //Diese hatten vor, die Gefangenen im Minental einzuschließen oder so.
	AI_Output(self, hero, "Info_Mod_Buff_TUG_Trador_06_04"); //Auf jeden Fall bekam ich Wind von der Sache und meldete die Angelegenheit dem obersten Aufseher.
	AI_Output(self, hero, "Info_Mod_Buff_TUG_Trador_06_05"); //Er bestrafte die Gruppe, deren Anführer Trador war.
	AI_Output(self, hero, "Info_Mod_Buff_TUG_Trador_06_06"); //Das wollte er sich nicht gefallen lassen und teleportierte mich mit irgendeinem Zauber in das verlassene Tal.
	AI_Output(self, hero, "Info_Mod_Buff_TUG_Trador_06_07"); //Ein paar Jahre später tauchte dort Setta auf, die scheinbar auch mit Trador zu tun gehabt hat.
	AI_Output(self, hero, "Info_Mod_Buff_TUG_Trador_06_08"); //Aber als du dann gekommen bist wurde uns der Mut zum Handeln wiedergegeben und wir benutzten gemeinsam das Portal um dich zu unterstützen.
	AI_Output(self, hero, "Info_Mod_Buff_TUG_Trador_06_09"); //Was für ein Glück, dass wir Trador nun endlich erwischt haben.
	AI_Output(self, hero, "Info_Mod_Buff_TUG_Trador_06_10"); //Wie kann ich mich erkenntlich zeigen?

	Mod_VMG_WSTrador += 1;
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;

	if (Mod_VMG_WSTrador == 6)
	{
		B_LogEntry	(TOPIC_MOD_TURENDIL_GOLEM, "Ich habe mit den beiden gesprochen und eine Kurzfassung ihrer Lebensgeschichte gehört. Über seine Gruppe habe ich leider nichts Wissenswertes erfahren, aber ich weiß nun, dass er ein ehemaliger Gefangener in der Kolonie war. Ich sollte mal mit Genn wegen des Teleporters reden.");
	};

	B_StartOtherRoutine	(self, "DORF");

	Info_ClearChoices	(Info_Mod_Buff_TUG_Trador);

	Info_AddChoice	(Info_Mod_Buff_TUG_Trador, "Gib mir 100 Goldmünzen.", Info_Mod_Buff_TUG_Trador_C);
	Info_AddChoice	(Info_Mod_Buff_TUG_Trador, "Vielleicht 50 Goldmünzen. Das reicht völlig.", Info_Mod_Buff_TUG_Trador_B);
	Info_AddChoice	(Info_Mod_Buff_TUG_Trador, "Ich brauche keine Belohnung, dein Dank ist mir genug.", Info_Mod_Buff_TUG_Trador_A);
};

FUNC VOID Info_Mod_Buff_TUG_Trador_C()
{
	AI_Output(hero, self, "Info_Mod_Buff_TUG_Trador_C_15_00"); //Gib mir 100 Goldmünzen.
	AI_Output(self, hero, "Info_Mod_Buff_TUG_Trador_C_06_01"); //Nicht gerade was für den kleinen Geldbeutel, aber bitte. Du sollst es haben.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	Info_ClearChoices	(Info_Mod_Buff_TUG_Trador);
};

FUNC VOID Info_Mod_Buff_TUG_Trador_B()
{
	AI_Output(hero, self, "Info_Mod_Buff_TUG_Trador_B_15_00"); //Vielleicht 50 Goldmünzen. Das reicht völlig.
	AI_Output(self, hero, "Info_Mod_Buff_TUG_Trador_B_06_01"); //Das ist angemessen. Hier.

	B_GiveInvItems	(self, hero, ItMi_Gold, 50);

	B_GivePlayerXP	(100);

	Info_ClearChoices	(Info_Mod_Buff_TUG_Trador);
};

FUNC VOID Info_Mod_Buff_TUG_Trador_A()
{
	AI_Output(hero, self, "Info_Mod_Buff_TUG_Trador_A_15_00"); //Ich brauche keine Belohnung, dein Dank ist mir genug.
	AI_Output(self, hero, "Info_Mod_Buff_TUG_Trador_A_06_01"); //Oh, so etwas habe ich lange nicht mehr erlebt. Du bist ein guter Mensch.

	B_GivePlayerXP	(200);

	Info_ClearChoices	(Info_Mod_Buff_TUG_Trador);
};

INSTANCE Info_Mod_Buff_TUG_EXIT (C_INFO)
{
	npc		= Mod_7362_OUT_Buff_TUG;
	nr		= 1;
	condition	= Info_Mod_Buff_TUG_EXIT_Condition;
	information	= Info_Mod_Buff_TUG_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Buff_TUG_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Buff_TUG_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};