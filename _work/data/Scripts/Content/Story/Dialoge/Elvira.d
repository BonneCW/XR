INSTANCE Info_Mod_Elvira_Frauenkleider (C_INFO)
{
	npc		= Mod_7499_KDF_Elvira_REL;
	nr		= 1;
	condition	= Info_Mod_Elvira_Frauenkleider_Condition;
	information	= Info_Mod_Elvira_Frauenkleider_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Elvira_Frauenkleider_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Elvira_Frauenkleider_Info()
{
	AI_Output(self, hero, "Info_Mod_Elvira_Frauenkleider_17_00"); //(herrisch) Warte! Ich habe eine Aufgabe für dich!
	AI_Output(hero, self, "Info_Mod_Elvira_Frauenkleider_15_01"); //Ach ja?
	AI_Output(self, hero, "Info_Mod_Elvira_Frauenkleider_17_02"); //Ich bin auf meiner Reise nach Khorata überfallen und meiner Kleider beraubt worden.
	AI_Output(self, hero, "Info_Mod_Elvira_Frauenkleider_17_03"); //Du wirst sie mir wieder beschaffen!
};

INSTANCE Info_Mod_Elvira_Frauenkleider2 (C_INFO)
{
	npc		= Mod_7499_KDF_Elvira_REL;
	nr		= 1;
	condition	= Info_Mod_Elvira_Frauenkleider2_Condition;
	information	= Info_Mod_Elvira_Frauenkleider2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Warum so unfreundlich?";
};

FUNC INT Info_Mod_Elvira_Frauenkleider2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Elvira_Frauenkleider))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Elvira_Frauenkleider2_Info()
{
	AI_Output(hero, self, "Info_Mod_Elvira_Frauenkleider2_15_00"); //Warum so unfreundlich?
	AI_Output(self, hero, "Info_Mod_Elvira_Frauenkleider2_17_01"); //Daran seid ihr Männer schon selbst Schuld!
	AI_Output(self, hero, "Info_Mod_Elvira_Frauenkleider2_17_02"); //Erst wird mir ein schlechtes Gewissen eingeredet, weil ich nicht männlich bin, und dann wird mir auch noch das Zeichen meiner Weiblichkeit gestohlen!
	AI_Output(self, hero, "Info_Mod_Elvira_Frauenkleider2_17_03"); //Was soll denn da noch übrig bleiben?
};

INSTANCE Info_Mod_Elvira_Frauenkleider3 (C_INFO)
{
	npc		= Mod_7499_KDF_Elvira_REL;
	nr		= 1;
	condition	= Info_Mod_Elvira_Frauenkleider3_Condition;
	information	= Info_Mod_Elvira_Frauenkleider3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wo genau wurdest du überfallen?";
};

FUNC INT Info_Mod_Elvira_Frauenkleider3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Elvira_Frauenkleider2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Elvira_Frauenkleider3_Info()
{
	AI_Output(hero, self, "Info_Mod_Elvira_Frauenkleider3_15_00"); //Wo genau wurdest du überfallen?
	AI_Output(self, hero, "Info_Mod_Elvira_Frauenkleider3_17_01"); //Ist das nicht egal? Die Räuber werden schon keine Spuren hinterlassen haben, schließlich haben sie nur meinen Kleiderkoffer mitgenommen.
	AI_Output(self, hero, "Info_Mod_Elvira_Frauenkleider3_17_02"); //Aber so viel von dem Lumpenpack kann es doch hier nicht geben, oder?

	Info_ClearChoices	(Info_Mod_Elvira_Frauenkleider3);

	Info_AddChoice	(Info_Mod_Elvira_Frauenkleider3, "Such doch allein.", Info_Mod_Elvira_Frauenkleider3_B);
	Info_AddChoice	(Info_Mod_Elvira_Frauenkleider3, "Ich werde mich umsehen.", Info_Mod_Elvira_Frauenkleider3_A);
};

FUNC VOID Info_Mod_Elvira_Frauenkleider3_B()
{
	AI_Output(hero, self, "Info_Mod_Elvira_Frauenkleider3_B_15_00"); //Such doch allein.
	AI_Output(self, hero, "Info_Mod_Elvira_Frauenkleider3_B_17_01"); //(sarkastisch) Danke.

	Info_ClearChoices	(Info_Mod_Elvira_Frauenkleider3);
};

FUNC VOID Info_Mod_Elvira_Frauenkleider3_A()
{
	AI_Output(hero, self, "Info_Mod_Elvira_Frauenkleider3_A_15_00"); //Ich werde mich umsehen.
	AI_Output(self, hero, "Info_Mod_Elvira_Frauenkleider3_A_17_01"); //Na, immerhin scheinst du ganz vernünftig zu sein.

	Info_ClearChoices	(Info_Mod_Elvira_Frauenkleider3);

	Log_CreateTopic	(TOPIC_MOD_KHORATA_FRAUENKLEIDER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_KHORATA_FRAUENKLEIDER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_KHORATA_FRAUENKLEIDER, "Elvira, die Feuermagierin aus Khorata, hat bei einem Überfall ihre Kleider verloren. Verantwortlich dafür soll eine Diebesbande sein.");

	Mod_REL_Frauenkleider = 1;
};

INSTANCE Info_Mod_Elvira_Frauenkleider4 (C_INFO)
{
	npc		= Mod_7499_KDF_Elvira_REL;
	nr		= 1;
	condition	= Info_Mod_Elvira_Frauenkleider4_Condition;
	information	= Info_Mod_Elvira_Frauenkleider4_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe deine Kleider dabei.";
};

FUNC INT Info_Mod_Elvira_Frauenkleider4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Melvin_Frauenkleider2))
	&& (Npc_HasItems(hero, ItMi_Kleiderkoffer) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Elvira_Frauenkleider4_Info()
{
	AI_Output(hero, self, "Info_Mod_Elvira_Frauenkleider4_15_00"); //Ich habe deine Kleider dabei.

	B_GiveInvItems	(hero, self, ItMi_Kleiderkoffer, 1);

	AI_Output(self, hero, "Info_Mod_Elvira_Frauenkleider4_17_01"); //Ja, das sind sie. Hätte nicht damit gerechnet, sie wiederzusehen.
	AI_Output(self, hero, "Info_Mod_Elvira_Frauenkleider4_17_02"); //Nimm diese Tränke als Dank.

	B_GiveInvItems	(self, hero, ItPo_Health_02, 3);

	B_GivePlayerXP	(150);

	B_SetTopicStatus	(TOPIC_MOD_KHORATA_FRAUENKLEIDER, LOG_SUCCESS);

	CurrentNQ += 1;

	Mod_REL_QuestCounter += 1;
};

INSTANCE Info_Mod_Elvira_Dorn (C_INFO)
{
	npc		= Mod_7499_KDF_Elvira_REL;
	nr		= 1;
	condition	= Info_Mod_Elvira_Dorn_Condition;
	information	= Info_Mod_Elvira_Dorn_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wir müssen reden ...";
};

FUNC INT Info_Mod_Elvira_Dorn_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Idrico_Dorn))
	&& (Mod_REL_IdricoDorn == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Elvira_Dorn_Info()
{
	AI_Output(hero, self, "Info_Mod_Elvira_Dorn_15_00"); //Wir müssen reden ...
	AI_Output(self, hero, "Info_Mod_Elvira_Dorn_17_01"); //Was gibt's denn?

	Info_ClearChoices	(Info_Mod_Elvira_Dorn);

	if (Npc_KnowsInfo(hero, Info_Mod_Elvira_DiebeKey2))
	{
		Info_AddChoice	(Info_Mod_Elvira_Dorn, "Wenn du nicht gehst, erzähl ich allen, was zwischen uns gelaufen ist.", Info_Mod_Elvira_Dorn_C);
	};
	Info_AddChoice	(Info_Mod_Elvira_Dorn, "Idrico will dich loswerden.", Info_Mod_Elvira_Dorn_B);
	Info_AddChoice	(Info_Mod_Elvira_Dorn, "Du musst die Stadt sofort verlassen.", Info_Mod_Elvira_Dorn_A);
};

FUNC VOID Info_Mod_Elvira_Dorn_C()
{
	AI_Output(hero, self, "Info_Mod_Elvira_Dorn_C_15_00"); //Wenn du nicht gehst, erzähl ich allen, was zwischen uns gelaufen ist.
	AI_Output(self, hero, "Info_Mod_Elvira_Dorn_C_17_01"); //Du verdammter Schuft ...
	AI_Output(self, hero, "Info_Mod_Elvira_Dorn_C_17_02"); //Dann habe ich wohl wirklich keine Wahl ... Hoffentlich bist du zufrieden mit dem, was du tust.

	Info_ClearChoices	(Info_Mod_Elvira_Dorn);

	Mod_REL_IdricoDorn = 2;

	B_LogEntry	(TOPIC_MOD_KHORATA_DORN, "Elvira wird die Stadt verlassen.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
};

FUNC VOID Info_Mod_Elvira_Dorn_B()
{
	AI_Output(hero, self, "Info_Mod_Elvira_Dorn_B_15_00"); //Idrico will dich loswerden.
	AI_Output(self, hero, "Info_Mod_Elvira_Dorn_B_17_01"); //Dieser Penner, der mich immer schief anschaut? Meinst du, er könnte unangenehm werden?
	AI_Output(hero, self, "Info_Mod_Elvira_Dorn_B_15_02"); //Sein Geruch ist es schon. Der Fanatismus ist stark in ihm.
	AI_Output(self, hero, "Info_Mod_Elvira_Dorn_B_17_03"); //Wir sollten ihm eine Maulsperre verpassen.
	AI_Output(self, hero, "Info_Mod_Elvira_Dorn_B_17_04"); //Meinst du, du bekommst es hin, Anselm auf unsere Seite zu ziehen, damit er den Kerl ruhig stellt?
	AI_Output(hero, self, "Info_Mod_Elvira_Dorn_B_15_05"); //Ich kann's versuchen.

	Info_ClearChoices	(Info_Mod_Elvira_Dorn);

	Mod_REL_IdricoDorn = 3;

	B_LogEntry	(TOPIC_MOD_KHORATA_DORN, "Ich glaube, dass Idricos Vorhaben falsch ist, und will Anselm davon überzeugen, dass er in die Schranken zu verweisen ist.");
};

FUNC VOID Info_Mod_Elvira_Dorn_A()
{
	AI_Output(hero, self, "Info_Mod_Elvira_Dorn_A_15_00"); //Du musst die Stadt sofort verlassen.
	AI_Output(self, hero, "Info_Mod_Elvira_Dorn_A_17_01"); //Meine Tagesplanung sah eigentlich etwas anders aus. Was ist denn los?
	AI_Output(hero, self, "Info_Mod_Elvira_Dorn_A_15_02"); //Du wirst hier nicht länger geduldet. Entweder gehst du freiwillig, oder ich helfe nach.
	AI_Output(self, hero, "Info_Mod_Elvira_Dorn_A_17_03"); //Hört sich an, als wäre es dir ernst. Ich bin gespannt, wie deine Hilfe aussieht.

	Info_ClearChoices	(Info_Mod_Elvira_Dorn);

	Mod_REL_IdricoDorn = 2;

	B_LogEntry	(TOPIC_MOD_KHORATA_DORN, "Elvira wollte die Stadt nicht kampflos verlassen und hat jetzt den Schaden. Idrico sollte trotzdem zufrieden sein.");

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_GuildEnemy, 0);
	B_Attack	(Mod_7425_KDF_Fuego_REL, hero, AR_GuildEnemy, 0);
};

INSTANCE Info_Mod_Elvira_Dorn2 (C_INFO)
{
	npc		= Mod_7499_KDF_Elvira_REL;
	nr		= 1;
	condition	= Info_Mod_Elvira_Dorn2_Condition;
	information	= Info_Mod_Elvira_Dorn2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Anselm fordert eine Tributzahlung von euch im Gegenzug für seine Hilfe.";
};

FUNC INT Info_Mod_Elvira_Dorn2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Elvira_Dorn))
	&& (Mod_REL_IdricoDorn == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Elvira_Dorn2_Info()
{
	AI_Output(hero, self, "Info_Mod_Elvira_Dorn2_15_00"); //Anselm fordert eine Tributzahlung von euch im Gegenzug für seine Hilfe.
	AI_Output(self, hero, "Info_Mod_Elvira_Dorn2_17_01"); //So ein Erpresser! Aber wenn es ihn zufriedenstellt ...
	AI_Output(self, hero, "Info_Mod_Elvira_Dorn2_17_02"); //Ist mir immer noch lieber als Ärger mit so einer Matschbirne.

	B_GiveInvItems	(self, hero, ItMi_Gold, 500);

	B_LogEntry	(TOPIC_MOD_KHORATA_DORN, "Ich habe das Gold der Feuermagier und sollte es nun bei Anselm abliefern.");
};

INSTANCE Info_Mod_Elvira_Dorn3 (C_INFO)
{
	npc		= Mod_7499_KDF_Elvira_REL;
	nr		= 1;
	condition	= Info_Mod_Elvira_Dorn3_Condition;
	information	= Info_Mod_Elvira_Dorn3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Elvira_Dorn3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Elvira_Dorn2))
	&& (Mod_REL_IdricoDorn == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Elvira_Dorn3_Info()
{
	AI_Output(self, hero, "Info_Mod_Elvira_Dorn3_17_01"); //Du hast Anselm nur 50 Goldmünzen angeboten? Mach, dass du wegkommst, Dieb!
};

INSTANCE Info_Mod_Elvira_Dorn4 (C_INFO)
{
	npc		= Mod_7499_KDF_Elvira_REL;
	nr		= 1;
	condition	= Info_Mod_Elvira_Dorn4_Condition;
	information	= Info_Mod_Elvira_Dorn4_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Angelegenheit um Idrico sollte bereinigt sein.";
};

FUNC INT Info_Mod_Elvira_Dorn4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Elvira_Dorn2))
	&& (Mod_REL_IdricoDorn == 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Elvira_Dorn4_Info()
{
	AI_Output(hero, self, "Info_Mod_Elvira_Dorn4_15_00"); //Die Angelegenheit um Idrico sollte bereinigt sein.
	AI_Output(self, hero, "Info_Mod_Elvira_Dorn4_17_01"); //Schön, dass man sich auf dich verlassen kann. Hier hast du eine kleine Entschädigung.

	B_GiveInvItems	(self, hero, ItMi_Gold, 50);

	B_GivePlayerXP	(100);

	B_Göttergefallen(1, 1);

	B_SetTopicStatus	(TOPIC_MOD_KHORATA_DORN, LOG_SUCCESS);

	CurrentNQ += 1;

	Mod_REL_QuestCounter += 1;
};

INSTANCE Info_Mod_Elvira_DiebeKey (C_INFO)
{
	npc		= Mod_7499_KDF_Elvira_REL;
	nr		= 1;
	condition	= Info_Mod_Elvira_DiebeKey_Condition;
	information	= Info_Mod_Elvira_DiebeKey_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Elvira_DiebeKey_Condition()
{
	if (Mod_Diebe_Elvira == 1)
	&& (Npc_RefuseTalk(self) == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Elvira_DiebeKey_Info()
{
	AI_Output(self, hero, "Info_Mod_Elvira_DiebeKey_17_00"); //Ohh, mir wird ganz anders. Alles so leicht und lustig es dreht sich.
	AI_Output(self, hero, "Info_Mod_Elvira_DiebeKey_17_01"); //Und vor mir ... ohh ... dieser stattliche Bursche.
	AI_Output(self, hero, "Info_Mod_Elvira_DiebeKey_17_02"); //Komm her, nicht so zögerlich, ich beiße auch nicht, es sei denn du willst ...

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Elvira_DiebeKey2 (C_INFO)
{
	npc		= Mod_7499_KDF_Elvira_REL;
	nr		= 1;
	condition	= Info_Mod_Elvira_DiebeKey2_Condition;
	information	= Info_Mod_Elvira_DiebeKey2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Elvira_DiebeKey2_Condition()
{
	if (Mod_Diebe_Elvira == 2)
	&& (Npc_RefuseTalk(self) == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Elvira_DiebeKey2_Info()
{
	AI_TurnAway	(hero, self);

	AI_Output(hero, self, "Info_Mod_Elvira_DiebeKey2_15_00"); //(zu sich selbst) Ihr den Schlüssel abzunehmen war ein Kinderspiel.

	AI_TurnToNpc	(hero, self);

	AI_Output(self, hero, "Info_Mod_Elvira_DiebeKey2_17_01"); //(verwirrt) Wie, was ist geschehen. Ich ... meine Robe.

	AI_EquipBestArmor	(self);

	AI_Output(self, hero, "Info_Mod_Elvira_DiebeKey2_17_02"); //Ohh, nein, was habe ich getan.
	AI_Output(self, hero, "Info_Mod_Elvira_DiebeKey2_17_03"); //Bei Innos. Ich habe mich aufs schwerste versündigt ... ich muss Buße tun.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "BUSSE");
};

INSTANCE Info_Mod_Elvira_DickeLuft (C_INFO)
{
	npc		= Mod_7499_KDF_Elvira_REL;
	nr		= 1;
	condition	= Info_Mod_Elvira_DickeLuft_Condition;
	information	= Info_Mod_Elvira_DickeLuft_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich würde mich gern in ein Schaf verwandeln.";
};

FUNC INT Info_Mod_Elvira_DickeLuft_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Irmgard_Kneipe))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Elvira_DickeLuft_Info()
{
	AI_Output(hero, self, "Info_Mod_Elvira_DickeLuft_15_00"); //Ich würde mich gern in ein Schaf verwandeln.
	AI_Output(self, hero, "Info_Mod_Elvira_DickeLuft_17_01"); //Das hättest du auch bitter nötig, wenn du bei den Frauen landen wolltest.
	AI_Output(self, hero, "Info_Mod_Elvira_DickeLuft_17_02"); //Mit so einer plumpen Anmache wird das jedenfalls nichts!
	AI_Output(hero, self, "Info_Mod_Elvira_DickeLuft_15_03"); //Du hast also keine entsprechende Spruchrolle?
	AI_Output(self, hero, "Info_Mod_Elvira_DickeLuft_17_04"); //Nein. Verwandlungen sind nicht mein Spezialgebiet.
};

INSTANCE Info_Mod_Elvira_Freudenspender (C_INFO)
{
	npc		= Mod_7499_KDF_Elvira_REL;
	nr		= 1;
	condition	= Info_Mod_Elvira_Freudenspender_Condition;
	information	= Info_Mod_Elvira_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Kannst du Freudenspender gebrauchen?";
};                       

FUNC INT Info_Mod_Elvira_Freudenspender_Condition()
{
	if (Npc_HasItems(hero, ItMi_Freudenspender) >= 1)
	&& (Mod_Freudenspender < 5)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Hi))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Elvira_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Elvira_Freudenspender_15_00"); //Kannst du Freudenspender gebrauchen?
	AI_Output(self, hero, "Info_Mod_Elvira_Freudenspender_17_01"); //Freudenspender verstößt gegen unseren Kodex. Also nein.
};

INSTANCE Info_Mod_Elvira_Pickpocket_Quest (C_INFO)
{
	npc		= Mod_7499_KDF_Elvira_REL;
	nr		= 1;
	condition	= Info_Mod_Elvira_Pickpocket_Quest_Condition;
	information	= Info_Mod_Elvira_Pickpocket_Quest_Info;
	permanent	= 1;
	important	= 0;
	description	= "(Es wäre fast unmöglich ihr den Schlüssel zu stehlen)";
};

FUNC INT Info_Mod_Elvira_Pickpocket_Quest_Condition()
{
	if (C_Beklauen(116, ItKe_RELMagier, 1))
	&& (Npc_HasItems(self, ItKe_RELMagier) == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Cassia_Elvira))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Elvira_Pickpocket_Quest_Info()
{
	Info_ClearChoices	(Info_Mod_Elvira_Pickpocket_Quest);

	Info_AddChoice	(Info_Mod_Elvira_Pickpocket_Quest, DIALOG_BACK, Info_Mod_Elvira_Pickpocket_Quest_BACK);
	Info_AddChoice	(Info_Mod_Elvira_Pickpocket_Quest, DIALOG_PICKPOCKET, Info_Mod_Elvira_Pickpocket_Quest_DoIt);
};

FUNC VOID Info_Mod_Elvira_Pickpocket_Quest_BACK()
{
	Info_ClearChoices	(Info_Mod_Elvira_Pickpocket_Quest);
};

FUNC VOID Info_Mod_Elvira_Pickpocket_Quest_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Elvira_Pickpocket_Quest);
};

INSTANCE Info_Mod_Elvira_Pickpocket (C_INFO)
{
	npc		= Mod_7499_KDF_Elvira_REL;
	nr		= 1;
	condition	= Info_Mod_Elvira_Pickpocket_Condition;
	information	= Info_Mod_Elvira_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_100_Female;
};

FUNC INT Info_Mod_Elvira_Pickpocket_Condition()
{
	C_Beklauen	(96, ItMi_Gold, 333);
};

FUNC VOID Info_Mod_Elvira_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Elvira_Pickpocket);

	Info_AddChoice	(Info_Mod_Elvira_Pickpocket, DIALOG_BACK, Info_Mod_Elvira_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Elvira_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Elvira_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Elvira_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Elvira_Pickpocket);
};

FUNC VOID Info_Mod_Elvira_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Elvira_Pickpocket);
};

INSTANCE Info_Mod_Elvira_EXIT (C_INFO)
{
	npc		= Mod_7499_KDF_Elvira_REL;
	nr		= 1;
	condition	= Info_Mod_Elvira_EXIT_Condition;
	information	= Info_Mod_Elvira_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Elvira_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Elvira_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};