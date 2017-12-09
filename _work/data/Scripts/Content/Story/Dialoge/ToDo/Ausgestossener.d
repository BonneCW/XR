INSTANCE Info_Mod_Ausgestossener_Hi (C_INFO)
{
	npc		= Mod_7716_OUT_Ausgestossener_EIS;
	nr		= 1;
	condition	= Info_Mod_Ausgestossener_Hi_Condition;
	information	= Info_Mod_Ausgestossener_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ausgestossener_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ausgestossener_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Ausgestossener_Hi_08_00"); //(rau) Da geht sie dahin, deine Lolita. Ist mir auch mal passiert, früher.
	AI_Output(hero, self, "Info_Mod_Ausgestossener_Hi_15_01"); //Was willst du?
	AI_Output(self, hero, "Info_Mod_Ausgestossener_Hi_08_02"); //Gar nichts. Nur überleben.
	AI_Output(hero, self, "Info_Mod_Ausgestossener_Hi_15_03"); //Gut.
	AI_Output(self, hero, "Info_Mod_Ausgestossener_Hi_08_04"); //Wenn du uns drei Flaschen Wein und drei Brote gibst, sind wir ganz ruhig und tun dir nichts.
	AI_Output(hero, self, "Info_Mod_Ausgestossener_Hi_15_05"); //Das ist ja Erpressung.
	AI_Output(self, hero, "Info_Mod_Ausgestossener_Hi_08_06"); //Wie gesagt, wir wollen nur überleben.
};

INSTANCE Info_Mod_Ausgestossener_Murks (C_INFO)
{
	npc		= Mod_7716_OUT_Ausgestossener_EIS;
	nr		= 1;
	condition	= Info_Mod_Ausgestossener_Murks_Condition;
	information	= Info_Mod_Ausgestossener_Murks_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mit euch dreien werd ich doch noch fertig.";
};

FUNC INT Info_Mod_Ausgestossener_Murks_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ausgestossener_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ausgestossener_Murks_Info()
{
	AI_Output(hero, self, "Info_Mod_Ausgestossener_Murks_15_00"); //Mit euch dreien werd ich doch noch fertig.
	AI_Output(self, hero, "Info_Mod_Ausgestossener_Murks_08_01"); //Wir wollen keinen Kampf. Gib uns die Sachen und wir verziehen uns.
	AI_Output(hero, self, "Info_Mod_Ausgestossener_Murks_15_02"); //Keine Chance. Geht woanders betteln.
	AI_Output(self, hero, "Info_Mod_Ausgestossener_Murks_08_03"); //Es tut mir Leid, aber uns bleibt keine Wahl.

	AI_StopProcessInfos	(self);

	self.guild = GIL_STRF;
	Npc_SetTrueGuild (self, GIL_STRF);

	Mod_7717_OUT_Ausgestossener_EIS.guild = GIL_STRF;
	Npc_SetTrueGuild (Mod_7717_OUT_Ausgestossener_EIS, GIL_STRF);

	Mod_7718_OUT_Ausgestossener_EIS.guild = GIL_STRF;
	Npc_SetTrueGuild (Mod_7718_OUT_Ausgestossener_EIS, GIL_STRF);
};

INSTANCE Info_Mod_Ausgestossener_Gutmensch (C_INFO)
{
	npc		= Mod_7716_OUT_Ausgestossener_EIS;
	nr		= 1;
	condition	= Info_Mod_Ausgestossener_Gutmensch_Condition;
	information	= Info_Mod_Ausgestossener_Gutmensch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier habt ihr, was ihr braucht.";
};

FUNC INT Info_Mod_Ausgestossener_Gutmensch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ausgestossener_Hi))
	&& (Npc_HasItems(hero, ItFo_Bread) >= 3)
	&& (Npc_HasItems(hero, ItFo_Wine) >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ausgestossener_Gutmensch_Info()
{
	AI_Output(hero, self, "Info_Mod_Ausgestossener_Gutmensch_15_00"); //Hier habt ihr, was ihr braucht.

	Npc_RemoveInvItems	(hero, ItFo_Bread, 3);
	Npc_RemoveInvItems	(hero, ItFo_Wine, 3);

	AI_Output(self, hero, "Info_Mod_Ausgestossener_Gutmensch_08_01"); //Es gibt sie doch noch, wohlwollende Menschen. Ich wünsche weiterhin eine gute Reise.

	B_GivePlayerXP	(200);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
	B_StartOtherRoutine	(Mod_7717_OUT_Ausgestossener_EIS, "TOT");
	B_StartOtherRoutine	(Mod_7718_OUT_Ausgestossener_EIS, "TOT");
};

INSTANCE Info_Mod_Ausgestossener_Nix (C_INFO)
{
	npc		= Mod_7716_OUT_Ausgestossener_EIS;
	nr		= 1;
	condition	= Info_Mod_Ausgestossener_Nix_Condition;
	information	= Info_Mod_Ausgestossener_Nix_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab nichts dabei.";
};

FUNC INT Info_Mod_Ausgestossener_Nix_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ausgestossener_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ausgestossener_Nix_Info()
{
	AI_Output(hero, self, "Info_Mod_Ausgestossener_Nix_15_00"); //Ich hab nichts dabei.
	AI_Output(self, hero, "Info_Mod_Ausgestossener_Nix_08_01"); //Das haben wir schon oft zu hören gekriegt, aber dann gab es doch immer was zu holen.
	AI_Output(self, hero, "Info_Mod_Ausgestossener_Nix_08_02"); //(lauter) Los, Jungs, den durchsuchen wir mal!

	AI_StopProcessInfos	(self);

	self.guild = GIL_STRF;
	Npc_SetTrueGuild (self, GIL_STRF);

	Mod_7717_OUT_Ausgestossener_EIS.guild = GIL_STRF;
	Npc_SetTrueGuild (Mod_7717_OUT_Ausgestossener_EIS, GIL_STRF);

	Mod_7718_OUT_Ausgestossener_EIS.guild = GIL_STRF;
	Npc_SetTrueGuild (Mod_7718_OUT_Ausgestossener_EIS, GIL_STRF);
};