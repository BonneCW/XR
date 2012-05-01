INSTANCE Info_Mod_Mika_Hi (C_INFO)
{
	npc		= Mod_598_MIL_Mika_NW;
	nr		= 1;
	condition	= Info_Mod_Mika_Hi_Condition;
	information	= Info_Mod_Mika_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Mika_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Mika_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Mika_Hi_13_00"); //Hey, dich habe ich hier noch die gesehen. Du musst neu in der Stadt sein.
	AI_Output(hero, self, "Info_Mod_Mika_Hi_15_01"); //Schon möglich.
	AI_Output(self, hero, "Info_Mod_Mika_Hi_13_02"); //Ich will dir den Rat geben gut auf dich aufzupassen, wenn du die Stadt verlässt.
	AI_Output(self, hero, "Info_Mod_Mika_Hi_13_03"); //In letzter Zeit häufen sich nämlich die Berichte über recht unheimliche Begebenheiten.

	Info_ClearChoices	(Info_Mod_Mika_Hi);

	Info_AddChoice	(Info_Mod_Mika_Hi, "Von welchen Begebenheiten sprichst du?", Info_Mod_Mika_Hi_B);
	Info_AddChoice	(Info_Mod_Mika_Hi, "Interessiert mich nicht.", Info_Mod_Mika_Hi_A);
};

FUNC VOID Info_Mod_Mika_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Mika_Hi_B_15_00"); //Von welchen Begebenheiten sprichst du?
	AI_Output(self, hero, "Info_Mod_Mika_Hi_B_13_01"); //Nun, es wird gemunkelt, dass dunkle Mächte ihr Unwesen treiben. Leute verschwinden, andere erkranken plötzlich schwer.
	AI_Output(self, hero, "Info_Mod_Mika_Hi_B_13_02"); //Und manch einer hat gar berichtet, dass die Toten sich aus ihren Gräbern erheben und als Untote ihr Unwesen treiben.

	Info_ClearChoices	(Info_Mod_Mika_Hi);

	Info_AddChoice	(Info_Mod_Mika_Hi, "(weiter)", Info_Mod_Mika_Hi_D);
	Info_AddChoice	(Info_Mod_Mika_Hi, "Das hat doch alles gar nichts zu bedeuten.", Info_Mod_Mika_Hi_C);
};

FUNC VOID Info_Mod_Mika_Hi_E()
{
	AI_Output(self, hero, "Info_Mod_Mika_Hi_E_13_00"); //Ok, wie du meinst. Komm dann aber bloß nicht angelaufen, wenn Untote oder andere finstere Gestalten hinter dir her sind.

	Info_ClearChoices	(Info_Mod_Mika_Hi);
};

FUNC VOID Info_Mod_Mika_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Mika_Hi_A_15_00"); //Interessiert mich nicht.

	Info_Mod_Mika_Hi_E();
};

FUNC VOID Info_Mod_Mika_Hi_D()
{
	AI_Output(self, hero, "Info_Mod_Mika_Hi_D_13_00"); //Und erst vor einiger Zeit habe ich von weitem eine unheimliche, finstere Gestalt aus dem Talkessel vor der Stadt kommen sehen.
	AI_Output(hero, self, "Info_Mod_Mika_Hi_D_15_01"); //Eine finstere Gestalt? Wohin ist sie gegangen?
	AI_Output(self, hero, "Info_Mod_Mika_Hi_D_13_02"); //Weiter den Weg hinauf. Entweder in Richtung Akil’s Hof, der links vom Weg liegt, oder gerade aus Richtung Taverne.
	AI_Output(self, hero, "Info_Mod_Mika_Hi_D_13_03"); //War mir gar nicht geheuer, dieser Geselle.

	Info_ClearChoices	(Info_Mod_Mika_Hi);

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_DUNKLERPILGER, "Der dunkle Pilger hat die Stadt offenbar umgangen und ist Richtung Akil’s Hof, oder Orlan’s Taverne weitergegangen.");
};

FUNC VOID Info_Mod_Mika_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_Mika_Hi_C_15_00"); //Das hat doch alles gar nichts zu bedeuten.

	Info_Mod_Mika_Hi_E();
};

INSTANCE Info_Mod_Mika_Yasin (C_INFO)
{
	npc		= Mod_598_MIL_Mika_NW;
	nr		= 1;
	condition	= Info_Mod_Mika_Yasin_Condition;
	information	= Info_Mod_Mika_Yasin_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hey, Mika.";
};

FUNC INT Info_Mod_Mika_Yasin_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mika_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Yasin_Aufgabe))
	&& (Wld_IsTime(20,00,06,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mika_Yasin_Info()
{
	AI_Output(hero, self, "Info_Mod_Mika_Yasin_15_00"); //Hey, Mika.

	if (!Npc_KnowsInfo(hero, Info_Mod_Urnol_WerBistDu))
	{
		AI_Output(hero, self, "Info_Mod_Mika_Yasin_15_01"); //Ich hab den Pilger noch nicht gefunden, von dem du mir erzählt hast.
		AI_Output(hero, self, "Info_Mod_Mika_Yasin_15_02"); //Dafür aber eine Gruppe Banditen oder Diebe, was weiß ich.
		AI_Output(self, hero, "Info_Mod_Mika_Yasin_13_03"); //Wollen die in die Stadt? Sag schon.
		AI_Output(hero, self, "Info_Mod_Mika_Yasin_15_04"); //Ich denke ja. Sie lungern da vorn in der Höhle rum, links vom Weg.
		AI_Output(self, hero, "Info_Mod_Mika_Yasin_13_05"); //Du musst wahnsinnig sein, aber gut, viel Glück!
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Mika_Yasin_15_06"); //Ich hab den Pilger erwischt, von dem du mir erzählt hast. Und sogar noch mehr.
		AI_Output(self, hero, "Info_Mod_Mika_Yasin_13_07"); //Erzähl.
		AI_Output(hero, self, "Info_Mod_Mika_Yasin_15_08"); //Den Weg hier ein Stück hoch, da ist doch links diese Höhle.
		AI_Output(hero, self, "Info_Mod_Mika_Yasin_15_09"); //Da hab ich paar üble Gestalten gesehen. Banditen oder Diebespack würde ich sagen.
	};

	AI_Output(self, hero, "Info_Mod_Mika_Yasin_13_10"); //Da will ich doch gleich mal nachsehen, zu was bin ich schließlich hier? Gibst du mir Rückendeckung?
	AI_Output(hero, self, "Info_Mod_Mika_Yasin_15_11"); //Gewiss.

	B_LogEntry	(TOPIC_MOD_ASS_YASIN_MIKA, "Mika ist in meine Falle getappt.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "MORD");
};

INSTANCE Info_Mod_Mika_Yasin2 (C_INFO)
{
	npc		= Mod_598_MIL_Mika_NW;
	nr		= 1;
	condition	= Info_Mod_Mika_Yasin2_Condition;
	information	= Info_Mod_Mika_Yasin2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Mika_Yasin2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mika_Yasin))
	&& (Npc_GetDistToWP(self, "NW_CITY_TO_FOREST_04_05") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mika_Yasin2_Info()
{
	AI_Output(self, hero, "Info_Mod_Mika_Yasin2_13_00"); //Hier ist niemand. Die Vögel sind wohl ausgeflogen.
	AI_Output(hero, self, "Info_Mod_Mika_Yasin2_15_01"); //Nicht ganz. Einer ist noch hier.
	AI_Output(self, hero, "Info_Mod_Mika_Yasin2_13_02"); //Wo denn?
	AI_Output(hero, self, "Info_Mod_Mika_Yasin2_15_03"); //Da wo du stehst.

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_GuildEnemy, 2);
};

INSTANCE Info_Mod_Mika_Banditen (C_INFO)
{
	npc		= Mod_598_MIL_Mika_NW;
	nr		= 1;
	condition	= Info_Mod_Mika_Banditen_Condition;
	information	= Info_Mod_Mika_Banditen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Gibts hier was Neues?";
};

FUNC INT Info_Mod_Mika_Banditen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mika_Hi))
	&& ((Mod_Gilde == 1)
	|| (Mod_Gilde == 2)
	|| (Mod_Gilde == 3))
	&& (Kapitel > 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mika_Banditen_Info()
{
	AI_Output(hero, self, "Info_Mod_Mika_Banditen_15_00"); //Gibts hier was Neues?
	AI_Output(self, hero, "Info_Mod_Mika_Banditen_13_01"); //Seit Tagen schon jagt die Miliz einer kleinen Gruppe Banditen hinterher, die ständig die Händler überfallen.
	AI_Output(self, hero, "Info_Mod_Mika_Banditen_13_02"); //Bevor wir sie zu fassen bekommen verschwinden sie immer in den Wäldern bei Akil Hof.
	AI_Output(self, hero, "Info_Mod_Mika_Banditen_13_03"); //Wir gehen da auf keinen Fall rein. Da wimmelts nur so von Viechern.
	AI_Output(hero, self, "Info_Mod_Mika_Banditen_15_04"); //Was würdest du mir geben, wenn ich diese Banditen töten würde!
	AI_Output(self, hero, "Info_Mod_Mika_Banditen_13_05"); //Nun, 100 Goldstücke wären für dich drin. Heißt das, du tötest die Kerle?
	AI_Output(hero, self, "Info_Mod_Mika_Banditen_15_06"); //Ja, das heißt es!
	AI_Output(self, hero, "Info_Mod_Mika_Banditen_13_07"); //Du musst wahnsinnig sein, aber gut, viel Glück!

	Log_CreateTopic	(TOPIC_MOD_MIKA_BANDITEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_MIKA_BANDITEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_MIKA_BANDITEN, "Die Miliz hat Probleme mit einer kleinen Gruppe Banditen. Sie verstecken sich angeblich im Wald bei Akils Hof. Ich werde mich darum kümmern müssen.");
};

INSTANCE Info_Mod_Mika_BanditenTot (C_INFO)
{
	npc		= Mod_598_MIL_Mika_NW;
	nr		= 1;
	condition	= Info_Mod_Mika_BanditenTot_Condition;
	information	= Info_Mod_Mika_BanditenTot_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Banditen sind Geschichte!";
};

FUNC INT Info_Mod_Mika_BanditenTot_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mika_Banditen))
	&& (Npc_IsDead(Mod_1969_BDT_Bandit_NW))
	&& (Npc_IsDead(Mod_1970_BDT_Bandit_NW))
	&& (Npc_IsDead(Mod_1971_BDT_Bandit_NW))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mika_BanditenTot_Info()
{
	AI_Output(hero, self, "Info_Mod_Mika_BanditenTot_15_00"); //Die Banditen sind Geschichte!
	AI_Output(self, hero, "Info_Mod_Mika_BanditenTot_13_01"); //Ich hätte nicht gedacht, dass du das alleine schaffst, Kleiner. Hier hast du das versprochene Gold!

	CreateInvItems	(self, ItMi_Gold, 100);
	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	B_GivePlayerXP	(250);

	B_Göttergefallen(1, 1);

	B_LogEntry	(TOPIC_MOD_MIKA_BANDITEN, "Die Banditen sind erledigt und Mika zufrieden.");
	B_SetTopicStatus	(TOPIC_MOD_MIKA_BANDITEN, LOG_SUCCESS);
};

INSTANCE Info_Mod_Mika_Randolph (C_INFO)
{
	npc		= Mod_598_MIL_Mika_NW;
	nr		= 1;
	condition	= Info_Mod_Mika_Randolph_Condition;
	information	= Info_MoD_Mika_Randolph_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Mika_Randolph_Condition()
{
	if (Mod_Randolph_Started == 11)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Parlaf_Randolph))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mika_Randolph_Info()
{
	AI_Output(self, hero, "Info_Mod_Mika_Randolph_13_00"); //Du machst besser, dass du schnell in die Stadt kommst.
	AI_Output(self, hero, "Info_Mod_Mika_Randolph_13_01"); //Hier draußen treiben sich zurzeit Dämonen umher, die keinen am Leben lassen, der ihren Weg kreuzt.
	AI_Output(hero, self, "Info_Mod_Mika_Randolph_15_02"); //Dämonen? Woher stammen diese?
	AI_Output(self, hero, "Info_Mod_Mika_Randolph_13_03"); //Keine Ahnung, sie sind hier überall in den Wäldern nahe der Stadt. Und in der Nähe von Lobart’s Hof treibt sich zudem eine obskure Gestalt umher.
	AI_Output(self, hero, "Info_Mod_Mika_Randolph_13_04"); //Egal, ich muss jetzt aufpassen und habe keine Zeit mich weiter zu unterhalten.
};

INSTANCE Info_Mod_Mika_RandolphWeg (C_INFO)
{
	npc		= Mod_598_MIL_Mika_NW;
	nr		= 1;
	condition	= Info_Mod_Mika_RandolphWeg_Condition;
	information	= Info_MoD_Mika_RandolphWeg_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Mika_RandolphWeg_Condition()
{
	if ((Mod_Randolph_Started == 13)
	|| (Mod_Randolph_Started == 16))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Parlaf_RandolphWeg))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mika_RandolphWeg_Info()
{
	AI_Output(self, hero, "Info_Mod_Mika_RandolphWeg_13_00"); //Gute Nachrichten. Die Dämonen scheinen sich wieder verzogen zu haben.
	AI_Output(self, hero, "Info_Mod_Mika_RandolphWeg_13_01"); //(hochmütig) Dürften wohl erkannt haben, dass sie es mit uns nicht aufnehmen können.
	AI_Output(self, hero, "Info_Mod_Mika_RandolphWeg_13_02"); //Du kannst also wieder unbesorgt vor die Stadt gehen.

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Mika_Dokumente (C_INFO)
{
	npc		= Mod_598_MIL_Mika_NW;
	nr		= 1;
	condition	= Info_Mod_Mika_Dokumente_Condition;
	information	= Info_MoD_Mika_Dokumente_Info;
	permanent	= 1;
	important	= 0;
	description	= "Du hast die Zettel von Baltram konfisziert?";
};

FUNC INT Info_Mod_Mika_Dokumente_Condition()
{
	if (Mod_REL_Dokumente == 3)
	|| (Mod_REL_Dokumente == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mika_Dokumente_Info()
{
	AI_Output(hero, self, "Info_Mod_Mika_Dokumente_15_00"); //Du hast die Zettel von Baltram konfisziert?
	AI_Output(self, hero, "Info_Mod_Mika_Dokumente_13_01"); //Korrekt.
	AI_Output(hero, self, "Info_Mod_Mika_Dokumente_15_02"); //Und sie befinden sich noch in deinem Besitz?
	AI_Output(self, hero, "Info_Mod_Mika_Dokumente_13_03"); //Richtig.
	AI_Output(hero, self, "Info_Mod_Mika_Dokumente_15_04"); //Würdest du sie verkau ...?
	AI_Output(self, hero, "Info_Mod_Mika_Dokumente_13_05"); //200 Gold.

	Info_ClearChoices	(Info_Mod_Mika_Dokumente);

	if (Mod_Verhandlungsgeschick > 0)
	&& (Mod_REL_Dokumente == 3)
	{
		Info_AddChoice	(Info_Mod_Mika_Dokumente, "(Feilschen) Was würde Lord Hagen dazu sagen, dass du beschlagnahmte Güter behältst?", Info_Mod_Mika_Dokumente_C);
	};

	Info_AddChoice	(Info_Mod_Mika_Dokumente, "Ich komme später wieder.", Info_Mod_Mika_Dokumente_B);

	if (Npc_HasItems(hero, ItMi_Gold) >= 200)
	{
		Info_AddChoice	(Info_Mod_Mika_Dokumente, "Abgemacht.", Info_Mod_Mika_Dokumente_A);
	};
};

FUNC VOID Info_Mod_Mika_Dokumente_C()
{
	AI_Output(hero, self, "Info_Mod_Mika_Dokumente_C_15_00"); //Was würde Lord Hagen dazu sagen, dass du beschlagnahmte Güter behältst?

	if (self.aivar[AIV_Verhandlung] == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_Mika_Dokumente_C_13_01"); //Ach, nimm sie schon, ich kann damit nichts anfangen.

		CreateInvItems	(hero, ItWr_Lehrling01, 1);
		CreateInvItems	(hero, ItWr_Lehrling02, 1);
		B_ShowGivenThings	("Blätter des Lehrlings erhalten");

		Npc_RemoveInvItems	(self, ItWr_Lehrling01, 1);
		Npc_RemoveInvItems	(self, ItWr_Lehrling02, 1);

		B_RaiseHandelsgeschick (5);

		Mod_REL_Dokumente = 5;

		B_LogEntry	(TOPIC_MOD_KHORATA_DOKUMENTE, "Ich bin endlich in den Besitz der Blätter gelangt und muss sie nur noch dem Lehrling zurückbringen. Scheint ja wirklich was Heißes zu sein ...");

		Info_ClearChoices	(Info_Mod_Mika_Dokumente);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Mika_Dokumente_C_13_02"); //200 Gold oder keine Zettel.

		Mod_REL_Dokumente = 4;
	};
};

FUNC VOID Info_Mod_Mika_Dokumente_B()
{
	AI_Output(hero, self, "Info_Mod_Mika_Dokumente_B_15_00"); //Ich komme später wieder.

	Info_ClearChoices	(Info_Mod_Mika_Dokumente);
};

FUNC VOID Info_Mod_Mika_Dokumente_A()
{
	AI_Output(hero, self, "Info_Mod_Mika_Dokumente_A_15_00"); //Abgemacht.

	Npc_RemoveInvItems	(hero, ItMi_Gold, 200);
	CreateInvItems	(hero, ItWr_Lehrling01, 1);
	CreateInvItems	(hero, ItWr_Lehrling02, 1);

	Npc_RemoveInvItems	(self, ItWr_Lehrling01, 1);
	Npc_RemoveInvItems	(self, ItWr_Lehrling02, 1);

	B_ShowGivenThings	("200 Gold gegeben und Blätter des Lehrlings erhalten");

	Mod_REL_Dokumente = 5;

	B_LogEntry	(TOPIC_MOD_KHORATA_DOKUMENTE, "Ich bin endlich in den Besitz der Blätter gelangt und muss sie nur noch dem Lehrling zurückbringen. Scheint ja wirklich was Heißes zu sein ...");

	Info_ClearChoices	(Info_Mod_Mika_Dokumente);
};

INSTANCE Info_Mod_Mika_VinoBrennerei (C_INFO)
{
	npc		= Mod_598_MIL_Mika_NW;
	nr		= 1;
	condition	= Info_Mod_Mika_VinoBrennerei_Condition;
	information	= Info_MoD_Mika_VinoBrennerei_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Mika_VinoBrennerei_Condition()
{
	if (Kapitel >= 3)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Lobart_VinoBrennerei))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Vino_Brennerei))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mika_VinoBrennerei_Info()
{
	AI_Output(self, hero, "Info_Mod_Mika_VinoBrennerei_13_00"); //Warte mal einen Augenblick.
	AI_Output(hero, self, "Info_Mod_Mika_VinoBrennerei_15_01"); //Was ist?
	AI_Output(self, hero, "Info_Mod_Mika_VinoBrennerei_13_02"); //Du bist doch viel da draußen unterwegs. Hast du zufällig Vino irgendwo gesehen?
	AI_Output(self, hero, "Info_Mod_Mika_VinoBrennerei_13_03"); //Lobart macht sich große Sorgen, weil er vor zwei Tagen den Hof verlassen hat und noch nicht zurückgekommen ist.
	AI_Output(self, hero, "Info_Mod_Mika_VinoBrennerei_13_04"); //Und ich kann mich dunkel erinnern, dass er hier das Stadttor passiert hat.
	AI_Output(self, hero, "Info_Mod_Mika_VinoBrennerei_13_05"); //Wohin er danach gegangen ist, weiß ich allerdings nicht mehr.
	AI_Output(hero, self, "Info_Mod_Mika_VinoBrennerei_15_06"); //Nein, zuletzt habe ich ihn auch nicht gesehen.
	AI_Output(self, hero, "Info_Mod_Mika_VinoBrennerei_13_07"); //Ach, dass auf Lobart’s Hof auch keiner wissen will, wohin er gegangen ist.
	AI_Output(self, hero, "Info_Mod_Mika_VinoBrennerei_13_08"); //Er steht doch mit den anderen Landarbeitern den ganzen Tag auf dem Feld.
	AI_Output(self, hero, "Info_Mod_Mika_VinoBrennerei_13_09"); //Da müsste doch eigentlich einer was mitbekommen haben.
	AI_Output(self, hero, "Info_Mod_Mika_VinoBrennerei_13_10"); //Und ich darf mir dann hier die Beine ich den Bauch stehen und jeden Fragen, der vorbeikommt.

	Log_CreateTopic	(TOPIC_MOD_VINO_WO, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_VINO_WO, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_VINO_WO, "Vino wird auf Lobarts Hof vermisst.");
	B_LogEntry_NS	(TOPIC_MOD_VINO_WO, "Mika hatte Vino zwar das Osttor passieren sehen, konnte sich jedoch nicht daran erinnern, wo er anschließend hinging.");
	B_LogEntry_NS	(TOPIC_MOD_VINO_WO, "Vielleicht sollte ich mal mit seinen Landarbeiterkollegen auf dem Feld sprechen.");
};

INSTANCE Info_Mod_Mika_AndreVermaechtnis (C_INFO)
{
	npc		= Mod_598_MIL_Mika_NW;
	nr		= 1;
	condition	= Info_Mod_Mika_AndreVermaechtnis_Condition;
	information	= Info_MoD_Mika_AndreVermaechtnis_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Mika_AndreVermaechtnis_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jesper_AndreVermaechtnis))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mika_AndreVermaechtnis_Info()
{
	AI_Output(self, hero, "Info_Mod_Mika_AndreVermaechtnis_13_00"); //Verdammt ...
	AI_Output(hero, self, "Info_Mod_Mika_AndreVermaechtnis_15_01"); //Was haben wir den hier? Heiße Ware?
	AI_Output(self, hero, "Info_Mod_Mika_AndreVermaechtnis_13_02"); //(stammelt) Ich ... ähhh ... scheiße, nichts wie weg.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Mika_AndreVermaechtnis2 (C_INFO)
{
	npc		= Mod_598_MIL_Mika_NW;
	nr		= 1;
	condition	= Info_Mod_Mika_AndreVermaechtnis2_Condition;
	information	= Info_MoD_Mika_AndreVermaechtnis2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Mika_AndreVermaechtnis2_Condition()
{
	if (Mod_PAL_MikaHehler == 1)
	&& (Npc_GetDistToWP(self, "WP_ASSASSINE_08") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mika_AndreVermaechtnis2_Info()
{
	AI_Output(self, hero, "Info_Mod_Mika_AndreVermaechtnis2_13_00"); //Scheiße, wir sitzen in der Falle. Kämpf um dein Leben, sonst ergeht es uns wie Yasin.

	AI_StopProcessInfos	(self);

	self.guild = GIL_STRF;
	Npc_SetTrueGuild	(self, GIL_STRF);

	Mod_587_NONE_Jesper_NW.guild = GIL_STRF;
	Npc_SetTrueGuild	(Mod_587_NONE_Jesper_NW, GIL_STRF);
};

INSTANCE Info_Mod_Mika_Pflanzensammler (C_INFO)
{
	npc		= Mod_598_MIL_Mika_NW;
	nr		= 1;
	condition	= Info_Mod_Mika_Pflanzensammler_Condition;
	information	= Info_MoD_Mika_Pflanzensammler_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Mika_Pflanzensammler_Condition()
{
	if (Npc_HasItems(hero, ItPl_Health_Herb_01) >= 150)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mika_Pflanzensammler_Info()
{
	AI_Output(self, hero, "Info_Mod_Mika_Pflanzensammler_13_00"); //He, bleib mal stehen!
	AI_Output(hero, self, "Info_Mod_Mika_Pflanzensammler_15_01"); //Was ist denn los?
	AI_Output(self, hero, "Info_Mod_Mika_Pflanzensammler_13_02"); //Die Kräutersammler haben sich darüber beschwert, du würdest dauernd alle Heilpflanzen in der Gegend aufsammeln und für dich behalten.
	AI_Output(self, hero, "Info_Mod_Mika_Pflanzensammler_13_03"); //Die vorhandenen würden kaum ausreichen, den Bedarf zu decken.
	AI_Output(hero, self, "Info_Mod_Mika_Pflanzensammler_15_04"); //Wusste nicht, dass es verboten ist, selbst Pflanzen aufzulesen. Was wollt ihr von mir?
	AI_Output(self, hero, "Info_Mod_Mika_Pflanzensammler_13_05"); //Du gibst mir 50 Heilpflanzen und ich bezahle dich fast so gut wie einer der Händler.
	AI_Output(self, hero, "Info_Mod_Mika_Pflanzensammler_13_06"); //Dafür kriegst du keinen Ärger mehr.

	Info_ClearChoices	(Info_Mod_Mika_Pflanzensammler);

	Info_AddChoice	(Info_Mod_Mika_Pflanzensammler, "Das ist Erpressung. Niemand kann mir das Kräutersammeln verbieten!", Info_Mod_Mika_Pflanzensammler_B);
	Info_AddChoice	(Info_Mod_Mika_Pflanzensammler, "Also schön. Ich hoffe, es hilft.", Info_Mod_Mika_Pflanzensammler_A);
};

FUNC VOID Info_Mod_Mika_Pflanzensammler_B()
{
	AI_Output(hero, self, "Info_Mod_Mika_Pflanzensammler_B_15_00"); //Das ist Erpressung. Niemand kann mir das Kräutersammeln verbieten!
	AI_Output(self, hero, "Info_Mod_Mika_Pflanzensammler_B_13_01"); //Ich bedaure deine Entscheidung.
	AI_Output(self, hero, "Info_Mod_Mika_Pflanzensammler_B_13_02"); //Sie zwingt mich, dir meine Hilfe aufzukündigen für den Fall, dass du vor den Stadttoren angegriffen wirst.
	AI_Output(self, hero, "Info_Mod_Mika_Pflanzensammler_B_13_03"); //Und nun: geh.

	Info_ClearChoices	(Info_Mod_Mika_Pflanzensammler);

	Mod_Mika_Pflanzen = 2;
};

FUNC VOID Info_Mod_Mika_Pflanzensammler_A()
{
	AI_Output(hero, self, "Info_Mod_Mika_Pflanzensammler_A_15_00"); //Also schön. Ich hoffe, es hilft.

	B_GiveInvItems	(hero, self, ItPl_Health_Herb_01, 50);

	Npc_RemoveInvItems	(self, ItPl_Health_Herb_01, 50);

	AI_Output(self, hero, "Info_Mod_Mika_Pflanzensammler_A_13_01"); //Eine kluge Entscheidung. Ich wünsche einen angenehmen Tag.

	B_GiveInvItems	(self, hero, ItMi_Gold, 60);

	B_GivePlayerXP	(150);

	Info_ClearChoices	(Info_Mod_Mika_Pflanzensammler);

	Mod_Mika_Pflanzen = 1;
};

INSTANCE Info_Mod_Mika_Pickpocket (C_INFO)
{
	npc		= Mod_598_MIL_Mika_NW;
	nr		= 1;
	condition	= Info_Mod_Mika_Pickpocket_Condition;
	information	= Info_Mod_Mika_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Mika_Pickpocket_Condition()
{
	C_Beklauen	(80, ItMi_Gold, 400);
};

FUNC VOID Info_Mod_Mika_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Mika_Pickpocket);

	Info_AddChoice	(Info_Mod_Mika_Pickpocket, DIALOG_BACK, Info_Mod_Mika_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Mika_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Mika_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Mika_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Mika_Pickpocket);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Aabid_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Aabid_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Aabid_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Mika_EXIT (C_INFO)
{
	npc		= Mod_598_MIL_Mika_NW;
	nr		= 1;
	condition	= Info_Mod_Mika_EXIT_Condition;
	information	= Info_Mod_Mika_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Mika_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Mika_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};