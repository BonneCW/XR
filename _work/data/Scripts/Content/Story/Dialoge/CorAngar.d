INSTANCE Info_Mod_Angar_Hi (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Hi_Condition;
	information	= Info_Mod_Angar_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Angar_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Angar_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Angar_Hi_34_00"); //(überrascht) Du? Ich hätte nicht gedacht dich jemals wieder zu sehen.
	AI_Output(self, hero, "Info_Mod_Angar_Hi_34_01"); //Hast du den Schläfer besiegt?
	AI_Output(hero, self, "Info_Mod_Angar_Hi_15_02"); //Ja, ich hab ihn dorthin zurückgeschickt wo er herkam. Den sollten wir jetzt los sein.
};

INSTANCE Info_Mod_Angar_Irdorath (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Irdorath_Condition;
	information	= Info_Mod_Angar_Irdorath_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich werde demnächst eine Seereise zu einer Insel unternehmen.";
};

FUNC INT Info_Mod_Angar_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_Irdorath))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Irdorath_Info()
{
	AI_Output(hero, self, "Info_Mod_Angar_Irdorath_15_00"); //Ich werde demnächst eine Seereise zu einer Insel unternehmen, um der Vernichtung von Xeres näher zu kommen.
	AI_Output(hero, self, "Info_Mod_Angar_Irdorath_15_01"); //Er ist ein übler Magier und Herr über viele finstere Geschöpfe, unter anderem auch des Schläfers.
	AI_Output(self, hero, "Info_Mod_Angar_Irdorath_34_02"); //Was?! Dann muss ich dich unter allen Umständen begleiten.
	AI_Output(self, hero, "Info_Mod_Angar_Irdorath_34_03"); //Erst wenn dieser Unhold vernichtet ist, wurde der Tod unseres einstigen geistigen Anführers, Y'Berion, gesühnt.
};

INSTANCE Info_Mod_Angar_Irdorath2 (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Irdorath2_Condition;
	information	= Info_Mod_Angar_Irdorath2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ok, wir treffen uns dann beim Hafen in Khorinis.";
};

FUNC INT Info_Mod_Angar_Irdorath2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_Irdorath))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Irdorath2_Info()
{
	AI_Output(hero, self, "Info_Mod_Angar_Irdorath2_15_00"); //Ok, wir treffen uns dann beim Hafen in Khorinis.
	AI_Output(self, hero, "Info_Mod_Angar_Irdorath2_34_01"); //Ich werde dort auf dich warten.

	B_LogEntry	(TOPIC_MOD_HQ_CREW, "Cor Angar brennt darauf seinen Teil zur Vernichtung von Xeres beizutragen und wird mich auf der Reise begleiten.");

	B_GivePlayerXP	(100);

	Mod_AngarDabei = 1;

	Mod_CrewCount += 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
};

INSTANCE Info_Mod_Angar_Fanatiker (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Fanatiker_Condition;
	information	= Info_Mod_Angar_Fanatiker_Info;
	permanent	= 0;
	important	= 0;
	description	= "Gibt es noch Anhänger des Schläfers?";
};

FUNC INT Info_Mod_Angar_Fanatiker_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Andre_Auftrag))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Andre_Erfahrung_Fanatiker))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Fanatiker_Info()
{
	AI_Output(hero, self, "Info_Mod_Angar_Fanatiker_15_00"); //Gibt es noch Anhänger des Schläfers?
	AI_Output(self, hero, "Info_Mod_Angar_Fanatiker_34_01"); //Die meisten sind nach dem Tod von Y'Berion vom Glauben an den Schläfer abgegangen, doch einige sind aufgebrochen, den Schläfer zu finden.
	AI_Output(self, hero, "Info_Mod_Angar_Fanatiker_34_02"); //Es waren mehrere Grüppchen. Einige sind zusammen mit Cor Kalom damals in den Tempel gegangen, die anderen sind nach dem Fall der Barriere nach Khorinis aufgebrochen.
	AI_Output(self, hero, "Info_Mod_Angar_Fanatiker_34_03"); //Vermutlich haben sie sich in den Wäldern um die Stadt versteckt.

	if (Mod_Import_Dusty == LOG_SUCCESS)
	|| (Mod_Import_Dusty == -1)
	{
		AI_Output(self, hero, "Info_Mod_Angar_Fanatiker_34_04"); //Sprich am besten mit Dusty, er jagt momentan in den Wäldern um Khorinis. Des nachts solltest du ihn in der Stadt finden.

		B_LogEntry	(TOPIC_MOD_MILIZ_SEKTENSPINNER, "Vermutlich sind die fanatischen Sektenspinner in den Wäldern um Khorinis. Ich sollte mich mal mit Dusty unterhalten. Nachts sollte er in Khorinis zu finden sein.");
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Angar_Fanatiker_34_05"); //Sprich am besten mit Lester, der kennt sich in der Gegend besser aus.

		B_LogEntry	(TOPIC_MOD_MILIZ_SEKTENSPINNER, "Vermutlich sind die fanatischen Sektenspinner in den Wäldern um Khorinis. Ich sollte mich mal mit Lester unterhalten, der sich in der Gegend besser auskennt.");
	};
};

INSTANCE Info_Mod_Angar_Namib (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Namib_Condition;
	information	= Info_Mod_Angar_Namib_Info;
	permanent	= 0;
	important	= 0;
	description	= "Baal Namib schickt mich.";
};

FUNC INT Info_Mod_Angar_Namib_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Namib_AtTempel))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Namib_Info()
{
	AI_Output(hero, self, "Info_Mod_Angar_Namib_15_00"); //Baal Namib schickt mich. Ihr sollt Eure Position einnehmen.
	AI_Output(self, hero, "Info_Mod_Angar_Namib_34_01"); //Sehr gut. Aber leider ist Gor Na Vid nicht da. Du musst stattdessen das Kommando über die zweite Gruppe übernehmen. Schaffst du das?
	AI_Output(hero, self, "Info_Mod_Angar_Namib_15_02"); //Ich denke schon.
	AI_Output(self, hero, "Info_Mod_Angar_Namib_34_03"); //Ausgezeichnet. Dein Trupp muss zu Balors Sumpfkrautfeld. Ach ja, eins wäre da noch. Bevorzugst du Waffen oder Magie?

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Cor Angar ist bereit und hat mich damit betraut, den zweiten Trupp zu führen. Ich muss zu Balors Sumpfkrautfeld.");

	B_StartOtherRoutine	(self, "POSTEN");
	B_StartOtherRoutine	(Mod_1219_TPL_Templer_MT, "POSTEN");
	B_StartOtherRoutine	(Mod_1218_TPL_Templer_MT, "POSTEN");
	B_StartOtherRoutine	(Mod_1221_TPL_Templer_MT, "POSTEN");
	B_StartOtherRoutine	(Mod_1226_TPL_Templer_MT, "POSTEN");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_1218_TPL_Templer_MT.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_1219_TPL_Templer_MT.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_1221_TPL_Templer_MT.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_1226_TPL_Templer_MT.aivar[AIV_PARTYMEMBER] = TRUE;

	Info_ClearChoices	(Info_Mod_Angar_Namib);

	Info_AddChoice	(Info_Mod_Angar_Namib, "Waffen", Info_Mod_Angar_Namib_Waffen);
	Info_AddChoice	(Info_Mod_Angar_Namib, "Magie", Info_Mod_Angar_Namib_Magie);
};

FUNC VOID Info_Mod_Angar_Namib_Waffen()
{
	AI_Output(hero, self, "Info_Mod_Angar_Namib_Waffen_15_00"); //Waffen.
	AI_Output(self, hero, "Info_Mod_Angar_Namib_Waffen_34_01"); //Nahkampf oder Fernkampf?

	Info_ClearChoices	(Info_Mod_Angar_Namib);

	Info_AddChoice	(Info_Mod_Angar_Namib, "Nahkampf", Info_Mod_Angar_Namib_Nahkampf);
	Info_AddChoice	(Info_Mod_Angar_Namib, "Fernkampf", Info_Mod_Angar_Namib_Fernkampf);
};

FUNC VOID Info_Mod_Angar_Namib_Nahkampf()
{
	AI_Output(hero, self, "Info_Mod_Angar_Namib_Nahkampf_15_00"); //Nahkampf.
	AI_Output(self, hero, "Info_Mod_Angar_Namib_Nahkampf_34_01"); //Einhand oder Zweihand?

	Info_ClearChoices	(Info_Mod_Angar_Namib);

	Info_AddChoice	(Info_Mod_Angar_Namib, "Einhand", Info_Mod_Angar_Namib_Einhand);
	Info_AddChoice	(Info_Mod_Angar_Namib, "Zweihand", Info_Mod_Angar_Namib_Zweihand);
};

FUNC VOID Info_Mod_Angar_Namib_Einhand()
{
	AI_Output(hero, self, "Info_Mod_Angar_Namib_Einhand_15_00"); //Einhand.
	AI_Output(self, hero, "Info_Mod_Angar_Namib_Einhand_34_01"); //Gut, hier nimm dieses Keule.

	CreateInvItems	(self, ItMw_1H_Mace_02, 1);
	B_GiveInvItems	(self, hero, ItMw_1H_Mace_02, 1);
	
	Info_ClearChoices	(Info_Mod_Angar_Namib);
};

FUNC VOID Info_Mod_Angar_Namib_Zweihand()
{
	AI_Output(hero, self, "Info_Mod_Angar_Namib_Zweihand_15_00"); //Zweihand.
	AI_Output(self, hero, "Info_Mod_Angar_Namib_Zweihand_34_01"); //Gut, hier nimm dieses Keule.

	CreateInvItems	(self, ItMw_Stabkeule, 1);
	B_GiveInvItems	(self, hero, ItMw_Stabkeule, 1);
	
	Info_ClearChoices	(Info_Mod_Angar_Namib);
};

FUNC VOID Info_Mod_Angar_Namib_Fernkampf()
{
	AI_Output(hero, self, "Info_Mod_Angar_Namib_Fernkampf_15_00"); //Fernkampf.
	AI_Output(self, hero, "Info_Mod_Angar_Namib_Fernkampf_34_01"); //Armbrust oder Bogen?.

	Info_ClearChoices	(Info_Mod_Angar_Namib);

	Info_AddChoice	(Info_Mod_Angar_Namib, "Armbrust", Info_Mod_Angar_Namib_Armbrust);
	Info_AddChoice	(Info_Mod_Angar_Namib, "Bogen", Info_Mod_Angar_Namib_Bogen);
};

FUNC VOID Info_Mod_Angar_Namib_Armbrust()
{
	AI_Output(hero, self, "Info_Mod_Angar_Namib_Armbrust_15_00"); //Armbrust.
	AI_Output(self, hero, "Info_Mod_Angar_Namib_Armbrust_34_01"); //Gut, hier nimm diese Armbrust und ein paar Bolzen dazu.

	CreateInvItems	(self, ItRw_Crossbow_M_01, 1);
	B_GiveInvItems	(self, hero, ItRw_Crossbow_M_01, 1);

	CreateInvItems	(hero, ItRw_SchmetterBolt, 100);
	
	Info_ClearChoices	(Info_Mod_Angar_Namib);
};

FUNC VOID Info_Mod_Angar_Namib_Bogen()
{
	AI_Output(hero, self, "Info_Mod_Angar_Namib_Bogen_15_00"); //Bogen.
	AI_Output(self, hero, "Info_Mod_Angar_Namib_Bogen_34_01"); //Gut, hier nimm diesen Bogen und ein paar Pfeile dazu.

	CreateInvItems	(self, ItRw_Bow_L_04, 1);
	B_GiveInvItems	(self, hero, ItRw_Bow_L_04, 1);

	CreateInvItems	(hero, ItRw_SchmetterArrow, 100);
	
	Info_ClearChoices	(Info_Mod_Angar_Namib);
};

FUNC VOID Info_Mod_Angar_Namib_Magie()
{
	AI_Output(hero, self, "Info_Mod_Angar_Namib_Magie_15_00"); //Magie.
	AI_Output(self, hero, "Info_Mod_Angar_Namib_Magie_34_01"); //Gut, hier nimm diese Spruchrollen.

	CreateInvItems	(self, ItSc_Windfist, 10);
	B_GiveInvItems	(self, hero, ItSc_Windfist, 10);
	
	Info_ClearChoices	(Info_Mod_Angar_Namib);
};

INSTANCE Info_Mod_Angar_SSUD (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_SSUD_Condition;
	information	= Info_Mod_Angar_SSUD_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Angar_SSUD_Condition()
{
	if (Mod_Sekte_SH_Kampf >= 2)
	&& (Npc_IsDead(Swampshark_Undead))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_SSUD_Info()
{
	AI_Output(self, hero, "Info_Mod_Angar_SSUD_34_00"); //Gut, dass du gekommen bist. Mit untoten Sumpfhaien hatten wir nicht gerechnet.
	AI_Output(hero, self, "Info_Mod_Angar_SSUD_15_01"); //Ja, wir waren auch ziemlich überrascht.
	AI_Output(self, hero, "Info_Mod_Angar_SSUD_34_02"); //Du solltest jetzt zu Baal Namib gehen und im Bericht erstatten.

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Auch bei Cor Angar waren untote Sumpfhaie am Werk. Ich sollte jetzt zu Baal Namib gehen und ihm Bericht erstatten.");

	B_StartOtherRoutine	(Mod_106_TPL_Angar_MT, "START");
	B_StartOtherRoutine	(Mod_1219_TPL_Templer_MT, "START");
	B_StartOtherRoutine	(Mod_1218_TPL_Templer_MT, "START");
	B_StartOtherRoutine	(Mod_1221_TPL_Templer_MT, "START");
	B_StartOtherRoutine	(Mod_1226_TPL_Templer_MT, "START");

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_1218_TPL_Templer_MT.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_1219_TPL_Templer_MT.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_1221_TPL_Templer_MT.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_1226_TPL_Templer_MT.aivar[AIV_PARTYMEMBER] = FALSE;
};

INSTANCE Info_Mod_Angar_Wambo (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Wambo_Condition;
	information	= Info_Mod_Angar_Wambo_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich komme in Wambos Auftrag.";
};

FUNC INT Info_Mod_Angar_Wambo_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wambo_Asylanten))
	&& (Npc_HasItems(hero, ItMi_AngarHalskette) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Wambo_Info()
{
	AI_Output(hero, self, "Info_Mod_Angar_Wambo_15_00"); //Ich komme in Wambos Auftrag.
	AI_Output(self, hero, "Info_Mod_Angar_Wambo_34_01"); //(erfreut) Wambo?! Dass der sich noch an mich erinnert!
	AI_Output(hero, self, "Info_Mod_Angar_Wambo_15_02"); //Allerdings habe ich keine guten Nachrichten für dich.

	B_GiveInvItems	(hero, self, ItMi_AngarHalskette, 1);

	AI_Output(self, hero, "Info_Mod_Angar_Wambo_34_03"); //Du meinst ...
	AI_Output(hero, self, "Info_Mod_Angar_Wambo_15_04"); //Ja. Wambo plagen bis heute Gewissensbisse.
	AI_Output(self, hero, "Info_Mod_Angar_Wambo_34_05"); //(mit erstickter Stimme) Ich hatte nie erwartet, sie wiederzusehen.
	AI_Output(self, hero, "Info_Mod_Angar_Wambo_34_06"); //Aber jetzt ist auch alle Hoffnung hinüber.
	AI_Output(self, hero, "Info_Mod_Angar_Wambo_34_07"); //(gefasst) Danke für deinen Botendienst. Ich ... ich muss jetzt erst mal allein sein.

	B_GivePlayerXP	(150);

	B_SetTopicStatus	(TOPIC_MOD_WAMBO_ANGAR, LOG_SUCCESS);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Angar_Hueterklinge (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Hueterklinge_Condition;
	information	= Info_Mod_Angar_Hueterklinge_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Angar_Hueterklinge_Condition()
{
	if (Templer_Dabei == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Hueterklinge_Info()
{
	AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge_34_00"); //Du bist jetzt also Templer, aber vollwertig bist du erst, wenn du deine eigene Hüterklinge führen wirst.
	AI_Output(hero, self, "Info_Mod_Angar_Hueterklinge_15_01"); //Und woher bekomme ich die?
	AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge_34_02"); //Kommt darauf an, ob du ein Einhand- oder ein Zweihandschwert möchtest.

	Info_ClearChoices	(Info_Mod_Angar_Hueterklinge);

	Info_AddChoice	(Info_Mod_Angar_Hueterklinge, "Ich möchte ein Zweihandschwert.", Info_Mod_Angar_Hueterklinge_B);
	Info_AddChoice	(Info_Mod_Angar_Hueterklinge, "Ich möchte ein Einhandschwert.", Info_Mod_Angar_Hueterklinge_A);
};

FUNC VOID Info_Mod_Angar_Hueterklinge_C()
{
	AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge_C_34_00"); //Du musst die nötigen Rohstoffe in der Schmiede vorbeibringen.
	AI_Output(hero, self, "Info_Mod_Angar_Hueterklinge_C_15_01"); //Und wo um alles in der Welt, soll ich all diese Sachen bekommen?
	AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge_C_34_02"); //Das herauszufinden wird der erste Schritt deiner Aufgabe sein.
	AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge_C_34_03"); //Frag doch einfach andere Templer, woher sie das Zeug bekommen haben.

	Info_ClearChoices	(Info_Mod_Angar_Hueterklinge);
};

FUNC VOID Info_Mod_Angar_Hueterklinge_B()
{
	AI_Output(hero, self, "Info_Mod_Angar_Hueterklinge_B_15_00"); //Ich möchte ein Zweihandschwert.
	AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge_B_34_01"); //Für eine zweihändig führbare Hüterklinge brauchst du 8 Brocken magisches Erz, 6 reisfressende Heilpflanzen vom Reislord, einen Dolch, der das Blut von 4 Königen getrunken hat und das Fleisch eines Scavangers, der nicht aus einem Ei geschlüpft ist.

	Log_CreateTopic	(TOPIC_MOD_SL_SCHMIEDEFEUERN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SL_SCHMIEDEFEUERN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SL_SCHMIEDEFEUERN, "Für eine zweihändige Hüterklinge brauche ich 8 Brocken magisches Erz, 6 reisfressende Heilpflanzen vom Reislord, einen Dolch, der das Blut von 4 Königen getrunken hat und das Fleisch eines Scavengers, der nicht aus einem Ei geschlüpft ist. Die Sachen muss ich alle zu Darrion bringen. Um zu erfahren, wie ich an die Sachen komme, sollte ich mich bei den anderen Templern umhören.");

	Mod_TPL_Hueterklinge_Art = 2;
	
	Wld_InsertItem(ItPl_Health_Herb_01_Reisfresser, "FP_PICKRICE_3_NC_11");
	Wld_InsertItem(ItPl_Health_Herb_01_Reisfresser, "FP_PICKRICE_3_NC_25");
	Wld_InsertItem(ItPl_Health_Herb_01_Reisfresser, "FP_PICKRICE_3_NC_13");
	Wld_InsertItem(ItPl_Health_Herb_01_Reisfresser, "FP_PICKRICE_2_NC_14");
	Wld_InsertItem(ItPl_Health_Herb_01_Reisfresser, "FP_PICKRICE_3_NC_17");
	Wld_InsertItem(ItPl_Health_Herb_01_Reisfresser, "FP_PICKRICE_2_NC_16");

	Info_Mod_Angar_Hueterklinge_C();
};

FUNC VOID Info_Mod_Angar_Hueterklinge_A()
{
	AI_Output(hero, self, "Info_Mod_Angar_Hueterklinge_A_15_00"); //Ich möchte ein Einhandschwert.
	AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge_A_34_01"); //Für eine einhändig führbare Hüterklinge brauchst du 4 Brocken magisches Erz, eine Orkstatuette gemetzt aus einem Stein vom Stonehenge, den Knochen eines alten Herrschers, der über tausend Jahre herrschte und die Zähne eines Wolfes, der seine eigene Mutter gerissen hat.

	Log_CreateTopic	(TOPIC_MOD_SL_SCHMIEDEFEUERN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SL_SCHMIEDEFEUERN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SL_SCHMIEDEFEUERN, "Für eine einhändige Hüterklinge brauche ich 4 Brocken magisches Erz, eine Orkstatuette gemetzt aus einem Stein vom Stonehenge, den Knochen eines alten Herrschers, der über tausend Jahre herrschte und die Zähne eines Wolfes, der seine eigene Mutter gerissen hat. Die Sachen muss ich alle zu Darrion bringen. Um zu erfahren, wie ich an die Sachen komme, sollte ich mich bei den anderen Templern umhören.");

	Mod_TPL_Hueterklinge_Art = 1;

	Info_Mod_Angar_Hueterklinge_C();
};

INSTANCE Info_Mod_Angar_Hueterklinge3 (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Hueterklinge3_Condition;
	information	= Info_Mod_Angar_Hueterklinge3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hey.";
};

FUNC INT Info_Mod_Angar_Hueterklinge3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_GorNaMon_Hueterklinge))
	&& (Mod_TPL_Hueterklinge == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Hueterklinge3_Info()
{
	AI_Output(hero, self, "Info_Mod_Angar_Hueterklinge3_15_00"); //Hey.
	AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge3_34_01"); //Was gibt’s?

	if (self.aivar[AIV_Verhandlung] == TRUE)
	{
		AI_Output(hero, self, "Info_Mod_Angar_Hueterklinge3_15_02"); //Ich würde gerne von ein paar älteren Templern ein paar Tricks und Kniffe lernen, an wen könnte ich mich dabei wenden?
		AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge3_34_03"); //Ich verstehe, nun, Gor Na Kar ist wohl der Templer mit am meisten Kampferfahrung, Gor Na Mon wurde bereits in jungen Jahren Templer, hat also für sein Alter schon sehr viel mitgemacht.
		AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge3_34_04"); //Der älteste Templer ist Gor Na Drak, allerdings ist er schon ziemlich senil und viel Nützliches wirst du von ihm nicht mehr hören.

		Mod_TPL_Hueterklinge_Drak = TRUE;

		B_LogEntry	(TOPIC_MOD_SL_SCHMIEDEFEUERN, "Ich sollte Gor Na Drak wohl einen Besuch abstatten.");
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Angar_Hueterklinge3_15_05"); //Ich suche einen älteren Templer. du weißt nicht zufällig, wer da in Frage käme?
		AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge3_34_06"); //Du willst mich wohl für dumm verkaufen? Besorg dir gefälligst eine eigene Hüterklinge!
	};
};

INSTANCE Info_Mod_Angar_Hueterklinge4 (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Hueterklinge4_Condition;
	information	= Info_Mod_Angar_Hueterklinge4_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe eine Hüterklinge erhalten.";
};

FUNC INT Info_Mod_Angar_Hueterklinge4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_Hueterklinge))
	&& ((Npc_HasItems(hero, ItMw_AlteHueterklinge_2H) == 1)
	|| (Npc_HasItems(hero, ItMw_AlteHueterklinge_1H) == 1)
	|| (Npc_HasItems(hero, ItMw_FalscheHueterklinge_2H) == 1)
	|| (Npc_HasItems(hero, ItMw_FalscheHueterklinge_1H) == 1)
	|| (Npc_HasItems(hero, ItMw_Hueterklinge_2H) == 1)
	|| (Npc_HasItems(hero, ItMw_Hueterklinge_1H) == 1)
	|| (Npc_HasItems(hero, ItMw_AlteHueterklinge_2H_Geschaerft) == 1)
	|| (Npc_HasItems(hero, ItMw_AlteHueterklinge_1H_Geschaerft) == 1)
	|| (Npc_HasItems(hero, ItMw_FalscheHueterklinge_2H_Geschaerft) == 1)
	|| (Npc_HasItems(hero, ItMw_FalscheHueterklinge_1H_Geschaerft) == 1)
	|| (Npc_HasItems(hero, ItMw_Hueterklinge_2H_Geschaerft) == 1)
	|| (Npc_HasItems(hero, ItMw_Hueterklinge_1H_Geschaerft) == 1))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Hueterklinge4_Info()
{
	AI_Output(hero, self, "Info_Mod_Angar_Hueterklinge4_15_00"); //Ich habe eine Hüterklinge erhalten.

	if ((Npc_HasItems(hero, ItMw_AlteHueterklinge_2H) == 1)
	|| (Npc_HasItems(hero, ItMw_AlteHueterklinge_1H) == 1)
	|| (Npc_HasItems(hero, ItMw_FalscheHueterklinge_2H) == 1)
	|| (Npc_HasItems(hero, ItMw_FalscheHueterklinge_1H) == 1)
	|| (Npc_HasItems(hero, ItMw_AlteHueterklinge_2H_Geschaerft) == 1)
	|| (Npc_HasItems(hero, ItMw_AlteHueterklinge_1H_Geschaerft) == 1)
	|| (Npc_HasItems(hero, ItMw_FalscheHueterklinge_2H_Geschaerft) == 1)
	|| (Npc_HasItems(hero, ItMw_FalscheHueterklinge_1H_Geschaerft) == 1))
	{
		if (Npc_HasItems(hero, ItMw_AlteHueterklinge_2H) == 1)
		|| (Npc_HasItems(hero, ItMw_AlteHueterklinge_1H) == 1)
		|| (Npc_HasItems(hero, ItMw_AlteHueterklinge_2H_Geschaerft) == 1)
		|| (Npc_HasItems(hero, ItMw_AlteHueterklinge_1H_Geschaerft) == 1)
		{
			AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge4_34_01"); //Die sieht mir aber ziemlich alt aus ...
		}
		else
		{
			AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge4_34_02"); //Hüterklinge? Dafür sieht sie aber ziemlich gewöhnlich aus ...
		};

		AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge4_34_03"); //Wie dem auch sei, du hast deine Aufgabe erfüllt. Du bist jetzt ein vollwertiger Templer.

		B_GivePlayerXP	(200);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge4_34_04"); //Wahrlich ein wunderschönes Schwert ... ich bin beeindruckt! Du bist ein würdiger Templer!

		B_GivePlayerXP	(350);
	};

	B_SetTopicStatus	(TOPIC_MOD_SL_SCHMIEDEFEUERN, LOG_SUCCESS);
};

INSTANCE Info_Mod_Angar_Eroberung_03 (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Eroberung_03_Condition;
	information	= Info_Mod_Angar_Eroberung_03_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Angar_Eroberung_03_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Cadar_Eroberung_02))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Eroberung_03_Info()
{
	AI_Output(self, hero, "Info_Mod_Angar_Eroberung_03_34_00"); //Ihr werdet dabei von zwei meiner Templer begleitet.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Angar_Hueterklinge2 (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Hueterklinge2_Condition;
	information	= Info_Mod_Angar_Hueterklinge2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Woher hast DU das Zeug bekommen?";
};

FUNC INT Info_Mod_Angar_Hueterklinge2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_Hueterklinge))
	&& (Mod_TPL_Hueterklinge == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Hueterklinge2_Info()
{
	AI_Output(hero, self, "Info_Mod_Angar_Hueterklinge2_15_00"); //Woher hast DU das Zeug bekommen?
	AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge2_34_01"); //So einfach mach ich es dir auch wieder nicht.
};

INSTANCE Info_Mod_Angar_Woher (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Woher_Condition;
	information	= Info_Mod_Angar_Woher_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wieso warst du eigentlich in der Kolonie?";
};

FUNC INT Info_Mod_Angar_Woher_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Woher_Info()
{
	AI_Output(hero, self, "Info_Mod_Angar_Woher_15_00"); //Wieso warst du eigentlich in der Kolonie?
	AI_Output(self, hero, "Info_Mod_Angar_Woher_03_01"); //Ich war damals ein Mitglieder königlichen Leibwache, aber ein paar Leuten hat das nicht gefallen.
	AI_Output(self, hero, "Info_Mod_Angar_Woher_03_02"); //Sie haben mir ein Verbrechen angehängt und der König hat ihnen geglaubt und mich in die Barriere geworfen.
	AI_Output(self, hero, "Info_Mod_Angar_Woher_03_03"); //Dem Söldner Lee ist das Selbe passiert, wie ich gehört habe.
	AI_Output(hero, self, "Info_Mod_Angar_Woher_15_04"); //Und dann bist du ins Sumpflager gegangen?
	AI_Output(self, hero, "Info_Mod_Angar_Woher_03_05"); //Nein, das Lager der Bruderschaft existierte damals noch nicht. Ich freundete mich im alten Lager mit Y'Berion an und gründete dann mit ihm und Cor Kalom erst später das Lager.
	AI_Output(self, hero, "Info_Mod_Angar_Woher_03_06"); //Y'Berion übernahm die Ausbildung der Gurus während ich die Templer im Kampf trainierte.
	AI_Output(self, hero, "Info_Mod_Angar_Woher_03_07"); //Nach dem Tod Y'Berions habe ich das Lager weitergeführt, bis die schlimmste Zeit vürber war.
	AI_Output(self, hero, "Info_Mod_Angar_Woher_03_08"); //Danach hat mich Cor Cadar unterstützt, welcher mittlerweile der geistliche Anführer des Lagers ist.
};

var int Angar_LastPetzCounter;
var int Angar_LastPetzCrime;

INSTANCE Info_Mod_Angar_PMSchulden (C_INFO)
{
	npc         	= Mod_106_TPL_Angar_MT;
	nr          	= 1;
	condition   	= Info_Mod_Angar_PMSchulden_Condition;
	information 	= Info_Mod_Angar_PMSchulden_Info;
	permanent   	= 1;
	important 	= 1; 
};

FUNC INT Info_Mod_Angar_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Angar_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Angar_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Angar_PMSchulden_Info()
{
	AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_00"); //Bist du gekommen, um deine Strafe zu zahlen?

	if (B_GetTotalPetzCounter(self) > Angar_LastPetzCounter)
	{
		AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_01"); //Ich hatte mich schon gefragt, ob du es überhaupt noch wagst, hierher zu kommen!
		AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_02"); //Anscheinend ist es nicht bei den letzten Anschuldigungen geblieben!

		if (Angar_Schulden < 1000)
		{
			AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_03"); //Ich hatte dich gewarnt! Die Strafe, die du jetzt zahlen musst, ist höher!
			AI_Output (hero, self, "Info_Mod_Angar_PMAdd_15_00"); //Wieviel?
			
			var int diff; diff = (B_GetTotalPetzCounter(self) - Angar_LastPetzCounter);
		
			if (diff > 0)
			{
				Angar_Schulden = Angar_Schulden + (diff * 50);
			};
		
			if (Angar_Schulden > 1000)	{	Angar_Schulden = 1000;	};
		
			B_Say_Gold (self, hero, Angar_Schulden);
		}
		else
		{
			AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_04"); //Du hast mich schwer enttäuscht!
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Angar_LastPetzCrime)
	{
		AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_05"); //Es haben sich einige neue Dinge ergeben.
		
		if (Angar_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_06"); //Plötzlich gibt es niemanden mehr, der dich des Mordes bezichtigt.
		};
		
		if (Angar_LastPetzCrime == CRIME_THEFT)
		|| ( (Angar_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_07"); //Niemand erinnert sich mehr, dich bei einem Diebstahl gesehen zu haben.
		};
		
		if (Angar_LastPetzCrime == CRIME_ATTACK)
		|| ( (Angar_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_08"); //Es gibt keine Zeugen mehr dafür, dass du jemals in eine Schlägerei verwickelt warst.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_09"); //Anscheinend haben sich alle Anklagen gegen dich in Wohlgefallen aufgelöst.
		};
		
		AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_10"); //Ich weiß nicht, was da gelaufen ist, aber ich warne dich: Spiel keine Spielchen mit mir.
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_11"); //Ich habe mich jedenfalls entschieden, dir deine Schulden zu erlassen.
			AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_12"); //Sieh zu, dass du nicht wieder in Schwierigkeiten kommst.
	
			Angar_Schulden			= 0;
			Angar_LastPetzCounter 	= 0;
			Angar_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_13"); //Damit eins klar ist: Deine Strafe musst du trotzdem in voller Höhe zahlen.
			B_Say_Gold (self, hero, Angar_Schulden);
			AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_14"); //Also, was ist?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(Info_Mod_Angar_PMSchulden);
		Info_ClearChoices  	(Info_Mod_Angar_PETZMASTER);
		Info_AddChoice		(Info_Mod_Angar_PMSchulden,"Ich habe nicht genug Gold!",Info_Mod_Angar_PETZMASTER_PayLater);
		Info_AddChoice		(Info_Mod_Angar_PMSchulden,"Wieviel war es nochmal?",Info_Mod_Angar_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(hero, itmi_gold) >= Angar_Schulden)
		{
			Info_AddChoice 	(Info_Mod_Angar_PMSchulden,"Ich will die Strafe zahlen.",Info_Mod_Angar_PETZMASTER_PayNow);
		};
	};
};

func void Info_Mod_Angar_PMSchulden_HowMuchAgain()
{
	AI_Output (hero, self, "Info_Mod_Angar_PMSchulden_HowMuchAgain_15_00"); //Wie viel war es noch mal?
	B_Say_Gold (self, hero, Angar_Schulden);

	Info_ClearChoices  	(Info_Mod_Angar_PMSchulden);
	Info_ClearChoices  	(Info_Mod_Angar_PETZMASTER);
	Info_AddChoice		(Info_Mod_Angar_PMSchulden,"Ich habe nicht genug Gold!",Info_Mod_Angar_PETZMASTER_PayLater);
	Info_AddChoice		(Info_Mod_Angar_PMSchulden,"Wieviel war es nochmal?",Info_Mod_Angar_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(hero, itmi_gold) >= Angar_Schulden)
	{
		Info_AddChoice 	(Info_Mod_Angar_PMSchulden,"Ich will die Strafe zahlen.",Info_Mod_Angar_PETZMASTER_PayNow);
	};
};

INSTANCE Info_Mod_Angar_PETZMASTER   (C_INFO)
{
	npc         	= Mod_106_TPL_Angar_MT;
	nr          	= 1;
	condition   	= Info_Mod_Angar_PETZMASTER_Condition;
	information 	= Info_Mod_Angar_PETZMASTER_Info;
	permanent   	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Angar_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Angar_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Angar_PETZMASTER_Info()
{
	Angar_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...	
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_01"); //Gut, dass du zu mir kommst, bevor alles noch schlimmer für dich wird.
		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_02"); //Mord ist ein schweres Vergehen!

		Angar_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50

		Angar_Schulden = Angar_Schulden + 500;						//PLUS Mörder-Malus

		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_03"); //Ganz zu schweigen von den anderen Sachen, die du angerichtet hast.
		};

		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_06"); //Ich habe kein Interesse daran, dich an den Galgen zu bringen.
		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_07"); //Aber es wird nicht leicht sein, die Leute wieder gnädig zu stimmen.
		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_08"); //Du könntest deine Reue zeigen, indem du eine Strafe zahlst - natürlich muss die Strafe angemessen hoch sein.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_09"); //Gut, dass du kommst! Du wirst des Diebstahls bezichtigt! Es gibt Zeugen!

		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_10"); //Von den anderen Dingen, die mir zu Ohren gekommen sind, will ich gar nicht erst reden.
		};

		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_11"); //Ich werde so ein Verhalten hier im Lager nicht dulden!
		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_12"); //Du wirst eine Strafe zahlen müssen, um dein Verbrechen wieder gutzumachen!
		
		Angar_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_14"); //Wenn du dich mit unseren Brüdern anlegst, muss ich dich zur Rechenschaft ziehen.

		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_15"); //Und die Sache mit den Schafen musste wohl auch nicht sein.
		};

		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_16"); //Wenn ich dir das durchgehen lasse, macht hier bald jeder, was er will.
		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_17"); //Also wirst du eine angemessene Strafe zahlen - und die Sache ist vergessen.
		
		Angar_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_18"); //Mir ist zu Ohren gekommen, du hättest dich an unseren Schafen vergriffen.
		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_19"); //Dir ist klar, dass ich das nicht durchgehen lassen kann.
		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_20"); //Du wirst eine Entschädigung zahlen müssen!
		
		Angar_Schulden = 100;
	};
	
	AI_Output (hero, self, "Info_Mod_Angar_PETZMASTER_15_21"); //Wie viel?
	
	if (Angar_Schulden > 1000)	{	Angar_Schulden = 1000;	};
		
	B_Say_Gold (self, hero, Angar_Schulden);
	
	Info_ClearChoices  	(Info_Mod_Angar_PMSchulden);
	Info_ClearChoices  	(Info_Mod_Angar_PETZMASTER);
	Info_AddChoice		(Info_Mod_Angar_PETZMASTER,"Ich habe nicht genug Gold!",Info_Mod_Angar_PETZMASTER_PayLater);
	if (Npc_HasItems(hero, itmi_gold) >= Angar_Schulden)
	{
		Info_AddChoice 	(Info_Mod_Angar_PETZMASTER,"Ich will die Strafe zahlen.",Info_Mod_Angar_PETZMASTER_PayNow);
	};
};

func void Info_Mod_Angar_PETZMASTER_PayNow()
{
	AI_Output (hero, self, "Info_Mod_Angar_PETZMASTER_PayNow_15_00"); //Ich will die Strafe zahlen!
	B_GiveInvItems (hero, self, itmi_gold, Angar_Schulden);
	AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_PayNow_34_01"); //Gut! Ich werde dafür sorgen, dass es jeder im Lager erfährt - damit wäre dein Ruf einigermaßen wiederhergestellt.

	B_GrantAbsolution (LOC_PSICAMP);
	
	Angar_Schulden			= 0;
	Angar_LastPetzCounter 	= 0;
	Angar_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(Info_Mod_Angar_PETZMASTER);
	Info_ClearChoices  	(Info_Mod_Angar_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void Info_Mod_Angar_PETZMASTER_PayLater()
{
	AI_Output (hero, self, "Info_Mod_Angar_PETZMASTER_PayLater_15_00"); //Ich habe nicht genug Gold!
	AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_PayLater_34_01"); //Dann sieh zu, dass du das Gold so schnell wie möglich beschaffst.
	AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_PayLater_34_02"); //Und ich warne dich: Wenn du dir noch was zu schulden kommen lässt, wird die Sache noch schlimmer für dich!
	
	Angar_LastPetzCounter 	= B_GetTotalPetzCounter(self);
	Angar_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	AI_StopProcessInfos (self);
};

INSTANCE Info_Mod_Angar_Lehrer (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Lehrer_Condition;
	information	= Info_Mod_Angar_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir was beibringen?";
};

FUNC INT Info_Mod_Angar_Lehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_Hi))
	&& (Templer_Dabei == 1)
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Lehrer_Info()
{
	B_Say	(hero, self, "$KANNSTDUMIRWASBEIBRINGEN");

	AI_Output(self, hero, "Info_Mod_Angar_Lehrer_34_00"); //Ich kann dir helfen stärker zu werden. Außerdem kann ich dich im Kampf mit Zweihändern unterweisen.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_SUMPF, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_SUMPF, "Cor Angar kann mir helfen Stärker zu werden und mir den Umgang mit Zweihändern beibringen.");
};

INSTANCE Info_Mod_Angar_Lernen (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Lernen_Condition;
	information	= Info_Mod_Angar_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Bring mir was bei.";
};

FUNC INT Info_Mod_Angar_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_Lehrer))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Angar_Lernen_15_00"); //Bring mir was bei.
	AI_Output(self, hero, "Info_Mod_Angar_Lernen_34_01"); //Was willst du lernen?

	Info_ClearChoices	(Info_Mod_Angar_Lernen);

	Info_AddChoice 		(Info_Mod_Angar_Lernen, DIALOG_BACK, Info_Mod_Angar_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Angar_Lernen_Staerke_5);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Angar_Lernen_Staerke_1);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H))		,Info_Mod_Angar_Lernen_Zweihand_5);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1))		,Info_Mod_Angar_Lernen_Zweihand_1);
};

FUNC VOID Info_Mod_Angar_Lernen_Zweihand_5()
{
	B_TeachFightTalentPercent_New	(self, hero, NPC_TALENT_2H, 5, 100);
	
	Info_ClearChoices	(Info_Mod_Angar_Lernen);

	Info_AddChoice 		(Info_Mod_Angar_Lernen, DIALOG_BACK, Info_Mod_Angar_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Angar_Lernen_Staerke_5);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Angar_Lernen_Staerke_1);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H))		,Info_Mod_Angar_Lernen_Zweihand_5);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1))		,Info_Mod_Angar_Lernen_Zweihand_1);
};

FUNC VOID Info_Mod_Angar_Lernen_Zweihand_1()
{
	B_TeachFightTalentPercent	(self, hero, NPC_TALENT_2H, 1, 100);
	
	Info_ClearChoices	(Info_Mod_Angar_Lernen);

	Info_AddChoice 		(Info_Mod_Angar_Lernen, DIALOG_BACK, Info_Mod_Angar_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Angar_Lernen_Staerke_5);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Angar_Lernen_Staerke_1);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H))		,Info_Mod_Angar_Lernen_Zweihand_5);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1))		,Info_Mod_Angar_Lernen_Zweihand_1);
};

FUNC VOID Info_Mod_Angar_Lernen_BACK()
{
	Info_ClearChoices (Info_Mod_Angar_Lernen);
};

FUNC VOID Info_Mod_Angar_Lernen_Staerke_5()
{
	B_TeachAttributePoints_New (self, hero, ATR_STRENGTH, 5, 200);
	
	Info_ClearChoices	(Info_Mod_Angar_Lernen);

	Info_AddChoice 		(Info_Mod_Angar_Lernen, DIALOG_BACK, Info_Mod_Angar_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Angar_Lernen_Staerke_5);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Angar_Lernen_Staerke_1);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H))		,Info_Mod_Angar_Lernen_Zweihand_5);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1))		,Info_Mod_Angar_Lernen_Zweihand_1);
};

FUNC VOID Info_Mod_Angar_Lernen_Staerke_1()
{
	B_TeachAttributePoints (self, hero, ATR_STRENGTH, 1, 200);
	
	Info_ClearChoices	(Info_Mod_Angar_Lernen);

	Info_AddChoice 		(Info_Mod_Angar_Lernen, DIALOG_BACK, Info_Mod_Angar_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Angar_Lernen_Staerke_5);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Angar_Lernen_Staerke_1);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H))		,Info_Mod_Angar_Lernen_Zweihand_5);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1))		,Info_Mod_Angar_Lernen_Zweihand_1);
};

INSTANCE Info_Mod_Angar_Pickpocket (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Pickpocket_Condition;
	information	= Info_Mod_Angar_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_180;
};

FUNC INT Info_Mod_Angar_Pickpocket_Condition()
{
	C_Beklauen	(157, ItMi_Gold, 101);
};

FUNC VOID Info_Mod_Angar_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Angar_Pickpocket);

	Info_AddChoice	(Info_Mod_Angar_Pickpocket, DIALOG_BACK, Info_Mod_Angar_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Angar_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Angar_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Angar_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Angar_Pickpocket);
};

FUNC VOID Info_Mod_Angar_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Angar_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Angar_Pickpocket);

		Info_AddChoice	(Info_Mod_Angar_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Angar_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Angar_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Angar_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Angar_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Angar_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Angar_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Angar_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Angar_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Angar_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Angar_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Angar_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Angar_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Angar_EXIT (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_EXIT_Condition;
	information	= Info_Mod_Angar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Angar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Angar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};