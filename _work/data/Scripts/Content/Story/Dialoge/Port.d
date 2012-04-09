INSTANCE Info_Mod_Port_Hi (C_INFO)
{
	npc		= Mod_4027_NONE_Port_NW;
	nr		= 1;
	condition	= Info_Mod_Port_Hi_Condition;
	information	= Info_Mod_Port_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Port_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Port_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Port_Hi_01_01"); //(zittrig) Ich weiß nicht ... Kann ich dir trauen?
	AI_Output(hero, self, "Info_Mod_Port_Hi_15_02"); //Du bist also Johannes Port?
	AI_Output(self, hero, "Info_Mod_Port_Hi_01_03"); //Vielleicht ... (leiser) vielleicht ...

	Moe_KnowsPort = 3;

	Info_ClearChoices	(Info_Mod_Port_Hi);

	Info_AddChoice	(Info_Mod_Port_Hi, "Ich werde dich töten!", Info_Mod_Port_Hi_B);
	Info_AddChoice	(Info_Mod_Port_Hi, "Ich suche dich. Jeder sucht dich.", Info_Mod_Port_Hi_A);
};

FUNC VOID Info_Mod_Port_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Port_Hi_B_15_00"); //Ich werde dich töten!
	AI_Output(self, hero, "Info_Mod_Port_Hi_B_01_01"); //(flehend) Nein, bitte nicht!

	Info_ClearChoices	(Info_Mod_Port_Hi);

	Info_AddChoice	(Info_Mod_Port_Hi, "Kleiner Scherz.", Info_Mod_Port_Hi_D);
	Info_AddChoice	(Info_Mod_Port_Hi, "Doch. Du stehst meinem Reichtum im Weg.", Info_Mod_Port_Hi_C);
};

FUNC VOID Info_Mod_Port_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_Port_Hi_D_15_00"); //Kleiner Scherz.

	Info_ClearChoices	(Info_Mod_Port_Hi);

	Info_AddChoice	(Info_Mod_Port_Hi, "Ich suche dich. Jeder sucht dich.", Info_Mod_Port_Hi_A);
};

FUNC VOID Info_Mod_Port_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_Port_Hi_C_15_00"); //Doch. Du stehst meinem Reichtum im Weg.

	Info_ClearChoices	(Info_Mod_Port_Hi);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Kill, 0);
};

FUNC VOID Info_Mod_Port_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Port_Hi_A_15_00"); //Ich suche dich. Jeder sucht dich.
	AI_Output(self, hero, "Info_Mod_Port_Hi_A_01_01"); //Das habe ich gemerkt! Sie wollen mich umbringen!
	AI_Output(hero, self, "Info_Mod_Port_Hi_A_15_02"); //Wer? Wieso?
	AI_Output(self, hero, "Info_Mod_Port_Hi_A_01_03"); //Ich weiß nicht, wer. Aber seine Gründe kenne ich. Seine Gründe, die ihn veranlasst haben, das Schiff zu versenken.
	AI_Output(hero, self, "Info_Mod_Port_Hi_A_15_04"); //Und was sind das für Gründe?
	AI_Output(self, hero, "Info_Mod_Port_Hi_A_01_05"); //(unsicher) Das sage ich dir nicht. Wieso sollte ich dir trauen? Aber ... ich wäre dir für etwas Essbares sehr dankbar ...
	AI_Output(hero, self, "Info_Mod_Port_Hi_A_15_06"); //Komm mit, ich bringe dich zu einem Bekannten, einem Händler. Dort bekommst du was zu essen.
	AI_Output(self, hero, "Info_Mod_Port_Hi_A_01_07"); //Bin ich dort sicher?
	AI_Output(hero, self, "Info_Mod_Port_Hi_A_15_08"); //Bestimmt.
	AI_Output(self, hero, "Info_Mod_Port_Hi_A_01_09"); //Na gut, ich folge dir.

	Info_ClearChoices	(Info_Mod_Port_Hi);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOBRAHIM");

	B_GivePlayerXP	(50);

	B_LogEntry	(TOPIC_MOD_MOE_PORT, "Johannes Port habe ich gefunden. Jetzt muss ich ihn nur noch zu Brahim bringen ...");
};

INSTANCE Info_Mod_Port_EXIT (C_INFO)
{
	npc		= Mod_4027_NONE_Port_NW;
	nr		= 1;
	condition	= Info_Mod_Port_EXIT_Condition;
	information	= Info_Mod_Port_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Port_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Port_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};