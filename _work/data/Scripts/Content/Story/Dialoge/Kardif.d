INSTANCE Info_Mod_Kardif_Hi (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_Hi_Condition;
	information	= Info_Mod_Kardif_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Kardif_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Kardif_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Kardif_Hi_14_00"); //Willkommen Fremder, was kann ich für dich tun?
	AI_Output(self, hero, "Info_Mod_Kardif_Hi_14_01"); //Solltest du etwas zu trinken suchen, dann bist du bei mir richtig.

	Log_CreateTopic	(TOPIC_MOD_HÄNDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HÄNDLER_STADT, "Kardif verkauft etwas zu trinken.");
};

INSTANCE Info_Mod_Kardif_Daemonisch (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_Daemonisch_Condition;
	information	= Info_Mod_Kardif_Daemonisch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Und, wie läuft es in deiner Kneipe?";
};

FUNC INT Info_Mod_Kardif_Daemonisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kardif_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Milten_Daemonisch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_Daemonisch_Info()
{
	AI_Output(hero, self, "Info_Mod_Kardif_Daemonisch_15_00"); //Und, wie läuft es in deiner Kneipe?
	AI_Output(self, hero, "Info_Mod_Kardif_Daemonisch_14_01"); //Ach, mies. Ein großer teil meiner Kundschaft drückt sich nur noch in Coragorn’s Kneipe rum.
	AI_Output(hero, self, "Info_Mod_Kardif_Daemonisch_15_02"); //Wieso das? Schmeckt das Bier dort besser?
	AI_Output(self, hero, "Info_Mod_Kardif_Daemonisch_14_03"); //Ach, ich geb dir gleich Bier. Wie ich gehört habe gehen sie dorthin um sich voll zustopfen mit Fleisch.
	AI_Output(self, hero, "Info_Mod_Kardif_Daemonisch_14_04"); //Meine Gesöff ist doch tausendmal besser als das von diesem Aufschneider Coragorn.
	AI_Output(self, hero, "Info_Mod_Kardif_Daemonisch_14_05"); //Aber das weiß ja keiner mehr zu schätzen ...

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Kardif hat sich darüber aufgeregt, dass ein großer Teil seiner Kundschaft nur noch ins Coragorn’s Kneipe rumsitzt und sich mit Fleisch voll stopft.");
};

INSTANCE Info_Mod_Kardif_WacholderDieb (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_WacholderDieb_Condition;
	information	= Info_Mod_Kardif_WacholderDieb_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich suche nach dem Dieb der bei Coragon einen Diebstahl begangen hat.";
};

FUNC INT Info_Mod_Kardif_WacholderDieb_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kardif_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Meldor_WacholderDieb))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_WacholderDieb_Info()
{
	AI_Output(hero, self, "Info_Mod_Kardif_WacholderDieb_15_00"); //Ich suche nach dem Dieb der bei Coragon einen Diebstahl begangen hat. Du bist ein Konkurrent von ihm. Weißt du etwas davon.
	AI_Output(self, hero, "Info_Mod_Kardif_WacholderDieb_14_01"); //Nein! Ich hasse Coragon zwar aber so etwas tue ich nicht. Ich verlasse mich auf faire Mittel um Profit zu machen.
	AI_Output(self, hero, "Info_Mod_Kardif_WacholderDieb_14_02"); //Wenn du mich fragst solltest du mal mit dem Wirt des Freibierstandes sprechen. Der kommst mir verdächtig vor.
	AI_Output(hero, self, "Info_Mod_Kardif_WacholderDieb_15_03"); //Dann geh ich mal.

	B_LogEntry	(TOPIC_MOD_CORAGON_WACHOLDER, "Kardif meinte, dass er nur mit fairen Mitteln zu Profit kommt. Ich sollte mal zum Wirt des Freibierstandes gehen.");
};

INSTANCE Info_Mod_Kardif_KnowsRukhar (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_KnowsRukhar_Condition;
	information	= Info_Mod_Kardif_KnowsRukhar_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kardif, du hast dich selbst verraten!";
};

FUNC INT Info_Mod_Kardif_KnowsRukhar_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kardif_WacholderDieb))
	&& (Npc_KnowsInfo(hero, Info_Mod_Rukhar_WacholderDieb))
	&& (Mod_KnowsRukharWacholder == 1)
	&& (Npc_HasItems(hero, ItWr_Rukhar_Wacholder) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_KnowsRukhar_Info()
{
	AI_Output(hero, self, "Info_Mod_Kardif_KnowsRukhar_15_00"); //Kardif, du hast dich selbst verraten!
	AI_Output(self, hero, "Info_Mod_Kardif_KnowsRukhar_14_01"); //(überheblich) Was?
	AI_Output(hero, self, "Info_Mod_Kardif_KnowsRukhar_15_02"); //Indem du mich zum Wirt geschickt hast konnte ich Rukhar verfolgen und habe einen Zettel gefunden, auf dem steht, dass du den Diebstahl befohlen hast.
	AI_Output(self, hero, "Info_Mod_Kardif_KnowsRukhar_14_03"); //Können wir da nicht nochmal drüber reden?

	Info_ClearChoices	(Info_Mod_Kardif_KnowsRukhar);

	Info_AddChoice	(Info_Mod_Kardif_KnowsRukhar, "Na gut, ich werde dich nicht verpetzen.", Info_Mod_Kardif_KnowsRukhar_D);
	Info_AddChoice	(Info_Mod_Kardif_KnowsRukhar, "Wenn du mir Gold gibst, dann lass ich dich laufen.", Info_Mod_Kardif_KnowsRukhar_B);
	Info_AddChoice	(Info_Mod_Kardif_KnowsRukhar, "Ich werde dich Lord Andre melden.", Info_Mod_Kardif_KnowsRukhar_A);
};

FUNC VOID Info_Mod_Kardif_KnowsRukhar_D()
{
	AI_Output(hero, self, "Info_Mod_Kardif_KnowsRukhar_D_15_00"); //Na gut, ich werde nicht verpetzen.
	AI_Output(self, hero, "Info_Mod_Kardif_KnowsRukhar_D_14_01"); //Vielen Dank. Nimm dieses Gold als Dank von mir.

	CreateInvItems	(self, ItMi_Gold, 100);
	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	B_Göttergefallen(1, 1);

	Mod_KnowsRukharWacholder = 2;

	B_LogEntry	(TOPIC_MOD_CORAGON_WACHOLDER, "Ich habe Kardif laufen lassen. Ich sollte jetzt zu Coragon gehen und mir eine Ausrede einfallen lassen.");

	Info_ClearChoices	(Info_Mod_Kardif_KnowsRukhar);
};

FUNC VOID Info_Mod_Kardif_KnowsRukhar_B()
{
	AI_Output(hero, self, "Info_Mod_Kardif_KnowsRukhar_B_15_00"); //Wenn du mir Gold gibst, dann lass ich dich laufen.
	AI_Output(self, hero, "Info_Mod_Kardif_KnowsRukhar_B_14_01"); //Gut, ich gebe dir 400 Goldmünzen.

	CreateInvItems	(self, ItMi_Gold, 400);
	B_GiveInvItems	(self, hero, ItMi_Gold, 400);

	AI_Output(hero, self, "Info_Mod_Kardif_KnowsRukhar_B_15_02"); //Danke.

	B_LogEntry	(TOPIC_MOD_CORAGON_WACHOLDER, "Kardif hat mich dafür bezahlt, dass ich ihn laufen lasse. Jetzt sollte ich zu Coragon zurück gehen.");

	B_Göttergefallen(3, 1);

	Mod_KnowsRukharWacholder = 4;

	Info_ClearChoices	(Info_Mod_Kardif_KnowsRukhar);
};

FUNC VOID Info_Mod_Kardif_KnowsRukhar_A()
{
	AI_Output(hero, self, "Info_Mod_Kardif_KnowsRukhar_A_15_00"); //Ich werde dich Lord Andre melden.
	AI_Output(self, hero, "Info_Mod_Kardif_KnowsRukhar_A_14_01"); //(seufzt) Ich bin ruiniert.

	B_Göttergefallen(2, 1);

	B_LogEntry	(TOPIC_MOD_CORAGON_WACHOLDER, "Ich werde Kardif an Lord Andre verpfeifen.");

	Mod_KnowsRukharWacholder = 5;

	Info_ClearChoices	(Info_Mod_Kardif_KnowsRukhar);
};

INSTANCE Info_Mod_Kardif_Rum (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_Rum_Condition;
	information	= Info_Mod_Kardif_Rum_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab hier ein Paket voller Rum für dich.";
};

FUNC INT Info_Mod_Kardif_Rum_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kardif_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Skip_Francis))
	&& (Npc_HasItems(hero, Mod_RumPaket) == 1)
	&& (Mod_KnowsRukharWacholder != 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_Rum_Info()
{
	AI_Output(hero, self, "Info_Mod_Kardif_Rum_15_00"); //Ich hab hier ein Paket voller Rum für dich.
	
	B_GiveInvItems	(hero, self, Mod_RumPaket, 1);

	AI_Output(self, hero, "Info_Mod_Kardif_Rum_14_01"); //Endlich, meine Kunden warten schon die ganze Zeit auf den Rum.
	AI_Output(self, hero, "Info_Mod_Kardif_Rum_14_02"); //Hier ist dein Gold.

	Npc_RemoveInvItems	(self, Mod_RumPaket, 1);

	CreateInvItems	(self, ItFo_Addon_Rum, 20);

	CreateInvItems	(self, ItMi_Gold, 500);
	B_GiveInvItems	(self, hero, ItMi_Gold, 500);
};

INSTANCE Info_Mod_Kardif_Melasse (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_Melasse_Condition;
	information	= Info_Mod_Kardif_Melasse_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du Melasse?";
};

FUNC INT Info_Mod_Kardif_Melasse_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kardif_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Samuel_Auftrag))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Samuel_HabZeug))
	&& (Mod_KnowsRukharWacholder != 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_Melasse_Info()
{
	AI_Output(hero, self, "Info_Mod_Kardif_Melasse_15_00"); //Hast du Melasse?
	AI_Output(self, hero, "Info_Mod_Kardif_Melasse_14_01"); //Nicht mehr. Gestern kam so ein Kerl rein, der hat alles gekauft.
	AI_Output(hero, self, "Info_Mod_Kardif_Melasse_15_02"); //Wer war das?
	AI_Output(self, hero, "Info_Mod_Kardif_Melasse_14_03"); //Er nennt sich Alvro. Hat sich in den Wald vor der Stadt zurückgezogen.
	AI_Output(self, hero, "Info_Mod_Kardif_Melasse_14_04"); //Er soll sich dort irgendwo in einer Höhle befinden.

	B_LogEntry	(TOPIC_MOD_SAMUEL_RUM, "Ein gewisser Alvro hat den kompletten Melassevorrat von Kardif aufgekauft. Er soll sich in einer Höhle im Wald vor der Stadt Khorinis befinden.");
};

INSTANCE Info_Mod_Kardif_Zauberwasser (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_Zauberwasser_Condition;
	information	= Info_Mod_Kardif_Zauberwasser_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab hier eine Lieferung Zauberwasser.";
};

FUNC INT Info_Mod_Kardif_Zauberwasser_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kardif_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Constantino_Zauberwasser))
	&& (Npc_HasItems(hero, ItMi_Zauberwasser_MIS) > 7)
	&& (Mod_KnowsRukharWacholder != 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_Zauberwasser_Info()
{
	AI_Output(hero, self, "Info_Mod_Kardif_Zauberwasser_15_00"); //Ich hab hier eine Lieferung Zauberwasser.

	B_GiveInvItems	(hero, self, ItMi_Zauberwasser_MIS, 8);

	AI_Output(self, hero, "Info_Mod_Kardif_Zauberwasser_14_01"); //Wird auch langsam Zeit.
};

INSTANCE Info_Mod_Kardif_WoMoe (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_WoMoe_Condition;
	information	= Info_Mod_Kardif_WoMoe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Weißt du, wo Moe ist?";
};

FUNC INT Info_Mod_Kardif_WoMoe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kardif_Hi))
	&& (Mod_CantharQuest_Last == 1)
	&& (Mod_KnowsRukharWacholder != 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_WoMoe_Info()
{
	AI_Output(hero, self, "Info_Mod_Kardif_WoMoe_15_00"); //Weißt du, wo Moe ist?
	AI_Output(self, hero, "Info_Mod_Kardif_WoMoe_14_01"); //Nein, der Bengel fehlt jetzt schon seit drei Tagen. Allerdings schien es ihm in letzter Zeit auch nicht sonderlich gut zu gehen ... ist bestimmt krank.
	AI_Output(hero, self, "Info_Mod_Kardif_WoMoe_15_02"); //Es ging ihm nicht gut?
	AI_Output(self, hero, "Info_Mod_Kardif_WoMoe_14_03"); //Sah bedrückt aus, der Junge. Passte gar nicht zu ihm. Ein Mal hat er "Staubkörner" gesagt, völlig zusammenhangslos.
	AI_Output(hero, self, "Info_Mod_Kardif_WoMoe_15_04"); //Dann werde ich ihn suchen gehen.
	AI_Output(self, hero, "Info_Mod_Kardif_WoMoe_14_05"); //Mach das. Vielleicht kannst du ihn ja so weit aufmuntern, dass er wieder Lust hat, zur Arbeit zu kommen.
};

INSTANCE Info_Mod_Kardif_MoeTot (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_MoeTot_Condition;
	information	= Info_Mod_Kardif_MoeTot_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du kannst einen neuen Türsteher anstellen.";
};

FUNC INT Info_Mod_Kardif_MoeTot_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kardif_Hi))
	&& (Mod_CantharQuest_Last >= 2)
	&& (Mod_KnowsRukharWacholder != 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_MoeTot_Info()
{
	AI_Output(hero, self, "Info_Mod_Kardif_MoeTot_15_00"); //Du kannst einen neuen Türsteher anstellen.
	AI_Output(self, hero, "Info_Mod_Kardif_MoeTot_14_01"); //Moe ist ...?
	AI_Output(hero, self, "Info_Mod_Kardif_MoeTot_15_02"); //Ja.
	AI_Output(self, hero, "Info_Mod_Kardif_MoeTot_14_03"); //Oh. (Pause) Verdammt, was ist passiert?
	AI_Output(hero, self, "Info_Mod_Kardif_MoeTot_15_04"); //Canthar hat ihn umbringen lassen.
	AI_Output(self, hero, "Info_Mod_Kardif_MoeTot_14_05"); //Dem Kerl muss endlich das Handwerk gelegt werden. Warte, nimm das hier.

	B_GiveInvItems	(self, hero, ItFo_Addon_Rum, 1);

	AI_Output(self, hero, "Info_Mod_Kardif_MoeTot_14_06"); //Auf Moe, den besten Rausschmeißer, den das ganze beschissene Khorinis je gesehen hat!

	CreateInvItems	(self, ItFo_Addon_Rum, 2);

	B_UseItem	(self, ItFo_Addon_Rum);
	B_UseItem	(hero, ItFo_Addon_Rum);

	if (!Npc_KnowsInfo(hero, Info_Mod_Canthar_AtLager2))
	{
		AI_Output(self, hero, "Info_Mod_Kardif_MoeTot_14_07"); //Und jetzt zieh los und leg dem Schurken das Handwerk!
	};
};

INSTANCE Info_Mod_Kardif_Paddel (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_Paddel_Condition;
	information	= Info_Mod_Kardif_Paddel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du Paddel im Angebot?";
};

FUNC INT Info_Mod_Kardif_Paddel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kardif_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Garvell_Paddel))
	&& (Npc_KnowsInfo(hero, Info_Mod_Skip_Francis))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_Paddel_Info()
{
	AI_Output(hero, self, "Info_Mod_Kardif_Paddel_15_00"); //Hast du Paddel im Angebot?
	AI_Output(self, hero, "Info_Mod_Kardif_Paddel_14_01"); //Wie kommst du da drauf? Ich handle doch nicht mit Restposten. Wieso frägst du nicht einen Fischer?

	B_LogEntry	(TOPIC_MOD_SKIP_PADDEL, "Kardif hat keine Paddel. Er erwähnte den Fischer ... ich sollte mal bei Farim vorbei sehen.");
};

INSTANCE Info_Mod_Kardif_Trade (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_Trade_Condition;
	information	= Info_Mod_Kardif_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Kardif_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kardif_Hi))
	&& (Mod_KnowsRukharWacholder < 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Kardif_Pickpocket (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_Pickpocket_Condition;
	information	= Info_Mod_Kardif_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Kardif_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 140);
};

FUNC VOID Info_Mod_Kardif_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Kardif_Pickpocket);

	Info_AddChoice	(Info_Mod_Kardif_Pickpocket, DIALOG_BACK, Info_Mod_Kardif_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Kardif_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Kardif_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Kardif_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Kardif_Pickpocket);
};

FUNC VOID Info_Mod_Kardif_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Kardif_Pickpocket);
};

INSTANCE Info_Mod_Kardif_EXIT (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_EXIT_Condition;
	information	= Info_Mod_Kardif_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Kardif_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Kardif_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};