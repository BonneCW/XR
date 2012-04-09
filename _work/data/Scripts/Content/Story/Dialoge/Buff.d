INSTANCE Info_Mod_Buff_Hi (C_INFO)
{
	npc		= Mod_7359_OUT_Buff_WS;
	nr		= 1;
	condition	= Info_Mod_Buff_Hi_Condition;
	information	= Info_Mod_Buff_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bist du Buff?";
};

FUNC INT Info_Mod_Buff_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Setta_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Buff_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Buff_Hi_15_00"); //Bist du Buff?
	AI_Output(self, hero, "Info_Mod_Buff_Hi_06_01"); //Ja, der bin ich. Was kann ein alter Mann wie ich es bin für dich tun?
	AI_Output(hero, self, "Info_Mod_Buff_Hi_15_02"); //Ich will raus aus diesem Tal.
	AI_Output(self, hero, "Info_Mod_Buff_Hi_06_03"); //(lacht laut) HAHAHA! Aus diesem Tal gibt es kein Entkommen.
	AI_Output(self, hero, "Info_Mod_Buff_Hi_06_04"); //Wir haben hier zwar einen Teleporter, aber der funktioniert nicht.
	AI_Output(hero, self, "Info_Mod_Buff_Hi_15_05"); //Wo ist der Teleporter?
	AI_Output(self, hero, "Info_Mod_Buff_Hi_06_06"); //In einer Höhle den Weg runter. Aber du findest dort nur Fleischwanzen.
	AI_Output(hero, self, "Info_Mod_Buff_Hi_15_07"); //Wir werden ja sehen.
	AI_Output(self, hero, "Info_Mod_Buff_Hi_06_08"); //Wenn du da bist, kannst du mir dann eine handvoll Dunkelpilze mitbringen?
	AI_Output(self, hero, "Info_Mod_Buff_Hi_06_09"); //Fünf sollten genügen. Ich will daraus eine Pilzsuppe machen.
	AI_Output(hero, self, "Info_Mod_Buff_Hi_15_10"); //Klar.
	AI_Output(self, hero, "Info_Mod_Buff_Hi_06_11"); //Vielen Dank. Meine Beine sind so schwach, dass ich das ganze Gerenne nicht mehr schaffe.

	B_LogEntry	(TOPIC_MOD_TURENDIL_GOLEM, "Es gibt in diesem Tal einen Teleporter! Den sollte ich mir mal ansehen. Er befindet sich in einer nahe gelegenen Höhle.");
	B_LogEntry	(TOPIC_MOD_TURENDIL_GOLEM, "Ich soll dem alten Buff fünf Dunkelpilze mitbringen.");
};

INSTANCE Info_Mod_Buff_Pilze (C_INFO)
{
	npc		= Mod_7359_OUT_Buff_WS;
	nr		= 1;
	condition	= Info_Mod_Buff_Pilze_Condition;
	information	= Info_Mod_Buff_Pilze_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe die Pilze gefunden.";
};

FUNC INT Info_Mod_Buff_Pilze_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Buff_Hi))
	&& (Npc_HasItems(hero, ItPl_Mushroom_01) >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Buff_Pilze_Info()
{
	AI_Output(hero, self, "Info_Mod_Buff_Pilze_15_00"); //Ich habe die Pilze gefunden. Hier hast du sie.

	B_GiveInvItems	(hero, self, ItPl_Mushroom_01, 5);

	AI_Output(self, hero, "Info_Mod_Buff_Pilze_06_01"); //Vielen Dank. Hier, nimm einen Teller Suppe.

	B_GiveInvItems	(self, hero, ItFo_Pilzsuppe, 1);

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_TURENDIL_GOLEM, "Ich habe Buff die Pilze gebracht.");
};

INSTANCE Info_Mod_Buff_TeleportSockel (C_INFO)
{
	npc		= Mod_7359_OUT_Buff_WS;
	nr		= 1;
	condition	= Info_Mod_Buff_TeleportSockel_Condition;
	information	= Info_Mod_Buff_TeleportSockel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Neben dem Teleporter ist ein Sockel. Den hast du nicht erwähnt.";
};

FUNC INT Info_Mod_Buff_TeleportSockel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Buff_Hi))
	&& (Mod_VMG_TeleporterEntdeckt == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Buff_TeleportSockel_Info()
{
	AI_Output(hero, self, "Info_Mod_Buff_TeleportSockel_15_00"); //Neben dem Teleporter ist ein Sockel. Den hast du nicht erwähnt.
	AI_Output(self, hero, "Info_Mod_Buff_TeleportSockel_06_01"); //Spielt das denn eine Rolle?
	AI_Output(hero, self, "Info_Mod_Buff_TeleportSockel_15_02"); //Ja, ich habe einen Aufladestein bei mir. Der könnte passen.
	AI_Output(self, hero, "Info_Mod_Buff_TeleportSockel_06_03"); //Wieso hast du das nicht gleich gesagt? Endlich gibt es Hoffnung!
	AI_Output(self, hero, "Info_Mod_Buff_TeleportSockel_06_04"); //Hier, nimm diese magischen Samen.

	B_GiveInvItems	(self, hero, ItMi_MagicSamen, 1);

	AI_Output(self, hero, "Info_Mod_Buff_TeleportSockel_06_05"); //Streue sie einfach um den Sockel. Vielleicht hilft das.
	AI_Output(hero, self, "Info_Mod_Buff_TeleportSockel_15_06"); //Danke, ich versuche das Portal zu aktivieren.
	AI_Output(self, hero, "Info_Mod_Buff_TeleportSockel_06_07"); //Trödel nicht!

	B_LogEntry	(TOPIC_MOD_TURENDIL_GOLEM, "Ich habe von Buff magische Samen bekommen, die ich um den Sockel streuen soll. Danach muss ich wohl den Aufladestein einsetzen.");
};

INSTANCE Info_Mod_Buff_EXIT (C_INFO)
{
	npc		= Mod_7359_OUT_Buff_WS;
	nr		= 1;
	condition	= Info_Mod_Buff_EXIT_Condition;
	information	= Info_Mod_Buff_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Buff_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Buff_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};