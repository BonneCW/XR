INSTANCE Info_Mod_Elvrich_Hi (C_INFo)
{
	npc		= Mod_573_NONE_Elvrich_NW;
	nr		= 1;
	condition	= Info_Mod_Elvrich_Hi_Condition;
	information	= Info_Mod_Elvrich_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du bist ein Lehrling?";
};

FUNC INT Info_Mod_Elvrich_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Elvrich_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Elvrich_Hi_15_00"); //Du bist ein Lehrling?
	AI_Output(self, hero, "Info_Mod_Elvrich_Hi_24_01"); //Nicht mehr lange. Mittlerweile bin ich besser als Thorben. Was allerdings auch nicht schwierig ist ...
	AI_Output(hero, self, "Info_Mod_Elvrich_Hi_15_02"); //Was ist denn mit Thorben?
	AI_Output(self, hero, "Info_Mod_Elvrich_Hi_24_03"); //Sieh ihn dir doch mal an, wenn er abends in der Kneipe sitzt.
	AI_Output(self, hero, "Info_Mod_Elvrich_Hi_24_04"); //Er trinkt jeden Tag so viel, dass er am nächsten Morgen noch nicht wieder nüchtern ist.
	AI_Output(hero, self, "Info_Mod_Elvrich_Hi_15_05"); //Hat das einen speziellen Grund?
	AI_Output(self, hero, "Info_Mod_Elvrich_Hi_24_06"); //Er hatte nicht immer ein angenehmes Leben, glaube ich.
	AI_Output(self, hero, "Info_Mod_Elvrich_Hi_24_07"); //Aber mehr als Andeutungen bekommt man nicht aus ihm heraus.
};

INSTANCE Info_Mod_Elvrich_WieGehts (C_INFo)
{
	npc		= Mod_573_NONE_Elvrich_NW;
	nr		= 1;
	condition	= Info_Mod_Elvrich_WieGehts_Condition;
	information	= Info_Mod_Elvrich_WieGehts_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie geht's so?";
};

FUNC INT Info_Mod_Elvrich_WieGehts_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Elvrich_WieGehts_Info()
{
	AI_Output(hero, self, "Info_Mod_Elvrich_WieGehts_15_00"); //Wie geht's so?
	AI_Output(self, hero, "Info_Mod_Elvrich_WieGehts_24_01"); //Kann nicht klagen, stecke gerade in einer frischen Beziehung.
	AI_Output(self, hero, "Info_Mod_Elvrich_WieGehts_24_02"); //Mann, ich hätte ja nie gedacht, dass so eine Schönheit auf Normalsterbliche wie mich steht.
	AI_Output(self, hero, "Info_Mod_Elvrich_WieGehts_24_03"); //Die Arbeit hier ist natürlich ziemlich anstrengend, weil ich für zwei Personen arbeiten muss. Thorben kriegt kaum was auf die Reihe.
};

INSTANCE Info_Mod_Elvrich_Liste (C_INFO)
{
	npc		= Mod_573_NONE_Elvrich_NW;
	nr		= 1;
	condition	= Info_Mod_Elvrich_Liste_Condition;
	information	= Info_Mod_Elvrich_Liste_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was machst du heute noch so?";
};

FUNC INT Info_Mod_Elvrich_Liste_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Vatras_ErsteInfos))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Elvrich_Liste_Info()
{
	AI_Output(hero, self, "Info_Mod_Elvrich_Liste_15_00"); //Was machst du heute noch so?
	AI_Output(self, hero, "Info_Mod_Elvrich_Liste_24_01"); //Ich werde noch ein wenig arbeiten und mich dann heute Nacht mit meiner Freundin treffen.
	AI_Output(hero, self, "Info_Mod_Elvrich_Liste_15_02"); //Wo trefft ihr euch?
	AI_Output(self, hero, "Info_Mod_Elvrich_Liste_24_03"); //Sie hat mir einen Brief geschrieben, in dem steht, dass wir uns heute Nacht im Hafenviertel an einem ruhigen Platz in der Nähe der Schafe treffen.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "KURGAN");

	B_LogEntry	(TOPIC_MOD_VERMISSTE, "Elvrich trifft sich zufälligerweise heute Nacht mit seiner Freundin im Hafenviertel in der Nähe der Schafe.");

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Elvrich_Pickpocket (C_INFO)
{
	npc		= Mod_573_NONE_Elvrich_NW;
	nr		= 1;
	condition	= Info_Mod_Elvrich_Pickpocket_Condition;
	information	= Info_Mod_Elvrich_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_40;
};

FUNC INT Info_Mod_Elvrich_Pickpocket_Condition()
{
	C_Beklauen	(40, ItMi_Gold, 60);
};

FUNC VOID Info_Mod_Elvrich_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Elvrich_Pickpocket);

	Info_AddChoice	(Info_Mod_Elvrich_Pickpocket, DIALOG_BACK, Info_Mod_Elvrich_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Elvrich_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Elvrich_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Elvrich_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Elvrich_Pickpocket);
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

INSTANCE Info_Mod_Elvrich_EXIT (C_INFO)
{
	npc		= Mod_573_NONE_Elvrich_NW;
	nr		= 1;
	condition	= Info_Mod_Elvrich_EXIT_Condition;
	information	= Info_Mod_Elvrich_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Elvrich_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Elvrich_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};