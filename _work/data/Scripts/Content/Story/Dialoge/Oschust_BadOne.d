INSTANCE Info_Mod_Oschust_BadOne_Hi (C_INFO)
{
	npc		= Mod_7175_BDT_Oschust_MT;
	nr		= 1;
	condition	= Info_Mod_Oschust_BadOne_Hi_Condition;
	information	= Info_Mod_Oschust_BadOne_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Oschust_BadOne_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Oschust_BadOne_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Oschust_BadOne_Hi_04_00"); //Ergebt euch, legt eure Waffen nieder! Ihr seid umzingelt und habt keine Chance gegen diese Übermacht.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Oschust_BadOne_You (C_INFO)
{
	npc		= Mod_7175_BDT_Oschust_MT;
	nr		= 1;
	condition	= Info_Mod_Oschust_BadOne_You_Condition;
	information	= Info_Mod_Oschust_BadOne_You_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Oschust_BadOne_You_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Esteban_Unterlegen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Oschust_BadOne_You_Info()
{
	AI_Teleport	(Mod_948_BDT_Esteban_MT, "TOT");
	AI_Teleport	(Mod_955_BDT_Juan_MT, "TOT");
	AI_Teleport	(Mod_957_BDT_Logan_MT, "TOT");
	AI_Teleport	(Mod_958_BDT_Miguel_MT, "TOT");
	AI_Teleport	(Mod_964_BDT_Skinner_MT, "TOT");
	AI_Teleport	(Mod_4074_BDT_Bandit_MT, "TOT");
	AI_Teleport	(Mod_4075_BDT_Bandit_MT, "TOT");
	AI_Teleport	(Mod_790_BDT_Morgahard_MT, "TOT");

	AI_PlayAni	(hero, "T_SLEEPGROUND_2_STAND");

	Wld_StopEffect	("BLACK_SCREEN");

	AI_Output(self, hero, "Info_Mod_Oschust_BadOne_You_04_01"); //So, und nun zu dir.

	if (Npc_KnowsInfo(hero, Info_Mod_Dexter_OschustTot))
	{
		AI_Output(self, hero, "Info_Mod_Oschust_BadOne_You_04_02"); //Ha, du dachtest wohl, du hättest mich erledigt.
		AI_Output(self, hero, "Info_Mod_Oschust_BadOne_You_04_03"); //Ich war jedoch nicht tot, nur schwer verwundet und der magische Stein, den ich von Hosh Pak erhalten hatte, sorgte dafür, dass sich meine Wunden schlossen.
		AI_Output(self, hero, "Info_Mod_Oschust_BadOne_You_04_04"); //Hast du noch was zu sagen, bevor ich dir mit meinen behaarten Freunden hier einen schmerzhaften Tod bereite?
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Oschust_BadOne_You_04_05"); //So, mein Freund, jetzt wirst du für die Schläge büßen. Hast du noch was zu sagen, bevor ich dir mit meinen behaarten Freunden den Garaus mache?
	};

	B_LogEntry	(TOPIC_MOD_BDT_ORKS, "Es war ein Hinterhalt. Oschust hat uns an die Orks verraten und die anderen Banditen gefangen genommen. Ich sollte Dexter davon berichten.");
};

INSTANCE Info_Mod_Oschust_BadOne_Trophies (C_INFO)
{
	npc		= Mod_7175_BDT_Oschust_MT;
	nr		= 1;
	condition	= Info_Mod_Oschust_BadOne_Trophies_Condition;
	information	= Info_Mod_Oschust_BadOne_Trophies_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wieder ein paar Trophäen mehr für meine Sammlung.";
};

FUNC INT Info_Mod_Oschust_BadOne_Trophies_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Oschust_BadOne_You))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Oschust_BadOne_Trophies_Info()
{
	AI_Output(hero, self, "Info_Mod_Oschust_BadOne_Trophies_15_00"); //Wieder ein paar Trophäen mehr für meine Sammlung.
	AI_Output(self, hero, "Info_Mod_Oschust_BadOne_Trophies_04_01"); //Du dreister ... los, haut ihn in Stücke.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
	B_StartOtherRoutine	(Mod_948_BDT_Esteban_MT, "TOT");
	B_StartOtherRoutine	(Mod_955_BDT_Juan_MT, "TOT");
	B_StartOtherRoutine	(Mod_957_BDT_Logan_MT, "TOT");
	B_StartOtherRoutine	(Mod_958_BDT_Miguel_MT, "TOT");
	B_StartOtherRoutine	(Mod_964_BDT_Skinner_MT, "TOT");
	B_StartOtherRoutine	(Mod_4074_BDT_Bandit_MT, "TOT");
	B_StartOtherRoutine	(Mod_4075_BDT_Bandit_MT, "TOT");
	B_StartOtherRoutine	(Mod_790_BDT_Morgahard_MT, "TOT");

	B_Attack	(self, hero, AR_Kill, 0);
};

INSTANCE Info_Mod_Oschust_BadOne_Gnade (C_INFO)
{
	npc		= Mod_7175_BDT_Oschust_MT;
	nr		= 1;
	condition	= Info_Mod_Oschust_BadOne_Gnade_Condition;
	information	= Info_Mod_Oschust_BadOne_Gnade_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bitte verschone mich.";
};

FUNC INT Info_Mod_Oschust_BadOne_Gnade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Oschust_BadOne_You))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Oschust_BadOne_Gnade_Info()
{
	AI_Output(hero, self, "Info_Mod_Oschust_BadOne_Gnade_15_00"); //Bitte verschone mich.
	AI_Output(self, hero, "Info_Mod_Oschust_BadOne_Gnade_04_01"); //(lacht böse) Ha, dein Gewinsel hilft dir jetzt auch nicht mehr. Du bist nur ein Stück Dreck, das wir beseitigen, ehe wir das Banditenlager endgültig vernichten und uns das Amulett von den Magiern wiederholen.
	AI_Output(self, hero, "Info_Mod_Oschust_BadOne_Gnade_04_02"); //Und die gefangenen Banditen wird ein nicht minder schlimmes Schicksal erwarten ... aber genug der Worte. Los, weidet ihn aus.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
	B_StartOtherRoutine	(Mod_948_BDT_Esteban_MT, "TOT");
	B_StartOtherRoutine	(Mod_955_BDT_Juan_MT, "TOT");
	B_StartOtherRoutine	(Mod_957_BDT_Logan_MT, "TOT");
	B_StartOtherRoutine	(Mod_958_BDT_Miguel_MT, "TOT");
	B_StartOtherRoutine	(Mod_964_BDT_Skinner_MT, "TOT");
	B_StartOtherRoutine	(Mod_4074_BDT_Bandit_MT, "TOT");
	B_StartOtherRoutine	(Mod_4075_BDT_Bandit_MT, "TOT");
	B_StartOtherRoutine	(Mod_790_BDT_Morgahard_MT, "TOT");

	B_Attack	(self, hero, AR_Kill, 0);
};

INSTANCE Info_Mod_Oschust_BadOne_Plan (C_INFO)
{
	npc		= Mod_7175_BDT_Oschust_MT;
	nr		= 1;
	condition	= Info_Mod_Oschust_BadOne_Plan_Condition;
	information	= Info_Mod_Oschust_BadOne_Plan_Info;
	permanent	= 0;
	important	= 0;
	description	= "Würdest du mich noch vorher in deine weiteren Pläne einweihen?";
};

FUNC INT Info_Mod_Oschust_BadOne_Plan_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Oschust_BadOne_You))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Oschust_BadOne_Plan_Info()
{
	AI_Output(hero, self, "Info_Mod_Oschust_BadOne_Plan_15_00"); //Würdest du mich noch vorher in deine weiteren Pläne einweihen?
	AI_Output(self, hero, "Info_Mod_Oschust_BadOne_Plan_04_01"); //(lacht böse) Ha, da du ohnehin gleich stirbst ... Wir machen das Banditenlager dem Erdboden gleich und holen uns das Amulett mit Gewalt von den Magiern.
	AI_Output(self, hero, "Info_Mod_Oschust_BadOne_Plan_04_02"); //Tja, und die gefangenen Banditen werden bei einem netten Ritual geopfert. Sei froh, dass dir dieses Schicksal erspart bleibt (lacht böse).
	AI_Output(self, hero, "Info_Mod_Oschust_BadOne_Plan_04_03"); //Nun aber genug der Worte. Deinem zerfetzten Körper werde ich die neugierigen Ohren als Trophäen abschneiden. Los, zerfleischt ihn.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
	B_StartOtherRoutine	(Mod_948_BDT_Esteban_MT, "TOT");
	B_StartOtherRoutine	(Mod_955_BDT_Juan_MT, "TOT");
	B_StartOtherRoutine	(Mod_957_BDT_Logan_MT, "TOT");
	B_StartOtherRoutine	(Mod_958_BDT_Miguel_MT, "TOT");
	B_StartOtherRoutine	(Mod_964_BDT_Skinner_MT, "TOT");
	B_StartOtherRoutine	(Mod_4074_BDT_Bandit_MT, "TOT");
	B_StartOtherRoutine	(Mod_4075_BDT_Bandit_MT, "TOT");
	B_StartOtherRoutine	(Mod_790_BDT_Morgahard_MT, "TOT");

	B_Attack	(self, hero, AR_Kill, 0);
};

INSTANCE Info_Mod_Oschust_BadOne_Billig (C_INFO)
{
	npc		= Mod_7175_BDT_Oschust_MT;
	nr		= 1;
	condition	= Info_Mod_Oschust_BadOne_Billig_Condition;
	information	= Info_Mod_Oschust_BadOne_Billig_Info;
	permanent	= 0;
	important	= 0;
	description	= "Tief gesunken, sich an die Orks zu verkaufen ...";
};

FUNC INT Info_Mod_Oschust_BadOne_Billig_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Oschust_BadOne_You))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Oschust_BadOne_Billig_Info()
{
	AI_Output(hero, self, "Info_Mod_Oschust_BadOne_Billig_15_00"); //Tief gesunken, sich an die Orks zu verkaufen ...
	AI_Output(self, hero, "Info_Mod_Oschust_BadOne_Billig_04_01"); //Ha, zu einem guten Preis jedoch. Die Orks haben mich mit Magie, Gold und mächtigen Artefakten würdig entlohnt.
	AI_Output(self, hero, "Info_Mod_Oschust_BadOne_Billig_04_02"); //Mit den stärksten Kämpfern kann ich mich jetzt messen. Und meine Klinge wird es auch sein, die dir deine Eingeweide heraustrennt.
	AI_Output(self, hero, "Info_Mod_Oschust_BadOne_Billig_04_03"); //Los, machen wir ihn fertig.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
	B_StartOtherRoutine	(Mod_948_BDT_Esteban_MT, "TOT");
	B_StartOtherRoutine	(Mod_955_BDT_Juan_MT, "TOT");
	B_StartOtherRoutine	(Mod_957_BDT_Logan_MT, "TOT");
	B_StartOtherRoutine	(Mod_958_BDT_Miguel_MT, "TOT");
	B_StartOtherRoutine	(Mod_964_BDT_Skinner_MT, "TOT");
	B_StartOtherRoutine	(Mod_4074_BDT_Bandit_MT, "TOT");
	B_StartOtherRoutine	(Mod_4075_BDT_Bandit_MT, "TOT");
	B_StartOtherRoutine	(Mod_790_BDT_Morgahard_MT, "TOT");

	B_Attack	(self, hero, AR_Kill, 0);
	B_Attack	(Mod_10021_ORC_Elite_MT, hero, AR_Kill, 0);
	B_Attack	(Mod_10022_ORC_Elite_MT, hero, AR_Kill, 0);
	B_Attack	(Mod_10029_Orc_Warrior_MT, hero, AR_Kill, 0);
	B_Attack	(Mod_10030_Orc_Warrior_MT, hero, AR_Kill, 0);
	B_Attack	(Mod_10031_Orc_Warrior_MT, hero, AR_Kill, 0);
};