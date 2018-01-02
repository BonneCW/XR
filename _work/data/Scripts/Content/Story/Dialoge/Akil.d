INSTANCE Info_Mod_Akil_Hi (C_INFO)
{
	npc		= Mod_900_BAU_Akil_NW;
	nr		= 1;
	condition	= Info_Mod_Akil_Hi_Condition;
	information	= Info_Mod_Akil_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Akil_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Akil_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Akil_Hi_16_00"); //Wenn dir dein Leben lieb ist, verlasse dieses Haus. Nur Krankheit und Tod kannst du hier finden.
};

INSTANCE Info_Mod_Akil_Blablabla (C_INFO)
{
	npc		= Mod_900_BAU_Akil_NW;
	nr		= 1;
	condition	= Info_Mod_Akil_Blablabla_Condition;
	information	= Info_Mod_Akil_Blablabla_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was ist mit ...";
};

FUNC INT Info_Mod_Akil_Blablabla_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Akil_Hi))
	&& (Npc_HasItems(hero, ItPo_HealBesessenheit) < 3)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Akil_Heilung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Akil_Blablabla_Info()
{
	AI_Output(hero, self, "Info_Mod_Akil_Blablabla_15_00"); //Was ist mit ...
	AI_Output(Self, hero, "Info_Mod_Akil_Blablabla_16_01"); //Unglücksseliger! Geh, solange du noch kannst! Wenn du reden willst, geh zu Telbor.
	
	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Akil_Heilung (C_INFO)
{
	npc		= Mod_900_BAU_Akil_NW;
	nr		= 1;
	condition	= Info_Mod_Akil_Heilung_Condition;
	information	= Info_Mod_Akil_Heilung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier, das sollte euer Leiden lindern.";
};

FUNC INT Info_Mod_Akil_Heilung_Condition()

{
	if (Npc_KnowsInfo(hero, Info_Mod_Akil_Hi))
	&& (Npc_HasItems(hero, ItPo_HealBesessenheit) >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Akil_Heilung_Info()
{
	AI_Output(hero, self, "Info_Mod_Akil_Heilung_15_00"); //Hier, das sollte euer Leiden lindern.

	B_GiveInvItems	(hero, self, ItPo_HealBesessenheit, 3);

	B_UseItem	(self, ItPo_HealBesessenheit);

	AI_Output(Self, hero, "Info_Mod_Akil_Heilung_16_01"); //Hab vielen Dank, ich weiß nicht, wie ich es gut machen soll.
	
	AI_StopProcessInfos	(self);

	B_GivePlayerXP	(350);

	B_StartOtherRoutine	(Mod_906_BAU_Randolph_NW, "FOLLOWPLAYER");

	B_LogEntry	(TOPIC_MOD_AKILSHOF, "Ich habe Akil das Heilmittel gegeben ...");
};

INSTANCE Info_Mod_Akil_Randolph (C_INFO)
{
	npc		= Mod_900_BAU_Akil_NW;
	nr		= 1;
	condition	= Info_Mod_Akil_Randolph_Condition;
	information	= Info_Mod_Akil_Randolph_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Akil_Randolph_Condition()

{
	if (Npc_KnowsInfo(hero, Info_Mod_Akil_Heilung))
	&& (Npc_KnowsInfo(hero, Info_Mod_Randolph_Hi))
	&& (Kapitel >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Akil_Randolph_Info()
{
	AI_Output(Self, hero, "Info_Mod_Akil_Randolph_16_00"); //Dieser Narr, hätte er doch nur den Trank eingenommen.
	AI_Output(hero, self, "Info_Mod_Akil_Randolph_15_01"); //Sprichst du von Randolph?
	AI_Output(Self, hero, "Info_Mod_Akil_Randolph_16_02"); //Ja. Nach dem Zwischenfall mit der dunklen Gestalt schien es ihm zuerst sehr gut zu gehen.
	AI_Output(Self, hero, "Info_Mod_Akil_Randolph_16_03"); //Mehr noch, er hatte Kraft und Ausdauer für drei und hat mühelos Arbeiten an einem Tag verrichtet, für welche man sonst eine Woche gebraucht hätte.
	AI_Output(Self, hero, "Info_Mod_Akil_Randolph_16_04"); //Doch mit der Zeit wurde er zunehmend schwermütiger und begann sich von den anderen auf dem Hof zurückzuziehen.
	AI_Output(Self, hero, "Info_Mod_Akil_Randolph_16_05"); //Er schien von Stimmen gepeinigt, die sonst niemand hörte, und wachte nachts häufig schreiend auf.
	AI_Output(Self, hero, "Info_Mod_Akil_Randolph_16_06"); //Und gestern, ja, hat er dann vollkommen den Verstand verloren.
	AI_Output(hero, self, "Info_Mod_Akil_Randolph_15_07"); //Sprich weiter.
	AI_Output(Self, hero, "Info_Mod_Akil_Randolph_16_08"); //Viel zu erzählen gibt es nicht mehr.
	AI_Output(Self, hero, "Info_Mod_Akil_Randolph_16_09"); //Bei der Feldarbeit fing er auf einmal an, wild mit den Händen um sich zu schlagen, und brüllte, sie sollten ihn doch endlich in Frieden lassen.
	AI_Output(Self, hero, "Info_Mod_Akil_Randolph_16_10"); //Und ehe man sich versah, rannte er in den großen Wald und war verschwunden.
	AI_Output(Self, hero, "Info_Mod_Akil_Randolph_16_11"); //Telbor versuchte noch ihn zu verfolgen, verlor aber nahe dem Steinkreis seine Spur.
	AI_Output(Self, hero, "Info_Mod_Akil_Randolph_16_12"); //So sehr ich auch darauf hoffe, schwindet meine Hoffnung doch stündlich, ihn noch mal heil wieder zu sehen.
	
	Log_CreateTopic	(TOPIC_MOD_AKIL_RANDOLPH, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_AKIL_RANDOLPH, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_AKIL_RANDOLPH, "Randolph, der den heilenden Trank verschmähte, ist wie besessen in den Wald gerannt. Seine Spur hat sich nahe dem Steinkreis verloren.");
};

INSTANCE Info_Mod_Akil_RandolphWiederFit (C_INFO)
{
	npc		= Mod_900_BAU_Akil_NW;
	nr		= 1;
	condition	= Info_Mod_Akil_RandolphWiederFit_Condition;
	information	= Info_Mod_Akil_RandolphWiederFit_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Akil_RandolphWiederFit_Condition()

{
	if (Npc_KnowsInfo(hero, Info_Mod_Randolph_NoMoreDemon))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Akil_RandolphWiederFit_Info()
{
	AI_Output(Self, hero, "Info_Mod_Akil_RandolphWiederFit_16_00"); //Randolph ist zurück und wieder geheilt. Und du scheinst entscheidenden Anteil daran zu haben.
	AI_Output(Self, hero, "Info_Mod_Akil_RandolphWiederFit_16_01"); //Es ist nicht viel, was ich habe, aber nimm dieses Gold als Dank.
	
	B_GivePlayerXP	(400);

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);
};

INSTANCE Info_Mod_Akil_Untier (C_INFO)
{
	npc		= Mod_900_BAU_Akil_NW;
	nr		= 1;
	condition	= Info_Mod_Akil_Untier_Condition;
	information	= Info_Mod_Akil_Untier_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hattet ihr in den letzten Tagen vielleicht Ärger mit wilden Tieren?";
};

FUNC INT Info_Mod_Akil_Untier_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Akil_Hi))
	&& (Mod_Cronos_Artefakt == 2)
	&& (Npc_KnowsInfo(hero, Info_Mod_Akil_Heilung))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Cronos_AW_Artefakt_02))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Akil_Untier_Info()
{
	AI_Output(hero, self, "Info_Mod_Akil_Untier_15_00"); //Hattet ihr in den letzten Tagen vielleicht Ärger mit wilden Tieren?
	AI_Output(Self, hero, "Info_Mod_Akil_Untier_16_01"); //Ärger?! Das kann man wohl sagen.
	AI_Output(self, hero, "Info_Mod_Akil_Untier_16_02"); //Als ich gestern eine Ladung stark gepökelter Schafskeulen zu Orlans Taverne bringen wollte, hat mich das abscheulichste Untier angefallen, das ich je gesehen habe.
	AI_Output(Self, hero, "Info_Mod_Akil_Untier_16_03"); //Es war hoch wie ein groß gewachsener Mann, lief auf allen Vieren und fauchte bestialisch.
	AI_Output(Self, hero, "Info_Mod_Akil_Untier_16_04"); //Ich ließ meine wertvolle Fracht fallen und bin zum Hof zurückgelaufen.
	AI_Output(Self, hero, "Info_Mod_Akil_Untier_16_05"); //Von weitem konnte ich dann sehen, wie dieses Ungetüm sich über das Fleisch hermachte.
	AI_Output(Self, hero, "Info_Mod_Akil_Untier_16_06"); //Danach hat es sich einige Minuten am Boden gewunden - das viele Salz ist ihm wohl nicht bekommen – und ist dann fauchend an meinem Hof vorbei in den Wald gelaufen.
	AI_Output(Self, hero, "Info_Mod_Akil_Untier_16_07"); //Möge dieses Scheusal an dem Pökelfleisch verrecken.
	AI_Output(Self, hero, "Info_Mod_Akil_Untier_16_08"); //(wehmütig) Aber ich weiß jetzt wirklich nicht, wie ich den Verlust ausgleichen soll.
	AI_Output(Self, hero, "Info_Mod_Akil_Untier_16_09"); //Das Fleisch hätte mir einige Goldmünzen eingebracht und die Zeiten sind so hart ...

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_ADANOS_NOVIZE, "Akil bedauert den Verlust seines Pökelfleisches nach dem Angriff einer Bestie. Sie ist in den Wald hinter seinem Hof weitergelaufen.");
	
	Info_ClearChoices	(Info_Mod_Akil_Untier);

	Info_AddChoice	(Info_Mod_Akil_Untier, "Vielleicht kann ich dir helfen ...", Info_Mod_Akil_Untier_B);
	Info_AddChoice	(Info_Mod_Akil_Untier, "Nicht meine Sache.", Info_Mod_Akil_Untier_A);
};

FUNC VOID Info_Mod_Akil_Untier_F()
{
	AI_Output(Self, hero, "Info_Mod_Akil_Untier_F_16_00"); //Hab vielen Dank. Ich weiß nicht, wie ich das gutmachen soll.

	B_GivePlayerXP	(100);
	
	Info_ClearChoices	(Info_Mod_Akil_Untier);
};

FUNC VOID Info_Mod_Akil_Untier_E()
{
	AI_Output(hero, self, "Info_Mod_Akil_Untier_E_15_00"); //Mir fällt schon etwas ein.
	
	Info_ClearChoices	(Info_Mod_Akil_Untier);
};

FUNC VOID Info_Mod_Akil_Untier_D()
{
	AI_Output(hero, self, "Info_Mod_Akil_Untier_D_15_00"); //Hier hast du zehn Keulen.

	B_GiveInvItems	(hero, self, ItFo_MuttonRaw, 10);
	
	Info_Mod_Akil_Untier_F();
};

FUNC VOID Info_Mod_Akil_Untier_C()
{
	AI_Output(hero, self, "Info_Mod_Akil_Untier_C_15_00"); //Hier hast du 50 Goldmünzen.

	B_GiveInvItems	(hero, self, ItMi_Gold, 50);
	
	Info_Mod_Akil_Untier_F();
};

FUNC VOID Info_Mod_Akil_Untier_B()
{
	AI_Output(hero, self, "Info_Mod_Akil_Untier_B_15_00"); //Vielleicht kann ich dir helfen ...
	AI_Output(Self, hero, "Info_Mod_Akil_Untier_B_16_01"); //(hoffnungsvoll) Ja?
	
	Info_ClearChoices	(Info_Mod_Akil_Untier);

	Info_AddChoice	(Info_Mod_Akil_Untier, "Mir fällt schon etwas ein.", Info_Mod_Akil_Untier_E);
	if (Npc_HasItems(hero, ItFo_MuttonRaw) >= 10)
	{
		Info_AddChoice	(Info_Mod_Akil_Untier, "Hier hast du zehn Keulen.", Info_Mod_Akil_Untier_D);
	};
	if (Npc_HasItems(hero, ItMi_Gold) >= 50)
	{
		Info_AddChoice	(Info_Mod_Akil_Untier, "Hier hast du 50 Goldmünzen.", Info_Mod_Akil_Untier_C);
	};
};

FUNC VOID Info_Mod_Akil_Untier_A()
{
	AI_Output(hero, self, "Info_Mod_Akil_Untier_A_15_00"); //Nicht meine Sache.
	
	Info_ClearChoices	(Info_Mod_Akil_Untier);
};

INSTANCE Info_Mod_Akil_Lich (C_INFO)
{
	npc		= Mod_900_BAU_Akil_NW;
	nr		= 1;
	condition	= Info_Mod_Akil_Lich_Condition;
	information	= Info_Mod_Akil_Lich_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Akil_Lich_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Drachen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Akil_Lich_Info()
{
	AI_Output(Self, hero, "Info_Mod_Akil_Lich_16_00"); //Mach besser, dass du in die Stadt kommst, hier ist es nicht sicher.
	AI_Output(hero, self, "Info_Mod_Akil_Lich_15_01"); //Was ist geschehen?
	AI_Output(Self, hero, "Info_Mod_Akil_Lich_16_02"); //Wie aus dem Nichts tauchten diese grässlichen Dämonen auf und peinigten uns bis aufs Blut.
	AI_Output(self, hero, "Info_Mod_Akil_Lich_16_03"); //Wenn nicht diese drei Paladine aufgetaucht wären, hätte es schlecht um uns gestanden.
	AI_Output(hero, self, "Info_Mod_Akil_Lich_15_04"); //Wo sind die Paladine jetzt?
	AI_Output(Self, hero, "Info_Mod_Akil_Lich_16_05"); //Nachdem sie die Unholde erschlagen hatten – Innos sei Dank - sind sie zur Grabeshöhle bei Orlan gelaufen.
};

INSTANCE Info_Mod_Akil_Pickpocket (C_INFO)
{
	npc		= Mod_900_BAU_Akil_NW;
	nr		= 1;
	condition	= Info_Mod_Akil_Pickpocket_Condition;
	information	= Info_Mod_Akil_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Akil_Pickpocket_Condition()
{
	C_Beklauen	(65, ItMi_Gold, 25);
};

FUNC VOID Info_Mod_Akil_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Akil_Pickpocket);

	Info_AddChoice	(Info_Mod_Akil_Pickpocket, DIALOG_BACK, Info_Mod_Akil_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Akil_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Akil_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Akil_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Akil_Pickpocket);
};

FUNC VOID Info_Mod_Akil_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Akil_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Akil_Pickpocket);

		Info_AddChoice	(Info_Mod_Akil_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Akil_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Akil_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Akil_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Akil_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Akil_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Akil_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Akil_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Akil_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Akil_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Akil_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Akil_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Akil_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Akil_EXIT (C_INFO)
{
	npc		= Mod_900_BAU_Akil_NW;
	nr		= 1;
	condition	= Info_Mod_Akil_EXIT_Condition;
	information	= Info_Mod_Akil_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Akil_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Akil_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};