INSTANCE Info_Mod_Ulrich_Hi (C_INFO)
{
	npc		= Mod_7370_OUT_Ulrich_REL;
	nr		= 1;
	condition	= Info_Mod_Ulrich_Hi_Condition;
	information	= Info_Mod_Ulrich_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was machst du hier?";
};

FUNC INT Info_Mod_Ulrich_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ulrich_Hi_Info()
{
	B_Say	(hero, self, "$WASMACHSTDUHIER");

	AI_Output(self, hero, "Info_Mod_Ulrich_Hi_14_01"); //(empört) Was machst DU hier?
	AI_Output(hero, self, "Info_Mod_Ulrich_Hi_15_02"); //Ich wollte nicht ...
	AI_Output(self, hero, "Info_Mod_Ulrich_Hi_14_03"); //Rein zufällig in mein Haus stolpern? Sieh zu, dass du Land gewinnst!

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Ulrich_AnnaKnast (C_INFO)
{
	npc		= Mod_7370_OUT_Ulrich_REL;
	nr		= 1;
	condition	= Info_Mod_Ulrich_AnnaKnast_Condition;
	information	= Info_Mod_Ulrich_AnnaKnast_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hi. Ich soll dir eine Nachricht überbringen.";
};

FUNC INT Info_Mod_Ulrich_AnnaKnast_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ulrich_Hi))
	&& (Mod_AnnaQuest == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ulrich_AnnaKnast_Info()
{
	AI_Output(hero, self, "Info_Mod_Ulrich_AnnaKnast_15_00"); //Hi. Ich soll dir eine Nachricht überbringen.
	AI_Output(self, hero, "Info_Mod_Ulrich_AnnaKnast_14_01"); //Ach ja? Und das entbindet dich von gesellschaftlichen Gebräuchen wie Anklopfen?
	AI_Output(hero, self, "Info_Mod_Ulrich_AnnaKnast_15_02"); //Nein ... (hastig) Hör zu, es geht um Anna.
	AI_Output(self, hero, "Info_Mod_Ulrich_AnnaKnast_14_03"); //Was ist los?
	AI_Output(hero, self, "Info_Mod_Ulrich_AnnaKnast_15_04"); //Sie wurde von Schöppen verhaftet wegen des Verdachts der Hexerei, liegt im Gefängnis und wird höchstwahrscheinlich gerade gefoltert.
	AI_Output(self, hero, "Info_Mod_Ulrich_AnnaKnast_14_05"); //(entsetzt) Wie bitte?! (Pause) Denen werd' ich's zeigen!
	AI_Output(hero, self, "Info_Mod_Ulrich_AnnaKnast_15_06"); //Du hast einen Plan?
	AI_Output(self, hero, "Info_Mod_Ulrich_AnnaKnast_14_07"); //Und ob! Ich werde gleich den Termin der Urteilsverkündung in Erfahrung bringen und dann jede einzelne dieser Drecksratten umlegen, wenn sie ihr nur ein Haar krümmen wollen!
	AI_Output(hero, self, "Info_Mod_Ulrich_AnnaKnast_15_08"); //Klingt ja sehr durchdacht ...
	AI_Output(self, hero, "Info_Mod_Ulrich_AnnaKnast_14_09"); //Pah, was muss ich mehr ausdenken, wenn die Rechtsverdreher eh keine Waffe schwingen können? Zu zweit haben sie keine Chance!
	AI_Output(hero, self, "Info_Mod_Ulrich_AnnaKnast_15_10"); //Zu zweit ...?
	AI_Output(self, hero, "Info_Mod_Ulrich_AnnaKnast_14_11"); //Mach mich nicht schwach, Junge, bist du etwa auf deren Seite?!
	AI_Output(hero, self, "Info_Mod_Ulrich_AnnaKnast_15_12"); //Äh ...
	AI_Output(self, hero, "Info_Mod_Ulrich_AnnaKnast_14_13"); //Also, du kommst morgen früh zu mir, dann weiß ich, wann der Prozess stattfindet, und wir beide werden uns dazugesellen.

	B_LogEntry	(TOPIC_MOD_KHORATA_HEXENWAHN, "Ulrich will die Angelegenheit auf rabiate Weise lösen. Ob das der richtige Weg ist? Ich soll später wiederkommen, wenn er weiß, wann Annas Prozess stattfindet.");

	Mod_AnnaQuest = 4;

	Mod_AnnaQuest_Day = Wld_GetDay();
};

INSTANCE Info_Mod_Ulrich_ZuVerhandlung (C_INFO)
{
	npc		= Mod_7370_OUT_Ulrich_REL;
	nr		= 1;
	condition	= Info_Mod_Ulrich_ZuVerhandlung_Condition;
	information	= Info_Mod_Ulrich_ZuVerhandlung_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Ulrich_ZuVerhandlung_Condition()
{
	if (Mod_AnnaQuest == 4)
	&& (Wld_GetDay() > Mod_AnnaQuest_Day)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ulrich_ZuVerhandlung_Info()
{
	AI_Output(self, hero, "Info_Mod_Ulrich_ZuVerhandlung_14_00"); //Du bist spät dran. Komm, wir müssen los!
	
	Info_ClearChoices	(Info_Mod_Ulrich_ZuVerhandlung);

	Info_AddChoice	(Info_Mod_Ulrich_ZuVerhandlung, "Einen Moment noch.", Info_Mod_Ulrich_ZuVerhandlung_B);
	Info_AddChoice	(Info_Mod_Ulrich_ZuVerhandlung, "Dann lass uns gehen.", Info_Mod_Ulrich_ZuVerhandlung_A);
};

FUNC VOID Info_Mod_Ulrich_ZuVerhandlung_B()
{
	AI_Output(hero, self, "Info_Mod_Ulrich_ZuVerhandlung_B_15_00"); //Einen Moment noch.
	
	Info_ClearChoices	(Info_Mod_Ulrich_ZuVerhandlung);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Ulrich_ZuVerhandlung_A()
{
	AI_Output(hero, self, "Info_Mod_Ulrich_ZuVerhandlung_A_15_00"); //Dann lass uns gehen.
	
	Info_ClearChoices	(Info_Mod_Ulrich_ZuVerhandlung);

	Mod_AnnaQuest = 5;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "GUIDETORICHTER");

	Wld_InsertNpc	(Mod_7376_OUT_Anna_REL,	"REL_CITY_341");
};

INSTANCE Info_Mod_Ulrich_AnnaBefreit (C_INFO)
{
	npc		= Mod_7370_OUT_Ulrich_REL;
	nr		= 1;
	condition	= Info_Mod_Ulrich_AnnaBefreit_Condition;
	information	= Info_Mod_Ulrich_AnnaBefreit_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ulrich_AnnaBefreit_Condition()
{
	if (Mod_AnnaQuest == 9)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ulrich_AnnaBefreit_Info()
{
	AI_Output(self, hero, "Info_Mod_Ulrich_AnnaBefreit_14_00"); //(grimmig) Denen haben wir's gezeigt. Das wird ihnen eine Lehre sein.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
	B_StartOtherRoutine	(Mod_7365_OUT_Margarethe_REL, "START");
	B_StartOtherRoutine	(Mod_7374_OUT_Gerichtswache_01, "START");
	B_StartOtherRoutine	(Mod_7375_OUT_Gerichtswache_02, "START");
};

INSTANCE Info_Mod_Ulrich_Freudenspender (C_INFO)
{
	npc		= Mod_7370_OUT_Ulrich_REL;
	nr		= 1;
	condition	= Info_Mod_Ulrich_Freudenspender_Condition;
	information	= Info_Mod_Ulrich_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Ich hab hier Freudenspender ...";
};                       

FUNC INT Info_Mod_Ulrich_Freudenspender_Condition()
{
	if (Npc_HasItems(hero, ItMi_Freudenspender) >= 1)
	&& (Mod_Freudenspender < 5)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Hi))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Ulrich_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Ulrich_Freudenspender_15_00"); //Ich hab hier Freudenspender ...
	AI_Output(self, hero, "Info_Mod_Ulrich_Freudenspender_14_01"); //Und ich hoffe, du willst es nicht bei mir loswerden.
	AI_Output(hero, self, "Info_Mod_Ulrich_Freudenspender_15_02"); //Natürlich nicht.
	AI_Output(self, hero, "Info_Mod_Ulrich_Freudenspender_14_03"); //Hast du eigentlich angeklopft?
	AI_Output(hero, self, "Info_Mod_Ulrich_Freudenspender_15_04"); //Natürlich. Muss wohl zu leise gewesen sein.
};

INSTANCE Info_Mod_Ulrich_Pickpocket (C_INFO)
{
	npc		= Mod_7370_OUT_Ulrich_REL;
	nr		= 1;
	condition	= Info_Mod_Ulrich_Pickpocket_Condition;
	information	= Info_Mod_Ulrich_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Ulrich_Pickpocket_Condition()
{
	C_Beklauen	(76, ItMi_Gold, 350);
};

FUNC VOID Info_Mod_Ulrich_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Ulrich_Pickpocket);

	Info_AddChoice	(Info_Mod_Ulrich_Pickpocket, DIALOG_BACK, Info_Mod_Ulrich_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Ulrich_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Ulrich_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Ulrich_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Ulrich_Pickpocket);
};

FUNC VOID Info_Mod_Ulrich_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Ulrich_Pickpocket);
};

INSTANCE Info_Mod_Ulrich_EXIT (C_INFO)
{
	npc		= Mod_7370_OUT_Ulrich_REL;
	nr		= 1;
	condition	= Info_Mod_Ulrich_EXIT_Condition;
	information	= Info_Mod_Ulrich_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Ulrich_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ulrich_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};