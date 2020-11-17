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

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Kardif verkauft etwas zu trinken.");
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
	AI_Output(self, hero, "Info_Mod_Kardif_Daemonisch_14_01"); //Ach, mies. Ein großer teil meiner Kundschaft drückt sich nur noch in Coragons Kneipe rum.
	AI_Output(hero, self, "Info_Mod_Kardif_Daemonisch_15_02"); //Wieso das? Schmeckt das Bier dort besser?
	AI_Output(self, hero, "Info_Mod_Kardif_Daemonisch_14_03"); //Ach, ich geb dir gleich Bier. Wie ich gehört habe gehen sie dorthin um sich voll zustopfen mit Fleisch.
	AI_Output(self, hero, "Info_Mod_Kardif_Daemonisch_14_04"); //Meine Gesöff ist doch tausendmal besser als das von diesem Aufschneider Coragon.
	AI_Output(self, hero, "Info_Mod_Kardif_Daemonisch_14_05"); //Aber das weiß ja keiner mehr zu schätzen ...

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Kardif hat sich darüber aufgeregt, dass ein großer Teil seiner Kundschaft nur noch ins Coragons Kneipe rumsitzt und sich mit Fleisch voll stopft.");
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
	AI_Output(self, hero, "Info_Mod_Kardif_Paddel_14_01"); //Wie kommst du da drauf? Ich handle doch nicht mit Restposten. Wieso fragst du nicht einen Fischer?

	B_LogEntry	(TOPIC_MOD_SKIP_PADDEL, "Kardif hat keine Paddel. Er erwähnte die Fischer ... ich sollte mal bei Farim vorbei sehen.");
};

INSTANCE Info_Mod_Kardif_NagurFrei (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_NagurFrei_Condition;
	information	= Info_Mod_Kardif_NagurFrei_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Kardif_NagurFrei_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kardif_Hi))
	&& (Nagur_KillAkahasch == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_NagurFrei_Info()
{
	AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei_14_00"); //He, warte mal. Ich habe hier eine Botschaft und einen Schlüssel für dich ...

	B_ShowGivenThings	("Nachricht und Schlüssel von Akahasch erhalten");

	CreateInvItems	(hero, ItKe_Akahasch, 1);
	CreateInvItems	(hero, ItWr_Akahasch, 1);

	AI_Output(hero, self, "Info_Mod_Kardif_NagurFrei_15_01"); //Von wem sind die Sachen?
	AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei_14_02"); //Ein Novize hat sie mir gegeben.

	B_RemoveNpc	(Mod_4016_NOV_Akahasch_NW);
};

INSTANCE Info_Mod_Kardif_NagurFrei2 (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_NagurFrei2_Condition;
	information	= Info_Mod_Kardif_NagurFrei2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du Schwein hast also dabei geholfen mir eine Falle zu stellen!";
};

FUNC INT Info_Mod_Kardif_NagurFrei2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Nagur_Rache))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_NagurFrei2_Info()
{
	AI_Output(hero, self, "Info_Mod_Kardif_NagurFrei2_15_00"); //Du Schwein hast also dabei geholfen mir eine Falle zu stellen!
	AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei2_14_01"); //(erschrocken) He, ich weiß nicht, was du meinst ...
	AI_Output(hero, self, "Info_Mod_Kardif_NagurFrei2_15_02"); //Der Brief der mich in diese Höhle locken sollte ...
	AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei2_14_03"); //Man ... man hat mir nur die Sachen gegeben und gesagt, dass ich sie an dich weiterzugeben soll ...
	AI_Output(hero, self, "Info_Mod_Kardif_NagurFrei2_15_04"); //Du hast gesagt, ein Novize hätte sie dir gegeben ...
	AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei2_14_05"); //Ja, das stimmt auch. So ein Dunkelnovize.
	AI_Output(hero, self, "Info_Mod_Kardif_NagurFrei2_15_06"); //Du wusstest genau, dass es nicht Akahasch war ... denn der ist tot.
	AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei2_14_07"); //Aber ... aber ich konnte doch nicht wissen, was da läuft. He, man, mach keine Dummheiten, wir können uns doch bestimmt irgendwie einigen ...
	AI_Output(hero, self, "Info_Mod_Kardif_NagurFrei2_15_08"); //Was meinst du?
	AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei2_14_09"); //Ich ... ich bekomme als Wirt so einiges mit. Ich könnte dir zum Beispiel sagen, in welchen der Kisten und Fässer am Hafen du heiße Ware findest ...

	Info_ClearChoices	(Info_Mod_Kardif_NagurFrei2);

	Info_AddChoice	(Info_Mod_Kardif_NagurFrei2, "Einverstanden.", Info_Mod_Kardif_NagurFrei2_B);
	Info_AddChoice	(Info_Mod_Kardif_NagurFrei2, "Dafür wanderst du in den Knast.", Info_Mod_Kardif_NagurFrei2_A);
};

FUNC VOID Info_Mod_Kardif_NagurFrei2_B()
{
	AI_Output(hero, self, "Info_Mod_Kardif_NagurFrei2_B_15_00"); //Einverstanden.
	AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei2_B_14_01"); //(erleichtert) Puh ... ich wusste doch, das wir uns einigen können.

	Info_ClearChoices	(Info_Mod_Kardif_NagurFrei2);

	Nagur_KillAkahasch = 5;

	B_Göttergefallen(3, 1);
};

FUNC VOID Info_Mod_Kardif_NagurFrei2_A()
{
	AI_Output(hero, self, "Info_Mod_Kardif_NagurFrei2_A_15_00"); //Dafür wanderst du in den Knast.
	AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei2_A_14_01"); //Nein ... das ist mein Ende.

	Info_ClearChoices	(Info_Mod_Kardif_NagurFrei2);

	Nagur_KillAkahasch = 6;

	B_Göttergefallen(1, 1);
};

var int KardifInfos[14];

FUNC INT B_GetKardifInfoIndex()
{
	var int loop; loop = MEM_StackPos.position;

	var int rnd; rnd = r_max(13);

	if (MEM_ReadStatArr(KardifInfos, rnd) == 1)
	{
		MEM_StackPos.position = loop;
	};

	MEM_WriteStatArr(KardifInfos, rnd, 1);

	return rnd;
};

INSTANCE Info_Mod_Kardif_NagurFrei3 (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_NagurFrei3_Condition;
	information	= Info_Mod_Kardif_NagurFrei3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wo finde ich heiße Ware?";
};

FUNC INT Info_Mod_Kardif_NagurFrei3_Condition()
{
	if (Nagur_KillAkahasch == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_NagurFrei3_Info()
{
	AI_Output(hero, self, "Info_Mod_Kardif_NagurFrei3_15_00"); //Wo finde ich heiße Ware?

	if (Mod_Kardif_Info < 2)
	&& (Mod_Kardif_InfoTruhe == 0)
	{
		var int nextIndex; nextIndex = B_GetKardifInfoIndex();

		var int ptr; ptr = MEM_SearchVobByName("KARDIFINFOTRUHE");

		var zCVob vob; vob = MEM_PtrToInst(ptr);

		AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_01"); //So weit ich mitbekommen habe, solltest du in den ...

		if (nextIndex == 0)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_02"); //... Kisten gegenüber Lehmar ...

			vob.trafoObjToWorld[3] = mkf(3534);
			vob.trafoObjToWorld[7] = mkf(-154);
			vob.trafoObjToWorld[11] = mkf(-1211);
		}
		else if (nextIndex == 1)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_03"); //... Fässern hinter der Taverne ...

			vob.trafoObjToWorld[3] = mkf(2581);
			vob.trafoObjToWorld[7] = mkf(-187);
			vob.trafoObjToWorld[11] = mkf(-1163);
		}
		else if (nextIndex == 2)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_04"); //... Kisten beim Kartenzeichner ...

			vob.trafoObjToWorld[3] = mkf(1193);
			vob.trafoObjToWorld[7] = mkf(-86);
			vob.trafoObjToWorld[11] = mkf(572);
		}
		else if (nextIndex == 3)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_05"); //... Fässern beim Schiffsbauer ...

			vob.trafoObjToWorld[3] = mkf(777);
			vob.trafoObjToWorld[7] = mkf(-190);
			vob.trafoObjToWorld[11] = mkf(883);
		}
		else if (nextIndex == 4)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_06"); //... Kisten bei Alrik ...

			vob.trafoObjToWorld[3] = mkf(3532);
			vob.trafoObjToWorld[7] = mkf(-188);
			vob.trafoObjToWorld[11] = mkf(3071);
		}
		else if (nextIndex == 5)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_07"); //... Fässern im Lagerhaus ...

			vob.trafoObjToWorld[3] = mkf(2065);
			vob.trafoObjToWorld[7] = mkf(-189);
			vob.trafoObjToWorld[11] = mkf(2579);
		}
		else if (nextIndex == 6)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_08"); //... Kisten oben im Lagerhaus ...

			vob.trafoObjToWorld[3] = mkf(2790);
			vob.trafoObjToWorld[7] = mkf(109);
			vob.trafoObjToWorld[11] = mkf(2740);
		}
		else if (nextIndex == 7)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_09"); //... Kisten zwischen Lagerhaus und Lastenkran ...

			vob.trafoObjToWorld[3] = mkf(-289);
			vob.trafoObjToWorld[7] = mkf(-181);
			vob.trafoObjToWorld[11] = mkf(3551);
		}
		else if (nextIndex == 8)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_10"); //... Kisten beim Baum überm Lagerhaus ...

			vob.trafoObjToWorld[3] = mkf(1138);
			vob.trafoObjToWorld[7] = mkf(299);
			vob.trafoObjToWorld[11] = mkf(3476);
		}
		else if (nextIndex == 9)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_11"); //... Fässern neben der roten Laterne ...

			vob.trafoObjToWorld[3] = mkf(567);
			vob.trafoObjToWorld[7] = mkf(-192);
			vob.trafoObjToWorld[11] = mkf(-2433);
		}
		else if (nextIndex == 10)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_12"); //... Kisten neben der roten Laterne ...

			vob.trafoObjToWorld[3] = mkf(1103);
			vob.trafoObjToWorld[7] = mkf(-194);
			vob.trafoObjToWorld[11] = mkf(-3766);
		}
		else if (nextIndex == 11)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_13"); //... Kisten gegenüber dem Schiffsbauer ...

			vob.trafoObjToWorld[3] = mkf(-142);
			vob.trafoObjToWorld[7] = mkf(-146);
			vob.trafoObjToWorld[11] = mkf(1253);
		}
		else if (nextIndex == 12)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_14"); //... Kisten neben Anlegestelle für Bote ...

			vob.trafoObjToWorld[3] = mkf(-1364);
			vob.trafoObjToWorld[7] = mkf(-82);
			vob.trafoObjToWorld[11] = mkf(-1676);
		}
		else if (nextIndex == 13)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_15"); //... Fässern bei Diego ...

			vob.trafoObjToWorld[3] = mkf(-304);
			vob.trafoObjToWorld[7] = mkf(-173);
			vob.trafoObjToWorld[11] = mkf(-1182);
		};

		AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_16"); //... was Nettes finden.

		Mob_CreateItems	("KARDIFINFOTRUHE", ItMi_Joint, r_max(9));
		Mob_CreateItems	("KARDIFINFOTRUHE", ItFo_Booze, r_max(9));
		Mob_CreateItems	("KARDIFINFOTRUHE", ItFo_Wine, r_max(9));
		Mob_CreateItems	("KARDIFINFOTRUHE", ItFo_Beer, r_max(9));
		Mob_CreateItems	("KARDIFINFOTRUHE", ItPo_Tiergift, r_max(3));
		Mob_CreateItems	("KARDIFINFOTRUHE", ItPo_Pflanzengift, r_max(3));

		VobPositionUpdated(ptr);

		Mod_Kardif_InfoTruhe = 1;
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_17"); //Im Moment weiß ich leider noch von nichts weiter. Frag in paar Tagen noch mal nach ...
	};
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
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Kardif_Pickpocket_Condition()
{
	C_Beklauen	(65, ItFo_Beer, 4);
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
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Kardif_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Kardif_Pickpocket);

		Info_AddChoice	(Info_Mod_Kardif_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Kardif_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Kardif_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Kardif_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Kardif_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Kardif_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Kardif_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Kardif_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Kardif_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Kardif_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Kardif_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Kardif_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Kardif_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
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