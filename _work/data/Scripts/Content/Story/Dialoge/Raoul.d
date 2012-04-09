INSTANCE Info_Mod_Raoul_Hi (C_INFO)
{
	npc		= Mod_794_SLD_Raoul_MT;
	nr		= 1;
	condition	= Info_Mod_Raoul_Hi_Condition;
	information	= Info_Mod_Raoul_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Seit wann schiebt ihr hier Wache?";
};

FUNC INT Info_Mod_Raoul_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Khaled_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raoul_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Raoul_Hi_15_00"); //Seit wann schiebt ihr hier Wache und warum dürfen jetzt keine aus dem Sumpflager mehr hinein, obwohl da einer drin sitzt?
	AI_Output(self, hero, "Info_Mod_Raoul_Hi_01_01"); //Tja, wir sind hier die Türsteher, seitdem die neue Regel erlassen wurde, dass in der Kneipe kein Sumpfkraut mehr geraucht werden darf, und somit auch keine Sumpffritzen rein dürfen.
	AI_Output(hero, self, "Info_Mod_Raoul_Hi_15_02"); //Und warum besteht dieses Verbot?
	AI_Output(self, hero, "Info_Mod_Raoul_Hi_01_03"); //Lee will den unkontrollierten Konsum von Sumpfkraut eindämmen, damit die Männer mehr trainieren.
	AI_Output(self, hero, "Info_Mod_Raoul_Hi_01_04"); //Und die anderen in der Kneipe sollen ja auch nicht durch den Sumpfkrautrauch in Mitleidenschaft gezogen werden, obwohl sie es vielleicht gar nicht wollen.
	AI_Output(self, hero, "Info_Mod_Raoul_Hi_01_05"); //Jetzt darf nur noch außerhalb der Kneipe geraucht werden, aber wer zu oft dabei erwischt wird, bekommt eine Rüge und extra Stunden Training. (leiser, zu sich selbst) Tja, jetzt muss man vors Lager gehen, um zu rauchen.
	AI_Output(hero, self, "Info_Mod_Raoul_Hi_15_06"); //Aber wieso ist der Typ aus dem Sumpflager ...
	AI_Output(self, hero, "Info_Mod_Raoul_Hi_01_07"); //Tja, der war schon drin, bevor die neue Regelung in Kraft trat. Und unsere Aufgabe ist es ja nur darauf zu achten, dass keiner von denen hineinkommt.
};

INSTANCE Info_Mod_Raoul_Pickpocket (C_INFO)
{
	npc		= Mod_794_SLD_Raoul_MT;
	nr		= 1;
	condition	= Info_Mod_Raoul_Pickpocket_Condition;
	information	= Info_Mod_Raoul_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Raoul_Pickpocket_Condition()
{
	C_Beklauen	(68, ItMi_Gold, 210);
};

FUNC VOID Info_Mod_Raoul_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Raoul_Pickpocket);

	Info_AddChoice	(Info_Mod_Raoul_Pickpocket, DIALOG_BACK, Info_Mod_Raoul_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Raoul_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Raoul_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Raoul_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Raoul_Pickpocket);
};

FUNC VOID Info_Mod_Raoul_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Raoul_Pickpocket);
};

INSTANCE Info_Mod_Raoul_EXIT (C_INFO)
{
	npc		= Mod_794_SLD_Raoul_MT;
	nr		= 1;
	condition	= Info_Mod_Raoul_EXIT_Condition;
	information	= Info_Mod_Raoul_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Raoul_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Raoul_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};