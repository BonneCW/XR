INSTANCE Info_Mod_Metzger_Metzgerei (C_INFO)
{
	npc		= Mod_7576_OUT_Metzger_REL;
	nr		= 1;
	condition	= Info_Mod_Metzger_Metzgerei_Condition;
	information	= Info_Mod_Metzger_Metzgerei_Info;
	permanent	= 0;
	important	= 0;
	description	= "Das hier ist die Metzgerei, richtig?";
};

FUNC INT Info_Mod_Metzger_Metzgerei_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Metzger_Metzgerei_Info()
{
	AI_Output(hero, self, "Info_Mod_Metzger_Metzgerei_15_00"); //Das hier ist die Metzgerei, richtig?
	AI_Output(self, hero, "Info_Mod_Metzger_Metzgerei_08_01"); //Jawohl. Seit fünf Generationen von meiner Familie geführt. Tradition, die man schmeckt.
	AI_Output(hero, self, "Info_Mod_Metzger_Metzgerei_15_02"); //Euer Fleisch schmeckt also alt und staubig?
	AI_Output(self, hero, "Info_Mod_Metzger_Metzgerei_08_03"); //(verwirrt) Wie bitte?
};

INSTANCE Info_Mod_Metzger_Schaf (C_INFO)
{
	npc		= Mod_7576_OUT_Metzger_REL;
	nr		= 1;
	condition	= Info_Mod_Metzger_Schaf_Condition;
	information	= Info_Mod_Metzger_Schaf_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kann ich dir irgendwie helfen?";
};

FUNC INT Info_Mod_Metzger_Schaf_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Metzger_Schaf_Info()
{
	AI_Output(hero, self, "Info_Mod_Metzger_Schaf_15_00"); //Kann ich dir irgendwie helfen?
	AI_Output(self, hero, "Info_Mod_Metzger_Schaf_08_01"); //Es wird Zeit, dass jemand mal wieder ein Schaf vom Bauern Erhard holt. Uns geht langsam das Lammfleisch aus.
	AI_Output(self, hero, "Info_Mod_Metzger_Schaf_08_02"); //Wenn du dich ein wenig mit Tieren auskennst, kann ich dir den Auftrag überlassen.
	AI_Output(self, hero, "Info_Mod_Metzger_Schaf_08_03"); //Ich würde dich mit 30 Goldmünzen entlohnen.

	Info_ClearChoices	(Info_Mod_Metzger_Schaf);

	if (Mod_Verhandlungsgeschick > 0)
	{
		Info_AddChoice	(Info_Mod_Metzger_Schaf, "(Feilschen) Gib mir 70 Gold, und ich bin dabei.", Info_Mod_Metzger_Schaf_C);
	};
	Info_AddChoice	(Info_Mod_Metzger_Schaf, "Aus dem Geschäft halte ich mich lieber raus.", Info_Mod_Metzger_Schaf_B);
	Info_AddChoice	(Info_Mod_Metzger_Schaf, "Ich kümmere mich darum.", Info_Mod_Metzger_Schaf_A);
};

FUNC VOID Info_Mod_Metzger_Schaf_D()
{
	AI_Output(self, hero, "Info_Mod_Metzger_Schaf_D_08_00"); //Du findest Erhards Bauernhof im Osten Relendels, wenn du nicht schon längst darüber gestolpert bist.
	AI_Output(hero, self, "Info_Mod_Metzger_Schaf_D_15_01"); //Was ist mit der Bezahlung für Erhard?
	AI_Output(self, hero, "Info_Mod_Metzger_Schaf_D_08_02"); //Darum kümmere ich mich lieber selbst. Wir rechnen immer ab, wenn er in die Stadt kommt.

	Log_CreateTopic	(TOPIC_MOD_METZGER_SCHAF, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_METZGER_SCHAF, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_METZGER_SCHAF, "Der Metzger in Khorata hat Bedarf an frischem Schafsfleisch. Der Bauer Erhard im Osten Relendels soll mir eines seiner Lämmer überlassen.");

	Wld_InsertNpc	(Monster_11069_Emma_REL,	"REL_SURFACE_106");

	Info_ClearChoices	(Info_Mod_Metzger_Schaf);
};

FUNC VOID Info_Mod_Metzger_Schaf_C()
{
	AI_Output(hero, self, "Info_Mod_Metzger_Schaf_C_15_00"); //Gib mir 70 Gold, und ich bin dabei.

	if (self.aivar[AIV_Verhandlung] == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_Metzger_Schaf_C_08_01"); //Damit kann ich gerade noch leben. Also abgemacht.

		Info_Mod_Metzger_Schaf_D();

		Mod_Metzger_Schaf = 1;
		Mod_Metzger_Schaf_Wert = 70;
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Metzger_Schaf_C_08_02"); //Da wäre es ja günstiger, wenn ich einen berufsmäßigen Boten schicke!
	};
};

FUNC VOID Info_Mod_Metzger_Schaf_B()
{
	AI_Output(hero, self, "Info_Mod_Metzger_Schaf_B_15_00"); //Aus dem Geschäft halte ich mich lieber raus.

	Info_ClearChoices	(Info_Mod_Metzger_Schaf);
};

FUNC VOID Info_Mod_Metzger_Schaf_A()
{
	AI_Output(hero, self, "Info_Mod_Metzger_Schaf_A_15_00"); //Ich kümmere mich darum.

	Mod_Metzger_Schaf = 1;
	Mod_Metzger_Schaf_Wert = 30;

	Info_Mod_Metzger_Schaf_D();
};

INSTANCE Info_Mod_Metzger_Schaf2 (C_INFO)
{
	npc		= Mod_7576_OUT_Metzger_REL;
	nr		= 1;
	condition	= Info_Mod_Metzger_Schaf2_Condition;
	information	= Info_Mod_Metzger_Schaf2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier ist das Schaf.";
};

FUNC INT Info_Mod_Metzger_Schaf2_Condition()
{
	if (Mod_Metzger_Schaf == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Metzger_Schaf2_Info()
{
	AI_Output(hero, self, "Info_Mod_Metzger_Schaf2_15_00"); //Hier ist das Schaf.
	AI_Output(self, hero, "Info_Mod_Metzger_Schaf2_08_01"); //Auf dich scheint man sich ja verlassen zu können. Hier ist deine Bezahlung.

	B_GiveInvItems	(self, hero, ItMi_Gold, Mod_Metzger_Schaf_Wert);

	AI_Output(hero, self, "Info_Mod_Metzger_Schaf2_15_02"); //Gibt es sonst noch etwas zu tun?
	AI_Output(self, hero, "Info_Mod_Metzger_Schaf2_08_03"); //Momentan nicht. Jetzt wird erst mal das Lamm zu Wurst verarbeitet.

	B_SetTopicStatus	(TOPIC_MOD_METZGER_SCHAF, LOG_SUCCESS);

	B_StartOtherRoutine	(Monster_11069_Emma_REL,	"METZGER");

	B_GivePlayerXP	(100);

	Mod_Metzger_Schaf = 4;
};

INSTANCE Info_Mod_Metzger_Schaf3 (C_INFO)
{
	npc		= Mod_7576_OUT_Metzger_REL;
	nr		= 1;
	condition	= Info_Mod_Metzger_Schaf3_Condition;
	information	= Info_Mod_Metzger_Schaf3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe das Schaf verloren.";
};

FUNC INT Info_Mod_Metzger_Schaf3_Condition()
{
	if (Mod_Metzger_Schaf == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Metzger_Schaf3_Info()
{
	AI_Output(hero, self, "Info_Mod_Metzger_Schaf3_15_00"); //Ich habe das Schaf verloren.
	AI_Output(self, hero, "Info_Mod_Metzger_Schaf3_08_01"); //(stöhnt) Ich hätte mich doch an jemand Vernünftigen wenden müssen.
	AI_Output(self, hero, "Info_Mod_Metzger_Schaf3_08_02"); //Woher soll ich jetzt Schafsfleisch bekommen?

	B_SetTopicStatus	(TOPIC_MOD_METZGER_SCHAF, LOG_FAILED);

	if (Npc_IsDead(Monster_11069_Emma_REL))
	{
		Mod_Metzger_Schaf = 5;
	}
	else
	{
		Mod_Metzger_Schaf = 6;
	};
};

INSTANCE Info_Mod_Metzger_Schaf4 (C_INFO)
{
	npc		= Mod_7576_OUT_Metzger_REL;
	nr		= 1;
	condition	= Info_Mod_Metzger_Schaf4_Condition;
	information	= Info_Mod_Metzger_Schaf4_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe das Schaf schon geschlachtet.";
};

FUNC INT Info_Mod_Metzger_Schaf4_Condition()
{
	if (Mod_Metzger_Schaf == 3)
	&& (Npc_HasItems(hero, ItFo_MuttonRaw) >= 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Metzger_Schaf4_Info()
{
	AI_Output(hero, self, "Info_Mod_Metzger_Schaf4_15_00"); //Ich habe das Schaf schon geschlachtet.

	B_GiveInvItems	(hero, self, ItFo_MuttonRaw, 10);

	AI_Output(self, hero, "Info_Mod_Metzger_Schaf4_08_01"); //(schnüffelt) Das ist kein frisches Fleisch. Woher hast du es?
	AI_Output(hero, self, "Info_Mod_Metzger_Schaf4_15_02"); //Äh ...
	AI_Output(self, hero, "Info_Mod_Metzger_Schaf4_08_03"); //Ist mir eigentlich auch egal. Für Gehacktes ist es noch zu gebrauchen.
	AI_Output(self, hero, "Info_Mod_Metzger_Schaf4_08_04"); //Schlimmer ist es, dass du versucht hast, mich übers Ohr zu hauen.
	AI_Output(self, hero, "Info_Mod_Metzger_Schaf4_08_05"); //Aber weil ich das Fleisch brauche, will ich dir trotzdem die Hälfte des versprochenen Lohns zahlen.

	B_GiveInvItems	(self, hero, ItMi_Gold, Mod_Metzger_Schaf_Wert/2);

	AI_Output(self, hero, "Info_Mod_Metzger_Schaf4_08_06"); //Versuch nur nicht, mir noch mal dumm zu kommen.

	B_GivePlayerXP	(50);

	B_SetTopicStatus	(TOPIC_MOD_METZGER_SCHAF, LOG_SUCCESS);

	if (Npc_IsDead(Monster_11069_Emma_REL))
	{
		Mod_Metzger_Schaf = 5;
	}
	else
	{
		Mod_Metzger_Schaf = 6;
	};
};

INSTANCE Info_Mod_Metzger_August (C_INFO)
{
	npc		= Mod_7576_OUT_Metzger_REL;
	nr		= 1;
	condition	= Info_Mod_Metzger_August_Condition;
	information	= Info_Mod_Metzger_August_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich brauche gepökeltes Lamm. So drei Portionen.";
};

FUNC INT Info_Mod_Metzger_August_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_August_Penner))
	&& (!Npc_KnowsInfo(hero, Info_Mod_August_Penner2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Metzger_August_Info()
{
	AI_Output(hero, self, "Info_Mod_Metzger_August_15_00"); //Ich brauche gepökeltes Lamm. So drei Portionen.
	AI_Output(self, hero, "Info_Mod_Metzger_August_08_01"); //Gerne. Aber das Fleisch liegt noch in der Lake. Muss noch zwei Stunden ziehen.
	AI_Output(self, hero, "Info_Mod_Metzger_August_08_02"); //Wenn du später wiederkommen willst ...
	AI_Output(hero, self, "Info_Mod_Metzger_August_15_03"); //Aber gerne. Bis später.

	B_LogEntry	(TOPIC_MOD_JG_AUGUST, "Des Metzgers Pökelfeisch braucht noch etwa zwei Stunden, bis ich es abholen kann.");

	Npc_SetRefuseTalk	(self, 3600);
};

INSTANCE Info_Mod_Metzger_August02 (C_INFO)
{
	npc		= Mod_7576_OUT_Metzger_REL;
	nr		= 1;
	condition	= Info_Mod_Metzger_August02_Condition;
	information	= Info_Mod_Metzger_August02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ist das Fleisch fertig?";
};

FUNC INT Info_Mod_Metzger_August02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Metzger_August))
	&& (Npc_RefuseTalk(self) == FALSE)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 30)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Metzger_August02_Info()
{
	AI_Output(hero, self, "Info_Mod_Metzger_August02_15_00"); //Ist das Fleisch fertig?
	AI_Output(self, hero, "Info_Mod_Metzger_August02_08_01"); //Habe dir schon 3 Keulen eingepackt. Hier. Das macht 30 Gold.

	if (Mod_Verhandlungsgeschick > 0)
	{
		AI_Output(hero, self, "Info_Mod_Metzger_August02_15_02"); //Sagen wir 15 Gold ...

		if (self.aivar[AIV_Verhandlung] == TRUE)
		{
			AI_Output(self, hero, "Info_Mod_Metzger_August02_08_03"); //20, mehr kann ich dir nicht erlassen.

			B_RaiseHandelsgeschick (1);

			B_GiveInvItems	(hero, self, ItMi_Gold, 20);
		}
		else
		{
			AI_Output(self, hero, "Info_Mod_Metzger_August02_08_04"); //30 Gold habe ich gesagt, dabei bleibt es auch.

			B_GiveInvItems	(hero, self, ItMi_Gold, 30);
		};
	}
	else
	{
		B_GiveInvItems	(hero, self, ItMi_Gold, 30);
	};

	AI_Output(hero, self, "Info_Mod_Metzger_August02_15_05"); //Hier hast du das Gold.
	AI_Output(self, hero, "Info_Mod_Metzger_August02_08_06"); //Und du das Fleisch.

	B_GiveInvItems	(self, hero, ItFo_LammPoekelfleisch, 3);
};

INSTANCE Info_Mod_Metzger_Kissen (C_INFO)
{
	npc		= Mod_7576_OUT_Metzger_REL;
	nr		= 1;
	condition	= Info_Mod_Metzger_Kissen_Condition;
	information	= Info_Mod_Metzger_Kissen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich suche ein Säckchen voll Federn.";
};

FUNC INT Info_Mod_Metzger_Kissen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Morpheus_Kissen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Metzger_Kissen_Info()
{
	AI_Output(hero, self, "Info_Mod_Metzger_Kissen_15_00"); //Ich suche ein Säckchen voll Federn.
	AI_Output(self, hero, "Info_Mod_Metzger_Kissen_08_01"); //Da hast du Glück. Ich habe gestern geschlachtet, weil Peter Venger bestellt hat.
	AI_Output(hero, self, "Info_Mod_Metzger_Kissen_15_02"); //Ich könnte die ...
	AI_Output(self, hero, "Info_Mod_Metzger_Kissen_08_03"); //... mitnehmen, ganz recht. Ich kann damit sowieso nichts anfangen.

	B_GiveInvItems	(self, hero, ItMi_Federbeutel, 1);

	B_LogEntry	(TOPIC_MOD_ASS_KISSEN, "Ich hab den Beutel Federn vom Metzger. Ich sollte noch mal bei Morpheus vorbei schauen, der Beutel scheint mir doch recht kratzig zu sein.");
};

INSTANCE Info_Mod_Metzger_Blutkelch (C_INFO)
{
	npc		= Mod_7576_OUT_Metzger_REL;
	nr		= 1;
	condition	= Info_Mod_Metzger_Blutkelch_Condition;
	information	= Info_Mod_Metzger_Blutkelch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du Moleratfett?";
};

FUNC INT Info_Mod_Metzger_Blutkelch_Condition()
{
	if (Mod_ASS_Blutkelch3 == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Metzger_Blutkelch_Info()
{
	AI_Output(hero, self, "Info_Mod_Metzger_Blutkelch_15_00"); //Hast du Moleratfett?
	AI_Output(self, hero, "Info_Mod_Metzger_Blutkelch_08_01"); //Gewiss. In meinem Beruf fällt immer etwas Fett ab.
	AI_Output(hero, self, "Info_Mod_Metzger_Blutkelch_15_02"); //Das du in die Wurst machst, denke ich.
	AI_Output(self, hero, "Info_Mod_Metzger_Blutkelch_08_03"); //Na und? Eine Wurst ohne Fett? Da kannst du gleich Dörrfleisch essen.
	AI_Output(hero, self, "Info_Mod_Metzger_Blutkelch_15_04"); //Schon gut. Ich brauche 50 Portionen Moleratfett.
	AI_Output(self, hero, "Info_Mod_Metzger_Blutkelch_08_05"); //So viel hab ich nicht. Die Wurst ...
	AI_Output(hero, self, "Info_Mod_Metzger_Blutkelch_15_06"); //Und wie kommen wir weiter?
	AI_Output(self, hero, "Info_Mod_Metzger_Blutkelch_08_07"); //Am besten, du machst es selber.
	AI_Output(hero, self, "Info_Mod_Metzger_Blutkelch_15_08"); //Aha. Und wie?
	AI_Output(self, hero, "Info_Mod_Metzger_Blutkelch_08_09"); //Ich kann dir beibringen, wie man Tieren das Fett abnimmt.
	AI_Output(hero, self, "Info_Mod_Metzger_Blutkelch_15_10"); //Lass hören.
	AI_Output(self, hero, "Info_Mod_Metzger_Blutkelch_08_11"); //Es lohnt sich eigentlich nur bei Molerats. Bei Felltieren oder Tieren mit Panzer kommt man nur an wenig Fett ran.
	AI_Output(self, hero, "Info_Mod_Metzger_Blutkelch_08_12"); //Vielleicht noch die Riesenratten. Aber die sind ja, Adanos sei Dank, selten geworden.
	AI_Output(hero, self, "Info_Mod_Metzger_Blutkelch_15_13"); //So weit, so gut. Und dann?
	AI_Output(self, hero, "Info_Mod_Metzger_Blutkelch_08_14"); //Du nimmst dein Messer oder was du sonst zum Ausweiden nimmst, machst einen tiefen Schnitt und säbelst dann ringsum die Haut mit der oberen Fettschicht ab.
	AI_Output(self, hero, "Info_Mod_Metzger_Blutkelch_08_15"); //Das Fleisch wirst du ja eh verwenden, denke ich.
	AI_Output(hero, self, "Info_Mod_Metzger_Blutkelch_15_16"); //Natürlich.
	AI_Output(self, hero, "Info_Mod_Metzger_Blutkelch_08_17"); //Lass mich ausreden. Du nimmst also diese Hülle, schneidest sie in Streifen und wirfst das Ganze in einen Kessel auf kleinem Feuer.
	AI_Output(self, hero, "Info_Mod_Metzger_Blutkelch_08_18"); //Es köchelt eine zeitlang. Wenn es anfängt zu schäumen, nimmst du den Kessel vom Feuer, fischst die Schwarten heraus und gibst eine Handvoll Salz dazu.
	AI_Output(self, hero, "Info_Mod_Metzger_Blutkelch_08_19"); //Dann kräftig umrühren. Wenn das Fett fest geworden ist, kannst du es rausschöpfen. Das wäre alles.
	AI_Output(hero, self, "Info_Mod_Metzger_Blutkelch_15_20"); //Grandios! Kessel hab ich keinen, Salz habe ich noch nicht gesehen, seit ich auf Khorinis gelandet bin. Und das ist lange her.
	AI_Output(self, hero, "Info_Mod_Metzger_Blutkelch_08_21"); //Vorschlag. Du jagst die Molerats, nimmst sie aus und bringst die Streifen zu mir. Den Rest mache ich.
	AI_Output(hero, self, "Info_Mod_Metzger_Blutkelch_15_22"); //Und wieviel Tiere muss ich erlegen?
	AI_Output(self, hero, "Info_Mod_Metzger_Blutkelch_08_23"); //Ich denke mal, so acht schön Streifen. Im Wald hinter dem See wimmelt es von denen.

	B_LogEntry	(TOPIC_MOD_ASS_FETT, "Ich soll dem Metzger acht Streifen von Molerats bringen. Daraus wird er mit das Fett extrahieren.");
};

INSTANCE Info_Mod_Metzger_Blutkelch2 (C_INFO)
{
	npc		= Mod_7576_OUT_Metzger_REL;
	nr		= 1;
	condition	= Info_Mod_Metzger_Blutkelch2_Condition;
	information	= Info_Mod_Metzger_Blutkelch2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier hab ich die Streifen.";
};

FUNC INT Info_Mod_Metzger_Blutkelch2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Metzger_Blutkelch))
	&& (Npc_HasItems(hero, ItMi_Moleratstreifen) >= 8)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Metzger_Blutkelch2_Info()
{
	AI_Output(hero, self, "Info_Mod_Metzger_Blutkelch2_15_00"); //Hier hab ich die Streifen.

	B_GiveInvItems	(hero, self, ItMi_Moleratstreifen, 8);

	AI_Output(self, hero, "Info_Mod_Metzger_Blutkelch2_08_01"); //Prima. Ich muss mich um das Fett kümmern. In drei Stunden sollte es fertig und ausgekühlt sein.

	Npc_SetRefuseTalk (self, 500);
};

INSTANCE Info_Mod_Metzger_Blutkelch3 (C_INFO)
{
	npc		= Mod_7576_OUT_Metzger_REL;
	nr		= 1;
	condition	= Info_Mod_Metzger_Blutkelch3_Condition;
	information	= Info_Mod_Metzger_Blutkelch3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Metzger_Blutkelch3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Metzger_Blutkelch2))
	&& (Npc_RefuseTalk(self) == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Metzger_Blutkelch3_Info()
{
	AI_Output(self, hero, "Info_Mod_Metzger_Blutkelch3_08_00"); //Du kommst gerade richtig. Das Fett ist fertig. Hier, deine Portionen. Den Rest nehme ich für meine Arbeit.

	B_GiveInvItems	(self, hero, ItMi_Moleratlubric_MIS, 50);

	AI_Output(hero, self, "Info_Mod_Metzger_Blutkelch3_15_01"); //Wie du meinst. Danke jedenfalls.

	B_LogEntry	(TOPIC_MOD_ASS_FETT, "Habe endlich das Fett für Bennet. Die Stahlhacke sollte fertig sein ...");
	B_SetTopicStatus	(TOPIC_MOD_ASS_FETT, LOG_SUCCESS);

	B_GivePlayerXP	(250);
};

INSTANCE Info_Mod_Metzger_Blutkelch4 (C_INFO)
{
	npc		= Mod_7576_OUT_Metzger_REL;
	nr		= 1;
	condition	= Info_Mod_Metzger_Blutkelch4_Condition;
	information	= Info_Mod_Metzger_Blutkelch4_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich brauche ein Stück Gepökeltes.";
};

FUNC INT Info_Mod_Metzger_Blutkelch4_Condition()
{
	if (!Npc_KnowsInfo(hero, Info_Mod_Idrico_Blutkelch2))
	&& (Mod_ASS_IdricoSpende == 1)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Metzger_Blutkelch4_Info()
{
	AI_Output(hero, self, "Info_Mod_Metzger_Blutkelch4_15_00"); //Ich brauche ein Stück Gepökeltes.
	AI_Output(self, hero, "Info_Mod_Metzger_Blutkelch4_08_01"); //Stets zu Diensten. Darf's diese Lammkeule sein? Ist schon etwas älter. Aber Gepökeltes hält sich ja lange.

	B_GiveInvItems	(self, hero, ItFo_LammPoekelfleisch, 1);

	AI_Output(hero, self, "Info_Mod_Metzger_Blutkelch4_15_02"); //Gerade gut genug für den Wasserkauz. Wieviel?
	AI_Output(self, hero, "Info_Mod_Metzger_Blutkelch4_08_03"); //2 Gold, wenn's beliebt.
	AI_Output(hero, self, "Info_Mod_Metzger_Blutkelch4_15_04"); //Gerne. Hier.

	B_GiveInvItems	(hero, self, ItMi_Gold, 2);
};

INSTANCE Info_Mod_Metzger_Pickpocket (C_INFO)
{
	npc		= Mod_7576_OUT_Metzger_REL;
	nr		= 1;
	condition	= Info_Mod_Metzger_Pickpocket_Condition;
	information	= Info_Mod_Metzger_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Metzger_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Metzger_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Metzger_Pickpocket);

	Info_AddChoice	(Info_Mod_Metzger_Pickpocket, DIALOG_BACK, Info_Mod_Metzger_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Metzger_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Metzger_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Metzger_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Metzger_Pickpocket);
};

FUNC VOID Info_Mod_Metzger_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Metzger_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Metzger_Pickpocket);

		Info_AddChoice	(Info_Mod_Metzger_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Metzger_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Metzger_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Metzger_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Metzger_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Metzger_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Metzger_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Metzger_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Metzger_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Metzger_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Metzger_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Metzger_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Metzger_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Metzger_EXIT (C_INFO)
{
	npc		= Mod_7576_OUT_Metzger_REL;
	nr		= 1;
	condition	= Info_Mod_Metzger_EXIT_Condition;
	information	= Info_Mod_Metzger_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Metzger_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Metzger_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};