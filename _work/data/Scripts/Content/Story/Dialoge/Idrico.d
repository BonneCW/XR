INSTANCE Info_Mod_Idrico_Hi (C_INFO)
{
	npc		= Mod_7498_WM_Idrico_REL;
	nr		= 1;
	condition	= Info_Mod_Idrico_Hi_Condition;
	information	= Info_Mod_Idrico_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Idrico_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Idrico_Hi_Info()
{
	B_Say	(hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Idrico_Hi_08_00"); //Ein untertäniger Diener Adanos', unseres geheiligten Herrn. Sprich, was willst du?
};

INSTANCE Info_Mod_Idrico_WasMachstDu (C_INFO)
{
	npc		= Mod_7498_WM_Idrico_REL;
	nr		= 1;
	condition	= Info_Mod_Idrico_WasMachstDu_Condition;
	information	= Info_Mod_Idrico_WasMachstDu_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was machst du den ganzen Tag über?";
};

FUNC INT Info_Mod_Idrico_WasMachstDu_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Idrico_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Idrico_WasMachstDu_Info()
{
	AI_Output(hero, self, "Info_Mod_Idrico_WasMachstDu_15_00"); //Was machst du den ganzen Tag über?
	AI_Output(self, hero, "Info_Mod_Idrico_WasMachstDu_08_01"); //Ich bin für die Leute da, stärke ihren Glauben und ihre Seelen.
	AI_Output(self, hero, "Info_Mod_Idrico_WasMachstDu_08_02"); //Im Gegenzug geben sie mir kleine Speisen oder ein paar Goldmünzen.
};

INSTANCE Info_Mod_Idrico_Ungepflegt (C_INFO)
{
	npc		= Mod_7498_WM_Idrico_REL;
	nr		= 1;
	condition	= Info_Mod_Idrico_Ungepflegt_Condition;
	information	= Info_Mod_Idrico_Ungepflegt_Info;
	permanent	= 0;
	important	= 0;
	description	= "Warum läufst du so ungepflegt herum?";
};

FUNC INT Info_Mod_Idrico_Ungepflegt_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Idrico_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Idrico_Ungepflegt_Info()
{
	AI_Output(hero, self, "Info_Mod_Idrico_Ungepflegt_15_00"); //Warum läufst du so ungepflegt herum?
	AI_Output(self, hero, "Info_Mod_Idrico_Ungepflegt_08_01"); //Adanos wünscht nicht, dass ich durch Wohlstand fett und faul werde wie die anderen Stadtmenschen.
	AI_Output(self, hero, "Info_Mod_Idrico_Ungepflegt_08_02"); //Es ist sein Wille, dass ich jederzeit empfänglich bin für seine Gnade.
};

INSTANCE Info_Mod_Idrico_Dorn (C_INFO)
{
	npc		= Mod_7498_WM_Idrico_REL;
	nr		= 1;
	condition	= Info_Mod_Idrico_Dorn_Condition;
	information	= Info_Mod_Idrico_Dorn_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kann ich Adanos meine Dienste erweisen?";
};

FUNC INT Info_Mod_Idrico_Dorn_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Idrico_Hi))
	&& (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Idrico_Dorn_Info()
{
	AI_Output(hero, self, "Info_Mod_Idrico_Dorn_15_00"); //Kann ich Adanos meine Dienste erweisen?
	AI_Output(self, hero, "Info_Mod_Idrico_Dorn_08_01"); //Oh ja! Es gibt da jemandem, der dem Herrn ein Dorn im Auge ist.
	AI_Output(self, hero, "Info_Mod_Idrico_Dorn_08_02"); //Elvira hat sich nicht nur den Lehren des scheinheiligen Innos verschrieben, nein, sie wagt es, als Frau in den Rang eines Feuermagiers zu treten!
	AI_Output(self, hero, "Info_Mod_Idrico_Dorn_08_03"); //Diese Unerhörtheit in einer Adanos geweihten Stadt darf nicht ungeahndet bleiben.
	AI_Output(self, hero, "Info_Mod_Idrico_Dorn_08_04"); //Wenn du an die Lehren unseres Schöpfers glaubst, so hilf mit, sie von diesem Ort zu vertreiben.

	Info_ClearChoices	(Info_Mod_Idrico_Dorn);

	Info_AddChoice	(Info_Mod_Idrico_Dorn, "Such dir jemand anderen für den Job.", Info_Mod_Idrico_Dorn_B);
	Info_AddChoice	(Info_Mod_Idrico_Dorn, "Ich werde sehen, was sich da machen lässt.", Info_Mod_Idrico_Dorn_A);
};

FUNC VOID Info_Mod_Idrico_Dorn_B()
{
	AI_Output(hero, self, "Info_Mod_Idrico_Dorn_B_15_00"); //Such dir jemand anderen für den Job.

	Info_ClearChoices	(Info_Mod_Idrico_Dorn);
};

FUNC VOID Info_Mod_Idrico_Dorn_A()
{
	AI_Output(hero, self, "Info_Mod_Idrico_Dorn_A_15_00"); //Ich werde sehen, was sich da machen lässt.

	Info_ClearChoices	(Info_Mod_Idrico_Dorn);

	Log_CreateTopic	(TOPIC_MOD_KHORATA_DORN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_KHORATA_DORN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_KHORATA_DORN, "Idrico, der Lumpenprediger Khoratas, wünscht, dass Elvira, die Feuermagierin, aus der Stadt verschwindet. Ich sollte sie darauf ansprechen.");

	Mod_REL_IdricoDorn = 1;
};

INSTANCE Info_Mod_Idrico_Dorn2 (C_INFO)
{
	npc		= Mod_7498_WM_Idrico_REL;
	nr		= 1;
	condition	= Info_Mod_Idrico_Dorn2_Condition;
	information	= Info_Mod_Idrico_Dorn2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Elvira braucht dir keine Sorgen mehr zu bereiten.";
};

FUNC INT Info_Mod_Idrico_Dorn2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Elvira_Dorn))
	&& (Mod_REL_IdricoDorn == 2)
	&& (Npc_IsDead(Mod_7499_KDF_Elvira_REL))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Idrico_Dorn2_Info()
{
	AI_Output(hero, self, "Info_Mod_Idrico_Dorn2_15_00"); //Elvira braucht dir keine Sorgen mehr zu bereiten.
	AI_Output(self, hero, "Info_Mod_Idrico_Dorn2_08_01"); //Du bist ein vielversprechender Schüler. Nimm dies und lerne!

	B_GiveInvItems	(self, hero, ItSc_Geyser, 1);

	B_GivePlayerXP	(50);

	B_SetTopicStatus	(TOPIC_MOD_KHORATA_DORN, LOG_SUCCESS);

	CurrentNQ += 1;

	Mod_REL_QuestCounter += 1;

	B_Göttergefallen(2, 1);
};

INSTANCE Info_Mod_Idrico_Dorn3 (C_INFO)
{
	npc		= Mod_7498_WM_Idrico_REL;
	nr		= 1;
	condition	= Info_Mod_Idrico_Dorn3_Condition;
	information	= Info_Mod_Idrico_Dorn3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Idrico_Dorn3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Elvira_Dorn4))
	&& (Mod_REL_IdricoDorn == 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Idrico_Dorn3_Info()
{
	AI_Output(self, hero, "Info_Mod_Idrico_Dorn3_08_00"); //(zischt) Verschwinde, Unwürdiger. Adanos wird dich für deinen Frevel bestrafen!
};

INSTANCE Info_Mod_Idrico_BrokenRune (C_INFO)
{
	npc		= Mod_7498_WM_Idrico_REL;
	nr		= 1;
	condition	= Info_Mod_Idrico_BrokenRune_Condition;
	information	= Info_Mod_Idrico_BrokenRune_Info;
	permanent	= 0;
	important	= 0;
	description	= "Adanos zum Gruße.";
};

FUNC INT Info_Mod_Idrico_BrokenRune_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Daniel_BrokenRune))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Idrico_BrokenRune_Info()
{
	AI_Output(hero, self, "Info_Mod_Idrico_BrokenRune_15_00"); //Adanos zum Gruße.
	AI_Output(self, hero, "Info_Mod_Idrico_BrokenRune_08_01"); //Auf das Gleichgewicht.
	AI_Output(hero, self, "Info_Mod_Idrico_BrokenRune_15_02"); //Was verschlägt dich in diesen Verschlag?
	AI_Output(self, hero, "Info_Mod_Idrico_BrokenRune_08_03"); //Das ist eine lange Geschichte. Damals, als die Barriere fiel ...
	AI_Output(hero, self, "Info_Mod_Idrico_BrokenRune_15_04"); //Du warst im Minental?
	AI_Output(self, hero, "Info_Mod_Idrico_BrokenRune_08_05"); //Freilich ... als die Barriere fiel und das ganze Erz unbrauchbar wurde, zog Saturas mit den anderen Brüdern nach Khorinis.
	AI_Output(self, hero, "Info_Mod_Idrico_BrokenRune_08_06"); //Ich jedoch war der Meinung es wäre besser, nach Relendel zu gehen und diesem doch recht neuen Landstrich unsere Heilslehre zu bringen.
	AI_Output(self, hero, "Info_Mod_Idrico_BrokenRune_08_07"); //Dabei verwarf ich mich mit Saturas, ich zog allein hierher.
	AI_Output(hero, self, "Info_Mod_Idrico_BrokenRune_15_08"); //Aber du bist nicht sehr erfolgreich mit eurer Lehre, sehe ich ...
	AI_Output(self, hero, "Info_Mod_Idrico_BrokenRune_08_09"); //Wohl war! Die Leute hier haben es nicht so mit Magiern.
	AI_Output(self, hero, "Info_Mod_Idrico_BrokenRune_08_10"); //Fuego, ein Feuermagier, der auch hier lebt, kann dir das bestätigen.
	AI_Output(self, hero, "Info_Mod_Idrico_BrokenRune_08_11"); //Doch sag, was führt dich zu mir?
	AI_Output(hero, self, "Info_Mod_Idrico_BrokenRune_15_12"); //Ich hab hier eine kaputte Rune und möchte dich fragen, ob du die wieder zusammenfügen kannst.
	AI_Output(self, hero, "Info_Mod_Idrico_BrokenRune_08_13"); //Ich habe alle Weihen unseres Standes erhalten. Wenn ich einen Runentisch hätte, wäre es wohl kein Problem für mich. Aber so ...
	AI_Output(hero, self, "Info_Mod_Idrico_BrokenRune_15_14"); //Und eine andere Magie?
	AI_Output(self, hero, "Info_Mod_Idrico_BrokenRune_08_15"); //Hmm. Ich hatte mal eine Adanosfigur. Sehr starke Magie war in ihr.
	AI_Output(self, hero, "Info_Mod_Idrico_BrokenRune_08_16"); //Aber ich musste sie verkaufen, um meinen Mahlzeiten zu zahlen.
	AI_Output(hero, self, "Info_Mod_Idrico_BrokenRune_15_17"); //Wem hast du sie verkauft? Ich hole sie zurück. Hab genug Gold.
	AI_Output(self, hero, "Info_Mod_Idrico_BrokenRune_08_18"); //Am Marktplatz ist ein Händler, der allerlei Magisches verkauft. Ihm hab ich die Figur gegeben.
	AI_Output(hero, self, "Info_Mod_Idrico_BrokenRune_15_19"); //Da lauf ich doch gleich los und  schau, ob er sie noch hat.
	AI_Output(self, hero, "Info_Mod_Idrico_BrokenRune_08_20"); //Tu das, Bruder. Der Mann heißt Daniel. Ich wünsche dir Erfolg.

	B_LogEntry	(TOPIC_MOD_JG_RUNENZAUBER, "Der Magier Idrico meint, eine Adanosfigur wäre hilfreich, die Rune zu reparieren. Der Händler Daniel vom Marktplatz könnte eine haben.");
};

INSTANCE Info_Mod_Idrico_BrokenRune2 (C_INFO)
{
	npc		= Mod_7498_WM_Idrico_REL;
	nr		= 1;
	condition	= Info_Mod_Idrico_BrokenRune2_Condition;
	information	= Info_Mod_Idrico_BrokenRune2_Info;
	permanent	= 0;
	important	= 0;
	description	= "So, ich habe die Figur.";
};

FUNC INT Info_Mod_Idrico_BrokenRune2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Daniel_BrokenRune2))
	&& (Npc_HasItems(hero, ItMi_AdanosStatue) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Idrico_BrokenRune2_Info()
{
	AI_Output(hero, self, "Info_Mod_Idrico_BrokenRune2_15_00"); //So, ich habe die Figur.

	B_GiveInvItems	(hero, self, ItMi_AdanosStatue, 1);

	AI_Output(self, hero, "Info_Mod_Idrico_BrokenRune2_08_01"); //Zeig her! Ja, das ist sie, meine Figur. Hoffe, dass sie keinen Schaden nimmt bei dem Prozess.
	AI_Output(hero, self, "Info_Mod_Idrico_BrokenRune2_15_02"); //Was wirst du tun?
	AI_Output(self, hero, "Info_Mod_Idrico_BrokenRune2_08_03"); //Zuerst streiche ich die Bruchstellen mit einer Heilsalbe ein, füge die Rune zusammen. Dann lege ich die Figur drauf.
	AI_Output(self, hero, "Info_Mod_Idrico_BrokenRune2_08_04"); //Dann sollte die Kraft der Figur und die Magie der beiden Runenstücke verschmelzen und den Bruch heilen.
	AI_Output(hero, self, "Info_Mod_Idrico_BrokenRune2_15_05"); //Und wie lange dauert das?
	AI_Output(self, hero, "Info_Mod_Idrico_BrokenRune2_08_06"); //Ich weiß nicht. Vielleicht eine Nacht, vielleicht zwei Tage. Keine Ahnung.
	AI_Output(self, hero, "Info_Mod_Idrico_BrokenRune2_08_07"); //Du hast sicher noch zu tun. Komm morgen wieder ...

	B_LogEntry	(TOPIC_MOD_JG_RUNENZAUBER, "Hier heißt es wieder warten, wann und ob die Rune repariert werden kann. Soll morgen wieder zum Wassermagier kommen.");

	Mod_JG_Idrico = Wld_GetDay();

	Npc_RemoveInvItems	(hero, ItMi_Brokenrune01, 1);
	Npc_RemoveInvItems	(hero, ItMi_Brokenrune02, 1);
};

INSTANCE Info_Mod_Idrico_BrokenRune3 (C_INFO)
{
	npc		= Mod_7498_WM_Idrico_REL;
	nr		= 1;
	condition	= Info_Mod_Idrico_BrokenRune3_Condition;
	information	= Info_Mod_Idrico_BrokenRune3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Adanos zum Gruß!";
};

FUNC INT Info_Mod_Idrico_BrokenRune3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Idrico_BrokenRune2))
	&& (Wld_GetDay() > Mod_JG_Idrico)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Idrico_BrokenRune3_Info()
{
	AI_Output(hero, self, "Info_Mod_Idrico_BrokenRune3_15_00"); //Adanos zum Gruß!
	AI_Output(self, hero, "Info_Mod_Idrico_BrokenRune3_08_01"); //Auf das Gleichgewicht. Seltsames ist geschehen.
	AI_Output(hero, self, "Info_Mod_Idrico_BrokenRune3_15_02"); //Erzähl. Ist die Rune ganz?
	AI_Output(self, hero, "Info_Mod_Idrico_BrokenRune3_08_03"); //Das wohl. Aber die ganze Zeit lag ein leichter silberner Schimmer über den Teilen.

	B_GiveInvItems	(self, hero, ItRu_BrokenRune, 1);

	AI_Output(hero, self, "Info_Mod_Idrico_BrokenRune3_15_04"); //Und nun scheint sie ganz aus Silber zu sein, wie ich sehe.
	AI_Output(self, hero, "Info_Mod_Idrico_BrokenRune3_08_05"); //Genau. Und ich bezweifle sehr, daß ihr eine Teleportation nach Khorinis innewohnt.
	AI_Output(hero, self, "Info_Mod_Idrico_BrokenRune3_15_06"); //Hmm ... aber irgendwie muss ich es rausfinden.
	AI_Output(self, hero, "Info_Mod_Idrico_BrokenRune3_08_07"); //Und keiner wird dir das abnehmen können.
	AI_Output(hero, self, "Info_Mod_Idrico_BrokenRune3_15_08"); //Frisch gewagt, ist halb gewonnen. Hat mal jemand gesagt.
	AI_Output(self, hero, "Info_Mod_Idrico_BrokenRune3_08_09"); //Adanos auf all deinen Wegen!

	B_LogEntry	(TOPIC_MOD_JG_RUNENZAUBER, "Die Rune ist intakt, aber silbern geworden. Und keiner weiß, was in ihr steckt. 'Probieren geht über studieren'. Mal etwas auf die Seite gehen.");

	B_GivePlayerXP	(250);
};

INSTANCE Info_Mod_Idrico_Blutkelch (C_INFO)
{
	npc		= Mod_7498_WM_Idrico_REL;
	nr		= 1;
	condition	= Info_Mod_Idrico_Blutkelch_Condition;
	information	= Info_Mod_Idrico_Blutkelch_Info;
	permanent	= 0;
	important	= 0;
	description	= "He.";
};

FUNC INT Info_Mod_Idrico_Blutkelch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Morpheus_Blutkelch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Idrico_Blutkelch_Info()
{
	AI_Output(hero, self, "Info_Mod_Idrico_Blutkelch_15_00"); //He.
	AI_Output(self, hero, "Info_Mod_Idrico_Blutkelch_08_01"); //Verschwinde, Unwürdiger. Adanos wird dich für deinen Frevel strafen.
	AI_Output(hero, self, "Info_Mod_Idrico_Blutkelch_15_02"); //Bleib kühl, Mann. Ich frevle fast nie und hab nur eine Frage.
	AI_Output(self, hero, "Info_Mod_Idrico_Blutkelch_08_03"); //Die Sündigen werden büßen. Eine riesige Welle wird ...
	AI_Output(self, hero, "Info_Mod_Idrico_Blutkelch_08_04"); //Was willst du wissen? Für eine kleine Spende an den Diener Adanos?

	Info_ClearChoices	(Info_Mod_Idrico_Blutkelch);

	Info_AddChoice	(Info_Mod_Idrico_Blutkelch, "Sind 10 Gold genug?", Info_Mod_Idrico_Blutkelch_B);
	Info_AddChoice	(Info_Mod_Idrico_Blutkelch, "Keine Spende.", Info_Mod_Idrico_Blutkelch_A);
};

FUNC VOID Info_Mod_Idrico_Blutkelch_B()
{
	AI_Output(hero, self, "Info_Mod_Idrico_Blutkelch_B_15_00"); //Sind 10 Gold genug?
	AI_Output(self, hero, "Info_Mod_Idrico_Blutkelch_B_08_01"); //20 wären besser. Und ein Stück Gepökeltes vom Metzger. Weil, die Askese trübt das Gedächtnis ...

	Mod_ASS_IdricoSpende = 1;

	Info_ClearChoices	(Info_Mod_Idrico_Blutkelch);
};

FUNC VOID Info_Mod_Idrico_Blutkelch_A()
{
	AI_Output(hero, self, "Info_Mod_Idrico_Blutkelch_A_15_00"); //Keine Spende.
	AI_Output(self, hero, "Info_Mod_Idrico_Blutkelch_A_08_01"); //Dann verschwinde!

	Info_ClearChoices	(Info_Mod_Idrico_Blutkelch);
};

INSTANCE Info_Mod_Idrico_Blutkelch2 (C_INFO)
{
	npc		= Mod_7498_WM_Idrico_REL;
	nr		= 1;
	condition	= Info_Mod_Idrico_Blutkelch2_Condition;
	information	= Info_Mod_Idrico_Blutkelch2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier, eine Lammkeule.";
};

FUNC INT Info_Mod_Idrico_Blutkelch2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Idrico_Blutkelch))
	&& (Mod_ASS_IdricoSpende == 1)
	&& (Npc_HasItems(hero, ItFo_LammPoekelFleisch) >= 1)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 20)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Idrico_Blutkelch2_Info()
{
	AI_Output(hero, self, "Info_Mod_Idrico_Blutkelch2_15_00"); //Hier, eine Lammkeule.

	Npc_RemoveInvItems	(hero, ItFo_LammPoekelFleisch, 1);
	Npc_RemoveInvItems	(hero, ItMi_Gold, 20);

	B_ShowGivenThings	("20 Gold und gepökeltes Lammfleisch gegeben");

	AI_Output(self, hero, "Info_Mod_Idrico_Blutkelch2_08_01"); //Adanos und dir sei Dank! Was wolltest du nochmal wissen?
	AI_Output(hero, self, "Info_Mod_Idrico_Blutkelch2_15_02"); //Ob du etwas weißt über einen Blutkelch.
	AI_Output(self, hero, "Info_Mod_Idrico_Blutkelch2_08_03"); //Aha, was Heiliges. Aber nein. Mir ist nichts bekannt. Tut mir leid.
	AI_Output(hero, self, "Info_Mod_Idrico_Blutkelch2_15_04"); //Und mir um die Keule, alter Gauner.
	AI_Output(self, hero, "Info_Mod_Idrico_Blutkelch2_08_05"); //Adanos wird dich dafür segnen.
};

INSTANCE Info_Mod_Idrico_Pickpocket (C_INFO)
{
	npc		= Mod_7498_WM_Idrico_REL;
	nr		= 1;
	condition	= Info_Mod_Idrico_Pickpocket_Condition;
	information	= Info_Mod_Idrico_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Idrico_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Idrico_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Idrico_Pickpocket);

	Info_AddChoice	(Info_Mod_Idrico_Pickpocket, DIALOG_BACK, Info_Mod_Idrico_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Idrico_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Idrico_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Idrico_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Idrico_Pickpocket);
};

FUNC VOID Info_Mod_Idrico_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Idrico_Pickpocket);
};

INSTANCE Info_Mod_Idrico_EXIT (C_INFO)
{
	npc		= Mod_7498_WM_Idrico_REL;
	nr		= 1;
	condition	= Info_Mod_Idrico_EXIT_Condition;
	information	= Info_Mod_Idrico_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Idrico_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Idrico_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};