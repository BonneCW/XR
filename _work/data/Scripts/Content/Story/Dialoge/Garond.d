INSTANCE Info_Mod_Garond_Hi (C_INFO)
{
	npc		= Mod_500_PAL_Garond_NW;
	nr		= 1;
	condition	= Info_Mod_Garond_Hi_Condition;
	information	= Info_Mod_Garond_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Garond_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Garond_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Garond_Hi_10_00"); //Wo kommst du her?
	AI_Output(hero, self, "Info_Mod_Garond_Hi_15_01"); //Von außerhalb der Stadt.
	AI_Output(self, hero, "Info_Mod_Garond_Hi_10_02"); //Bist du ein Flüchtling der Kolonie? (mustert den Helden) Du bist ein Flüchtling der Kolonie.
	AI_Output(hero, self, "Info_Mod_Garond_Hi_15_03"); //Und wenn es so wäre?
	AI_Output(self, hero, "Info_Mod_Garond_Hi_10_04"); //Wir dulden hier keine Verbrechen, klar?
	AI_Output(self, hero, "Info_Mod_Garond_Hi_10_05"); //Die Lords haben gnädig verfügt, dass euch Halunken eine zweite Chance gewährt sein soll, aber wenn es nach mir ginge, würdet ihr alle morgen am Strick baumeln.
	AI_Output(hero, self, "Info_Mod_Garond_Hi_15_06"); //Dann bin ich froh, dass es nicht nach dir geht.
	AI_Output(self, hero, "Info_Mod_Garond_Hi_10_07"); //(knurrt) Sieh dich bloß vor. Ich werde ein Auge auf dich haben.
	AI_Output(self, hero, "Info_Mod_Garond_Hi_10_08"); //Wenn du dich nicht benimmst, sprechen wir uns wieder.
	AI_Output(self, hero, "Info_Mod_Garond_Hi_10_09"); //Und lass dir bloß nicht einfallen, hier auch mit Märchen hausieren zu gehen, wie du den Schläfer besiegt hast.
	AI_Output(self, hero, "Info_Mod_Garond_Hi_10_10"); //Von solchen Typen haben wir schon genug.
	AI_Output(hero, self, "Info_Mod_Garond_Hi_15_11"); //Wer behauptet denn so etwas von sich?
	AI_Output(self, hero, "Info_Mod_Garond_Hi_10_12"); //Monty im Hafenviertel. Ist der letzte, den ich noch nicht eigenhändig aus der Stadt geworfen habe.

	Log_CreateTopic	(TOPIC_MOD_MONTY_KONKURRENZKAMPF, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_MONTY_KONKURRENZKAMPF, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_MONTY_KONKURRENZKAMPF, "Monty im Hafenviertel behauptet von sich, dass er den Schläfer besiegt habe. Den muss ich mir wohl mal zur Brust nehmen.");
};

INSTANCE Info_Mod_Garond_Argez (C_INFO)
{
	npc		= Mod_500_PAL_Garond_NW;
	nr		= 1;
	condition	= Info_Mod_Garond_Argez_Condition;
	information	= Info_Mod_Garond_Argez_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wieso hast du Argez nicht in die Stadt gelassen?";
};

FUNC INT Info_Mod_Garond_Argez_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Garond_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Argez_NW_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garond_Argez_Info()
{
	AI_Output(hero, self, "Info_Mod_Garond_Argez_15_00"); //Wieso hast du Argez nicht in die Stadt gelassen?
	AI_Output(self, hero, "Info_Mod_Garond_Argez_10_01"); //Du meinst wohl den Tätowierten? Mir hat seine Fresse einfach nicht gefallen. Der hätte bestimmt Ärger gemacht.

	Info_ClearChoices	(Info_Mod_Garond_Argez);

	Info_AddChoice	(Info_Mod_Garond_Argez, "Hier hast du 100 Gold, lass ihn rein.", Info_Mod_Garond_Argez_B);
	Info_AddChoice	(Info_Mod_Garond_Argez, "Ich bürge für ihn.", Info_Mod_Garond_Argez_A);
};

FUNC VOID Info_Mod_Garond_Argez_B()
{
	AI_Output(hero, self, "Info_Mod_Garond_Argez_B_15_00"); //Hier hast du 100 Gold, lass ihn rein.
	AI_Output(self, hero, "Info_Mod_Garond_Argez_B_10_01"); //(erregt) Glaubst du, mit so einer ... Beleidigung meiner Werte kannst du mich umstimmen?
	AI_Output(self, hero, "Info_Mod_Garond_Argez_B_10_02"); //Pass auf, dass du nicht gleich endgültig vor den Toren landest!

	Info_ClearChoices	(Info_Mod_Garond_Argez);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_540_PAL_Andre_NW,	"ATGAROND");
};

FUNC VOID Info_Mod_Garond_Argez_A()
{
	AI_Output(hero, self, "Info_Mod_Garond_Argez_A_15_00"); //Ich bürge für ihn.
	AI_Output(self, hero, "Info_Mod_Garond_Argez_A_10_01"); //(lacht) Das wird ja immer schöner! Ist wohl dein Kollege, was?
	AI_Output(self, hero, "Info_Mod_Garond_Argez_A_10_02"); //Mein letztes Wort dazu ist gesprochen: Er kommt nicht rein!

	Info_ClearChoices	(Info_Mod_Garond_Argez);

	Info_AddChoice	(Info_Mod_Garond_Argez, "Hier hast du 100 Gold, lass ihn rein.", Info_Mod_Garond_Argez_B);
};

INSTANCE Info_Mod_Garond_Argez2 (C_INFO)
{
	npc		= Mod_500_PAL_Garond_NW;
	nr		= 1;
	condition	= Info_Mod_Garond_Argez2_Condition;
	information	= Info_Mod_Garond_Argez2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Garond_Argez2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Argez_NW_Follow))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Argez_NW_InCity))
	&& (Npc_RefuseTalk(self) == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garond_Argez2_Info()
{
	AI_Output(self, hero, "Info_Mod_Garond_Argez2_10_00"); //Versucht ihr nun doch, gegen meine Anweisungen zu verstoßen? (brüllt) Raus mit euch!

	Npc_SetRefuseTalk	(self, 30);

	Mod_Garond_Rauswurf = 1;

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Garond_Zurechtfinden (C_INFO)
{
	npc		= Mod_500_PAL_Garond_NW;
	nr		= 1;
	condition	= Info_Mod_Garond_Zurechtfinden_Condition;
	information	= Info_Mod_Garond_Zurechtfinden_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie finde ich mich hier zurecht?";
};

FUNC INT Info_Mod_Garond_Zurechtfinden_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Garond_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garond_Zurechtfinden_Info()
{
	AI_Output(hero, self, "Info_Mod_Garond_Zurechtfinden_15_00"); //Wie finde ich mich hier zurecht?
	AI_Output(self, hero, "Info_Mod_Garond_Zurechtfinden_10_01"); //(gehässig) Ziemlich schlecht, nehme ich mal an, es sei denn, du bist schon mal hier gewesen.
	AI_Output(self, hero, "Info_Mod_Garond_Zurechtfinden_10_02"); //Außer dass wir Paladine hier nun für Ruhe und Ordnung sorgen, ändert sich nämlich in dieser Scheißstadt nichts.
};

INSTANCE Info_Mod_Garond_News (C_INFO)
{
	npc		= Mod_500_PAL_Garond_NW;
	nr		= 1;
	condition	= Info_Mod_Garond_News_Condition;
	information	= Info_Mod_Garond_News_Info;
	permanent	= 0;
	important	= 0;
	description	= "Gibt es Neuigkeiten?";
};

FUNC INT Info_Mod_Garond_News_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Garond_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garond_News_Info()
{
	AI_Output(hero, self, "Info_Mod_Garond_News_15_00"); //Gibt es Neuigkeiten?
	AI_Output(self, hero, "Info_Mod_Garond_News_10_01"); //Allerdings! Seit ich Wache stehen muss, bricht eine Katastrophe nach der anderen über uns herein.
	AI_Output(self, hero, "Info_Mod_Garond_News_10_02"); //Erst kommt ihr Verbrecher, und jetzt heulen uns die Bauern die Ohren voll wegen so eines finsteren Kapuzenmannes, der sie ärgern soll.
	AI_Output(self, hero, "Info_Mod_Garond_News_10_03"); //Aber was soll so ein einzelner Knabe schon anrichten. (lacht dreckig)
	AI_Output(hero, self, "Info_Mod_Garond_News_15_04"); //Noch nie etwas von Magie gehört?
	AI_Output(self, hero, "Info_Mod_Garond_News_10_05"); //Schnauze!
};

INSTANCE Info_Mod_Garond_Miesepeter (C_INFO)
{
	npc		= Mod_500_PAL_Garond_NW;
	nr		= 1;
	condition	= Info_Mod_Garond_Miesepeter_Condition;
	information	= Info_Mod_Garond_Miesepeter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bist du immer so schlecht drauf?";
};

FUNC INT Info_Mod_Garond_Miesepeter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Garond_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garond_Miesepeter_Info()
{
	AI_Output(hero, self, "Info_Mod_Garond_Miesepeter_15_00"); //Bist du immer so schlecht drauf?
	AI_Output(self, hero, "Info_Mod_Garond_Miesepeter_10_01"); //Dass ich hier vorm Dorf das ganze Gesindel einführen darf, hat mir kräftig die Laune verdorben.
	AI_Output(self, hero, "Info_Mod_Garond_Miesepeter_10_02"); //Lord Hagen weiß auch nicht mehr seine guten von den schlechten Männern zu unterscheiden.
	AI_Output(hero, self, "Info_Mod_Garond_Miesepeter_15_03"); //Du hältst wohl nicht sehr viel von Lord Hagen.
	AI_Output(self, hero, "Info_Mod_Garond_Miesepeter_10_04"); //Wag es ja nicht, den Namen dieses verdienstvollen Mannes durch den Dreck zu ziehen!
	AI_Output(self, hero, "Info_Mod_Garond_Miesepeter_10_05"); //Nur weil er momentan zu zögerlich ist, heißt das nicht, dass ich nicht hundertprozentig hinter ihm stehe!
};

INSTANCE Info_Mod_Garond_Verbrecher (C_INFO)
{
	npc		= Mod_500_PAL_Garond_NW;
	nr		= 1;
	condition	= Info_Mod_Garond_Verbrecher_Condition;
	information	= Info_Mod_Garond_Verbrecher_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Garond_Verbrecher_Condition()
{
	if (Mod_GarondCityCrime >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garond_Verbrecher_Info()
{
	AI_Output(self, hero, "Info_Mod_Garond_Verbrecher_10_00"); //Warte mal, du Verbrecher!
	AI_Output(self, hero, "Info_Mod_Garond_Verbrecher_10_01"); //Wie mir zu Ohren gekommen ist, kannst du dich in der Stadt nicht an einfache Regeln halten.
	AI_Output(self, hero, "Info_Mod_Garond_Verbrecher_10_02"); //Wie wär's mal mit einer kleinen Lektion?

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_None, 0);
};

INSTANCE Info_Mod_Garond_Blutkelch (C_INFO)
{
	npc		= Mod_500_PAL_Garond_NW;
	nr		= 1;
	condition	= Info_Mod_Garond_Blutkelch_Condition;
	information	= Info_Mod_Garond_Blutkelch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Innos zum Gruß, großer Krieger.";
};

FUNC INT Info_Mod_Garond_Blutkelch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Yussuf_Blutkelch2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garond_Blutkelch_Info()
{
	AI_Output(hero, self, "Info_Mod_Garond_Blutkelch_15_00"); //Innos zum Gruß, großer Krieger.
	AI_Output(self, hero, "Info_Mod_Garond_Blutkelch_10_01"); //Was soll der Schmus?
	AI_Output(hero, self, "Info_Mod_Garond_Blutkelch_15_02"); //Als ich unlängst diesen Weg in die Stadt kam, traf ich ein mächtiges geflügeltes Wesen.
	AI_Output(hero, self, "Info_Mod_Garond_Blutkelch_15_03"); //Ich bin um mein Leben gerannt und konnte ihm grad noch entkommen. Sicher ist das eine Gefahr für die Stadt.
	AI_Output(self, hero, "Info_Mod_Garond_Blutkelch_10_04"); //Du sagst es. Ein Dämon. Den greif ich mir. Der macht die Gegend nicht länger unsicher!

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ABLENKUNG");
};

INSTANCE Info_Mod_Garond_Mario (C_INFO)
{
	npc		= Mod_500_PAL_Garond_NW;
	nr		= 1;
	condition	= Info_Mod_Garond_Mario_Condition;
	information	= Info_Mod_Garond_Mario_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Garond_Mario_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mario_Hilfe3))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garond_Mario_Info()
{
	AI_Output(self, hero, "Info_Mod_Garond_Mario_10_00"); //Ich will dich noch mal ausdrücklich warnen.
	AI_Output(self, hero, "Info_Mod_Garond_Mario_10_01"); //Du wurdest zusammen mit Mario gesehen, und es heißt, dass du ihm hilfst, seine Prüfungen zu bestehen.
	AI_Output(self, hero, "Info_Mod_Garond_Mario_10_02"); //Ich ... Wir dulden ... so etwas nicht. Ein Milizionär muss die ihm auferlegten Bürden allein tragen, kapiert?
	AI_Output(self, hero, "Info_Mod_Garond_Mario_10_03"); //Also halte dich in Zukunft besser fern von ihm. Wäre besser für euch beide.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Garond_Mario2 (C_INFO)
{
	npc		= Mod_500_PAL_Garond_NW;
	nr		= 1;
	condition	= Info_Mod_Garond_Mario2_Condition;
	information	= Info_Mod_Garond_Mario2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Garond_Mario2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Keroloth_Mario))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garond_Mario2_Info()
{
	AI_Output(self, hero, "Info_Mod_Garond_Mario2_10_00"); //(gelassen) Ich habe ihn nicht provoziert, sondern diesen Querkopf nur in seine Schranken verwiesen.
	AI_Output(self, hero, "Info_Mod_Garond_Mario2_10_01"); //Wenn er mich deswegen zum Duell herausfordert, soll er seine gerechte Strafe erhalten.
	AI_Output(hero, self, "Info_Mod_Garond_Mario2_15_02"); //Gerecht?!
	AI_Output(self, hero, "Info_Mod_Garond_Mario2_10_03"); //Hör bloß auf, jetzt den Philosophen raushängen zu lassen.
	AI_Output(self, hero, "Info_Mod_Garond_Mario2_10_04"); //Du kannst von Glück sagen, dass ich eure Betrügerei nicht schon früher geahndet habe.

	Log_CreateTopic	(TOPIC_MOD_MARIO_RACHE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_MARIO_RACHE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_MARIO_RACHE, "Garond hat Mario so lange provoziert, bis ihn dieser angegriffen hat. Das soll er büßen!");

	B_StartOtherRoutine	(self, "KAMPF");
};

INSTANCE Info_Mod_Garond_Mario3 (C_INFO)
{
	npc		= Mod_500_PAL_Garond_NW;
	nr		= 1;
	condition	= Info_Mod_Garond_Mario3_Condition;
	information	= Info_Mod_Garond_Mario3_Info;
	permanent	= 1;
	important	= 0;
	description	= "Jetzt reicht es aber!";
};

FUNC INT Info_Mod_Garond_Mario3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Garond_Mario2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garond_Mario3_Info()
{
	AI_Output(hero, self, "Info_Mod_Garond_Mario3_15_00"); //Jetzt reicht es aber!

	Info_ClearChoices	(Info_Mod_Garond_Mario3);

	Info_AddChoice	(Info_Mod_Garond_Mario3, "Wir sprechen uns noch!", Info_Mod_Garond_Mario3_B);
	Info_AddChoice	(Info_Mod_Garond_Mario3, "Ich fordere dich ebenfalls zum Duell!", Info_Mod_Garond_Mario3_A);
};

FUNC VOID Info_Mod_Garond_Mario3_B()
{
	AI_Output(hero, self, "Info_Mod_Garond_Mario3_B_15_00"); //Wir sprechen uns noch!
	AI_Output(self, hero, "Info_Mod_Garond_Mario3_B_10_01"); //(spöttisch) Ich freue mich darauf.

	Info_ClearChoices	(Info_Mod_Garond_Mario3);
};

FUNC VOID Info_Mod_Garond_Mario3_A()
{
	AI_Output(hero, self, "Info_Mod_Garond_Mario3_A_15_00"); //Ich fordere dich ebenfalls zum Duell!
	AI_Output(self, hero, "Info_Mod_Garond_Mario3_A_10_01"); //Ha, heute scheint mein Glückstag zu sein. Zwei Fliegen mit einer Klappe, richtig?
	AI_Output(self, hero, "Info_Mod_Garond_Mario3_A_10_02"); //Zieh deine Waffe und kämpf um dein Leben!

	Info_ClearChoices	(Info_Mod_Garond_Mario3);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Kill, 0);

	self.flags = 0;

	B_LogEntry	(TOPIC_MOD_MARIO_RACHE, "Ich hab Garond zur Rechenschaft gezogen.");
	B_SetTopicStatus	(TOPIC_MOD_MARIO_RACHE, LOG_SUCCESS);
};

INSTANCE Info_Mod_Garond_Pickpocket (C_INFO)
{
	npc		= Mod_500_PAL_Garond_NW;
	nr		= 1;
	condition	= Info_Mod_Garond_Pickpocket_Condition;
	information	= Info_Mod_Garond_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_100;
};

FUNC INT Info_Mod_Garond_Pickpocket_Condition()
{
	C_Beklauen	(97, ItMi_Gold, 500);
};

FUNC VOID Info_Mod_Garond_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Garond_Pickpocket);

	Info_AddChoice	(Info_Mod_Garond_Pickpocket, DIALOG_BACK, Info_Mod_Garond_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Garond_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Garond_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Garond_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Garond_Pickpocket);
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

INSTANCE Info_Mod_Garond_EXIT (C_INFO)
{
	npc		= Mod_500_PAL_Garond_NW;
	nr		= 1;
	condition	= Info_Mod_Garond_EXIT_Condition;
	information	= Info_Mod_Garond_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Garond_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Garond_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};