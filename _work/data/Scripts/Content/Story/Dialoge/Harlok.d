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
	description	= "Czy nie wychodzisz z obozu bagiennego?";
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
	AI_Output(hero, self, "Info_Mod_Harlok_Woher_15_00"); //Czy nie wychodzisz z obozu bagiennego?
	AI_Output(self, hero, "Info_Mod_Harlok_Woher_01_01"); //Nie daj mi tego. Bede tam przez caly dzien.
	AI_Output(self, hero, "Info_Mod_Harlok_Woher_01_02"); //Pewnego razu przyszla posciel i dala mi jedna, kiedy nie chcialam jej popukac.
	AI_Output(self, hero, "Info_Mod_Harlok_Woher_01_03"); //Tutaj mam ja duzo lepiej. Palenie i sprzedaz..... monety same wchodza do mojego portfela.
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
	AI_Output(self, hero, "Info_Mod_Harlok_HerekZombie_01_00"); //Hej, co twarz tworzysz. Wygladasz tak, jak bijesz kogos na kims, huh?
	AI_Output(self, hero, "Info_Mod_Harlok_HerekZombie_01_01"); //Dobry pociag i relaks.....
	AI_Output(hero, self, "Info_Mod_Harlok_HerekZombie_15_02"); //Ten Herek dostaje cos do slyszenia.....
	AI_Output(self, hero, "Info_Mod_Harlok_HerekZombie_01_03"); //Herek? Ahh, ptak.
	AI_Output(self, hero, "Info_Mod_Harlok_HerekZombie_01_04"); //Ostatnio opuscila niedawno tawerne i wyszla na marsz..... z pickaxe na plecach.
	AI_Output(self, hero, "Info_Mod_Harlok_HerekZombie_01_05"); //Czy mysle, ze dzis wieczorem jestem zajety, huh? Wszyscy tak nieposiadajacy obecnie ograniczen....

	B_LogEntry	(TOPIC_MOD_HEREK_GOLD, "Jak slyszalem od Harloka, Herek opuscil tawerne wyposazona w piknik. Hmm, gdzie myslisz, dokad on poszedl?");

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
