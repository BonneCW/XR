INSTANCE Info_Mod_Edda_Hi (C_INFO)
{
	npc		= Mod_572_NONE_Edda_NW;
	nr		= 1;
	condition	= Info_Mod_Edda_Hi_Condition;
	information	= Info_Mod_Edda_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Und du bist?";
};

FUNC INT Info_Mod_Edda_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Edda_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Edda_Hi_15_00"); //Und du bist?
	AI_Output(self, hero, "Info_Mod_Edda_Hi_26_01"); //Mein Name ist Edda. Ich koche den größten Teil des Tages Suppen und Sude gegen alle möglichen Krankheiten.
};

INSTANCE Info_Mod_Edda_SuppeKochenLernen (C_INFO)
{
	npc		= Mod_572_NONE_Edda_NW;
	nr		= 1;
	condition	= Info_Mod_Edda_SuppeKochenLernen_Condition;
	information	= Info_Mod_Edda_SuppeKochenLernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Kannst du mir zeigen, wie man Suppen kocht?";
};

FUNC INT Info_Mod_Edda_SuppeKochenLernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Edda_Hi))
	&& (!Mod_Edda_Lernen)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Edda_SuppeKochenLernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Edda_SuppeKochenLernen_15_00"); //Kannst du mir zeigen, wie man Suppen kocht?
	AI_Output(self, hero, "Info_Mod_Edda_SuppeKochenLernen_26_01"); //Wenn du magst, gebe ich mein Wissen gern weiter.
	AI_Output(self, hero, "Info_Mod_Edda_SuppeKochenLernen_26_02"); //Da ich durch meine Arbeit kaum etwas verdiene, wäre ich dir aber für eine kleine Spende sehr dankbar.

	Info_ClearChoices	(Info_Mod_Edda_SuppeKochenLernen);

	Info_AddChoice	(Info_Mod_Edda_SuppeKochenLernen, "Später vielleicht.", Info_Mod_Edda_SuppeKochenLernen_B);

	if (Npc_HasItems(hero, ItMi_Gold) >= 50)
	{
		Info_AddChoice	(Info_Mod_Edda_SuppeKochenLernen, "Hier hast du ein wenig Gold. (50 Gold geben)", Info_Mod_Edda_SuppeKochenLernen_A);
	};
};

FUNC VOID Info_Mod_Edda_SuppeKochenLernen_B()
{
	AI_Output(hero, self, "Info_Mod_Edda_SuppeKochenLernen_B_15_00"); //Später vielleicht.

	Info_ClearChoices	(Info_Mod_Edda_SuppeKochenLernen);

};

FUNC VOID Info_Mod_Edda_SuppeKochenLernen_A()
{
	AI_Output(hero, self, "Info_Mod_Edda_SuppeKochenLernen_A_15_00"); //Hier hast du ein wenig Gold.

	B_GiveInvItems	(hero, self, ItMi_Gold, 50);

	AI_Output(self, hero, "Info_Mod_Edda_SuppeKochenLernen_A_26_01"); //Dann sag Bescheid, wenn es losgehen kann.

	Mod_Edda_Lernen = TRUE;

	Info_ClearChoices	(Info_Mod_Edda_SuppeKochenLernen);
};

INSTANCE Info_Mod_Edda_WiesoHier (C_INFO)
{
	npc		= Mod_572_NONE_Edda_NW;
	nr		= 1;
	condition	= Info_Mod_Edda_WiesoHier_Condition;
	information	= Info_Mod_Edda_WiesoHier_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wieso wohnst du hier so abgeschieden von den anderen?";
};

FUNC INT Info_Mod_Edda_WiesoHier_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Edda_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Edda_WiesoHier_Info()
{
	AI_Output(hero, self, "Info_Mod_Edda_WiesoHier_15_00"); //Wieso wohnst du hier so abgeschieden von den anderen?
	AI_Output(self, hero, "Info_Mod_Edda_WiesoHier_26_01"); //Ich hatte vor einigen Jahren die Blattern und war eine der wenigen Überlebenden.
	AI_Output(self, hero, "Info_Mod_Edda_WiesoHier_26_02"); //Seitdem werde ich wie eine Aussätzige behandelt, und niemand kommt freiwillig zu mir.

	EddasWanzen_Tag = Wld_GetDay();
};

INSTANCE Info_Mod_Edda_Problem (C_INFO)
{
	npc		= Mod_572_NONE_Edda_NW;
	nr		= 1;
	condition	= Info_Mod_Edda_Problem_Condition;
	information	= Info_Mod_Edda_Problem_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Edda_Problem_Condition()
{
	if (Wld_GetDay() > 6)
	&& (Npc_KnowsInfo(hero, Info_Mod_Edda_Hi))
	&& (Wld_GetDay() > EddasWanzen_Tag)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Edda_Problem_Info()
{
	AI_Output(self, hero, "Info_Mod_Edda_Problem_26_00"); //Du musst mir helfen, bitte!
	AI_Output(hero, self, "Info_Mod_Edda_Problem_15_01"); //Was gibt's denn?
	AI_Output(self, hero, "Info_Mod_Edda_Problem_26_02"); //Mein Haus ist seit gestern voller Fleischwanzen!
	AI_Output(hero, self, "Info_Mod_Edda_Problem_15_03"); //Wieso so hysterisch? Die tun doch nichts.
	AI_Output(self, hero, "Info_Mod_Edda_Problem_26_04"); //Sie sind gefährliche Krankheitsüberträger. Die Pocken, die ich nur knapp überlebt habe, sollen durch sie verbreitet worden sein.
	AI_Output(self, hero, "Info_Mod_Edda_Problem_26_05"); //Seitdem ich das weiß, kann ich nicht mehr in ihrer Nähe sein.

	Edda_Schlafplatz = TRUE;

	Wld_InsertNpc	(Meatbug_Edda_01, "FP_EDDAS_WANZE_01");
	Wld_InsertNpc	(Meatbug_Edda_02, "FP_EDDAS_WANZE_02");
	Wld_InsertNpc	(Meatbug_Edda_03, "FP_EDDAS_WANZE_03");
	Wld_InsertNpc	(Meatbug_Edda_04, "FP_EDDAS_WANZE_04");
	Wld_InsertNpc	(Meatbug_Edda_05, "FP_EDDAS_WANZE_05");

	Info_ClearChoices	(Info_Mod_Edda_Problem);

	Info_AddChoice	(Info_Mod_Edda_Problem, "Ich werde mich davor hüten, mit Fleischwanzen in Berührung zu kommen.", Info_Mod_Edda_Problem_Nein);
	Info_AddChoice	(Info_Mod_Edda_Problem, "Das wird kurz und schmerzlos erledigt.", Info_Mod_Edda_Problem_Ja);
};

FUNC VOID Info_Mod_Edda_Problem_Nein()
{
	AI_Output(hero, self, "Info_Mod_Edda_Problem_Nein_15_00"); //Ich werde mich davor hüten, mit Fleischwanzen in Berührung zu kommen.
	AI_Output(self, hero, "Info_Mod_Edda_Problem_Nein_26_01"); //Aber was mache ich dann jetzt? Ich brauche Hilfe!

	Info_ClearChoices	(Info_Mod_Edda_Problem);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Edda_Problem_Ja()
{
	AI_Output(hero, self, "Info_Mod_Edda_Problem_Ja_15_00"); //Das wird kurz und schmerzlos erledigt.
	AI_Output(self, hero, "Info_Mod_Edda_Problem_Ja_26_01"); //(erleichtert) Ich danke dir schon jetzt vielmals!

	Info_ClearChoices	(Info_Mod_Edda_Problem);

	AI_StopProcessInfos	(self);

	Eddas_Wanzen = TRUE;

	Log_CreateTopic	(TOPIC_MOD_EDDASWANZEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_EDDASWANZEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_EDDASWANZEN, "Edda hat ein kleines Problem mit Fleischwanzen in ihrer Hütte. Ich soll sie vertreiben.");
};

INSTANCE Info_Mod_Edda_Wanzen (C_INFO)
{
	npc		= Mod_572_NONE_Edda_NW;
	nr		= 1;
	condition	= Info_Mod_Edda_Wanzen_Condition;
	information	= Info_Mod_Edda_Wanzen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Wanzen sind weg.";
};

FUNC INT Info_Mod_Edda_Wanzen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Edda_Problem))
	&& (Eddas_Wanzen == TRUE)
	&& (Npc_IsDead(Meatbug_Edda_01))
	&& (Npc_IsDead(Meatbug_Edda_02))
	&& (Npc_IsDead(Meatbug_Edda_03))
	&& (Npc_IsDead(Meatbug_Edda_04))
	&& (Npc_IsDead(Meatbug_Edda_05))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Edda_Wanzen_Info()
{
	AI_Output(hero, self, "Info_Mod_Edda_Wanzen_15_00"); //Die Wanzen sind weg.
	AI_Output(self, hero, "Info_Mod_Edda_Wanzen_26_01"); //Endlich kann ich zurück in meine Hütte.
	AI_Output(self, hero, "Info_Mod_Edda_Wanzen_26_02"); //Vielen Dank. Hier hast du eine kleine Belohnung

	B_GiveInvItems	(self, hero, ItMi_Gold, 10);

	B_GivePlayerXP	(50);

	EddasWanzen_Tag = Wld_GetDay();

	B_SetTopicStatus	(TOPIC_MOD_EDDASWANZEN, LOG_SUCCESS);

	CurrentNQ += 1;

	B_Göttergefallen (1, 1);
};

INSTANCE Info_Mod_Edda_ProblemBack (C_INFO)
{
	npc		= Mod_572_NONE_Edda_NW;
	nr		= 1;
	condition	= Info_Mod_Edda_ProblemBack_Condition;
	information	= Info_Mod_Edda_ProblemBack_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Edda_ProblemBack_Condition()
{
	if (Wld_GetDay() > EddasWanzen_Tag)
	&& (Npc_KnowsInfo(hero, Info_Mod_Edda_Wanzen))
	&& (Kapitel >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Edda_ProblemBack_Info()
{
	AI_Output(self, hero, "Info_Mod_Edda_ProblemBack_26_00"); //Es sind schon wieder Fleischwanzen in meiner Hütte! Sie krabbeln überall herum!
	AI_Output(hero, self, "Info_Mod_Edda_ProblemBack_15_01"); //Wie konnte das denn geschehen? Ich habe sie doch erst letztens alle getötet.
	AI_Output(self, hero, "Info_Mod_Edda_ProblemBack_26_02"); //Entweder ist es Schicksal ... oder da hat jemand nachgeholfen.
	AI_Output(hero, self, "Info_Mod_Edda_ProblemBack_15_03"); //(skeptisch) Wer sollte das tun?
	AI_Output(self, hero, "Info_Mod_Edda_ProblemBack_26_04"); //Jemand, der mich kennt und weiß, wie ich Fleischwanzen hasse.
	AI_Output(self, hero, "Info_Mod_Edda_ProblemBack_26_05"); //Ich kann mir nicht helfen, aber ich habe Angst.
	AI_Output(self, hero, "Info_Mod_Edda_ProblemBack_26_06"); //Würdest du mir noch ein Mal mit den Fleischwanzen aushelfen?
	AI_Output(hero, self, "Info_Mod_Edda_ProblemBack_15_07"); //Schon so gut wie geschehen.

	AI_StopProcessInfos	(self);

	Wld_InsertNpc	(Meatbug_Edda_06, "FP_EDDAS_WANZE_01");
	Wld_InsertNpc	(Meatbug_Edda_07, "FP_EDDAS_WANZE_02");
	Wld_InsertNpc	(Meatbug_Edda_08, "FP_EDDAS_WANZE_03");
	Wld_InsertNpc	(Meatbug_Edda_09, "FP_EDDAS_WANZE_04");
	Wld_InsertNpc	(Meatbug_Edda_10, "FP_EDDAS_WANZE_05");

	Eddas_Wanzen_Back = TRUE;

	Log_CreateTopic	(TOPIC_MOD_EDDASWANZENBACK, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_EDDASWANZENBACK, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_EDDASWANZENBACK, "Edda hat schon wieder Wanzen in ihrer Hütte. Sie vermutet, dass jemand die Wanzen dort ausgesetzt hat.");
};

INSTANCE Info_Mod_Edda_WanzenBack (C_INFO)
{
	npc		= Mod_572_NONE_Edda_NW;
	nr		= 1;
	condition	= Info_Mod_Edda_WanzenBack_Condition;
	information	= Info_Mod_Edda_WanzenBack_Info;
	permanent	= 0;
	important	= 0;
	description	= "Es sollte keine Fleischwanze überlebt haben.";
};

FUNC INT Info_Mod_Edda_WanzenBack_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Edda_ProblemBack))
	&& (Eddas_Wanzen_Back == TRUE)
	&& (Npc_IsDead(Meatbug_Edda_06))
	&& (Npc_IsDead(Meatbug_Edda_07))
	&& (Npc_IsDead(Meatbug_Edda_08))
	&& (Npc_IsDead(Meatbug_Edda_09))
	&& (Npc_IsDead(Meatbug_Edda_10))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Edda_WanzenBack_Info()
{
	AI_Output(hero, self, "Info_Mod_Edda_WanzenBack_15_00"); //Es sollte keine Fleischwanze überlebt haben.
	AI_Output(self, hero, "Info_Mod_Edda_WanzenBack_26_01"); //Ich kann dir gar nicht sagen, wie froh ich bin!
	AI_Output(self, hero, "Info_Mod_Edda_WanzenBack_26_02"); //Aber einen kleinen Gefallen musst du mir noch tun, damit ich wieder beruhigt schlafen kann:
	AI_Output(self, hero, "Info_Mod_Edda_WanzenBack_26_03"); //Würdest du dich bitte in der nächsten Nacht draußen hinter der Hütte auf die Lauer legen?
	AI_Output(hero, self, "Info_Mod_Edda_WanzenBack_15_04"); //Klar. Kein Problem.

	B_GivePlayerXP	(50);

	Eddas_Wanzen_Back = 2;

	B_StartOtherRoutine	(Mod_575_NONE_Fenia_NW, "WANZEN");

	B_LogEntry	(TOPIC_MOD_EDDASWANZENBACK, "Die Wanzen sind zwar erledigt, aber Edda kann erst wieder ruhig schlafen, wenn sie weiß, dass niemand ihr die Wanzen nachts in das Haus schmuggelt. Ich werde mich deswegen in der nächsten Nacht hinter der Hütte auf die Lauer legen.");
};

INSTANCE Info_Mod_Edda_Fenia (C_INFO)
{
	npc		= Mod_572_NONE_Edda_NW;
	nr		= 1;
	condition	= Info_Mod_Edda_Fenia_Condition;
	information	= Info_Mod_Edda_Fenia_Info;
	permanent	= 0;
	important	= 0;
	description	= "Es war tatsächlich kein Zufall, dass die Fleischwanzen bei dir gelandet sind.";
};

FUNC INT Info_Mod_Edda_Fenia_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fenia_Wanzen))
	&& (Eddas_Wanzen_Back == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Edda_Fenia_Info()
{
	AI_Output(hero, self, "Info_Mod_Edda_Fenia_15_00"); //Es war tatsächlich kein Zufall, dass die Fleischwanzen bei dir gelandet sind.
	AI_Output(self, hero, "Info_Mod_Edda_Fenia_26_01"); //Wer war's? Sag schon!
	AI_Output(hero, self, "Info_Mod_Edda_Fenia_15_02"); //Fenia will dich gesehen haben, wie du mit ihrem Mann angebandelt hast.
	AI_Output(self, hero, "Info_Mod_Edda_Fenia_26_03"); //(lacht freudlos) Du meinst unser Verkaufsgespräch?
	AI_Output(self, hero, "Info_Mod_Edda_Fenia_26_04"); //Weil er nicht so abweisend zu mir war wie alle anderen?
	AI_Output(hero, self, "Info_Mod_Edda_Fenia_15_05"); //Scheint so. Was willst du jetzt machen?

	if (hero.guild != GIL_PAL)
	{
		AI_Output(self, hero, "Info_Mod_Edda_Fenia_26_06"); //Was kann ich schon machen? Die Miliz würde sich nicht dafür interessieren.
		AI_Output(self, hero, "Info_Mod_Edda_Fenia_26_07"); //Ich werde mit ihr reden und sie zur Einsicht bringen müssen.
		AI_Output(self, hero, "Info_Mod_Edda_Fenia_26_08"); //Dir aber muss ich meinen herzlichsten Dank aussprechen. Du bist ein guter Mensch.

		B_GivePlayerXP	(100);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Edda_Fenia_26_09"); //Du gehörst doch zu den Wächtern der Stadt, oder irre mich da?
		AI_Output(self, hero, "Info_Mod_Edda_Fenia_26_10"); //Kannst du nicht vielleicht etwas unternehmen?
		AI_Output(hero, self, "Info_Mod_Edda_Fenia_15_11"); //Ich kann dich unter meinen persönlichen Schutz stellen.
		AI_Output(hero, self, "Info_Mod_Edda_Fenia_15_12"); //Wenn dir noch ein Mal etwas angetan wird, werde ich mir Fenia vorknöpfen.
		AI_Output(self, hero, "Info_Mod_Edda_Fenia_26_13"); //Vielleicht ist es am sinnvollsten, wenn ich ihr das gleich sage ... Dann kommt sie auf keine dummen Gedanken mehr.
		AI_Output(self, hero, "Info_Mod_Edda_Fenia_26_14"); //Dafür muss ich dir meinen herzlichsten Dank aussprechen. Du bist ein guter Mensch.

		B_GivePlayerXP	(150);
	};

	B_GiveInvItems	(self, hero, ItMi_Gold, 50);

	Eddas_Wanzen_Back = 5;

	B_SetTopicStatus	(TOPIC_MOD_EDDASWANZENBACK, LOG_SUCCESS);

	CurrentNQ += 1;

	B_Göttergefallen (1, 1);
};

INSTANCE Info_Mod_Edda_FeniaNicht (C_INFO)
{
	npc		= Mod_572_NONE_Edda_NW;
	nr		= 1;
	condition	= Info_Mod_Edda_FeniaNicht_Condition;
	information	= Info_Mod_Edda_FeniaNicht_Info;
	permanent	= 0;
	important	= 0;
	description	= "Es war niemand hinter deinem Haus.";
};

FUNC INT Info_Mod_Edda_FeniaNicht_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fenia_Wanzen))
	&& (Eddas_Wanzen_Back == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Edda_FeniaNicht_Info()
{
	AI_Output(hero, self, "Info_Mod_Edda_FeniaNicht_15_00"); //Es war niemand hinter deinem Haus.
	AI_Output(self, hero, "Info_Mod_Edda_FeniaNicht_26_01"); //Hm ... na gut, dann sind die Wanzen wohl wirklich zufällig in meine Haus gekommen.
	AI_Output(self, hero, "Info_Mod_Edda_FeniaNicht_26_02"); //Ich danke dir, hier ist eine kleine Belohnung.

	B_GiveInvItems	(self, hero, ItMi_Gold, 25);

	Eddas_Wanzen_Back = 5;

	B_SetTopicStatus	(TOPIC_MOD_EDDASWANZENBACK, LOG_SUCCESS);
};

INSTANCE Info_Mod_Edda_Shakir (C_INFO)
{
	npc		= Mod_572_NONE_Edda_NW;
	nr		= 1;
	condition	= Info_Mod_Edda_Shakir_Condition;
	information	= Info_Mod_Edda_Shakir_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hätte gerne eine Auskunft.";
};

FUNC INT Info_Mod_Edda_Shakir_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Moe_Shakir))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Edda_Shakir_Info()
{
	AI_Output(hero, self, "Info_Mod_Edda_Shakir_15_00"); //Ich hätte gerne eine Auskunft.
	AI_Output(self, hero, "Info_Mod_Edda_Shakir_26_01"); //Und die wäre?
	AI_Output(hero, self, "Info_Mod_Edda_Shakir_15_02"); //Ich suche eine ... hm, wie soll ich sagen? Ein Straßenmädchen oder so.
	AI_Output(self, hero, "Info_Mod_Edda_Shakir_26_03"); //Eine Dirne meinst du. Sag's doch gleich. Nein, da haben wir keine im Ort.
	AI_Output(hero, self, "Info_Mod_Edda_Shakir_15_04"); //Und wo könnte ich ...
	AI_Output(self, hero, "Info_Mod_Edda_Shakir_26_05"); //Da fällt mir was ein. Drüben beim Schiffsbauer steht in letzter Zeit immer eine Frau rum, als wenn sie auf was wartet.
	AI_Output(self, hero, "Info_Mod_Edda_Shakir_26_06"); //Heisst Jana, glaub ich. Vielleicht ... (laut) aber sag nicht, dass ich das gesagt habe.
	AI_Output(hero, self, "Info_Mod_Edda_Shakir_15_07"); //Verstehe. Danke.

	B_LogEntry	(TOPIC_MOD_ASS_SHAKIR_FRAU, "Edda meint, ich soll mal mit Jana reden. Die steht jeden Tag beim Schiffsbauer rum, als warte sie auf etwas.");
};

INSTANCE Info_Mod_Edda_SuppeKochenLernen2 (C_INFO)
{
	npc		= Mod_572_NONE_Edda_NW;
	nr		= 1;
	condition	= Info_Mod_Edda_SuppeKochenLernen2_Condition;
	information	= Info_Mod_Edda_SuppeKochenLernen2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie koche ich eine Suppe? (3 LP)";
};

FUNC INT Info_Mod_Edda_SuppeKochenLernen2_Condition()
{
	if (Mod_Schwierigkeit != 4)
	{
		Info_Mod_Edda_SuppeKochenLernen2.description = "Wie koche ich eine Suppe? (3 LP)";
	}
	else
	{
		Info_Mod_Edda_SuppeKochenLernen2.description = "Wie koche ich eine Suppe? (300 Gold)";
	};

	if (Mod_Edda_Lernen == 1) {
		return 1;
	};
};

FUNC VOID Info_Mod_Edda_SuppeKochenLernen2_Info()
{
	AI_Output(hero, self, "Info_Mod_Edda_SuppeKochenLernen2_15_00"); //Wie koche ich eine Suppe?

	if ((Mod_Schwierigkeit != 4)
	&& (hero.lp < 3))
	|| ((Mod_Schwierigkeit == 4)
	&& (Npc_HasItems(hero, ItMi_Gold) < 300)) {
		B_Say (self, hero, "$NOLEARNNOPOINTS");
	} else {
		if (Mod_Schwierigkeit != 4) {
			hero.lp -= 3;
		} else {
			B_GiveInvItems	(hero, self, ItMi_Gold, 300);
		};

		AI_Output(self, hero, "Info_Mod_Edda_SuppeKochenLernen2_26_01"); //Die Grundlagen sind schnell erklärt: Du brauchst einen mit Wasser gefüllten Topf, unter dem du ein Feuer entfachst, und eine Rezeptur.
		AI_Output(self, hero, "Info_Mod_Edda_SuppeKochenLernen2_26_02"); //Dem jeweiligen Rezept entnimmst du die Zutaten, die du unter ständigem Rühren in den Topf gibst.
		AI_Output(self, hero, "Info_Mod_Edda_SuppeKochenLernen2_26_03"); //Damit die Suppe genießbar ist, darfst du das Würzen nicht vergessen.
		AI_Output(self, hero, "Info_Mod_Edda_SuppeKochenLernen2_26_04"); //Sobald alles im Topf ist, dämpfst du das Feuer und lässt die Suppe mit geschlossenem Deckel eine Zeit lang köcheln.

		Mod_Edda_Lernen = 2;
	};
};

INSTANCE Info_Mod_Edda_Flugblaetter (C_INFO)
{
	npc		= Mod_572_NONE_Edda_NW;
	nr		= 1;
	condition	= Info_Mod_Edda_Flugblaetter_Condition;
	information	= Info_Mod_Edda_Flugblaetter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab hier ein Flugblatt für dich.";
};

FUNC INT Info_Mod_Edda_Flugblaetter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Auftrag_2))
	&& (Npc_HasItems(hero, MatteoFlugblaetter) >= 1)
	&& (Mod_Flugblaetter < 20)
	&&(!Npc_KnowsInfo(hero, Info_Mod_Matteo_Flugblaetter))
	&& (Npc_KnowsInfo(hero, Info_Mod_Edda_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Edda_Flugblaetter_Info()
{
	B_Say (hero, self, "$MATTEOPAPER");

	B_GiveInvItems	(hero, self, MatteoFlugblaetter, 1);

	AI_Output(self, hero, "Info_Mod_Edda_Flugblaetter_26_01"); //Oh danke. Mal sehen ...

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Edda_Flugblaetter_26_02"); //Ah ja. Vielleicht werd ich mal bei Matteo vorbeischauen.

	Mod_Flugblaetter += 1;
};

INSTANCE Info_Mod_Edda_Pickpocket (C_INFO)
{
	npc		= Mod_572_NONE_Edda_NW;
	nr		= 1;
	condition	= Info_Mod_Edda_Pickpocket_Condition;
	information	= Info_Mod_Edda_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_30_Female;
};

FUNC INT Info_Mod_Edda_Pickpocket_Condition()
{
	C_Beklauen	(10, ItFo_FishSoup, 2);
};

FUNC VOID Info_Mod_Edda_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Edda_Pickpocket);

	Info_AddChoice	(Info_Mod_Edda_Pickpocket, DIALOG_BACK, Info_Mod_Edda_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Edda_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Edda_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Edda_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Edda_Pickpocket);
};

FUNC VOID Info_Mod_Edda_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Edda_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Edda_Pickpocket);

		Info_AddChoice	(Info_Mod_Edda_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Edda_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Edda_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Edda_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Edda_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Edda_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Edda_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Edda_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Edda_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Edda_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Edda_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Edda_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Edda_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Edda_EXIT (C_INFO)
{
	npc		= Mod_572_NONE_Edda_NW;
	nr		= 1;
	condition	= Info_Mod_Edda_EXIT_Condition;
	information	= Info_Mod_Edda_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Edda_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Edda_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};