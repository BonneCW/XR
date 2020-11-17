INSTANCE Info_Mod_Harlok_Hi (C_INFO)
{
	npc		= Mod_2015_PSINOV_Harlok_REL;
	nr		= 1;
	condition	= Info_Mod_Harlok_Hi_Condition;
	information	= Info_Mod_Harlok_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Harlok_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Harlok_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Harlok_Hi_01_00"); //Hey, willst du was zu qualmen? Hier, der erste geht aufs Haus.

	B_GiveInvItems	(self, hero, ItMi_Joint, 1);

	B_UseItem	(hero, ItMi_Joint);

	AI_Output(self, hero, "Info_Mod_Harlok_Hi_01_01"); //Jeden weiteren gibt’s für nur ganz wenig Erz ... ähh, Gold bei mir zu haben. 
};

INSTANCE Info_Mod_Harlok_Woher (C_INFO)
{
	npc		= Mod_2015_PSINOV_Harlok_REL;
	nr		= 1;
	condition	= Info_Mod_Harlok_Woher_Condition;
	information	= Info_Mod_Harlok_Woher_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kommst du nicht aus dem Sumpflager?";
};

FUNC INT Info_Mod_Harlok_Woher_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Harlok_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Harlok_Woher_Info()
{
	AI_Output(hero, self, "Info_Mod_Harlok_Woher_15_00"); //Kommst du nicht aus dem Sumpflager?
	AI_Output(self, hero, "Info_Mod_Harlok_Woher_01_01"); //(missmutig) Ähh, komm mir bloß nicht damit. Sumpfkrautstampfen dürfte ich dort den ganzen Tag.
	AI_Output(self, hero, "Info_Mod_Harlok_Woher_01_02"); //Einmal kam auch so ein Penner, und hat mir eine verpasst als ich keine Lust auf den Scheiß hatte.
	AI_Output(self, hero, "Info_Mod_Harlok_Woher_01_03"); //(enthusiastischer) Hier habe ich es viel besser. Rauchen und Verkaufen ... die Münzen wandern mir hier wie von selbst in den Geldbeutel.
};

INSTANCE Info_Mod_Harlok_HerekZombie (C_INFO)
{
	npc		= Mod_2015_PSINOV_Harlok_REL;
	nr		= 1;
	condition	= Info_Mod_Harlok_HerekZombie_Condition;
	information	= Info_Mod_Harlok_HerekZombie_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Harlok_HerekZombie_Condition()
{
	if (Mod_Herek_Zombie == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Harlok_HerekZombie_Info()
{
	AI_Output(self, hero, "Info_Mod_Harlok_HerekZombie_01_00"); //(belustigt) Hey, was machst du für ein Gesicht. Du siehst aus, als ob du jemanden verdreschen wolltest, hähä.
	AI_Output(self, hero, "Info_Mod_Harlok_HerekZombie_01_01"); //Nimm einen guten Zug und entspann dich ...
	AI_Output(hero, self, "Info_Mod_Harlok_HerekZombie_15_02"); //(zu sich selbst) Dieser Herek bekommt was zu hören ...
	AI_Output(self, hero, "Info_Mod_Harlok_HerekZombie_01_03"); //Herek? Ahh, der Vogel.
	AI_Output(self, hero, "Info_Mod_Harlok_HerekZombie_01_04"); //Is vor kurzem aus der Schenke raus und wegmarschiert ... mit 'ner Spitzhacke aufm Rücken.
	AI_Output(self, hero, "Info_Mod_Harlok_HerekZombie_01_05"); //Hat heute wohl noch was vor, hähä. Alle so unentspannt zur Zeit ...

	B_LogEntry	(TOPIC_MOD_HEREK_GOLD, "Wie ich von Harlok erfahren habe, hat Herek ausgerüstet mit einer Spitzhacke die Taverne verlassen. Hmm, wo er wohl hin ist?");

	B_StartOtherRoutine	(Mod_7670_STT_Herek_REL, "ATZOMBIE");
};

INSTANCE Info_Mod_Harlok_Trade (C_INFO)
{
	npc		= Mod_2015_PSINOV_Harlok_REL;
	nr		= 1;
	condition	= Info_Mod_Harlok_Trade_Condition;
	information	= Info_Mod_Harlok_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Harlok_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Harlok_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Harlok_Trade_Info()
{
	B_GiveTradeInv	(self);
};

INSTANCE Info_Mod_Harlok_EXIT (C_INFO)
{
	npc		= Mod_2015_PSINOV_Harlok_REL;
	nr		= 1;
	condition	= Info_Mod_Harlok_EXIT_Condition;
	information	= Info_Mod_Harlok_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Harlok_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Harlok_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};