INSTANCE Info_Mod_Den_Hi (C_INFO)
{
	npc		= Mod_969_MIL_Den_NW;
	nr		= 1;
	condition	= Info_Mod_Den_Hi_Condition;
	information	= Info_Mod_Den_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Den_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Den_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Den_Hi_01_01"); //Ich bin Den, Stadtwache von Khorinis.
};

INSTANCE Info_Mod_Den_Stadtwache (C_INFO)
{
	npc		= Mod_969_MIL_Den_NW;
	nr		= 1;
	condition	= Info_Mod_Den_Stadtwache_Condition;
	information	= Info_Mod_Den_Stadtwache_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du bist also bei der Stadtwache?";
};

FUNC INT Info_Mod_Den_Stadtwache_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Den_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Den_Stadtwache_Info()
{
	AI_Output(hero, self, "Info_Mod_Den_Stadtwache_15_00"); //Du bist also bei der Stadtwache?
	AI_Output(self, hero, "Info_Mod_Den_Stadtwache_01_01"); //He, warum der vorwurfsvolle Unterton?
	AI_Output(hero, self, "Info_Mod_Den_Stadtwache_15_02"); //Welcher vorwurfsvolle Unterton?
	AI_Output(self, hero, "Info_Mod_Den_Stadtwache_01_03"); //Meinst wohl, das höre ich nicht? Aber wir sind gar nicht alle so schlimm bei der Miliz, nur die wenigsten arbeiten mit der Diebesgilde zusammen und mit den Diebstählen vor drei Tagen habe ich nicht das geringste zu tun!
	AI_Output(hero, self, "Info_Mod_Den_Stadtwache_15_04"); //Na, dann brauchst du ja keine Angst vor meinen Fragen zu haben.
	AI_Output(self, hero, "Info_Mod_Den_Stadtwache_01_05"); //Ich will mir bloß nichts anhängen lassen! Meine Methoden sind absolut sauber und ich habe mir in meiner knapp dreijährigen Dienstzeit noch nichts zuschulden kommen lassen!
};

INSTANCE Info_Mod_Den_Raeuber (C_INFO)
{
	npc		= Mod_969_MIL_Den_NW;
	nr		= 1;
	condition	= Info_Mod_Den_Raeuber_Condition;
	information	= Info_Mod_Den_Raeuber_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hilda hat mir von einer Räuberbande vor Khorinis erzählt.";
};

FUNC INT Info_Mod_Den_Raeuber_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Den_Stadtwache))
	&& (Npc_KnowsInfo(hero, Info_Mod_Hilda_Argez))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Den_Raeuber_Info()
{
	AI_Output(hero, self, "Info_Mod_Den_Raeuber_15_00"); //Hilda hat mir von einer Räuberbande vor Khorinis erzählt. Was weißt du darüber?
	AI_Output(self, hero, "Info_Mod_Den_Raeuber_01_01"); //Kaum etwas. Hilda hat uns nicht ausreichend genug in ihren leckeren Fleischpasteten wühlen lassen, damit wir nennenswerte Hinweise finden konnten.
	AI_Output(hero, self, "Info_Mod_Den_Raeuber_15_02"); //Was hat Fleischpastete mit dem Stehlen von Schafen zu tun?
	AI_Output(self, hero, "Info_Mod_Den_Raeuber_01_03"); //Das kann man vorher ja nicht wissen.
	AI_Output(self, hero, "Info_Mod_Den_Raeuber_01_04"); //Und ohne Einsichtnahme in die Fleischpasteten war die Hausdurchsuchung nicht vollständig, und somit konnte ich keinen Abschlussbericht schreiben, was uns auf der Suche nach den Verbrechern auch nicht gerade weiterhilft!
	AI_Output(hero, self, "Info_Mod_Den_Raeuber_15_05"); //Was wisst ihr denn jetzt überhaupt von den Räubern?
	AI_Output(self, hero, "Info_Mod_Den_Raeuber_01_06"); //Eine einfache Bande von Vogelfreien, die seit ein paar Monaten in der Gegend umherstreift und in der letzten Zeit offensichtlich ein eigenes Lager gefunden hat.
	AI_Output(self, hero, "Info_Mod_Den_Raeuber_01_07"); //Wie viele Überfälle genau auf ihr Konto gehen, wissen wir nicht. Generell unterscheiden sie sich von den anderen Banditen dadurch, dass sie keinen Ehrenkodex haben.
	AI_Output(self, hero, "Info_Mod_Den_Raeuber_01_08"); //Ich kenne jemanden, der auch jemanden kennt, der kurzfristigen Kontakt zu den Dieben in dieser Stadt hatte und der erfahren hat, dass selbst die Diebe diese Räuber verachten.
	AI_Output(self, hero, "Info_Mod_Den_Raeuber_01_09"); //Diese Halunken machen sich also keine Freunde, und wenn sie keine Verbindungsmänner finden, wird es dauerhaft schwierig für sie, oh ja.
};

INSTANCE Info_Mod_Den_Dienstzeit (C_INFO)
{
	npc		= Mod_969_MIL_Den_NW;
	nr		= 1;
	condition	= Info_Mod_Den_Dienstzeit_Condition;
	information	= Info_Mod_Den_Dienstzeit_Info;
	permanent	= 0;
	important	= 0;
	description	= "Seit drei Jahren im Amt? Was hast du vorher gemacht?";
};

FUNC INT Info_Mod_Den_Dienstzeit_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Den_Stadtwache))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Den_Dienstzeit_Info()
{
	AI_Output(hero, self, "Info_Mod_Den_Dienstzeit_15_00"); //Seit drei Jahren im Amt? Was hast du vorher gemacht?
	AI_Output(self, hero, "Info_Mod_Den_Dienstzeit_01_01"); //(abwehrend) Gar nichts! Gar nichts Schlimmes! Die Sache mit der Diebesgilde, das war was Einmaliges!
	AI_Output(hero, self, "Info_Mod_Den_Dienstzeit_15_02"); //Du standest mit der Diebesgilde in Kontakt?
	AI_Output(self, hero, "Info_Mod_Den_Dienstzeit_01_03"); //Ich komme aus dem Hafenviertel, da muss man sehen, wo man bleibt. Es wird keiner zugeben, aber die Diebesgilde kontrolliert weite Teile des Viertels.
	AI_Output(self, hero, "Info_Mod_Den_Dienstzeit_01_04"); //Jeder dort kommt früher oder später mit ihr in Kontakt.
};

INSTANCE Info_Mod_Den_Problem (C_INFO)
{
	npc		= Mod_969_MIL_Den_NW;
	nr		= 1;
	condition	= Info_Mod_Den_Problem_Condition;
	information	= Info_Mod_Den_Problem_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Den_Problem_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Den_Stadtwache))
	&& (Wld_GetDay() >= 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Den_Problem_Info()
{
	AI_Output(self, hero, "Info_Mod_Den_Problem_01_00"); //Pst! Hör mal!
	AI_Output(hero, self, "Info_Mod_Den_Problem_15_01"); //Meinst du mich?
	AI_Output(self, hero, "Info_Mod_Den_Problem_01_02"); //Ja, genau. Du hast mich doch letztens so ausgefragt.
	AI_Output(hero, self, "Info_Mod_Den_Problem_15_03"); //Wenn du es so nennen willst.
	AI_Output(self, hero, "Info_Mod_Den_Problem_01_04"); //Ich hab dir alles erzählt, was du hören wolltest. Im Gegenzug könntest du mir vielleicht einen Gefallen tun - nichts Großes, keine Angst.
	AI_Output(hero, self, "Info_Mod_Den_Problem_15_05"); //Worum geht's?
	AI_Output(self, hero, "Info_Mod_Den_Problem_01_06"); //Ich hab so langsam das Patrouillieren satt. Jeden Tag latsch ich mir die Füße platt, das sollte was für die jungen Greenhorns sein.
	AI_Output(self, hero, "Info_Mod_Den_Problem_01_07"); //In der Kaserne ist jetzt eine Stelle frei geworden, Ruga ist abgehauen. Tja, aber nicht ich bin der heißeste Anwärter auf den Posten, sondern Rangar, der faule Drecksack.
	AI_Output(self, hero, "Info_Mod_Den_Problem_01_08"); //Rangar hat garantiert Dreck am Stecken, aber komischerweise will Lord Andre davon nichts wissen. Da müssen ihm mal die Augen geöffnet werden.
	AI_Output(hero, self, "Info_Mod_Den_Problem_15_09"); //Was schwebt dir da vor?
	AI_Output(self, hero, "Info_Mod_Den_Problem_01_10"); //Du sollst ein schlechtes Licht auf Rangar werfen. Verbreite Gerüchte über ihn, schmuggle verbotene Waren in seine Truhe, und dann berichte Lord Andre davon.
	AI_Output(self, hero, "Info_Mod_Den_Problem_01_11"); //Kriegst du das hin?

	Info_ClearChoices	(Info_Mod_Den_Problem);

	Info_AddChoice	(Info_Mod_Den_Problem, "Zu gefährlich. Damit will ich nichts zu tun haben.", Info_Mod_Den_Problem_B);
	Info_AddChoice	(Info_Mod_Den_Problem, "Klar. Aber das ist dir doch sicher auch was wert ...", Info_Mod_Den_Problem_A);
};

FUNC VOID Info_Mod_Den_Problem_B()
{
	AI_Output(hero, self, "Info_Mod_Den_Problem_B_15_00"); //Zu gefährlich. Damit will ich nichts zu tun haben.
	AI_Output(self, hero, "Info_Mod_Den_Problem_B_01_01"); //Du bist ja nicht gerade ein guter Freund.

	Info_ClearChoices	(Info_Mod_Den_Problem);
};

FUNC VOID Info_Mod_Den_Problem_A()
{
	AI_Output(hero, self, "Info_Mod_Den_Problem_A_15_00"); //Klar. Aber das ist dir doch sicher auch was wert ...
	AI_Output(self, hero, "Info_Mod_Den_Problem_A_01_01"); //Ein paar Münzen würden für dich als Bezahlung rausspringen.

	Log_CreateTopic	(TOPIC_MOD_DENSPROBLEM, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_DENSPROBLEM, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_DENSPROBLEM, "Der Milizsoldat Den wartet vergeblich auf eine Beförderung, da Rangar ihn scheinbar bei Lord Andre schlecht macht. Ich soll jetzt das Gleiche mit Rangar machen: Gerüchte über ihn verbreiten, verbotene Waren in seine Truhe schmuggeln und ihn dann bei Lord Andre anschwärzen.");

	Info_ClearChoices	(Info_Mod_Den_Problem);

	Mod_Den_Problem = 1;
};

INSTANCE Info_Mod_Den_Verbotenes (C_INFO)
{
	npc		= Mod_969_MIL_Den_NW;
	nr		= 1;
	condition	= Info_Mod_Den_Verbotenes_Condition;
	information	= Info_Mod_Den_Verbotenes_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was für verbotene Waren meinst du?";
};

FUNC INT Info_Mod_Den_Verbotenes_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Den_Problem))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Andre_Rangar))
	&& (Mod_DenVerpfiffen == 0)
	&& (Mod_Den_Problem == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Den_Verbotenes_Info()
{
	AI_Output(hero, self, "Info_Mod_Den_Verbotenes_15_00"); //Was für verbotene Waren meinst du?
	AI_Output(self, hero, "Info_Mod_Den_Verbotenes_01_01"); //Ein Stängel Sumpfkraut würde schon reichen. Lord Andre hat uns das Zeug untersagt.
	AI_Output(self, hero, "Info_Mod_Den_Verbotenes_01_02"); //Wenn er jemanden von der Miliz damit erwischt, dann gibt das richtig Ärger.
	AI_Output(self, hero, "Info_Mod_Den_Verbotenes_01_03"); //Noch besser wäre natürlich ein ganzes Paket Sumpfkraut, aber da kommst du nicht so leicht ran.

	B_LogEntry	(TOPIC_MOD_DENSPROBLEM, "Bei den verbotenen Waren, die Den vorschweben, handelt es sich um Sumpfkraut. Ein Stängel sollte schon reichen, ein ganzes Paket wäre aber noch besser. Den meint nur, dass man da nicht so leicht ran kommen wird.");
};

INSTANCE Info_Mod_Den_RangarsTruhe (C_INFO)
{
	npc		= Mod_969_MIL_Den_NW;
	nr		= 1;
	condition	= Info_Mod_Den_RangarsTruhe_Condition;
	information	= Info_Mod_Den_RangarsTruhe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wo finde ich Rangars Truhe?";
};

FUNC INT Info_Mod_Den_RangarsTruhe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Den_Problem))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Andre_Rangar))
	&& (Mod_DenVerpfiffen == 0)
	&& (Mod_Den_Problem == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Den_RangarsTruhe_Info()
{
	AI_Output(hero, self, "Info_Mod_Den_RangarsTruhe_15_00"); //Wo finde ich Rangars Truhe?
	AI_Output(self, hero, "Info_Mod_Den_RangarsTruhe_01_01"); //Die steht in seiner Nähe, an der Mauer beim Freibierstand.

	B_LogEntry	(TOPIC_MOD_DENSPROBLEM, "Rangars Truhe finde ich in seiner Nähe, an der Mauer beim Freibierstand.");
};

INSTANCE Info_Mod_Den_Rangar (C_INFO)
{
	npc		= Mod_969_MIL_Den_NW;
	nr		= 1;
	condition	= Info_Mod_Den_Rangar_Condition;
	information	= Info_Mod_Den_Rangar_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab mit Lord Andre gesprochen.";
};

FUNC INT Info_Mod_Den_Rangar_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_Rangar))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Den_Rangar_Info()
{
	AI_Output(hero, self, "Info_Mod_Den_Rangar_15_00"); //Ich hab mit Lord Andre gesprochen.
	AI_Output(self, hero, "Info_Mod_Den_Rangar_01_01"); //Und was hat er gesagt?
	AI_Output(hero, self, "Info_Mod_Den_Rangar_15_02"); //Er wird die Sachen überprüfen.
	AI_Output(self, hero, "Info_Mod_Den_Rangar_01_03"); //Sehr gut, hier ist deine Belohnung.

	B_GiveInvItems	(self, hero, ItMi_Gold, 150);

	B_GivePlayerXP	(100);

	B_SetTopicStatus	(TOPIC_MOD_DENSPROBLEM, LOG_SUCCESS);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Den_Checker (C_INFO)
{
	npc		= Mod_969_MIL_Den_NW;
	nr		= 1;
	condition	= Info_Mod_Den_Checker_Condition;
	information	= Info_Mod_Den_Checker_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du weißt ja wirklich gut Bescheid ...";
};

FUNC INT Info_Mod_Den_Checker_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Den_Dienstzeit))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Den_Checker_Info()
{
	AI_Output(hero, self, "Info_Mod_Den_Checker_15_00"); //Du weißt ja wirklich gut Bescheid ...
	AI_Output(self, hero, "Info_Mod_Den_Checker_01_01"); //He, ich erledige meinen Job eben gewissenhaft! So viel Wissen kann man sich auch aneignen, ohne jahrelang Botengänge für die Diebesgilde erledigt zu haben!
};

INSTANCE Info_Mod_Den_Lernen_Armbrust (C_INFO)
{
	npc		= Mod_969_MIL_Den_NW;
	nr		= 1;
	condition	= Info_Mod_Den_Lernen_Armbrust_Condition;
	information	= Info_Mod_Den_Lernen_Armbrust_Info;
	permanent	= 1;
	important	= 0;
	description	= "Bring mir Armbrustschießen bei.";
};

FUNC INT Info_Mod_Den_Lernen_Armbrust_Condition()
{
	if (hero.hitchance[NPC_TALENT_CrossBow] < 50)
	&& (Mod_Schwierigkeit != 4)
	&& (Mod_Miliz_Armbrust)
	&& (Mod_Den_Problem == 1)
	&& (Mod_DenVerpfiffen == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Den_Lernen_Armbrust_Info()
{
	AI_Output(hero, self, "Info_Mod_Den_Lernen_Armbrust_15_00"); //Bring mir Armbrustschießen bei.

	Info_ClearChoices	(Info_Mod_Den_Lernen_Armbrust);
	
	Info_AddChoice	(Info_Mod_Den_Lernen_Armbrust, "Zurück.", Info_Mod_Den_Lernen_Armbrust_BACK);
	Info_AddChoice	(Info_Mod_Den_Lernen_Armbrust, B_BuildLearnString(PRINT_LearnCrossBow5, B_GetLearnCostTalent_New(hero, NPC_TALENT_CrossBow)), Info_Mod_Den_Lernen_Armbrust_5);
	Info_AddChoice	(Info_Mod_Den_Lernen_Armbrust, B_BuildLearnString(PRINT_LearnCrossBow1, B_GetLearnCostTalent(hero, NPC_TALENT_CrossBow, 1)), Info_Mod_Den_Lernen_Armbrust_1);
};

FUNC VOID Info_Mod_Den_Lernen_Armbrust_BACK()
{
	Info_ClearChoices	(Info_Mod_Den_Lernen_Armbrust);
};

FUNC VOID Info_Mod_Den_Lernen_Armbrust_5()
{
	B_TeachFightTalentPercent_New (self, hero, NPC_TALENT_CrossBow, 5, 60);

	Info_ClearChoices	(Info_Mod_Den_Lernen_Armbrust);

	Info_AddChoice	(Info_Mod_Den_Lernen_Armbrust, "Zurück.", Info_Mod_Den_Lernen_Armbrust_BACK);
	Info_AddChoice	(Info_Mod_Den_Lernen_Armbrust, B_BuildLearnString(PRINT_LearnCrossBow5, B_GetLearnCostTalent_New(hero, NPC_TALENT_CrossBow)), Info_Mod_Den_Lernen_Armbrust_5);
	Info_AddChoice	(Info_Mod_Den_Lernen_Armbrust, B_BuildLearnString(PRINT_LearnCrossBow1, B_GetLearnCostTalent(hero, NPC_TALENT_CrossBow, 1)), Info_Mod_Den_Lernen_Armbrust_1);
};

FUNC VOID Info_Mod_Den_Lernen_Armbrust_1()
{
	B_TeachFightTalentPercent (self, hero, NPC_TALENT_CrossBow, 1, 60);

	Info_ClearChoices	(Info_Mod_Den_Lernen_Armbrust);

	Info_AddChoice	(Info_Mod_Den_Lernen_Armbrust, "Zurück.", Info_Mod_Den_Lernen_Armbrust_BACK);
	Info_AddChoice	(Info_Mod_Den_Lernen_Armbrust, B_BuildLearnString(PRINT_LearnCrossBow5, B_GetLearnCostTalent_New(hero, NPC_TALENT_CrossBow)), Info_Mod_Den_Lernen_Armbrust_5);
	Info_AddChoice	(Info_Mod_Den_Lernen_Armbrust, B_BuildLearnString(PRINT_LearnCrossBow1, B_GetLearnCostTalent(hero, NPC_TALENT_CrossBow, 1)), Info_Mod_Den_Lernen_Armbrust_1);
};

INSTANCE Info_Mod_Den_Pickpocket (C_INFO)
{
	npc		= Mod_969_MIL_Den_NW;
	nr		= 1;
	condition	= Info_Mod_Den_Pickpocket_Condition;
	information	= Info_Mod_Den_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Den_Pickpocket_Condition()
{
	C_Beklauen	(60, ItMi_Gold, 18);
};

FUNC VOID Info_Mod_Den_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Den_Pickpocket);

	Info_AddChoice	(Info_Mod_Den_Pickpocket, DIALOG_BACK, Info_Mod_Den_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Den_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Den_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Den_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Den_Pickpocket);
};

FUNC VOID Info_Mod_Den_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Den_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Den_Pickpocket);

		Info_AddChoice	(Info_Mod_Den_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Den_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Den_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Den_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Den_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Den_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Den_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Den_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Den_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Den_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Den_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Den_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Den_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Den_EXIT (C_INFO)
{
	npc		= Mod_969_MIL_Den_NW;
	nr		= 1;
	condition	= Info_Mod_Den_EXIT_Condition;
	information	= Info_Mod_Den_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Den_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Den_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};