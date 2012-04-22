INSTANCE Info_Mod_Borka_Hi (C_INFO)
{
	npc		= Mod_563_NONE_Borka_NW;
	nr		= 1;
	condition	= Info_Mod_Borka_Hi_Condition;
	information	= Info_Mod_Borka_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Borka_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Borka_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Borka_Hi_11_00"); //Tritt ein Fremder, hier werden deine wildesten Träume und Phantasien erfüllt.
};

INSTANCE Info_Mod_Borka_Flugblaetter (C_INFO)
{
	npc		= Mod_563_NONE_Borka_NW;
	nr		= 1;
	condition	= Info_Mod_Borka_Flugblaetter_Condition;
	information	= Info_Mod_Borka_Flugblaetter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab hier ein Flugblatt für dich.";
};

FUNC INT Info_Mod_Borka_Flugblaetter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Auftrag_2))
	&& (Npc_HasItems(hero, MatteoFlugblaetter) >= 1)
	&& (Mod_Flugblaetter < 20)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Matteo_Flugblaetter))
	&& (Npc_KnowsInfo(hero, Info_Mod_Borka_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Borka_Flugblaetter_Info()
{
	B_Say (hero, self, "$MATTEOPAPER");

	B_GiveInvItems	(hero, self, MatteoFlugblaetter, 1);

	AI_Output(self, hero, "Info_Mod_Borka_Flugblaetter_11_01"); //Oh danke. Mal sehen ...

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Borka_Flugblaetter_11_02"); //Ah ja. Vielleicht werd ich mal bei Matteo vorbeischauen.

	Mod_Flugblaetter += 1;
};

INSTANCE Info_Mod_Borka_Aabid (C_INFO)
{
	npc		= Mod_563_NONE_Borka_NW;
	nr		= 1;
	condition	= Info_Mod_Borka_Aabid_Condition;
	information	= Info_Mod_Borka_Aabid_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich komme von Aabid und ...";
};

FUNC INT Info_Mod_Borka_Aabid_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Borka_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Aabid_Aufgabe))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Borka_Aabid_Info()
{
	AI_Output(hero, self, "Info_Mod_Borka_Aabid_15_00"); //Ich komme von Aabid und ...
	AI_Output(self, hero, "Info_Mod_Borka_Aabid_11_01"); //(seufzt) Der Kerl schon wieder.
	AI_Output(hero, self, "Info_Mod_Borka_Aabid_15_02"); //Was ist damit?
	AI_Output(self, hero, "Info_Mod_Borka_Aabid_11_03"); //Dauernd will er, dass ich ihm sein Paket vor die Stadt bringe, aber ich habe keine Lust dazu. Kannst du ihm das mal ausrichten?
	AI_Output(hero, self, "Info_Mod_Borka_Aabid_15_04"); //Ich bin eigentlich gekommen, um das Paket abzuholen.
	AI_Output(self, hero, "Info_Mod_Borka_Aabid_11_05"); //(lacht) Aabid ist 'ne faule Sau. Hier hast du das Paket.

	B_GiveInvItems	(self, hero, ItMi_HerbPaket, 1);

	AI_Output(hero, self, "Info_Mod_Borka_Aabid_15_06"); //(verwundert) Einfach so?
	AI_Output(self, hero, "Info_Mod_Borka_Aabid_11_07"); //Es ist schon bezahlt worden. Bring Aabid das Paket und schöne Grüße, das nächste mal soll er selber kommen.
	AI_Output(hero, self, "Info_Mod_Borka_Aabid_15_08"); //Na gut, werde ich machen.

	B_LogEntry	(TOPIC_MOD_ASS_AABID_PAKET, "Das Paket von Borka habe ich bekommen, und das ohne bezahlen zu müssen.");

	B_GivePlayerXP	(50);
};

INSTANCE Info_Mod_Borka_SchutzgeldErpresser (C_INFO)
{
	npc		= Mod_563_NONE_Borka_NW;
	nr		= 1;
	condition	= Info_Mod_Borka_SchutzgeldErpresser_Condition;
	information	= Info_Mod_Borka_SchutzgeldErpresser_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Borka_SchutzgeldErpresser_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Whistler_NW_WasGeht))
	&& (Npc_KnowsInfo(hero, Info_Mod_Borka_Hi))
	&& (Wld_IsTime(23,00,01,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Borka_SchutzgeldErpresser_Info()
{
	AI_Output(self, hero, "Info_Mod_Borka_SchutzgeldErpresser_11_00"); //Hast du das Geld?
	AI_Output(hero, self, "Info_Mod_Borka_SchutzgeldErpresser_15_01"); //Vergiss es! Sag mir sofort, wer dich schickt, oder du wirst dir wünschen, deine Geburt nicht überlebt zu haben!
	AI_Output(self, hero, "Info_Mod_Borka_SchutzgeldErpresser_11_02"); //Du willst Ärger? Den kannst du gerne bekommen.

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_NONE, 0);
};

INSTANCE Info_Mod_Borka_Umgehauen (C_INFO)
{
	npc		= Mod_563_NONE_Borka_NW;
	nr		= 1;
	condition	= Info_Mod_Borka_Umgehauen_Condition;
	information	= Info_Mod_Borka_Umgehauen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Borka_Umgehauen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Borka_SchutzgeldErpresser))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Borka_Umgehauen_Info()
{
	if (self.aivar[AIV_LastPlayerAR] == AR_NONE) //Kampf aus Dialog heraus.
	{
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output(self, hero, "Info_Mod_Borka_Umgehauen_04_00"); //Mannomann! Du hast ja 'nen ganz schönen Schlag drauf.
			AI_Output(hero, self, "Info_Mod_Borka_Umgehauen_15_02"); //Willst du mir jetzt sagen, wer dich schickt?
			AI_Output(self, hero, "Info_Mod_Borka_Umgehauen_04_03"); //Ist ja schon gut, keine Aufregung. Bromor schickt mich, er will, dass wir euren Laden zertrümmern und Geld von euch kassieren.
			AI_Output(hero, self, "Info_Mod_Borka_Umgehauen_15_04"); //Warum will er das?
			AI_Output(self, hero, "Info_Mod_Borka_Umgehauen_04_05"); //Er mag die Sträflinge nicht und will sie deshalb nicht hier im Hafenviertel haben.
			AI_Output(hero, self, "Info_Mod_Borka_Umgehauen_15_06"); //So, das wird Lord Andre sicher interessieren.
			AI_Output(self, hero, "Info_Mod_Borka_Umgehauen_04_07"); //Die Stadtwache interessiert sich nicht für eure Probleme.
			AI_Output(hero, self, "Info_Mod_Borka_Umgehauen_15_08"); //Gut, dann weiß ich, was ich wissen wollte. Und jetzt verschwinde, bevor du noch eine aufs Maul bekommst.
			AI_Output(self, hero, "Info_Mod_Borka_Umgehauen_04_09"); //Schon gut, schon gut, ich bin schon weg.

			AI_StopProcessInfos	(self);

			B_StartOtherRoutine	(self, "FLEETOBORDELL");

			Mod_AL_BorkaAusgequetscht	=	1;

			B_LogEntry	(TOPIC_MOD_AL_LAGERHAUS, "Es war Borka. Er arbeitet für Bromor, der uns Sträflinge nicht zu mögen scheint. Das sollte ich Whistler erzählen.");
		}
		else if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
		{
			AI_Output(self, hero, "Info_Mod_Borka_Umgehauen_04_01"); //Tja, das war wohl nichts.

			AI_StopProcessInfos	(self);

			B_StartOtherRoutine	(self, "START");
		};
							
		// ------ In jedem Fall: Arena-Kampf abgeschlossen ------
		self.aivar[AIV_ArenaFight] = AF_NONE;
		
		// ------ AIVAR resetten! ------	
		self.aivar[AIV_LastFightComment] = TRUE;
	};
};

INSTANCE Info_Mod_Borka_Lucy (C_INFO)
{
	npc		= Mod_563_NONE_Borka_NW;
	nr		= 1;
	condition	= Info_Mod_Borka_Lucy_Condition;
	information	= Info_Mod_Borka_Lucy_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du verkaufst Sumpfkraut?";
};

FUNC INT Info_Mod_Borka_Lucy_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Borka_Hi))
	&& (Mod_Borka_Sumpfkraut == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Borka_Lucy_Info()
{
	AI_Output(hero, self, "Info_Mod_Borka_Lucy_15_00"); //Du verkaufst Sumpfkraut?
	AI_Output(self, hero, "Info_Mod_Borka_Lucy_11_01"); //Wer sagt das?
	AI_Output(hero, self, "Info_Mod_Borka_Lucy_15_02"); //Ich habe Gold.
	AI_Output(self, hero, "Info_Mod_Borka_Lucy_11_03"); //Hm ... ich hab zur Zeit fast kein Sumpfkraut mehr. Wenn du mir ein paar Stängel bringst, dann kann ich dir auch welche verkaufen.
	AI_Output(hero, self, "Info_Mod_Borka_Lucy_15_04"); //Wie viele brauchst du denn?
	AI_Output(self, hero, "Info_Mod_Borka_Lucy_11_05"); //20 sollten vorerst reichen.

	Log_CreateTopic	(TOPIC_MOD_BORKA_SUMPFKRAUT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BORKA_SUMPFKRAUT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BORKA_SUMPFKRAUT, "Borka handelt mit Sumpfkraut, hat aber fast nichts mehr auf Lager. Ich soll ihm 20 Stängel bringen, dann wird er mir in Zukunft auch Stängel verkaufen.");
};

INSTANCE Info_Mod_Borka_HabKraut (C_INFO)
{
	npc		= Mod_563_NONE_Borka_NW;
	nr		= 1;
	condition	= Info_Mod_Borka_HabKraut_Condition;
	information	= Info_Mod_Borka_HabKraut_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab die Stängel.";
};

FUNC INT Info_Mod_Borka_HabKraut_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Borka_Lucy))
	&& (Npc_HasItems(hero, ItMi_Joint) >= 20)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Borka_HabKraut_Info()
{
	AI_Output(hero, self, "Info_Mod_Borka_HabKraut_15_00"); //Ich hab die Stängel.

	B_GiveInvItems	(hero, self, ItMi_Joint, 20);

	AI_Output(self, hero, "Info_Mod_Borka_HabKraut_11_01"); //Gut, danke. Ich hab jetzt auch noch ein paar Stängel von meinen Lieferanten bekommen.
	AI_Output(hero, self, "Info_Mod_Borka_HabKraut_15_02"); //Also kann ich jetzt bei dir Sumpfkraut kaufen?
	AI_Output(self, hero, "Info_Mod_Borka_HabKraut_11_03"); //Ja.

	B_GivePlayerXP	(200);

	B_LogEntry	(TOPIC_MOD_BORKA_SUMPFKRAUT, "Ich hab Borka die Stängel gebracht. Jetzt wird er mir auch welche verkaufen.");
	B_SetTopicStatus	(TOPIC_MOD_BORKA_SUMPFKRAUT, LOG_SUCCESS);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Borka_Skinner (C_INFO)
{
	npc		= Mod_563_NONE_Borka_NW;
	nr		= 1;
	condition	= Info_Mod_Borka_Skinner_Condition;
	information	= Info_Mod_Borka_Skinner_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du Interesse an ein paar grünen Novizen?";
};

FUNC INT Info_Mod_Borka_Skinner_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skinner_Laufbursche))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Skinner_Laufbursche2))
	&& (Npc_KnowsInfo(hero, Info_Mod_Edgor_Skinner))
	&& (Npc_HasItems(hero, ItMi_Addon_Joint_01) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Borka_Skinner_Info()
{
	AI_Output(hero, self, "Info_Mod_Borka_Skinner_15_00"); //Hast du Interesse an ein paar grünen Novizen?
	AI_Output(self, hero, "Info_Mod_Borka_Skinner_07_01"); //Klar, ich nehm alles was du hast.
	AI_Output(hero, self, "Info_Mod_Borka_Skinner_15_02"); //Hier, nimm.

	B_GiveInvItems	(hero, self, ItMi_Addon_Joint_01, Npc_HasItems(hero, ItMi_Addon_Joint_01));

	AI_Output(self, hero, "Info_Mod_Borka_Skinner_07_03"); //Hier dein Gold.

	B_GiveInvItems	(self, hero, ItMi_Gold, Npc_HasItems(self, ItMi_Addon_Joint_01)*20);

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_BDT_SKINNER, "So, damit bin ich in der Stadt die ganzen grünen Novizen losgeworden.");
};

INSTANCE Info_Mod_Borka_Trade (C_INFO)
{
	npc		= Mod_563_NONE_Borka_NW;
	nr		= 1;
	condition	= Info_Mod_Borka_Trade_Condition;
	information	= Info_Mod_Borka_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Borka_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Borka_HabKraut))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Borka_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Borka_Pickpocket (C_INFO)
{
	npc		= Mod_563_NONE_Borka_NW;
	nr		= 1;
	condition	= Info_Mod_Borka_Pickpocket_Condition;
	information	= Info_Mod_Borka_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Borka_Pickpocket_Condition()
{
	C_Beklauen	(45, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_Borka_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Borka_Pickpocket);

	Info_AddChoice	(Info_Mod_Borka_Pickpocket, DIALOG_BACK, Info_Mod_Borka_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Borka_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Borka_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Borka_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Borka_Pickpocket);
};

FUNC VOID Info_Mod_Borka_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Borka_Pickpocket);
};

INSTANCE Info_Mod_Borka_EXIT (C_INFO)
{
	npc		= Mod_563_NONE_Borka_NW;
	nr		= 1;
	condition	= Info_Mod_Borka_EXIT_Condition;
	information	= Info_Mod_Borka_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Borka_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Borka_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};