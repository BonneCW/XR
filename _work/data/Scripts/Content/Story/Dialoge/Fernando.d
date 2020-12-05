INSTANCE Info_Mod_Fernando_Hi (C_INFO)
{
	npc		= Mod_576_NONE_Fernando_NW;
	nr		= 1;
	condition	= Info_Mod_Fernando_Hi_Condition;
	information	= Info_Mod_Fernando_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "And who are you?";
};

FUNC INT Info_Mod_Fernando_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fernando_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Fernando_Hi_15_00"); //And who are you?
	AI_Output(self, hero, "Info_Mod_Fernando_Hi_11_01"); //Fernando. Please excuse my tiredness, I don't sleep well at the moment.
};

INSTANCE Info_Mod_Fernando_BadSleep (C_INFO)
{
	npc		= Mod_576_NONE_Fernando_NW;
	nr		= 1;
	condition	= Info_Mod_Fernando_BadSleep_Condition;
	information	= Info_Mod_Fernando_BadSleep_Info;
	permanent	= 0;
	important	= 0;
	description	= "Why don't you sleep well?";
};

FUNC INT Info_Mod_Fernando_BadSleep_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fernando_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fernando_BadSleep_Info()
{
	AI_Output(hero, self, "Info_Mod_Fernando_BadSleep_15_00"); //Why don't you sleep well?

	AI_PlayAni	(self, "T_SEARCH");

	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep_11_01"); //The house across the street is haunted! Under the Paladin's bedroom.
	AI_Output(hero, self, "Info_Mod_Fernando_BadSleep_15_02"); //Oh, yeah.
	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep_11_03"); //No, really! Since the old man to whom the house belonged died, the house has been creaking and rumbling in it at night, just like in Beliar's kingdom!
	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep_11_04"); //As soon as I nodded off, it starts, sometimes for hours.
	AI_Output(hero, self, "Info_Mod_Fernando_BadSleep_15_05"); //Why don't you check to see what's causing the noise?
	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep_11_06"); //You can't do that! I, uh, well, if it's the old man's ghost? Or another devil's spook?
	AI_Output(hero, self, "Info_Mod_Fernando_BadSleep_15_07"); //What do the city guards think?
	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep_11_08"); //You don't want to believe it! Smile at me cheekily or laugh at me!
	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep_11_09"); //And I look like I've been ripped off every morning. Please, will you take care of this?

	Info_ClearChoices	(Info_Mod_Fernando_BadSleep);

	Info_AddChoice	(Info_Mod_Fernando_BadSleep, "I don't believe in ghosts.", Info_Mod_Fernando_BadSleep_B);
	Info_AddChoice	(Info_Mod_Fernando_BadSleep, "I'll have a look.", Info_Mod_Fernando_BadSleep_A);
};

FUNC VOID Info_Mod_Fernando_BadSleep_B()
{
	AI_Output(hero, self, "Info_Mod_Fernando_BadSleep_B_15_00"); //I don't believe in ghosts.

	Info_ClearChoices	(Info_Mod_Fernando_BadSleep);
};

FUNC VOID Info_Mod_Fernando_BadSleep_A()
{
	AI_Output(hero, self, "Info_Mod_Fernando_BadSleep_A_15_00"); //I'll have a look.
	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep_A_11_01"); //Thank you, thank you! Make it stop!

	Log_CreateTopic	(TOPIC_MOD_FERNANDO_MITTERNACHTSSPUK, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_FERNANDO_MITTERNACHTSSPUK, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_FERNANDO_MITTERNACHTSSPUK, "Fernando is tortured at night by noises from his empty neighbor's house. This is the building underneath the Paladin's bedroom. I was supposed to lie in wait in the house at midnight and see what's going on there.");

	Mod_Fernando_Mitternachtsspuk = 1;

	if (!Mod_Valentino_Kidnapped)
	{
		B_StartOtherRoutine	(Mod_754_NONE_Valentino_NW, "SPUK");
		B_StartOtherRoutine	(Mod_1066_VLK_Buergerin_NW, "SPUK");
	};

	Info_ClearChoices	(Info_Mod_Fernando_BadSleep);
};

INSTANCE Info_Mod_Fernando_BadSleep2 (C_INFO)
{
	npc		= Mod_576_NONE_Fernando_NW;
	nr		= 1;
	condition	= Info_Mod_Fernando_BadSleep2_Condition;
	information	= Info_Mod_Fernando_BadSleep2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Fernando_BadSleep2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Valentino_Mitternachtsspuk))
	&& (Wld_IsTime(22,05,07,59))
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fernando_BadSleep2_Info()
{
	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep2_11_00"); //(screams) Help, help! Oh Innos! Oh, it's just you. (yawns)
};

INSTANCE Info_Mod_Fernando_BadSleep3 (C_INFO)
{
	npc		= Mod_576_NONE_Fernando_NW;
	nr		= 1;
	condition	= Info_Mod_Fernando_BadSleep3_Condition;
	information	= Info_Mod_Fernando_BadSleep3_Info;
	permanent	= 0;
	important	= 0;
	description	= "I solved the mystery of the haunted neighbourhood.";
};

FUNC INT Info_Mod_Fernando_BadSleep3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Valentino_Mitternachtsspuk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fernando_BadSleep3_Info()
{
	AI_Output(hero, self, "Info_Mod_Fernando_BadSleep3_15_00"); //I solved the mystery of the haunted neighbourhood.
	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep3_11_01"); //Yes?
	AI_Output(hero, self, "Info_Mod_Fernando_BadSleep3_15_02"); //A couple, uh, in love moved their rendezvous there.
	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep3_11_03"); //Did you...? (toneless) Oh.
	AI_Output(hero, self, "Info_Mod_Fernando_BadSleep3_15_04"); //Can you sleep better with the knowledge?
	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep3_11_05"); //(shamefully) Of course. (mumbles) Get together....
	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep3_11_06"); //Uh, you deserve a reward, of course. Here, take this.

	B_GiveInvItems	(self, hero, ItMi_Gold, 150);

	if (Wld_IsTime(22,05,07,59))
	{
		AI_Output(self, hero, "Info_Mod_Fernando_BadSleep3_11_07"); //And now I need a good night's sleep.
	};

	Mod_FernandoBlubber = Wld_GetDay();

	B_SetTopicStatus	(TOPIC_MOD_FERNANDO_MITTERNACHTSSPUK, LOG_SUCCESS);

	B_GivePlayerXP	(100);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Fernando_SonjaFreier (C_INFO)
{
	npc		= Mod_576_NONE_Fernando_NW;
	nr		= 1;
	condition	= Info_Mod_Fernando_SonjaFreier_Condition;
	information	= Info_Mod_Fernando_SonjaFreier_Info;
	permanent	= 0;
	important	= 0;
	description	= "Are you one of Sonja's freelancers?";
};

FUNC INT Info_Mod_Fernando_SonjaFreier_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fernando_Hi))
	&& (Mod_Sonja_Freier == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fernando_SonjaFreier_Info()
{
	AI_Output(hero, self, "Info_Mod_Fernando_SonjaFreier_15_00"); //Are you one of Sonja's freelancers?
	AI_Output(self, hero, "Info_Mod_Fernando_SonjaFreier_11_01"); //Shh! Shh! Not so loud!
	AI_Output(hero, self, "Info_Mod_Fernando_SonjaFreier_15_02"); //So, yeah?
	AI_Output(self, hero, "Info_Mod_Fernando_SonjaFreier_11_03"); //(quietly) The times are over. My wife.... she noticed something. No, no, the times are over.

	Mod_Sonja_Freier = 2;

	B_LogEntry	(TOPIC_MOD_SONJA_FREIER, "Fernando is Sonja's former regular. However, his wife learnt of his impetus, so he didn't dare to go to the brothel.");
};

INSTANCE Info_Mod_Fernando_BadSleep4 (C_INFO)
{
	npc		= Mod_576_NONE_Fernando_NW;
	nr		= 1;
	condition	= Info_Mod_Fernando_BadSleep4_Condition;
	information	= Info_Mod_Fernando_BadSleep4_Info;
	permanent	= 1;
	important	= 0;
	description	= "Do you sleep well now?";
};

FUNC INT Info_Mod_Fernando_BadSleep4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fernando_BadSleep3))
	&& (Wld_GetDay() > Mod_FernandoBlubber)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fernando_BadSleep4_Info()
{
	AI_Output(hero, self, "Info_Mod_Fernando_BadSleep4_15_00"); //Do you sleep well now?
	AI_Output(self, hero, "Info_Mod_Fernando_BadSleep4_11_01"); //Most of the time. Only not if they're too wild in the next room.
};

INSTANCE Info_Mod_Fernando_Pickpocket (C_INFO)
{
	npc		= Mod_576_NONE_Fernando_NW;
	nr		= 1;
	condition	= Info_Mod_Fernando_Pickpocket_Condition;
	information	= Info_Mod_Fernando_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Fernando_Pickpocket_Condition()
{
	C_Beklauen	(72, ItMi_Gold, 30);
};

FUNC VOID Info_Mod_Fernando_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Fernando_Pickpocket);

	Info_AddChoice	(Info_Mod_Fernando_Pickpocket, DIALOG_BACK, Info_Mod_Fernando_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Fernando_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Fernando_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Fernando_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Fernando_Pickpocket);
};

FUNC VOID Info_Mod_Fernando_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Fernando_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Fernando_Pickpocket);

		Info_AddChoice	(Info_Mod_Fernando_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Fernando_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Fernando_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Fernando_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Fernando_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Fernando_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Fernando_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Fernando_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Fernando_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Fernando_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Fernando_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Fernando_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Fernando_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Fernando_EXIT (C_INFO)
{
	npc		= Mod_576_NONE_Fernando_NW;
	nr		= 1;
	condition	= Info_Mod_Fernando_EXIT_Condition;
	information	= Info_Mod_Fernando_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Fernando_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fernando_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
