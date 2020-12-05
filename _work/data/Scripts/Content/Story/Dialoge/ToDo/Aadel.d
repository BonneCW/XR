INSTANCE Info_Mod_Aadel_Hi (C_INFO)
{
	npc		= Mod_7145_ASS_Aadel_NW;
	nr		= 1;
	condition	= Info_Mod_Aadel_Hi_Condition;
	information	= Info_Mod_Aadel_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "You're Aadel?";
};

FUNC INT Info_Mod_Aadel_Hi_Condition()
{
	if (Mod_ASS_Magier == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Aadel_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Aadel_Hi_15_00"); //You're Aadel?
	AI_Output(self, hero, "Info_Mod_Aadel_Hi_02_01"); //Sure. What do you want?
	AI_Output(hero, self, "Info_Mod_Aadel_Hi_15_02"); //I'm supposed to get in touch with you.
	AI_Output(self, hero, "Info_Mod_Aadel_Hi_02_03"); //Says who?
	AI_Output(hero, self, "Info_Mod_Aadel_Hi_15_04"); //Masut says so. I want to be a magician.
	AI_Output(self, hero, "Info_Mod_Aadel_Hi_02_05"); //Hear, hear, hear! Anybody could come.
	AI_Output(hero, self, "Info_Mod_Aadel_Hi_15_06"); //I'm not everyone. After all, I've been through some trickery.
	AI_Output(self, hero, "Info_Mod_Aadel_Hi_02_07"); //Oops! Honestly?
	AI_Output(hero, self, "Info_Mod_Aadel_Hi_15_08"); //Logical. Otherwise I wouldn't have come all the way here.
	AI_Output(self, hero, "Info_Mod_Aadel_Hi_02_09"); //True enough. So listen: You must also take examinations with us. Not every crook who's run away can join us.
	AI_Output(hero, self, "Info_Mod_Aadel_Hi_15_10"); //So what do I have to do?
	AI_Output(self, hero, "Info_Mod_Aadel_Hi_02_11"); //Become a novice.
	AI_Output(hero, self, "Info_Mod_Aadel_Hi_15_12"); //Which means?
	AI_Output(self, hero, "Info_Mod_Aadel_Hi_02_13"); //Do some small tasks for the magicians. Offer your help. If you know what I mean.
	AI_Output(hero, self, "Info_Mod_Aadel_Hi_15_14"); //Certainly. And where do I start?
	AI_Output(self, hero, "Info_Mod_Aadel_Hi_02_15"); //Go to Kamal back there. This is the quack in our club. He always needs something.
	AI_Output(hero, self, "Info_Mod_Aadel_Hi_15_16"); //As you wish, master.
	
	B_LogEntry	(TOPIC_MOD_ASS_MAGIER, "");
};

INSTANCE Info_Mod_Aadel_Later (C_INFO)
{
	npc		= Mod_7145_ASS_Aadel_NW;
	nr		= 1;
	condition	= Info_Mod_Aadel_Later_Condition;
	information	= Info_Mod_Aadel_Later_Info;
	permanent	= 0;
	important	= 0;
	description	= "I'm back. Anything wrong?";
};

FUNC INT Info_Mod_Aadel_Later_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kais_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Kais_Blutkelch))
	&& (Kapitel >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Aadel_Later_Info()
{
	AI_Output(hero, self, "Info_Mod_Aadel_Later_15_00"); //I'm back. Anything wrong?
	AI_Output(self, hero, "Info_Mod_Aadel_Later_02_01"); //You've been sent to docks.
	AI_Output(hero, self, "Info_Mod_Aadel_Later_15_02"); //He didn't want anything from me the other day.
	AI_Output(self, hero, "Info_Mod_Aadel_Later_02_03"); //Bullshit! He needs urgent help. Go for it!
};

INSTANCE Info_Mod_Aadel_Pickpocket (C_INFO)
{
	npc		= Mod_7145_ASS_Aadel_NW;
	nr		= 1;
	condition	= Info_Mod_Aadel_Pickpocket_Condition;
	information	= Info_Mod_Aadel_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_150;
};

FUNC INT Info_Mod_Aadel_Pickpocket_Condition()
{
	C_Beklauen	(133, ItMi_Gold, 77);
};

FUNC VOID Info_Mod_Aadel_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Aadel_Pickpocket);

	Info_AddChoice	(Info_Mod_Aadel_Pickpocket, DIALOG_BACK, Info_Mod_Aadel_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Aadel_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Aadel_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Aadel_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Aadel_Pickpocket);
};

FUNC VOID Info_Mod_Aadel_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Aadel_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Aadel_Pickpocket);

		Info_AddChoice	(Info_Mod_Aadel_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Aadel_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Aadel_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Aadel_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Aadel_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Aadel_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Aadel_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Aadel_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Aadel_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Aadel_Pickpocket);

		AI_StopProcessInfos	(self);

		B_Attack (self, hero, AR_Theft, 1);
	}
	else
	{
		if (rnd >= 75)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 200);
		}
		else if (rnd >= 50)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 100);
		}
		else if (rnd >= 25)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 50);
		};

		B_Say	(self, hero, "$PICKPOCKET_BESTECHUNG_01");

		Info_ClearChoices	(Info_Mod_Aadel_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Aadel_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Aadel_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Aadel_EXIT (C_INFO)
{
	npc		= Mod_7145_ASS_Aadel_NW;
	nr		= 1;
	condition	= Info_Mod_Aadel_EXIT_Condition;
	information	= Info_Mod_Aadel_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Aadel_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Aadel_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
