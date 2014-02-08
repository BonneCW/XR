INSTANCE Info_Mod_Gomez_Hi (C_INFO)
{
	npc		= Mod_517_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_Hi_Condition;
	information	= Info_Mod_Gomez_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gomez_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gomez_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Gomez_Hi_10_00"); //He, Bürschchen. Ganz langsam, sonst bist du tot.
	AI_Output(hero, self, "Info_Mod_Gomez_Hi_15_01"); //Gomez?!
	AI_Output(self, hero, "Info_Mod_Gomez_Hi_10_02"); //Ganz recht. Was hast du hier zu suchen?
	AI_Output(hero, self, "Info_Mod_Gomez_Hi_15_03"); //Äh... Ich will zu einem gewissen Andokai.
	AI_Output(self, hero, "Info_Mod_Gomez_Hi_10_04"); //Das passt ja gut. Genau zu dem werde ich dich nämlich jetzt auch bringen.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Gomez_Belagerung (C_INFO)
{
	npc		= Mod_517_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_Belagerung_Condition;
	information	= Info_Mod_Gomez_Belagerung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du was zu tun für mich?";
};

FUNC INT Info_Mod_Gomez_Belagerung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raven_Belagerung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gomez_Belagerung_Info()
{
	AI_Output(hero, self, "Info_Mod_Gomez_Belagerung_15_00"); //Hast du was zu tun für mich?
	AI_Output(self, hero, "Info_Mod_Gomez_Belagerung_10_01"); //Hmmm ... nichts, was von Belang sein könnte!
	AI_Output(hero, self, "Info_Mod_Gomez_Belagerung_15_02"); //Was soll ich machen?
	AI_Output(self, hero, "Info_Mod_Gomez_Belagerung_10_03"); //Im Wald vor der Festung sind einige untote Novizen und Magier. Sie verhindern, dass wir die Haupttruppen der Garde Innos' auf dem Plateau erwischen können.
	AI_Output(self, hero, "Info_Mod_Gomez_Belagerung_10_04"); //Ich will, dass du diese Typen tötest, damit wir endlich zurückschlagen können.
	AI_Output(hero, self, "Info_Mod_Gomez_Belagerung_15_05"); //Dann werde ich gleich gehen!
	AI_Output(self, hero, "Info_Mod_Gomez_Belagerung_10_06"); //Töte aber alle Feinde!
	AI_Output(hero, self, "Info_Mod_Gomez_Belagerung_15_07"); //Ich werde keinen außer Acht lassen.

	Log_CreateTopic	(TOPIC_MOD_BEL_DURCHBRUCH, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_DURCHBRUCH, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BEL_DURCHBRUCH, "Gomez will, dass ich die untoten Novizen und Magier im Wald vor der Festung erledige.");
};

INSTANCE Info_Mod_Gomez_Durchbruch (C_INFO)
{
	npc		= Mod_517_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_Durchbruch_Condition;
	information	= Info_Mod_Gomez_Durchbruch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Der Feind ist geschwächt.";
};

FUNC INT Info_Mod_Gomez_Durchbruch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gomez_Belagerung))
	&& (Npc_IsDead(Mod_4037_UntoterNovize_20_MT))
	&& (Npc_IsDead(Mod_4038_UntoterNovize_21_MT))
	&& (Npc_IsDead(Mod_4039_UntoterNovize_22_MT))
	&& (Npc_IsDead(Mod_4040_UntoterNovize_23_MT))
	&& (Npc_IsDead(Mod_4041_UntoterNovize_24_MT))
	&& (Npc_IsDead(Mod_4042_UntoterNovize_25_MT))
	&& (Npc_IsDead(Mod_4043_UntoterNovize_26_MT))
	&& (Npc_IsDead(Mod_4044_UntoterNovize_27_MT))
	&& (Npc_IsDead(Mod_4045_UntoterNovize_28_MT))
	&& (Npc_IsDead(Mod_4046_UntoterNovize_29_MT))
	&& (Npc_IsDead(Mod_4047_UntoterMagier_06_MT))
	&& (Npc_IsDead(Mod_4048_UntoterMagier_07_MT))
	&& (Npc_IsDead(Mod_4049_UntoterMagier_08_MT))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gomez_Durchbruch_Info()
{
	AI_Output(hero, self, "Info_Mod_Gomez_Durchbruch_15_00"); //Der Feind ist geschwächt.
	AI_Output(self, hero, "Info_Mod_Gomez_Durchbruch_10_01"); //Das hast du gut gemacht. Somit können wir einen Gegenangriff vornehmen. Ich werde Raven davon berichten!

	B_GivePlayerXP	(600);

	B_LogEntry_More	(TOPIC_MOD_BEL_DURCHBRUCH, TOPIC_MOD_BEL_BELAGERUNG, "Ich habe Gomez berichtet, dass die Belagerung zurückgeschlagen wurde.", "Ich habe Gomez geholfen und die Belagerung durchbrochen. Er wird nun Raven Bescheid geben.");
	B_SetTopicStatus	(TOPIC_MOD_BEL_DURCHBRUCH, LOG_SUCCESS);

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Gomez_TruheMage (C_INFO)
{
	npc		= Mod_517_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_TruheMage_Condition;
	information	= Info_Mod_Gomez_TruheMage_Info;
	permanent	= 0;
	important	= 0;
	description	= "Scar schickt mich.";
};

FUNC INT Info_Mod_Gomez_TruheMage_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Scar_TruheMage))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gomez_TruheMage_Info()
{
	AI_Output(hero, self, "Info_Mod_Gomez_TruheMage_15_00"); //Scar schickt mich.
	AI_Output(self, hero, "Info_Mod_Gomez_TruheMage_10_01"); //Was ist denn los?
	AI_Output(hero, self, "Info_Mod_Gomez_TruheMage_15_02"); //Er will neue Waffen herstellen lassen, jedoch ist die Bauanleitung dafür in einer magischen Truhe verschlossen. Die Truhe befindet sich oben auf dem Turm der Feste.
	AI_Output(self, hero, "Info_Mod_Gomez_TruheMage_10_03"); //Dafür brauchst du einen magischen Dietrich. Er kann einen solchen Bann brechen.
	AI_Output(hero, self, "Info_Mod_Gomez_TruheMage_15_04"); //Woher bekomme ich so einen Dietrich?
	AI_Output(self, hero, "Info_Mod_Gomez_TruheMage_10_05"); //Wende dich an Eduard. Er soll dir einen speziellen Dietrich anfertigen, dem ich dann die nötige Kraft verleihen werde.
	AI_Output(hero, self, "Info_Mod_Gomez_TruheMage_15_06"); //(seufzt) Warum geht das nicht einfacher?

	B_LogEntry	(TOPIC_MOD_BEL_STAEBE, "Gomez hat mich zu Eduard geschickt. Der soll mir einen magischen Dietrich herstellen, welchem Gomez dann die nötige Kraft verleihen wird.");
};

INSTANCE Info_Mod_Gomez_HabDietrich (C_INFO)
{
	npc		= Mod_517_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_HabDietrich_Condition;
	information	= Info_Mod_Gomez_HabDietrich_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier ist der Dietrich.";
};

FUNC INT Info_Mod_Gomez_HabDietrich_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eduard_DietrichFertig))
	&& (Npc_HasItems(hero, ItKe_Lockpick_Mage_Unloaded) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gomez_HabDietrich_Info()
{
	AI_Output(hero, self, "Info_Mod_Gomez_HabDietrich_15_00"); //Hier ist der Dietrich.

	B_GiveInvItems	(hero, self, ItKe_Lockpick_Mage_Unloaded, 1);

	AI_Output(self, hero, "Info_Mod_Gomez_HabDietrich_10_01"); //Gut, Moment.

	AI_PlayAni	(self,"T_PRACTICEMAGIC5");

	AI_Output(self, hero, "Info_Mod_Gomez_HabDietrich_10_02"); //Hier hast du den Dietrich.

	B_GiveInvItems	(self, hero, ItKe_Lockpick_Mage, 1);

	B_GivePlayerXP	(250);

	B_LogEntry	(TOPIC_MOD_BEL_STAEBE, "Der Dietrich ist magisch aufgeladen und ich kann jetzt die Truhe knacken.");
};

INSTANCE Info_Mod_Gomez_Jagd01 (C_INFO)
{
	npc		= Mod_517_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_Jagd01_Condition;
	information	= Info_Mod_Gomez_Jagd01_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gomez_Jagd01_Condition()
{
	if (hero.guild == GIL_KDF)
	&& (Npc_KnowsInfo(hero, Info_Mod_Hagen_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gomez_Jagd01_Info()
{
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd01_10_00"); //Da bist du ja mal wieder.
	AI_Output(hero, self, "Info_Mod_Gomez_Jagd01_15_01"); //Hast du auf mich gewartet?
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd01_10_02"); //Ich wollte dich zu einem kleinen Jagdausflug einladen.
	AI_Output(hero, self, "Info_Mod_Gomez_Jagd01_15_03"); //Und wieso gerade mich?
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd01_10_04"); //Na ja ... Zum besseren Kennenlernen. Damit ich mal sehen kann, was du so draufhast.

	Info_ClearChoices	(Info_Mod_Gomez_Jagd01);

	Info_AddChoice	(Info_Mod_Gomez_Jagd01, "Vielleicht ein andermal. Ich habe gerade keine Zeit.", Info_Mod_Gomez_Jagd01_B);
	Info_AddChoice	(Info_Mod_Gomez_Jagd01, "Gern.", Info_Mod_Gomez_Jagd01_A);
};

FUNC VOID Info_Mod_Gomez_Jagd01_B()
{
	AI_Output(hero, self, "Info_Mod_Gomez_Jagd01_B_15_00"); //Vielleicht ein andermal. Ich habe gerade keine Zeit.
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd01_B_10_01"); //Sehr schade.

	Info_ClearChoices	(Info_Mod_Gomez_Jagd01);
};

FUNC VOID Info_Mod_Gomez_Jagd01_A()
{
	AI_Output(hero, self, "Info_Mod_Gomez_Jagd01_A_15_00"); //Gern.
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd01_A_10_01"); //Außerhalb der Festung, hinter dem dichten Wald, befindet sich ein riesiges Plateau.
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd01_A_10_02"); //Dort findet man immer genug Beute.
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd01_A_10_03"); //Sag Bescheid, wenn wir uns auf den Weg machen können.

	Log_CreateTopic	(TOPIC_MOD_GOMEZHORN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_GOMEZHORN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_GOMEZHORN, "Gomez hat mich zu einer Jagd eingeladen - da konnte ich nicht nein sagen.");
	
	Mod_GomezHorn = 1;

	Info_ClearChoices	(Info_Mod_Gomez_Jagd01);
};

INSTANCE Info_Mod_Gomez_Jagd02 (C_INFO)
{
	npc		= Mod_517_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_Jagd02_Condition;
	information	= Info_Mod_Gomez_Jagd02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wir können aufbrechen.";
};

FUNC INT Info_Mod_Gomez_Jagd02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gomez_Jagd01))
	&& (Mod_GomezHorn == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gomez_Jagd02_Info()
{
	AI_Output(hero, self, "Info_Mod_Gomez_Jagd02_15_00"); //Wir können aufbrechen.
	AI_Output(self, hero, "DEFAULT"); //

	Wld_SendTrigger	("AUSENTORBURG");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "JAGD");
};

INSTANCE Info_Mod_Gomez_Jagd03 (C_INFO)
{
	npc		= Mod_517_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_Jagd03_Condition;
	information	= Info_Mod_Gomez_Jagd03_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gomez_Jagd03_Condition()
{
	if (Npc_GetDistToWP(self, "PALTO_25") < 500)
	&& (Npc_KnowsInfo(hero, Info_Mod_Gomez_Jagd02))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gomez_Jagd03_Info()
{
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd03_10_00"); //Jetzt sind wir zwei schön alleine.
	AI_Output(hero, self, "Info_Mod_Gomez_Jagd03_15_01"); //Auweia...
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd03_10_02"); //Es geht um meine Zeit in der Kolonie. Andokai und Xardas haben mir viel davon erzählt, dass ich ein einfacher Buddler im Alten Lager war.
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd03_10_03"); //Aber ich glaub ihnen nicht. Ich ein Buddler und Arschkriecher? Niemals!
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd03_10_04"); //Die beiden verheimlichen mir doch was.
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd03_10_05"); //Ich habe mitgekriegt, dass du ebenfalls in der Kolonie warst. Also - kanntest du mich schon aus Koloniezeiten?

	Info_ClearChoices	(Info_Mod_Gomez_Jagd03);

	Info_AddChoice	(Info_Mod_Gomez_Jagd03, "Nein. Ich habe dich nie getroffen.", Info_Mod_Gomez_Jagd03_B);
	Info_AddChoice	(Info_Mod_Gomez_Jagd03, "Ja.", Info_Mod_Gomez_Jagd03_A);
};

FUNC VOID Info_Mod_Gomez_Jagd03_C()
{
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd03_C_10_00"); //(ruhig) Na dann, du scheinst mir auch nicht großartig weiterhelfen zu können. Wir sollten uns lieber auf die Jagd konzentrieren, nicht wahr?
	AI_Output(hero, self, "Info_Mod_Gomez_Jagd03_C_15_01"); //Du sagst es.
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd03_C_10_02"); //Was meinst du dazu, wenn wir daraus einen kleinen Wettkampf machen?
	AI_Output(hero, self, "Info_Mod_Gomez_Jagd03_C_15_03"); //Nur zu.
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd03_C_10_04"); //Also, hör zu: Wir beide starten von hier. Jeder hat fünf Minuten Zeit, möglichst viele Hasen zu erlegen.
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd03_C_10_05"); //Wer nach Ablauf der Zeit die meisten Hasen getötet hat, ist der Sieger.

	B_LogEntry	(TOPIC_MOD_GOMEZHORN, "Ich habe einem Wettkampf mit Gomez zugestimmt: Wer es in fünf Minuten schafft, mehr Hasen zu erlegen, ist der Sieger.");

	Info_ClearChoices	(Info_Mod_Gomez_Jagd03);

	Info_AddChoice	(Info_Mod_Gomez_Jagd03, "Ich bin bereit.", Info_Mod_Gomez_Jagd03_G);
	Info_AddChoice	(Info_Mod_Gomez_Jagd03, "Was ist die Belohnung?", Info_Mod_Gomez_Jagd03_F);
};

FUNC VOID Info_Mod_Gomez_Jagd03_G()
{
	AI_Output(hero, self, "Info_Mod_Gomez_Jagd03_G_15_00"); //Ich bin bereit.
	AI_Output(self, hero, "DEFAULT"); //

	Info_ClearChoices	(Info_Mod_Gomez_Jagd03);

	self.aivar[AIV_Partymember] = TRUE;

	AI_StopProcessInfos	(self);

	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_01");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_01");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_01");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_01");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_01");

	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_02");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_02");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_02");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_02");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_02");

	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_03");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_03");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_03");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_03");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_03");

	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_04");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_04");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_04");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_04");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_04");

	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_05");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_05");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_05");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_05");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_05");

	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_06");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_06");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_06");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_06");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_06");

	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_07");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_07");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_07");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_07");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_07");

	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_08");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_08");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_08");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_08");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_08");

	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_09");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_09");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_09");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_09");
	Wld_InsertNpc	(Rabbit_Gomez,	"FP_ROAM_RABBITS_GOMEZ_09");

	Mod_Gomez_Timer = 300;
};

FUNC VOID Info_Mod_Gomez_Jagd03_F()
{
	AI_Output(hero, self, "Info_Mod_Gomez_Jagd03_F_15_00"); //Was ist die Belohnung?
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd03_F_10_01"); //Hier geht es nur im die Ehre.
};

FUNC VOID Info_Mod_Gomez_Jagd03_B()
{
	AI_Output(hero, self, "Info_Mod_Gomez_Jagd03_B_15_00"); //Nein. Ich habe dich nie getroffen.
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd03_B_10_01"); //Wie bedauerlich. Ich werde weitere Nachforschungen betreiben müssen.

	Info_Mod_Gomez_Jagd03_C();
};

FUNC VOID Info_Mod_Gomez_Jagd03_A()
{
	AI_Output(hero, self, "Info_Mod_Gomez_Jagd03_A_15_00"); //Ja.
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd03_A_10_01"); //(atmet tief durch) Dann erzähl mal.

	Info_ClearChoices	(Info_Mod_Gomez_Jagd03);

	Info_AddChoice	(Info_Mod_Gomez_Jagd03, "Du warst jahrelang der mächtigste Mann der Kuppel.", Info_Mod_Gomez_Jagd03_E);
	Info_AddChoice	(Info_Mod_Gomez_Jagd03, "Xardas und Andokai haben Recht - du warst nur ein Buddler.", Info_Mod_Gomez_Jagd03_D);
};

FUNC VOID Info_Mod_Gomez_Jagd03_E()
{
	AI_Output(hero, self, "Info_Mod_Gomez_Jagd03_E_15_00"); //Du warst jahrelang der mächtigste Mann der Kuppel.
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd03_E_10_01"); //Der hat gesessen. Wie konnte es dann so weit kommen?
	AI_Output(hero, self, "Info_Mod_Gomez_Jagd03_E_15_02"); //Äh ... Das weiß ich auch nicht so genau. Außer dass du gestürzt wurdest.
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd03_E_10_03"); //Das ist ja interessant zu erfahren. Da werden noch einige Nachforschungen notwendig sein.
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd03_E_10_04"); //Übrigens, falls du noch jagen gehen willst: Tu dir keinen Zwang an. Die Wiesen sind voll mit Getier.
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd03_E_10_05"); //Ich habe jetzt keine Zeit mehr dafür.

	B_SetTopicStatus	(TOPIC_MOD_GOMEZHORN, LOG_SUCCESS);

	Info_ClearChoices	(Info_Mod_Gomez_Jagd03);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

FUNC VOID Info_Mod_Gomez_Jagd03_D()
{
	AI_Output(hero, self, "Info_Mod_Gomez_Jagd03_D_15_00"); //Xardas und Andokai haben Recht - du warst nur ein Buddler.
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd03_D_10_01"); //(wütend) Und ich glaube es trotzdem nicht. Vielleicht hatte ich Aktivitäten, von denen du nichts mitbekommen hast.
	AI_Output(self, hero, "Info_Mod_Gomez_Jagd03_D_10_02"); //Aber ich war nicht nur ein stinknormaler Buddler!

	Info_Mod_Gomez_Jagd03_C();
};

INSTANCE Info_Mod_Gomez_Jagd04 (C_INFO)
{
	npc		= Mod_517_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_Jagd04_Condition;
	information	= Info_Mod_Gomez_Jagd04_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gomez_Jagd04_Condition()
{
	if (Mod_Gomez_Timer == 0)
	&& (Mod_Gomez_HasenKiller+Mod_Gomez_HasenKiller2 > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gomez_Jagd04_Info()
{
	if (Mod_Gomez_HasenKiller >= Mod_Gomez_HasenKiller2)
	{
		AI_Output(self, hero, "Info_Mod_Gomez_Jagd04_10_00"); //(stichelt) Na, wer ist jetzt der Beste?
		AI_Output(hero, self, "Info_Mod_Gomez_Jagd04_15_01"); //Du hast nur Glück gehabt.
		AI_Output(self, hero, "Info_Mod_Gomez_Jagd04_10_02"); //(höhnisch) Ja, glaub das nur. Aber ich weiß es besser.
		AI_Output(self, hero, "Info_Mod_Gomez_Jagd04_10_03"); //Ich gehe jetzt wieder zurück in die Festung und genehmige mir ein kühles Bier.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Gomez_Jagd04_10_04"); //Heute war das Jagdglück nicht auf meiner Seite.
		AI_Output(hero, self, "Info_Mod_Gomez_Jagd04_15_05"); //Muss wohl so sein.
		AI_Output(self, hero, "Info_Mod_Gomez_Jagd04_10_06"); //Ich werde mir schon was einfallen lassen bis zum nächsten Mal.
		AI_Output(self, hero, "Info_Mod_Gomez_Jagd04_10_07"); //Aber jetzt gehe ich erst mal wieder zurück in die Festung und genehmige mir ein kühles Bier.

		B_GivePlayerXP	(250);
	};

	B_SetTopicStatus	(TOPIC_MOD_GOMEZHORN, LOG_SUCCESS);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Gomez_DuHier (C_INFO)
{
	npc		= Mod_517_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_DuHier_Condition;
	information	= Info_Mod_Gomez_DuHier_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du hier? Wie bist du hierher gekommen?";
};

FUNC INT Info_Mod_Gomez_DuHier_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gomez_DuHier_Info()
{
	AI_Output(hero, self, "Info_Mod_Gomez_DuHier_15_00"); //Du hier? Wie bist du hierher gekommen?
	AI_Output(self, hero, "Info_Mod_Gomez_DuHier_10_01"); //Willst du die ganze Geschichte wissen? Die ist ziemlich kompliziert.
	AI_Output(hero, self, "Info_Mod_Gomez_DuHier_15_02"); //Klar!
	AI_Output(self, hero, "Info_Mod_Gomez_DuHier_10_03"); //Sie beginnt noch in Myrtana, in meiner Zeit als Diplomat König Rhobars.
	AI_Output(self, hero, "Info_Mod_Gomez_DuHier_10_04"); //Alles hat damit angefangen, dass der König meine Zusammenarbeit mit den Orks aufgedeckt hat, bei denen ich mir ein kleines Zubrot verdient hatte.
	AI_Output(self, hero, "Info_Mod_Gomez_DuHier_10_05"); //Oh ja, das war ein Spaß - um die enttäuschte Fresse des alten Sacks zu sehen, hat es sich schon gelohnt.
	AI_Output(self, hero, "Info_Mod_Gomez_DuHier_10_06"); //Zur Strafe wurde ich natürlich in die Barriere geworfen, wie es damals üblich war.
	AI_Output(self, hero, "Info_Mod_Gomez_DuHier_10_07"); //Zu anderen Zeiten hätte mich der Strick erwartet, aber das Erz war dem König wichtiger als mein Tod.
	AI_Output(self, hero, "Info_Mod_Gomez_DuHier_10_08"); //Und wie wir alle wussten, war die Barriere nicht dafür errichtet worden, jemals wieder aufgehoben zu werden, deshalb konnten alle Verbrecher ruhigen Gewissens reingesteckt werden.
	AI_Output(self, hero, "Info_Mod_Gomez_DuHier_10_09"); //An die Zeit in der Kuppel kann ich mich kaum erinnern.
	AI_Output(self, hero, "Info_Mod_Gomez_DuHier_10_10"); //Ich weiß noch, dass am Fuße des Bergs mit der Austauschstelle ein kleines Lager errichtet worden war, wo sich die anderen Gefangenen aufhielten.
	AI_Output(self, hero, "Info_Mod_Gomez_DuHier_10_11"); //Scheint eine harte Zeit gewesen zu sein - zu Bewusstsein gekommen bin ich erst wieder hier, unter Xardas' Augen.
};

INSTANCE Info_Mod_Gomez_Angebot (C_INFO)
{
	npc		= Mod_517_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_Angebot_Condition;
	information	= Info_Mod_Gomez_Angebot_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gomez_Angebot_Condition()
{
	if (Hat_BuddlerNachrichtVonAL == TRUE)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_XeresLebt))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gomez_Angebot_Info()
{
	AI_UnequipWeapons	(hero);

	AI_Output(self, hero, "Info_Mod_Gomez_Angebot_10_00"); //Hey, was willst du?
	AI_Output(hero, self, "Info_Mod_Gomez_Angebot_15_01"); //Ich komme vom Alten Lager und will Raven ein Angebot machen.
	AI_Output(self, hero, "Info_Mod_Gomez_Angebot_10_02"); //Altes Lager? Wieso versetzt mir das wieder einen Stich? Verdammt, wenn ich mich bloß erinnern könnte, was war, bevor mich dieser alte Hexer zusammen mit Raven zu den Dämonenrittern geholt hat ...
	AI_Output(hero, self, "Info_Mod_Gomez_Angebot_15_03"); //Glaub mir, es ist besser, wenn du dich nicht erinnerst.
	AI_Output(self, hero, "Info_Mod_Gomez_Angebot_10_04"); //Jetzt wo ich darüber nachdenke, glaube ich, dass ich auch deine Fresse schon mal gesehen habe und jetzt wo ich sie wieder sehe, habe ich so das Bedürfnis, meine Axt darin zu versenken.
	AI_Output(hero, self, "Info_Mod_Gomez_Angebot_15_05"); //Es ist wohl besser, wenn du mich jetzt vorbeilässt, ich übermittle ein Anliegen der Erzbarone an Raven.
	AI_Output(self, hero, "Info_Mod_Gomez_Angebot_10_06"); //Erzbarone sagst du? Auch das habe ich schon gehört. Mit der Zeit kommen meine Erinnerungen ziemlich vage wieder. Die ersten Tage im Minental ... dann regierte ich ein Lager und Raven mit mir ...
	AI_Output(self, hero, "Info_Mod_Gomez_Angebot_10_07"); //Da war noch ein anderes Lager, gegen das wir kämpften. Dann schlug mich jemand nieder und ich wachte ohne Erinnerungen bei Xardas auf. Wenn ich diesen Hund in die Finger kriege, der mich damals ...
	AI_Output(hero, self, "Info_Mod_Gomez_Angebot_15_08"); //(nervös) Also, ich muss jetzt zu Raven, ich ...
	AI_Output(self, hero, "Info_Mod_Gomez_Angebot_10_09"); //(wütend) Nirgends musst du hin! Es war ein Fehler, mir noch mal unter die Augen zu treten! An dich habe ich mein Lager und mein Gedächtnis verloren, dafür verlierst du jetzt deinen Kopf!

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_NONE, 0);
};

INSTANCE Info_Mod_Gomez_AtAL (C_INFO)
{
	npc		= Mod_517_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_AtAL_Condition;
	information	= Info_Mod_Gomez_AtAL_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gomez_AtAL_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_DaemonenritterWache_Hi))
	&& (!Npc_IsInState(Mod_7066_DMR_Daemonenritter_MT, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gomez_AtAL_Info()
{
	AI_TurnToNpc	(self, Mod_7066_DMR_Daemonenritter_MT);

	AI_Output(self, hero, "Info_Mod_Gomez_AtAL_10_00"); //Jemand, den ich mir anhören möchte, und jetzt halt deinen Mund, wenn ich dir nicht die Zunge rausschneiden soll.
	
	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Gomez_AtAL2 (C_INFO)
{
	npc		= Mod_517_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_AtAL2_Condition;
	information	= Info_Mod_Gomez_AtAL2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gomez_AtAL2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_DaemonenritterWache_Hi))
	&& (!Npc_IsInState(Mod_7066_DMR_Daemonenritter_MT, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gomez_AtAL2_Info()
{
	AI_Output(self, hero, "Info_Mod_Gomez_AtAL2_10_00"); //Also, junger Krieger, sag, was du zu sagen hast und mögen dir die Götter gnädig sein, wenn es nicht wirklich wichtig ist.
};

INSTANCE Info_Mod_Gomez_AtAL2_A (C_INFO)
{
	npc		= Mod_517_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_AtAL2_A_Condition;
	information	= Info_Mod_Gomez_AtAL2_A_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Wachposten außerhalb des Lagers werden angegriffen.";
};

FUNC INT Info_Mod_Gomez_AtAL2_A_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gomez_AtAL2))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Gomez_AtAL2_B))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gomez_AtAL2_A_Info()
{
	AI_Output(hero, self, "Info_Mod_Gomez_AtAL2_A_15_00"); //Die Wachposten außerhalb des Lagers werden angegriffen. Wir brauchen dich persönlich.
	AI_Output(self, hero, "Info_Mod_Gomez_AtAL2_A_10_01"); //wenn diese Versager nicht alleine damit fertig werden, ist es ihre Schuld ... solange im Lager niemand angreift kann mir das egal sein. Noch was?
};

INSTANCE Info_Mod_Gomez_AtAL2_B (C_INFO)
{
	npc		= Mod_517_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_AtAL2_B_Condition;
	information	= Info_Mod_Gomez_AtAL2_B_Info;
	permanent	= 0;
	important	= 0;
	description	= "Auf einem der Hochsitze außerhalb des Lagers spielt einer unserer Leute verrückt und schießt auf sie.";
};

FUNC INT Info_Mod_Gomez_AtAL2_B_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gomez_AtAL2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gomez_AtAL2_B_Info()
{
	AI_Output(hero, self, "Info_Mod_Gomez_AtAL2_B_15_00"); //Auf einem der Hochsitze außerhalb des Lagers spielt einer unserer Leute verrückt und schießt auf sie. Er ist zu stark für uns, wir brauchen dich persönlich.
	AI_Output(self, hero, "Info_Mod_Gomez_AtAL2_B_10_01"); //Ein Verräter? Das macht mir Sorgen. Ich denke, ich sollte mich um den Kerl kümmern bevor er noch Verluste innerhalb des Lagers verursacht.

	B_LogEntry	(TOPIC_MOD_AL_LOCKVOGEL, "Gomez verlässt das Lager ... nun wüssen wir ihn erledigen!");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "OUTDOOR");

	B_StartOtherRoutine	(Mod_1874_HMG_Makanius_MT, "OUTDOOR");
	AI_Teleport	(Mod_1874_HMG_Makanius_MT, "OC1");

	B_StartOtherRoutine	(Mod_7039_PAL_Oric_MT, "OUTDOOR");
	AI_Teleport	(Mod_7039_PAL_Oric_MT, "OC1");

	B_StartOtherRoutine	(Mod_1870_EBR_Alissandro_MT, "OUTDOOR");
	AI_Teleport	(Mod_1870_EBR_Alissandro_MT, "OC1");
};

INSTANCE Info_Mod_Gomez_AtAL2_C (C_INFO)
{
	npc		= Mod_517_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_AtAL2_C_Condition;
	information	= Info_Mod_Gomez_AtAL2_C_Info;
	permanent	= 0;
	important	= 0;
	description	= "Alissandro will verhandeln.";
};

FUNC INT Info_Mod_Gomez_AtAL2_C_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gomez_AtAL2))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Gomez_AtAL2_B))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gomez_AtAL2_C_Info()
{
	AI_Output(hero, self, "Info_Mod_Gomez_AtAL2_C_15_00"); //Alissandro will verhandeln. Allerdings besteht er darauf dich persönlich und ohne bewaffnete Begleitung zu sehen.
	AI_Output(self, hero, "Info_Mod_Gomez_AtAL2_C_10_01"); //Hält der alte Bastard mich für dumm? Das stinkt nach einer Falle. Verhandlungen werden nach meinen Bedingungen geführt.
};

INSTANCE Info_Mod_Gomez_AtAL3 (C_INFO)
{
	npc		= Mod_517_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_AtAL3_Condition;
	information	= Info_Mod_Gomez_AtAL3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gomez_AtAL3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raven_Oric))
	&& (!Npc_IsInState(Mod_520_DMR_Raven_MT, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gomez_AtAL3_Info()
{
	AI_TurnToNpc	(self, Mod_520_DMR_Raven_MT);

	AI_Output(self, hero, "Info_Mod_Gomez_AtAL3_10_00"); //Was sollte das? Ihr wollt mir das Lager wieder nehmen? Du hast mir nicht's zu befehlen, Raven.
	AI_Output(self, hero, "Info_Mod_Gomez_AtAL3_10_01"); //Früher war ich es, der dir die Befehle gab, und nur weil du Xardas in den Arsch kriechst, hast du nicht das Recht, solche Dinge zu bestimmen.
	
	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Gomez_Pickpocket (C_INFO)
{
	npc		= Mod_517_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_Pickpocket_Condition;
	information	= Info_Mod_Gomez_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_180;
};

FUNC INT Info_Mod_Gomez_Pickpocket_Condition()
{
	C_Beklauen	(160, ItMi_Gold, 106);
};

FUNC VOID Info_Mod_Gomez_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Gomez_Pickpocket);

	Info_AddChoice	(Info_Mod_Gomez_Pickpocket, DIALOG_BACK, Info_Mod_Gomez_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Gomez_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Gomez_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Gomez_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Gomez_Pickpocket);
};

FUNC VOID Info_Mod_Gomez_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Gomez_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Gomez_Pickpocket);

		Info_AddChoice	(Info_Mod_Gomez_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Gomez_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Gomez_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Gomez_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Gomez_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Gomez_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Gomez_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Gomez_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Gomez_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Gomez_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Gomez_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Gomez_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Gomez_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Gomez_EXIT (C_INFO)
{
	npc		= Mod_517_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_EXIT_Condition;
	information	= Info_Mod_Gomez_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Gomez_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gomez_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};