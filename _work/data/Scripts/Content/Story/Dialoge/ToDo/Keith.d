INSTANCE Info_Mod_Keith_Hi (C_INFO)
{
	npc		= Mod_7568_OUT_Keith_EIS;
	nr		= 1;
	condition	= Info_Mod_Keith_Hi_Condition;
	information	= Info_Mod_Keith_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Keith_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Luis_Hi))
	&& (Npc_IsDead(Mod_7570_OUT_Bandit_EIS))
	&& (Npc_IsDead(Mod_7571_OUT_Bandit_EIS))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Keith_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Keith_Hi_08_00"); //Please don't kill me. I'm just a poor hunter, I have neither gold nor anything else of value.
	AI_Output(hero, self, "Info_Mod_Keith_Hi_15_01"); //Don't worry, I'm not a bandit, and those two in front of your cabin are finished.
	AI_Output(self, hero, "Info_Mod_Keith_Hi_08_02"); //Whew...! I got lucky again.
	AI_Output(self, hero, "Info_Mod_Keith_Hi_08_03"); //When the guys tried to break into my house, I barely managed to close the door, but who knows how long they would have stopped them.
	AI_Output(self, hero, "Info_Mod_Keith_Hi_08_04"); //Anyway, thank you. I don't have much, but take these skins as a reward.

	B_GiveInvItems	(self, hero, ItAt_ShadowFur, 2);

	AI_Output(hero, self, "Info_Mod_Keith_Hi_15_05"); //Your friend Randi wasn't so lucky. They beat him to death in front of your cabin.
	AI_Output(self, hero, "Info_Mod_Keith_Hi_08_06"); //Those goddamn bandits are just nesting in our country. I wish the old tower would bury her under itself.
	AI_Output(hero, self, "Info_Mod_Keith_Hi_15_07"); //Old tower?! You wouldn't happen to find this tower by the lake, would you?
	AI_Output(self, hero, "Info_Mod_Keith_Hi_08_08"); //Yes, it is. How do you know about the tower?
	AI_Output(hero, self, "Info_Mod_Keith_Hi_15_09"); //I heard from hunter Luis that Randi wanted to use this tower as a night camp for hunting and he wanted to visit you.
	AI_Output(self, hero, "Info_Mod_Keith_Hi_08_10"); //What an irony of fate. If he had made it all the way to me, I could have told him about the bandits there.
	AI_Output(self, hero, "Info_Mod_Keith_Hi_08_11"); //But what about you? What are you doing with that tower?
	AI_Output(hero, self, "Info_Mod_Keith_Hi_15_12"); //Actually, I wanted to help Randi and you to use the tower, and if we could drive the bandits out of here with it, we would beat two flies with a gossip.
	AI_Output(self, hero, "Info_Mod_Keith_Hi_08_13"); //If you would help us with the problem with the bandits, you'd probably all be grateful.
	AI_Output(self, hero, "Info_Mod_Keith_Hi_08_14"); //Not to mention that we could use the tower again.
	AI_Output(hero, self, "Info_Mod_Keith_Hi_15_15"); //If you'd show me where the old tower is, I could get a picture of the situation.
	AI_Output(self, hero, "Info_Mod_Keith_Hi_08_16"); //Okay, I'll show you the way. However, I won't be able to support you in the fight. I'm getting old and I don't want to die sooner than I have to anyway.
	AI_Output(hero, self, "Info_Mod_Keith_Hi_15_17"); //Take me to the tower, I'll do the rest!
	AI_Output(self, hero, "Info_Mod_Keith_Hi_08_18"); //All right, come on!

	B_LogEntry	(TOPIC_MOD_EIS_ALTERTURM, "Randi was beaten to death by bandits. According to Keith, their camp is at the old tower Randi wanted to visit. He'll take me there, then I can take care of her.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "EISSEE");
};

INSTANCE Info_Mod_Keith_AtEissee (C_INFO)
{
	npc		= Mod_7568_OUT_Keith_EIS;
	nr		= 1;
	condition	= Info_Mod_Keith_AtEissee_Condition;
	information	= Info_Mod_Keith_AtEissee_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Keith_AtEissee_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Keith_Hi))
	&& (Npc_GetDistToWP(self, "EIS_358") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Keith_AtEissee_Info()
{
	AI_Output(self, hero, "Info_Mod_Keith_AtEissee_08_00"); //All right, here we are. I assume the leader of this gang is in the tower.
	AI_Output(self, hero, "Info_Mod_Keith_AtEissee_08_01"); //I found a key a few years ago when the tower was abandoned.
	AI_Output(self, hero, "Info_Mod_Keith_AtEissee_08_02"); //If the tower's locked, I'm sure you can get in with it. Good luck, son!

	B_GiveInvItems	(self, hero, ItKe_Eisturm01, 1);

	B_LogEntry	(TOPIC_MOD_EIS_ALTERTURM, "Keith took me to the old tower and gave me the key to it. Let's see what awaits me there....");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Keith_Dalma (C_INFO)
{
	npc		= Mod_7568_OUT_Keith_EIS;
	nr		= 1;
	condition	= Info_Mod_Keith_Dalma_Condition;
	information	= Info_Mod_Keith_Dalma_Info;
	permanent	= 0;
	important	= 0;
	description	= "The bandits are banished.";
};

FUNC INT Info_Mod_Keith_Dalma_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Vigonza_Dalma))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Keith_Dalma_Info()
{
	AI_Output(hero, self, "Info_Mod_Keith_Dalma_15_00"); //The bandits are banished.
	AI_Output(self, hero, "Info_Mod_Keith_Dalma_08_01"); //Very nice, here you have 100 gold coins as a reward.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	AI_Output(self, hero, "Info_Mod_Keith_Dalma_08_02"); //You should also go back to Luis and tell him about Randis' death. Probably he'll be interested to know that the tower is safe now.

	B_LogEntry	(TOPIC_MOD_EIS_ALTERTURM, "The ice tower is secured. Now I should go back to Luis.");

	B_SetTopicStatus	(TOPIC_MOD_EIS_ALTERTURM, LOG_SUCCESS);

	B_GivePlayerXP	(250);

	CurrentNQ += 1;

	B_RemoveNpc	(Mod_7572_OUT_Vigonza_EIS);

	B_StartOtherRoutine	(Mod_7566_OUT_Pilar_EIS, "FRIEDHOF");
};

INSTANCE Info_Mod_Keith_EXIT (C_INFO)
{
	npc		= Mod_7568_OUT_Keith_EIS;
	nr		= 1;
	condition	= Info_Mod_Keith_EXIT_Condition;
	information	= Info_Mod_Keith_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Keith_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Keith_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
