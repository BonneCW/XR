INSTANCE Info_Mod_Marduk_Hi (C_INFO)
{
	npc		= Mod_921_KDF_Marduk_NW;
	nr		= 1;
	condition	= Info_Mod_Marduk_Hi_Condition;
	information	= Info_Mod_Marduk_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hi.";
};

FUNC INT Info_Mod_Marduk_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Marduk_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Marduk_Hi_15_00"); //Hi.
	AI_Output(self, hero, "Info_Mod_Marduk_Hi_05_01"); //Sei mir gegrüßt, Fremder. Was kann ich für dich tun?
};

INSTANCE Info_Mod_Marduk_Aufgabe (C_INFO)
{
	npc		= Mod_921_KDF_Marduk_NW;
	nr		= 1;
	condition	= Info_Mod_Marduk_Aufgabe_Condition;
	information	= Info_Mod_Marduk_Aufgabe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich möchte Novize werden und wollte dich daher um eine Aufgabe bitten.";
};

FUNC INT Info_Mod_Marduk_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Marduk_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Pyrokar_Mitglied))
	&& (Mod_Gilde	==	0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Marduk_Aufgabe_Info()
{
	AI_Output(hero, self, "Info_Mod_Marduk_Aufgabe_15_00"); //Ich möchte Novize werden und wollte dich daher um eine Aufgabe bitten.
	AI_Output(self, hero, "Info_Mod_Marduk_Aufgabe_05_01"); //So, eine Aufgabe. Ein Diener Innos zu sein, ist aber nicht nur eine Aufgabe, sondern eine Berufung.
	AI_Output(self, hero, "Info_Mod_Marduk_Aufgabe_05_02"); //Wenn du einige Wochen lang fleißig bei den Alltagsarbeiten im Kloster geholfen und eifrig zu Innos gebetet hast, wirst du mich von der Ernsthaftigkeit deines Wunsches überzeugt haben.
	AI_Output(hero, self, "Info_Mod_Marduk_Aufgabe_15_03"); //Aber das dauert ja ewig. Gibt es keinen schnelleren Weg?
	AI_Output(self, hero, "Info_Mod_Marduk_Aufgabe_05_04"); //(spöttisch) So, tatsächlich, es wäre dir zu anstrengend und zeitraubend?
	AI_Output(self, hero, "Info_Mod_Marduk_Aufgabe_05_05"); //Wenn du zu gut für die Aufgaben eines Novizen bist, wirst du wohl eher den Fähigkeiten eines Feuermagiers gerecht, oder?
	AI_Output(self, hero, "Info_Mod_Marduk_Aufgabe_05_06"); //Dann bring mir doch ... eine Feuerballrune. Damit wäre ich von deinem fortgeschrittenen Können überzeugt.
	AI_Output(self, hero, "Info_Mod_Marduk_Aufgabe_05_07"); // (zu sich selbst, kopfschüttelnd) Tse, da hör sich das mal einer an ... so viel Unverfrorenheit.

	Log_CreateTopic	(TOPIC_MOD_MARDUK_FEUERBALL, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_MARDUK_FEUERBALL, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_MARDUK_FEUERBALL, "Ich habe Marduk nach einer Aufgabe gefragt, woraufhin er mir wochenlanges Arbeiten und Beten im Kloster auftrug. Auf meine Frage hin, ob es einen schnelleren Weg gäbe reagierte er etwas gereizt und Trug mir auf, ihm eine Feuerballrune zu besorgen. Ich glaube nicht, dass ich ohne weiteres selbst eine herstellen kann. Vielleicht könnte ich mir ja Hilfe bei jemandem holen ...");
};

INSTANCE Info_Mod_Marduk_FeuerballRune (C_INFO)
{
	npc		= Mod_921_KDF_Marduk_NW;
	nr		= 1;
	condition	= Info_Mod_Marduk_FeuerballRune_Condition;
	information	= Info_Mod_Marduk_FeuerballRune_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Marduk_FeuerballRune_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Marduk_Aufgabe))
	&& (Npc_HasItems(hero, ItRu_InstantFireball) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Marduk_FeuerballRune_Info()
{
	AI_Output(self, hero, "Info_Mod_Marduk_FeuerballRune_05_00"); //(abweisend) Was willst du? Solltest du nicht lieber Trauben ernten, oder vor dem Altar knien und beten?
	AI_Output(hero, self, "Info_Mod_Marduk_FeuerballRune_15_01"); //Nein ... ich wollte dir stattdessen lieber mein fortgeschrittenes Werk bringen, Meister.

	B_GiveInvItems	(hero, self, ItRu_InstantFireball, 1);

	AI_Output(self, hero, "Info_Mod_Marduk_FeuerballRune_05_02"); //(entsetzt) Was?! Das ... das ist nicht möglich. Das muss eine Fälschung sein.
	AI_Output(self, hero, "Info_Mod_Marduk_FeuerballRune_05_03"); //(drohend) Wehe dir, wenn du mich zum Narren halten willst.
	AI_Output(hero, self, "Info_Mod_Marduk_FeuerballRune_15_04"); //Nein, die Rune ist von begabter Hand gefertigt ... und nun in deinem Besitz, wie von dir verlangt.
	AI_Output(self, hero, "Info_Mod_Marduk_FeuerballRune_05_05"); //(ungläubig) Aber alleine hättest du das niemals schaffen können ... nicht mal mit Hilfe eines Novizen ...
	AI_Output(self, hero, "Info_Mod_Marduk_FeuerballRune_05_06"); //(überlegt) Augenblick mal ... (ernst feststellend) Hmm, in Ordnung, ich will gar nicht fragen, wer dir dabei geholfen hat.
	AI_Output(self, hero, "Info_Mod_Marduk_FeuerballRune_05_07"); //Du hast deine Aufgabe ja in der Tat erfüllt, wie ich – wenn auch nur widerwillig - zugeben muss.
	AI_Output(self, hero, "Info_Mod_Marduk_FeuerballRune_05_08"); //Und da du es scheinbar geschafft hast einen der anderen der Magier gänzlich von dir zu überzeugen, werde ich mich umso weniger gegen deine Aufnahme sträuben.
	AI_Output(self, hero, "Info_Mod_Marduk_FeuerballRune_05_09"); //(nachsichtiger) So gehe den mit Innos Segen und meiner Zustimmung.

	B_LogEntry_More	(TOPIC_MOD_FEUERMAGIER, TOPIC_MOD_MARDUK_FEUERBALL, "Ich habe Marduk geholfen.", "Ich habe Marduk die Rune gebracht.");

	B_SetTopicStatus	(TOPIC_MOD_MARDUk_FEUERBALL, LOG_SUCCESS);

	B_GivePlayerXP	(150);

	B_Göttergefallen(1, 1);

	B_StartOtherRoutine	(Mod_534_KDF_Milten_NW, "MARDUK");
};

INSTANCE Info_Mod_Marduk_Nachtschicht (C_INFO)
{
	npc		= Mod_921_KDF_Marduk_NW;
	nr		= 1;
	condition	= Info_Mod_Marduk_Nachtschicht_Condition;
	information	= Info_Mod_Marduk_Nachtschicht_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Marduk_Nachtschicht_Condition()
{
	if (hero.guild == GIL_VLK)
	&& (Mod_Gilde == 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Marduk_Nachtschicht_Info()
{
	AI_Output(self, hero, "Info_Mod_Marduk_Nachtschicht_05_00"); //So, jetzt bist du also tatsächlich Novize ... und so sollst du auch die Aufgaben eines Novizen erfüllen.
	AI_Output(hero, self, "Info_Mod_Marduk_Nachtschicht_15_01"); //Was gibt es zu tun?
	AI_Output(self, hero, "Info_Mod_Marduk_Nachtschicht_05_02"); //Dieses Jahr haben wir eine besonders gute Traubenernte ... unsere Novizen kommen kaum damit nach, die ganzen Trauben zu keltern.
	AI_Output(self, hero, "Info_Mod_Marduk_Nachtschicht_05_03"); //Wenn die anderen Novizen also zur Nachtruhe gegangen sind, kannst du zumindest zwei Stunden an ihrer statt weiterstampfen.
	AI_Output(self, hero, "Info_Mod_Marduk_Nachtschicht_05_04"); //Deine Arme sind ausgeruht und kräftig, sodass das reichen sollte, um den Rückstand aufzuholen ...
	AI_Output(hero, self, "Info_Mod_Marduk_Nachtschicht_15_05"); //Gibt es noch was?
	AI_Output(self, hero, "Info_Mod_Marduk_Nachtschicht_05_06"); //Ja. Wie du wahrscheinlich mitbekommen hast, haben sich in letzter Zeit beunruhigende Dinge außerhalb der Klostermauern begeben.
	AI_Output(self, hero, "Info_Mod_Marduk_Nachtschicht_05_07"); //Die genauen Urheber sind uns nicht bekannt, aber es handelt sich zweifelsfrei um finstere, dämonische Mächte, die vor allem Nachts erstarken, wenn Innos’ Strahlen nicht die Welt erleuchtet.
	AI_Output(self, hero, "Info_Mod_Marduk_Nachtschicht_05_08"); //Ich möchte also, dass du zumindest eine Woche lang täglich zur Mitternachtszeit an unserem Innosschrein betest.
	AI_Output(self, hero, "Info_Mod_Marduk_Nachtschicht_05_09"); //Seine Präsenz möge uns auch dann vor Übel bewahre und finstere Blicke vom Kloster ablenken, wenn sein Gestirn nicht am Himmel steht.

	Log_CreateTopic	(TOPIC_MOD_MARDUK_NACHTSCHICHT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_MARDUK_NACHTSCHICHT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_MARDUK_NACHTSCHICHT, "Marduk hat mir aufgetragen zwei Stunden lang Trauben zu stampfen, wenn die anderen Novizen zu Bett gegangen sind. Außerdem soll ich eine Woche lang zur Mitternachtszeit im Kloster zu Innos beten.");
};

INSTANCE Info_Mod_Marduk_Nachtschicht2 (C_INFO)
{
	npc		= Mod_921_KDF_Marduk_NW;
	nr		= 1;
	condition	= Info_Mod_Marduk_Nachtschicht2_Condition;
	information	= Info_Mod_Marduk_Nachtschicht2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe getan, wie du mir aufgetragen hattest.";
};

FUNC INT Info_Mod_Marduk_Nachtschicht2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Marduk_Nachtschicht))
	&& (Mod_Marduk_Gestampft == TRUE)
	&& (Mod_Marduk_Gebetet == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Marduk_Nachtschicht2_Info()
{
	AI_Output(hero, self, "Info_Mod_Marduk_Nachtschicht2_15_00"); //Ich habe getan, wie du mir aufgetragen hattest.
	AI_Output(self, hero, "Info_Mod_Marduk_Nachtschicht2_05_01"); //Daran hast du gut getan, Novize. Du hast Ausdauer bewiesen sollst zur Belohnung auch deine Rune wiederbekommen. Nutze sie nach Innos’ Willen.

	B_GiveInvItems	(self, hero, ItRu_InstantFireball, 1);

	B_SetTopicStatus	(TOPIC_MOD_MARDUK_NACHTSCHICHT, LOG_SUCCESS);

	B_GivePlayerXP	(250);
};

INSTANCE Info_Mod_Marduk_Innosklinge (C_INFO)
{
	npc		= Mod_921_KDF_Marduk_NW;
	nr		= 1;
	condition	= Info_Mod_Marduk_Innosklinge_Condition;
	information	= Info_Mod_Marduk_Innosklinge_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ehrwürdiger Magier, ich möchte mein Schwert weihen lassen.";
};

FUNC INT Info_Mod_Marduk_Innosklinge_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Harad_AndreVermaechtnis3))
	&& (Mod_AndreSchwert_Test == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Marduk_Innosklinge_Info()
{
	AI_Output(hero, self, "Info_Mod_Marduk_Innosklinge_15_00"); //Ehrwürdiger Magier, ich möchte mein Schwert weihen lassen.

	if (Mod_Gilde == 2)
	{
		AI_Output(self, hero, "Info_Mod_Marduk_Innosklinge_05_01"); //Die heilige Weihe steht alleine einem Paladin und streiter Innos offen.
		AI_Output(self, hero, "Info_Mod_Marduk_Innosklinge_05_02"); //Und ich kann nicht erkennen, dass du einer seist.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Marduk_Innosklinge_05_03"); //Um die Weihe zu erhalten, musst du die Prüfungen des Feuers bestehen.
		AI_Output(self, hero, "Info_Mod_Marduk_Innosklinge_05_04"); //Begib dich in den Keller des Klosters. Du erreichst ihn über die Bibliothek.
		AI_Output(self, hero, "Info_Mod_Marduk_Innosklinge_05_05"); //Dort findest du einen Teleport, welcher dich in die Kammern der Prüfungen bringen wird.

		B_LogEntry	(TOPIC_MOD_MILIZ_INNOSKLINGE, "Um das Schwert zu weihen muss ich die Prüfungen des Feuers bestehen. Dazu soll ich in den Keller des Kloster gehen, welchen ich über die Bibliothek erreiche.");

		Mod_AndreSchwert_Test = 1;
	};
};

INSTANCE Info_Mod_Marduk_Kreis1	(C_INFO)
{
	npc		= Mod_921_KDF_Marduk_NW;
	nr		= 1;
	condition	= Info_Mod_Marduk_Kreis1_Condition;
	information	= Info_Mod_Marduk_Kreis1_Info;
	permanent	= 1;
	important	= 0;
	description	= "Lehre mich den ersten Kreis der Magie.";
};
FUNC INT Info_Mod_Marduk_Kreis1_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Mod_Marduk_Hi))
	&& ((Mod_Gilde == 6)
	|| (Mod_Gilde == 7)
	|| (Mod_Gilde == 8))
	&& (Mod_MagieKreis == 0)
	{
		return 1;
	};
};
FUNC VOID Info_Mod_Marduk_Kreis1_Info ()
{
	AI_Output (hero, self, "Info_Mod_Marduk_Kreis1_15_00"); //Lehre mich den ersten Kreis der Magie.
	
	if B_TeachMagicCircle (self, hero, 1)
	{
		AI_Output (self, hero, "Info_Mod_Marduk_Kreis1_05_01"); //Der erste Kreis erlaubt es dir, Runen, die du erschaffen hast, anzuwenden.
		AI_Output (self, hero, "Info_Mod_Marduk_Kreis1_05_02"); //Du kannst jetzt die Formeln der Zaubersprüche lernen, um deine eigenen Runen herzustellen.

		Mod_MagieKreis = 1;
	};
};	
///////////////////////////////////////////////////////////////////////
//	Info TECH_CIRCLE_02
///////////////////////////////////////////////////////////////////////
INSTANCE Info_Mod_Marduk_Kreis2		(C_INFO)
{
	npc		= Mod_921_KDF_Marduk_NW;
	nr		= 1;
	condition	= Info_Mod_Marduk_Kreis2_Condition;
	information	= Info_Mod_Marduk_Kreis2_Info;
	permanent	= 1;
	important	= 0;
	description	= "Lehre mich den zweiten Kreis der Magie.";
};
FUNC INT Info_Mod_Marduk_Kreis2_Condition ()
{	
	if ((Mod_Gilde == 6)
	|| (Mod_Gilde == 7)
	|| (Mod_Gilde == 8))
	&& (Mod_MagieKreis == 1)
	{
		return 1;
	};
};
FUNC VOID Info_Mod_Marduk_Kreis2_Info ()
{
	AI_Output (hero, self, "Info_Mod_Marduk_Kreis2_15_00"); //Lehre mich den zweiten Kreis der Magie.
	
	if (Kapitel >= 1)
	{
		if B_TeachMagicCircle (self, hero, 2)
		{
			AI_Output (self, hero, "Info_Mod_Marduk_Kreis2_05_01"); //Tritt nun in den zweiten Kreis und lerne, noch mächtigere Zauber zu wirken.

			Mod_MagieKreis = 2;
		};
	}
	else
	{
		AI_Output (self, hero, "Info_Mod_Marduk_Kreis2_05_02"); //Die Zeit ist noch nicht gekommen.
	};
};	
///////////////////////////////////////////////////////////////////////
//	Info TECH_CIRCLE_03
///////////////////////////////////////////////////////////////////////
INSTANCE Info_Mod_Marduk_Kreis3		(C_INFO)
{
	npc		= Mod_921_KDF_Marduk_NW;
	nr		= 1;
	condition	= Info_Mod_Marduk_Kreis3_Condition;
	information	= Info_Mod_Marduk_Kreis3_Info;
	permanent	= 1;
	important	= 0;
	description	= "Lehre mich den dritten Kreis der Magie.";
};
FUNC INT Info_Mod_Marduk_Kreis3_Condition ()
{	
	if ((Mod_Gilde == 7)
	|| (Mod_Gilde == 8))
	&& (Mod_MagieKreis == 2)
	{
		return 1;
	};
};
FUNC VOID Info_Mod_Marduk_Kreis3_Info ()
{
	AI_Output (hero, self, "Info_Mod_Marduk_Kreis3_15_00"); //Lehre mich den dritten Kreis der Magie.
	
	if (Kapitel >= 2)
	{
		if B_TeachMagicCircle (self, hero, 3)
		{
			AI_Output (self, hero, "Info_Mod_Marduk_Kreis3_05_01"); //Ja, die Zeit ist gekommen. Tritt ein in den dritten Kreis der Magie. Neue Zauber erwarten dich.

			Mod_MagieKreis = 3;
		};
	}
	else
	{
		AI_Output (self, hero, "Info_Mod_Marduk_Kreis3_05_02"); //Es ist noch nicht an der Zeit für dich, den dritten Kreis zu lernen.
	};
};		

INSTANCE Info_Mod_Marduk_Kreis4 (C_INFO)
{
	npc		= Mod_921_KDF_Marduk_NW;
	nr		= 1;
	condition	= Info_Mod_Marduk_Kreis4_Condition;
	information	= Info_Mod_Marduk_Kreis4_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will den vierten Kreis der Magie lernen.";
};

FUNC INT Info_Mod_Marduk_Kreis4_Condition()
{	
	if (Mod_MagieKreis == 3)
	&& ((Mod_Gilde == 7)
	|| (Mod_Gilde == 8))
	{
		return 1;
	};
};
FUNC VOID Info_Mod_Marduk_Kreis4_Info ()
{
	AI_Output (hero, self, "Info_Mod_Marduk_Kreis4_15_00"); //Ich will den vierten Kreis der Magie lernen.
	
	if (Kapitel >= 3)
	{
		if B_TeachMagicCircle (self,hero, 4)
		{
			AI_Output (self, hero, "Info_Mod_Marduk_Kreis4_05_01"); //Gut. Alle Zeichen sind erfüllt. Tritt nun ein in den vierten Kreis, auf dass dir die Macht der neuen Zauber inne ist.

			Mod_MagieKreis = 4;
		};
	}
	else
	{
			AI_Output (self, hero, "Info_Mod_Marduk_Kreis4_05_02"); //Noch ist es nicht soweit.
	};
};

INSTANCE Info_Mod_Marduk_Kreis5 (C_INFO)
{
	npc		= Mod_921_KDF_Marduk_NW;
	nr		= 1;
	condition	= Info_Mod_Marduk_Kreis5_Condition;
	information	= Info_Mod_Marduk_Kreis5_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will den fünften Kreis der Magie lernen.";
};

FUNC INT Info_Mod_Marduk_Kreis5_Condition()
{	
	if (Mod_MagieKreis == 4)
	&& (Mod_Gilde == 8)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Marduk_Kreis5_Info()
{
	AI_Output (hero, self, "Info_Mod_Marduk_Kreis5_15_00"); //Ich will den fünften Kreis der Magie lernen.
	
	if (Kapitel >= 5)
	{
		if B_TeachMagicCircle (self,hero, 5)
		{
			AI_Output (self, hero, "Info_Mod_Marduk_Kreis5_05_01"); //Dann tritt nun ein, in den fünften Kreis der Magie. Du wirst nun mächtigere Zauber als je zuvor beherrschen.

			Mod_MagieKreis = 5;
		};
	}
	else
	{
			AI_Output (self, hero, "Info_Mod_Marduk_Kreis5_05_02"); //Die Zeit ist noch nicht reif dafür.
	};
};

INSTANCE Info_Mod_Marduk_Kreis6	(C_INFO)
{
	npc		= Mod_921_KDF_Marduk_NW;
	nr		= 1;
	condition	= Info_Mod_Marduk_Kreis6_Condition;
	information	= Info_Mod_Marduk_Kreis6_Info;
	permanent	= 1;
	important	= 0;
	description	= "Lehre mich den letzten Kreis der Magie.";
};

FUNC INT Info_Mod_Marduk_Kreis6_Condition()
{	
	if (Mod_MagieKreis == 5)
	&& (Mod_Gilde == 8)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Marduk_Kreis6_Info()
{
	AI_Output (hero, self, "Info_Mod_Marduk_Kreis6_15_00"); //Lehre mich den letzten Kreis der Magie.
	
	if (Kapitel >= 6)
	{
		if B_TeachMagicCircle (self,hero, 6)  
		{
			AI_Output (self, hero, "Info_Mod_Marduk_Kreis6_05_01"); //Viel Zeit ist vergangen, seit du den Bund mit Innos eingegangen bist. Viel ist geschehen und wir finden keine Ruhe.
			AI_Output (self, hero, "Info_Mod_Marduk_Kreis6_05_02"); //Du bist der Erwählte Innos'. Und als solcher wirst du alle Kraft brauchen, um deine Kämpfe zu bestehen.
			AI_Output (self, hero, "Info_Mod_Marduk_Kreis6_05_03"); //Ich weihe dich nun, Erwählter. Du trittst in den sechsten Kreis.
			AI_Output (self, hero, "Info_Mod_Marduk_Kreis6_05_04"); //Die Zauberformeln des letzten Kreises kannst du nun von Hyglas lernen, wenn du es wünscht.

			Mod_MagieKreis = 6;
		};
	}
	else
	{
		AI_Output (self, hero, "Info_Mod_Marduk_Kreis6_05_05"); //Noch ist es nicht an der Zeit dafür. Wenn du ein Stück weiter auf dem Weg gegangen bist, den Innos dir zeigt, dann werde ich dich unterweisen.
	};
};

INSTANCE Info_Mod_Marduk_Pickpocket (C_INFO)
{
	npc		= Mod_921_KDF_Marduk_NW;
	nr		= 1;
	condition	= Info_Mod_Marduk_Pickpocket_Condition;
	information	= Info_Mod_Marduk_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_150;
};

FUNC INT Info_Mod_Marduk_Pickpocket_Condition()
{
	C_Beklauen	(133, ItMi_Gold, 690);
};

FUNC VOID Info_Mod_Marduk_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Marduk_Pickpocket);

	Info_AddChoice	(Info_Mod_Marduk_Pickpocket, DIALOG_BACK, Info_Mod_Marduk_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Marduk_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Marduk_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Marduk_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Marduk_Pickpocket);
};

FUNC VOID Info_Mod_Marduk_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Marduk_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Marduk_Pickpocket);

		Info_AddChoice	(Info_Mod_Marduk_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Marduk_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Marduk_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Marduk_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Marduk_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Marduk_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Marduk_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Marduk_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Marduk_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Marduk_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Marduk_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Marduk_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Marduk_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Marduk_EXIT (C_INFO)
{
	npc		= Mod_921_KDF_Marduk_NW;
	nr		= 1;
	condition	= Info_Mod_Marduk_EXIT_Condition;
	information	= Info_Mod_Marduk_EXIt_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Marduk_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Marduk_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};