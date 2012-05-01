INSTANCE Info_Mod_Skinner_Hi (C_INFO)
{
	npc		= Mod_964_BDT_Skinner_MT;
	nr		= 1;
	condition	= Info_Mod_Skinner_Hi_Condition;
	information	= Info_Mod_Skinner_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo ...";
};

FUNC INT Info_Mod_Skinner_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dexter_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skinner_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Skinner_Hi_15_00"); //Hallo ...
	AI_Output(self, hero, "Info_Mod_Skinner_Hi_08_01"); //(mürrisch) Warum weckst du mich? Siehst du nicht, dass ich mich gerade ausruhe?
	AI_Output(hero, self, "Info_Mod_Skinner_Hi_15_02"); //Ich ...
	AI_Output(self, hero, "Info_Mod_Skinner_Hi_08_03"); //Aber warte, du bist doch der Neue. Jetzt da du schon mal hier bist kann ich dir ein großartiges Angebot unterbreiten.
	AI_Output(hero, self, "Info_Mod_Skinner_Hi_15_04"); //Worum geht’s?
	AI_Output(self, hero, "Info_Mod_Skinner_Hi_08_05"); //Du bist ja noch nicht lange dabei und willst sicher schnell im Lager aufsteigen, Ansehen gewinnen. Ich kann dir dabei helfen.
	AI_Output(self, hero, "Info_Mod_Skinner_Hi_08_06"); //Dazu musst du nur ein paar Sachen meinen Geschäftspartnern vorbeibringen, dich von ihnen bezahlen lassen und mir Gold und Sonstiges was du von ihnen bekommst herbringen.
	AI_Output(hero, self, "Info_Mod_Skinner_Hi_15_07"); //Was springt für mich dabei raus?
	AI_Output(self, hero, "Info_Mod_Skinner_Hi_08_08"); //Was?! Ist es nicht schon Entlohnung genug, dass du mir…ähh, dem Lager helfen kannst?
	AI_Output(self, hero, "Info_Mod_Skinner_Hi_08_09"); //Aber warte, da fällt mir etwas ein. Ich habe da noch einen mächtigen magischen Ring, der deine Stärke erheblich beeinflusst.
	AI_Output(self, hero, "Info_Mod_Skinner_Hi_08_10"); //Den kriegst du dann noch zusätzlich zu dem ganzen Ruhm. Was sagst du?

	Info_ClearChoices	(Info_Mod_Skinner_Hi);

	Info_AddChoice	(Info_Mod_Skinner_Hi, "Ich spiel doch nicht deinen Laufburschen.", Info_Mod_Skinner_Hi_B);
	Info_AddChoice	(Info_Mod_Skinner_Hi, "Ich mach's.", Info_Mod_Skinner_Hi_A);
};

FUNC VOID Info_Mod_Skinner_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Skinner_Hi_B_15_00"); //Ich spiel doch nicht deinen Laufburschen.
	AI_Output(self, hero, "Info_Mod_Skinner_Hi_B_08_01"); //(verärgert) Dann eben nicht. Und jetzt verpiss dich!
	
	Info_ClearChoices	(Info_Mod_Skinner_Hi);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Skinner_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Skinner_Hi_A_15_00"); //Ich mach's.
	AI_Output(self, hero, "Info_Mod_Skinner_Hi_A_08_01"); //Na also, du weißt, was ein gutes Angebot ist.
	AI_Output(self, hero, "Info_Mod_Skinner_Hi_A_08_02"); //Also, ich habe hier dieses Sumpfkraut. Habe ich mal einem Spinner abgenommen, der sich selbst Baal Netbek nannte, aber das tut nichts zur Sache.
	AI_Output(self, hero, "Info_Mod_Skinner_Hi_A_08_03"); //Du wirst es jedenfalls meinen Kunden bringen.

	CreateInvItems	(hero, ItMi_Traumruf, 10);
	CreateInvItems	(hero, ItMi_Addon_Joint_01, 7);
	CreateInvItems	(hero, ItMi_Addon_Joint_02, 12);

	B_ShowGivenThings ("Sumpfkrautstengel erhalten");

	AI_Output(self, hero, "Info_Mod_Skinner_Hi_A_08_04"); //Bei den Dämonenkriegern gibt es da Eduard. Der raucht massenweise Traumrufe weg. 4-8 Stück solltest du schon bei ihm wegbekommen. Pro Traumruf sind 80 Gold fällig.
	AI_Output(self, hero, "Info_Mod_Skinner_Hi_A_08_05"); //Dann gibt es noch Andokai bei den Dämonenmagiern. Er raucht das Zeug, sagt er, um in Trance seinem Meister näher sein zu können.
	AI_Output(self, hero, "Info_Mod_Skinner_Hi_A_08_06"); //Er nimmt dir auf jeden Fall paar Traumrufe und bestimmt noch einige schwarze Weise ab. Für jeden schwarzen Weisen sind 40 Goldstücke fällig und für jeden grünen Novizen 20.
	AI_Output(self, hero, "Info_Mod_Skinner_Hi_A_08_07"); //Achja, mein Kumpel Edgor hat noch was gut bei mir. Ich denke mit 3 grünen Novizen sollte das abgegolten sein.
	AI_Output(self, hero, "Info_Mod_Skinner_Hi_A_08_08"); //Den Rest verscherbelst du in der Stadt im unteren Viertel. Da gibt’s immer Abnehmer. Alles klar?
	AI_Output(self, hero, "Info_Mod_Skinner_Hi_A_08_09"); //Ich erwarte dann mindestens 1200 Gold von dir. Den Rest kannst du behalten und bekommst dann noch die versprochene Belohnung bei mir.
	
	Mod_SkinnerQuest = 1;

	Info_ClearChoices	(Info_Mod_Skinner_Hi);

	B_StartOtherRoutine	(self, "WANTTOTELLMORE");
};

INSTANCE Info_Mod_Skinner_Laufbursche (C_INFO)
{
	npc		= Mod_964_BDT_Skinner_MT;
	nr		= 1;
	condition	= Info_Mod_Skinner_Laufbursche_Condition;
	information	= Info_Mod_Skinner_Laufbursche_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Skinner_Laufbursche_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skinner_Hi))
	&& (Mod_SkinnerQuest == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skinner_Laufbursche_Info()
{
	AI_Output(self, hero, "Info_Mod_Skinner_Laufbursche_08_00"); //Achja, fast hätte ich es noch vergessen. Ich habe da noch was schönes, was du Myxir vorbeibringen sollst. Er experimentiert gerade an irgendwelchen neuen Beschwörungszaubern.
	AI_Output(self, hero, "Info_Mod_Skinner_Laufbursche_08_01"); //Erst mal einige Skelettknochen ...

	CreateInvItems	(self, ItAt_SkeletonBone, 20);
	B_GiveInvItems	(self, hero, ItAt_SkeletonBone, 20);

	AI_Output(hero, self, "Info_Mod_Skinner_Laufbursche_15_02"); //Aha ...
	AI_Output(self, hero, "Info_Mod_Skinner_Laufbursche_08_03"); //... paar Goblinknochen ...

	CreateInvItems	(self, ItAt_GoblinBone, 14);
	B_GiveInvItems	(self, hero, ItAt_GoblinBone, 14);

	AI_Output(hero, self, "Info_Mod_Skinner_Laufbursche_15_04"); //Schön ...
	AI_Output(self, hero, "Info_Mod_Skinner_Laufbursche_08_05"); //... Totenschädel ...

	CreateInvItems	(self, ItAt_SkeletonHead, 4);
	B_GiveInvItems	(self, hero, ItAt_SkeletonHead, 4);

	AI_Output(hero, self, "Info_Mod_Skinner_Laufbursche_15_06"); //Was noch?
	AI_Output(self, hero, "Info_Mod_Skinner_Laufbursche_08_07"); //... zwei Köpfe ...

	CreateInvItems	(self, ItMi_Addon_Bloodwyn_Kopf, 2);
	B_GiveInvItems	(self, hero, ItMi_Addon_Bloodwyn_Kopf, 2);

	AI_Output(hero, self, "Info_Mod_Skinner_Laufbursche_15_08"); //Wie nett ...
	AI_Output(self, hero, "Info_Mod_Skinner_Laufbursche_08_09"); //Ach, und hier noch der ganze Rest.

	CreateInvItems	(hero, ItPo_Blood, 17);
	CreateInvItems	(hero, ItFoMuttonZombie, 12);
	CreateInvItems	(hero, ItAt_DemonHeart, 1);

	AI_Output(hero, self, "Info_Mod_Skinner_Laufbursche_15_10"); //Woher ...
	AI_Output(self, hero, "Info_Mod_Skinner_Laufbursche_08_11"); //Frag besser nicht, willst du gar nicht wissen.
	AI_Output(self, hero, "Info_Mod_Skinner_Laufbursche_08_12"); //Du kriegst dann im Gegenzug je eine Beschwörungsspruchrolle für Wolf, Golem und Dämon von ihm.
	AI_Output(self, hero, "Info_Mod_Skinner_Laufbursche_08_13"); //Dafür kriege ich einen guten preis bei den Verwandlungsmagiern, die sich dafür interessieren, in wie weit ihre Verwandlungsmagie den unheiligen Beschwörungszaubern für Tiere ähnelt.
	AI_Output(self, hero, "Info_Mod_Skinner_Laufbursche_08_14"); //Soll mir recht sein, solange sie genug Gold haben. Achja, da wir schon dabei sind: Das kannst du auch gleich machen.
	AI_Output(self, hero, "Info_Mod_Skinner_Laufbursche_08_15"); //Kostet die Jungs 800 Gold und eine Spruchrolle Verwandlung Hase.
	AI_Output(self, hero, "Info_Mod_Skinner_Laufbursche_08_16"); //Das Geschäft machst du mit Albert, der draußen, links vom Eingang des verfallene Kloster über einen umgestürzten Baumstamm zu erreichen ist.
	AI_Output(self, hero, "Info_Mod_Skinner_Laufbursche_08_17"); //Jetzt mach dich aber auf den Weg. Das Zeug beginnt nämlich langsam zu riechen.

	Log_CreateTopic	(TOPIC_MOD_BDT_SKINNER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BDT_SKINNER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BDT_SKINNER, "Na, schön, da habe ich jetzt einige Laufarbeit vor mir. Eduard kriegt Traumrufe für 80 Gold das Stück, Edgor bekommt drei grüne Novizen geschenkt, Andokai erhält für 80 Gold Traumrufe und für 40 Gold schwarze Weise. Den Rest soll ich in der Stadt loswerden, wobei 20 Gold für den grünen Novizen zu erwarten sind. Dann muss ich noch einen Haufen Aas dämonischer und untoter Geschöpfe Myxir überbringen und soll dafür drei Beschwörungsspruchrollen bekommen. Diese sollen dann wiederrum zurück ins Minental zu den Verwandlungsmagiern, wo ich von Albert, den ich außerhalb des Klosters links vom Eingang finden kann, dafür 800 Gold und eine Verwandlungsspruchrolle Hase erhalten soll. Skinner erwartet dann insgesamt 2000 Gold und die Hasenspruchrolle von mir. Dafür hat er mir einen magischen Ring in Aussicht gestellt, der die Stärke des Trägers 'erheblich beeinflussen' soll. Ich hoffe, dieser ist die ganze Mühe wert.");

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Skinner_Laufbursche2 (C_INFO)
{
	npc		= Mod_964_BDT_Skinner_MT;
	nr		= 1;
	condition	= Info_Mod_Skinner_Laufbursche2_Condition;
	information	= Info_Mod_Skinner_Laufbursche2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Da bin ich wieder.";
};

FUNC INT Info_Mod_Skinner_Laufbursche2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skinner_Laufbursche))
	&& ((Mod_SkinnerQuest == 1)
	|| (Mod_SkinnerQuest == 2))
	&& (Npc_KnowsInfo(hero, Info_Mod_Eduard_Skinner))
	&& (Npc_KnowsInfo(hero, Info_Mod_Andokai_Skinner))
	&& (Npc_KnowsInfo(hero, Info_Mod_Myxir_Skinner))
	&& (Npc_KnowsInfo(hero, Info_Mod_Edgor_Skinner))
	&& (Npc_KnowsInfo(hero, Info_Mod_Albert_Skinner))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 2000)
	&& (Npc_HasItems(hero, ItSc_TrfRabbit) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skinner_Laufbursche2_Info()
{
	AI_Output(hero, self, "Info_Mod_Skinner_Laufbursche2_15_00"); //Hier, ich habe alles abgeworfen, was du mir mitgegeben hast und auch alles dabei, was du dafür haben wolltest.
	AI_Output(self, hero, "Info_Mod_Skinner_Laufbursche2_08_01"); //Ahh, gut, gib her.
	
	Mod_SkinnerQuest = 2;

	Info_ClearChoices	(Info_Mod_Skinner_Laufbursche2);

	Info_AddChoice	(Info_Mod_Skinner_Laufbursche2, "Ich denke ich behalte das Gold und die Spruchrollen.", Info_Mod_Skinner_Laufbursche2_C);
	Info_AddChoice	(Info_Mod_Skinner_Laufbursche2, "Was ist mit dem Ring?", Info_Mod_Skinner_Laufbursche2_B);
	Info_AddChoice	(Info_Mod_Skinner_Laufbursche2, "Hier hast du das Gold und die Verwandlungsspruchrolle.", Info_Mod_Skinner_Laufbursche2_A);
};

FUNC VOID Info_Mod_Skinner_Laufbursche2_C()
{
	AI_Output(hero, self, "Info_Mod_Skinner_Laufbursche2_C_15_00"); //Ich denke ich behalte das Gold und die Spruchrollen.

	Info_ClearChoices	(Info_Mod_Skinner_Laufbursche2);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_None, 0);

	B_SetTopicStatus	(TOPIC_MOD_BDT_SKINNER, LOG_FAILED);
};

FUNC VOID Info_Mod_Skinner_Laufbursche2_B()
{
	AI_Output(hero, self, "Info_Mod_Skinner_Laufbursche2_B_15_00"); //Was ist mit dem Ring?
	AI_Output(self, hero, "Info_Mod_Skinner_Laufbursche2_B_08_01"); //Ja, hier hast du den Ring und die Sachen nehme ich an mich.

	CreateInvItems	(hero, ItRi_SkinnersRing, 1);

	Npc_RemoveInvItems	(hero, ItSc_TrfRabbit, 1);
	Npc_RemoveInvItems	(hero, ItMi_Gold, 2000);

	B_ShowGivenThings	("Verwitterter Ring erhalten und Spruchrolle und Gold gegeben");

	AI_Output(self, hero, "Info_Mod_Skinner_Laufbursche2_B_08_02"); //Habe ich zuviel versprochen? (lacht hämisch) Aber bei deinem Botengang ist ja auch bestimmt genug für dich abgefallen.

	Info_ClearChoices	(Info_Mod_Skinner_Laufbursche2);

	B_GivePlayerXP	(500);

	B_SetTopicStatus	(TOPIC_MOD_BDT_SKINNER, LOG_SUCCESS);

	B_Göttergefallen(3, 1);
};

FUNC VOID Info_Mod_Skinner_Laufbursche2_A()
{
	AI_Output(hero, self, "Info_Mod_Skinner_Laufbursche2_A_15_00"); //Hier hast du das Gold und die Verwandlungsspruchrolle.

	Npc_RemoveInvItems	(hero, ItSc_TrfRabbit, 1);
	Npc_RemoveInvItems	(hero, ItMi_Gold, 2000);

	B_ShowGivenThings	("Spruchrolle und Gold gegeben");	

	AI_Output(self, hero, "Info_Mod_Skinner_Laufbursche2_A_08_01"); //Sehr gut, hier hast du den Ring.

	B_GiveInvItems	(self, hero, ItRi_SkinnersRing, 1);

	AI_Output(self, hero, "Info_Mod_Skinner_Laufbursche2_B_08_02"); //Habe ich zuviel versprochen? (lacht hämisch) Aber bei deinem Botengang ist ja auch bestimmt genug für dich abgefallen.

	Info_ClearChoices	(Info_Mod_Skinner_Laufbursche2);

	B_GivePlayerXP	(500);

	B_SetTopicStatus	(TOPIC_MOD_BDT_SKINNER, LOG_SUCCESS);
};

INSTANCE Info_Mod_Skinner_Orkjagd (C_INFO)
{
	npc		= Mod_964_BDT_Skinner_MT;
	nr		= 1;
	condition	= Info_Mod_Skinner_Orkjagd_Condition;
	information	= Info_Mod_Skinner_Orkjagd_Info;
	permanent	= 0;
	important	= 0;
	description	= "Es gibt was zu tun. Komm heute Nacht um Mitternacht vors Lager.";
};

FUNC INT Info_Mod_Skinner_Orkjagd_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Morgahard_OrkQuest))
	&& (Mod_Orks_Morgahard == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skinner_Orkjagd_Info()
{
	AI_Output(hero, self, "Info_Mod_Skinner_Orkjagd_15_00"); //Es gibt was zu tun. Komm heute Nacht um Mitternacht vors Lager. Wir gehen auf Orkjagd.
	AI_Output(self, hero, "Info_Mod_Skinner_Orkjagd_08_01"); //(mürrisch) Mir ist aber nicht danach Orks zu jagen. Außerdem habe ich noch was anderes zu tun.

	AI_StopProcessInfos	(self);

	CreateInvItems	(self, ItFo_Booze, 1);
	B_UseItem	(self, ItFo_Booze);
};

INSTANCE Info_Mod_Skinner_Orkjagd2 (C_INFO)
{
	npc		= Mod_964_BDT_Skinner_MT;
	nr		= 1;
	condition	= Info_Mod_Skinner_Orkjagd2_Condition;
	information	= Info_Mod_Skinner_Orkjagd2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Das war keine Bitte, sondern ein Befehl von Morgahard.";
};

FUNC INT Info_Mod_Skinner_Orkjagd2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skinner_Orkjagd))
	&& (Mod_Orks_Morgahard == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skinner_Orkjagd2_Info()
{
	AI_Output(hero, self, "Info_Mod_Skinner_Orkjagd2_15_00"); //Das war keine Bitte, sondern ein Befehl von Morgahard.
	AI_Output(self, hero, "Info_Mod_Skinner_Orkjagd2_08_01"); //(mürrisch) Ahh, meinetwegen.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Skinner_Orkjagd3 (C_INFO)
{
	npc		= Mod_964_BDT_Skinner_MT;
	nr		= 1;
	condition	= Info_Mod_Skinner_Orkjagd3_Condition;
	information	= Info_Mod_Skinner_Orkjagd3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Skinner, aufstehen, mitkommen, jetzt!";
};

FUNC INT Info_Mod_Skinner_Orkjagd3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skinner_Orkjagd2))
	&& (Mod_Orks_Morgahard == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skinner_Orkjagd3_Info()
{
	AI_Output(hero, self, "Info_Mod_Skinner_Orkjagd3_15_00"); //(energisch) Skinner, aufstehen, mitkommen, jetzt!
	AI_Output(self, hero, "Info_Mod_Skinner_Orkjagd3_08_01"); //Bahh, ich komme ja schon.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "LAGER");
};

INSTANCE Info_Mod_Skinner_Orkjagd4 (C_INFO)
{
	npc		= Mod_964_BDT_Skinner_MT;
	nr		= 1;
	condition	= Info_Mod_Skinner_Orkjagd4_Condition;
	information	= Info_Mod_Skinner_Orkjagd4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Skinner_Orkjagd4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skinner_Orkjagd3))
	&& (Npc_GetDistToWP(self, "OW_PATH_188") < 300)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skinner_Orkjagd4_Info()
{
	AI_Output(self, hero, "Info_Mod_Skinner_Orkjagd4_08_00"); //Na lass uns endlich losgehen. Ich habe noch besseres zu tun.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ORKJAGD");
	self.aivar[AIV_Partymember] = TRUE;

	if (Npc_GetDistToWP(Mod_4072_BDT_Bandit_MT, "OW_PATH_188") < 500)
	{
		B_StartOtherRoutine	(Mod_4072_BDT_Bandit_MT, "HOEHLE");
		Mod_4072_BDT_Bandit_MT.aivar[AIV_Partymember] = TRUE;
	};
	if (Npc_GetDistToWP(Mod_4073_BDT_Bandit_MT, "OW_PATH_188") < 500)
	{
		B_StartOtherRoutine	(Mod_4073_BDT_Bandit_MT, "HOEHLE");
		Mod_4073_BDT_Bandit_MT.aivar[AIV_Partymember] = TRUE;
	};
	if (Npc_GetDistToWP(Mod_4074_BDT_Bandit_MT, "OW_PATH_188") < 500)
	{
		B_StartOtherRoutine	(Mod_4074_BDT_Bandit_MT, "HOEHLE");
		Mod_4074_BDT_Bandit_MT.aivar[AIV_Partymember] = TRUE;
	};
	if (Npc_GetDistToWP(Mod_4075_BDT_Bandit_MT, "OW_PATH_188") < 500)
	{
		B_StartOtherRoutine	(Mod_4075_BDT_Bandit_MT, "HOEHLE");
		Mod_4075_BDT_Bandit_MT.aivar[AIV_Partymember] = TRUE;
	};
};

INSTANCE Info_Mod_Skinner_Orkjagd5 (C_INFO)
{
	npc		= Mod_964_BDT_Skinner_MT;
	nr		= 1;
	condition	= Info_Mod_Skinner_Orkjagd5_Condition;
	information	= Info_Mod_Skinner_Orkjagd5_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Skinner_Orkjagd5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skinner_Orkjagd3))
	&& (Npc_GetDistToWP(self, "OW_PATH_188") < 300)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skinner_Orkjagd5_Info()
{
	AI_Output(self, hero, "Info_Mod_Skinner_Orkjagd5_08_00"); //So jetzt aber leise.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Skinner_Orkjagd6 (C_INFO)
{
	npc		= Mod_964_BDT_Skinner_MT;
	nr		= 1;
	condition	= Info_Mod_Skinner_Orkjagd6_Condition;
	information	= Info_Mod_Skinner_Orkjagd6_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Skinner_Orkjagd6_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skinner_Orkjagd3))
	&& (Npc_IsDead(OrkWarrior_BDTPatroullie))
	&& (Npc_IsDead(OrkScout_BDTPatroullie_01))
	&& (Npc_IsDead(OrkScout_BDTPatroullie_02))
	&& (Npc_IsDead(OrkScout_BDTPatroullie_03))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skinner_Orkjagd6_Info()
{
	AI_Output(self, hero, "Info_Mod_Skinner_Orkjagd6_08_00"); //So, ich gehe wieder zurück, das war genug Stress für heute.

	AI_StopProcessInfos	(self);

	Mod_Orks_Morgahard = 4;

	B_LogEntry	(TOPIC_MOD_BDT_MORGAHARD, "Unser Überfall war erfolgreich und die Orks liegen im Staub. Jetzt muss ich nur noch Morgahard von dem Gelingen berichten.");

	B_StartOtherRoutine	(self, "START");
	self.aivar[AIV_Partymember] = FALSE;

	B_StartOtherRoutine	(Mod_4072_BDT_Bandit_MT, "START");
	Mod_4072_BDT_Bandit_MT.aivar[AIV_Partymember] = FALSE;
	
	B_StartOtherRoutine	(Mod_4073_BDT_Bandit_MT, "START");
	Mod_4073_BDT_Bandit_MT.aivar[AIV_Partymember] = FALSE;
	
	B_StartOtherRoutine	(Mod_4074_BDT_Bandit_MT, "START");
	Mod_4074_BDT_Bandit_MT.aivar[AIV_Partymember] = FALSE;
	
	B_StartOtherRoutine	(Mod_4075_BDT_Bandit_MT, "START");
	Mod_4075_BDT_Bandit_MT.aivar[AIV_Partymember] = FALSE;
};

INSTANCE Info_Mod_Skinner_Lehrer (C_INFO)
{
	npc		= Mod_964_BDT_Skinner_MT;
	nr		= 1;
	condition	= Info_Mod_Skinner_Lehrer_Condition;
	information	= Info_Mod_Skinner_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir was beibringen?";
};

FUNC INT Info_Mod_Skinner_Lehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skinner_Hi))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skinner_Lehrer_Info()
{
	B_Say	(hero, self, "$KANNSTDUMIRWASBEIBRINGEN");

	AI_Output(self, hero, "Info_Mod_Skinner_Lehrer_08_01"); //Ich kann dir den Umgang mit Einhändern beibringen.
};

INSTANCE Info_Mod_Skinner_Lernen (C_INFO)
{
	npc		= Mod_964_BDT_Skinner_MT;
	nr		= 1;
	condition	= Info_Mod_Skinner_Lernen_Condition;
	information	= Info_Mod_Skinner_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will lernen.";
};

FUNC INT Info_Mod_Skinner_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skinner_Lehrer))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skinner_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Skinner_Lernen_15_00"); //Ich will lernen.

	Info_ClearChoices	(Info_Mod_Skinner_Lernen);

	Info_AddChoice	(Info_Mod_Skinner_Lernen, DIALOG_BACK, Info_Mod_Skinner_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Skinner_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Skinner_Lernen_1H_5);
	Info_AddChoice	(Info_Mod_Skinner_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Skinner_Lernen_1H_1);
};

FUNC VOID Info_Mod_Skinner_Lernen_BACK()
{
	Info_ClearChoices	(Info_Mod_Skinner_Lernen);
};

FUNC VOID Info_Mod_Skinner_Lernen_1H_5()
{
	if B_TeachFightTalentPercent_New	(self, hero, NPC_TALENT_1H, 5, 60)
	{
		Info_ClearChoices	(Info_Mod_Skinner_Lernen);

		Info_AddChoice	(Info_Mod_Skinner_Lernen, DIALOG_BACK, Info_Mod_Skinner_Lernen_BACK);
		Info_AddChoice	(Info_Mod_Skinner_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Skinner_Lernen_1H_5);
		Info_AddChoice	(Info_Mod_Skinner_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Skinner_Lernen_1H_1);
	};
};

FUNC VOID Info_Mod_Skinner_Lernen_1H_1()
{
	if B_TeachFightTalentPercent	(self, hero, NPC_TALENT_1H, 1, 60)
	{
		Info_ClearChoices	(Info_Mod_Skinner_Lernen);

		Info_AddChoice	(Info_Mod_Skinner_Lernen, DIALOG_BACK, Info_Mod_Skinner_Lernen_BACK);
		Info_AddChoice	(Info_Mod_Skinner_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Skinner_Lernen_1H_5);
		Info_AddChoice	(Info_Mod_Skinner_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Skinner_Lernen_1H_1);
	};
};

INSTANCE Info_Mod_Skinner_Pickpocket (C_INFO)
{
	npc		= Mod_964_BDT_Skinner_MT;
	nr		= 1;
	condition	= Info_Mod_Skinner_Pickpocket_Condition;
	information	= Info_Mod_Skinner_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Skinner_Pickpocket_Condition()
{
	C_Beklauen	(61, ItMi_Gold, 250);
};

FUNC VOID Info_Mod_Skinner_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Skinner_Pickpocket);

	Info_AddChoice	(Info_Mod_Skinner_Pickpocket, DIALOG_BACK, Info_Mod_Skinner_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Skinner_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Skinner_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Skinner_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Skinner_Pickpocket);
};

FUNC VOID Info_Mod_Skinner_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Skinner_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Skinner_Pickpocket);

		Info_AddChoice	(Info_Mod_Skinner_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Skinner_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Skinner_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Skinner_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Skinner_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Skinner_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Skinner_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Skinner_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Skinner_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Skinner_Pickpocket);

		AI_StopProcessInfos	(self);

		B_Attack (self, hero, AR_Theft, 1);
	}
	else
	{
		if (rnd >= 75)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 200);
		}
		else if (rnd >= 50)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 100);
		}
		else if (rnd >= 25)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 50);
		};

		B_Say	(self, hero, "$PICKPOCKET_BESTECHUNG_01");

		Info_ClearChoices	(Info_Mod_Skinner_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Skinner_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Skinner_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Skinner_EXIT (C_INFO)
{
	npc		= Mod_964_BDT_Skinner_MT;
	nr		= 1;
	condition	= Info_Mod_Skinner_EXIT_Condition;
	information	= Info_Mod_Skinner_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Skinner_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Skinner_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};