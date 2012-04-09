INSTANCE Info_Mod_Jeremiah_Hi (C_INFO)
{
	npc		= Mod_1087_BAU_Jeremiah_MT;
	nr		= 1;
	condition	= Info_Mod_Jeremiah_Hi_Condition;
	information	= Info_Mod_Jeremiah_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo, wofür bist du zuständig?";
};

FUNC INT Info_Mod_Jeremiah_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Jeremiah_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Jeremiah_Hi_15_00"); //Hallo, wofür bist du zuständig?
	AI_Output(self, hero, "Info_Mod_Jeremiah_Hi_04_01"); //Ich bin der Alchemist und Schnapsbrenner des Lagers. Im Moment habe ich ziemlich viel zu tun. Vielleicht habe ich in einigen Tagen mehr Zeit für eine Unterhaltung.

	Mod_NL_JeremiahDay = Wld_GetDay();
};

INSTANCE Info_Mod_Jeremiah_Diver (C_INFO)
{
	npc		= Mod_1087_BAU_Jeremiah_MT;
	nr		= 1;
	condition	= Info_Mod_Jeremiah_Diver_Condition;
	information	= Info_Mod_Jeremiah_Diver_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Jeremiah_Diver_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jeremiah_Hi))
	&& (Wld_GetDay()-3 >= Mod_NL_JeremiahDay)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jeremiah_Diver_Info()
{
	AI_Output(self, hero, "Info_Mod_Jeremiah_Diver_04_00"); //Ahh, du kommst gerade richtig.
	AI_Output(hero, self, "Info_Mod_Jeremiah_Diver_15_01"); //Was, worum geht es?
	AI_Output(self, hero, "Info_Mod_Jeremiah_Diver_04_02"); //Du gehörst nicht zu den besoffenen Tagedieben, die sonst in der Kneipe herumsitzen. Du bist bestimmt dazu in der Lage ausdauernd zu schwimmen und zu tauchen.
	AI_Output(hero, self, "Info_Mod_Jeremiah_Diver_15_03"); //Ja, wohl möglich. Den einen oder anderen Meter bin ich schon geschwommen ...
	AI_Output(self, hero, "Info_Mod_Jeremiah_Diver_04_04"); //Sehr gut. Vor einiger Zeit viel mir nämlich ein Kraut an dem Ufer des Sees unten beim Reislord auf. Ich glaubte mich daran erinnern zu können, es schon mal in einem Buch gesehen zu haben.
	AI_Output(self, hero, "Info_Mod_Jeremiah_Diver_04_05"); //Jedenfalls experimentierte ich etwas damit herum und fand eine, ähh, sinnvolle Verwendung dafür. Mittlerweile habe ich jedoch alles an den Ufern abgeerntet und da habe ich mich gefragt, ob du ...
	AI_Output(hero, self, "Info_Mod_Jeremiah_Diver_15_06"); //Ob ich nicht im See danach tauchen könnte.
	AI_Output(self, hero, "Info_Mod_Jeremiah_Diver_04_07"); //Ja, genau. Die Pflanze hat lange gezackte Blätter, ganz leicht zu erkennen. Bringe mir fünf Exemplare. Das sollte erst mal für einige Zeit reichen.

	Log_CreateTopic	(TOPIC_MOD_SLD_JEREMIAHKRAUT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SLD_JEREMIAHKRAUT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SLD_JEREMIAHKRAUT, "Ich soll im See unten beim Reislord nach einem Kraut mit langen, gezackten Blättern tauchen und Jeremiah fünf davon bringen.");
};

INSTANCE Info_Mod_Jeremiah_Kraut (C_INFO)
{
	npc		= Mod_1087_BAU_Jeremiah_MT;
	nr		= 1;
	condition	= Info_Mod_Jeremiah_Kraut_Condition;
	information	= Info_Mod_Jeremiah_Kraut_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe das Kraut ... denke ich.";
};

FUNC INT Info_Mod_Jeremiah_Kraut_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jeremiah_Diver))
	&& (Mod_NL_Herkuleskraut == 1)
	&& (Npc_HasItems(hero, ItPl_Herkuleskraut) >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jeremiah_Kraut_Info()
{
	AI_Output(hero, self, "Info_Mod_Jeremiah_Kraut_15_00"); //Ich habe das Kraut ... denke ich.
	AI_Output(self, hero, "Info_Mod_Jeremiah_Kraut_04_01"); //Ausgezeichnet, gib her ...

	B_GiveInvItems	(hero, self, ItPl_Herkuleskraut, 5);

	AI_Output(self, hero, "Info_Mod_Jeremiah_Kraut_04_02"); //Als kleines Dankeschön werde ich dir nun erzählen, was man mit den Pflanzen anfangen kann.
	AI_Output(self, hero, "Info_Mod_Jeremiah_Kraut_04_03"); //Erzähle es aber unter keinen Umständen im Lager weiter. (zu sich selbst) Nicht, dass Lee noch davon zu hören bekommt.
	AI_Output(hero, self, "Info_Mod_Jeremiah_Kraut_15_04"); //Ja, passt schon.
	AI_Output(self, hero, "Info_Mod_Jeremiah_Kraut_04_05"); //Wenn du dir einen Stängel aus diesem Kraut vermischt mit Sumpfkraut drehst, erfährst du eine Wirkung, die dich glatt aus den Socken Haut.
	AI_Output(self, hero, "Info_Mod_Jeremiah_Kraut_04_06"); //Der Schub an Kraft, den du erfährst, ist immens… zumindest solange die Wirkung anhält. Danach braucht man erst wieder etwa Erholung.

	B_SetTopicStatus	(TOPIC_MOD_SLD_JEREMIAHKRAUT, LOG_SUCCESS);

	B_GivePlayerXP	(300);

	Mod_NL_JeremiahDay = Wld_GetDay();

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Jeremiah_Swimmer (C_INFO)
{
	npc		= Mod_1087_BAU_Jeremiah_MT;
	nr		= 1;
	condition	= Info_Mod_Jeremiah_Swimmer_Condition;
	information	= Info_Mod_Jeremiah_Swimmer_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Jeremiah_Swimmer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jeremiah_Kraut))
	&& (Wld_GetDay()-2 >= Mod_NL_JeremiahDay)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jeremiah_Swimmer_Info()
{
	AI_Output(self, hero, "Info_Mod_Jeremiah_Swimmer_04_00"); //Dass du schwimmen und tauchen kannst, hast du bereits bewiesen.
	AI_Output(hero, self, "Info_Mod_Jeremiah_Swimmer_15_01"); //Was soll ich diesmal machen?
	AI_Output(self, hero, "Info_Mod_Jeremiah_Swimmer_04_02"); //Nun, schwimmen und tauchen.
	AI_Output(self, hero, "Info_Mod_Jeremiah_Swimmer_04_03"); //Als die Söldner einmal einen Haufen Lurker am See vor dem Lager abgeschlachtet hatten, die sich dort sehr lebhaft vermehrten, fiel mir beim Kräutersammeln auf, dass die anderen Tiere ganz verrückt nach einem bestimmten Organ der Lurker waren.
	AI_Output(self, hero, "Info_Mod_Jeremiah_Swimmer_04_04"); //Ich stellte fest, dass es eine Flüssigkeit enthielt, welche die Konzentration und Vitalität steigern kann.
	AI_Output(self, hero, "Info_Mod_Jeremiah_Swimmer_04_05"); //Nun gab es bei unserem See im Lager früher einen Dammlurker. Irgend so ein Typ hat ihn irgendwann erledigt.
	AI_Output(self, hero, "Info_Mod_Jeremiah_Swimmer_04_06"); //Aber davor könnte das Vieh hier irgendwo Eier gelegt haben. Es war nämlich der einzige Lurker in der Nähe und ich habe mal gehört, dass sie sich von ihren Artgenossen zurückziehen, während sie brüten.
	AI_Output(hero, self, "Info_Mod_Jeremiah_Swimmer_15_07"); //Und ich soll jetzt tauchen, um nach einem Zugang zu einer Höhle zu suchen, wo sich die Eier befinden könnten?
	AI_Output(self, hero, "Info_Mod_Jeremiah_Swimmer_04_08"); //Ja, ich sehe, du hast verstanden. Wenn du Eier findest, bring sie mir. Normalerweise schlüpfen die Viecher zu dieser Jahreszeit, sodass sie schon weit entwickelt sein müssten ...

	Log_CreateTopic	(TOPIC_MOD_SLD_JEREMIAHLURKER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SLD_JEREMIAHLURKER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SLD_JEREMIAHLURKER, "Jeremiah will diesmal, dass ich im See des Lagers tauchen gehe, um nach einer Lurkerhöhle zu suchen. Wenn ich Eier finde, soll ich sie ihm bringen.");
};

INSTANCE Info_Mod_Jeremiah_Lurker (C_INFO)
{
	npc		= Mod_1087_BAU_Jeremiah_MT;
	nr		= 1;
	condition	= Info_Mod_Jeremiah_Lurker_Condition;
	information	= Info_Mod_Jeremiah_Lurker_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier, ich habe tatsächlich ein paar Eier gefunden.";
};

FUNC INT Info_Mod_Jeremiah_Lurker_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jeremiah_Swimmer))
	&& (Npc_HasItems(hero, ItMi_LurkerEgg) == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jeremiah_Lurker_Info()
{
	AI_Output(hero, self, "Info_Mod_Jeremiah_Lurker_15_00"); //Hier, ich habe tatsächlich ein paar Eier gefunden.

	B_GiveInvItems	(hero, self, ItMi_LurkerEgg, 5);

	AI_Output(self, hero, "Info_Mod_Jeremiah_Lurker_04_01"); //Das hast du gut gemacht, ausgezeichnet. Aus so frischem Ausgangsmaterial sollte ich hoffentlich genug Sekret gewinnen können.
	AI_Output(self, hero, "Info_Mod_Jeremiah_Lurker_04_02"); //Wie dem auch sei, ich habe mal mit einer Pflanze namens Kronstöckel herumexperimentiert. Recht selten, aber du bist ja viel unterwegs.
	AI_Output(self, hero, "Info_Mod_Jeremiah_Lurker_04_03"); //Wenn du mir jetzt noch zwei Exemplare besorgst, werde ich dir einen Trank brauen, der dauerhaft deiner Konzentration und Vitalität steigert.
	AI_Output(self, hero, "Info_Mod_Jeremiah_Lurker_04_04"); //Währenddessen werde ich mich daran machen, die Lurker aus dem Ei zu pulen ...

	B_LogEntry	(TOPIC_MOD_SLD_JEREMIAHLURKER, "Jetzt will mir Jeremiah einen Trank brauen, wenn ich ihm zwei Kronstöckel beschaffe.");

	B_GivePlayerXP	(250);

	Mod_NL_JeremiahHasEier = 1;
	Mod_NL_JeremiahHasEier_Day = Wld_GetDay();
};

INSTANCE Info_Mod_Jeremiah_PermHerb (C_INFO)
{
	npc		= Mod_1087_BAU_Jeremiah_MT;
	nr		= 1;
	condition	= Info_Mod_Jeremiah_PermHerb_Condition;
	information	= Info_Mod_Jeremiah_PermHerb_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe die Pflanzen.";
};

FUNC INT Info_Mod_Jeremiah_PermHerb_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jeremiah_Lurker))
	&& (Npc_HasItems(hero, ItPl_Perm_Herb) >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jeremiah_PermHerb_Info()
{
	AI_Output(hero, self, "Info_Mod_Jeremiah_PermHerb_15_00"); //Ich habe die Pflanzen.

	B_GiveInvItems	(hero, self, ItPl_Perm_Herb, 2);

	AI_Output(self, hero, "Info_Mod_Jeremiah_PermHerb_04_01"); //Hervorragend. Das gibt ein tolles Gebräu, ähh, einen tollen Trank.
	AI_Output(self, hero, "Info_Mod_Jeremiah_PermHerb_04_02"); //Die kleinen Viecher haben auch mehr und stärkeres Sekret abgegeben, als ich erwartet hatte ...
	AI_Output(self, hero, "Info_Mod_Jeremiah_PermHerb_04_03"); //Komm morgen wieder. Dann müsste ich fertig sein.

	B_SetTopicStatus	(TOPIC_MOD_SLD_JEREMIAHLURKER, LOG_SUCCESS);

	B_GivePlayerXP	(500);

	Mod_NL_JeremiahDay = Wld_GetDay();

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Jeremiah_SpecialTrank (C_INFO)
{
	npc		= Mod_1087_BAU_Jeremiah_MT;
	nr		= 1;
	condition	= Info_Mod_Jeremiah_SpecialTrank_Condition;
	information	= Info_Mod_Jeremiah_SpecialTrank_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Jeremiah_SpecialTrank_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jeremiah_PermHerb))
	&& (Wld_GetDay() > Mod_NL_JeremiahDay)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jeremiah_SpecialTrank_Info()
{
	AI_Output(self, hero, "Info_Mod_Jeremiah_SpecialTrank_04_00"); //Da bist du ja. Der Trank für dich ist fertig. Hier ist er. Prost!

	B_GiveInvItems	(self, hero, ItPo_Health_01, 1);

	B_UseItem	(hero, ItPo_Health_01);

	hero.attribute[ATR_STRENGTH] += 4;
	hero.attribute[ATR_DEXTERITY] += 4;
	hero.attribute[ATR_HITPOINTS_MAX] += 4;
	hero.attribute[ATR_HITPOINTS] += 4;

	PrintScreen	("Stärke + 4, Geschicklichkeit + 4, Lebensenergie + 4", -1, -1, FONT_SCREEN, 2);

	AI_Output(self, hero, "Info_Mod_Jeremiah_SpecialTrank_04_01"); //Und? Wie geht es dir?
	AI_Output(hero, self, "Info_Mod_Jeremiah_SpecialTrank_15_02"); //Sehr gut, warum fragst du?
	AI_Output(self, hero, "Info_Mod_Jeremiah_SpecialTrank_04_03"); //Ach, ähh, nur so, wegen ... wegen des Geschmacks, genau.
	AI_Output(hero, self, "Info_Mod_Jeremiah_SpecialTrank_15_04"); //Hmm, für jemanden, der vor allem seine Erfahrungen aus dem Schnapsbrennen und aus Beobachtungen der Natur hat, scheinst du aber recht begabt in der Alchemie zu sein. Denke ich doch, oder?
	AI_Output(self, hero, "Info_Mod_Jeremiah_SpecialTrank_04_05"); //(zögerlich) Öhmm, ja ... ja, ich verstehe mein Handwerk, wie du siehst. (zu sich selbst) Puhh, dann ist ja noch mal alles gut gegangen ...

	var oCNpc her;
	her = Hlp_GetNpc (hero);
	var int totaldivingtime;
	totaldivingtime = roundf(her.divetime);
	totaldivingtime = totaldivingtime*2;
	her.divetime = mkf(totaldivingtime);
};

INSTANCE Info_Mod_Jeremiah_Pickpocket (C_INFO)
{
	npc		= Mod_1087_BAU_Jeremiah_MT;
	nr		= 1;
	condition	= Info_Mod_Jeremiah_Pickpocket_Condition;
	information	= Info_Mod_Jeremiah_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Jeremiah_Pickpocket_Condition()
{
	C_Beklauen	(51, ItMi_Gold, 180);
};

FUNC VOID Info_Mod_Jeremiah_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Jeremiah_Pickpocket);

	Info_AddChoice	(Info_Mod_Jeremiah_Pickpocket, DIALOG_BACK, Info_Mod_Jeremiah_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Jeremiah_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Jeremiah_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Jeremiah_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Jeremiah_Pickpocket);
};

FUNC VOID Info_Mod_Jeremiah_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Jeremiah_Pickpocket);
};

INSTANCE Info_Mod_Jeremiah_EXIT (C_INFO)
{
	npc		= Mod_1087_BAU_Jeremiah_MT;
	nr		= 1;
	condition	= Info_Mod_Jeremiah_EXIT_Condition;
	information	= Info_Mod_Jeremiah_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Jeremiah_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Jeremiah_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};