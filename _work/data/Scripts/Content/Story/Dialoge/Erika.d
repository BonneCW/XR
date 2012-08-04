INSTANCE Info_Mod_Erika_Hi (C_INFO)
{
	npc		= Mod_7381_OUT_Erika_REL;
	nr		= 1;
	condition	= Info_Mod_Erika_Hi_Condition;
	information	= Info_Mod_Erika_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Erika_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Erika_Hi_Info()
{
	B_Say	(hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Erika_Hi_16_01"); //Ich bin Händlerin. Ich verkaufe alles, was du im Alltag brauchst.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_KHORATA, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_KHORATA, "Erika handelt auf dem Marktplatz mit Gebrauchsgegenständen.");
};

INSTANCE Info_Mod_Erika_Landvermessung (C_INFO)
{
	npc		= Mod_7381_OUT_Erika_REL;
	nr		= 1;
	condition	= Info_Mod_Erika_Landvermessung_Condition;
	information	= Info_Mod_Erika_Landvermessung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Weißt du, was Hubert mit seinem Fusel meint?";
};

FUNC INT Info_Mod_Erika_Landvermessung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erika_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Hubert_Landvermessung))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Hubert_LandvermessungAlk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erika_Landvermessung_Info()
{
	AI_Output(hero, self, "Info_Mod_Erika_Landvermessung_15_00"); //Weißt du, was Hubert mit seinem Fusel meint?
	AI_Output(self, hero, "Info_Mod_Erika_Landvermessung_16_01"); //(resolut) Aber sicher doch! Gestern erst habe ich ihm verboten, bei mir Alkohol zu kaufen. Der Mann säuft sich tot!

	Info_ClearChoices	(Info_Mod_Erika_Landvermessung);

	Info_AddChoice	(Info_Mod_Erika_Landvermessung, "Na gut, dann suche ich woanders ...", Info_Mod_Erika_Landvermessung_B);
	Info_AddChoice	(Info_Mod_Erika_Landvermessung, "Kann ich seinen Alkohol haben?", Info_Mod_Erika_Landvermessung_A);
};

FUNC VOID Info_Mod_Erika_Landvermessung_B()
{
	AI_Output(hero, self, "Info_Mod_Erika_Landvermessung_B_15_00"); //Na gut, dann suche ich woanders ...

	Info_ClearChoices	(Info_Mod_Erika_Landvermessung);
};

FUNC VOID Info_Mod_Erika_Landvermessung_A()
{
	AI_Output(hero, self, "Info_Mod_Erika_Landvermessung_A_15_00"); //Kann ich seinen Alkohol haben?
	AI_Output(self, hero, "Info_Mod_Erika_Landvermessung_A_16_01"); //(ironisch) Natürlich! Nein, das ist nicht möglich. Ich habe alle alkoholischen Waren bei mir zu Hause in einer Truhe versteckt, damit Hubert keine Möglichkeit hat, an sie zu gelangen.

	Info_ClearChoices	(Info_Mod_Erika_Landvermessung);

	Info_AddChoice	(Info_Mod_Erika_Landvermessung, "Schade, da kann man nichts machen.", Info_Mod_Erika_Landvermessung_D);
	Info_AddChoice	(Info_Mod_Erika_Landvermessung, "Und welches Haus gehört dir?", Info_Mod_Erika_Landvermessung_C);
};

FUNC VOID Info_Mod_Erika_Landvermessung_D()
{
	AI_Output(hero, self, "Info_Mod_Erika_Landvermessung_D_15_00"); //Schade, da kann man nichts machen.

	Info_ClearChoices	(Info_Mod_Erika_Landvermessung);
};

FUNC VOID Info_Mod_Erika_Landvermessung_C()
{
	AI_Output(hero, self, "Info_Mod_Erika_Landvermessung_C_15_00"); //Und welches Haus gehört dir?
	AI_Output(self, hero, "Info_Mod_Erika_Landvermessung_C_16_01"); //Es liegt am großen See in dieser Stadt, nicht weit hier vom Marktplatz. Aber sag mal ... warum willst du das so genau wissen?
	AI_Output(hero, self, "Info_Mod_Erika_Landvermessung_C_15_02"); //Niemand versteht die einsamen Helden ...

	B_LogEntry	(TOPIC_MOD_KHORATA_LANDVERMESSUNG, "Die Händlerin Erika hat ihren Alkoholvorrat in einer Truhe in ihrem Haus am städtischen See gelagert.");

	Info_ClearChoices	(Info_Mod_Erika_Landvermessung);
};

INSTANCE Info_Mod_Erika_Nagelnachschub (C_INFO)
{
	npc		= Mod_7381_OUT_Erika_REL;
	nr		= 1;
	condition	= Info_Mod_Erika_Nagelnachschub_Condition;
	information	= Info_Mod_Erika_Nagelnachschub_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Ich suche nach Nägeln.";
};                       

FUNC INT Info_Mod_Erika_Nagelnachschub_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lukas_Wettstreit))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Erika_Nagelnachschub_Info()
{
	AI_Output(hero, self, "Info_Mod_Erika_Nagelnachschub_15_00"); //Ich suche nach Nägeln.
	AI_Output(self, hero, "Info_Mod_Erika_Nagelnachschub_16_01"); //Du willst doch nicht etwa heute Abend nageln?
	AI_Output(hero, self, "Info_Mod_Erika_Nagelnachschub_15_02"); //Ähm ...
	AI_Output(self, hero, "Info_Mod_Erika_Nagelnachschub_16_03"); //Ja, ja, immer die Nachtruhe anderer Menschen stören!
	AI_Output(self, hero, "Info_Mod_Erika_Nagelnachschub_16_04"); //Wofür gibt es eigentlich Gesetze, die das untersagen?
	AI_Output(hero, self, "Info_Mod_Erika_Nagelnachschub_15_05"); //Ich brauche die Nägel ja nicht selbst.
	AI_Output(self, hero, "Info_Mod_Erika_Nagelnachschub_16_06"); //Immerhin.
	AI_Output(hero, self, "Info_Mod_Erika_Nagelnachschub_15_07"); //Hast du denn welche?
	AI_Output(self, hero, "Info_Mod_Erika_Nagelnachschub_16_08"); //Ja. Für einen kleinen Gefallen würde ich dir ein Paket überlassen.
	AI_Output(hero, self, "Info_Mod_Erika_Nagelnachschub_15_09"); //Was ist das für ein Gefallen?
	AI_Output(self, hero, "Info_Mod_Erika_Nagelnachschub_16_10"); //Bring Wendel diesen Brief von mir. (kichert mädchenhaft)

	B_GiveInvItems	(self, hero, ItWr_ErikaLiebesbrief, 1);

	B_LogEntry	(TOPIC_MOD_KHORATA_NAGELNACHSCHUB, "Erika hat mir einen Brief für Wendel mitgegeben.");
};

INSTANCE Info_Mod_Erika_Nagelnachschub2 (C_INFO)
{
	npc		= Mod_7381_OUT_Erika_REL;
	nr		= 1;
	condition	= Info_Mod_Erika_Nagelnachschub2_Condition;
	information	= Info_Mod_Erika_Nagelnachschub2_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Dein Brief hat das Ziel erreicht.";
};                       

FUNC INT Info_Mod_Erika_Nagelnachschub2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wendel_Nagelnachschub))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Erika_Nagelnachschub2_Info()
{
	AI_Output(hero, self, "Info_Mod_Erika_Nagelnachschub2_15_00"); //Dein Brief hat das Ziel erreicht.
	AI_Output(self, hero, "Info_Mod_Erika_Nagelnachschub2_16_01"); //(aufgeregt) Ich bin gespannt, was er dazu sagt.
	AI_Output(self, hero, "Info_Mod_Erika_Nagelnachschub2_16_02"); //Da hast du die Nägel, aber lass dir bloß nicht einfallen, nachts herumzuhämmern!

	B_GiveInvItems	(self, hero, ItMi_Nagelpaket, 1);

	B_GivePlayerXP	(50);
};

INSTANCE Info_Mod_Erika_Kissen (C_INFO)
{
	npc		= Mod_7381_OUT_Erika_REL;
	nr		= 1;
	condition	= Info_Mod_Erika_Kissen_Condition;
	information	= Info_Mod_Erika_Kissen_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Hast du vielleicht so was wie ein Polster für den Kopf?";
};                       

FUNC INT Info_Mod_Erika_Kissen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erika_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Malik_Aufgabe))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Morpheus_Kissen))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Erika_Kissen_Info()
{
	AI_Output(hero, self, "Info_Mod_Erika_Kissen_15_00"); //Hast du vielleicht so was wie ein Polster für den Kopf?
	AI_Output(self, hero, "Info_Mod_Erika_Kissen_16_01"); //Du bist Boxer?
	AI_Output(hero, self, "Info_Mod_Erika_Kissen_15_02"); //Nein, uum Schlafen. Den Kopf drauf legen. Weich liegen ...
	AI_Output(self, hero, "Info_Mod_Erika_Kissen_16_03"); //Ich könnte mir da eine Fellrolle vorstellen.
	AI_Output(hero, self, "Info_Mod_Erika_Kissen_15_04"); //Das geht nicht. Ist nicht weich genug und stinkt.
	AI_Output(self, hero, "Info_Mod_Erika_Kissen_16_05"); //Dann kann ich dir auch nicht helfen.
	AI_Output(self, hero, "Info_Mod_Erika_Kissen_16_06"); //Vielleicht Daniel hier nebenan. Der handelt mit magischen Dingen. Oder Morpheus drüben. Ein unheimlicher Mann ...
	AI_Output(hero, self, "Info_Mod_Erika_Kissen_15_07"); //Danke trotzdem.
};

INSTANCE Info_Mod_Erika_Kimon (C_INFO)
{
	npc		= Mod_7381_OUT_Erika_REL;
	nr		= 1;
	condition	= Info_Mod_Erika_Kimon_Condition;
	information	= Info_Mod_Erika_Kimon_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Gute Frau, kannst du mir Freude spenden?";
};                       

FUNC INT Info_Mod_Erika_Kimon_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erika_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Penner_Kimon))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Morpheus_Kimon))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Erika_Kimon_Info()
{
	AI_Output(hero, self, "Info_Mod_Erika_Kimon_15_00"); //Gute Frau, kannst du mir Freude spenden?
	AI_Output(self, hero, "Info_Mod_Erika_Kimon_16_01"); //Mach dich fort, du Schwein! Ich bin eine ehrbare Frau.
	AI_Output(hero, self, "Info_Mod_Erika_Kimon_15_02"); //Da habe ich mich wohl falsch ausgedrückt. Ich suche Freudenspender.
	AI_Output(self, hero, "Info_Mod_Erika_Kimon_16_03"); //Nicht bei mir, du Lümmel.
};

INSTANCE Info_Mod_Erika_WendelS (C_INFO)
{
	npc		= Mod_7381_OUT_Erika_REL;
	nr		= 1;
	condition	= Info_Mod_Erika_WendelS_Condition;
	information	= Info_Mod_Erika_WendelS_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_Mod_Erika_WendelS_Condition()
{
	if (Mod_REL_Stadthalter == 2)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Erika_WendelS_Info()
{
	AI_Output(self, hero, "Info_Mod_Erika_WendelS_16_00"); //Seit Wendel Stadthalter ist, hat er zahlreiche unnütze Vorschriften und Regelungen außer Kraft gesetzt, sodass wir Händler jetzt noch mehr verdienen.
	AI_Output(self, hero, "Info_Mod_Erika_WendelS_16_01"); //Ich habe gehört, du warst derjenige, der Wendel in sein Amt befördert hat?
	AI_Output(hero, self, "Info_Mod_Erika_WendelS_15_02"); //So kann man es schon sagen.
	AI_Output(self, hero, "Info_Mod_Erika_WendelS_16_03"); //Dann muss ich dir für deine Entscheidung danken. Ich habe hier einen besonders knackigen und süßen Apfel, den möchte ich dir schenken.

	B_GiveInvItems	(self, hero, ItFo_AppleErika, 1);
};

INSTANCE Info_Mod_Erika_Freudenspender (C_INFO)
{
	npc		= Mod_7381_OUT_Erika_REL;
	nr		= 1;
	condition	= Info_Mod_Erika_Freudenspender_Condition;
	information	= Info_Mod_Erika_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Kannst du Freudenspender gebrauchen?";
};                       

FUNC INT Info_Mod_Erika_Freudenspender_Condition()
{
	if (Npc_HasItems(hero, ItMi_Freudenspender) >= 1)
	&& (Mod_Freudenspender < 5)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Hi))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Erika_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Erika_Freudenspender_15_00"); //Kannst du Freudenspender gebrauchen?
	AI_Output(self, hero, "Info_Mod_Erika_Freudenspender_16_01"); //Führe mich nicht in Versuchung! Nein, ich darf nicht!
};

INSTANCE Info_Mod_Erika_Trade (C_INFO)
{
	npc		= Mod_7381_OUT_Erika_REL;
	nr		= 1;
	condition	= Info_Mod_Erika_Trade_Condition;
	information	= Info_Mod_Erika_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Erika_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erika_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erika_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Erika_Pickpocket (C_INFO)
{
	npc		= Mod_7381_OUT_Erika_REL;
	nr		= 1;
	condition	= Info_Mod_Erika_Pickpocket_Condition;
	information	= Info_Mod_Erika_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Erika_Pickpocket_Condition()
{
	C_Beklauen	(53, ItMi_Gold, 250);
};

FUNC VOID Info_Mod_Erika_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Erika_Pickpocket);

	Info_AddChoice	(Info_Mod_Erika_Pickpocket, DIALOG_BACK, Info_Mod_Erika_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Erika_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Erika_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Erika_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Erika_Pickpocket);
};

FUNC VOID Info_Mod_Erika_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Erika_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Erika_Pickpocket);

		Info_AddChoice	(Info_Mod_Erika_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Erika_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Erika_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Erika_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Erika_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Erika_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Erika_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Erika_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Erika_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Erika_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Erika_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Erika_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Erika_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Erika_EXIT (C_INFO)
{
	npc		= Mod_7381_OUT_Erika_REL;
	nr		= 1;
	condition	= Info_Mod_Erika_EXIT_Condition;
	information	= Info_Mod_Erika_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Erika_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Erika_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};