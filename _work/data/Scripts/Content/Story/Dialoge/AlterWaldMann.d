INSTANCE Info_Mod_AlterWaldMann_Hi (C_INFO)
{
	npc		= Mod_7529_OUT_AlterMann_REL;
	nr		= 1;
	condition	= Info_Mod_AlterWaldMann_Hi_Condition;
	information	= Info_Mod_AlterWaldMann_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_AlterWaldMann_Hi_Condition()
{
	if (Mod_IstKeiler == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_AlterWaldMann_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_AlterWaldMann_Hi_11_00"); //Ahh, hallo, dich habe ich hier noch nie gesehen ... du musst aus den Wäldern Khorinis stammen.
	AI_Output(self, hero, "Info_Mod_AlterWaldMann_Hi_11_01"); //Ist es da auch mittlerweile so unruhig geworden, wie hier?
	AI_Output(self, hero, "Info_Mod_AlterWaldMann_Hi_11_02"); //Keine Ruhe hat man vor Wilderern und Banditen mehr, vor Leuten, die rücksichtslos den Wald roden und plündern ...
	AI_Output(self, hero, "Info_Mod_AlterWaldMann_Hi_11_03"); //Hmm, es trifft sich gut, dass du hier erschienen bist.
	AI_Output(self, hero, "Info_Mod_AlterWaldMann_Hi_11_04"); //Du könntest hier über diesen Waldabschnitt wachen, während ich wieder einen anderen Platz aufsuchen muss, an welchem sich Störenfriede breit gemacht haben.
	AI_Output(self, hero, "Info_Mod_AlterWaldMann_Hi_11_05"); //Für alle Fälle werde ich dir einen Teil meiner Macht überlassen, auf dass du jeden Wilderer und Strolch davonjagen kannst
	AI_Output(self, hero, "Info_Mod_AlterWaldMann_Hi_11_06"); //Es sollte auch nicht allzu lange dauern, bis ich die Sache erledigt habe und hierhin zurückkomme. Viel Glück.

	B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "Der alte Mann des Waldes will, dass ich den umliegenden Wald von Wilderern säubere, bis er zurück ist. Zu diesem Zweck hat er mir einen Teil seiner Macht überlassen.");

	AI_StopProcessInfos	(self);

	AI_Teleport	(self, "TOT");
	B_StartOtherRoutine	(self, "TOT");

	Wld_InsertNpc	(Mod_7530_JG_Wilderer_NW, "REL_SURFACE_033");
	Wld_InsertNpc	(Mod_7531_JG_Wilderer_REL, "REL_SURFACE_005");
	Wld_InsertNpc	(Mod_7532_JG_Wilderer_REL, "REL_SURFACE_139");

	Mod_BDT_AlterWaldMann = 9;

	if (Mod_IstKeiler == TRUE)
	{
		hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX]*2;
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS]*2;
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH]*2;
	};
};

INSTANCE Info_Mod_AlterWaldMann_Aufgabe (C_INFO)
{
	npc		= Mod_7529_OUT_AlterMann_REL;
	nr		= 1;
	condition	= Info_Mod_AlterWaldMann_Aufgabe_Condition;
	information	= Info_Mod_AlterWaldMann_Aufgabe_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_AlterWaldMann_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_AlterWaldMann_Hi))
	&& (Npc_IsDead(Mod_7530_JG_Wilderer_NW))
	&& (Npc_IsDead(Mod_7531_JG_Wilderer_REL))
	&& (Npc_IsDead(Mod_7532_JG_Wilderer_REL))
	&& (Mod_IstKeiler == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_AlterWaldMann_Aufgabe_Info()
{
	AI_Output(self, hero, "Info_Mod_AlterWaldMann_Aufgabe_11_00"); //Ahh, ich merke, du hast ganze Arbeit geleistet.
	AI_Output(self, hero, "Info_Mod_AlterWaldMann_Aufgabe_11_01"); //Hier hast du einer Wurzel zur Belohnung, welche dich stärken wird ...

	CreateInvItems	(self, ItPl_Strength_Herb_01, 1);

	AI_DropItem	(self, ItPl_Strength_Herb_01);

	AI_Output(self, hero, "Info_Mod_AlterWaldMann_Aufgabe_11_02"); //Ich muss nun etwas weiter nach Norden gehen. Wir ich erfahren habe, wollen die gierigen Menschen dort eine weitere Mine eröffnen.
	AI_Output(self, hero, "Info_Mod_AlterWaldMann_Aufgabe_11_03"); //Das darf unter keinen Umständen geschehen.

	B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "Der alte Mann des Waldes will etwas weiter in den Norden, um die Errichtung einer Mine zu verhindern.");

	AI_StopProcessInfos	(self);

	AI_Teleport	(self, "REL_SURFACE_146");
	B_StartOtherRoutine	(self, "MINE");

	Mod_BDT_AlterWaldMann = 10;
};

INSTANCE Info_Mod_AlterWaldMann_AtMine (C_INFO)
{
	npc		= Mod_7529_OUT_AlterMann_REL;
	nr		= 1;
	condition	= Info_Mod_AlterWaldMann_AtMine_Condition;
	information	= Info_Mod_AlterWaldMann_AtMine_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_AlterWaldMann_AtMine_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_AlterWaldMann_Aufgabe))
	&& (Mod_IstKeiler == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_AlterWaldMann_AtMine_Info()
{
	AI_Output(self, hero, "Info_Mod_AlterWaldMann_AtMine_11_00"); //Siehst du, was die Menschen mit dem Wald machen?
	AI_Output(self, hero, "Info_Mod_AlterWaldMann_AtMine_11_01"); //Fällen die Bäume, zerstören die Vegetation, nur um sich mit noch mehr Gold und Erz zu bereichern.
	AI_Output(self, hero, "Info_Mod_AlterWaldMann_AtMine_11_02"); //Wenn die ihr Ziel erreichen und die Mine erschließen werden viele Bäume sterben müssen, um ihnen als Balken und Brennholz in den Öfen zu dienen ...
	AI_Output(self, hero, "Info_Mod_AlterWaldMann_AtMine_11_03"); //Hmm, ich habe da einen Einfall, bei welchem du mir helfen musst. Die Baumstämme der Balken sind noch frisch und voller Leben ...
	AI_Output(self, hero, "Info_Mod_AlterWaldMann_AtMine_11_04"); //Damit ich jedoch mein Vorhaben umsetzen kann, musst du die Menschen eine Weile ablenken.
	AI_Output(self, hero, "Info_Mod_AlterWaldMann_AtMine_11_05"); //Leider scheinen ihre Rüstungen sehr stark zu sein und es wird dir kaum gelingen, sie mit Bissen zu durchdringen.
	AI_Output(self, hero, "Info_Mod_AlterWaldMann_AtMine_11_06"); //Sei also auf der Hut und pass auf, dass sie dir mit ihren Schwertern nicht zu nahe kommen.

	B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "Der alte Mann des waldes scheint einen Plan zu haben, der mit den frischen Balken, welche die Mine stützen, zu tun hat. Damit er jedoch seine Pläne verwirklichen kann, werde ich die Leute eine Weile ablenken müssen. Der Versuch ihnen mit Bissen zu Leibe zu rücken wird jedoch nicht glücken, da ihre Rüstungen zu dick sind. Ich werde also schnell und vorsichtig sein müssen.");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_AlterWaldMann_AtMine2 (C_INFO)
{
	npc		= Mod_7529_OUT_AlterMann_REL;
	nr		= 1;
	condition	= Info_Mod_AlterWaldMann_AtMine2_Condition;
	information	= Info_Mod_AlterWaldMann_AtMine2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_AlterWaldMann_AtMine2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_AlterWaldMann_AtMine))
	&& (Npc_IsDead(Mod_7582_OUT_Buddler_REL))
	&& (Npc_IsDead(Mod_7583_OUT_Wache_REL))
	&& (Npc_IsDead(Mod_7584_OUT_Wache_REL))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_AlterWaldMann_AtMine2_Info()
{
	AI_Output(self, hero, "Info_Mod_AlterWaldMann_AtMine2_11_00"); //Du hast dem Wald einen guten Dienst geleistet.
	AI_Output(self, hero, "Info_Mod_AlterWaldMann_AtMine2_11_01"); //Ich habe die frischen Balken zu neuem Wachstum anregen können, sodass sie jetzt als große stabile Bäume zu Zugang zur Mine verstellen.
	AI_Output(self, hero, "Info_Mod_AlterWaldMann_AtMine2_11_02"); //Die Menschen werden nun denken es ginge nicht mit rechten Dingen zu und hoffentlich ihr Vorhaben beenden.
	AI_Output(self, hero, "Info_Mod_AlterWaldMann_AtMine2_11_03"); //Da du diesmal soviel Geschick bewiesen hat, soll eine Beere deine Gewandtheit noch steigern. Ahh, ich habe gerade keine bei mir.
	AI_Output(self, hero, "Info_Mod_AlterWaldMann_AtMine2_11_04"); //Dann werde mich jetzt zu meiner Kammer der Schätze und Reichtümer begeben und dir deine Belohnung holen.

	AI_StopProcessInfos	(self);

	AI_GotoWP	(self, "REL_SURFACE_189");

	AI_UseMob	(self, "TOUCHPLATE", 1);
	AI_UseMob	(self, "TOUCHPLATE", -1);

	AI_GotoWP	(self, "REL_SURFACE_188");

	AI_GotoNpc	(self, hero);
};

INSTANCE Info_Mod_AlterWaldMann_AtMine3 (C_INFO)
{
	npc		= Mod_7529_OUT_AlterMann_REL;
	nr		= 1;
	condition	= Info_Mod_AlterWaldMann_AtMine3_Condition;
	information	= Info_Mod_AlterWaldMann_AtMine3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_AlterWaldMann_AtMine3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_AlterWaldMann_AtMine2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_AlterWaldMann_AtMine3_Info()
{
	AI_Output(self, hero, "Info_Mod_AlterWaldMann_AtMine3_11_00"); //Hier bitte. Ich muss nun weiter, um wieder woanders nach dem Rechten zu sehen. Viel Glück noch. Vielleicht kreuzen sich unsere Wege bald wieder.

	CreateInvItems	(self, ItPl_Dex_Herb_01, 1);

	AI_DropItem	(self, ItPl_Dex_Herb_01);

	B_GivePlayerXP	(400);

	AI_StopProcessInfos	(self);

	AI_Teleport	(self, "TOT");

	B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "Aha, also ein Mechanismus am Stein, welcher zu seinen Schätzen führt.");

	Wld_SendTrigger	("EVT_WALDMANNVERSTECKK_TRIGGERLIST");
};

INSTANCE Info_Mod_AlterWaldMann_EXIT (C_INFO)
{
	npc		= Mod_7529_OUT_AlterMann_REL;
	nr		= 1;
	condition	= Info_Mod_AlterWaldMann_EXIT_Condition;
	information	= Info_Mod_AlterWaldMann_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_AlterWaldMann_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_AlterWaldMann_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};