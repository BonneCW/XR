INSTANCE Info_Mod_Urnol_Hi (C_INFO)
{
	npc		= Mod_7036_NONE_Pilger_NW;
	nr		= 1;
	condition	= Info_Mod_Urnol_Hi_Condition;
	information	= Info_Mod_Urnol_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Urnol_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_DunklerPilger))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Urnol_Hi_Info()
{
	Wld_PlayEffect("DEMENTOR_FX",  self, self, 0, 0, 0, FALSE );
	Wld_PlayEffect("spellFX_Fear",  self, self, 0, 0, 0, FALSE );

	AI_UnequipArmor	(self);
	Npc_RemoveInvItems	(self, ItAr_Dementor, 1);
	CreateInvItems	(self, ItAr_Pal_Skel, 1);
	AI_EquipBestArmor	(self);

	Mod_UrnolBS = TRUE;
	
	AI_Output(self, hero, "Info_Mod_Urnol_Hi_14_00"); //Ahh, da bist du ja. Ich habe dich bereits erwartet.
	AI_Output(hero, self, "Info_Mod_Urnol_Hi_15_01"); //Was?! Wer bist du?
	AI_Output(self, hero, "Info_Mod_Urnol_Hi_14_02"); //Ich bin Urnol, ein Gesandter meines Meisters, der kommen wird, dich zu töten.
	AI_Output(hero, self, "Info_Mod_Urnol_Hi_15_03"); //Und wer ist dein Meister? Doch nicht etwa der Schläfer?
	AI_Output(self, hero, "Info_Mod_Urnol_Hi_14_04"); //Der Schläfer ist nicht mein Meister, er war nur einer seiner Diener.
	AI_Output(hero, self, "Info_Mod_Urnol_Hi_15_05"); //Aber wer ist dann dein Meister? Der Gott der Finsternis, Beliar?!
	AI_Output(self, hero, "Info_Mod_Urnol_Hi_14_06"); //(lacht) Nein, du irrst Mensch. Aber das wirst du noch früh genug erfahren!
	AI_Output(hero, self, "Info_Mod_Urnol_Hi_15_07"); //Aber warum will dein Meister mich töten?
	AI_Output(self, hero, "Info_Mod_Urnol_Hi_14_08"); //Du hast einen seiner Diener verbannt, wie auch das magische Gefängnis zerstört, in welchem er mit dem Erz unter seiner Kontrolle eine Streitmacht erschaffen wollte, ganz Khorinis zu knechten.
	AI_Output(hero, self, "Info_Mod_Urnol_Hi_15_09"); //Und wieso ist dein Meister nicht hier? Warum hat er dich überhaupt geschickt?
	AI_Output(self, hero, "Info_Mod_Urnol_Hi_14_10"); //(lacht) Viele Fragen hast du, Mensch ... und manche bleiben vorerst unbeantwortet.
	AI_Output(self, hero, "Info_Mod_Urnol_Hi_14_11"); //(lacht gehässig) Hahaha, du wirst sterben, Mensch.

	B_StartOtherRoutine	(self, "TOT");
};

INSTANCE Info_Mod_Urnol_WerBistDu (C_INFO)
{
	npc		= Mod_7036_NONE_Pilger_NW;
	nr		= 1;
	condition	= Info_Mod_Urnol_WerBistDu_Condition;
	information	= Info_Mod_Urnol_WerBistDu_Info;
	permanent	= 0;
	important	= 0;
	description	= "ENDE";
};

FUNC INT Info_Mod_Urnol_WerBistDu_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Urnol_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Urnol_WerBistDu_Info()
{
	AI_StopProcessInfos	(self);

	AI_Teleport	(self, "TOT");

	Wld_StopEffect	("DEMENTOR_FX");

	B_LogEntry	(TOPIC_MOD_DIEBEDROHUNG, "Ein gewisser Schattenlord Urnol hat mir erzählt, dass sein Meister aus seinem Reich zurückkehren wird, um mich zu töten. Er begründet das damit, dass ich den Schläfer, einen seiner Diener, getötet habe. Ich sollte Xardas davon berichten.");
	B_SetTopicStatus	(TOPIC_MOD_DUNKLERPILGER, LOG_SUCCESS);
};

INSTANCE Info_Mod_Urnol_Daemonisch (C_INFO)
{
	npc		= Mod_7422_NONE_Frau_NW;
	nr		= 1;
	condition	= Info_Mod_Urnol_Daemonisch_Condition;
	information	= Info_Mod_Urnol_Daemonisch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Urnol_Daemonisch_Condition()
{
	if (Mod_HQ_Daemonisch == 9)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Urnol_Daemonisch_Info()
{
	AI_Output(self, hero, "Info_Mod_Urnol_Daemonisch_14_00"); //Was, du hier? Verflucht, meine Tarnung aufgeflogen, die Seelenpeiniger fast alle gebannt, die Besessenen geheilt. Das wirst du büssen.
	AI_Output(hero, self, "Info_Mod_Urnol_Daemonisch_15_01"); //Tja, scheint so, als seien die Pläne deines Meisters wieder nicht aufgegangen.
	AI_Output(self, hero, "Info_Mod_Urnol_Daemonisch_14_02"); //Ja, spotte nur. Die Eroberung von Khorinis mag aufgeschoben sein ... mehr aber auch nicht.
	AI_Output(self, hero, "Info_Mod_Urnol_Daemonisch_14_03"); //Xeres besitzt genug Mittel und Wege sein Ziel zu erreichen ... Und ich werde seine Armeen befehligen. Wie sehen uns wieder.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
	AI_Teleport	(self, "TOT");

	B_GivePlayerXP	(200);

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Urnols Tarnung ist aufgeflogen ... auch, wenn ich jemand anderen in Verdacht hatte. Er dürfte sich wieder ins Minental verdrückt haben und ich kann Xardas von meinem Erfolg berichten.");
};