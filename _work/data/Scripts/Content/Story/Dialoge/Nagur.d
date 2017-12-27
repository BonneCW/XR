INSTANCE Info_Mod_Nagur_Hi (C_INFO)
{
	npc		= Mod_743_NONE_Nagur_NW;
	nr		= 1;
	condition	= Info_Mod_Nagur_Hi_Condition;
	information	= Info_Mod_Nagur_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Nagur_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Daron_HabTrank))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Nagur_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Nagur_Hi_37_00"); //(Zu sich selbst) Wenn ich diesen armseligen Hosenscheißer nur zwischen die Finger bekomme ...
	AI_Output(hero, self, "Info_Mod_Nagur_Hi_15_01"); //Was?!
	AI_Output(self, hero, "Info_Mod_Nagur_Hi_37_02"); //(zum Helden) Ach, so ein feiger Novize hat ordentlich Spielschulden gemacht und sich dann abgesetzt ... ist irgendwo Richtung Leuchtturm abgehauen.
	AI_Output(self, hero, "Info_Mod_Nagur_Hi_37_03"); //(zweideutig) Aber zahlen soll er ... auf die eine oder andere Weise.
	AI_Output(self, hero, "Info_Mod_Nagur_Hi_37_04"); //Wenn ihm nun irgendwas zustieße, würde ich demjenigen, der mir den Inhalt seiner Taschen bringt, großzügig entlohnen.
	AI_Output(self, hero, "Info_Mod_Nagur_Hi_37_05"); //(zu sich selbst) Das wäre den anderen eine Warnung, lieber rechtzeitig ihre Schulden zu begleichen.

	B_LogEntry	(TOPIC_MOD_ASS_AUFNAHME, "Vermutlich ist Akahasch rauf in Richtung Leuchtturm. Er scheint Schulden zu haben. Nagur wünscht seinen Tod und bietet für den Inhalt seiner Taschen eine Belohnung.");

	Wld_InsertNpc	(Mod_4016_NOV_Akahasch_NW, "LIGHTHOUSE");
};

INSTANCE Info_Mod_Nagur_AkahaschTot (C_INFO)
{
	npc		= Mod_743_NONE_Nagur_NW;
	nr		= 1;
	condition	= Info_Mod_Nagur_AkahaschTot_Condition;
	information	= Info_Mod_Nagur_AkahaschTot_Info;
	permanent	= 0;
	important	= 0;
	description	= "Akahasch hatte einen kleinen 'Unfall' ...";
};

FUNC INT Info_Mod_Nagur_AkahaschTot_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Nagur_Hi))
	&& (Npc_IsDead(Mod_4016_NOV_Akahasch_NW))
	&& (Npc_HasItems(hero, ItWr_AkahaschNagur) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Nagur_AkahaschTot_Info()
{
	AI_Output(hero, self, "Info_Mod_Nagur_AkahaschTot_15_00"); //Akahasch hatte einen kleinen "Unfall" ...
	AI_Output(self, hero, "Info_Mod_Nagur_AkahaschTot_37_01"); //(erwartungsvoll) Ja?
	AI_Output(hero, self, "Info_Mod_Nagur_AkahaschTot_15_02"); //Er wird wohl leider nie wieder jemandem "beklauen" können ...
	AI_Output(self, hero, "Info_Mod_Nagur_AkahaschTot_37_03"); //Das hört sich doch schon mal vielversprechend an. Was ist mit dem Zeug, das er bei sich hatte?
	AI_Output(hero, self, "Info_Mod_Nagur_AkahaschTot_15_04"); //Er hatte zum einen ...
	AI_Output(self, hero, "Info_Mod_Nagur_AkahaschTot_37_05"); //Nee, nicht im Detail ... ich will nur den Zettel als Beweis seines Ablebens.
	AI_Output(hero, self, "Info_Mod_Nagur_AkahaschTot_15_06"); //Hier ist er.

	B_GiveInvItems	(hero, self, ItWr_AkahaschNagur, 1);

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Nagur_AkahaschTot_37_07"); //Ja, da gibt es keinen Zweifel. Freiwillig hätte er dir den nicht in die Hand gedrückt.

	B_GiveInvItems	(self, hero, ItMi_Gold, 180);

	AI_Output(self, hero, "Info_Mod_Nagur_AkahaschTot_37_08"); //Bist ein guter Junge. Hier, amüsier dich etwas auf meine Rechnung.

	B_GivePlayerXP	(200);
};

INSTANCE Info_Mod_Nagur_Geschaeft (C_INFO)
{
	npc		= Mod_743_NONE_Nagur_NW;
	nr		= 1;
	condition	= Info_Mod_Nagur_Geschaeft_Condition;
	information	= Info_Mod_Nagur_Geschaeft_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Nagur_Geschaeft_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Nagur_AkahaschTot))
	&& (Kapitel >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Nagur_Geschaeft_Info()
{
	AI_Output(self, hero, "Info_Mod_Nagur_Geschaeft_37_00"); //Gut, dass jetzt hier auftauchst. Ich habe mal wieder einen Job für dich.
	AI_Output(hero, self, "Info_Mod_Nagur_Geschaeft_15_01"); //Wen soll ich diesmal umbringen?
	AI_Output(self, hero, "Info_Mod_Nagur_Geschaeft_37_02"); //Den verräterischen Abschaum, der mal für mich gearbeitet hat.
	AI_Output(self, hero, "Info_Mod_Nagur_Geschaeft_37_03"); //Zwei von meinen Jungs machen nämlich seit kurzem gemeinsame Sache mit dem Schmugglerpack, das sich hier im Hafenviertel breit gemacht hat.
	AI_Output(self, hero, "Info_Mod_Nagur_Geschaeft_37_04"); //Jetzt glauben sie, mir die Preise diktieren zu können und versuchen mich Stück für Stück aus den Geschäften zu verdrängen.
	AI_Output(self, hero, "Info_Mod_Nagur_Geschaeft_37_05"); //Das wird aber nicht passieren ... denn du wirst ein Exempel an ihnen statuieren.
	AI_Output(hero, self, "Info_Mod_Nagur_Geschaeft_15_06"); //Und was springt für mich dabei heraus?
	AI_Output(self, hero, "Info_Mod_Nagur_Geschaeft_37_07"); //Nun, ich gebe dir zum einen 200 Goldmünzen, zum anderen darfst du alles behalten, was du bei diesen Bastarden findest.
	AI_Output(hero, self, "Info_Mod_Nagur_Geschaeft_15_08"); //Und wo finde ich sie?
	AI_Output(self, hero, "Info_Mod_Nagur_Geschaeft_37_09"); //Die Frage lautet in dem Fall wie. Du wirst in den Kisten zwischen Lagerhaus und Lastenkran ein Paket deponieren und anschließend zum Baum über dem Lagerhaus gehen, um von dort aus alles im Blick zu haben.
	AI_Output(self, hero, "Info_Mod_Nagur_Geschaeft_37_10"); //Einer von den Bastarden sollte kurz danach das Paket holen und in ihr Versteck gehen.
	AI_Output(self, hero, "Info_Mod_Nagur_Geschaeft_37_11"); //Du wirst ihm folgen und dort den Mistkerlen den Garaus machen. Noch Fragen? Nein? Dann hast du hier das Paket.

	B_GiveInvItems	(self, hero, ItMi_NagurPaket, 1);

	Log_CreateTopic	(TOPIC_MOD_NAGUR_GESCHAEFT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_NAGUR_GESCHAEFT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_NAGUR_GESCHAEFT, "Nagur hat Ärger mit einigen Konkurrenten im Hafenviertel. Um das Problem zu beheben, soll ich ein Paket in den Kisten zwischen Lagerhaus und Lastenkran deponieren, zu dem Baum über dem Lagerhaus gehen und alles im Blick behalten. Sobald einer von denen das Paket holt, soll ich ihm zum Versteck folgen und sie dort alle erledigen.");

	var int ptr; ptr = MEM_SearchVobByName("KARDIFINFOTRUHE");

	var zCVob vob; vob = MEM_PtrToInst(ptr);

	vob.trafoObjToWorld[3] = mkf(-289);
	vob.trafoObjToWorld[7] = mkf(-181);
	vob.trafoObjToWorld[11] = mkf(3551);

	VobPositionUpdated(ptr);
};

INSTANCE Info_Mod_Nagur_Geschaeft2 (C_INFO)
{
	npc		= Mod_743_NONE_Nagur_NW;
	nr		= 1;
	condition	= Info_Mod_Nagur_Geschaeft2_Condition;
	information	= Info_Mod_Nagur_Geschaeft2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Verräter und Schmuggler werden keinen Ärger mehr machen.";
};

FUNC INT Info_Mod_Nagur_Geschaeft2_Condition()
{
	if (Mod_Nagur_Geschaeft == 4)
	|| (Mod_Nagur_Geschaeft == 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Nagur_Geschaeft2_Info()
{
	AI_Output(hero, self, "Info_Mod_Nagur_Geschaeft2_15_00"); //Die Verräter und Schmuggler werden keinen Ärger mehr machen.
	AI_Output(self, hero, "Info_Mod_Nagur_Geschaeft2_37_01"); //Ausgezeichnet. Das wird allen anderen eine Warnung sein, sich besser nicht mit mir anzulegen.
	AI_Output(self, hero, "Info_Mod_Nagur_Geschaeft2_37_02"); //Du hast deinen Job wieder mal gut gemacht. Hier ist dein Gold.

	B_GiveInvItems	(self, hero, ItMi_Gold, 200);

	if (Mod_Nagur_Geschaeft == 4)
	{
		B_LogEntry	(TOPIC_MOD_NAGUR_GESCHAEFT, "Ich habe gegenüber Nagur behauptet, dass ich die Jungs beseitigt hätte. Jetzt muss ich nur noch in den nächsten Tagen in der Hafenkneipe vorbeischauen.");

		B_GivePlayerXP	(150);

		Mod_Nagur_Geschaeft_Tag = Wld_GetDay();
	}
	else
	{
		B_SetTopicStatus	(TOPIC_MOD_NAGUR_GESCHAEFT, LOG_SUCCESS);

		B_GivePlayerXP	(350);

		Mod_Nagur_Geschaeft_Tag = Wld_GetDay();
	};
};

INSTANCE Info_Mod_Nagur_Rache (C_INFO)
{
	npc		= Mod_743_NONE_Nagur_NW;
	nr		= 1;
	condition	= Info_Mod_Nagur_Rache_Condition;
	information	= Info_Mod_Nagur_Rache_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Nagur_Rache_Condition()
{
	if (Nagur_KillAkahasch == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Nagur_Rache_Info()
{
	AI_Output(self, hero, "Info_Mod_Nagur_Rache_37_00"); //(höhnisch) Na, hast du gefunden, was du gesucht hast?
	AI_Output(hero, self, "Info_Mod_Nagur_Rache_15_01"); //Nagur?!
	AI_Output(self, hero, "Info_Mod_Nagur_Rache_37_02"); //Überrascht mich zu sehen?
	AI_Output(self, hero, "Info_Mod_Nagur_Rache_37_03"); //Ja, man hat mich eine ganze Weile aus dem Verkehr gezogen, habe lange im Kerker geschmort ... und ich hatte viel Zeit zum Nachdenken, wie ich mich bei demjenigen revanchiere, dem ich das zu verdanken habe.
	AI_Output(self, hero, "Info_Mod_Nagur_Rache_37_04"); //Ich hoffe das Ergebnis gefällt dir ... das nette Wiedersehen mit deinem Kollegen.

	AI_TurnToNpc	(self, Mod_7780_SNOV_Novize_NW);

	AI_Output(self, hero, "Info_Mod_Nagur_Rache_37_05"); //(zu den beiden anderen) Jungs, dasselbe mit ihm, wie mit Akahasch!

	AI_TurnToNpc	(self, hero);

	AI_StopProcessInfos	(self);

	self.guild = GIL_STRF;
	Npc_SetTrueGuild (self, GIL_STRF);

	Mod_7780_SNOV_Novize_NW.guild = GIL_STRF;
	Npc_SetTrueGuild (Mod_7780_SNOV_Novize_NW, GIL_STRF);

	Mod_7779_ASS_Assassine_NW.guild = GIL_STRF;
	Npc_SetTrueGuild (Mod_7779_ASS_Assassine_NW, GIL_STRF);
};

INSTANCE Info_Mod_Nagur_Pickpocket (C_INFO)
{
	npc		= Mod_743_NONE_Nagur_NW;
	nr		= 1;
	condition	= Info_Mod_Nagur_Pickpocket_Condition;
	information	= Info_Mod_Nagur_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Nagur_Pickpocket_Condition()
{
	C_Beklauen	(80, ItMi_Gold, 21);
};

FUNC VOID Info_Mod_Nagur_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Nagur_Pickpocket);

	Info_AddChoice	(Info_Mod_Nagur_Pickpocket, DIALOG_BACK, Info_Mod_Nagur_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Nagur_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Nagur_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Nagur_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Nagur_Pickpocket);
};

FUNC VOID Info_Mod_Nagur_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Nagur_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Nagur_Pickpocket);

		Info_AddChoice	(Info_Mod_Nagur_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Nagur_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Nagur_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Nagur_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Nagur_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Nagur_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Nagur_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Nagur_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Nagur_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Nagur_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Nagur_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Nagur_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Nagur_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Nagur_EXIT (C_INFO)
{
	npc		= Mod_743_NONE_Nagur_NW;
	nr		= 1;
	condition	= Info_Mod_Nagur_EXIT_Condition;
	information	= Info_Mod_Nagur_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Nagur_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Nagur_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};