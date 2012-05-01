INSTANCE Info_Mod_Meldor_Hi (C_INFO)
{
	npc		= Mod_597_NONE_Meldor_NW;
	nr		= 1;
	condition	= Info_Mod_Meldor_Hi_Condition;
	information	= Info_Mod_Meldor_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Meldor_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Meldor_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Meldor_Hi_07_01"); //Ich bin Meldor. Ich helfe Lehmar bei seinen Geldgeschäften.
};

INSTANCE Info_Mod_Meldor_Hilfe (C_INFO)
{
	npc		= Mod_597_NONE_Meldor_NW;
	nr		= 1;
	condition	= Info_Mod_Meldor_Hilfe_Condition;
	information	= Info_Mod_Meldor_Hilfe_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Meldor_Hilfe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Meldor_Hi))
	&& (Wld_GetDay() > 1)
	&& (hero.guild != GIL_PAL)
	&& (Mod_Gilde > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Meldor_Hilfe_Info()
{
	AI_Output(self, hero, "Info_Mod_Meldor_Hilfe_07_00"); //Hey du, komm mal her.
	AI_Output(hero, self, "Info_Mod_Meldor_Hilfe_15_01"); //Was ist los?
	AI_Output(self, hero, "Info_Mod_Meldor_Hilfe_07_02"); //Ich brauche dringend deine Hilfe!
	AI_Output(hero, self, "Info_Mod_Meldor_Hilfe_15_03"); //Worum geht es?
	AI_Output(self, hero, "Info_Mod_Meldor_Hilfe_07_04"); //Ich hab keine Zeit dir alles zu erzählen. Sie kommen jeden Moment. Also hilfst du mir?

	Info_ClearChoices	(Info_Mod_Meldor_Hilfe);

	Info_AddChoice	(Info_Mod_Meldor_Hilfe, "Klar, wie kann ich dir helfen?", Info_Mod_Meldor_Hilfe_Ja);
	Info_AddChoice	(Info_Mod_Meldor_Hilfe, "Nein, mach dein Zeug alleine!", Info_Mod_Meldor_Hilfe_Nein);
};

FUNC VOID Info_Mod_Meldor_Hilfe_Ja()
{
	AI_Output(hero, self, "Info_Mod_Meldor_Hilfe_Ja_15_00"); //Klar, wie kann ich dir helfen?
	AI_Output(self, hero, "Info_Mod_Meldor_Hilfe_Ja_07_01"); //Ich hab hier ein Päckchen Sumpfkraut, verstecke es sofort!

	B_GiveInvItems	(self, hero, ItMi_HerbPaket, 1);

	AI_Output(hero, self, "Info_Mod_Meldor_Hilfe_Ja_15_02"); //Warum soll ich es verstecken?
	AI_Output(self, hero, "Info_Mod_Meldor_Hilfe_Ja_07_03"); //Mach schnell, die Milizen können jeden Moment kommen.
	AI_Output(self, hero, "Info_Mod_Meldor_Hilfe_Ja_07_04"); //Irgendein Hund hat sie auf mich gesetzt, also geh.
	AI_Output(hero, self, "Info_Mod_Meldor_Hilfe_Ja_15_05"); //Wo soll ich das Päckchen verstecken?
	AI_Output(self, hero, "Info_Mod_Meldor_Hilfe_Ja_07_06"); //Es gibt hier im Hafenviertel ein Lagerhaus, versteck es dort in einer Truhe.
	AI_Output(self, hero, "Info_Mod_Meldor_Hilfe_Ja_07_07"); //Und jetzt verschwinde, bevor die Miliz da ist!

	Log_CreateTopic	(TOPIC_MOD_MELDOR_PAKET, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_MELDOR_PAKET, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_MELDOR_PAKET, "Meldor hat mir ein Päckchen Sumpfkraut gegeben. Er will, dass ich es im Lagerhaus im Hafenviertel verstecke, da ihn scheinbar jemand bei der Miliz angeschwärzt hat.");

	Info_ClearChoices	(Info_Mod_Meldor_Hilfe);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Meldor_Hilfe_Nein()
{
	AI_Output(hero, self, "Info_Mod_Meldor_Hilfe_Nein_15_00"); //Nein, mach dein Zeug alleine!
	AI_Output(self, hero, "Info_Mod_Meldor_Hilfe_Nein_07_01"); //Wie du meinst, aber du hast dir gerade eine große Chance entgehen lassen.

	Info_ClearChoices	(Info_Mod_Meldor_Hilfe);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Meldor_PaketSicher (C_INFO)
{
	npc		= Mod_597_NONE_Meldor_NW;
	nr		= 1;
	condition	= Info_Mod_Meldor_PaketSicher_Condition;
	information	= Info_Mod_Meldor_PaketSicher_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab dein Päckchen versteckt.";
};

FUNC INT Info_Mod_Meldor_PaketSicher_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Meldor_Hilfe))
	&& (Mob_HasItems("CHEST_ANDRE_WAREHOUSE_PACKET", ItMi_HerbPaket) == 1)
	&& (Mod_MeldorVerpfiffen == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Meldor_PaketSicher_Info()
{
	AI_Output(hero, self, "Info_Mod_Meldor_PaketSicher_15_00"); //Ich hab dein Päckchen versteckt.
	AI_Output(hero, self, "Info_Mod_Meldor_PaketSicher_15_01"); //Sagst du mir jetzt, was es damit auf sich hat?
	AI_Output(self, hero, "Info_Mod_Meldor_PaketSicher_07_02"); //Na gut ... in letzer Zeit hat mir die Miliz öfters aufgelauert. Sie glauben, dass ich hinter dem vielen Sumpfkraut stecke.
	AI_Output(hero, self, "Info_Mod_Meldor_PaketSicher_15_03"); //Steckst du doch auch.
	AI_Output(self, hero, "Info_Mod_Meldor_PaketSicher_07_04"); //Ja, aber das wissen nur sehr wenige und schon gar nicht die Miliz.
	AI_Output(hero, self, "Info_Mod_Meldor_PaketSicher_15_05"); //Von welchem Hund hast du vorhin gesprochen?
	AI_Output(self, hero, "Info_Mod_Meldor_PaketSicher_07_06"); //Wie bereits gesagt, das wissen nur die wenigsten und irgendeiner in der Kaserne weiß zu viel.
	AI_Output(self, hero, "Info_Mod_Meldor_PaketSicher_07_07"); //Bevor ich es vergesse: Du hast mir den Arsch gerettet. Die Miliz war bei mir und hat mich nach Sumpfkraut durchsucht.
	AI_Output(self, hero, "Info_Mod_Meldor_PaketSicher_07_08"); //Die werden auch immer dreister. Wie auch immer, du bist ein anständiger Kerl und aus dir kann noch was werden!
	AI_Output(hero, self, "Info_Mod_Meldor_PaketSicher_15_09"); //Was meinst du damit?
	AI_Output(self, hero, "Info_Mod_Meldor_PaketSicher_07_10"); //Wenn du willst, kann ich dich meinem Chef vorstellen. Könnte ein gutes Wort für dich einlegen.
	AI_Output(hero, self, "Info_Mod_Meldor_PaketSicher_15_11"); //Gut, und wo ist dein Boss?
	AI_Output(self, hero, "Info_Mod_Meldor_PaketSicher_07_12"); //Am besten gehst du alleine, ich bin viel zu auffällig. Geh zum schlafenden Geldsack, in der Nähe der Kaserne.
	AI_Output(self, hero, "Info_Mod_Meldor_PaketSicher_07_13"); //Sag Hanna, dass Sumpfkrautmeldor dich schickt.
	AI_Output(hero, self, "Info_Mod_Meldor_PaketSicher_15_14"); //Gut, ich werde es machen.

	B_SetTopicStatus	(TOPIC_MOD_MELDOR_PAKET, LOG_SUCCESS);

	B_GivePlayerXP	(200);

	B_Göttergefallen(3, 1);

	Log_CreateTopic	(TOPIC_MOD_MELDOR_HANNA, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_MELDOR_HANNA, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_MELDOR_HANNA, "Meldor will ein gutes Wort für mich bei seinem Chef einlegen. Ich soll mit Hanna im 'Schlafenden Geldsack' sprechen.");
};

INSTANCE Info_Mod_Meldor_Mortis (C_INFO)
{
	npc		= Mod_597_NONE_Meldor_NW;
	nr		= 1;
	condition	= Info_Mod_Meldor_Mortis_Condition;
	information	= Info_Mod_Meldor_Mortis_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab gehört, du versuchst ein Geschäft abzuschließen?";
};

FUNC INT Info_Mod_Meldor_Mortis_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_NewsMilizDead))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Meldor_Mortis_Info()
{
	AI_Output(hero, self, "Info_Mod_Meldor_Mortis_15_00"); //Ich hab gehört du versuchst ein Geschäft abzuschließen?
	AI_Output(self, hero, "Info_Mod_Meldor_Mortis_07_01"); //Verflucht, woher weißt du das?
	AI_Output(hero, self, "Info_Mod_Meldor_Mortis_15_02"); //Mortis, der Schmied der Kaserne, hat davon gewusst.
	AI_Output(self, hero, "Info_Mod_Meldor_Mortis_07_03"); //Was? Er war es?
	AI_Output(hero, self, "Info_Mod_Meldor_Mortis_15_04"); //Ja, so siehts aus.
	AI_Output(self, hero, "Info_Mod_Meldor_Mortis_07_05"); //Ich wünschte mir, er würde wegen Sumpfkraut in den Knast wandern.
	AI_Output(self, hero, "Info_Mod_Meldor_Mortis_07_06"); //Kannst du das nicht für mich machen?
	AI_Output(hero, self, "Info_Mod_Meldor_Mortis_15_07"); //Woher bekomm ich ein Sumpfkrautpäckchen?
	AI_Output(self, hero, "Info_Mod_Meldor_Mortis_07_08"); //Ich hab momentan keine mehr, versuch irgendwo eins aufzutreiben.
	AI_Output(hero, self, "Info_Mod_Meldor_Mortis_15_11"); //Ich werd mein Bestes geben.

	B_LogEntry	(TOPIC_MOD_DIEB_ANDRE_MELDOR, "Ich habe Meldor gewarnt. Er will, dass ich Mortis ein Kraut - Paket unterjuble. Am besten lege ich es in seiner Truhe in der Milizschmiede ab.");
};

INSTANCE Info_Mod_Meldor_WacholderDieb (C_INFO)
{
	npc		= Mod_597_NONE_Meldor_NW;
	nr		= 1;
	condition	= Info_Mod_Meldor_WacholderDieb_Condition;
	information	= Info_Mod_Meldor_WacholderDieb_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hey du!";
};

FUNC INT Info_Mod_Meldor_WacholderDieb_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Meldor_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Coragon_WhatHappened))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Meldor_WacholderDieb_Info()
{
	AI_Output(hero, self, "Info_Mod_Meldor_WacholderDieb_15_00"); //Hey du!
	AI_Output(self, hero, "Info_Mod_Meldor_WacholderDieb_07_01"); //Was willst du, Kleiner?
	AI_Output(hero, self, "Info_Mod_Meldor_WacholderDieb_15_02"); //Weißt du etwas über den Diebstahl bei Coragon!
	AI_Output(self, hero, "Info_Mod_Meldor_WacholderDieb_07_03"); //Woher denn? Wenn du nach Beweisen suchst, befrage mal die Konkurrenten von Coragon. Damit meine ich Kardif und den Wirt des Freibierstandes.
	AI_Output(hero, self, "Info_Mod_Meldor_WacholderDieb_15_04"); //Danke für den Tipp!

	B_LogEntry	(TOPIC_MOD_CORAGON_WACHOLDER, "Meldor gab mir den Tipp mich bei Kardif und dem Wirt des Freibierstandes umzuhören, da sie die Konkurrenten von Coragon sind.");
};

INSTANCE Info_Mod_Meldor_Aabid (C_INFO)
{
	npc		= Mod_597_NONE_Meldor_NW;
	nr		= 1;
	condition	= Info_Mod_Meldor_Aabid_Condition;
	information	= Info_Mod_Meldor_Aabid_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich komme von Aabid.";
};

FUNC INT Info_Mod_Meldor_Aabid_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Meldor_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Aabid_Aufgabe))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Meldor_Aabid_Info()
{
	AI_Output(hero, self, "Info_Mod_Meldor_Aabid_15_00"); //Ich komme von Aabid.
	AI_Output(self, hero, "Info_Mod_Meldor_Aabid_07_01"); //(überrascht) Wem?
	AI_Output(hero, self, "Info_Mod_Meldor_Aabid_15_02"); //Aabid, ein Mann, der bei dir ein Sumpfkrautpaket bestellt hatte. Er fragt sich, wo seine Bestellung bleibt.
	AI_Output(self, hero, "Info_Mod_Meldor_Aabid_07_03"); //Achso, der Kerl. Den hab' ich ja ganz vergessen.
	AI_Output(hero, self, "Info_Mod_Meldor_Aabid_15_04"); //Hab ich's mir doch gedacht. Kannst du mir das Paket geben, damit ich es ihm bringen kann?
	AI_Output(self, hero, "Info_Mod_Meldor_Aabid_07_05"); //Klar, aber nur für den Preis von 150 Goldmünzen.
};

INSTANCE Info_Mod_Meldor_AabidPaket (C_INFO)
{
	npc		= Mod_597_NONE_Meldor_NW;
	nr		= 1;
	condition	= Info_Mod_Meldor_AabidPaket_Condition;
	information	= Info_Mod_Meldor_AabidPaket_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier hast du die Münzen.";
};

FUNC INT Info_Mod_Meldor_AabidPaket_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Meldor_Aabid))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 150)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Meldor_AabidPaket_Info()
{
	AI_Output(hero, self, "Info_Mod_Meldor_AabidPaket_15_00"); //Hier hast du die Münzen.

	B_GiveInvItems	(hero, self, ItMi_Gold, 150);

	AI_Output(self, hero, "Info_Mod_Meldor_AabidPaket_07_01"); //(grinst) Alles klar, hier ist dein Paket.

	B_GiveInvItems	(self, hero, ItMi_HerbPaket, 1);

	B_LogEntry	(TOPIC_MOD_ASS_AABID_PAKET, "Ich habe Meldor besucht und für 150 Goldmünzen Aabid's Paket erhalten.");

	B_GivePlayerXP	(50);
};

INSTANCE Info_Mod_Meldor_Skinner (C_INFO)
{
	npc		= Mod_597_NONE_Meldor_NW;
	nr		= 1;
	condition	= Info_Mod_Meldor_Skinner_Condition;
	information	= Info_Mod_Meldor_Skinner_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du Interesse an ein paar grünen Novizen?";
};

FUNC INT Info_Mod_Meldor_Skinner_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skinner_Laufbursche))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Skinner_Laufbursche2))
	&& (Npc_KnowsInfo(hero, Info_Mod_Edgor_Skinner))
	&& (Npc_HasItems(hero, ItMi_Addon_Joint_01) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Meldor_Skinner_Info()
{
	AI_Output(hero, self, "Info_Mod_Meldor_Skinner_15_00"); //Hast du Interesse an ein paar grünen Novizen?
	AI_Output(self, hero, "Info_Mod_Meldor_Skinner_07_01"); //Klar, ich nehm alles was du hast.
	AI_Output(hero, self, "Info_Mod_Meldor_Skinner_15_02"); //Hier, nimm.

	B_GiveInvItems	(hero, self, ItMi_Addon_Joint_01, Npc_HasItems(hero, ItMi_Addon_Joint_01));

	AI_Output(self, hero, "Info_Mod_Meldor_Skinner_07_03"); //Hier dein Gold.

	B_GiveInvItems	(self, hero, ItMi_Gold, Npc_HasItems(self, ItMi_Addon_Joint_01)*20);

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_BDT_SKINNER, "So, damit bin ich in der Stadt die ganzen grünen Novizen losgeworden.");
};

INSTANCE Info_Mod_Meldor_Flugblaetter (C_INFO)
{
	npc		= Mod_597_NONE_Meldor_NW;
	nr		= 1;
	condition	= Info_Mod_Meldor_Flugblaetter_Condition;
	information	= Info_Mod_Meldor_Flugblaetter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab hier ein Flugblatt für dich.";
};

FUNC INT Info_Mod_Meldor_Flugblaetter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Auftrag_2))
	&& (Npc_HasItems(hero, MatteoFlugblaetter) >= 1)
	&& (Mod_Flugblaetter < 20)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Matteo_Flugblaetter))
	&& (Npc_KnowsInfo(hero, Info_Mod_Meldor_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Meldor_Flugblaetter_Info()
{
	B_Say (hero, self, "$MATTEOPAPER");

	AI_Output(self, hero, "Info_Mod_Meldor_Flugblaetter_07_01"); //Was interessiert mich das? Kann sich seine Flugblätter sonst wohin stecken ...
};

INSTANCE Info_Mod_Meldor_LobartAlwinScene (C_INFO)
{
	npc		= Mod_597_NONE_Meldor_NW;
	nr		= 1;
	condition	= Info_Mod_Meldor_LobartAlwinScene_Condition;
	information	= Info_Mod_Meldor_LobartAlwinScene_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Meldor_LobartAlwinScene_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alwin_LobartScene))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Meldor_LobartAlwinScene_Info()
{
	AI_Output(self, hero, "Info_Mod_Meldor_LobartAlwinScene_07_00"); //Du solltest weniger trinken.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Meldor_Pickpocket (C_INFO)
{
	npc		= Mod_597_NONE_Meldor_NW;
	nr		= 1;
	condition	= Info_Mod_Meldor_Pickpocket_Condition;
	information	= Info_Mod_Meldor_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20;
};

FUNC INT Info_Mod_Meldor_Pickpocket_Condition()
{
	C_Beklauen	(20, ItMi_Gold, 50);
};

FUNC VOID Info_Mod_Meldor_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Meldor_Pickpocket);

	Info_AddChoice	(Info_Mod_Meldor_Pickpocket, DIALOG_BACK, Info_Mod_Meldor_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Meldor_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Meldor_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Meldor_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Meldor_Pickpocket);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Aabid_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Aabid_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Aabid_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Meldor_EXIT (C_INFO)
{
	npc		= Mod_597_NONE_Meldor_NW;
	nr		= 1;
	condition	= Info_Mod_Meldor_EXIT_Condition;
	information	= Info_Mod_Meldor_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Meldor_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Meldor_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};