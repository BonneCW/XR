INSTANCE Info_Mod_Ranad_OC_Hi (C_INFO)
{
	npc		= Mod_10007_Orc_Ranad_OC;
	nr		= 1;
	condition	= Info_Mod_Ranad_OC_Hi_Condition;
	information	= Info_Mod_Ranad_OC_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ranad_OC_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ranad_OC_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Ranad_OC_Hi_18_00"); //Freund sein da. Gehen in großes Raum weit hinten in Stadt.
	AI_Output(hero, self, "Info_Mod_Ranad_OC_Hi_15_01"); //Wie komme ich dorthin?
	AI_Output(self, hero, "Info_Mod_Ranad_OC_Hi_18_02"); //Werden führen Freund.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "GUIDE");

	B_LogEntry	(TOPIC_MOD_FOKUSSUCHE, "Ranad hat am Eingang der Orkstadt auf mich gewartet und wird mich nun zu Hosh Pak führen.");
};

INSTANCE Info_Mod_Ranad_OC_AtHoshPak (C_INFO)
{
	npc		= Mod_10007_Orc_Ranad_OC;
	nr		= 1;
	condition	= Info_Mod_Ranad_OC_AtHoshPak_Condition;
	information	= Info_Mod_Ranad_OC_AtHoshPak_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ranad_OC_AtHoshPak_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ranad_OC_Hi))
	&& (Npc_GetDistToWP(self, "WP_OCC_35") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ranad_OC_AtHoshPak_Info()
{
	AI_Output(self, hero, "Info_Mod_Ranad_OC_AtHoshPak_18_00"); //Gleich Freund sein an Ziel. Ranad werden warten hier.
	AI_Output(hero, self, "Info_Mod_Ranad_OC_AtHoshPak_15_01"); //Wo soll ich hin?
	AI_Output(self, hero, "Info_Mod_Ranad_OC_AtHoshPak_18_02"); //Dort vorne sein Raum. Hosh Pak halten Ritual dort. Mensch müssen gehen und töten Hosh Pak.
	AI_Output(hero, self, "Info_Mod_Ranad_OC_AtHoshPak_15_03"); //Bin schon unterwegs.
	AI_Output(self, hero, "Info_Mod_Ranad_OC_AtHoshPak_18_04"); //Gut.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "WAITING");

	B_LogEntry	(TOPIC_MOD_FOKUSSUCHE, "Weiter kann Ranad mich nicht bringen. Aber der Weg ist nicht mehr weit.");
};

INSTANCE Info_Mod_Ranad_OC_HoshPakTot (C_INFO)
{
	npc		= Mod_10007_Orc_Ranad_OC;
	nr		= 1;
	condition	= Info_Mod_Ranad_OC_HoshPakTot_Condition;
	information	= Info_Mod_Ranad_OC_HoshPakTot_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ranad_OC_HoshPakTot_Condition()
{
	if ((Npc_KnowsInfo(hero, Info_Mod_HoshPak_OC_Hi))
	|| (Npc_IsDead(Mod_10005_Orc_HoshPak_OC)))
	&& (Npc_GetDistToWP(self, "WP_OCC_35") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ranad_OC_HoshPakTot_Info()
{
	AI_Output(self, hero, "Info_Mod_Ranad_OC_HoshPakTot_18_00"); //Freund haben gut gemacht. Hosh Pak sein tot.
	AI_Output(hero, self, "Info_Mod_Ranad_OC_HoshPakTot_15_01"); //Was passiert jetzt?
	AI_Output(self, hero, "Info_Mod_Ranad_OC_HoshPakTot_18_02"); //Freund müssen suchen restliche Fokusse und erfüllen seine Aufgabe.
	AI_Output(self, hero, "Info_Mod_Ranad_OC_HoshPakTot_18_03"); //Ranad werden bleiben hier und versuchen zu erlangen Bündnis zwischen Orks in Stadt und uns.

	AI_StopProcessInfos	(self);
};