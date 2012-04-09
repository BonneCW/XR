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
	|| (Mod_IstLehrling > 0)
	|| (Npc_KnowsInfo(hero, Info_Mod_Ulf_WieGehts))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Nagur_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Nagur_Hi_08_00"); //(Zu sich selbst) Wenn ich diesen armseligen Hosenscheißer nur zwischen die Finger bekomme ...
	AI_Output(hero, self, "Info_Mod_Nagur_Hi_15_01"); //Was?!
	AI_Output(self, hero, "Info_Mod_Nagur_Hi_08_02"); //(zum Helden) Ach, so ein feiger Novize hat ordentlich Spielschulden gemacht und sich dann abgesetzt ... ist irgendwo Richtung Leuchtturm abgehauen.
	AI_Output(self, hero, "Info_Mod_Nagur_Hi_08_03"); //(zweideutig) Aber zahlen soll er ... auf die eine oder andere Weise.
	AI_Output(self, hero, "Info_Mod_Nagur_Hi_08_04"); //Wenn ihm nun irgendwas zustieße, würde ich demjenigen, der mir den Inhalt seiner Taschen bringt großzügig entlohnen.
	AI_Output(self, hero, "Info_Mod_Nagur_Hi_08_05"); //(zu sich selbst) Das wäre den anderen eine Warnung, lieber rechtzeitig ihre Schulden zu begleichen.

	if (Npc_KnowsInfo(hero, Info_Mod_Daron_HabTrank))
	{
		B_LogEntry	(TOPIC_MOD_ASS_AUFNAHME, "Vermutlich ist Akahasch rauf in Richtung Leuchtturm. Er scheint Schulden zu haben. Nagur wünscht seinen Tod und bietet für den Inhalt seiner Taschen eine Belohnung.");
	};

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
	AI_Output(self, hero, "Info_Mod_Nagur_AkahaschTot_08_01"); //(erwartungsvoll) Ja?
	AI_Output(hero, self, "Info_Mod_Nagur_AkahaschTot_15_02"); //Er wird wohl leider nie wieder jemandem "beklauen" können ...
	AI_Output(self, hero, "Info_Mod_Nagur_AkahaschTot_08_03"); //Das hört sich doch schon mal viel versprechend an. Was ist mit dem Zeug das er bei sich hatte?
	AI_Output(hero, self, "Info_Mod_Nagur_AkahaschTot_15_04"); //Er hatte zum einen ...
	AI_Output(self, hero, "Info_Mod_Nagur_AkahaschTot_08_05"); //Ne, nicht im Detail ... ich will nur den Zettel als Beweis seines Ablebens.
	AI_Output(hero, self, "Info_Mod_Nagur_AkahaschTot_15_06"); //Hier ist er.

	B_GiveInvItems	(hero, self, ItWr_AkahaschNagur, 1);

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Nagur_AkahaschTot_08_07"); //Ja, da gibt es keinen Zweifel. Freiwillig hätte er dir den nicht in die Hand gedrückt.

	B_GiveInvItems	(self, hero, ItMi_Gold, 180);

	AI_Output(self, hero, "Info_Mod_Nagur_AkahaschTot_08_08"); //Bist ein guter Junge. Hier, amüsier dich etwas auf meine Rechnung.

	B_GivePlayerXP	(200);
};

INSTANCE Info_Mod_Nagur_Pickpocket (C_INFO)
{
	npc		= Mod_743_NONE_Nagur_NW;
	nr		= 1;
	condition	= Info_Mod_Nagur_Pickpocket_Condition;
	information	= Info_Mod_Nagur_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Nagur_Pickpocket_Condition()
{
	C_Beklauen	(80, ItMi_Gold, 300);
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
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Nagur_Pickpocket);
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