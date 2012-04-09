INSTANCE Info_Mod_Brody_Hi (C_INFO)
{
	npc		= Mod_7293_OUT_Brody_AW;
	nr		= 1;
	condition	= Info_Mod_Brody_Hi_Condition;
	information	= Info_Mod_Brody_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Brody_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Brody_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Brody_Hi_09_00"); //(schwach krächzend) Hey, Wasser. Bitte Wasser.

	Info_ClearChoices	(Info_Mod_Brody_Hi);

	Info_AddChoice	(Info_Mod_Brody_Hi, "Ich hab' keins dabei.", Info_Mod_Brody_Hi_B);

	if (Npc_HasItems(hero, ItFo_Water) >= 1)
	{
		Info_AddChoice	(Info_Mod_Brody_Hi, "Hier hast du welches.", Info_Mod_Brody_Hi_A);
	};
};

FUNC VOID Info_Mod_Brody_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Brody_Hi_B_15_00"); //Ich hab' keins dabei.
	AI_Output(self, hero, "Info_Mod_Brody_Hi_B_09_00"); //Macht nix. Ich mach's eh nicht mehr lange. (lacht trocken und haucht dabei sein Leben aus)

	Mod_BrodyQuest = 1;

	Info_ClearChoices	(Info_Mod_Brody_Hi);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Brody_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Brody_Hi_A_15_00"); //Hier hast du welches.

	B_GiveInvItems	(hero, self, ItFo_Water, 1);

	B_UseItem	(self, ItFo_Water);

	AI_Output(self, hero, "Info_Mod_Brody_Hi_A_09_01"); //Ahhhh! Danke, Freundchen.

	Mod_BrodyQuest = 3;

	Info_ClearChoices	(Info_Mod_Brody_Hi);
};

INSTANCE Info_Mod_Brody_WhoAreYou (C_INFO)
{
	npc		= Mod_7293_OUT_Brody_AW;
	nr		= 1;
	condition	= Info_Mod_Brody_WhoAreYou_Condition;
	information	= Info_Mod_Brody_WhoAreYou_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was machst du hier?";
};

FUNC INT Info_Mod_Brody_WhoAreYou_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brody_Hi))
	&& (Mod_BrodyQuest == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brody_WhoAreYou_Info()
{
	B_Say	(hero, self, "$WASMACHSTDUHIER");

	AI_Output(self, hero, "Info_Mod_Brody_WhoAreYou_09_01"); //Ich bin ein Wüstenpirat.

	AI_DrawWeapon	(hero);

	AI_Output(self, hero, "Info_Mod_Brody_WhoAreYou_09_02"); //(eilig) Nein, nein, ich tue dir nichts. Bin doch viel zu schwach dazu.

	AI_RemoveWeapon	(hero);

	AI_Output(self, hero, "Info_Mod_Brody_WhoAreYou_09_03"); //Ich war Mitglied einer ganzen Gruppe. Unser Lager war dort hinten, gegenüber vom Tempel.
	AI_Output(self, hero, "Info_Mod_Brody_WhoAreYou_09_04"); //Unsere Lieblingsbeschäftigung war es, die Piraten zu ärgern.
	AI_Output(self, hero, "Info_Mod_Brody_WhoAreYou_09_05"); //Wir haben ihnen Essen und Plunder geklaut, Boote zerstört, vor Gregs Hütte gespuckt und in ihren Grog gepinkelt.
	AI_Output(self, hero, "Info_Mod_Brody_WhoAreYou_09_06"); //Eines Nachts wurde ich von einem Schrei geweckt.
	AI_Output(self, hero, "Info_Mod_Brody_WhoAreYou_09_07"); //Diese Sumpfratten von Piraten hatten unser Lager entdeckt und meuchelten einen nach dem anderen von uns ab!
	AI_Output(self, hero, "Info_Mod_Brody_WhoAreYou_09_08"); //Ich entkam als Einziger, ohne Ausrüstung, ohne was zu saufen. Und seitdem brate ich hier.
	AI_Output(self, hero, "Info_Mod_Brody_WhoAreYou_09_09"); //Raus aus dem Canyon komme ich nicht. Die Berge sind zu hoch und der Ausgang, den ich kenne, wird ständig bewacht.

	Log_CreateTopic	(TOPIC_MOD_BRODY_CANYON, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BRODY_CANYON, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BRODY_CANYON, "Brody, ein Wüstenpirat, sitzt im Canyon und kennt nur einen Weg hinaus. Gibt es keinen anderen?");
};

INSTANCE Info_Mod_Brody_AndererWeg (C_INFO)
{
	npc		= Mod_7293_OUT_Brody_AW;
	nr		= 1;
	condition	= Info_Mod_Brody_AndererWeg_Condition;
	information	= Info_Mod_Brody_AndererWeg_Info;
	permanent	= 0;
	important	= 0;
	description	= "Es gibt noch einen anderen Weg aus dem Canyon.";
};

FUNC INT Info_Mod_Brody_AndererWeg_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brody_WhoAreYou))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brody_AndererWeg_Info()
{
	AI_Output(hero, self, "Info_Mod_Brody_AndererWeg_15_00"); //Es gibt noch einen anderen Weg aus dem Canyon.
	AI_Output(self, hero, "Info_Mod_Brody_AndererWeg_09_01"); //Wirklich? Wo?
	AI_Output(hero, self, "Info_Mod_Brody_AndererWeg_15_02"); //Es handelt sich um eine Teleport-Plattform. Ich führe dich hin.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};

INSTANCE Info_Mod_Brody_AmZiel (C_INFO)
{
	npc		= Mod_7293_OUT_Brody_AW;
	nr		= 1;
	condition	= Info_Mod_Brody_AmZiel_Condition;
	information	= Info_Mod_Brody_AmZiel_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brody_AmZiel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brody_AndererWeg))
	&& (Npc_GetDistToWP(hero, "ADW_CANYON_TELEPORT_PATH_01") < 600)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brody_AmZiel_Info()
{
	AI_Output(self, hero, "Info_Mod_Brody_AmZiel_09_00"); //Freundchen ... ich weiß gar nicht, wie ich dir danken kann.
	AI_Output(self, hero, "Info_Mod_Brody_AmZiel_09_01"); //Aber du hast Glück genug, dass ich nicht bei Kräften war, als du mich gefunden hast.
	AI_Output(self, hero, "Info_Mod_Brody_AmZiel_09_02"); //Dann hätte das Gespräch eine ganz andere Wendung genommen, glaub mir.
	AI_Output(self, hero, "Info_Mod_Brody_AmZiel_09_03"); //Mach's gut, und sei froh, wenn du nicht mehr von mir hörst!

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_BRODY_CANYON, "Ich habe Brody geholfen. Zum 'Dank' lässt er mich unbehelligt.");
	B_SetTopicStatus	(TOPIC_MOD_BRODY_CANYON, LOG_SUCCESS);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SAFE");
	self.aivar[AIV_PARTYMEMBER] = FALSE;

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Brody_FalscherWeg (C_INFO)
{
	npc		= Mod_7293_OUT_Brody_AW;
	nr		= 1;
	condition	= Info_Mod_Brody_FalscherWeg_Condition;
	information	= Info_Mod_Brody_FalscherWeg_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brody_FalscherWeg_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brody_AndererWeg))
	&& (Npc_GetDistToWP(hero, "ADW_PIRATECAMP_2_CANYON_01") < 2000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brody_FalscherWeg_Info()
{
	AI_Output(self, hero, "Info_Mod_Brody_FalscherWeg_09_00"); //Freundchen ... da geht's zum Piratenlager. Du willst mich denen wohl ausliefern.
	AI_Output(self, hero, "Info_Mod_Brody_FalscherWeg_09_01"); //Entweder du zeigst mir einen anderen Weg oder du wirst mächtig Ärger bekommen.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Brody_PechGehabt (C_INFO)
{
	npc		= Mod_7293_OUT_Brody_AW;
	nr		= 1;
	condition	= Info_Mod_Brody_PechGehabt_Condition;
	information	= Info_Mod_Brody_PechGehabt_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brody_PechGehabt_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brody_FalscherWeg))
	&& (Npc_GetDistToWP(hero, "ADW_PIRATECAMP_2_CANYON_01") < 1500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brody_PechGehabt_Info()
{
	AI_Output(self, hero, "Info_Mod_Brody_PechGehabt_09_00"); //Ich hab dich gewarnt.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SAFE");
	self.aivar[AIV_PARTYMEMBER] = FALSE;

	B_Attack	(self, hero, AR_Kill, 0);
};

INSTANCE Info_Mod_Brody_Heiltrank (C_INFO)
{
	npc		= Mod_7293_OUT_Brody_AW;
	nr		= 1;
	condition	= Info_Mod_Brody_Heiltrank_Condition;
	information	= Info_Mod_Brody_Heiltrank_Info;
	permanent	= 1;
	important	= 0;
	description	= "(Heiltrank geben)";
};

FUNC INT Info_Mod_Brody_Heiltrank_Condition()
{
	if (self.aivar[AIV_Partymember] == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brody_Heiltrank_Info()
{
	Info_ClearChoices	(Info_Mod_Brody_Heiltrank);

	Info_AddChoice	(Info_Mod_Brody_Heiltrank, DIALOG_BACK, Info_Mod_Brody_Heiltrank_BACK);

	if (Npc_HasItems(hero, ItPo_Health_Addon_04) >= 1)
	&& (self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX]-HP_Elixier)
	{
		Info_AddChoice	(Info_Mod_Brody_Heiltrank, "Essenz der Heilung", Info_Mod_Brody_Heiltrank_Health_04);
	};
	if (Npc_HasItems(hero, ItPo_Health_01) >= 3)
	&& (self.attribute[ATR_HITPOINTS] <= self.attribute[ATR_HITPOINTS_MAX]-HP_Elixier)
	{
		Info_AddChoice	(Info_Mod_Brody_Heiltrank, "Elixier der Heilung", Info_Mod_Brody_Heiltrank_Health_03);
	};
	if (Npc_HasItems(hero, ItPo_Health_02) >= 1)
	&& (self.attribute[ATR_HITPOINTS] <= self.attribute[ATR_HITPOINTS_MAX]-HP_Extrakt)
	{
		Info_AddChoice	(Info_Mod_Brody_Heiltrank, "Extrakt der Heilung", Info_Mod_Brody_Heiltrank_Health_02);
	};
	if (Npc_HasItems(hero, ItPo_Health_01) >= 1)
	&& (self.attribute[ATR_HITPOINTS] <= self.attribute[ATR_HITPOINTS_MAX]-HP_Essenz)
	{
		Info_AddChoice	(Info_Mod_Brody_Heiltrank, "Essenz der Heilung", Info_Mod_Brody_Heiltrank_Health_01);
	};
	if (Npc_HasItems(hero, ItPo_Health_07) >= 1)
	&& (self.attribute[ATR_HITPOINTS] <= self.attribute[ATR_HITPOINTS_MAX]-HP_06)
	{
		Info_AddChoice	(Info_Mod_Brody_Heiltrank, "Trank der leichten Heilung", Info_Mod_Brody_Heiltrank_Health_07);
	};
	if (Npc_HasItems(hero, ItPo_Health_06) >= 1)
	&& (self.attribute[ATR_HITPOINTS] <= self.attribute[ATR_HITPOINTS_MAX]-HP_06)
	{
		Info_AddChoice	(Info_Mod_Brody_Heiltrank, "Leichter Heiltrank", Info_Mod_Brody_Heiltrank_Health_06);
	};
	if (Npc_HasItems(hero, ItPo_Health_05) >= 1)
	&& (self.attribute[ATR_HITPOINTS] <= self.attribute[ATR_HITPOINTS_MAX]-HP_05)
	{
		Info_AddChoice	(Info_Mod_Brody_Heiltrank, "Trank der schnellen Heilung", Info_Mod_Brody_Heiltrank_Health_05);
	};
};

FUNC VOID Info_Mod_Brody_Heiltrank_BACK ()
{
	Info_ClearChoices	(Info_Mod_Brody_Heiltrank);
};

FUNC VOID Info_Mod_Brody_Heiltrank_Health_04 ()
{
	Info_ClearChoices	(Info_Mod_Brody_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_Addon_04, 1);

	B_UseItem	(self, ItPo_Health_Addon_04);
};

FUNC VOID Info_Mod_Brody_Heiltrank_Health_03 ()
{
	Info_ClearChoices	(Info_Mod_Brody_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_03, 1);

	B_UseItem	(self, ItPo_Health_03);
};

FUNC VOID Info_Mod_Brody_Heiltrank_Health_02 ()
{
	Info_ClearChoices	(Info_Mod_Brody_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_02, 1);

	B_UseItem	(self, ItPo_Health_02);
};

FUNC VOID Info_Mod_Brody_Heiltrank_Health_01 ()
{
	Info_ClearChoices	(Info_Mod_Brody_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_01, 1);

	B_UseItem	(self, ItPo_Health_01);
};

FUNC VOID Info_Mod_Brody_Heiltrank_Health_07 ()
{
	Info_ClearChoices	(Info_Mod_Brody_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_07, 1);

	B_UseItem	(self, ItPo_Health_07);
};

FUNC VOID Info_Mod_Brody_Heiltrank_Health_06 ()
{
	Info_ClearChoices	(Info_Mod_Brody_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_06, 1);

	B_UseItem	(self, ItPo_Health_06);
};

FUNC VOID Info_Mod_Brody_Heiltrank_Health_05 ()
{
	Info_ClearChoices	(Info_Mod_Brody_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_05, 1);

	B_UseItem	(self, ItPo_Health_05);
};

INSTANCE Info_Mod_Brody_EXIT (C_INFO)
{
	npc		= Mod_7293_OUT_Brody_AW;
	nr		= 1;
	condition	= Info_Mod_Brody_EXIT_Condition;
	information	= Info_Mod_Brody_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Brody_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Brody_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};