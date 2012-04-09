INSTANCE Info_Mod_Flora_Hi (C_INFO)
{
	npc		= Mod_4030_VLK_Flora_NW;
	nr		= 1;
	condition	= Info_Mod_Flora_Hi_Condition;
	information	= Info_Mod_Flora_Hi_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Flora_Hi_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& ((hero.attribute[ATR_DEXTERITY] < 100)
	|| (Npc_KnowsInfo(hero, Info_Mod_Flora_Dachratte)))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Flora_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Flora_Hi_16_00"); //Ja?
};

INSTANCE Info_Mod_Flora_Port (C_INFO)
{
	npc		= Mod_4030_VLK_Flora_NW;
	nr		= 1;
	condition	= Info_Mod_Flora_Port_Condition;
	information	= Info_Mod_Flora_Port_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du bist in Gefahr.";
};

FUNC INT Info_Mod_Flora_Port_Condition()
{
	if (Moe_KnowsPort == 8)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Flora_Port_Info()
{
	AI_Output(hero, self, "Info_Mod_Flora_Port_15_00"); //Du bist in Gefahr.
	AI_Output(self, hero, "Info_Mod_Flora_Port_16_01"); //(leicht belustigt) Wieso denn das? Habe ich etwas verbrochen?
	AI_Output(hero, self, "Info_Mod_Flora_Port_15_02"); //Du stehst auf der Abschussliste eines Mörders. Es hat mit Johannes Port zu tun.
	AI_Output(self, hero, "Info_Mod_Flora_Port_16_03"); //(ernst) Was ist passiert? Geht es ihm gut?
	AI_Output(hero, self, "Info_Mod_Flora_Port_15_04"); //Wie man's nimmt. Schmerzen hat er keine mehr.
	AI_Output(self, hero, "Info_Mod_Flora_Port_16_05"); //(sprachlos) Oh ... wie ... was? Er ist tot? Nein! ... Aber warum kommst du zu mir?
	AI_Output(hero, self, "Info_Mod_Flora_Port_15_06"); //Um dich zu warnen und um zu fragen, was der Mörder für ein Motiv gehabt haben könnte.
	AI_Output(self, hero, "Info_Mod_Flora_Port_16_07"); //Hmm ... Sicher hatte Johannes seine Geheimnisse ... aber da gab es eine Sache, die er nicht einmal mir, seiner Cousine, erzählen wollte.
	AI_Output(self, hero, "Info_Mod_Flora_Port_16_08"); //In seinem letzten Brief deutete er nur an, was er herausgefunden hatte, aber dass es lebensgefährlich sein könnte, damit hätte ich nicht gerechnet ...
	AI_Output(self, hero, "Info_Mod_Flora_Port_16_09"); //Oh, warte! Ich erinnere mich an einen Namen, eine Person, vor der Johannes mich gewarnt hat.
	AI_Output(hero, self, "Info_Mod_Flora_Port_15_10"); //Wie heißt die Person?
	AI_Output(self, hero, "Info_Mod_Flora_Port_16_11"); //Brahim war es. Johannes kannte ihn nicht, aber er meinte, er führe dunkle Verbindungen ... was das wohl heißen mag?
	AI_Output(hero, self, "Info_Mod_Flora_Port_15_12"); //Ich werde es schon herausfinden.
	AI_Output(self, hero, "Info_Mod_Flora_Port_16_13"); //Gut. Danke für deine Warnung, ich werde vorsichtig sein. Viel Glück!

	B_GivePlayerXP	(50);

	B_LogEntry	(TOPIC_MOD_MOE_PORT, "Steckt etwa Brahim hinter den Morden?");
};

INSTANCE Info_Mod_Flora_Dachratte (C_INFO)
{
	npc		= Mod_4030_VLK_Flora_NW;
	nr		= 1;
	condition	= Info_Mod_Flora_Dachratte_Condition;
	information	= Info_Mod_Flora_Dachratte_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Flora_Dachratte_Condition()
{
	if (hero.attribute[ATR_DEXTERITY] >= 100)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Flora_Dachratte_Info()
{
	AI_Output(self, hero, "Info_Mod_Flora_Dachratte_16_00"); //Oh, du siehst wie ein geübter Kletterer aus.
	AI_Output(self, hero, "Info_Mod_Flora_Dachratte_16_01"); //Hilf mir bitte, dieses abscheuliche Vieh von meinem Dach zu holen!

	Info_ClearChoices	(Info_Mod_Flora_Dachratte);

	Info_AddChoice	(Info_Mod_Flora_Dachratte, "Tut mir Leid, keine Zeit für so etwas.", Info_Mod_Flora_Dachratte_B);
	Info_AddChoice	(Info_Mod_Flora_Dachratte, "Nichts leichter als das. Was ist das für ein Tier?", Info_Mod_Flora_Dachratte_A);
};

FUNC VOID Info_Mod_Flora_Dachratte_B()
{
	AI_Output(hero, self, "Info_Mod_Flora_Dachratte_B_15_00"); //Oh, du siehst wie ein geübter Kletterer aus.

	Info_ClearChoices	(Info_Mod_Flora_Dachratte);
};

FUNC VOID Info_Mod_Flora_Dachratte_A()
{
	AI_Output(hero, self, "Info_Mod_Flora_Dachratte_A_15_00"); //Nichts leichter als das. Was ist das für ein Tier?
	AI_Output(self, hero, "Info_Mod_Flora_Dachratte_A_16_01"); //Eine Ratte! Hoffentlich hat sich nicht schon ihre ganze Familie auf dem Dachboden eingenistet!
	AI_Output(hero, self, "Info_Mod_Flora_Dachratte_A_15_02"); //Und wie komme ich auf das Dach?
	AI_Output(self, hero, "Info_Mod_Flora_Dachratte_A_16_03"); //Du musst irgendwo einen Aufstieg finden. Deswegen frage ich doch gerade dich!
	AI_Output(hero, self, "Info_Mod_Flora_Dachratte_A_15_04"); //Ich kümmere mich darum.

	Mod_Flora_Dachratte = 1;

	Log_CreateTopic	(TOPIC_MOD_FLORA_RATTE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_FLORA_RATTE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_FLORA_RATTE, "Flora aus dem oberen Viertel hat mich gebeten, die Ratte zu töten, die auf ihrem Haus hockt.");

	Info_ClearChoices	(Info_Mod_Flora_Dachratte);

	Wld_InsertNpc	(Rat_Flora,	"FP_ROAM_FLORA_DACHRATTE");
};

INSTANCE Info_Mod_Flora_Dachratte2 (C_INFO)
{
	npc		= Mod_4030_VLK_Flora_NW;
	nr		= 1;
	condition	= Info_Mod_Flora_Dachratte2_Condition;
	information	= Info_Mod_Flora_Dachratte2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Ratte macht keinen Ärger mehr.";
};

FUNC INT Info_Mod_Flora_Dachratte2_Condition()
{
	if (Mod_Flora_Dachratte == 1)
	&& (Npc_IsDead(Rat_Flora))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Flora_Dachratte2_Info()
{
	AI_Output(hero, self, "Info_Mod_Flora_Dachratte2_15_00"); //Die Ratte macht keinen Ärger mehr.
	AI_Output(self, hero, "Info_Mod_Flora_Dachratte2_16_01"); //Ach, es gibt doch immer noch hilfsbereite Menschen. Vielen Dank!

	B_GivePlayerXP	(100);

	CurrentNQ += 1;

	B_SetTopicStatus	(TOPIC_MOD_FLORA_RATTE, LOG_SUCCESS);
};

INSTANCE Info_Mod_Flora_Pickpocket (C_INFO)
{
	npc		= Mod_4030_VLK_Flora_NW;
	nr		= 1;
	condition	= Info_Mod_Flora_Pickpocket_Condition;
	information	= Info_Mod_Flora_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Flora_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_Flora_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Flora_Pickpocket);

	Info_AddChoice	(Info_Mod_Flora_Pickpocket, DIALOG_BACK, Info_Mod_Flora_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Flora_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Flora_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Flora_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Flora_Pickpocket);
};

FUNC VOID Info_Mod_Flora_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Flora_Pickpocket);
};

INSTANCE Info_Mod_Flora_EXIT (C_INFO)
{
	npc		= Mod_4030_VLK_Flora_NW;
	nr		= 1;
	condition	= Info_Mod_Flora_EXIT_Condition;
	information	= Info_Mod_Flora_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Flora_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Flora_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};