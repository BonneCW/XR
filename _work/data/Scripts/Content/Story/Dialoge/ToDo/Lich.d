INSTANCE Info_Mod_Lich_Hi (C_INFO)
{
	npc		= Lich_11008_NW;
	nr		= 1;
	condition	= Info_Mod_Lich_Hi_Condition;
	information	= Info_Mod_Lich_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lich_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Lich_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Lich_Hi_10_00"); //Hahaha, ein weiterer Besucher, der meiner Gefolgschaft aus Untoten beitreten kann.
	AI_Output(self, hero, "Info_Mod_Lich_Hi_10_01"); //Mich erledigen?! Dazu braucht es sehr viel ... und gleichzeitig so wenig.
	AI_Output(self, hero, "Info_Mod_Lich_Hi_10_02"); //Aber in wenigen Sekunden wirst du dir darüber nicht mehr den Kopf zerbrechen müssen.

	Wld_SendTrigger	("LICHDUNGEON");

	AI_StopProcessInfos	(self);

	Mod_7290_PAL_Athos_NW.guild = GIL_STRF;
	Npc_SetTrueGuild	(Mod_7290_PAL_Athos_NW, GIL_STRF);

	Mod_7291_PAL_Aramis_NW.guild = GIL_STRF;
	Npc_SetTrueGuild	(Mod_7291_PAL_Aramis_NW, GIL_STRF);

	Mod_7292_PAL_Porthos_NW.guild = GIL_STRF;
	Npc_SetTrueGuild	(Mod_7292_PAL_Porthos_NW, GIL_STRF);

	Npc_SendPassivePerc	(hero, PERC_ASSESSPLAYER, hero, hero);

	Wld_InsertNpc	(Kobold, "NW_TROLLAREA_TROLLROCKCAVE_06");
	Wld_InsertNpc	(Kobold, "NW_TROLLAREA_TROLLROCKCAVE_06");
	Wld_InsertNpc	(Kobold, "NW_TROLLAREA_TROLLROCKCAVE_06");
};

INSTANCE Info_Mod_Lich_PalasTot (C_INFO)
{
	npc		= Lich_11008_NW;
	nr		= 1;
	condition	= Info_Mod_Lich_PalasTot_Condition;
	information	= Info_Mod_Lich_PalasTot_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lich_PalasTot_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lich_Hi))
	&& (Npc_IsDead(Mod_7290_PAL_Athos_NW))
	&& (Npc_IsDead(Mod_7291_PAL_Aramis_NW))
	&& (Npc_IsDead(Mod_7292_PAL_Porthos_NW))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lich_PalasTot_Info()
{
	AI_Output(self, hero, "Info_Mod_Lich_PalasTot_10_00"); //Du erstaunst mich. Und es erfreut mich umso mehr, einen Kämpfer wie dich alsbald meinen Diener nennen zu können.

	AI_StopProcessInfos	(self);

	Wld_InsertNpc	(Blutgolem, "LICH");
};

INSTANCE Info_Mod_Lich_Blutgolem (C_INFO)
{
	npc		= Lich_11008_NW;
	nr		= 1;
	condition	= Info_Mod_Lich_Blutgolem_Condition;
	information	= Info_Mod_Lich_Blutgolem_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lich_Blutgolem_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lich_PalasTot))
	&& (Npc_IsDead(Blutgolem))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lich_Blutgolem_Info()
{
	AI_Output(self, hero, "Info_Mod_Lich_Blutgolem_10_00"); //Lästig wirst du mir allmählich. Dann muss ich die Sache selbst in die Hand nehmen.

	self.flags = 0;

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Kill, 0);
};

INSTANCE Info_Mod_Lich_Unbesiegbar (C_INFO)
{
	npc		= Lich_11008_NW;
	nr		= 1;
	condition	= Info_Mod_Lich_Unbesiegbar_Condition;
	information	= Info_Mod_Lich_Unbesiegbar_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lich_Unbesiegbar_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lich_Blutgolem))
	&& (Mod_NL_Lich == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lich_Unbesiegbar_Info()
{
	AI_Output(self, hero, "Info_Mod_Lich_Unbesiegbar_10_00"); //(lacht gehässig) Ha, du Narr glaubst mich mit schlichter Waffenkunst bezwingen zu können?!
	AI_Output(self, hero, "Info_Mod_Lich_Unbesiegbar_10_01"); //Lange genug habe ich mit dir gespielt, nun mache ich ernst.
	AI_Output(hero, self, "Info_Mod_Lich_Unbesiegbar_15_02"); //Verdammt, ich bin machtlos. Nichts wie weg.

	B_LogEntry	(TOPIC_MOD_NL_DRACHEN, "Mist, ich scheine diesem Lich nichts anhaben zu können. Was meinte er damit, um ihn zu bezwingen bräuchte man viel und doch wenig ...? Ich sollte wieder mal Xardas konsultieren ...");

	AI_StopProcessInfos	(self);

	self.flags = 2;

	AI_GotoWP	(hero, "NW_TROLLAREA_RITUALFOREST_04_MONSTER");
};

INSTANCE Info_Mod_Lich_Kamm (C_INFO)
{
	npc		= Lich_11008_NW;
	nr		= 1;
	condition	= Info_Mod_Lich_Kamm_Condition;
	information	= Info_Mod_Lich_Kamm_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lich_Kamm_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lich_Unbesiegbar))
	&& (Mod_NL_HasKamm == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lich_Kamm_Info()
{
	AI_Output(self, hero, "Info_Mod_Lich_Kamm_10_00"); //(mit schwacher Stimme) Wie?! Was hast du hier verlore ... (hält inne) Du warst es bestimmt, der meinen Kamm zerstört hat.
	AI_Output(self, hero, "Info_Mod_Lich_Kamm_10_01"); //Das wirst du noch bitter bereuen, eines Tages werde ich zurückkehren ...
	AI_Output(hero, self, "Info_Mod_Lich_Kamm_15_02"); //Das glaubst aber auch nur du.
	AI_Output(self, hero, "Info_Mod_Lich_Kamm_10_03"); //(gequält) Ahhh ...

	AI_StopProcessInfos	(self);
};