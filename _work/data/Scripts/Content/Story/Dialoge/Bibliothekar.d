INSTANCE Info_Mod_Bibliothekar_Hi (C_INFO)
{
	npc		= Mod_7278_OUT_Bibliothekar_REL;
	nr		= 1;
	condition	= Info_Mod_Bibliothekar_Hi_Condition;
	information	= Info_Mod_Bibliothekar_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was hast du so für Bücher?";
};

FUNC INT Info_Mod_Bibliothekar_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bibliothekar_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Bibliothekar_Hi_15_00"); //Was hast du so für Bücher?
	AI_Output(self, hero, "Info_Mod_Bibliothekar_Hi_01_01"); //(abwesend) Die Geschichte des Hofstaats Teil 1, Die Geschichte des Hofstaats Teil 2, Die Geschichte des Hofstaats Teil 3, Die Geschichte ...
	AI_Output(hero, self, "Info_Mod_Bibliothekar_Hi_15_02"); //Ich sehe schon, spannende Bettlektüre.
	AI_Output(self, hero, "Info_Mod_Bibliothekar_Hi_01_03"); //Ja, ja. (murmelt) 101 Kräuterrezepte für die betagte Tagesmutter, wer hatte das gleich noch ausgeliehen? Richtig, Regina.
	AI_Output(self, hero, "Info_Mod_Bibliothekar_Hi_01_04"); //(laut) Kann ich sonst noch etwas für Sie tun?
};

INSTANCE Info_Mod_Bibliothekar_Ausleihen (C_INFO)
{
	npc		= Mod_7278_OUT_Bibliothekar_REL;
	nr		= 1;
	condition	= Info_Mod_Bibliothekar_Ausleihen_Condition;
	information	= Info_Mod_Bibliothekar_Ausleihen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Darf ich mir die Bücher auch ausleihen?";
};

FUNC INT Info_Mod_Bibliothekar_Ausleihen_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bibliothekar_Ausleihen_Info()
{
	AI_Output(hero, self, "Info_Mod_Bibliothekar_Ausleihen_15_00"); //Darf ich mir die Bücher auch ausleihen?
	AI_Output(self, hero, "Info_Mod_Bibliothekar_Ausleihen_01_01"); //(scharf) Finger weg!
};

INSTANCE Info_Mod_Bibliothekar_Buerger (C_INFO)
{
	npc		= Mod_7278_OUT_Bibliothekar_REL;
	nr		= 1;
	condition	= Info_Mod_Bibliothekar_Buerger_Condition;
	information	= Info_Mod_Bibliothekar_Buerger_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du ein Buch über die Anfänge Khoratas?";
};

FUNC INT Info_Mod_Bibliothekar_Buerger_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Anselm_Buerger2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bibliothekar_Buerger_Info()
{
	AI_Output(hero, self, "Info_Mod_Bibliothekar_Buerger_15_00"); //Hast du ein Buch über die Anfänge Khoratas?
	AI_Output(self, hero, "Info_Mod_Bibliothekar_Buerger_01_01"); //(genervt) Ja, wirklich sehr schönes Wetter draußen ...
	AI_Output(self, hero, "Info_Mod_Bibliothekar_Buerger_01_02"); //(verdutzt) Wie? Jemand fragt mich nach einem Buch?
	AI_Output(hero, self, "Info_Mod_Bibliothekar_Buerger_15_03"); //Allerdings.
	AI_Output(self, hero, "Info_Mod_Bibliothekar_Buerger_01_04"); //Da muss ich doch gleich mal nachdenken.
	AI_Output(self, hero, "Info_Mod_Bibliothekar_Buerger_01_05"); //(freundlich) Damit solltest du was anfangen können. Ich habe es doppelt, also behalte es ruhig.

	B_GiveInvItems	(self, hero, ItWr_KhorataGeschichte, 1);

	AI_Output(self, hero, "Info_Mod_Bibliothekar_Buerger_01_06"); //Und wenn du dich für mehr interessierst, komm nur vorbei, es ist alles da!
	AI_Output(hero, self, "Info_Mod_Bibliothekar_Buerger_15_07"); //Ich werd's mir merken. Danke.
};

INSTANCE Info_Mod_Bibliothekar_Glorie (C_INFO)
{
	npc		= Mod_7278_OUT_Bibliothekar_REL;
	nr		= 1;
	condition	= Info_Mod_Bibliothekar_Glorie_Condition;
	information	= Info_Mod_Bibliothekar_Glorie_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bibliothekar_Glorie_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jesper_REL_Glorie))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bibliothekar_Glorie_Info()
{
	AI_Output(self, hero, "Info_Mod_Bibliothekar_Glorie_01_00"); //Wo habe ich bloß das verdammte Ding gelassen ...
	AI_Output(self, hero, "Info_Mod_Bibliothekar_Glorie_01_01"); //(hält inne) Ihr seid es? Ohh, verzeiht vielmals, ich eile.

	AI_GotoWP	(self, "REL_CITY_150");

	AI_PlayAni	(self, "T_PLUNDER");

	AI_GotoNpc	(self, hero);

	AI_TurnToNpc	(self, hero);

	AI_Output(self, hero, "Info_Mod_Bibliothekar_Glorie_01_02"); //Hier, bitte sehr.

	B_GiveInvItems	(self, hero, ItWr_DiebDokumente, 1);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Bibliothekar_Pickpocket (C_INFO)
{
	npc		= Mod_7278_OUT_Bibliothekar_REL;
	nr		= 1;
	condition	= Info_Mod_Bibliothekar_Pickpocket_Condition;
	information	= Info_Mod_Bibliothekar_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Bibliothekar_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Bibliothekar_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Bibliothekar_Pickpocket);

	Info_AddChoice	(Info_Mod_Bibliothekar_Pickpocket, DIALOG_BACK, Info_Mod_Bibliothekar_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Bibliothekar_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Bibliothekar_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Bibliothekar_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Bibliothekar_Pickpocket);
};

FUNC VOID Info_Mod_Bibliothekar_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Bibliothekar_Pickpocket);
};

INSTANCE Info_Mod_Bibliothekar_EXIT (C_INFO)
{
	npc		= Mod_7278_OUT_Bibliothekar_REL;
	nr		= 1;
	condition	= Info_Mod_Bibliothekar_EXIT_Condition;
	information	= Info_Mod_Bibliothekar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Bibliothekar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bibliothekar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};