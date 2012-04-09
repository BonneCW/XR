INSTANCE Info_Mod_Faice_Hi (C_INFO)
{
	npc		= Mod_4019_VMG_Faice_MT;
	nr		= 1;
	condition	= Info_Mod_Faice_Hi_Condition;
	information	= Info_Mod_Faice_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Faice_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Faice_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Faice_Hi_03_01"); //Ich bin Faice. Stör mich nicht, ich hab zu tun.
};

INSTANCE Info_Mod_Faice_QuestHermy (C_INFO)
{
	npc		= Mod_4019_VMG_Faice_MT;
	nr		= 1;
	condition	= Info_Mod_Faice_QuestHermy_Condition;
	information	= Info_Mod_Faice_QuestHermy_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Faice_QuestHermy_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Turendil_Matronen))
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Faice_QuestHermy_Info()
{
	AI_Output(self, hero, "Info_Mod_Faice_QuestHermy_03_00"); //Ah, du.

	Info_ClearChoices	(Info_Mod_Faice_QuestHermy);

	Info_AddChoice	(Info_Mod_Faice_QuestHermy, "Was gibt’s?", Info_Mod_Faice_QuestHermy_B);
	Info_AddChoice	(Info_Mod_Faice_QuestHermy, "Turendil schickt mich.", Info_Mod_Faice_QuestHermy_A);
};

FUNC VOID Info_Mod_Faice_QuestHermy_B()
{
	AI_Output(hero, self, "Info_Mod_Faice_QuestHermy_B_15_00"); //Was gibt’s?
	AI_Output(self, hero, "Info_Mod_Faice_QuestHermy_B_03_01"); //Triff dich mit Hermy.
	AI_Output(hero, self, "Info_Mod_Faice_QuestHermy_B_15_02"); //Alles klar.

	Log_CreateTopic	(TOPIC_MOD_FAICE_HARPIE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_FAICE_HARPIE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_FAICE_HARPIE, "Faice meinte, ich soll mich mit einem Magier namens Hermy treffen. Er wird mir wahrscheinlich weitere Anweisungen geben.");

	Info_ClearChoices	(Info_Mod_Faice_QuestHermy);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Faice_QuestHermy_A()
{
	AI_Output(hero, self, "Info_Mod_Faice_QuestHermy_A_15_00"); //Turendil hat gesagt, dass ich zu dir kommen könne, wenn ich einen neuen Auftrag suche.
	AI_Output(self, hero, "Info_Mod_Faice_QuestHermy_A_03_01"); //Fasse dich kurz, ich hab' zu tun.
	AI_Output(hero, self, "Info_Mod_Faice_QuestHermy_A_15_02"); //Alles klar.

	Info_ClearChoices	(Info_Mod_Faice_QuestHermy);

	Info_AddChoice	(Info_Mod_Faice_QuestHermy, "Was gibt’s?", Info_Mod_Faice_QuestHermy_B);
	Info_AddChoice	(Info_Mod_Faice_QuestHermy, "Verstehe. Ich werde mich in Zukunft kürzer fassen.", Info_Mod_Faice_QuestHermy_C);
};

FUNC VOID Info_Mod_Faice_QuestHermy_C()
{
	AI_Output(hero, self, "Info_Mod_Faice_QuestHermy_C_15_00"); //Verstehe. Ich werde mich in Zukunft kürzer fassen.
	
	Info_Mod_Faice_QuestHermy_B();
};

INSTANCE Info_Mod_Faice_Aufnahmequest (C_INFO)
{
	npc		= Mod_4019_VMG_Faice_MT;
	nr		= 1;
	condition	= Info_Mod_Faice_Aufnahmequest_Condition;
	information	= Info_Mod_Faice_Aufnahmequest_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Faice_Aufnahmequest_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hermy_Harpie))
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Faice_Aufnahmequest_Info()
{
	AI_Output(self, hero, "Info_Mod_Faice_Aufnahmequest_03_00"); //Was gibt’s?

	Info_ClearChoices	(Info_Mod_Faice_Aufnahmequest);

	Info_AddChoice	(Info_Mod_Faice_Aufnahmequest, "Wann bin ich dabei?", Info_Mod_Faice_Aufnahmequest_B);
	Info_AddChoice	(Info_Mod_Faice_Aufnahmequest, "Wie lange dauert es noch, bis ich bei euch mitmachen kann?", Info_Mod_Faice_Aufnahmequest_A);
};

FUNC VOID Info_Mod_Faice_Aufnahmequest_B()
{
	AI_Output(hero, self, "Info_Mod_Faice_Aufnahmequest_B_15_00"); //Wann bin ich dabei?
	AI_Output(self, hero, "Info_Mod_Faice_Aufnahmequest_B_03_01"); //Ein Auftrag noch.
	AI_Output(hero, self, "Info_Mod_Faice_Aufnahmequest_B_15_02"); //Worum geht’s?
	AI_Output(self, hero, "Info_Mod_Faice_Aufnahmequest_B_03_03"); //Ferco wird dich einweisen.
	AI_Output(hero, self, "Info_Mod_Faice_Aufnahmequest_B_15_04"); //Danke.
	AI_Output(self, hero, "Info_Mod_Faice_Aufnahmequest_B_03_05"); //Nun lass mich in Ruhe.

	B_LogEntry	(TOPIC_MOD_VMG_AUFNAHME, "Der letzte Auftrag ... ich soll zu Ferco gehen.");

	Info_ClearChoices	(Info_Mod_Faice_Aufnahmequest);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Faice_Aufnahmequest_A()
{
	AI_Output(hero, self, "Info_Mod_Faice_Aufnahmequest_A_15_00"); //Wie lange dauert es noch, bis ich bei euch mitmachen kann?
	AI_Output(self, hero, "Info_Mod_Faice_Aufnahmequest_A_03_01"); //Du vergeudest Zeit. Ich bin beschäftigt.
	AI_Output(hero, self, "Info_Mod_Faice_Aufnahmequest_A_15_02"); //Alles klar.

	Info_ClearChoices	(Info_Mod_Faice_Aufnahmequest);

	Info_AddChoice	(Info_Mod_Faice_Aufnahmequest, "Wann bin ich dabei?", Info_Mod_Faice_Aufnahmequest_B);
	Info_AddChoice	(Info_Mod_Faice_Aufnahmequest, "Okay, ich werde mich in Zukunft kürzer fassen. Versprochen.", Info_Mod_Faice_Aufnahmequest_C);
};

FUNC VOID Info_Mod_Faice_Aufnahmequest_C()
{
	AI_Output(hero, self, "Info_Mod_Faice_Aufnahmequest_C_15_00"); //Verstehe. Ich werde mich in Zukunft kürzer fassen.
	AI_Output(self, hero, "Info_Mod_Faice_Aufnahmequest_C_03_01"); //...
	
	Info_Mod_Faice_Aufnahmequest_B();
};

INSTANCE Info_Mod_Faice_Mud (C_INFO)
{
	npc		= Mod_4019_VMG_Faice_MT;
	nr		= 1;
	condition	= Info_Mod_Faice_Mud_Condition;
	information	= Info_Mod_Faice_Mud_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Faice_Mud_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ferco_Mud))
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Faice_Mud_Info()
{
	AI_Output(self, hero, "Info_Mod_Faice_Mud_03_00"); //Gut gemacht.

	if (!Npc_IsDead(Mod_803_STT_Mud_MT))
	{
		B_StartOtherRoutine	(Mod_803_STT_Mud_MT, "SAFETY");
	};

	Info_ClearChoices	(Info_Mod_Faice_Mud);

	Info_AddChoice	(Info_Mod_Faice_Mud, "Ferco hat gesagt, du würdest das Nötigste einleiten. Wie sieht’s also aus?", Info_Mod_Faice_Mud_B);
	Info_AddChoice	(Info_Mod_Faice_Mud, "Bin ich dabei?", Info_Mod_Faice_Mud_A);
};

FUNC VOID Info_Mod_Faice_Mud_B()
{
	AI_Output(hero, self, "Info_Mod_Faice_Mud_B_15_00"); //Ferco hat gesagt, du würdest das Nötigste einleiten. Wie sieht’s also aus?
	AI_Output(self, hero, "Info_Mod_Faice_Mud_B_03_01"); //Meine Zeit ist kostbar. Wann lernst du das endlich?

	Info_ClearChoices	(Info_Mod_Faice_Mud);

	Info_AddChoice	(Info_Mod_Faice_Mud, "Ich werde es mir für die Zukunft vormerken. Wie sieht es also aus?", Info_Mod_Faice_Mud_C);
	Info_AddChoice	(Info_Mod_Faice_Mud, "Bin ich dabei?", Info_Mod_Faice_Mud_A);
};

FUNC VOID Info_Mod_Faice_Mud_A()
{
	AI_Output(hero, self, "Info_Mod_Faice_Mud_A_15_00"); //Bin ich dabei?

	if (Mod_AnzahlNebengilden < MaxNebengilden)
	{
		AI_Output(self, hero, "Info_Mod_Faice_Mud_A_03_01"); //Sag Bescheid, wenn du bereit bist für die Aufnahme.
	
		Info_ClearChoices	(Info_Mod_Faice_Mud);

		B_SetTopicStatus	(TOPIC_MOD_FERCO_MUD, LOG_SUCCESS);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Faice_Mud_A_03_02"); //Leider hast du das alles umsonst getan, denn du gehörst bereits zu vielen Gemeinschaften an.
		AI_Output(self, hero, "Info_Mod_Faice_Mud_A_03_03"); //Wir können dich leider nicht bei uns aufnehmen.
	
		Info_ClearChoices	(Info_Mod_Faice_Mud);

		AI_StopProcessInfos	(self);

		B_GivePlayerXP	(250);

		B_SetTopicStatus	(TOPIC_MOD_FERCO_MUD, LOG_SUCCESS);
		B_SetTopicStatus	(TOPIC_MOD_VMG_AUFNAHME, LOG_FAILED);
	};
};

FUNC VOID Info_Mod_Faice_Mud_C()
{
	AI_Output(hero, self, "Info_Mod_Faice_Mud_C_15_00"); //Ich werde es mir für die Zukunft vormerken. Wie sieht es also aus?
	AI_Output(self, hero, "Info_Mod_Faice_Mud_C_03_01"); //...
	
	Info_Mod_Faice_Mud_A();
};

INSTANCE Info_Mod_Faice_Aufnahme (C_INFO)
{
	npc		= Mod_4019_VMG_Faice_MT;
	nr		= 1;
	condition	= Info_Mod_Faice_Aufnahme_Condition;
	information	= Info_Mod_Faice_Aufnahme_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich bin bereit für die Aufnahme.";
};

FUNC INT Info_Mod_Faice_Aufnahme_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Faice_Mud))
	&& (Mod_AnzahlNebengilden < MaxNebengilden)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Faice_Aufnahme_Info()
{
	AI_Output(hero, self, "Info_Mod_Faice_Aufnahme_15_00"); //Ich bin bereit für die Aufnahme.
	AI_Output(self, hero, "Info_Mod_Faice_Aufnahme_03_01"); //Ich werde das Nötigste einleiten. Komm später auf den Hof des Klosters.

	AI_StopProcessInfos	(self);

	Mod_VMG_Dabei = 1;

	Mod_AnzahlNebengilden += 1;

	B_GivePlayerXP	(450);

	B_StartOtherRoutine	(Mod_4020_VMG_Hermy_MT, "RITUAL");
	B_StartOtherRoutine	(Mod_1626_VMG_Furt_MT, "RITUAL");
	B_StartOtherRoutine	(Mod_1625_VMG_Neol_MT, "RITUAL");
	B_StartOtherRoutine	(Mod_1628_VMG_Anor_MT, "RITUAL");
	B_StartOtherRoutine	(self, "RITUAL");
	B_StartOtherRoutine	(Mod_1955_VMG_Turendil_MT, "RITUAL");

	B_LogEntry	(TOPIC_MOD_VMG_AUFNAHME, "Faice meint, ich soll später auf den Hof des Klosters kommen, um aufgenommen zu werden. Ich sollte dort dann nochmal mit ihm sprechen.");
};

INSTANCE Info_Mod_Faice_Ritual (C_INFO)
{
	npc		= Mod_4019_VMG_Faice_MT;
	nr		= 1;
	condition	= Info_Mod_Faice_Ritual_Condition;
	information	= Info_Mod_Faice_Ritual_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Faice_Ritual_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Faice_Mud))
	&& (Npc_IsInState(self, ZS_Talk))
	&& (Mod_VMG_Dabei == 1)
	&& (Npc_GetDistToWP(self, "VMG_22") < 700)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Faice_Ritual_Info()
{
	AI_Output(self, hero, "Info_Mod_Faice_Ritual_03_00"); //Kann es losgehen?

	Info_ClearChoices	(Info_Mod_Faice_Ritual);

	Info_AddChoice	(Info_Mod_Faice_Ritual, "Ich muss noch etwas erledigen.", Info_Mod_Faice_Ritual_B);
	Info_AddChoice	(Info_Mod_Faice_Ritual, "Ja.", Info_Mod_Faice_Ritual_A);
};

FUNC VOID Info_Mod_Faice_Ritual_B()
{
	AI_Output(hero, self, "Info_Mod_Faice_Ritual_B_15_00"); //Ich muss noch etwas erledigen.
	AI_Output(self, hero, "Info_Mod_Faice_Ritual_B_03_01"); //Beeile dich.

	Info_ClearChoices	(Info_Mod_Faice_Ritual);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Faice_Ritual_A()
{
	AI_Output(hero, self, "Info_Mod_Faice_Ritual_A_15_00"); //Ja.
	AI_Output(self, hero, "Info_Mod_Faice_Ritual_A_03_01"); //Dann betrete die Mitte des Kreises.
	
	Info_ClearChoices	(Info_Mod_Faice_Ritual);

	Mod_VMG_Dabei = 2;

	Log_CreateTopic	(TOPIC_MOD_FAICE_HEILUNG, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_FAICE_HEILUNG, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_FAICE_HEILUNG, "Ich soll die Mitte des Kreises der Magier betreten, damit das Ritual beginnen kann.");
	B_SetTopicStatus	(TOPIC_MOD_VMG_AUFNAHME, LOG_SUCCESS);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Faice_RitualRunning (C_INFO)
{
	npc		= Mod_4019_VMG_Faice_MT;
	nr		= 1;
	condition	= Info_Mod_Faice_RitualRunning_Condition;
	information	= Info_Mod_Faice_RitualRunning_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Faice_RitualRunning_Condition()
{
	if (Mod_VMG_Dabei == 2)
	&& (Npc_GetDistToWP(hero, "VMG_22") < 700)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Faice_RitualRunning_Info()
{
	AI_Output(self, hero, "Info_Mod_Faice_RitualRunning_03_00"); //Mitglieder des Kreises der Verwandlungsmagier, es ist wieder so weit.
	AI_Output(self, hero, "Info_Mod_Faice_RitualRunning_03_01"); //Ein neues Mitglied betritt unsere Reihen und wird entweder ein Beschützer der Magier oder ein Magier selbst.
	AI_Output(self, hero, "Info_Mod_Faice_RitualRunning_03_02"); //Erinnert euch an seine Taten: Er rettete Tugettso, er besuchte Gelato, das Schneegebiet, er fand die verschollenen Spruchrollen der Verwandlungen zu einer Fleischwanze und zu einer Harpie.
	AI_Output(self, hero, "Info_Mod_Faice_RitualRunning_03_03"); //Heißt ihn willkommen!

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "DRAINED");

	Log_CreateTopic	(TOPIC_MOD_NEBENGILDEN, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_NEBENGILDEN, "Die Verwandlungsmagier haben mich als einen der ihren aufgenommen.");
};

INSTANCE Info_Mod_Faice_PrePruefung (C_INFO)
{
	npc		= Mod_4019_VMG_Faice_MT;
	nr		= 1;
	condition	= Info_Mod_Faice_PrePruefung_Condition;
	information	= Info_Mod_Faice_PrePruefung_Info;
	permanent	= 1;
	important	= 0;
	description	= "Du wolltest mich sprechen?";
};

FUNC INT Info_Mod_Faice_PrePruefung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Turendil_TradorTot))
	&& (Kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Faice_PrePruefung_Info()
{
	AI_Output(hero, self, "Info_Mod_Faice_PrePruefung_15_00"); //Du wolltest mich sprechen?
	AI_Output(self, hero, "Info_Mod_Faice_PrePruefung_03_01"); //Noch nicht, das muss warten.
};

INSTANCE Info_Mod_Faice_Pruefung (C_INFO)
{
	npc		= Mod_4019_VMG_Faice_MT;
	nr		= 1;
	condition	= Info_Mod_Faice_Pruefung_Condition;
	information	= Info_Mod_Faice_Pruefung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du wolltest mich sprechen?";
};

FUNC INT Info_Mod_Faice_Pruefung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Turendil_TradorTot))
	&& (Kapitel >= 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Faice_Pruefung_Info()
{
	AI_Output(hero, self, "Info_Mod_Faice_Pruefung_15_00"); //Du wolltest mich sprechen?
	AI_Output(self, hero, "Info_Mod_Faice_Pruefung_03_01"); //Ja, gut, dass du kommst. Ich habe ein wenig Zeit aufbringen können um dir etwas über uns zu erzählen.
	AI_Output(self, hero, "Info_Mod_Faice_Pruefung_03_02"); //Willst du es hören? Ansonsten gebe ich dir einfach eine Aufgabe.

	Info_ClearChoices	(Info_Mod_Faice_Pruefung);

	Info_AddChoice	(Info_Mod_Faice_Pruefung, "Die Aufgabe reicht.", Info_Mod_Faice_Pruefung_B);
	Info_AddChoice	(Info_Mod_Faice_Pruefung, "Lass hören.", Info_Mod_Faice_Pruefung_A);
};

FUNC VOID Info_Mod_Faice_Pruefung_C()
{
	AI_Output(self, hero, "Info_Mod_Faice_Pruefung_C_03_00"); //Den ersten Test zum Erlernen unserer uralten Techniken wird Genn dir erklären.
	AI_Output(self, hero, "Info_Mod_Faice_Pruefung_C_03_01"); //Du 	kannst nun wieder sicher nach Tugettso reisen, Albert hat den Teleporter repariert.
	AI_Output(self, hero, "Info_Mod_Faice_Pruefung_C_03_02"); //Lass dir von ihm einen neuen Stein geben.
	AI_Output(hero, self, "Info_Mod_Faice_Pruefung_C_15_03"); //Das werde ich. Wir sehen uns.
	AI_Output(self, hero, "Info_Mod_Faice_Pruefung_C_03_04"); //Deine Wege sollen behütet sein.

	Log_CreateTopic	(TOPIC_MOD_FAICE_PRUEFUNG, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_FAICE_PRUEFUNG, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Den ersten Test zum Erlernen der alten Techniken der Verwandlungsmagier soll Genn mir erklären.");

	Info_ClearChoices	(Info_Mod_Faice_Pruefung);
};

FUNC VOID Info_Mod_Faice_Pruefung_B()
{
	AI_Output(hero, self, "Info_Mod_Faice_Pruefung_B_15_00"); //Die Aufgabe reicht.

	Info_Mod_Faice_Pruefung_C();
};

FUNC VOID Info_Mod_Faice_Pruefung_A()
{
	AI_Output(hero, self, "Info_Mod_Faice_Pruefung_A_15_00"); //Lass hören.
	AI_Output(self, hero, "Info_Mod_Faice_Pruefung_A_03_01"); //Wie du sicherlich weißt, kommen wir aus Tugettso, du warst ja schon einige Male dort.
	AI_Output(self, hero, "Info_Mod_Faice_Pruefung_A_03_02"); //An dem Ort ist die Naturverbundenheit sehr groß musst du wissen, aber du kannst sie nur spüren, wenn du ein vollwertiges Mitglied bist.
	AI_Output(self, hero, "Info_Mod_Faice_Pruefung_A_03_03"); //Damit möchte ich dich nicht demütigen, ich 	weiß um deine Verdienste für uns. Mehr dazu aber später.

	Info_ClearChoices	(Info_Mod_Faice_Pruefung);

	Info_AddChoice	(Info_Mod_Faice_Pruefung, "[Weiter]", Info_Mod_Faice_Pruefung_E);
	Info_AddChoice	(Info_Mod_Faice_Pruefung, "Lass den Rest weg, das interessiert mich.", Info_Mod_Faice_Pruefung_D);
};

FUNC VOID Info_Mod_Faice_Pruefung_E()
{
	AI_Output(self, hero, "Info_Mod_Faice_Pruefung_E_03_00"); //Auf jeden Fall versuchen wir, mit der Natur zu leben, anstatt sie für unsere Zwecke auszunutzen.
	AI_Output(self, hero, "Info_Mod_Faice_Pruefung_E_03_01"); //Das ist nicht immer ganz einfach, schließlich brauchen auch wir ab und zu ein wenig Fleisch, die meisten von uns sind keine Vegetarier.
	AI_Output(self, hero, "Info_Mod_Faice_Pruefung_E_03_02"); //Aber durch spezielle Meditation sind wir in der Lage, mit den Tieren in Tugettso zu kommunizieren.
	AI_Output(self, hero, "Info_Mod_Faice_Pruefung_E_03_03"); //So können wir herausfinden, welche Tiere die Natur für uns vorgesehen hat, sie leisten auch keinen Widerstand beim Jagen.
	AI_Output(hero, self, "Info_Mod_Faice_Pruefung_E_15_04"); //Was hat das mit mir zu tun?
	AI_Output(self, hero, "Info_Mod_Faice_Pruefung_E_03_05"); //Du bist jetzt bereit, diese Techniken zu lernen. Können wir anfangen?
	AI_Output(hero, self, "Info_Mod_Faice_Pruefung_E_15_06"); //Lass hören.

	Info_Mod_Faice_Pruefung_C();
};

FUNC VOID Info_Mod_Faice_Pruefung_D()
{
	AI_Output(hero, self, "Info_Mod_Faice_Pruefung_D_15_00"); //Lass den Rest weg, das interessiert mich.

	Info_Mod_Faice_Pruefung_C();
};

INSTANCE Info_Mod_Faice_Pruefung2 (C_INFO)
{
	npc		= Mod_4019_VMG_Faice_MT;
	nr		= 1;
	condition	= Info_Mod_Faice_Pruefung2_Condition;
	information	= Info_Mod_Faice_Pruefung2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Da bin ich wieder.";
};

FUNC INT Info_Mod_Faice_Pruefung2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Genn_Pruefung3))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Faice_Pruefung2_Info()
{
	AI_Output(hero, self, "Info_Mod_Faice_Pruefung2_15_00"); //Da bin ich wieder.
	AI_Output(self, hero, "Info_Mod_Faice_Pruefung2_03_01"); //Ich weiß bereits Bescheid. Lass mich kurz zusammenfassen:

	if ((Mod_VMG_Pruefung_Genn + Mod_VMG_Pruefung_Asko + Mod_VMG_Pruefung_Per) == 4)
	{
		if (Mod_VMG_Pruefung_Genn == 2)
		&& (Mod_VMG_Pruefung_Asko == 1)
		&& (Mod_VMG_Pruefung_Per == 1)
		{
			AI_Output(self, hero, "Info_Mod_Faice_Pruefung2_03_02"); //Genn hat mir leider nichts Gutes berichten können, dafür habe ich von Asko und Per nur das Beste gehört.
		}
		else if (Mod_VMG_Pruefung_Genn == 1)
		&& (Mod_VMG_Pruefung_Asko == 2)
		&& (Mod_VMG_Pruefung_Per == 1)
		{
			AI_Output(self, hero, "Info_Mod_Faice_Pruefung2_03_03"); //Asko hat mir leider nichts Gutes berichten können, dafür habe ich von Genn und Per nur das Beste gehört.
		}
		else if (Mod_VMG_Pruefung_Genn == 1)
		&& (Mod_VMG_Pruefung_Asko == 1)
		&& (Mod_VMG_Pruefung_Per == 2)
		{
			AI_Output(self, hero, "Info_Mod_Faice_Pruefung2_03_04"); //Per hat mir leider nichts Gutes berichten können, dafür habe ich von Genn und Asko nur das Beste gehört.
		};

		AI_Output(self, hero, "Info_Mod_Faice_Pruefung2_03_05"); //Nach allem, was passiert ist, werde ich dich trotzdem angemessen belohnen und dir die Techniken beibringen.
		AI_Output(hero, self, "Info_Mod_Faice_Pruefung2_15_06"); //Das ist großzügig. Was hast du für mich?
		AI_Output(self, hero, "Info_Mod_Faice_Pruefung2_03_07"); //Du kannst wählen, ob du eine Rüstung, oder eine Robe haben möchtest. Jede dieser Rüstungen hat ihre eigenen Vor- und Nachteile.

		B_GivePlayerXP	(1000);

		Info_ClearChoices	(Info_Mod_Faice_Pruefung2);

		Info_AddChoice	(Info_Mod_Faice_Pruefung2, "Ich nehme die Robe.", Info_Mod_Faice_Pruefung2_B);
		Info_AddChoice	(Info_Mod_Faice_Pruefung2, "Ich nehme die Rüstung.", Info_Mod_Faice_Pruefung2_A);
	}
	else if ((Mod_VMG_Pruefung_Genn + Mod_VMG_Pruefung_Asko + Mod_VMG_Pruefung_Per) == 5)
	{
		if (Mod_VMG_Pruefung_Genn == 2)
		&& (Mod_VMG_Pruefung_Asko == 2)
		&& (Mod_VMG_Pruefung_Per == 1)
		{
			AI_Output(self, hero, "Info_Mod_Faice_Pruefung2_03_08"); //Genn und Asko haben mir berichtet, dass du ihre Aufgabe nicht geschafft hast, dafür war Per begeistert von dir.
		}
		else if (Mod_VMG_Pruefung_Genn == 2)
		&& (Mod_VMG_Pruefung_Asko == 1)
		&& (Mod_VMG_Pruefung_Per == 2)
		{
			AI_Output(self, hero, "Info_Mod_Faice_Pruefung2_03_09"); //Genn und Per haben mir berichtet, dass du ihre Aufgabe nicht geschafft hast, dafür war Asko begeistert von dir.
		}
		else if (Mod_VMG_Pruefung_Genn == 1)
		&& (Mod_VMG_Pruefung_Asko == 2)
		&& (Mod_VMG_Pruefung_Per == 2)
		{
			AI_Output(self, hero, "Info_Mod_Faice_Pruefung2_03_10"); //Asko und Per haben mir berichtet, dass du ihre Aufgabe nicht geschafft hast, dafür war Genn begeistert von dir.
		};

		B_GivePlayerXP	(800);

		AI_Output(self, hero, "Info_Mod_Faice_Pruefung2_03_11"); //Wenn du auf eine Belohnung verzichtest, werde ich dir die Techniken beibringen.
		AI_Output(hero, self, "Info_Mod_Faice_Pruefung2_15_12"); //Ich verzichte auf meine Belohnung. Lehre mich die alten Techniken.
		AI_Output(self, hero, "Info_Mod_Faice_Pruefung2_03_13"); //Komm wieder, wenn du bereit bist.

		B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Ich kann nun bei Faice lernen.");
		B_SetTopicStatus	(TOPIC_MOD_FAICE_PRUEFUNG, LOG_SUCCESS);
	}
	else if ((Mod_VMG_Pruefung_Genn + Mod_VMG_Pruefung_Asko + Mod_VMG_Pruefung_Per) == 6)
	{
		AI_Output(self, hero, "Info_Mod_Faice_Pruefung2_03_14"); //Du hast es leider nicht geschafft, dich für die alten Techniken zu qualifizieren.
		AI_Output(self, hero, "Info_Mod_Faice_Pruefung2_03_15"); //Sie werden dir nun für immer verwehrt bleiben. Tut mir Leid.
		AI_Output(hero, self, "Info_Mod_Faice_Pruefung2_15_16"); //Da kann man wohl nichts machen ... oder?
		AI_Output(self, hero, "Info_Mod_Faice_Pruefung2_03_17"); //Was meinst du damit?

		B_GivePlayerXP	(500);

		Info_ClearChoices	(Info_Mod_Faice_Pruefung2);

		Info_AddChoice	(Info_Mod_Faice_Pruefung2, "Wie wäre es mit 1000 Goldstücken?", Info_Mod_Faice_Pruefung2_D);
		Info_AddChoice	(Info_Mod_Faice_Pruefung2, "Nichts. Ich bin wohl einfach nicht gut genug. Auf Wiedersehen.", Info_Mod_Faice_Pruefung2_C);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Faice_Pruefung2_03_18"); //Du hast alle Aufgaben gemeistert und dich so qualifiziert, die alten Techniken zu erlernen. Meinen Glückwunsch!
		AI_Output(self, hero, "Info_Mod_Faice_Pruefung2_03_19"); //Natürlich sollst du auch eine angemessene Belohnung erhalten.
		AI_Output(hero, self, "Info_Mod_Faice_Pruefung2_15_20"); //Das ist sehr großzügig. Was hast du für mich?
		AI_Output(self, hero, "Info_Mod_Faice_Pruefung2_03_21"); //Du kannst wählen, ob du eine Rüstung, oder eine Robe haben möchtest. Jede dieser Rüstungen hat ihre eigenen Vor- und Nachteile.
		AI_Output(self, hero, "Info_Mod_Faice_Pruefung2_03_22"); //Dazu sollst du noch 1000 Goldstücke erhalten.

		B_GivePlayerXP	(1500);

		Info_ClearChoices	(Info_Mod_Faice_Pruefung2);

		Info_AddChoice	(Info_Mod_Faice_Pruefung2, "Ich nehme die Robe.", Info_Mod_Faice_Pruefung2_F);
		Info_AddChoice	(Info_Mod_Faice_Pruefung2, "Ich nehme die Rüstung.", Info_Mod_Faice_Pruefung2_E);
	};
};

FUNC VOID Info_Mod_Faice_Pruefung2_G()
{
	AI_Output(self, hero, "Info_Mod_Faice_Pruefung2_G_03_00"); //Die sollst du haben.
};

FUNC VOID Info_Mod_Faice_Pruefung2_F()
{
	AI_Output(hero, self, "Info_Mod_Faice_Pruefung2_F_15_00"); //Ich nehme die Robe.

	Info_Mod_Faice_Pruefung2_G();

	CreateInvItems	(hero, ItAr_Naturmagier2, 1);

	CreateInvItems	(hero, ItMi_Gold, 1000);

	B_ShowGivenThings	("1000 Goldmünzen und Verwandlungsmagierrobe erhalten");

	B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Ich habe meine Belohnung erhalten und kann nun bei Faice lernen.");
	B_SetTopicStatus	(TOPIC_MOD_FAICE_PRUEFUNG, LOG_SUCCESS);

	Info_ClearChoices	(Info_Mod_Faice_Pruefung2);
};

FUNC VOID Info_Mod_Faice_Pruefung2_E()
{
	AI_Output(hero, self, "Info_Mod_Faice_Pruefung2_E_15_00"); //Ich nehme die Rüstung.

	Info_Mod_Faice_Pruefung2_G();

	CreateInvItems	(hero, ItAr_Verwandlungskrieger, 1);

	CreateInvItems	(hero, ItMi_Gold, 1000);

	B_ShowGivenThings	("1000 Goldmünzen und Rüstung der Beschützer erhalten");

	B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Ich habe meine Belohnung erhalten und kann nun bei Faice lernen.");
	B_SetTopicStatus	(TOPIC_MOD_FAICE_PRUEFUNG, LOG_SUCCESS);

	Info_ClearChoices	(Info_Mod_Faice_Pruefung2);
};

FUNC VOID Info_Mod_Faice_Pruefung2_D()
{
	AI_Output(hero, self, "Info_Mod_Faice_Pruefung2_D_15_00"); //Wie wäre es mit 1000 Goldstücken?
	AI_Output(self, hero, "Info_Mod_Faice_Pruefung2_D_03_01"); //Wie kannst du es wagen? Wir sind unbestechlich! Aus meinen Augen!

	B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Ich habe keine Chance mehr, die alten Techniken zu erlernen.");
	B_SetTopicStatus	(TOPIC_MOD_FAICE_PRUEFUNG, LOG_SUCCESS);

	Info_ClearChoices	(Info_Mod_Faice_Pruefung2);
};

FUNC VOID Info_Mod_Faice_Pruefung2_C()
{
	AI_Output(hero, self, "Info_Mod_Faice_Pruefung2_C_15_00"); //Nichts. Ich bin wohl einfach nicht gut genug. Auf Wiedersehen.
	AI_Output(self, hero, "Info_Mod_Faice_Pruefung2_C_03_01"); //Lebe wohl.

	B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Ich habe keine Chance mehr, die alten Techniken zu erlernen.");
	B_SetTopicStatus	(TOPIC_MOD_FAICE_PRUEFUNG, LOG_SUCCESS);

	Info_ClearChoices	(Info_Mod_Faice_Pruefung2);
};

FUNC VOID Info_Mod_Faice_Pruefung2_B()
{
	AI_Output(hero, self, "Info_Mod_Faice_Pruefung2_B_15_00"); //Ich nehme die Robe.

	Info_Mod_Faice_Pruefung2_G();

	CreateInvItems	(hero, ItAr_Naturmagier2, 1);

	B_ShowGivenThings	("Verwandlungsmagierrobe erhalten");

	B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Ich habe meine Belohnung erhalten und kann nun bei Faice lernen.");
	B_SetTopicStatus	(TOPIC_MOD_FAICE_PRUEFUNG, LOG_SUCCESS);

	Info_ClearChoices	(Info_Mod_Faice_Pruefung2);
};

FUNC VOID Info_Mod_Faice_Pruefung2_A()
{
	AI_Output(hero, self, "Info_Mod_Faice_Pruefung2_A_15_00"); //Ich nehme die Rüstung.

	Info_Mod_Faice_Pruefung2_G();

	CreateInvItems	(hero, ItAr_Verwandlungskrieger, 1);

	B_ShowGivenThings	("Rüstung der Beschützer erhalten");

	B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Ich habe meine Belohnung erhalten und kann nun bei Faice lernen.");
	B_SetTopicStatus	(TOPIC_MOD_FAICE_PRUEFUNG, LOG_SUCCESS);

	Info_ClearChoices	(Info_Mod_Faice_Pruefung2);
};

INSTANCE Info_Mod_Faice_Pruefung3 (C_INFO)
{
	npc		= Mod_4019_VMG_Faice_MT;
	nr		= 1;
	condition	= Info_Mod_Faice_Pruefung3_Condition;
	information	= Info_Mod_Faice_Pruefung3_Info;
	permanent	= 1;
	important	= 0;
	description	= "Mit Tieren sprechen lernen (5 Lernpunkte)";
};

FUNC INT Info_Mod_Faice_Pruefung3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Faice_Pruefung2))
	&& ((Mod_VMG_Pruefung_Genn + Mod_VMG_Pruefung_Asko + Mod_VMG_Pruefung_Per) < 6)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_TIER] == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Faice_Pruefung3_Info()
{
	B_TeachPlayerTalentForeignLanguage (self, hero, LANGUAGE_Tier);
};

INSTANCE Info_Mod_Faice_BACK (C_INFO)
{
	npc		= Mod_4019_VMG_Faice_MT;
	nr		= 1;
	condition	= Info_Mod_Faice_BACK_Condition;
	information	= Info_Mod_Faice_BACK_Info;
	permanent	= 1;
	important	= 0;
	description	= "(Raum verlassen)";
};

FUNC INT Info_Mod_Faice_BACK_Condition()
{
	if (Npc_GetDistToWP(self, "OW_PATH_TEMPELRUIN07") < 1000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Faice_BACK_Info()
{
	AI_StopProcessInfos	(self);

	AI_Teleport	(hero, "LOCATION_28_01");
};

INSTANCE Info_Mod_Faice_Pickpocket (C_INFO)
{
	npc		= Mod_4019_VMG_Faice_MT;
	nr		= 1;
	condition	= Info_Mod_Faice_Pickpocket_Condition;
	information	= Info_Mod_Faice_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Faice_Pickpocket_Condition()
{
	C_Beklauen	(120, ItMi_Gold, 750);
};

FUNC VOID Info_Mod_Faice_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Faice_Pickpocket);

	Info_AddChoice	(Info_Mod_Faice_Pickpocket, DIALOG_BACK, Info_Mod_Faice_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Faice_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Faice_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Faice_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Faice_Pickpocket);
};

FUNC VOID Info_Mod_Faice_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Faice_Pickpocket);
};

INSTANCE Info_Mod_Faice_EXIT (C_INFO)
{
	npc		= Mod_4019_VMG_Faice_MT;
	nr		= 1;
	condition	= Info_Mod_Faice_EXIT_Condition;
	information	= Info_Mod_Faice_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Faice_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Faice_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};