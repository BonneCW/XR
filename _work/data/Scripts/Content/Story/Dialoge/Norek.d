INSTANCE Info_Mod_Norek_Hi (C_INFO)
{
	npc		= Mod_7148_ASS_Norek_NW;
	nr		= 1;
	condition	= Info_Mod_Norek_Hi_Condition;
	information	= Info_Mod_Norek_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe den Blutkelch.";
};

FUNC INT Info_Mod_Norek_Hi_Condition()
{
	if (Npc_HasItems(hero, ItMi_Bloodcup_Richter) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Norek_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Norek_Hi_15_00"); //Ich habe den Blutkelch.
	AI_Output(self, hero, "Info_Mod_Norek_Hi_13_01"); //Gib ihn Na'im.
};

INSTANCE Info_Mod_Norek_Blutkelch (C_INFO)
{
	npc		= Mod_7148_ASS_Norek_NW;
	nr		= 1;
	condition	= Info_Mod_Norek_Blutkelch_Condition;
	information	= Info_Mod_Norek_Blutkelch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wenn ich deinen Teil dieser seltsamen Botschaft bekomme, will ich versuchen, sie zu entziffern.";
};

FUNC INT Info_Mod_Norek_Blutkelch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kais_Blutkelch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Norek_Blutkelch_Info()
{
	AI_Output(hero, self, "Info_Mod_Norek_Blutkelch_15_00"); //Wenn ich deinen Teil dieser seltsamen Botschaft bekomme, will ich versuchen, sie zu entziffern.
	AI_Output(self, hero, "Info_Mod_Norek_Blutkelch_13_01"); //Das hat bis jetzt noch keiner geschafft. Gib mir Bericht, wenn du was rausgefunden hast.

	B_GiveInvItems	(self, hero, ItWr_BlutkelchZettel3, 1);

	AI_Output(hero, self, "Info_Mod_Norek_Blutkelch_15_02"); //Mach ich doch. Woher habt ihr eigentlich diese Blätter?
	AI_Output(self, hero, "Info_Mod_Norek_Blutkelch_13_03"); //Amir hat sie uns gebracht. Wahrscheinlich aus der Stadt.
	AI_Output(hero, self, "Info_Mod_Norek_Blutkelch_15_04"); //Und woher hat sie Amir?
	AI_Output(self, hero, "Info_Mod_Norek_Blutkelch_13_05"); //Das konnte er nicht meht sagen. Er kam schwer verletzt hier an, hat Shakir die Blätter übergeben und ist kurz darauf gestorben.
	AI_Output(hero, self, "Info_Mod_Norek_Blutkelch_15_06"); //Hmm. Vielleicht Alkoholvergiftung. Er lümmelt immer vor der Taverne am Tempelplatz rum. Ist auch nicht so wichtig, denke ich.

	if (Npc_HasItems(hero, ItWr_BlutkelchZettel1) == 1)
	&& (Npc_HasItems(hero, ItWr_BlutkelchZettel2) == 1)
	&& (Npc_HasItems(hero, ItWr_BlutkelchZettel3) == 1)
	{
		Log_CreateTopic	(TOPIC_MOD_ASS_LASTBLUTKELCH, LOG_MISSION);
		B_SetTopicStatus	(TOPIC_MOD_ASS_LASTBLUTKELCH, LOG_RUNNING);
		B_LogEntry	(TOPIC_MOD_ASS_LASTBLUTKELCH, "Habe von Kais, Mahamad und Norek jeweils ein Teil eines alten Pergaments erhalten und soll die Botschaft entziffern. Amir hat sie ins Lager gebracht. Mal sehen ...");
	};
};

INSTANCE Info_Mod_Norek_Blutkelch2 (C_INFO)
{
	npc		= Mod_7148_ASS_Norek_NW;
	nr		= 1;
	condition	= Info_Mod_Norek_Blutkelch2_Condition;
	information	= Info_Mod_Norek_Blutkelch2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Norek_Blutkelch2_Condition()
{
	if (Npc_HasItems(hero, ItMi_Bloodcup_Canyon) == 1)
	&& (Mod_ASS_Blutkelch3 == 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Norek_Blutkelch2_Info()
{
	AI_Output(self, hero, "Info_Mod_Norek_Blutkelch2_13_00"); //Da bist du endlich. Ich habe auf dich gewartet.
	AI_Output(hero, self, "Info_Mod_Norek_Blutkelch2_15_01"); //Entschuldigung, es war nicht einfach, den Kelch zu finden und zu bekommen.
	AI_Output(self, hero, "Info_Mod_Norek_Blutkelch2_13_02"); //Du hast den Blutkelch bereits?
	AI_Output(hero, self, "Info_Mod_Norek_Blutkelch2_15_03"); //Natürlich. Hier. Direkt aus seinem versiegeltem Versteck.

	B_GiveInvItems	(hero, self, ItMi_Bloodcup_Canyon, 1);

	AI_Output(self, hero, "Info_Mod_Norek_Blutkelch2_13_04"); //(beeindruckt) Teufelskerl! Schon etliche von uns sind bei der Suche nach den Kelchen gescheitert. Und du bringst uns bereits den dritten. (Laut) Respekt, Magier!
	AI_Output(hero, self, "Info_Mod_Norek_Blutkelch2_15_05"); //Magier?
	AI_Output(self, hero, "Info_Mod_Norek_Blutkelch2_13_06"); //Gewiss. Ich ernenne dich auf Grund deiner Leistung und Hilfe für unsere Gemeinschaft zum Magier der Assassinen. Herzlichen Glückwunsch.
	AI_Output(hero, self, "Info_Mod_Norek_Blutkelch2_15_07"); //Ich fühle mich geehrt, habe aber nur getan, was jeder andere auch getan hätte.
	AI_Output(self, hero, "Info_Mod_Norek_Blutkelch2_13_08"); //Mitnichten! Du hast wahrscheinlich die Weichen für unser aller Zukunft gestellt.
	AI_Output(hero, self, "Info_Mod_Norek_Blutkelch2_15_09"); //Das verstehe ich nun absolut nicht.
	AI_Output(self, hero, "Info_Mod_Norek_Blutkelch2_13_10"); //So höre: Wir sind nun schon etliche Monde auf dieser Insel. Du kennst unsere Vergangenheit?
	AI_Output(hero, self, "Info_Mod_Norek_Blutkelch2_15_11"); //Ja. Zahit hat mir davon erzählt.
	AI_Output(self, hero, "Info_Mod_Norek_Blutkelch2_13_12"); //Nun gut. Es mehren sich im Lager die Stimmen, dass es keine gute Idee war, auf diese Insel zu kommen. Wir sind einfach zu beengt hier, haben kaum Entfaltungsmöglichkeiten.
	AI_Output(self, hero, "Info_Mod_Norek_Blutkelch2_13_13"); //Viele vermissen die Sonne und Weite unser südlichen Heimat. Kurz gesagt; Sie wollen am liebsten wieder zurück. Die meisten Magier und viele von Mustafa`s Leuten.
	AI_Output(hero, self, "Info_Mod_Norek_Blutkelch2_15_14"); //Was nicht so einfach ist.
	AI_Output(self, hero, "Info_Mod_Norek_Blutkelch2_13_15"); //Genau. Der Zauber, der uns hierher gebracht hat, ist auf dem Festland verblieben.
	AI_Output(hero, self, "Info_Mod_Norek_Blutkelch2_15_16"); //Die Paladine haben ein grosses Schiff ...
	AI_Output(self, hero, "Info_Mod_Norek_Blutkelch2_13_17"); //Spassvogel! Die massakrieren uns, wenn sie uns sehen. Nee, nee.
	AI_Output(hero, self, "Info_Mod_Norek_Blutkelch2_15_18"); //Und was ist mit den Piraten? Denen gehört auch ein Dreimaster.
	AI_Output(self, hero, "Info_Mod_Norek_Blutkelch2_13_19"); //Das wäre schon eher was. Du kennst die Piraten?
	AI_Output(hero, self, "Info_Mod_Norek_Blutkelch2_15_20"); //Sicher. Habe mit den Leuten schon gesprochen.
	AI_Output(self, hero, "Info_Mod_Norek_Blutkelch2_13_21"); //Hmm. Ich werde mit den Räten darüber reden. Ach ja. Unser Giftmischer will was von dir.
	AI_Output(hero, self, "Info_Mod_Norek_Blutkelch2_15_22"); //Kamal?
	AI_Output(self, hero, "Info_Mod_Norek_Blutkelch2_13_23"); //Ja. Komm danach zu mir zurück.

	B_GivePlayerXP	(1000);

	B_SetTopicStatus	(TOPIC_MOD_ASS_LASTBLUTKELCH, LOG_SUCCESS);

	Log_CreateTopic	(TOPIC_MOD_ASS_HEIMWEH, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_HEIMWEH, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ASS_HEIMWEH, "Norek erzählte mir, dass große Teile der Assassinen unzufrieden sind mit den gegebenen Umständen und den gegebenen Umständen. Am liebsten würden sie wieder zurück in ihre Heimat.");
};

INSTANCE Info_Mod_Norek_Heimweh (C_INFO)
{
	npc		= Mod_7148_ASS_Norek_NW;
	nr		= 1;
	condition	= Info_Mod_Norek_Heimweh_Condition;
	information	= Info_Mod_Norek_Heimweh_Info;
	permanent	= 0;
	important	= 0;
	description	= "Der Rat hat sich beraten?";
};

FUNC INT Info_Mod_Norek_Heimweh_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kamal_Heimweh))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Norek_Heimweh_Info()
{
	AI_Output(hero, self, "Info_Mod_Norek_Heimweh_15_00"); //Der Rat hat sich beraten?
	AI_Output(self, hero, "Info_Mod_Norek_Heimweh_13_01"); //Und befunden, dass eine Überfahrt mit den Piraten nur eine Notlösung sein könnte.
	AI_Output(hero, self, "Info_Mod_Norek_Heimweh_15_02"); //Dann hat sich das erledigt?
	AI_Output(self, hero, "Info_Mod_Norek_Heimweh_13_03"); //Nein. Es kann nicht schaden, wenn du mal mit dem Kapitän redest. Für alle Fälle ...
	AI_Output(hero, self, "Info_Mod_Norek_Heimweh_15_04"); //Dann will ich mich mal auf den Weg machen.
	AI_Output(self, hero, "Info_Mod_Norek_Heimweh_13_05"); //Tu das. Du kannst auch erwähnen, dass der Preis für die Überfahrt kein Problem ist.
	AI_Output(hero, self, "Info_Mod_Norek_Heimweh_15_06"); //Das wird der Kapitän gerne hören. Bis dann.
	AI_Output(self, hero, "Info_Mod_Norek_Heimweh_13_07"); //Wiedersehen.

	Log_CreateTopic	(TOPIC_MOD_ASS_TODESANGST, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_TODESANGST, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ASS_TODESANGST, "Ich soll bei den Piraten nachfragen, ob sie zu einer Passage auf's Festland bereit wären.");
};

INSTANCE Info_Mod_Norek_Todesangst (C_INFO)
{
	npc		= Mod_7148_ASS_Norek_NW;
	nr		= 1;
	condition	= Info_Mod_Norek_Todesangst_Condition;
	information	= Info_Mod_Norek_Todesangst_Info;
	permanent	= 0;
	important	= 0;
	description	= "War bei den Piraten und habe schlechte Nachrichten.";
};

FUNC INT Info_Mod_Norek_Todesangst_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Greg_Todesangst))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Norek_Todesangst_Info()
{
	AI_Output(hero, self, "Info_Mod_Norek_Todesangst_15_00"); //War bei den Piraten und habe schlechte Nachrichten.
	AI_Output(self, hero, "Info_Mod_Norek_Todesangst_13_01"); //Berichte.
	AI_Output(hero, self, "Info_Mod_Norek_Todesangst_15_02"); //Greg, der Kapitän der Piraten, ist irre geworden. Er wird um alles Gold der Insel nicht auslaufen.
	AI_Output(self, hero, "Info_Mod_Norek_Todesangst_13_03"); //Wieso das?
	AI_Output(hero, self, "Info_Mod_Norek_Todesangst_15_04"); //Er fürchtet um sein Leben. Ein Scharlatan hat ihm vorausgesagt, er werde in Kürze sterben.
	AI_Output(hero, self, "Info_Mod_Norek_Todesangst_15_05"); //Nun traut er sich nicht mehr von seiner Hütte fort. Jedenfalls vorläufig.
	AI_Output(self, hero, "Info_Mod_Norek_Todesangst_13_06"); //Wie dem auch sei. Er wäre sowieso nur eine Notlösung gewesen. Was anderes: Kamal sagt, er hätte in deinem Beutel einen Brocken grünes Erz gesehen.
	AI_Output(hero, self, "Info_Mod_Norek_Todesangst_15_07"); //Das stimmt. Dieses Erz hab ich gebraucht, um an den Blutkelch zu kommen. Er stand in einer Kammer auf einem Steinsarg. Und der Eingang war durch eine grüne Sperre verschlossen. Mit den Brocken bin ich reingekommen.
	AI_Output(self, hero, "Info_Mod_Norek_Todesangst_13_08"); //Phantastisch! Assassinengold. Grüne Magie in konzentrierter Form. Unsere Magie! Sag, hast du mehr von dem Erz?
	AI_Output(hero, self, "Info_Mod_Norek_Todesangst_15_09"); //Nein. Das andere hab ich gebraucht, um die Sperre zu beseitigen. Und mit der Sperre sind dann auch die Brocken verschwunden.
	AI_Output(self, hero, "Info_Mod_Norek_Todesangst_13_10"); //Das wundert mich nicht. Sag, woher hattest du das Erz?
	AI_Output(hero, self, "Info_Mod_Norek_Todesangst_15_11"); //In Jharkendar gibt es ein Wüstengebiet mit Bergwerken. Da drin gab es so grüne Erzadern.
	AI_Output(self, hero, "Info_Mod_Norek_Todesangst_13_12"); //Hmm. Ich sehe eine Lösung für unser Problem. Muss mich mit dem Rat und den Magiern beraten.
	AI_Output(self, hero, "Info_Mod_Norek_Todesangst_13_13"); //Du könntest dich inzwischen in der Gegend dort umsehen, ob es noch mehr dieser grünen Erzadern gibt.
	AI_Output(hero, self, "Info_Mod_Norek_Todesangst_15_14"); //Mach ich doch. Bis später.

	B_GivePlayerXP	(300);

	Log_CreateTopic	(TOPIC_MOD_ASS_ASSASSINENGOLD, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_ASSASSINENGOLD, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ASS_ASSASSINENGOLD, "Der Rat sieht wohl eine Möglichkeit, mit dem grünen Erz in die Heimat zurückzukommen. Ich soll nachforschen, wo es dort weitere grüne Erzadern gibt.");
};

INSTANCE Info_Mod_Norek_Assassinengold (C_INFO)
{
	npc		= Mod_7148_ASS_Norek_NW;
	nr		= 1;
	condition	= Info_Mod_Norek_Assassinengold_Condition;
	information	= Info_Mod_Norek_Assassinengold_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was für ein Aufsehen um mich. Was ist passiert?";
};

FUNC INT Info_Mod_Norek_Assassinengold_Condition()
{
	if (Mod_ASS_Assassinengold == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Norek_Assassinengold_Info()
{
	AI_Output(hero, self, "Info_Mod_Norek_Assassinengold_15_00"); //Was für ein Aufsehen um mich. Was ist passiert?
	AI_Output(self, hero, "Info_Mod_Norek_Assassinengold_13_01"); //Später. Hast du noch magisches Erz gefunden?
	AI_Output(hero, self, "Info_Mod_Norek_Assassinengold_15_02"); //Ja. Ich war noch mal in der Wüste in Jharkendar.
	AI_Output(self, hero, "Info_Mod_Norek_Assassinengold_13_03"); //Und wieviel ...
	AI_Output(hero, self, "Info_Mod_Norek_Assassinengold_15_04"); //33 Brocken konnte ich nochmal hacken.
	AI_Output(self, hero, "Info_Mod_Norek_Assassinengold_13_05"); //33. Eine magische Zahl. Das sieht gut aus.
	AI_Output(hero, self, "Info_Mod_Norek_Assassinengold_15_06"); //Und was war hier los?
	AI_Output(self, hero, "Info_Mod_Norek_Assassinengold_13_07"); //Nun, der Rat hat sich beraten und anschließend die Mitglieder gefragt, wer wieder zurück will in die Heimat.
	AI_Output(self, hero, "Info_Mod_Norek_Assassinengold_13_08"); //Wir Magier wollen alle, bei Mustafa und seinen Kriegern die Meisten.
	AI_Output(self, hero, "Info_Mod_Norek_Assassinengold_13_09"); //Von den Gaunern vorn will nur Shakir uns begleiten.
	AI_Output(self, hero, "Info_Mod_Norek_Assassinengold_13_10"); //Die anderen Gauner werden versuchen, sich der den Dieben in der Stadt anzuschließen.
	AI_Output(hero, self, "Info_Mod_Norek_Assassinengold_15_11"); //Ist ja gut geplant. Aber wenn´s nicht klappt?
	AI_Output(self, hero, "Info_Mod_Norek_Assassinengold_13_12"); //Ich muss mich mit dem Rat beraten. Du wartest hier.

	B_GivePlayerXP	(750);

	B_SetTopicStatus	(TOPIC_MOD_ASS_ASSASSINENGOLD, LOG_SUCCESS);

	AI_GotoWP	(self, "WP_ASSASSINE_54");

	AI_GotoWP	(self, self.wp);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Norek_Assassinengold2 (C_INFO)
{
	npc		= Mod_7148_ASS_Norek_NW;
	nr		= 1;
	condition	= Info_Mod_Norek_Assassinengold2_Condition;
	information	= Info_Mod_Norek_Assassinengold2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Norek_Assassinengold2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Norek_Assassinengold))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Norek_Assassinengold2_Info()
{
	AI_Output(self, hero, "Info_Mod_Norek_Assassinengold2_13_00"); //Wir sind uns einig. 33 Erz sind genug.
	AI_Output(self, hero, "Info_Mod_Norek_Assassinengold2_13_01"); //Was wir aber noch brauchen ist ein irgendwie mystisches Gefäß, das die Magie bündelt und so verstärkt.
	AI_Output(hero, self, "Info_Mod_Norek_Assassinengold2_15_02"); //Bei dem Blutkelch waren es nur zwei Steinschalen ...
	AI_Output(self, hero, "Info_Mod_Norek_Assassinengold2_13_03"); //Wir wollen aber keine Barriere beseitigen, sondern eine weite Reise machen. Du bist viel rumgekommen. Ist dir vielleicht mal was in der Art untergekommen?
	AI_Output(hero, self, "Info_Mod_Norek_Assassinengold2_15_04"); //Hmm. Ich hab irgendwann mal gehört, dass die Feuermagier früher Opferschalen aufgestellt haben, als es die Innosstatuen noch nicht gab. Vielleicht ...
	AI_Output(self, hero, "Info_Mod_Norek_Assassinengold2_13_05"); //Das hört sich gut an. Besorg uns so eine Schale. Koste es, was es wolle!

	Log_CreateTopic	(TOPIC_MOD_ASS_COMEBACK, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_COMEBACK, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ASS_COMEBACK, "Ich soll nun eine Opferschale für das Erz besorgen. Im Kloster der Feuermagier sollte ich fündig werden ...");
};

INSTANCE Info_Mod_Norek_Comeback (C_INFO)
{
	npc		= Mod_7148_ASS_Norek_NW;
	nr		= 1;
	condition	= Info_Mod_Norek_Comeback_Condition;
	information	= Info_Mod_Norek_Comeback_Info;
	permanent	= 0;
	important	= 0;
	description	= "Habe eine Opferschale besorgt. Sie steht beim Stadttor auf der Wiese.";
};

FUNC INT Info_Mod_Norek_Comeback_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gorax_Comeback))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Norek_Comeback_Info()
{
	AI_Output(hero, self, "Info_Mod_Norek_Comeback_15_00"); //Habe eine Opferschale besorgt. Sie steht beim Stadttor auf der Wiese.
	AI_Output(hero, self, "Info_Mod_Norek_Comeback_15_01"); //Ihr könntet sie am Besten nachts da wegholen. Aber zwei Mann braucht's zum Tragen.
	AI_Output(self, hero, "Info_Mod_Norek_Comeback_13_02"); //Kein Problem. Da bin ich aber gespannt. Geh nun zu Na'im. Er will dich sprechen.

	B_SetTopicStatus	(TOPIC_MOD_ASS_HEIMWEH, LOG_SUCCESS);
	B_SetTopicStatus	(TOPIC_MOD_ASS_COMEBACK, LOG_SUCCESS);
};

INSTANCE Info_Mod_Norek_Pickpocket (C_INFO)
{
	npc		= Mod_7148_ASS_Norek_NW;
	nr		= 1;
	condition	= Info_Mod_Norek_Pickpocket_Condition;
	information	= Info_Mod_Norek_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Norek_Pickpocket_Condition()
{
	C_Beklauen	(118, ItMi_Gold, 2000);
};

FUNC VOID Info_Mod_Norek_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Norek_Pickpocket);

	Info_AddChoice	(Info_Mod_Norek_Pickpocket, DIALOG_BACK, Info_Mod_Norek_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Norek_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Norek_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Norek_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Norek_Pickpocket);
};

FUNC VOID Info_Mod_Norek_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Norek_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Norek_Pickpocket);

		Info_AddChoice	(Info_Mod_Norek_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Norek_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Norek_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Norek_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Norek_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Norek_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Norek_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Norek_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Norek_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Norek_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Norek_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Norek_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Norek_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Norek_EXIT (C_INFO)
{
	npc		= Mod_7148_ASS_Norek_NW;
	nr		= 1;
	condition	= Info_Mod_Norek_EXIT_Condition;
	information	= Info_Mod_Norek_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Norek_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Norek_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};