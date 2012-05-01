INSTANCE Info_Mod_Irmgard_Hi (C_INFO)
{
	npc		= Mod_7725_OUT_Irmgard_REL;
	nr		= 1;
	condition	= Info_Mod_Irmgard_Hi_Condition;
	information	= Info_Mod_Irmgard_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Eigentlich willst du doch schon lange hier raus, oder?";
};

FUNC INT Info_Mod_Irmgard_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hedwig_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Irmgard_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Irmgard_Hi_15_00"); //Eigentlich willst du doch schon lange hier raus, oder?
	AI_Output(self, hero, "Info_Mod_Irmgard_Hi_17_01"); //(seufzt) Liebend gern. Wie kann man sich nur freiwillig in dieser Räuberhöhle aufhalten? Da oben in der Ecke ... Spinnweben!
	AI_Output(self, hero, "Info_Mod_Irmgard_Hi_17_02"); //Aber Hedwig sagt, das ist der einzige Weg, dass sich unsere Männer ändern. Und ich will, dass sich mein Mann ändert.
};

INSTANCE Info_Mod_Irmgard_Kneipe (C_INFO)
{
	npc		= Mod_7725_OUT_Irmgard_REL;
	nr		= 1;
	condition	= Info_Mod_Irmgard_Kneipe_Condition;
	information	= Info_Mod_Irmgard_Kneipe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hätte einen Vorschlag für dich.";
};

FUNC INT Info_Mod_Irmgard_Kneipe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Irmgard_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Irmgard_Kneipe_Info()
{
	AI_Output(hero, self, "Info_Mod_Irmgard_Kneipe_15_00"); //Ich hätte einen Vorschlag für dich.
	AI_Output(hero, self, "Info_Mod_Irmgard_Kneipe_15_01"); //Wenn ich verspreche, ich sorge dafür, dass sich dein Wunsch erfüllt - würdest du mir dann helfen, Hedwig und Berta hier herauszubekommen?
	AI_Output(self, hero, "Info_Mod_Irmgard_Kneipe_17_02"); //Na, ich weiß nicht. Hedwig wird nicht so einfach aufgeben.
	AI_Output(hero, self, "Info_Mod_Irmgard_Kneipe_15_03"); //Es wird doch wohl eine Möglichkeit geben, sie aus dem Gasthaus zu locken?
	AI_Output(self, hero, "Info_Mod_Irmgard_Kneipe_17_04"); //Mir fällt da nichts ein.
	AI_Output(hero, self, "Info_Mod_Irmgard_Kneipe_15_05"); //Denk doch mal nach. Was müsste passieren, damit Hedwig das Haus verlassen würde?
	AI_Output(self, hero, "Info_Mod_Irmgard_Kneipe_17_06"); //Na ja, sie liebt Schafe über alles. Wenn sie eines sieht, läuft sie immer sofort hin und streichelt es.
	AI_Output(hero, self, "Info_Mod_Irmgard_Kneipe_15_07"); //Das ist doch mal ein Anfang. Das Schaf müsste dann, bevor Hedwig es erreicht, flüchten.
	AI_Output(hero, self, "Info_Mod_Irmgard_Kneipe_15_08"); //So könnten wir dafür sorgen, dass sie sich aus dem Gasthaus entfernt.
	AI_Output(self, hero, "Info_Mod_Irmgard_Kneipe_17_09"); //Und dann?
	AI_Output(hero, self, "Info_Mod_Irmgard_Kneipe_15_10"); //Dann müsste sie zu Anselm gelockt werden, damit die beiden sich mal aussprechen können.
	AI_Output(hero, self, "Info_Mod_Irmgard_Kneipe_15_11"); //Die beiden werden sich doch irgendwie einigen können.
	AI_Output(self, hero, "Info_Mod_Irmgard_Kneipe_17_12"); //Nicht unbedingt.
	AI_Output(hero, self, "Info_Mod_Irmgard_Kneipe_15_13"); //Lass es uns probieren.
	AI_Output(self, hero, "Info_Mod_Irmgard_Kneipe_17_14"); //Woher nehmen wir das Schaf und bringen es dazu, das zu tun, was wir wollen?
	AI_Output(hero, self, "Info_Mod_Irmgard_Kneipe_15_15"); //Ich könnte mich ja verwandeln ...
	AI_Output(hero, self, "Info_Mod_Irmgard_Kneipe_15_16"); //Woher kann ich denn hier Verwandlungsspruchrollen bekommen?
	AI_Output(self, hero, "Info_Mod_Irmgard_Kneipe_17_17"); //Versuch's auf dem Marktplatz bei Daniel oder im Haus der Feuermagier.
	AI_Output(hero, self, "Info_Mod_Irmgard_Kneipe_15_18"); //Gut. Bist du dabei?
	AI_Output(self, hero, "Info_Mod_Irmgard_Kneipe_17_19"); //Na schön.
	AI_Output(hero, self, "Info_Mod_Irmgard_Kneipe_15_20"); //Dann bis später!

	B_LogEntry	(TOPIC_MOD_DITMAR_DICKELUFT, "Hedwig liebt Schafe über alles, deshalb mein Plan, mich in eines zu verwandeln und sie zu Anselm zu locken, damit die beiden sich aussprechen. Eine Verwandlungsspruchrolle bekomme ich vielleicht bei Daniel auf dem Marktplatz oder im Haus der Feuermagier.");
};

INSTANCE Info_Mod_Irmgard_Kneipe2 (C_INFO)
{
	npc		= Mod_7725_OUT_Irmgard_REL;
	nr		= 1;
	condition	= Info_Mod_Irmgard_Kneipe2_Condition;
	information	= Info_Mod_Irmgard_Kneipe2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hedwig hat die Aktion abgeblasen.";
};

FUNC INT Info_Mod_Irmgard_Kneipe2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Anselm_DickeLuft2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Irmgard_Kneipe2_Info()
{
	AI_Output(hero, self, "Info_Mod_Irmgard_Kneipe2_15_00"); //Hedwig hat die Aktion abgeblasen.
	AI_Output(self, hero, "Info_Mod_Irmgard_Kneipe2_17_01"); //(skeptisch) Sie hat sich umstimmen lassen? Das passt ja gar nicht zu ihr.
	AI_Output(hero, self, "Info_Mod_Irmgard_Kneipe2_15_02"); //Anselms und meinen guten Argumenten hatte sie dann doch nichts entgegenzusetzen.
	AI_Output(hero, self, "Info_Mod_Irmgard_Kneipe2_15_03"); //Du kannst also gehen. Und nimm Berta gleich mit.
	AI_Output(self, hero, "Info_Mod_Irmgard_Kneipe2_17_04"); //Ja, die Gute wird erst mal ordentlich ausschlafen müssen.
	AI_Output(self, hero, "Info_Mod_Irmgard_Kneipe2_17_05"); //Und ich rede heute noch meinem Mann ins Gewissen.
	AI_Output(hero, self, "Info_Mod_Irmgard_Kneipe2_15_06"); //Soll ich dir dabei helfen?
	AI_Output(self, hero, "Info_Mod_Irmgard_Kneipe2_17_07"); //Nein, ich glaube doch nicht, dass das eine gute Idee wäre. Aber trotzdem nett von dir, dass du uns geholfen hast.

	CurrentNQ += 1;

	B_SetTopicStatus	(TOPIC_MOD_DITMAR_DICKELUFT, LOG_SUCCESS);

	Mod_Irmgard_Tag = Wld_GetDay();

	B_GivePlayerXP	(100);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "HEIM");
	B_StartOtherRoutine	(Mod_7724_OUT_Berta_REL, "HEIM");
};

INSTANCE Info_Mod_Irmgard_Kneipe3 (C_INFO)
{
	npc		= Mod_7725_OUT_Irmgard_REL;
	nr		= 1;
	condition	= Info_Mod_Irmgard_Kneipe3_Condition;
	information	= Info_Mod_Irmgard_Kneipe3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie ist das Gespräch mit deinem Mann gelaufen?";
};

FUNC INT Info_Mod_Irmgard_Kneipe3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Irmgard_Kneipe2))
	&& (Wld_GetDay() > Mod_Irmgard_Tag)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Irmgard_Kneipe3_Info()
{
	AI_Output(hero, self, "Info_Mod_Irmgard_Kneipe3_15_00"); //Wie ist das Gespräch mit deinem Mann gelaufen?
	AI_Output(self, hero, "Info_Mod_Irmgard_Kneipe3_17_01"); //Wir haben einen guten Kompromiss gefunden: Er hat angeboten, etwas mehr zu arbeiten, damit wir uns eine Haushälterin leisten können.
	AI_Output(hero, self, "Info_Mod_Irmgard_Kneipe3_15_02"); //Na dann ...
};

INSTANCE Info_Mod_Irmgard_Pickpocket (C_INFO)
{
	npc		= Mod_7725_OUT_Irmgard_REL;
	nr		= 1;
	condition	= Info_Mod_Irmgard_Pickpocket_Condition;
	information	= Info_Mod_Irmgard_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80_Female;
};

FUNC INT Info_Mod_Irmgard_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Irmgard_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Irmgard_Pickpocket);

	Info_AddChoice	(Info_Mod_Irmgard_Pickpocket, DIALOG_BACK, Info_Mod_Irmgard_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Irmgard_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Irmgard_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Irmgard_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Irmgard_Pickpocket);
};

FUNC VOID Info_Mod_Irmgard_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Irmgard_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Irmgard_Pickpocket);

		Info_AddChoice	(Info_Mod_Irmgard_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Irmgard_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Irmgard_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Irmgard_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Irmgard_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Irmgard_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Irmgard_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Irmgard_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Irmgard_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Irmgard_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Irmgard_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Irmgard_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Irmgard_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Irmgard_EXIT (C_INFO)
{
	npc		= Mod_7725_OUT_Irmgard_REL;
	nr		= 1;
	condition	= Info_Mod_Irmgard_EXIT_Condition;
	information	= Info_Mod_Irmgard_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Irmgard_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Irmgard_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};