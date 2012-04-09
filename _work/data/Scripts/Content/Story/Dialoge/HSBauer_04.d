INSTANCE Info_Mod_HSBauer_04_Hi (C_INFO)
{
	npc		= Mod_7018_HS_Bauer_REL;
	nr		= 1;
	condition	= Info_Mod_HSBauer_04_Hi_Condition;
	information	= Info_Mod_HSBauer_04_Hi_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_HSBauer_04_Hi_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HSBauer_04_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_HSBauer_04_Hi_05_00"); //HEY! Pass doch auf!
	AI_Output(hero, self, "Info_Mod_HSBauer_04_Hi_15_01"); //Was ist los?
	AI_Output(self, hero, "Info_Mod_HSBauer_04_Hi_05_02"); //Hier kannst du nich durch, hier ist 'ne Baustelle!
	AI_Output(hero, self, "Info_Mod_HSBauer_04_Hi_15_03"); //Wo?
	AI_Output(self, hero, "Info_Mod_HSBauer_04_Hi_05_04"); //UM GOTTES WILLEN, NIMM DAS KIND DA WEG!

	Info_ClearChoices	(Info_Mod_HSBauer_04_Hi);

	Info_AddChoice	(Info_Mod_HSBauer_04_Hi, "Pass auf! Hinter dir bricht ein Gerüst ein!", Info_Mod_HSBauer_04_Hi_C);
	Info_AddChoice	(Info_Mod_HSBauer_04_Hi, "Bleib stehen, wo du bist, oder ich ...", Info_Mod_HSBauer_04_Hi_B);
	Info_AddChoice	(Info_Mod_HSBauer_04_Hi, "Ach verpiss dich!", Info_Mod_HSBauer_04_Hi_A);
};

FUNC VOID Info_Mod_HSBauer_04_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_HSBauer_04_Hi_C_15_00"); //Pass auf! Hinter dir bricht ein Gerüst ein!
	AI_Output(self, hero, "Info_Mod_HSBauer_04_Hi_C_05_01"); //NEEEIN! Ich habe 6 Tage an diesem Gerüst gearbeitet. 6 TAGE!!!

	Info_ClearChoices	(Info_Mod_HSBauer_04_Hi);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_HSBauer_04_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_HSBauer_04_Hi_B_15_00"); //Bleib stehen, wo du bist, oder ich ... beiße ihm den Kopf ab!
	AI_Output(self, hero, "Info_Mod_HSBauer_04_Hi_B_05_01"); //He, Mann! Es kann doch nichts dafür! Mach nichts was du später bereuen würdest! Ich liebe dieses Kind wie mein Eigenes!

	Info_ClearChoices	(Info_Mod_HSBauer_04_Hi);

	Info_AddChoice	(Info_Mod_HSBauer_04_Hi, "Na gut ... hier hast du es.", Info_Mod_HSBauer_04_Hi_E);
	Info_AddChoice	(Info_Mod_HSBauer_04_Hi, "Hast du mal etwas Senf?", Info_Mod_HSBauer_04_Hi_D);
};

FUNC VOID Info_Mod_HSBauer_04_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_HSBauer_04_Hi_A_15_00"); //Ach verpiss dich!
	AI_Output(self, hero, "Info_Mod_HSBauer_04_Hi_A_05_01"); //Sag nicht, ich hätte dich nicht gewarnt, wenn dir ein Kantholz auf den Kopf fliegt!

	Info_ClearChoices	(Info_Mod_HSBauer_04_Hi);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_HSBauer_04_Hi_E()
{
	AI_Output(hero, self, "Info_Mod_HSBauer_04_Hi_E_15_00"); //Na gut ... hier hast du es.
	AI_Output(self, hero, "Info_Mod_HSBauer_04_Hi_E_05_01"); //Danke, edler Herr. Ich bin euch mit meiner Mutterliebe zu ewigem Dank verpflichtet.
	AI_Output(hero, self, "Info_Mod_HSBauer_04_Hi_E_15_02"); //Schon Okay ...

	Info_ClearChoices	(Info_Mod_HSBauer_04_Hi);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_HSBauer_04_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_HSBauer_04_Hi_D_15_00"); //Hast du mal etwas Senf?
	AI_Output(self, hero, "Info_Mod_HSBauer_04_Hi_D_05_01"); //Ja, hier. Wozu? ... nein du wirst doch nicht etwa ...
	AI_Output(hero, self, "Info_Mod_HSBauer_04_Hi_D_15_02"); //Mahlzeit. (nimmt einen Imaginären Biss)
	AI_Output(self, hero, "Info_Mod_HSBauer_04_Hi_D_05_03"); //NEEEEEEIN! MEIN BABY ... Jetzt musst du mir ein Neues machen!
	AI_Output(hero, self, "Info_Mod_HSBauer_04_Hi_D_15_04"); //Das ist doch nicht dein Ernst?
	AI_Output(self, hero, "Info_Mod_HSBauer_04_Hi_D_05_05"); //(weinerlich) Findest du mich etwa nicht attraktiv? Ist es das? Oh, du hast doch sicher eine Affäre, Schatz! Denk doch mal an unseren Sohn, hä?!
	AI_Output(hero, self, "Info_Mod_HSBauer_04_Hi_D_15_06"); //Den hab ich gegessen ...
	AI_Output(self, hero, "Info_Mod_HSBauer_04_Hi_D_05_07"); //Ach ja ... wenn das so ist, tut es mir Leid, sie behelligt zu haben Sir ... äh ... weitermachen.

	Info_ClearChoices	(Info_Mod_HSBauer_04_Hi);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_HSBauer_04_Pickpocket (C_INFO)
{
	npc		= Mod_7018_HS_Bauer_REL;
	nr		= 1;
	condition	= Info_Mod_HSBauer_04_Pickpocket_Condition;
	information	= Info_Mod_HSBauer_04_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20;
};

FUNC INT Info_Mod_HSBauer_04_Pickpocket_Condition()
{
	C_Beklauen	(15, ItMi_Gold, 45);
};

FUNC VOID Info_Mod_HSBauer_04_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_HSBauer_04_Pickpocket);

	Info_AddChoice	(Info_Mod_HSBauer_04_Pickpocket, DIALOG_BACK, Info_Mod_HSBauer_04_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_HSBauer_04_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_HSBauer_04_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_HSBauer_04_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_HSBauer_04_Pickpocket);
};

FUNC VOID Info_Mod_HSBauer_04_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_HSBauer_04_Pickpocket);
};

INSTANCE Info_Mod_HSBauer_04_EXIT (C_INFO)
{
	npc		= Mod_7018_HS_Bauer_REL;
	nr		= 1;
	condition	= Info_Mod_HSBauer_04_EXIT_Condition;
	information	= Info_Mod_HSBauer_04_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_HSBauer_04_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HSBauer_04_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};