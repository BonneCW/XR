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
	description	= "Aren't you coming out of the swamp camp?";
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
	AI_Output(hero, self, "Info_Mod_Harlok_Woher_15_00"); //Aren't you coming out of the swamp camp?
	AI_Output(self, hero, "Info_Mod_Harlok_Woher_01_01"); //Uh, don't give me that. I'll be there all day long.
	AI_Output(self, hero, "Info_Mod_Harlok_Woher_01_02"); //Once a bum came along and gave me one when I didn't want to fuck it up.
	AI_Output(self, hero, "Info_Mod_Harlok_Woher_01_03"); //Here I have it much better. Smoking and selling.... the coins are going into my wallet all by themselves.
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
	AI_Output(self, hero, "Info_Mod_Harlok_HerekZombie_01_00"); //Hey, what a face you're making. You look like you're beating on somebody, huh?
	AI_Output(self, hero, "Info_Mod_Harlok_HerekZombie_01_01"); //Take a good train and relax....
	AI_Output(hero, self, "Info_Mod_Harlok_HerekZombie_15_02"); //This Herek gets something to hear....
	AI_Output(self, hero, "Info_Mod_Harlok_HerekZombie_01_03"); //Herek? Ahh, the bird.
	AI_Output(self, hero, "Info_Mod_Harlok_HerekZombie_01_04"); //Has recently left the tavern and marched away.... with a pickaxe on the back.
	AI_Output(self, hero, "Info_Mod_Harlok_HerekZombie_01_05"); //Guess I'm busy tonight, huh? Everyone so unrestrained at the moment...

	B_LogEntry	(TOPIC_MOD_HEREK_GOLD, "As I heard from Harlok, Herek left the tavern equipped with a pickaxe. Hmm, where do you think he went?");

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
