INSTANCE Info_Mod_HalbinfernalischerRandolph_Hi (C_INFO)
{
	npc		= Mod_7174_DEM_Randolph_NW;
	nr		= 1;
	condition	= Info_Mod_HalbinfernalischerRandolph_Hi_Condition;
	information	= Info_Mod_HalbinfernalischerRandolph_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HalbinfernalischerRandolph_Hi_Condition()
{
	if (Mod_Randolph_Started == 11)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HalbinfernalischerRandolph_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_HalbinfernalischerRandolph_Hi_06_00"); //Wen haben wir denn hier.
	AI_Output(hero, self, "Info_Mod_HalbinfernalischerRandolph_Hi_15_01"); //Randolph bist du es?
	AI_Output(self, hero, "Info_Mod_HalbinfernalischerRandolph_Hi_06_02"); //Randolph? Sprichst du von diesem armseligen Landarbeiter? Nein, er war einmal.
	AI_Output(self, hero, "Info_Mod_HalbinfernalischerRandolph_Hi_06_03"); //Durch die Macht meines neuen Gebieters ist aus ihm mehr erwachsen.
	AI_Output(self, hero, "Info_Mod_HalbinfernalischerRandolph_Hi_06_04"); //Ein machtvolles Werkzeug, das seinem Meister helfen wird, in nicht allzu ferner Zeit den Platz einzunehmen, der ihm gebührt.
	AI_Output(self, hero, "Info_Mod_HalbinfernalischerRandolph_Hi_06_05"); //Und zum guten Anfang werde ich mit meinen Dämonen diesen Landstrich hier unterwerfen.
};

INSTANCE Info_Mod_HalbinfernalischerRandolph_Kill (C_INFO)
{
	npc		= Mod_7174_DEM_Randolph_NW;
	nr		= 1;
	condition	= Info_Mod_HalbinfernalischerRandolph_Kill_Condition;
	information	= Info_Mod_HalbinfernalischerRandolph_Kill_Info;
	permanent	= 0;
	important	= 0;
	description	= "Nicht, wenn ich es verhindern kann, du Ausgeburt eines Dämonen.";
};

FUNC INT Info_Mod_HalbinfernalischerRandolph_Kill_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HalbinfernalischerRandolph_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HalbinfernalischerRandolph_Kill_Info()
{
	AI_Output(hero, self, "Info_Mod_HalbinfernalischerRandolph_Kill_15_00"); //Nicht, wenn ich es verhindern kann, du Ausgeburt eines Dämonen.
	AI_Output(self, hero, "Info_Mod_HalbinfernalischerRandolph_Kill_06_01"); //Wuahaha, eilig hast du es den Tod zu erleiden. Komm her. Ich reiße dich in Stücke.

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_GuildEnemy, 0);
};

INSTANCE Info_Mod_HalbinfernalischerRandolph_SecondChance (C_INFO)
{
	npc		= Mod_7174_DEM_Randolph_NW;
	nr		= 1;
	condition	= Info_Mod_HalbinfernalischerRandolph_SecondChance_Condition;
	information	= Info_Mod_HalbinfernalischerRandolph_SecondChance_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HalbinfernalischerRandolph_SecondChance_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HalbinfernalischerRandolph_Kill))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HalbinfernalischerRandolph_SecondChance_Info()
{
	AI_Output(self, hero, "Info_Mod_HalbinfernalischerRandolph_SecondChance_06_00"); //Du Narr. Du hättest mich töten sollen, als du die Gelegenheit dazu hattest. Damit hast du deinen Untergang besiegelt.

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Kill, 0);
};

INSTANCE Info_Mod_HalbinfernalischerRandolph_GoodOne (C_INFO)
{
	npc		= Mod_7174_DEM_Randolph_NW;
	nr		= 1;
	condition	= Info_Mod_HalbinfernalischerRandolph_GoodOne_Condition;
	information	= Info_Mod_HalbinfernalischerRandolph_GoodOne_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bist du dir sicher, dass nicht ein Teil des guten (...)";
};

FUNC INT Info_Mod_HalbinfernalischerRandolph_GoodOne_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HalbinfernalischerRandolph_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HalbinfernalischerRandolph_GoodOne_Info()
{
	AI_Output(hero, self, "Info_Mod_HalbinfernalischerRandolph_GoodOne_15_00"); //Bist du dir sicher, dass nicht ein Teil des guten, alten Randolphs immer noch in dir existiert?
	AI_Output(hero, self, "Info_Mod_HalbinfernalischerRandolph_GoodOne_15_01"); //Besinne dich, wer du bist, der schönen Tage auf dem Hof, der Werke des Guten, die du verrichtet hast und nicht dieser hier, der Zerstörung.
	AI_Output(self, hero, "Info_Mod_HalbinfernalischerRandolph_GoodOne_06_02"); //Buah, sei still du einfältiger Narr und mach, dass du weg kommst! Dieses Mal will ich dich noch verschonen.
	AI_Output(self, hero, "Info_Mod_HalbinfernalischerRandolph_GoodOne_06_03"); //Aber bei unserer nächsten Begegnung werde ich dich erbarmungslos in Stücke hauen.

	B_LogEntry	(TOPIC_MOD_AKIL_RANDOLPH, "Randolph scheint jetzt endgültig von dämonischen Mächten verzehrt. Vielleicht weiß Xardas Rat ... sonst werde ich ihn wohl töten müssen.");

	AI_StopProcessInfos	(self);
};