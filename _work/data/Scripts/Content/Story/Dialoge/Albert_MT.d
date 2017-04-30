INSTANCE Info_Mod_Albert_Hi (C_INFO)
{
	npc		= Mod_1958_VMG_Albert_MT;
	nr		= 1;
	condition	= Info_Mod_Albert_Hi_Condition;
	information	= Info_Mod_Albert_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Albert_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Turendil_Hi))
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albert_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Albert_Hi_32_00"); //Ich wurde schon informiert. Du bist wohl der Typ, der sich um eine Aufnahme bei uns bemüht.
	AI_Output(self, hero, "Info_Mod_Albert_Hi_32_01"); //Der Teleporter funktioniert folgendermaßen: Ich gebe dir gleich einen Stein, den du auf das Podest dort legen musst, um den Teleporter zu aktivieren. Hast du das soweit verstanden?
	
	Info_ClearChoices	(Info_Mod_Albert_Hi);

	Info_AddChoice	(Info_Mod_Albert_Hi, "Nein, bitte wiederhole das.", Info_Mod_Albert_Hi_B);
	Info_AddChoice	(Info_Mod_Albert_Hi, "Ja, erzähl weiter.", Info_Mod_Albert_Hi_A);
};

FUNC VOID Info_Mod_Albert_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Albert_Hi_B_15_00"); //Nein, bitte wiederhole das.
	AI_Output(self, hero, "Info_Mod_Albert_Hi_B_32_01"); //Ich gebe dir gleich einen Stein, den du auf das Podest dort legen musst, um den Teleporter zu aktivieren. Hast du das soweit verstanden?
	
	Info_ClearChoices	(Info_Mod_Albert_Hi);

	Info_AddChoice	(Info_Mod_Albert_Hi, "Nein, bitte wiederhole das.", Info_Mod_Albert_Hi_B);
	Info_AddChoice	(Info_Mod_Albert_Hi, "Ja, erzähl weiter.", Info_Mod_Albert_Hi_A);
};

FUNC VOID Info_Mod_Albert_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Albert_Hi_A_15_00"); //Ja, erzähl weiter.
	AI_Output(self, hero, "Info_Mod_Albert_Hi_A_32_01"); //Wenn du an unserem Heimatort bist, solltest du sofort mit Genn sprechen, er wird dir alles über die Goblinplage erzählen.
	AI_Output(hero, self, "Info_Mod_Albert_Hi_A_15_02"); //Okay. Gib mir den Stein.
	AI_Output(self, hero, "Info_Mod_Albert_Hi_A_32_03"); //Hier hast du ihn.
	
	B_GiveInvItems	(self, hero, ItMi_TugettsoStein, 1);

	B_LogEntry	(TOPIC_MOD_FERCO_GOBLIN, "Jetzt kann ich den Teleporter mit Hilfe des Aufladesteins aktivieren.");

	Info_ClearChoices	(Info_Mod_Albert_Hi);
};

INSTANCE Info_Mod_Albert_Matronen (C_INFO)
{
	npc		= Mod_1958_VMG_Albert_MT;
	nr		= 1;
	condition	= Info_Mod_Albert_Matronen_Condition;
	information	= Info_Mod_Albert_Matronen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Albert_Matronen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Genn_Matronen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albert_Matronen_Info()
{
	AI_Output(self, hero, "Info_Mod_Albert_Matronen_32_00"); //Und? Wie ist es gelaufen?
	AI_Output(hero, self, "Info_Mod_Albert_Matronen_15_01"); //Es ist gut gelaufen. Ich habe den Nachwuchs der Goblins gestoppt. Den Rest bekommen sie dort alleine hin.
	AI_Output(self, hero, "Info_Mod_Albert_Matronen_32_02"); //Das freut mich. Geh am Besten zu Turendil und erzähle ihm die guten Neuigkeiten.

	Wld_SendTrigger	("TRIGGERLIST_VMG_TUGETTSO");
	Wld_SendUnTrigger	("STAENDER_VMG_PFX");
	Wld_SendUnTrigger	("PLATTFORM_VMG_PFX");
};

INSTANCE Info_Mod_Albert_Faice (C_INFO)
{
	npc		= Mod_1958_VMG_Albert_MT;
	nr		= 1;
	condition	= Info_Mod_Albert_Faice_Condition;
	information	= Info_Mod_Albert_Faice_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Albert_Faice_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Turendil_FaiceGifty))
	&& (Npc_IsInState(self, ZS_Talk))
	&& (Mod_VMG_FaiceGifty_Gift == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albert_Faice_Info()
{
	AI_Output(self, hero, "Info_Mod_Albert_Faice_32_00"); //Schnell, wir haben nicht viel Zeit.
	
	Info_ClearChoices	(Info_Mod_Albert_Faice);

	Info_AddChoice	(Info_Mod_Albert_Faice, "Ich muss vorher noch etwas erledigen.", Info_Mod_Albert_Faice_B);
	Info_AddChoice	(Info_Mod_Albert_Faice, "Gib mir den Stein und ich mache mich sofort auf den Weg.", Info_Mod_Albert_Faice_A);
};

FUNC VOID Info_Mod_Albert_Faice_B()
{
	AI_Output(hero, self, "Info_Mod_Albert_Faice_B_15_00"); //Ich muss vorher noch etwas erledigen.
	AI_Output(self, hero, "Info_Mod_Albert_Faice_B_32_01"); //Dann beeile dich.
	
	Info_ClearChoices	(Info_Mod_Albert_Faice);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Albert_Faice_A()
{
	AI_Output(hero, self, "Info_Mod_Albert_Faice_A_15_00"); //Gib mir den Stein und ich mache mich sofort auf den Weg.
	AI_Output(self, hero, "Info_Mod_Albert_Faice_A_32_01"); //Hier hast du ihn. Pass auf dich auf.
	
	B_GiveInvItems	(self, hero, ItMi_TugettsoStein, 1);

	B_LogEntry	(TOPIC_MOD_FAICE_HEILUNG, "Ich sollte nun nach Tugettso und dort mit Genn sprechen, vielleicht weiß er mehr über die Heilpflanze, die ich suche.");

	Info_ClearChoices	(Info_Mod_Albert_Faice);

	AI_StopProcessInfos	(self);

	Mod_VMG_FaiceGifty_Gift = 2;
};

INSTANCE Info_Mod_Albert_Mendulus (C_INFO)
{
	npc		= Mod_1958_VMG_Albert_MT;
	nr		= 1;
	condition	= Info_Mod_Albert_Mendulus_Condition;
	information	= Info_Mod_Albert_Mendulus_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Albert_Mendulus_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Genn_Soeren))
	&& (Mod_VMG_FaiceGifty_Gift == 9)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albert_Mendulus_Info()
{
	AI_Output(self, hero, "Info_Mod_Albert_Mendulus_32_00"); //Schnell, du musst dich beeilen. Faice geht es gar nicht gut. Rede mit Turendil, er ist bei Faice.
	AI_Output(hero, self, "Info_Mod_Albert_Mendulus_15_01"); //Ich mache mich sofort auf den Weg.
	AI_Output(self, hero, "Info_Mod_Albert_Mendulus_32_02"); //Bitte beeile dich.

	Wld_SendTrigger	("TRIGGERLIST_VMG_TUGETTSO");
	Wld_SendUnTrigger	("STAENDER_VMG_PFX");
	Wld_SendUnTrigger	("PLATTFORM_VMG_PFX");
};

INSTANCE Info_Mod_Albert_Gift (C_INFO)
{
	npc		= Mod_1958_VMG_Albert_MT;
	nr		= 1;
	condition	= Info_Mod_Albert_Gift_Condition;
	information	= Info_Mod_Albert_Gift_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Albert_Gift_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Turendil_FurtNextDay))
	&& (Npc_IsInState(self, ZS_Talk))
	&& (Mod_Turendil_Faice_Day == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albert_Gift_Info()
{
	AI_Output(self, hero, "Info_Mod_Albert_Gift_32_00"); //Wieder nach Tugettso, mein Freund?
	
	Info_ClearChoices	(Info_Mod_Albert_Gift);

	Info_AddChoice	(Info_Mod_Albert_Gift, "Ich komme später wieder.", Info_Mod_Albert_Gift_B);
	Info_AddChoice	(Info_Mod_Albert_Gift, "So sieht es aus. Kann ich einen Aufladestein haben?", Info_Mod_Albert_Gift_A);
};

FUNC VOID Info_Mod_Albert_Gift_B()
{
	AI_Output(hero, self, "Info_Mod_Albert_Gift_B_15_00"); //Ich komme später wieder.
	AI_Output(self, hero, "Info_Mod_Albert_Gift_B_32_01"); //Wir sehen uns.
	
	Info_ClearChoices	(Info_Mod_Albert_Gift);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Albert_Gift_A()
{
	AI_Output(hero, self, "Info_Mod_Albert_Gift_A_15_00"); //So sieht es aus. Kann ich einen Aufladestein haben?
	AI_Output(self, hero, "Info_Mod_Albert_Gift_A_32_01"); //Hier hast du ihn. Pass auf dich auf.
	
	B_GiveInvItems	(self, hero, ItMi_TugettsoStein, 1);

	B_LogEntry	(TOPIC_MOD_FAICE_GIFT, "Auf nach Tugettso. Ich werde dort von Genn vielleicht mehr erfahren.");

	Info_ClearChoices	(Info_Mod_Albert_Gift);

	AI_StopProcessInfos	(self);

	Mod_Turendil_Faice_Day = 1;
};

INSTANCE Info_Mod_Albert_Trador (C_INFO)
{
	npc		= Mod_1958_VMG_Albert_MT;
	nr		= 1;
	condition	= Info_Mod_Albert_Trador_Condition;
	information	= Info_Mod_Albert_Trador_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Albert_Trador_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Genn_Dean))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albert_Trador_Info()
{
	AI_Output(self, hero, "Info_Mod_Albert_Trador_32_00"); //Na endlich kommst du, Turendil wartet schon auf dich.

	Wld_SendTrigger	("TRIGGERLIST_VMG_TUGETTSO");
	Wld_SendUnTrigger	("STAENDER_VMG_PFX");
	Wld_SendUnTrigger	("PLATTFORM_VMG_PFX");
};

INSTANCE Info_Mod_Albert_TeleporterFurt (C_INFO)
{
	npc		= Mod_1958_VMG_Albert_MT;
	nr		= 1;
	condition	= Info_Mod_Albert_TeleporterFurt_Condition;
	information	= Info_Mod_Albert_TeleporterFurt_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich brauche einen neuen Aufladestein.";
};

FUNC INT Info_Mod_Albert_TeleporterFurt_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Turendil_TradorBesprochen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albert_TeleporterFurt_Info()
{
	AI_Output(hero, self, "Info_Mod_Albert_TeleporterFurt_15_00"); //Ich brauche einen neuen Aufladestein.
	AI_Output(self, hero, "Info_Mod_Albert_TeleporterFurt_32_01"); //Ähm ...
	AI_Output(hero, self, "Info_Mod_Albert_TeleporterFurt_15_02"); //Gibt es ein Problem?
	AI_Output(self, hero, "Info_Mod_Albert_TeleporterFurt_32_03"); //Ja, so Leid es mir tut.
	AI_Output(self, hero, "Info_Mod_Albert_TeleporterFurt_32_04"); //Aufgrund der Störungen, die in letzter Zeit öfter vorgekommen sind, kann ich es nicht mit meinem Gewissen vereinbaren, dich in den möglicherweise sicheren Tod zu schicken.
	
	Info_ClearChoices	(Info_Mod_Albert_TeleporterFurt);

	Info_AddChoice	(Info_Mod_Albert_TeleporterFurt, "Alles klar. Wann kann ich denn voraussichtlich durch das Portal?", Info_Mod_Albert_TeleporterFurt_B);
	Info_AddChoice	(Info_Mod_Albert_TeleporterFurt, "Aber Turendil hat ...", Info_Mod_Albert_TeleporterFurt_A);
};

FUNC VOID Info_Mod_Albert_TeleporterFurt_B()
{
	AI_Output(hero, self, "Info_Mod_Albert_TeleporterFurt_B_15_00"); //Alles klar. Wann kann ich denn voraussichtlich durch das Portal?
	AI_Output(self, hero, "Info_Mod_Albert_TeleporterFurt_B_32_01"); //Das weiß ich noch nicht. Aber in der Zwischenzeit kannst du nachsehen, ob du Furt findest.

	if (Mod_VMG_FaiceGifty_Gift == 13)
	{
		AI_Output(self, hero, "Info_Mod_Albert_TeleporterFurt_B_32_02"); //Ich habe gesehen, wie er in Richtung Altes Lager davon gerannt ist.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Albert_TeleporterFurt_B_32_03"); //Ich habe gehört, dass er in der Nähe des Alten Lagers gesehen worden ist. Schau mal dort 	nach.
	};

	AI_Output(hero, self, "Info_Mod_Albert_TeleporterFurt_B_15_04"); //Ich mache mich sofort auf den Weg.
	AI_Output(self, hero, "Info_Mod_Albert_TeleporterFurt_B_32_05"); //Ich werde dir Bescheid geben, wenn das Portal sicher ist.

	B_LogEntry	(TOPIC_MOD_TURENDIL_GOLEM, "Der Teleporter ist zu unsicher. Ich soll erstmal in der Nähe des Alten Lagers nach Furt sehen. Ich sollte die Umgebung dort absuchen.");
	
	Info_ClearChoices	(Info_Mod_Albert_TeleporterFurt);

	AI_StopProcessInfos	(self);

	B_KillNpc	(Mod_1626_VMG_Furt_MT);

	CreateInvItems	(Mod_1626_VMG_Furt_MT, ItMw_FurtsSchwert, 1); 
};

FUNC VOID Info_Mod_Albert_TeleporterFurt_A()
{
	AI_Output(hero, self, "Info_Mod_Albert_TeleporterFurt_A_15_00"); //Aber Turendil hat ...
	AI_Output(self, hero, "Info_Mod_Albert_TeleporterFurt_A_32_01"); //(unterbricht) Das ist mir egal. Es geht hier um Menschenleben.
	
	Info_Mod_Albert_TeleporterFurt_B();
};

INSTANCE Info_Mod_Albert_FurtTot (C_INFO)
{
	npc		= Mod_1958_VMG_Albert_MT;
	nr		= 1;
	condition	= Info_Mod_Albert_FurtTot_Condition;
	information	= Info_Mod_Albert_FurtTot_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe Furt gefunden.";
};

FUNC INT Info_Mod_Albert_FurtTot_Condition()
{
	if (Mod_VMG_FurtTot == 1)
	&& (Npc_HasItems(hero, ItMw_FurtsSchwert) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albert_FurtTot_Info()
{
	AI_Output(hero, self, "Info_Mod_Albert_FurtTot_15_00"); //Ich habe Furt gefunden.
	AI_Output(self, hero, "Info_Mod_Albert_FurtTot_32_01"); //Wo ist er denn?
	AI_Output(hero, self, "Info_Mod_Albert_FurtTot_15_02"); //Er ist tot. Ich habe ihn auf einer Insel in der Nähe des Alten Lagers gefunden.
	AI_Output(hero, self, "Info_Mod_Albert_FurtTot_15_03"); //Hier ist seine Waffe als Beweis.

	B_GiveInvItems	(hero, self, ItMw_FurtsSchwert, 1);

	AI_Output(self, hero, "Info_Mod_Albert_FurtTot_32_04"); //Ich weiß ehrlich gesagt nicht, ob ich mich freuen oder ob ich betrübt sein soll.
	AI_Output(self, hero, "Info_Mod_Albert_FurtTot_32_05"); //Immerhin habe ich ihn einige Zeit lang geglaubt zu kennen. Ich werde Turendil davon berichten.
	AI_Output(self, hero, "Info_Mod_Albert_FurtTot_32_06"); //Danke, dass du zu mir gekommen bist.
	AI_Output(hero, self, "Info_Mod_Albert_FurtTot_15_07"); //Wie sieht es mit dem Aufladestein aus?
	AI_Output(self, hero, "Info_Mod_Albert_FurtTot_32_08"); //Komm am Besten morgen wieder, dann kann ich dich vielleicht schon teleportieren.
	AI_Output(hero, self, "Info_Mod_Albert_FurtTot_15_09"); //Alles klar.
	AI_Output(self, hero, "Info_Mod_Albert_FurtTot_32_10"); //Wir sehen uns.

	Mod_VMG_AlbertFurtTot = Wld_GetDay();

	B_LogEntry	(TOPIC_MOD_TURENDIL_GOLEM, "Ich habe Albert von Furts Tod erzählt. Er meinte, ich solle mich einen Tag ausruhen, dann könnte ich in den Teleporter gehen.");
};

INSTANCE Info_Mod_Albert_TeleportWaldschluchtAktiv (C_INFO)
{
	npc		= Mod_1958_VMG_Albert_MT;
	nr		= 1;
	condition	= Info_Mod_Albert_TeleportWaldschluchtAktiv_Condition;
	information	= Info_Mod_Albert_TeleportWaldschluchtAktiv_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie sieht es aus?";
};

FUNC INT Info_Mod_Albert_TeleportWaldschluchtAktiv_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Albert_FurtTot))
	&& (Wld_GetDay() > Mod_VMG_AlbertFurtTot)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albert_TeleportWaldschluchtAktiv_Info()
{
	AI_Output(hero, self, "Info_Mod_Albert_TeleportWaldschluchtAktiv_15_00"); //Wie sieht es aus?
	AI_Output(self, hero, "Info_Mod_Albert_TeleportWaldschluchtAktiv_32_01"); //Ich denke, wir können einen Versuch wagen. Bist du bereit?
	AI_Output(hero, self, "Info_Mod_Albert_TeleportWaldschluchtAktiv_15_02"); //Ja. Gib mir den Stein.
	AI_Output(self, hero, "Info_Mod_Albert_TeleportWaldschluchtAktiv_32_03"); //Ich habe das Portal bereits aktiviert. Du musst es nur noch durschreiten.
	AI_Output(self, hero, "Info_Mod_Albert_TeleportWaldschluchtAktiv_32_04"); //Hier hast du trotzdem noch einen Aufladestein.

	B_GiveInvItems	(self, hero, ItMi_TugettsoStein, 1);

	B_LogEntry	(TOPIC_MOD_TURENDIL_GOLEM, "Ich werde den Teleporter ausprobieren. Hoffentlich komme ich auch wirklich in Tugettso raus.");

	Wld_SendTrigger	("STAENDER_VMG_PFX");
	Wld_SendTrigger	("PLATTFORM_VMG_PFX");
	Wld_SendTrigger	("WRONGTELEPORTTOWALDSCHLUCHT");
};

INSTANCE Info_Mod_Albert_WaldschluchtBack (C_INFO)
{
	npc		= Mod_1958_VMG_Albert_MT;
	nr		= 1;
	condition	= Info_Mod_Albert_WaldschluchtBack_Condition;
	information	= Info_Mod_Albert_WaldschluchtBack_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Albert_WaldschluchtBack_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Genn_TradorTot))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albert_WaldschluchtBack_Info()
{
	AI_Output(self, hero, "Info_Mod_Albert_WaldschluchtBack_32_00"); //Ah, es scheint geklappt zu haben.

	Wld_SendUnTrigger	("STAENDER_VMG_PFX");
	Wld_SendUnTrigger	("PLATTFORM_VMG_PFX");
	Wld_SendTrigger	("WRONGTELEPORTTOWALDSCHLUCHT");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_4019_VMG_Faice_MT, "START");
};

INSTANCE Info_Mod_Albert_Pruefung (C_INFO)
{
	npc		= Mod_1958_VMG_Albert_MT;
	nr		= 1;
	condition	= Info_Mod_Albert_Pruefung_Condition;
	information	= Info_Mod_Albert_Pruefung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hi. Ich brauche einen neuen Aufladestein.";
};

FUNC INT Info_Mod_Albert_Pruefung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Faice_Pruefung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albert_Pruefung_Info()
{
	AI_Output(hero, self, "Info_Mod_Albert_Pruefung_15_00"); //Hi. Ich brauche einen neuen Aufladestein.
	AI_Output(self, hero, "Info_Mod_Albert_Pruefung_32_01"); //Ich habe schon gehört, dass du endlich unsere Techniken erlernst, um ein geachtetes Mitglied zu werden. Sehr lobenswert. Hier ist der Stein.
	
	B_GiveInvItems	(self, hero, ItMi_TugettsoStein, 1);

	AI_Output(hero, self, "Info_Mod_Albert_Pruefung_15_02"); //Gut, ich mache mich dann auf den Weg.
	AI_Output(self, hero, "Info_Mod_Albert_Pruefung_32_03"); //Viel Erfolg!
};

INSTANCE Info_Mod_Albert_Skinner (C_INFO)
{
	npc		= Mod_1958_VMG_Albert_MT;
	nr		= 1;
	condition	= Info_Mod_Albert_Skinner_Condition;
	information	= Info_Mod_Albert_Skinner_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich bringe die Spruchrollen, die ihr wolltet (...)";
};

FUNC INT Info_Mod_Albert_Skinner_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skinner_Laufbursche))
	&& (Npc_KnowsInfo(hero, Info_Mod_Myxir_Skinner))
	&& (Npc_HasItems(hero, ItSc_SumWolf) >= 1)
	&& (Npc_HasItems(hero, ItSc_SumGol) >= 1)
	&& (Npc_HasItems(hero, ItSc_SumDemon) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albert_Skinner_Info()
{
	AI_Output(hero, self, "Info_Mod_Albert_Skinner_15_00"); //Ich bringe die Spruchrollen, die ihr wolltet, Magus der Gestaltenwandlung.

	Npc_RemoveInvItems	(hero, ItSc_SumWolf, 1);
	Npc_RemoveInvItems	(hero, ItSc_SumGol, 1);
	Npc_RemoveInvItems	(hero, ItSc_SumDemon, 1);

	B_ShowGivenThings	("Spruchrollen gegeben");

	AI_Output(self, hero, "Info_Mod_Albert_Skinner_32_01"); //(erfreut) Ahh, fabelhaft, dann können wir endlich mit unseren Studien beginnen. Hier ist die vereinbarte Bezahlung, mit einer Spruchrolle zusätzlich für den zuverlässigen Boten.

	CreateInvItems	(hero, ItMi_Gold, 800);
	CreateInvItems	(hero, ItSc_TrfRabbit, 2);

	B_ShowGivenThings	("Gold und Spruchrollen erhalten");

	B_GivePlayerXP	(350);

	B_LogEntry	(TOPIC_MOD_BDT_SKINNER, "Ich war bei Albert, der mir noch eine Spruchrolle zusätzlich gegeben hat. Jetzt brauche ich nur noch mit Skinner den Rest zu regeln.");
};

INSTANCE Info_Mod_Albert_Amulett (C_INFO)
{
	npc		= Mod_1958_VMG_Albert_MT;
	nr		= 1;
	condition	= Info_Mod_Albert_Amulett_Condition;
	information	= Info_Mod_Albert_Amulett_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo werter Magier. Ich bitte den Vorfall zu entschuldigen.";
};

FUNC INT Info_Mod_Albert_Amulett_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dexter_Amulett2Gefunden))
	&& (Npc_HasItems(hero, ItAm_MegaAmulett2) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albert_Amulett_Info()
{
	AI_Output(hero, self, "Info_Mod_Albert_Amulett_15_00"); //Hallo werter Magier. Ich bitte den Vorfall zu entschuldigen. Ich habe das richtige Amulett ausfindig gemacht und trage es bei mir.
	AI_Output(self, hero, "Info_Mod_Albert_Amulett_32_01"); //(ungeduldig) Zeig her.

	B_GiveInvItems	(hero, self, ItAm_MegaAmulett2, 1);

	AI_Output(self, hero, "Info_Mod_Albert_Amulett_32_02"); //Hmm ... bei Adanos, tatsächlich, das ist es. Meine Brüder werden sehr erfreut darüber sein.
	AI_Output(self, hero, "Info_Mod_Albert_Amulett_32_03"); //Da es unserer Gemeinschaft von großem Nutzen sein wird, werde ich dir den Rest der Bezahlung trotz des Vorfalls geben.
	AI_Output(self, hero, "Info_Mod_Albert_Amulett_32_04"); //Ich hoffe aber, dass so etwas in Zukunft nicht mehr vorkommen wird.

	CreateInvItems	(hero, ItMi_Gold, 300);
	CreateInvItems	(hero, ItSc_TrfSheep, 1);
	CreateInvItems	(hero, ItSc_TrfKeiler, 1);

	B_ShowGivenThings	("300 Gold und 2 Spruchrollen erhalten");

	B_LogEntry	(TOPIC_MOD_BDT_ORKS, "Ich habe das Amulett Albert übergeben und sollte Dexter darüber in Kenntnis setzen.");
};

INSTANCE Info_Mod_Albert_Oschust (C_INFO)
{
	npc		= Mod_1958_VMG_Albert_MT;
	nr		= 1;
	condition	= Info_Mod_Albert_Oschust_Condition;
	information	= Info_Mod_Albert_Oschust_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich bin gekommen eure Unterstützung zu erbitten.";
};

FUNC INT Info_Mod_Albert_Oschust_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dexter_BanditenKidnapped))
	&& ((Npc_KnowsInfo(hero, Info_Mod_Oschust_BadOne_Gnade))
	|| (Npc_KnowsInfo(hero, Info_Mod_Oschust_BadOne_Plan))
	|| (Npc_KnowsInfo(hero, Info_Mod_UrShak_Oschust)))
	{
		if (Npc_KnowsInfo(hero, Info_Mod_Albert_Hexen))
		&& (!Npc_KnowsInfo(hero, Info_Mod_Albert_HexenBack))
		{
		}
		else
		{
			return 1;
		};
	};
};

FUNC VOID Info_Mod_Albert_Oschust_Info()
{
	AI_Output(hero, self, "Info_Mod_Albert_Oschust_15_00"); //Ich bin gekommen eure Unterstützung zu erbitten. Unsere beiden Gemeinschaften schweben in großer Gefahr.
	AI_Output(self, hero, "Info_Mod_Albert_Oschust_32_01"); //Wie das? So berichte mir, was vorgefallen ist.
	AI_Output(hero, self, "Info_Mod_Albert_Oschust_15_02"); //Ein Verräter aus unserem Lager, derselbe, der auch das Amulett gefälscht hat, ist für alles verantwortlich.
	AI_Output(hero, self, "Info_Mod_Albert_Oschust_15_03"); //Er hat uns einen Hinterhalt bereitet, durch welchen viele unserer Männer in die Gefangenschaft der Orks gerieten, mit welchen er gemeinsame Sache macht.
	AI_Output(self, hero, "Info_Mod_Albert_Oschust_32_04"); //Was?! Welche Niedertracht sich mit diesen üblen Kreaturen einzulassen.
	AI_Output(self, hero, "Info_Mod_Albert_Oschust_32_05"); //Aber in wie fern betrifft das alles uns? Wollen die Orks uns jetzt womöglich das Amulett entreißen?
	AI_Output(hero, self, "Info_Mod_Albert_Oschust_15_06"); //Euer Scharfsinn ehrt euch, Magier. Genau das ist es, was die Unholde im Sinn haben.
	AI_Output(self, hero, "Info_Mod_Albert_Oschust_32_07"); //Dann gibt es keine Zeit zu verlieren. Warte hier, ich werde meinen Brüdern bescheid geben.

	if (!Npc_KnowsInfo(hero, Info_Mod_Ferco_QuestThree))
	{
		Wld_SendTrigger	("EVT_FOKUSTOR");
	};

	AI_GotoWP	(self, "WP_MT_ALBERT_ZU_VMGS");
	AI_GotoWP	(self, "OW_PATH_176_TEMPELFOCUS4");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Albert_KommeMit (C_INFO)
{
	npc		= Mod_1958_VMG_Albert_MT;
	nr		= 1;
	condition	= Info_Mod_Albert_KommeMit_Condition;
	information	= Info_Mod_Albert_KommeMit_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Albert_KommeMit_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Albert_Oschust))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albert_KommeMit_Info()
{
	AI_Output(self, hero, "Info_Mod_Albert_KommeMit_32_00"); //Nun denn, ich habe mich mit meinen Brüdern beraten und wir haben beschlossen, dass ich dich begleite, deine Freunde zu retten.

	if (!Npc_KnowsInfo(hero, Info_Mod_Ferco_QuestThree))
	{
		Wld_SendTrigger	("EVT_FOKUSTOR");
	};

	Info_ClearChoices	(Info_Mod_Albert_KommeMit);

	Info_AddChoice	(Info_Mod_Albert_KommeMit, "Was, nur wir zu zweit?", Info_Mod_Albert_KommeMit_B);
	Info_AddChoice	(Info_Mod_Albert_KommeMit, "In Ordnung.", Info_Mod_Albert_KommeMit_A);
};

FUNC VOID Info_Mod_Albert_KommeMit_C()
{
	AI_Output(self, hero, "Info_Mod_Albert_KommeMit_C_32_00"); //Hierzu kommt jetzt das Amulett der Extension zum Einsatz.
	AI_Output(self, hero, "Info_Mod_Albert_KommeMit_C_32_01"); //Es hat folgende Eigenschaft: Jeden Zauber, den der Träger auf sich wirkt, erfahren auch alle seine Kampfgefährten, was es zu einem äußerst mächtigen Werkzeug macht.
	AI_Output(self, hero, "Info_Mod_Albert_KommeMit_C_32_02"); //Ohne weiter Worte zu verlieren: Ich werde uns in Blutfliegen verwandeln. Folge mir einfach, ich bringe uns auf dem schnellsten Weg in die Orkstadt.
	AI_Output(self, hero, "Info_Mod_Albert_KommeMit_C_32_03"); //Nach allem was ich aus meinen bisherigen Exkursionen als Blutfliege weiß, gibt es dort ein unterirdisches Höhlensystem, wo sich eigentlich deine Freunde befinden sollte ... falls sie noch, sollte es Adanos Wille sein, am Leben sind.
	AI_Output(self, hero, "Info_Mod_Albert_KommeMit_C_32_04"); //Und jetzt lass uns ohne Verzug aufbrechen.
	
	Info_ClearChoices	(Info_Mod_Albert_KommeMit);

	B_LogEntry	(TOPIC_MOD_BDT_ORKS, "Das hat es also mit dem Amulett auf sich. Jeder Zauber, den der Träger auf sich wirkt, erfolgt auch auf alle seine Kampfgenossen.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TRANSFORMTOBLOODFLY");

	Mod_AlbertTransforms = 1;
};

FUNC VOID Info_Mod_Albert_KommeMit_B()
{
	AI_Output(hero, self, "Info_Mod_Albert_KommeMit_B_15_00"); //Was, nur wir zu zweit?
	AI_Output(self, hero, "Info_Mod_Albert_KommeMit_B_32_01"); //Hier ist es auch keine rohe Gewalt, die uns zum Erfolg verhelfen kann, sondern der geschickte Einsatz von Magie.
	
	Info_Mod_Albert_KommeMit_C();
};

FUNC VOID Info_Mod_Albert_KommeMit_A()
{
	AI_Output(hero, self, "Info_Mod_Albert_KommeMit_A_15_00"); //In Ordnung.
	
	Info_Mod_Albert_KommeMit_C();
};

INSTANCE Info_Mod_Albert_OrkCity (C_INFO)
{
	npc		= Mod_1958_VMG_Albert_MT;
	nr		= 1;
	condition	= Info_Mod_Albert_OrkCity_Condition;
	information	= Info_Mod_Albert_OrkCity_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Albert_OrkCity_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Albert_KommeMit))
	&& (Mod_AlbertTransforms == 1)
	&& (Npc_GetDistToWP(self, "WP_MINENTAL_START_ORCCITY") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albert_OrkCity_Info()
{
	AI_Output(self, hero, "Info_Mod_Albert_OrkCity_32_00"); //So, hier müsste sich wohl der Eingang ins unterirdische Höhlensystem befinden.
	AI_Output(self, hero, "Info_Mod_Albert_OrkCity_32_01"); //Geh voran, du bist der stärkere Kämpfer. Ich folge dir.

	B_LogEntry	(TOPIC_MOD_BDT_ORKS, "Dank Alberts magischer Künste und dem Amulett der Extension begeben wir uns jetzt in das unterirdische Höhlensystem der Orks, um die Gefangenen zu finden.");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Albert_FluchtHappy (C_INFO)
{
	npc		= Mod_1958_VMG_Albert_MT;
	nr		= 1;
	condition	= Info_Mod_Albert_FluchtHappy_Condition;
	information	= Info_Mod_Albert_FluchtHappy_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Albert_FluchtHappy_Condition()
{
	if (Mod_AlbertTransforms == 6)
	&& (Npc_GetDistToWP(self, "WP_MINENTAL_START_ORCCITY") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albert_FluchtHappy_Info()
{
	AI_Output(self, hero, "Info_Mod_Albert_FluchtHappy_32_00"); //So, von hier aus kann ich uns alle mit dieser Teleportspruchrolle und dem Amulett aus der Orkstadt herausteleportieren.

	if (Npc_HasItems(hero, ItAm_MegaAmulett2) > 0)
	{
		B_GiveInvItems	(hero, self, ItAm_MegaAmulett2, 1);
		Mod_Extension_Angelegt = FALSE;
	};
	
	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SURVIVOR");

	AI_Teleport (self, "OW_PATH_1_5_B");
	AI_Teleport (hero, "OW_PATH_1_5_B");
};

INSTANCE Info_Mod_Albert_Safety (C_INFO)
{
	npc		= Mod_1958_VMG_Albert_MT;
	nr		= 1;
	condition	= Info_Mod_Albert_Safety_Condition;
	information	= Info_Mod_Albert_Safety_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Albert_Safety_Condition()
{
	if (Mod_AlbertTransforms == 6)
	&& (Npc_GetDistToWP(self, "OW_PATH_1_5_B") < 1000)
	&& (Npc_KnowsInfo(hero, Info_Mod_Albert_FluchtHappy))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albert_Safety_Info()
{
	AI_Output(self, hero, "Info_Mod_Albert_Safety_32_00"); //(erleichtert) So, das wäre geschafft. Ich werde nun rasch zu meinen Brüdern zurückkehren, ihnen von dem Vorgefallenen berichten und uns auf einen möglichen Angriff einstellen.
	AI_Output(self, hero, "Info_Mod_Albert_Safety_32_01"); //Ihr wiederum tätet gut daran ebenfalls zu eurem Lager eilen, da der Feind jeder Zeit zuschlagen kann.
	AI_Output(hero, self, "Info_Mod_Albert_Safety_15_02"); //Ich danke dir für deine Unterstützung. Jetzt ist aber tatsächlich nicht die Zeit zur Muße. So lasst uns denn ohne Verzug aufbrechen.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");

	if (Mod_OC_Esteban == 0)
	{
		B_StartOtherRoutine	(Mod_948_BDT_Esteban_MT, "SURVIVOR");
		AI_Teleport	(Mod_948_BDT_Esteban_MT, "OW_PATH_1_5_3");
	};
	if (Mod_OC_Miguel == 0)
	{
		B_StartOtherRoutine	(Mod_958_BDT_Miguel_MT, "SURVIVOR");
		AI_Teleport	(Mod_958_BDT_Miguel_MT, "OW_PATH_1_5_3");
	};
	if (Mod_OC_Juan == 0)
	{
		B_StartOtherRoutine	(Mod_955_BDT_Juan_MT, "SURVIVOR");
		AI_Teleport	(Mod_955_BDT_Juan_MT, "OW_PATH_1_5_3");
	};
	if (Mod_OC_Logan == 0)
	{
		B_StartOtherRoutine	(Mod_957_BDT_Logan_MT, "SURVIVOR");
		AI_Teleport	(Mod_957_BDT_Logan_MT, "OW_PATH_1_5_3");
	};
	if (Mod_OC_Skinner == 0)
	{
		B_StartOtherRoutine	(Mod_964_BDT_Skinner_MT, "SURVIVOR");
		AI_Teleport	(Mod_964_BDT_Skinner_MT, "OW_PATH_1_5_3");
	};
	if (Mod_OC_Morgahard == 0)
	{
		B_StartOtherRoutine	(Mod_790_BDT_Morgahard_MT, "SURVIVOR");
		AI_Teleport	(Mod_790_BDT_Morgahard_MT, "OW_PATH_1_5_3");
	};
	if (Mod_OC_Bandit_01 == 0)
	{
		B_StartOtherRoutine	(Mod_4074_BDT_Bandit_MT, "SURVIVOR");
		AI_Teleport	(Mod_4074_BDT_Bandit_MT, "OW_PATH_1_5_3");
	};
	if (Mod_OC_Bandit_02 == 0)
	{
		B_StartOtherRoutine	(Mod_4075_BDT_Bandit_MT, "SURVIVOR");
		AI_Teleport	(Mod_4075_BDT_Bandit_MT, "OW_PATH_1_5_3");
	};
};

INSTANCE Info_Mod_Albert_Hexen (C_INFO)
{
	npc		= Mod_1958_VMG_Albert_MT;
	nr		= 1;
	condition	= Info_Mod_Albert_Hexen_Condition;
	information	= Info_Mod_Albert_Hexen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wir, die Gemeinschaft des Wassers, sind in großer Bedrängnis und könnten die Macht des Amulettes gut brauchen.";
};

FUNC INT Info_Mod_Albert_Hexen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Albert_Amulett))
	&& (Mod_WM_ArtefaktSammler == 1)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_26))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albert_Hexen_Info()
{
	AI_Output(hero, self, "Info_Mod_Albert_Hexen_15_00"); //Wir, die Gemeinschaft des Wassers, sind in großer Bedrängnis und könnten die Macht des Amulettes gut brauchen.
	AI_Output(self, hero, "Info_Mod_Albert_Hexen_32_01"); //Unseren naturverbundenen Brüdern bin ich gerne bereit zu helfen.
	AI_Output(self, hero, "Info_Mod_Albert_Hexen_32_02"); //Ich will dich jedoch darum bitten, uns das Amulett wieder zurückzubringen, wenn ihr euer Problem bewältigt habt.

	B_GiveInvItems	(self, hero, ItAm_MegaAmulett2, 1);
};

INSTANCE Info_Mod_Albert_HexenBack (C_INFO)
{
	npc		= Mod_1958_VMG_Albert_MT;
	nr		= 1;
	condition	= Info_Mod_Albert_HexenBack_Condition;
	information	= Info_Mod_Albert_HexenBack_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich bringe dir das Amulett zurück.";
};

FUNC INT Info_Mod_Albert_HexenBack_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Albert_Hexen))
	&& (Npc_KnowsInfo(hero, Info_Mod_Cronos_Angriff_02))
	&& (Npc_HasItems(hero, ItAm_MegaAmulett2) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albert_HexenBack_Info()
{
	AI_Output(hero, self, "Info_Mod_Albert_HexenBack_15_00"); //Ich bringe dir das Amulett zurück.

	B_GiveInvItems	(hero, self, ItAm_MegaAmulett2, 1);

	AI_Output(self, hero, "Info_Mod_Albert_HexenBack_32_01"); //Ich danke dir. Wie es scheint, hat es euch sehr geholfen.
};

INSTANCE Info_Mod_Albert_Asylanten (C_INFO)
{
	npc		= Mod_1958_VMG_Albert_MT;
	nr		= 1;
	condition	= Info_Mod_Albert_Asylanten_Condition;
	information	= Info_Mod_Albert_Asylanten_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wieso seid ihr ins Minental gekommen?";
};

FUNC INT Info_Mod_Albert_Asylanten_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hagen_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albert_Asylanten_Info()
{
	AI_Output(hero, self, "Info_Mod_Albert_Asylanten_15_00"); //Wieso seid ihr ins Minental gekommen?
	AI_Output(self, hero, "Info_Mod_Albert_Asylanten_32_01"); //In unserer Heimatdimension wurden wir von einer wahren Armee von Goblins heimgesucht.
	AI_Output(self, hero, "Info_Mod_Albert_Asylanten_32_02"); //Durch einen alten Teleporter konnte sich ein Großteil von uns hierher absetzen und sucht nun nach Hilfe.

	Info_ClearChoices	(Info_Mod_Albert_Asylanten);

	Info_AddChoice	(Info_Mod_Albert_Asylanten, "Ihr seht nicht aus, als würdet ihr nach Hilfe suchen.", Info_Mod_Albert_Asylanten_B);
	Info_AddChoice	(Info_Mod_Albert_Asylanten, "Was machen die Zurückgebliebenen?", Info_Mod_Albert_Asylanten_A);
};

FUNC VOID Info_Mod_Albert_Asylanten_B()
{
	AI_Output(hero, self, "Info_Mod_Albert_Asylanten_B_15_00"); //Ihr seht nicht aus, als würdet ihr nach Hilfe suchen.
	AI_Output(self, hero, "Info_Mod_Albert_Asylanten_B_32_01"); //Es ist aussichtslos. Wir sind hier in einem Gebiet mit einem sonderbaren Menschenschlag geraten.
	AI_Output(self, hero, "Info_Mod_Albert_Asylanten_B_32_02"); //Die erste Gruppe, auf die wir stießen, verbirgt sich flussabwärts hinter einer hohen Palisade.
	AI_Output(self, hero, "Info_Mod_Albert_Asylanten_B_32_03"); //Der Wächter, der uns fragte, weshalb wir kämen, lachte uns schallend aus und wünschte uns Beliar an den Hals.
	AI_Output(self, hero, "Info_Mod_Albert_Asylanten_B_32_04"); //Eine andere Gruppierung empfing uns herzlich und lauschte unserem Wehklagen, zog sich dann rauchend zu einer Besprechung zurück und schickte uns mit ernster Miene nach Hause.
	AI_Output(self, hero, "Info_Mod_Albert_Asylanten_B_32_05"); //Abgesehen von einzelnen Jägern oder Gesetzlosen konnten wir sonst niemanden ausmachen, den wir hätten bitten können.
	AI_Output(self, hero, "Info_Mod_Albert_Asylanten_B_32_06"); //Seitdem bleibt uns nichts übrig, als zu hoffen.
	AI_Output(hero, self, "Info_Mod_Albert_Asylanten_B_15_07"); //Das klingt nicht beneidenswert.

	B_LogEntry	(TOPIC_MOD_HAGEN_ASYLANTEN, "In der Ruine am Meer haben sich Verwandlungsmagier niedergelassen, die dort auf Hilfe für ihre Heimatwelt warten. Sie scheinen enttäuscht zu sein vom Alten Lager und der Bruderschaft, zeigen aber kein aggressives Potenzial.");

	Info_ClearChoices	(Info_Mod_Albert_Asylanten);
};

FUNC VOID Info_Mod_Albert_Asylanten_A()
{
	AI_Output(hero, self, "Info_Mod_Albert_Asylanten_A_15_00"); //Was machen die Zurückgebliebenen?
	AI_Output(self, hero, "Info_Mod_Albert_Asylanten_A_32_01"); //Sie verteidigen unser Dorf, wenn es sein muss. Wir werden es nicht kampflos aufgeben!

	Info_Mod_Albert_Asylanten_B();
};

INSTANCE Info_Mod_Albert_Fokus (C_INFO)
{
	npc		= Mod_1958_VMG_Albert_MT;
	nr		= 1;
	condition	= Info_Mod_Albert_Fokus_Condition;
	information	= Info_Mod_Albert_Fokus_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Albert_Fokus_Condition()
{
	if (Mod_Fokus_Kloster == 0)
	&& (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Fokusplatz))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albert_Fokus_Info()
{
	AI_Output(self, hero, "Info_Mod_Albert_Fokus_32_00"); //Was suchst du hier oben?
	AI_Output(hero, self, "Info_Mod_Albert_Fokus_15_01"); //Ich bin auf der Suche nach einem magischen Fokus. Die Wassermagier hatten ihn auf dem Sockel bei der Plattform abgelegt, ich kann ihn jedoch nicht sehen.
	AI_Output(self, hero, "Info_Mod_Albert_Fokus_32_02"); //Oh ja, an den erinnere ich mich gut. Der hat uns einige Probleme bereitet.
	AI_Output(hero, self, "Info_Mod_Albert_Fokus_15_03"); //Es liegt ein Schutzzauber auf ihm. Ansonsten ist er vollkommen ungefährlich.
	AI_Output(self, hero, "Info_Mod_Albert_Fokus_32_04"); //Gut zu wissen. Mehrere von uns haben versucht, ihn vom Sockel zu heben, und haben Blessuren und sogar Knochenbrüche davon getragen.
	AI_Output(hero, self, "Info_Mod_Albert_Fokus_15_05"); //Wo ist der Fokus jetzt?
	AI_Output(self, hero, "Info_Mod_Albert_Fokus_32_06"); //Wir haben ihn den Felsen hinab ins Meer geworfen.
	AI_Output(self, hero, "Info_Mod_Albert_Fokus_32_07"); //Jedenfalls hätten wir es getan, wenn es nach mir gegangen wäre.
	AI_Output(self, hero, "Info_Mod_Albert_Fokus_32_08"); //So haben wir einfach eine Kiste drüber gestülpt und danach fest verschlossen. Es ist eine der Truhen dort drüben.
	AI_Output(hero, self, "Info_Mod_Albert_Fokus_15_09"); //Darf ich den Fokus mitnehmen?
	AI_Output(self, hero, "Info_Mod_Albert_Fokus_32_10"); //Warte mal. Das war noch nicht das einzige Problem, das wir hatten.
	AI_Output(self, hero, "Info_Mod_Albert_Fokus_32_11"); //Gestern kam dann plötzlich eine unheimliche Gestalt des Wegs und fragte uns nach dem Teil.
	AI_Output(self, hero, "Info_Mod_Albert_Fokus_32_12"); //Mir wurde ganz schwummrig, als der Typ aufkreuzte. Dem hätte ich nie verraten, dass wir den Fokus noch besitzen!
	AI_Output(self, hero, "Info_Mod_Albert_Fokus_32_13"); //Deswegen habe ich ihm vorgelogen, wir hätten ihn tatsächlich ins Meer geschmissen. Da ist er dann wieder abgezogen.
	AI_Output(self, hero, "Info_Mod_Albert_Fokus_32_14"); //Drittes Problem: Wir wollten den Fokus danach selbst so schnell wie möglich loswerden.
	AI_Output(self, hero, "Info_Mod_Albert_Fokus_32_15"); //Zwei von uns haben sich die Truhe gegriffen, nur um dann merken zu müssen, dass der Schutzzauber nun auf sie übergesprungen ist!
	AI_Output(self, hero, "Info_Mod_Albert_Fokus_32_16"); //Die beiden sind meterweit geflogen.
	AI_Output(self, hero, "Info_Mod_Albert_Fokus_32_17"); //Wenn du es also schaffst, den Zauber zu brechen, dann bitte, bitte, nimm den Fokus mit.

	B_LogEntry	(TOPIC_MOD_FOKUSSUCHE, "Beim Fokus in der Klosterruine wäre mir fast eine unheimliche Gestalt zuvorgekommen. Der Fokus ruht in einer der Truhen bei Albert. Um daran zu gelangen, muss ich aber erst den Schutzzauber brechen, der auf die Truhe übergesprungen ist.");
};

INSTANCE Info_Mod_Albert_WerBistDu (C_INFO)
{
	npc		= Mod_1958_VMG_Albert_MT;
	nr		= 1;
	condition	= Info_Mod_Albert_WerBistDu_Condition;
	information	= Info_Mod_Albert_WerBistDu_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Albert_WerBistDu_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Albert_WerBistDu_Info()
{
	B_Say	(hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Albert_WerBistDu_32_00"); //Mein Name ist Albert. Ich bewache diese Plattform.
	AI_Output(hero, self, "Info_Mod_Albert_WerBistDu_15_01"); //Was ist das für eine Plattform?
	AI_Output(self, hero, "Info_Mod_Albert_WerBistDu_32_02"); //Früher war es eine Fassung für die Fokussteine, hab ich gehört.
	AI_Output(self, hero, "Info_Mod_Albert_WerBistDu_32_03"); //Wir benutzen es jedoch als 	Teleporter nach Tugettso und wieder zurück.

	Info_ClearChoices	(Info_Mod_Albert_WerBistDu);

	Info_AddChoice	(Info_Mod_Albert_WerBistDu, "Wie funktioniert der Teleporter?", Info_Mod_Albert_WerBistDu_B);
	Info_AddChoice	(Info_Mod_Albert_WerBistDu, "Was ist Tugettso?", Info_Mod_Albert_WerBistDu_A);
};

FUNC VOID Info_Mod_Albert_WerBistDu_B()
{
	AI_Output(hero, self, "Info_Mod_Albert_WerBistDu_B_15_00"); //Wie funktioniert der Teleporter?
	AI_Output(self, hero, "Info_Mod_Albert_WerBistDu_B_32_01"); //Das zeige ich dir, wenn du bereit bist.

	Mod_Albert_WBD += 1;

	Info_ClearChoices	(Info_Mod_Albert_WerBistDu);

	if (Mod_Albert_WBD == 1)
	{
		Info_AddChoice	(Info_Mod_Albert_WerBistDu, "Was ist Tugettso?", Info_Mod_Albert_WerBistDu_A);
	};
};

FUNC VOID Info_Mod_Albert_WerBistDu_A()
{
	AI_Output(hero, self, "Info_Mod_Albert_WerBistDu_A_15_00"); //Was ist Tugettso?
	AI_Output(self, hero, "Info_Mod_Albert_WerBistDu_A_32_01"); //Unser Heimatdorf. Wenn du mehr darüber wissen willst, frag Turendil danach.

	Mod_Albert_WBD += 1;

	Info_ClearChoices	(Info_Mod_Albert_WerBistDu);

	if (Mod_Albert_WBD == 1)
	{
		Info_AddChoice	(Info_Mod_Albert_WerBistDu, "Wie funktioniert der Teleporter?", Info_Mod_Albert_WerBistDu_B);
	};
};

var int Mod_Knows_AlbertTeacher;

INSTANCE Info_Mod_Albert_Lernen_MANA (C_INFO)
{
	npc		= Mod_1958_VMG_Albert_MT;
	nr		= 1;
	condition	= Info_Mod_Albert_Lernen_MANA_Condition;
	information	= Info_Mod_Albert_Lernen_MANA_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will meine magischen Kräfte steigern.";
};

FUNC INT Info_Mod_Albert_Lernen_MANA_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Albert_Hi))
	&& (hero.attribute[ATR_MANA_MAX] <= 300)
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albert_Lernen_MANA_Info()
{
	if (Mod_Knows_AlbertTeacher == FALSE)
	{
		Mod_Knows_AlbertTeacher = TRUE;

		Log_CreateTopic	(TOPIC_MOD_LEHRER_VM, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_LEHRER_VM, "Albert kann mir helfen meine magische Kraft zu steigern.");
	};

	AI_Output(hero, self, "Info_Mod_Albert_Lernen_MANA_15_00"); //Ich will meine magischen Kräfte steigern.

	Info_ClearChoices	(Info_Mod_Albert_Lernen_MANA);

	Info_AddChoice		(Info_Mod_Albert_Lernen_MANA, DIALOG_BACK, Info_Mod_Albert_Lernen_MANA_BACK);
	Info_AddChoice		(Info_Mod_Albert_Lernen_MANA, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Albert_Lernen_MANA_5);
	Info_AddChoice		(Info_Mod_Albert_Lernen_MANA, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Albert_Lernen_MANA_1);
};

FUNC VOID Info_Mod_Albert_Lernen_MANA_BACK()
{
	if (hero.attribute[ATR_MANA_MAX] >= 300)
	{
		AI_Output(self, hero, "Info_Mod_Albert_Lernen_MANA_BACK_14_01"); //Deine magischen Kenntnisse sind jetzt so gut, dass ich dir nichts mehr beibringen kann.
	};

	Info_ClearChoices	(Info_Mod_Albert_Lernen_MANA);
};

FUNC VOID Info_Mod_Albert_Lernen_MANA_5()
{
	B_TeachAttributePoints_New (self, hero, ATR_MANA_MAX, 5, 300);

	Info_ClearChoices	(Info_Mod_Albert_Lernen_MANA);

	Info_AddChoice		(Info_Mod_Albert_Lernen_MANA, DIALOG_BACK, Info_Mod_Albert_Lernen_MANA_BACK);
	Info_AddChoice		(Info_Mod_Albert_Lernen_MANA, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Albert_Lernen_MANA_5);
	Info_AddChoice		(Info_Mod_Albert_Lernen_MANA, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Albert_Lernen_MANA_1);
};

FUNC VOID Info_Mod_Albert_Lernen_MANA_1()
{
	B_TeachAttributePoints (self, hero, ATR_MANA_MAX, 1, 300);

	Info_ClearChoices	(Info_Mod_Albert_Lernen_MANA);

	Info_AddChoice		(Info_Mod_Albert_Lernen_MANA, DIALOG_BACK, Info_Mod_Albert_Lernen_MANA_BACK);
	Info_AddChoice		(Info_Mod_Albert_Lernen_MANA, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Albert_Lernen_MANA_5);
	Info_AddChoice		(Info_Mod_Albert_Lernen_MANA, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Albert_Lernen_MANA_1);
};

INSTANCE Info_Mod_Albert_Pickpocket (C_INFO)
{
	npc		= Mod_1958_VMG_Albert_MT;
	nr		= 1;
	condition	= Info_Mod_Albert_Pickpocket_Condition;
	information	= Info_Mod_Albert_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_150;
};

FUNC INT Info_Mod_Albert_Pickpocket_Condition()
{
	C_Beklauen	(145, ItSc_TrfShadowbeast, 1);
};

FUNC VOID Info_Mod_Albert_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Albert_Pickpocket);

	Info_AddChoice	(Info_Mod_Albert_Pickpocket, DIALOG_BACK, Info_Mod_Albert_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Albert_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Albert_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Albert_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Albert_Pickpocket);
};

FUNC VOID Info_Mod_Albert_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Albert_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Albert_Pickpocket);

		Info_AddChoice	(Info_Mod_Albert_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Albert_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Albert_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Albert_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Albert_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Albert_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Albert_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Albert_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Albert_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Albert_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Albert_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Albert_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Albert_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Albert_EXIT (C_INFO)
{
	npc		= Mod_1958_VMG_Albert_MT;
	nr		= 1;
	condition	= Info_Mod_Albert_EXIT_Condition;
	information	= Info_Mod_Albert_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Albert_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Albert_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};