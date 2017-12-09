INSTANCE Info_Mod_Kolam_Hi (C_INFO)
{
	npc		= Mod_1981_Kolam_FI;
	nr		= 1;
	condition	= Info_Mod_Kolam_Hi_Condition;
	information	= Info_Mod_Kolam_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Kolam_Hi_Condition()
{
	if (FI_Story == 7)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kolam_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Kolam_Hi_02_00"); //So, und jetzt zu dir. Ich bin mir sicher du brennst vor Fragen.
	AI_Output(hero, self, "Info_Mod_Kolam_Hi_15_01"); //Was hast du mit dem Erfinder gemacht?
	AI_Output(self, hero, "Info_Mod_Kolam_Hi_02_02"); //(lacht) Hahahaha. Du Narr hast es immer noch nicht begriffen. ICH bin der Erfinder.
	AI_Output(hero, self, "Info_Mod_Kolam_Hi_15_03"); //Was? Du bist der Erfinder?
	AI_Output(self, hero, "Info_Mod_Kolam_Hi_02_04"); //Natürlich! Die ganze Sache mit der Entführung war nur ein Trick, um DICH hierher zu locken!
	AI_Output(self, hero, "Info_Mod_Kolam_Hi_02_05"); //Die einzige Magie, die ich beherrsche, ist die Magie der Technik. Das ist aber leider zu hoch für diese Idioten mit ihrem Schläfer, deshalb bin ich als der große Guru Cor Kolam, Cor Kaloms Bruder, aufgetreten.
	AI_Output(hero, self, "Info_Mod_Kolam_Hi_15_06"); //Mich hierherzulocken? Wozu denn? Damit hast du dir nur die ganze Miliz auf den Hals gehetzt.
	AI_Output(self, hero, "Info_Mod_Kolam_Hi_02_07"); //Das ist alles Teil meines genialen Planes!
	AI_Output(hero, self, "Info_Mod_Kolam_Hi_15_08"); //Plan? Lass mich raten. Es geht um Geld, Frauen, Macht ... Weltherrschafft?
	AI_Output(self, hero, "Info_Mod_Kolam_Hi_02_09"); //Hast du deine Ideen aus einem Lexikon für Klischees? Für wie primitiv hältst du mich eigentlich? Es geht mir nicht um Macht, sondern nur um die Technik als solche.
	AI_Output(self, hero, "Info_Mod_Kolam_Hi_02_10"); //Ich wollte die perfekte Maschine bauen, und das ist mir ja auch gelungen. ANGRIFF INITIALISIEREN

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Kolam_SleeperDead (C_INFO)
{
	npc		= Mod_1981_Kolam_FI;
	nr		= 1;
	condition	= Info_Mod_Kolam_SleeperDead_Condition;
	information	= Info_Mod_Kolam_SleeperDead_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Kolam_SleeperDead_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kolam_Hi))
	&& (Npc_IsDead(Sleeper))
	&& (Npc_GetDistToWP(self, "FI_81") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kolam_SleeperDead_Info()
{
	AI_Output(self, hero, "Info_Mod_Kolam_SleeperDead_02_00"); //Wunderbar!
	AI_Output(hero, self, "Info_Mod_Kolam_SleeperDead_15_01"); //Sind bei dir jetzt alle Sicherungen durchgebrannt? Ich habe deine „Perfekte Maschine“ gerade zu Altschrott gemacht.
	AI_Output(self, hero, "Info_Mod_Kolam_SleeperDead_02_02"); //Was? Perfekte Maschine? Das? Aber nicht doch.
	AI_Output(self, hero, "Info_Mod_Kolam_SleeperDead_02_03"); //Meine perfekte Maschine ist noch nicht mal fertig ... das heißt, sie war noch nicht fertig, da was Entscheidendes fehlte.
	AI_Output(hero, self, "Info_Mod_Kolam_SleeperDead_15_04"); //Und zwar?
	AI_Output(self, hero, "Info_Mod_Kolam_SleeperDead_02_05"); //Das Gehirn. Natürlich nur im metaphorischen Sinne. Die Konstruktion ist fertig, aber die Programmierung fehlte.
	AI_Output(self, hero, "Info_Mod_Kolam_SleeperDead_02_06"); //Ich konnte ja nicht irgendein Programm schreiben, nicht um die perfekte Maschine zu bauen ... da es eine Kampfmaschine ist, braucht sie den perfekten Kampfstil. Und genau da kommst du ins Spiel.
	AI_Output(hero, self, "Info_Mod_Kolam_SleeperDead_15_07"); //Und du glaubst, ich helfe dir deine Maschine zu bauen? Ich bin Milizsoldat und hier, um wenigstens ein bisschen Recht und Ordnung zu wahren, nicht um dir zu helfen eine verrückte Killermaschine zu bauen.
	AI_Output(self, hero, "Info_Mod_Kolam_SleeperDead_02_08"); //Oh, ich verstehe deine moralischen Bedenken durchaus, aber es ist nicht so als hätte ich dich um deine Hilfe gebeten. Ich hab sie mir genommen.
	AI_Output(self, hero, "Info_Mod_Kolam_SleeperDead_02_09"); //Deine beeindruckende Vorstellung im Kampf mit dem Schläfer-Bot hat meiner Maschine alle Informationen geliefert, die sie brauchte.
	AI_Output(self, hero, "Info_Mod_Kolam_SleeperDead_02_10"); //Sie hat dich bis jetzt analysiert, doch da sie jetzt alles Nötige weiß, mach dich dazu bereit, das erste Opfer wahrhafter Perfektion zu werden!
	AI_Output(self, hero, "Info_Mod_Kolam_SleeperDead_02_11"); //INPUT BEENDEN. ANGRIFFSMUSTER LADEN, ANGRIFF INTIALISIEREN!

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(HeroBot_FI, "ABSCHIED");
};

INSTANCE Info_Mod_Kolam_EXIT (C_INFO)
{
	npc		= Mod_1981_Kolam_FI;
	nr		= 1;
	condition	= Info_Mod_Kolam_EXIT_Condition;
	information	= Info_Mod_Kolam_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Kolam_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Kolam_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};