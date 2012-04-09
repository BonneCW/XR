INSTANCE Info_Mod_Gorax_Hi (C_INFO)
{
	npc		= Mod_917_KDF_Gorax_NW;
	nr		= 1;
	condition	= Info_Mod_Gorax_Hi_Condition;
	information	= Info_Mod_Gorax_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Gorax_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gorax_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Gorax_Hi_14_01"); //Ich bin Gorax und kümmere mich um die Versorgung mit Lebensmitteln hier im Kloster.
	AI_Output(self, hero, "Info_Mod_Gorax_Hi_14_02"); //Ich verkaufe aber auch andere Sachen.

	Log_CreateTopic	(TOPIC_MOD_HÄNDLER_KLOSTER, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HÄNDLER_KLOSTER, "Gorax kann mir ein paar Sachen verkaufen.");
};

INSTANCE Info_Mod_Gorax_Andokai (C_INFO)
{
	npc		= Mod_917_KDF_Gorax_NW;
	nr		= 1;
	condition	= Info_Mod_Gorax_Andokai_Condition;
	information	= Info_Mod_Gorax_Andokai_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gorax_Andokai_Condition()
{
	var C_Item RobeVonAndokai;
	RobeVonAndokai = Npc_GetEquippedArmor(hero);

	if (Npc_KnowsInfo(hero, Info_Mod_Andokai_Hi))
	&& (Hlp_IsItem(RobeVonAndokai, ITAR_FAKE_NOV_L) == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorax_Andokai_Info()
{
	AI_Output(self, hero, "Info_Mod_Gorax_Andokai_14_00"); //Huch! Wo kommst du denn her?
	AI_Output(hero, self, "Info_Mod_Gorax_Andokai_15_01"); //Ich bin ganz neu hier. Hast du eine Aufgabe für mich, Meister?
	AI_Output(self, hero, "Info_Mod_Gorax_Andokai_14_02"); //(gutmütig) Ha, du bist noch motiviert, was? Keine Sorge, das legt sich mit der Zeit.
	AI_Output(self, hero, "Info_Mod_Gorax_Andokai_14_03"); //Am Anfang steckt man voller Tatkraft, aber wenn man es dann erst mal zum Magier gebracht hat, spricht man dem Wein und dem Bier zu - sieh mich nur an!
	AI_Output(self, hero, "Info_Mod_Gorax_Andokai_14_04"); //Irgendwann kriegst du deinen Bauch kaum noch über die Bettkannte.
	AI_Output(self, hero, "Info_Mod_Gorax_Andokai_14_05"); //Ach ja, aber du warst ja wegen der Aufgabe hier. Da muss ich natürlich berücksichtigen, dass du noch unerfahren bist.
	AI_Output(self, hero, "Info_Mod_Gorax_Andokai_14_06"); //Eine Sache fällt mir da ein, die gerade richtig für dich sein dürfte.
	AI_Output(self, hero, "Info_Mod_Gorax_Andokai_14_07"); //Ich habe hier eine ausstehende Weinlieferung für Orlan. Du weißt schon, der Typ, dem die Taverne gehört. Von dem kriege ich dann 250 Goldmünzen.
	AI_Output(self, hero, "Info_Mod_Gorax_Andokai_14_08"); //Kannst du dir das merken? Wein, Orlan, 250 Gold?

	B_GiveInvItems	(self, hero, ItFo_KWine, 10);

	Mod_GoraxWeinGeklaut = Wld_GetDay();

	Info_ClearChoices	(Info_Mod_Gorax_Andokai);

	Info_AddChoice	(Info_Mod_Gorax_Andokai, "Kannst du's nicht aufschreiben?", Info_Mod_Gorax_Andokai_B);
	Info_AddChoice	(Info_Mod_Gorax_Andokai, "Kein Problem.", Info_Mod_Gorax_Andokai_A);
};

FUNC VOID Info_Mod_Gorax_Andokai_B()
{
	AI_Output(hero, self, "Info_Mod_Gorax_Andokai_B_15_00"); //Kannst du's nicht aufschreiben?
	AI_Output(self, hero, "Info_Mod_Gorax_Andokai_B_14_01"); //Oh, aber sicher doch. (gedankenverloren) Wo hab ich denn meine Schreibfeder?
	AI_Output(hero, self, "Info_Mod_Gorax_Andokai_B_15_02"); //Hinterm Ohr.
	AI_Output(self, hero, "Info_Mod_Gorax_Andokai_B_14_03"); //Was du nicht sagst, tatsächlich! Da siehst du mal, du bist jetzt schon eine Hilfe!
	AI_Output(self, hero, "Info_Mod_Gorax_Andokai_B_14_04"); //Hier hast du also den Zettel. Damit solltest du es dir merken können.

	B_GiveInvItems	(self, hero, ItWr_GoraxAndokai, 1);

	Info_ClearChoices	(Info_Mod_Gorax_Andokai);
};

FUNC VOID Info_Mod_Gorax_Andokai_A()
{
	AI_Output(hero, self, "Info_Mod_Gorax_Andokai_A_15_00"); //Kein Problem.
	AI_Output(self, hero, "Info_Mod_Gorax_Andokai_A_14_01"); //Dann sehen wir uns bald wieder. Viel Spaß hier im Kloster!

	Info_ClearChoices	(Info_Mod_Gorax_Andokai);
};

INSTANCE Info_Mod_Gorax_Weinverkauf (C_INFO)
{
	npc		= Mod_917_KDF_Gorax_NW;
	nr		= 1;
	condition	= Info_Mod_Gorax_Weinverkauf_Condition;
	information	= Info_Mod_Gorax_Weinverkauf_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe Orlan den Wein gebracht.";
};

FUNC INT Info_Mod_Gorax_Weinverkauf_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orlan_Gorax))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 250)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Gorax_AndokaiBinBack))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorax_Weinverkauf_Info()
{
	AI_Output(hero, self, "Info_Mod_Gorax_Weinverkauf_15_00"); //Ich habe Orlan den Wein gebracht.

	B_GiveInvItems	(hero, self, ItMi_Gold, 250);

	AI_Output(self, hero, "Info_Mod_Gorax_Weinverkauf_14_01"); //Vielen Dank. Einen Boten wie dich können wir gebrauchen. Vielleicht werde ich wieder auf dich zurück kommen.

	B_GivePlayerXP	(100);

	B_Göttergefallen(1, 1);
};

INSTANCE Info_Mod_Gorax_AndokaiBinBack (C_INFO)
{
	npc		= Mod_917_KDF_Gorax_NW;
	nr		= 1;
	condition	= Info_Mod_Gorax_AndokaiBinBack_Condition;
	information	= Info_Mod_Gorax_AndokaiBinBack_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gorax_AndokaiBinBack_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gorax_Andokai))
	&& (Mod_GoraxWeinGeklaut < Wld_GetDay())
	&& (Npc_HasItems(hero, ItMi_Gold) >= 250)
	&& (Npc_KnowsInfo(hero, Info_Mod_Gorax_Weinverkauf))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorax_AndokaiBinBack_Info()
{
	AI_Output(self, hero, "Info_Mod_Gorax_AndokaiBinBack_14_00"); //Hey du! Hast du mein Gold dabei?
	AI_Output(hero, self, "Info_Mod_Gorax_AndokaiBinBack_15_01"); //Ähm ...
	AI_Output(self, hero, "Info_Mod_Gorax_AndokaiBinBack_14_02"); //Ah, da ist es ja.

	B_GiveInvItems	(hero, self, ItMi_Gold, 250);

	B_GivePlayerXP	(50);
};

INSTANCE Info_Mod_Gorax_Aufgabe (C_INFO)
{
	npc		= Mod_917_KDF_Gorax_NW;
	nr		= 1;
	condition	= Info_Mod_Gorax_Aufgabe_Condition;
	information	= Info_Mod_Gorax_Aufgabe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du was zu tun für mich?";
};

FUNC INT Info_Mod_Gorax_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Pyrokar_Mitglied))
	&& (Npc_KnowsInfo(hero, Info_Mod_Gorax_Hi))
	&& (Mod_Gilde == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorax_Aufgabe_Info()
{
	AI_Output(hero, self, "Info_Mod_Gorax_Aufgabe_15_00"); //Hast du was zu tun für mich?
	AI_Output(self, hero, "Info_Mod_Gorax_Aufgabe_14_01"); //Du könntest für mich in die Stadt gehen und dort vom Händler Salandril vier Flaschen Alkohol kaufen.

	Log_CreateTopic	(TOPIC_MOD_GORAX_ALKOHOL, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_GORAX_ALKOHOL, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_GORAX_ALKOHOL, "Ich soll für Gorax vier Flaschen Alkohol vom Händler Salandril beschaffen.");

	Info_ClearChoices	(Info_Mod_Gorax_Aufgabe);

	Info_AddChoice	(Info_Mod_Gorax_Aufgabe, "Dann mach ich mich gleich auf den Weg.", Info_Mod_Gorax_Aufgabe_Los);
	Info_AddChoice	(Info_Mod_Gorax_Aufgabe, "Wo finde ich Salandril?", Info_Mod_Gorax_Aufgabe_Salandril);
	Info_AddChoice	(Info_Mod_Gorax_Aufgabe, "Wozu braucht ihr den Alkohol?", Info_Mod_Gorax_Aufgabe_Alkohol);
};

FUNC VOID Info_Mod_Gorax_Aufgabe_Los()
{
	AI_Output(hero, self, "Info_Mod_Gorax_Aufgabe_Los_15_00"); //Dann mach ich mich gleich auf den Weg.
	AI_Output(self, hero, "Info_Mod_Gorax_Aufgabe_Los_14_01"); //Hier sind 100 Goldmünzen.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	Info_ClearChoices	(Info_Mod_Gorax_Aufgabe);
};

FUNC VOID Info_Mod_Gorax_Aufgabe_Salandril()
{
	AI_Output(hero, self, "Info_Mod_Gorax_Aufgabe_Salandril_15_00"); //Wo finde ich Salandril?
	AI_Output(self, hero, "Info_Mod_Gorax_Aufgabe_Salandril_14_01"); //Er hat sein Geschäft im Oberen Viertel.

	Mod_DialogGoraxAufgabe2 = TRUE;

	Info_ClearChoices	(Info_Mod_Gorax_Aufgabe);

	Info_AddChoice	(Info_Mod_Gorax_Aufgabe, "Dann mach ich mich gleich auf den Weg.", Info_Mod_Gorax_Aufgabe_Los);

	if (Mod_DialogGoraxAufgabe1 == FALSE)
	{
		Info_AddChoice	(Info_Mod_Gorax_Aufgabe, "Wozu braucht ihr den Alkohol?", Info_Mod_Gorax_Aufgabe_Alkohol);
	};
};

FUNC VOID Info_Mod_Gorax_Aufgabe_Alkohol()
{
	AI_Output(hero, self, "Info_Mod_Gorax_Aufgabe_Alkohol_15_00"); //Wozu braucht ihr den Alkohol?
	AI_Output(self, hero, "Info_Mod_Gorax_Aufgabe_Alkohol_14_01"); //Wir Magier vertragen eine Menge Alkohol und in unserem Wein ist nicht viel drin, deswegen füllen wir ihn mit reinem Alkohol auf.

	Mod_DialogGoraxAufgabe1 = TRUE;
	
	Info_ClearChoices	(Info_Mod_Gorax_Aufgabe);

	Info_AddChoice	(Info_Mod_Gorax_Aufgabe, "Dann mach ich mich gleich auf den Weg.", Info_Mod_Gorax_Aufgabe_Los);

	if (Mod_DialogGoraxAufgabe2 == FALSE)
	{
		Info_AddChoice	(Info_Mod_Gorax_Aufgabe, "Wo finde ich Salandril?", Info_Mod_Gorax_Aufgabe_Salandril);
	};
};

INSTANCE Info_Mod_Gorax_HabAlkohol (C_INFO)
{
	npc		= Mod_917_KDF_Gorax_NW;
	nr		= 1;
	condition	= Info_Mod_Gorax_HabAlkohol_Condition;
	information	= Info_Mod_Gorax_HabAlkohol_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab den Alkohol.";
};

FUNC INT Info_Mod_Gorax_HabAlkohol_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gorax_Aufgabe))
	&& (Npc_KnowsInfo(hero, Info_Mod_Salandril_Alkohol))
	&& (Npc_HasItems(hero, ItMi_Alchemy_Alcohol_01)	== 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorax_HabAlkohol_Info()
{
	AI_Output(hero, self, "Info_Mod_Gorax_HabAlkohol_15_00"); //Ich hab den Alkohol.

	B_GiveInvItems	(hero, self, ItMi_Alchemy_Alcohol_01, 4);

	AI_Output(self, hero, "Info_Mod_Gorax_HabAlkohol_14_01"); //Danke. Du hast uns allen damit sehr geholfen.

	Npc_RemoveInvItems	(self, ItMi_Alchemy_Alcohol_01, 4);

	AI_Output(self, hero, "Info_Mod_Gorax_HabAlkohol_14_02"); //Nimm dieses Gold als Belohnung.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	B_GivePlayerXP	(250);

	B_LogEntry_More	(TOPIC_MOD_FEUERMAGIER, TOPIC_MOD_GORAX_ALKOHOL, "Ich habe Gorax den Alkohol gebracht.", "Ich habe Gorax den Alkohol gebracht.");
	B_SetTopicStatus	(TOPIC_MOD_GORAX_ALKOHOL, LOG_SUCCESS);

	B_Göttergefallen(1, 1);
};

INSTANCE Info_Mod_Gorax_Unkraut (C_INFO)
{
	npc		= Mod_917_KDF_Gorax_NW;
	nr		= 1;
	condition	= Info_Mod_Gorax_Unkraut_Condition;
	information	= Info_Mod_Gorax_Unkraut_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du etwas für mich zu tun.";
};

FUNC INT Info_Mod_Gorax_Unkraut_Condition()
{
	if (hero.guild == GIL_VLK)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorax_Unkraut_Info()
{
	AI_Output(hero, self, "Info_Mod_Gorax_Unkraut_15_00"); //Hast du etwas für mich zu tun.
	AI_Output(self, hero, "Info_Mod_Gorax_Unkraut_14_01"); //Ahh, ein fleißiger Novize. An den Trögen gibt es gerade keinen Platz mehr, da die anderen Novizen stampfen, was das Zeug hält.
	AI_Output(self, hero, "Info_Mod_Gorax_Unkraut_14_02"); //Aber stattdessen könntest du helfen das ganze Unkraut um unsere Reben herum rauszureißen.
	AI_Output(self, hero, "Info_Mod_Gorax_Unkraut_14_03"); //Nicht, dass die garstigen Pflänzchen unseren guten Weinreben die Nährstoffe klauen und wir bald auf dem Trocknen sitzen. (lacht)

	Log_CreateTopic	(TOPIC_MOD_GORAX_UNKRAUT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_GORAX_UNKRAUT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_GORAX_UNKRAUT, "Gorax meinte, ich könnte das Unkraut um die Weinreben herum ausreißen.");

	Wld_InsertItem	(ItPl_Unkraut_Gorax, "FP_ITEM_GORAX_UNKRAUT_01");
	Wld_InsertItem	(ItPl_Unkraut_Gorax, "FP_ITEM_GORAX_UNKRAUT_02");
	Wld_InsertItem	(ItPl_Unkraut_Gorax, "FP_ITEM_GORAX_UNKRAUT_03");
	Wld_InsertItem	(ItPl_Unkraut_Gorax, "FP_ITEM_GORAX_UNKRAUT_04");
	Wld_InsertItem	(ItPl_Unkraut_Gorax, "FP_ITEM_GORAX_UNKRAUT_05");
	Wld_InsertItem	(ItPl_Unkraut_Gorax, "FP_ITEM_GORAX_UNKRAUT_06");
	Wld_InsertItem	(ItPl_Unkraut_Gorax, "FP_ITEM_GORAX_UNKRAUT_07");
	Wld_InsertItem	(ItPl_Unkraut_Gorax, "FP_ITEM_GORAX_UNKRAUT_08");
};

INSTANCE Info_Mod_Gorax_Unkraut2 (C_INFO)
{
	npc		= Mod_917_KDF_Gorax_NW;
	nr		= 1;
	condition	= Info_Mod_Gorax_Unkraut2_Condition;
	information	= Info_Mod_Gorax_Unkraut2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe alles Unkraut abgeerntet.";
};

FUNC INT Info_Mod_Gorax_Unkraut2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Opolos_Unkraut))
	|| (Npc_HasItems(hero, ItPl_Unkraut_Gorax) == 8)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorax_Unkraut2_Info()
{
	AI_Output(hero, self, "Info_Mod_Gorax_Unkraut2_15_00"); //Ich habe alles Unkraut abgeerntet.
	AI_Output(self, hero, "Info_Mod_Gorax_Unkraut2_14_01"); //Guter Novize. Hier, lass deinen Arbeitstag mit ein paar guten Fläschchen Wein ausklingen.

	B_GiveInvItems	(self, hero, ItFo_KWine, 3);

	B_GivePlayerXP	(100);

	B_SetTopicStatus	(TOPIC_MOD_GORAX_UNKRAUT, LOG_SUCCESS);
};

INSTANCE Info_Mod_Gorax_Comeback (C_INFO)
{
	npc		= Mod_917_KDF_Gorax_NW;
	nr		= 1;
	condition	= Info_Mod_Gorax_Comeback_Condition;
	information	= Info_Mod_Gorax_Comeback_Info;
	permanent	= 0;
	important	= 0;
	description	= "Innos zum Gruß. Der Rat hat mir eine der alten Opferschalen zugesagt. Ich will sie abholen.";
};

FUNC INT Info_Mod_Gorax_Comeback_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Pyrokar_Comeback))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorax_Comeback_Info()
{
	AI_Output(hero, self, "Info_Mod_Gorax_Comeback_15_00"); //Innos zum Gruß. Der Rat hat mir eine der alten Opferschalen zugesagt. Ich will sie abholen.
	AI_Output(self, hero, "Info_Mod_Gorax_Comeback_14_01"); //Davon haben wir noch ein paar. Aber du wirst sie nicht tragen können. Ist zu schwer.
	AI_Output(hero, self, "Info_Mod_Gorax_Comeback_15_02"); //Vielleicht kann mir einer der Novizen helfen ...
	AI_Output(self, hero, "Info_Mod_Gorax_Comeback_14_03"); //Ich sorge dafür, dass dir das Teil gebracht wird. Wo soll es eigentlich hin?
	AI_Output(hero, self, "Info_Mod_Gorax_Comeback_15_04"); //Das steht noch nicht fest. Am Besten, ihr stellt sie rechts neben dem Osttor auf die Wiese.
	AI_Output(self, hero, "Info_Mod_Gorax_Comeback_14_05"); //Wird gemacht.

	B_LogEntry	(TOPIC_MOD_ASS_COMEBACK, "Gorax wird die Opferschale auf die Wiese nahe des Lagers liefern. Dort können wir sie dann abholen. Ich sollte jetzt zurück zu Norek.");
};

INSTANCE Info_Mod_Gorax_Trade (C_INFO)
{
	npc		= Mod_917_KDF_Gorax_NW;
	nr		= 1;
	condition	= Info_Mod_Gorax_Trade_Condition;
	information	= Info_Mod_Gorax_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Gorax_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gorax_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorax_Trade_Info()
{	
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Gorax_Pickpocket (C_INFO)
{
	npc		= Mod_917_KDF_Gorax_NW;
	nr		= 1;
	condition	= Info_Mod_Gorax_Pickpocket_Condition;
	information	= Info_Mod_Gorax_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_100;
};

FUNC INT Info_Mod_Gorax_Pickpocket_Condition()
{
	C_Beklauen	(91, ItMi_Gold, 680);
};

FUNC VOID Info_Mod_Gorax_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Gorax_Pickpocket);

	Info_AddChoice	(Info_Mod_Gorax_Pickpocket, DIALOG_BACK, Info_Mod_Gorax_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Gorax_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Gorax_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Gorax_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Gorax_Pickpocket);
};

FUNC VOID Info_Mod_Gorax_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Gorax_Pickpocket);
};

INSTANCE Info_Mod_Gorax_EXIT (C_INFO)
{
	npc		= Mod_917_KDF_Gorax_NW;
	nr		= 1;
	condition	= Info_Mod_Gorax_EXIT_Condition;
	information	= Info_Mod_Gorax_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Gorax_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gorax_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};