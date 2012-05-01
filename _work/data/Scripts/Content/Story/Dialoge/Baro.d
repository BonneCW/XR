INSTANCE Info_Mod_Baro_Hi (C_INFO)
{
	npc		= Mod_7729_OUT_Baro_EIS;
	nr		= 1;
	condition	= Info_Mod_Baro_Hi_Condition;
	information	= Info_Mod_Baro_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Baro_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Willingham_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Baro_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Baro_Hi_04_00"); //Wer stört mich bei meiner Arbeit?
	AI_Output(hero, self, "Info_Mod_Baro_Hi_15_01"); //Du arbeitest sehr hart, warum gönnst du dir nicht mal eine Pause?
	AI_Output(self, hero, "Info_Mod_Baro_Hi_04_02"); //Weil ich dann noch länger hier draußen bin.
	AI_Output(self, hero, "Info_Mod_Baro_Hi_04_03"); //Ich bin für die Holzversorgung des Dorfs zuständig. Das bedeutet auch im Winter noch Bäume zu fällen.
	AI_Output(hero, self, "Info_Mod_Baro_Hi_15_04"); //Scheint so, dass du mit deiner Arbeit für dieses Jahr fertig wärst. Der Kommander will dich sprechen.
	AI_Output(self, hero, "Info_Mod_Baro_Hi_04_05"); //Endlich, ich habe schon gedacht ich erfriere, obwohl ich dafür sorge das alle es warm haben.
	AI_Output(self, hero, "Info_Mod_Baro_Hi_04_06"); //Wenn du wieder in das Dorf kommt, schau gerne bei mir vorbei, ich mache das beste Bier hier.

	B_LogEntry	(TOPIC_MOD_EIS_RAUESCHNEIDE, "Baro wird jetzt erstmal wieder ins Dorf zurückkehren.");

	B_StartOtherRoutine	(self, "DORF");
};

INSTANCE Info_Mod_Baro_Orkring (C_INFO)
{
	npc		= Mod_7729_OUT_Baro_EIS;
	nr		= 1;
	condition	= Info_Mod_Baro_Orkring_Condition;
	information	= Info_Mod_Baro_Orkring_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Baro_Orkring_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Willingham_RaueSchneide))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Baro_Orkring_Info()
{
	AI_Output(self, hero, "Info_Mod_Baro_Orkring_04_00"); //Ah, ausgezeichnet. Ich freue mich, dich zu sehen. Ich muss mit dir über die Orks reden.
	AI_Output(self, hero, "Info_Mod_Baro_Orkring_04_01"); //Anfangs waren es noch sehr wenige. Sie kammen aus den Bergen und gehörten einer sehr alten Kaste der Orks an.
	AI_Output(self, hero, "Info_Mod_Baro_Orkring_04_02"); //Aber wie es aussieht haben sie in den tiefen der umliegenden Berge eine alte Macht entflammt.
	AI_Output(hero, self, "Info_Mod_Baro_Orkring_15_03"); //Warum weißt du soviel über diese Orks? Du scheinst der Einzige zu sein.
	AI_Output(self, hero, "Info_Mod_Baro_Orkring_04_04"); //Ich habe einen speziellen Freund. Meine Familie kennt ihn schon sehr lange.
	AI_Output(self, hero, "Info_Mod_Baro_Orkring_04_05"); //Als wir noch im Gebirge lebten, wohnten wir direkt neben seiner Orkhöhle.
	AI_Output(self, hero, "Info_Mod_Baro_Orkring_04_06"); //Wir sind zusammen groß geworden und ich erfahre viel von ihm über die Orks.
	AI_Output(self, hero, "Info_Mod_Baro_Orkring_04_07"); //Sein Name ist Garunh und er lebt in einem Orkzelt auf der anderen Seite des Berges. Ich muss mit ihm über die hohe Anzahl der Orks reden.
	AI_Output(self, hero, "Info_Mod_Baro_Orkring_04_08"); //Dann wird er auch bestimmt deine Fragen beantworten.
	AI_Output(hero, self, "Info_Mod_Baro_Orkring_15_09"); //Wenn dein Freund soviel weiß, dann sollten wir ihn nicht warten lassen.
	AI_Output(self, hero, "Info_Mod_Baro_Orkring_04_10"); //Perfekt, ich habe ihm schon eine Nachricht geschickt. Er wird uns erwarten. Folge mir.

	B_LogEntry	(TOPIC_MOD_EIS_ORKRING, "Baro bezieht seine Informationen über die Orks von einem Ork namens Garunh. Er wird mich zu ihm führen.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "GUIDETOGARUNH");
};

INSTANCE Info_Mod_Baro_Orkring2 (C_INFO)
{
	npc		= Mod_7729_OUT_Baro_EIS;
	nr		= 1;
	condition	= Info_Mod_Baro_Orkring2_Condition;
	information	= Info_Mod_Baro_Orkring2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Baro_Orkring2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Baro_Orkring))
	&& (Npc_GetDistToWP(self, "EIS_443") < 1000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Baro_Orkring2_Info()
{
	AI_Output(self, hero, "Info_Mod_Baro_Orkring2_04_00"); //Warte einen Moment. Ich sage ihm Bescheid, das noch jemand dabei ist.

	AI_GotoNpc	(self, Mod_10045_Orc_Garunh_EIS);

	AI_GotoNpc	(self, hero);

	AI_TurnToNpc	(self, hero);
	AI_TurnToNpc	(hero, self);

	AI_Output(self, hero, "Info_Mod_Baro_Orkring2_04_01"); //Er ist bereit mit dir zu reden. Folge mir in sein Zelt.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Baro_Orkring3 (C_INFO)
{
	npc		= Mod_7729_OUT_Baro_EIS;
	nr		= 1;
	condition	= Info_Mod_Baro_Orkring3_Condition;
	information	= Info_Mod_Baro_Orkring3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Baro_Orkring3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Garunh_Orkring3))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Baro_Orkring3_Info()
{
	AI_Output(self, hero, "Info_Mod_Baro_Orkring3_04_00"); //Ich gehe zum Dorf zurück. Wenn du Garunh geholfen hast, komm zu meinem Haus. Ich lade dich zum Essen ein.
	AI_Output(self, hero, "Info_Mod_Baro_Orkring3_04_01"); //In den kalten Wintermonaten sollte man nicht an Hunger leiden.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "DORF");
};

INSTANCE Info_Mod_Baro_UntoteOrks (C_INFO)
{
	npc		= Mod_7729_OUT_Baro_EIS;
	nr		= 1;
	condition	= Info_Mod_Baro_UntoteOrks_Condition;
	information	= Info_Mod_Baro_UntoteOrks_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Baro_UntoteOrks_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Garunh_Orkring5))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Baro_UntoteOrks_Info()
{
	AI_Output(self, hero, "Info_Mod_Baro_UntoteOrks_04_00"); //Ah, du bist zurück. Konntest du Garunh helfen und noch wichtiger: Was hat er dir über die Orks am Pass erzählt?
	AI_Output(hero, self, "Info_Mod_Baro_UntoteOrks_15_01"); //So wie es aussieht haben wir es mit toten Orks zu tun.
	AI_Output(hero, self, "Info_Mod_Baro_UntoteOrks_15_02"); //Ein Schamane Namens Asek hat anscheinend seine Leute vom Friedhof rekrutiert.
	AI_Output(hero, self, "Info_Mod_Baro_UntoteOrks_15_03"); //Garunh wußte allerdings auch nicht, wo der Tempel ist, in dem sich Asek aufhält.
	AI_Output(hero, self, "Info_Mod_Baro_UntoteOrks_15_04"); //Wir brauchen einen Ork-Anfüher, den wir verhören können, und Garunh meinte du kennst jemanden, der die Orksprache beherrscht.
	AI_Output(self, hero, "Info_Mod_Baro_UntoteOrks_04_05"); //Ich kenne jemanden, aber bevor du ihn aufsuchst, solltest du zu Willingham gehen.
	AI_Output(self, hero, "Info_Mod_Baro_UntoteOrks_04_06"); //Der Mann, den du suchst, heißt Melchior und untersteht dem Kommander. Er wird auch wissen, wo er stationiert ist.
	AI_Output(self, hero, "Info_Mod_Baro_UntoteOrks_04_07"); //Das Essen sollten wir verschieben. Hier, nimm eins meiner Biere und ein Stück Schinken, damit du mir nicht umfällst.

	CreateInvItems	(hero, ItFo_Beer, 1);
	CreateInvItems	(hero, ItFo_Bacon, 1);

	B_ShowGivenThings	("Bier und Schinken erhalten");

	B_LogEntry	(TOPIC_MOD_EIS_UNTOTEORKS, "Meine gesuchte Kontaktperson heißt Melchior und untersteht Kommander Willingham. Ich sollte also zuerst mit diesem sprechen.");
};

INSTANCE Info_Mod_Baro_Pickpocket (C_INFO)
{
	npc		= Mod_7729_OUT_Baro_EIS;
	nr		= 1;
	condition	= Info_Mod_Baro_Pickpocket_Condition;
	information	= Info_Mod_Baro_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Baro_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 200);
};

FUNC VOID Info_Mod_Baro_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Baro_Pickpocket);

	Info_AddChoice	(Info_Mod_Baro_Pickpocket, DIALOG_BACK, Info_Mod_Baro_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Baro_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Baro_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Baro_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Baro_Pickpocket);
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

INSTANCE Info_Mod_Baro_EXIT (C_INFO)
{
	npc		= Mod_7729_OUT_Baro_EIS;
	nr		= 1;
	condition	= Info_Mod_Baro_EXIT_Condition;
	information	= Info_Mod_Baro_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Baro_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Baro_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};