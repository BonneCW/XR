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

FUNC VOID Info_Mod_Elvrich_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Elvrich_Pickpocket);
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