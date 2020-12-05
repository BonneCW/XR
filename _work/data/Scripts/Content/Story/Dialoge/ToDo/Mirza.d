INSTANCE Info_Mod_Mirza_Hi (C_INFO)
{
	npc		= Mod_7156_ASS_Mirza_NW;
	nr		= 1;
	condition	= Info_Mod_Mirza_Hi_Condition;
	information	= Info_Mod_Mirza_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "I think you're the next rung on my ladder to the novice.";
};

FUNC INT Info_Mod_Mirza_Hi_Condition()
{
	if (Mod_ASS_MahamadRaetsel == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mirza_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Mirza_Hi_15_00"); //I think you're the next rung on my ladder to the novice.
	AI_Output(self, hero, "Info_Mod_Mirza_Hi_12_01"); //That's the truth. And it's not the last...
	AI_Output(hero, self, "Info_Mod_Mirza_Hi_15_02"); //Too bad. What can I get you?
	AI_Output(self, hero, "Info_Mod_Mirza_Hi_12_03"); //I have a problem....
	AI_Output(hero, self, "Info_Mod_Mirza_Hi_15_04"); //Which I'm supposed to help you with?
	AI_Output(self, hero, "Info_Mod_Mirza_Hi_12_05"); //Quite so. The matter is somewhat... delicate
	AI_Output(hero, self, "Info_Mod_Mirza_Hi_15_06"); //Tell me about it.
	AI_Output(self, hero, "Info_Mod_Mirza_Hi_12_07"); //I have lost a valuable item entrusted to me by the High Council for safekeeping.
	AI_Output(hero, self, "Info_Mod_Mirza_Hi_15_08"); //What is it about?
	AI_Output(self, hero, "Info_Mod_Mirza_Hi_12_09"); //It is a rare amulet. Recently I was out at night looking for the rare healing bud. It must have fallen out of my bag.
	AI_Output(hero, self, "Info_Mod_Mirza_Hi_15_10"); //Where were you on the road?
	AI_Output(self, hero, "Info_Mod_Mirza_Hi_12_11"); //On the way from the lighthouse to the big forest. I didn't suspect anything bad, there was a pack of Warge coming at me.
	AI_Output(self, hero, "Info_Mod_Mirza_Hi_12_12"); //I could kill a few, but there were too many of them. Then I sought my salvation on the run. And since then, the thing has disappeared.
	AI_Output(hero, self, "Info_Mod_Mirza_Hi_15_13"); //Warge, you say? They're dangerous animals.
	AI_Output(self, hero, "Info_Mod_Mirza_Hi_12_14"); //You can say that again. You think you'll find this for me?
	AI_Output(hero, self, "Info_Mod_Mirza_Hi_15_15"); //I can try. What would you do if you had no voice to forgive?
	AI_Output(self, hero, "Info_Mod_Mirza_Hi_12_16"); //Good question. I don't know about that. But you get my vote. I promise.
	AI_Output(hero, self, "Info_Mod_Mirza_Hi_15_17"); //Your word in Beliar's ear!

	Log_CreateTopic	(TOPIC_MOD_ASS_AMULETT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_AMULETT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ASS_AMULETT, "Mirza lost an amulet in the dark forest. I'm supposed to find it. Get me a voice. It's best to start at the lighthouse upstairs.");

	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_33");
	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_33");
	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_33");

	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_31_NAVIGATION2");
	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_31_NAVIGATION2");
	Wld_InsertNpc	(Warg_Mirza,	"NW_FOREST_PATH_31_NAVIGATION2");
};

INSTANCE Info_Mod_Mirza_Amulett (C_INFO)
{
	npc		= Mod_7156_ASS_Mirza_NW;
	nr		= 1;
	condition	= Info_Mod_Mirza_Amulett_Condition;
	information	= Info_Mod_Mirza_Amulett_Info;
	permanent	= 0;
	important	= 0;
	description	= "I'm back. With amulet.";
};

FUNC INT Info_Mod_Mirza_Amulett_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mirza_Hi))
	&& (Npc_HasItems(hero, ItAm_Mirza) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mirza_Amulett_Info()
{
	AI_Output(hero, self, "Info_Mod_Mirza_Amulett_15_00"); //I'm back. With amulet.

	B_GiveInvItems	(hero, self, ItAm_Mirza, 1);

	AI_Output(self, hero, "Info_Mod_Mirza_Amulett_12_01"); //Where did you find it?
	AI_Output(hero, self, "Info_Mod_Mirza_Amulett_15_02"); //In the stomach of a warg.
	AI_Output(self, hero, "Info_Mod_Mirza_Amulett_12_03"); //We've been lucky!
	AI_Output(hero, self, "Info_Mod_Mirza_Amulett_15_04"); //We? You, I'd say.
	AI_Output(self, hero, "Info_Mod_Mirza_Amulett_12_05"); //However. I'm voting for you.
	AI_Output(hero, self, "Info_Mod_Mirza_Amulett_15_06"); //What an amulet it is.
	AI_Output(self, hero, "Info_Mod_Mirza_Amulett_12_07"); //I don't really know. It's rumored, put on makes it invulnerable. But I can't believe that.
	AI_Output(hero, self, "Info_Mod_Mirza_Amulett_15_08"); //Hmm. Interesting! Maybe you can learn more about it.
	AI_Output(self, hero, "Info_Mod_Mirza_Amulett_12_09"); //Who else can I go to?
	AI_Output(hero, self, "Info_Mod_Mirza_Amulett_15_10"); //Try Aiman. He always has something to delegate.
	AI_Output(self, hero, "Info_Mod_Mirza_Amulett_12_11"); //Yeah. Take care, now.

	B_GivePlayerXP	(100);

	B_SetTopicStatus	(TOPIC_MOD_ASS_AMULETT, LOG_SUCCESS);
	
	B_LogEntry	(TOPIC_MOD_ASS_MAGIER, "");
};

INSTANCE Info_Mod_Mirza_Blutkelch (C_INFO)
{
	npc		= Mod_7156_ASS_Mirza_NW;
	nr		= 1;
	condition	= Info_Mod_Mirza_Blutkelch_Condition;
	information	= Info_Mod_Mirza_Blutkelch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Got ya! What did you want with the cups, speak!";
};

FUNC INT Info_Mod_Mirza_Blutkelch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mufid_Verrat))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mirza_Blutkelch_Info()
{
	AI_Output(hero, self, "Info_Mod_Mirza_Blutkelch_15_00"); //Got ya! What did you want with the cups, speak!
	AI_Output(self, hero, "Info_Mod_Mirza_Blutkelch_12_01"); //Have mercy! We are on behalf of our leader Norek.
	AI_Output(hero, self, "Info_Mod_Mirza_Blutkelch_15_02"); //What kind of assignment?
	AI_Output(self, hero, "Info_Mod_Mirza_Blutkelch_12_03"); //We're setting up a field office for some of our people. It's too close for them here in the camp.
	AI_Output(hero, self, "Info_Mod_Mirza_Blutkelch_15_04"); //What people?
	AI_Output(self, hero, "Info_Mod_Mirza_Blutkelch_12_05"); //Well, we magician....
	AI_Output(hero, self, "Info_Mod_Mirza_Blutkelch_15_06"); //And for that, you had to slay the merchant?
	AI_Output(self, hero, "Info_Mod_Mirza_Blutkelch_12_07"); //He lives nearby. He could have noticed us.
	AI_Output(hero, self, "Info_Mod_Mirza_Blutkelch_15_08"); //And you tried to kill me, too.
	AI_Output(self, hero, "Info_Mod_Mirza_Blutkelch_12_09"); //I don't know why Mufid attacked you.
	AI_Output(hero, self, "Info_Mod_Mirza_Blutkelch_15_10"); //And the cup?
	AI_Output(self, hero, "Info_Mod_Mirza_Blutkelch_12_11"); //I don't know anything about a cup.
	AI_Output(hero, self, "Info_Mod_Mirza_Blutkelch_15_12"); //You're lying! You tell me everything now or you'll never get another chance to say anything.
	AI_Output(self, hero, "Info_Mod_Mirza_Blutkelch_12_13"); //I really don't know what the goblets are all about. You'll have to ask the Council.
	AI_Output(hero, self, "Info_Mod_Mirza_Blutkelch_15_14"); //What next?
	AI_Output(self, hero, "Info_Mod_Mirza_Blutkelch_12_15"); //As I said, Norek wants us mages to drop out. Then Zahit, who is in town, is to give the paladins a tip that assassin warriors are close to the city.
	AI_Output(self, hero, "Info_Mod_Mirza_Blutkelch_12_16"); //Norek believes that he can give us magicians the right to exist on khorinis, so that we can move around the country freely and no longer have to hide here.
	AI_Output(hero, self, "Info_Mod_Mirza_Blutkelch_15_17"); //Incredible! You want to betray your brothers.
	AI_Output(self, hero, "Info_Mod_Mirza_Blutkelch_12_18"); //That's not my idea. Norek wants that. And most magicians.
	AI_Output(hero, self, "Info_Mod_Mirza_Blutkelch_15_19"); //And you, as you can see. You'll die for this, traitor!

	B_GivePlayerXP	(100);

	Log_CreateTopic	(TOPIC_MOD_ASS_VERSCHWOERUNG, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_VERSCHWOERUNG, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ASS_VERSCHWOERUNG, "There's a conspiracy going on here. The magicians want to break away and then betray the warriors to the paladins. I really need to talk to Mustafa. Best of all, unheard.");
};

INSTANCE Info_Mod_Mirza_Pickpocket (C_INFO)
{
	npc		= Mod_7156_ASS_Mirza_NW;
	nr		= 1;
	condition	= Info_Mod_Mirza_Pickpocket_Condition;
	information	= Info_Mod_Mirza_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Mirza_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 23);
};

FUNC VOID Info_Mod_Mirza_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Mirza_Pickpocket);

	Info_AddChoice	(Info_Mod_Mirza_Pickpocket, DIALOG_BACK, Info_Mod_Mirza_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Mirza_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Mirza_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Mirza_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Mirza_Pickpocket);
};

FUNC VOID Info_Mod_Mirza_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Mirza_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Mirza_Pickpocket);

		Info_AddChoice	(Info_Mod_Mirza_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Mirza_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Mirza_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Mirza_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Mirza_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Mirza_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Mirza_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Mirza_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Mirza_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Mirza_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Mirza_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Mirza_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Mirza_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Mirza_EXIT (C_INFO)
{
	npc		= Mod_7156_ASS_Mirza_NW;
	nr		= 1;
	condition	= Info_Mod_Mirza_EXIT_Condition;
	information	= Info_Mod_Mirza_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Mirza_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Mirza_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
