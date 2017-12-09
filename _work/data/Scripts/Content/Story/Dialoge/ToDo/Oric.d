INSTANCE Info_Mod_Oric_Hi (C_INFO)
{
	npc		= Mod_7039_PAL_Oric_MT;
	nr		= 1;
	condition	= Info_Mod_Oric_Hi_Condition;
	information	= Info_Mod_Oric_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Oric_Hi_Condition()
{
	if (Npc_GetDistToWP(self, "OW_PATH_1_16") < 300)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Oric_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Oric_Hi_11_00"); //Das war der Anfang. Ich werde einige Leute hier lassen. Nun müssen wir noch die Austauschstelle befreien, danach bekommen wir Verstärkung, um uns um die Mine zu kümmern.
	AI_Output(hero, self, "Info_Mod_Oric_Hi_15_01"); //Verstehe.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOAUSTAUSCH");
	B_StartOtherRoutine	(Mod_1870_EBR_Alissandro_MT, "TOAUSTAUSCH");
	B_StartOtherRoutine	(Mod_7040_RIT_Ritter_MT, "TOAUSTAUSCH");
	B_StartOtherRoutine	(Mod_7041_RIT_Ritter_MT, "TOAUSTAUSCH");
	B_StartOtherRoutine	(Mod_7042_RIT_Ritter_MT, "ATVM");
	B_StartOtherRoutine	(Mod_7043_RIT_Ritter_MT, "ATVM");
	B_StartOtherRoutine	(Mod_7044_RIT_Ritter_MT, "ATVM");
	B_StartOtherRoutine	(Mod_7045_RIT_Ritter_MT, "ATVM");

	Mod_7042_RIT_Ritter_MT.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_7043_RIT_Ritter_MT.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_7044_RIT_Ritter_MT.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_7045_RIT_Ritter_MT.aivar[AIV_PARTYMEMBER] = FALSE;

	B_LogEntry	(TOPIC_MOD_AL_ERSTERSCHRITT, "Wir haben den Eingang bei der Verlassenen Mine eingenommen.");
};

INSTANCE Info_Mod_Oric_AtAustausch (C_INFO)
{
	npc		= Mod_7039_PAL_Oric_MT;
	nr		= 1;
	condition	= Info_Mod_Oric_AtAustausch_Condition;
	information	= Info_Mod_Oric_AtAustausch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie geht es jetzt weiter?";
};

FUNC INT Info_Mod_Oric_AtAustausch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Oric_Hi))
	&& (Npc_GetDistToWP(self, "WP_INTRO_FALL3") < 300)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Oric_AtAustausch_Info()
{
	AI_Output(hero, self, "Info_Mod_Oric_AtAustausch_15_00"); //Wie geht es jetzt weiter?
	AI_Output(self, hero, "Info_Mod_Oric_AtAustausch_11_01"); //Jetzt ist die Mine dran. Unsere Leute haben sich bereits in ihrer Nähe positioniert. In der nächsten Schlacht spielst du eine besondere Rolle.
	AI_Output(hero, self, "Info_Mod_Oric_AtAustausch_15_02"); //Ach was?
	AI_Output(self, hero, "Info_Mod_Oric_AtAustausch_11_03"); //Ja, ich hoffe du bist dir über die Wichtigkeit deine Einsatzes bewusst. Zweifellos trägt er zum Ausgang der Schlacht bei. Beinahe könnte man sagen, dass von dir das Gelingen der Unternehmung abhängt, daher weißt du hoffentlich ...
	AI_Output(hero, self, "Info_Mod_Oric_AtAustausch_15_04"); //(genervt) Jetzt spuck endlich aus was du von mir willst.
	AI_Output(self, hero, "Info_Mod_Oric_AtAustausch_11_05"); //(mit unterdrückter Wut) Dring in die Mine ein und schick den Anführer zu Beliar.
	AI_Output(hero, self, "Info_Mod_Oric_AtAustausch_15_06"); //Geht doch. Und wie soll ich in die Mine kommen?
	AI_Output(self, hero, "Info_Mod_Oric_AtAustausch_11_07"); //Ich habe hier eine Unsichtbarkeitsspruchrolle. Sie macht dich natürlich nicht wirklich unsichtbar, sondern sorgt nur dafür, dass andere dich nicht sehen können.

	B_GiveInvItems	(self, hero, ItSc_Unsichtbarkeit, 1);

	AI_Output(self, hero, "Info_Mod_Oric_AtAustausch_11_08"); //Schleich dich damit in die Mine und töte dort Kurgan, den Anführer. Die Unsichtbarkeit hält zehn Minuten an. Außerdem kann Kurgan dich sehen, nachdem du ihn angegriffen hast. Das heißt, du musst vor allem schnell sein.
	AI_Output(self, hero, "Info_Mod_Oric_AtAustausch_11_09"); //Lauf dann aus der Mine heraus und rede mit mir, ich werde vor der Mine auf dich warten.

	Mod_AL_Oric = 2;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ATAM");
	B_StartOtherRoutine	(Mod_1870_EBR_Alissandro_MT, "ATAM");
	B_StartOtherRoutine	(Mod_7040_RIT_Ritter_MT, "ATAUSTAUSCH");
	B_StartOtherRoutine	(Mod_7041_RIT_Ritter_MT, "ATAUSTAUSCH");

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_1870_EBR_Alissandro_MT.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_7040_RIT_Ritter_MT.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_7041_RIT_Ritter_MT.aivar[AIV_PARTYMEMBER] = FALSE;

	if (Mod_MinentalTor == 1)
	{
		Wld_SendTrigger	("EVT_AM_LOB_GATE_BIG");
	};

	B_LogEntry	(TOPIC_MOD_AL_ERSTERSCHRITT, "Der Austauschplatz ist unser. Nun soll ich mich unsichtbar in die Alte Mine schleichen und dort Kurgan, den Anführer, töten.");
};

INSTANCE Info_Mod_Oric_KurganTot (C_INFO)
{
	npc		= Mod_7039_PAL_Oric_MT;
	nr		= 1;
	condition	= Info_Mod_Oric_KurganTot_Condition;
	information	= Info_Mod_Oric_KurganTot_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kurgan ist tot.";
};

FUNC INT Info_Mod_Oric_KurganTot_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Oric_AtAustausch))
	&& (Mod_AL_Oric == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Oric_KurganTot_Info()
{
	AI_Output(hero, self, "Info_Mod_Oric_KurganTot_15_00"); //Kurgan ist tot.
	AI_Output(self, hero, "Info_Mod_Oric_KurganTot_11_01"); //Perfekt. Nun werden wir die Mine angreifen. Geh vor, meine Truppe wird dir folgen.

	Mod_AL_Oric = 4;

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_AL_ERSTERSCHRITT, "Nun können wir die Mine angreifen.");
};

INSTANCE Info_Mod_Oric_MineUns (C_INFO)
{
	npc		= Mod_7039_PAL_Oric_MT;
	nr		= 1;
	condition	= Info_Mod_Oric_MineUns_Condition;
	information	= Info_Mod_Oric_MineUns_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Mine gehört uns.";
};

FUNC INT Info_Mod_Oric_MineUns_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Oric_KurganTot))
	&& (Mod_AL_Oric == 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Oric_MineUns_Info()
{
	AI_Output(hero, self, "Info_Mod_Oric_MineUns_15_00"); //Die Mine gehört uns.
	AI_Output(self, hero, "Info_Mod_Oric_MineUns_11_01"); //Sehr gut. Nun haben wir nur noch einen Schritt vor uns. Alissandro wird ihn dir bei der Hütte erklären.

	Mod_AL_Oric = 7;

	AI_StopProcessInfos	(self);

	B_GivePlayerXP	(500);

	B_SetTopicStatus	(TOPIC_MOD_AL_ERSTERSCHRITT, LOG_SUCCESS);
};

INSTANCE Info_Mod_Oric_Gomez (C_INFO)
{
	npc		= Mod_7039_PAL_Oric_MT;
	nr		= 1;
	condition	= Info_Mod_Oric_Gomez_Condition;
	information	= Info_Mod_Oric_Gomez_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Oric_Gomez_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raven_GomezLebenLassen))
	&& (!Npc_IsInState(Mod_520_DMR_Raven_MT, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Oric_Gomez_Info()
{
	AI_TurnToNpc	(self, Mod_520_DMR_Raven_MT);

	AI_Output(self, hero, "Info_Mod_Oric_Gomez_11_00"); //Schweigt, Abschaum Beliars. Wir haben euren Mann bezwungen, und so steht uns auch das Recht zu, ihn zu töten.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Oric_EXIT (C_INFO)
{
	npc		= Mod_7039_PAL_Oric_MT;
	nr		= 1;
	condition	= Info_Mod_Oric_EXIT_Condition;
	information	= Info_Mod_Oric_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Oric_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Oric_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};