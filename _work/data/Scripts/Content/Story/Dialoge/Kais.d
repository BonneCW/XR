INSTANCE Info_Mod_Kais_Hi (C_INFO)
{
	npc		= Mod_7164_ASS_Kais_NW;
	nr		= 1;
	condition	= Info_Mod_Kais_Hi_Condition;
	information	= Info_Mod_Kais_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo! Na'im schickt mich. Du hast wohl ein Problem.";
};

FUNC INT Info_Mod_Kais_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Naim_Hi))
	&& (Mod_ASS_Magier == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kais_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Kais_Hi_15_00"); //Hallo! Na'im schickt mich. Du hast wohl ein Problem.
	AI_Output(self, hero, "Info_Mod_Kais_Hi_01_01"); //Was die erzählen. Es ist nichts. Jedenfalls im Moment nicht. Später vielleicht.
	AI_Output(hero, self, "Info_Mod_Kais_Hi_15_02"); //Verstehe. Bis dann.
};

INSTANCE Info_Mod_Kais_Blutkelch (C_INFO)
{
	npc		= Mod_7164_ASS_Kais_NW;
	nr		= 1;
	condition	= Info_Mod_Kais_Blutkelch_Condition;
	information	= Info_Mod_Kais_Blutkelch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Kais_Blutkelch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kais_Hi))
	&& (Kapitel >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kais_Blutkelch_Info()
{
	AI_Output(self, hero, "Info_Mod_Kais_Blutkelch_01_00"); //Endlich! Wo steckst du die ganze Zeit?
	AI_Output(hero, self, "Info_Mod_Kais_Blutkelch_15_01"); //Du hast mich doch weggeschickt. Ich hab 'ne Auszeit genommen.
	AI_Output(self, hero, "Info_Mod_Kais_Blutkelch_01_02"); //Auszeit. Das war aber zur Unzeit.
	AI_Output(hero, self, "Info_Mod_Kais_Blutkelch_15_03"); //Jetzt bin ich ja da. Was soll ich machen?
	AI_Output(self, hero, "Info_Mod_Kais_Blutkelch_01_04"); //Nun höre, wir Magier haben ein Problem.
	AI_Output(hero, self, "Info_Mod_Kais_Blutkelch_15_05"); //Ich bin ganz Ohr. Wie kann ich helfen?
	AI_Output(self, hero, "Info_Mod_Kais_Blutkelch_01_06"); //Einige von uns haben Bruchteile einer Botschaft oder so erhalten.
	AI_Output(self, hero, "Info_Mod_Kais_Blutkelch_01_07"); //Die scheinen irgendwie zusammemzugehören, aber keiner hat bis jetzt herausgefunden, was das bedeutet.
	AI_Output(hero, self, "Info_Mod_Kais_Blutkelch_15_08"); //Aha. Und nun darf ich raten ...
	AI_Output(self, hero, "Info_Mod_Kais_Blutkelch_01_09"); //Genau. Du bist doch angeblich ein schaues Kerlchen. Sagt man.
	AI_Output(hero, self, "Info_Mod_Kais_Blutkelch_15_10"); //Nun gut. Ich kanns mal probieren.
	AI_Output(self, hero, "Info_Mod_Kais_Blutkelch_01_11"); //Hier ist mein Teil. Noch einen haben der Magier Mahamad und Ratsmitglied Norek.

	B_GiveInvItems	(self, hero, ItWr_BlutkelchZettel1, 1);

	AI_Output(hero, self, "Info_Mod_Kais_Blutkelch_15_12"); //Ich schau dann mal.

	B_RemoveNpc	(Mod_7199_ASS_Amir_NW);
};

INSTANCE Info_Mod_Kais_Pickpocket (C_INFO)
{
	npc		= Mod_7164_ASS_Kais_NW;
	nr		= 1;
	condition	= Info_Mod_Kais_Pickpocket_Condition;
	information	= Info_Mod_Kais_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Kais_Pickpocket_Condition()
{
	C_Beklauen	(118, ItMi_Gold, 2000);
};

FUNC VOID Info_Mod_Kais_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Kais_Pickpocket);

	Info_AddChoice	(Info_Mod_Kais_Pickpocket, DIALOG_BACK, Info_Mod_Kais_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Kais_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Kais_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Kais_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Kais_Pickpocket);
};

FUNC VOID Info_Mod_Kais_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Kais_Pickpocket);
};

INSTANCE Info_Mod_Kais_EXIT (C_INFO)
{
	npc		= Mod_7164_ASS_Kais_NW;
	nr		= 1;
	condition	= Info_Mod_Kais_EXIT_Condition;
	information	= Info_Mod_Kais_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Kais_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Kais_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};