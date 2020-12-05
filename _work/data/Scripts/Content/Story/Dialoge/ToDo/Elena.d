INSTANCE Info_Mod_Elena_Hi (C_INFO)
{
	npc		= Mod_783_BAU_Elena_NW;
	nr		= 1;
	condition	= Info_Mod_Elena_Hi_Condition;
	information	= Info_Mod_Elena_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hi.";
};

FUNC INT Info_Mod_Elena_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Elena_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Elena_Hi_15_00"); //How are you doing?
	AI_Output(self, hero, "Info_Mod_Elena_Hi_12_01"); //I'm all right. What do you want from me?
	AI_Output(hero, self, "Info_Mod_Elena_Hi_15_02"); //What have you got for me?
	AI_Output(self, hero, "Info_Mod_Elena_Hi_12_03"); //I could sell you some things. But there's nothing more to it.
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_ONAR, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_ONAR, "Elena can sell me some goods.");
};

INSTANCE Info_Mod_Elena_Hexenparty_01 (C_INFO)
{
	npc		= Mod_783_BAU_Elena_NW;
	nr		= 1;
	condition	= Info_Mod_Elena_Hexenparty_01_Condition;
	information	= Info_Mod_Elena_Hexenparty_01_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Elena_Hexenparty_01_Condition()
{
	if (Mod_TrfWoman == 1)
	|| ((Mod_WM_Boeden == 13)
	&& (Mod_WM_Boeden == 14))
	&& (Npc_GetDistToWP(hero, "NW_BIGFARM_FOREST_08") < 1000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Elena_Hexenparty_01_Info()
{
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_01_12_00"); //What are you doing here? I sense magical ability in you and the restaurant of a mighty demon.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_01_12_01"); //You don't seem like an ordinary peasant woman, or else we would have hunted you to the devil. So speak!

	B_RemoveNpc	(Mod_7198_HEX_AttraktiveFrau_NW);
	
	Info_ClearChoices	(Info_Mod_Elena_Hexenparty_01);

	Info_AddChoice	(Info_Mod_Elena_Hexenparty_01, "I want to join your sisterhood.", Info_Mod_Elena_Hexenparty_01_C);
	Info_AddChoice	(Info_Mod_Elena_Hexenparty_01, "I only wanted to have a look around.", Info_Mod_Elena_Hexenparty_01_B);
	Info_AddChoice	(Info_Mod_Elena_Hexenparty_01, "I'm here to destroy you.", Info_Mod_Elena_Hexenparty_01_A);
};

FUNC VOID Info_Mod_Elena_Hexenparty_01_C()
{
	AI_Output(hero, self, "Info_Mod_Elena_Hexenparty_01_C_15_00"); //I want to join your sisterhood.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_01_C_12_01"); //(laughs) A new contender for our covenant.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_01_C_12_02"); //(serious) Indeed, your magical abilities speak for you, but also raise some questions: Where did you learn them?
	
	Info_ClearChoices	(Info_Mod_Elena_Hexenparty_01);

	Info_AddChoice	(Info_Mod_Elena_Hexenparty_01, "I can't remember.", Info_Mod_Elena_Hexenparty_01_F);
	Info_AddChoice	(Info_Mod_Elena_Hexenparty_01, "I taught them to myself.", Info_Mod_Elena_Hexenparty_01_E);
	Info_AddChoice	(Info_Mod_Elena_Hexenparty_01, "A water magician taught me.", Info_Mod_Elena_Hexenparty_01_D);
};

FUNC VOID Info_Mod_Elena_Hexenparty_01_B()
{
	AI_Output(hero, self, "Info_Mod_Elena_Hexenparty_01_B_15_00"); //I just wanted to take a look around.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_01_B_12_01"); //You foolish thing I think you're trying to make a fool of me. Tell me what you're looking for right now and think about what you're saying.
	
	Info_ClearChoices	(Info_Mod_Elena_Hexenparty_01);

	Info_AddChoice	(Info_Mod_Elena_Hexenparty_01, "I want to join your sisterhood.", Info_Mod_Elena_Hexenparty_01_C);
	Info_AddChoice	(Info_Mod_Elena_Hexenparty_01, "I'm here to destroy you.", Info_Mod_Elena_Hexenparty_01_A);
};

FUNC VOID Info_Mod_Elena_Hexenparty_01_A()
{
	AI_Output(hero, self, "Info_Mod_Elena_Hexenparty_01_A_15_00"); //I'm here to destroy you.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_01_A_12_01"); //What?! You fool have no idea who you're up against here!
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_01_A_12_02"); //Come on, sisters, show her how we deal with uninvited guests.
	
	Info_ClearChoices	(Info_Mod_Elena_Hexenparty_01);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Kill, 0);
	B_Attack	(Mod_104_BAU_Rega_NW, hero, AR_Kill, 0);
	B_Attack	(Mod_1403_BAU_Baeuerin_NW, hero, AR_Kill, 0);

	Mod_HexenAttack = 1;
};

FUNC VOID Info_Mod_Elena_Hexenparty_01_G()
{
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_01_G_12_00"); //All right, we want to give you a chance. If you have proven yourself worthy of our sisterhood, we will welcome you into our community.
	AI_Output(hero, self, "Info_Mod_Elena_Hexenparty_01_G_15_01"); //What do you want me to do?
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_01_G_12_02"); //This Pepe has been a thorn in our side for a long time. He's far too close to where we're hiding.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_01_G_12_03"); //We're going to pay him a little visit.... and decimate his herd. We're just gonna watch this time.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_01_G_12_04"); //That should be enough to keep him away from the forest in the future, so that we can continue our work of chaos undisturbed.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_01_G_12_05"); //Take this enchanted war skin, put it on and follow us.

	B_GiveInvItems	(self, hero, ItRu_Verwandlungsfell, 1);

	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_01_G_12_06"); //If you want, I can also teach you to use your animal form more skillfully, tame your aggressive instincts, eat carcasses and let other wolves and warriors follow you.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_01_G_12_07"); //In addition, you would share your animal character's experience as a human being and thus gain strength and power over time as a warg.
	
	Info_ClearChoices	(Info_Mod_Elena_Hexenparty_01);

	if (hero.lp >= 3)
	{
		Info_AddChoice	(Info_Mod_Elena_Hexenparty_01, "Teach me how to control my animal form better. (3 learning points)", Info_Mod_Elena_Hexenparty_01_H);
	};

	Info_AddChoice	(Info_Mod_Elena_Hexenparty_01, "Let's get going.", Info_Mod_Elena_Hexenparty_01_I);
};

FUNC VOID Info_Mod_Elena_Hexenparty_01_F()
{
	AI_Output(hero, self, "Info_Mod_Elena_Hexenparty_01_F_15_00"); //I can't remember.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_01_F_12_01"); //Hmm, she's lost her memory. The encounter with a demon could of course cause something like that.
	
	Info_Mod_Elena_Hexenparty_01_G();
};

FUNC VOID Info_Mod_Elena_Hexenparty_01_E()
{
	AI_Output(hero, self, "Info_Mod_Elena_Hexenparty_01_E_15_00"); //I taught myself.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_01_E_12_01"); //Impressive, you must have witch's blood in you.
	
	Info_Mod_Elena_Hexenparty_01_G();
};

FUNC VOID Info_Mod_Elena_Hexenparty_01_D()
{
	AI_Output(hero, self, "Info_Mod_Elena_Hexenparty_01_D_15_00"); //A water magician taught me.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_01_D_12_01"); //You want to mock me?! Let them out, sisters...
	
	Info_ClearChoices	(Info_Mod_Elena_Hexenparty_01);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Kill, 0);
	B_Attack	(Mod_104_BAU_Rega_NW, hero, AR_Kill, 0);
	B_Attack	(Mod_1403_BAU_Baeuerin_NW, hero, AR_Kill, 0);

	Mod_HexenAttack = 1;
};

FUNC VOID Info_Mod_Elena_Hexenparty_01_I()
{
	AI_Output(hero, self, "Info_Mod_Elena_Hexenparty_01_I_15_00"); //Let's get going.

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Incredible. The witches actually fell for my cover. I'm supposed to put on the warghaut and run away with my sisters Pepe.");
	
	Info_ClearChoices	(Info_Mod_Elena_Hexenparty_01);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Elena_Hexenparty_01_H()
{
	AI_Output(hero, self, "Info_Mod_Elena_Hexenparty_01_H_15_00"); //Teach me how to control my animal form better.

	hero.lp -= 3;

	Mod_WM_Tiergestalt = 1;
	
	Info_Mod_Elena_Hexenparty_01_I();
};

INSTANCE Info_Mod_Elena_Hexenparty_07 (C_INFO)
{
	npc		= Mod_783_BAU_Elena_NW;
	nr		= 1;
	condition	= Info_Mod_Elena_Hexenparty_07_Condition;
	information	= Info_Mod_Elena_Hexenparty_07_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Elena_Hexenparty_07_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Elena_Hexenparty_01))
	&& (Mod_WM_IsWarg == 1)
	&& (Mod_TrfWoman == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Elena_Hexenparty_07_Info()
{
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_07_12_00"); //All right, now follow us.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOPEPE");
	B_StartOtherRoutine	(Mod_104_BAU_Rega_NW, "TOPEPE");
	B_StartOtherRoutine	(Mod_1403_BAU_Baeuerin_NW, "TOPEPE");
};

INSTANCE Info_Mod_Elena_Hexenparty_08 (C_INFO)
{
	npc		= Mod_783_BAU_Elena_NW;
	nr		= 1;
	condition	= Info_Mod_Elena_Hexenparty_08_Condition;
	information	= Info_Mod_Elena_Hexenparty_08_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Elena_Hexenparty_08_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Elena_Hexenparty_07))
	&& (Mod_WM_IsWarg == 1)
	&& (Mod_TrfWoman == 1)
	&& (Npc_GetDistToWP(self, "NW_BIGFARM_FOREST_03_NAVIGATION3") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Elena_Hexenparty_08_Info()
{
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_08_12_00"); //Go on, then, you know what to do.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Elena_Hexenparty_09 (C_INFO)
{
	npc		= Mod_783_BAU_Elena_NW;
	nr		= 1;
	condition	= Info_Mod_Elena_Hexenparty_09_Condition;
	information	= Info_Mod_Elena_Hexenparty_09_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Elena_Hexenparty_09_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Elena_Hexenparty_08))
	&& (Mod_WM_IsWarg == 1)
	&& (Mod_TrfWoman == 1)
	&& (Npc_GetDistToWP(self, "NW_BIGFARM_SHEEP2_02") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Elena_Hexenparty_09_Info()
{
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_09_12_00"); //Have you been eating the sheep's blood? Not a bad job.... for a starting witch.

	AI_StopProcessInfos	(self);

	Mod_WM_HexenVerwandlung = 1;
};

INSTANCE Info_Mod_Elena_Hexenparty_02 (C_INFO)
{
	npc		= Mod_783_BAU_Elena_NW;
	nr		= 1;
	condition	= Info_Mod_Elena_Hexenparty_02_Condition;
	information	= Info_Mod_Elena_Hexenparty_02_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Elena_Hexenparty_02_Condition()
{
	if (Mod_WM_HexenVerwandlung == 2)
	&& (Mod_TrfWoman == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Elena_Hexenparty_02_Info()
{
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_02_12_00"); //That was an uplifting and enjoyable experience, my sister, don't you think?

	B_GivePlayerXP	(200);

	B_StartOtherRoutine	(self, "HEXE");
	B_StartOtherRoutine	(Mod_104_BAU_Rega_NW, "HEXE");
	B_StartOtherRoutine	(Mod_1403_BAU_Baeuerin_NW, "HEXE");

	B_StartOtherRoutine	(Mod_793_BAU_Pepe_NW, "SCHAFETOT");
	
	Info_ClearChoices	(Info_Mod_Elena_Hexenparty_02);

	Info_AddChoice	(Info_Mod_Elena_Hexenparty_02, "I don't know.", Info_Mod_Elena_Hexenparty_02_B);
	Info_AddChoice	(Info_Mod_Elena_Hexenparty_02, "Yes, certainly.", Info_Mod_Elena_Hexenparty_02_A);
};

FUNC VOID Info_Mod_Elena_Hexenparty_02_C()
{
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_02_C_12_00"); //However, I hope you are ready to continue your work of destruction and disintegration.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_02_C_12_01"); //Take this role of hailstorm, wait for a farmer and the farmer's wife to work in the field in front of Onar's homestead and apply it there.

	B_GiveInvItems	(self, hero, ItSc_Hagel, 1);

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "This time my sisters have asked me to use the hailstorm of the farmer and his wife on the field in front of Onar's farm.");
	
	Info_ClearChoices	(Info_Mod_Elena_Hexenparty_02);
};

FUNC VOID Info_Mod_Elena_Hexenparty_02_B()
{
	AI_Output(hero, self, "Info_Mod_Elena_Hexenparty_02_B_15_00"); //I don't know.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_02_B_12_01"); //But, but. You still have a lot to learn.
	
	Info_Mod_Elena_Hexenparty_02_C();
};

FUNC VOID Info_Mod_Elena_Hexenparty_02_A()
{
	AI_Output(hero, self, "Info_Mod_Elena_Hexenparty_02_A_15_00"); //Yes, certainly.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_02_A_12_01"); //That's what I mean.
	
	Info_Mod_Elena_Hexenparty_02_C();
};

INSTANCE Info_Mod_Elena_Hexenparty_03 (C_INFO)
{
	npc		= Mod_783_BAU_Elena_NW;
	nr		= 1;
	condition	= Info_Mod_Elena_Hexenparty_03_Condition;
	information	= Info_Mod_Elena_Hexenparty_03_Info;
	permanent	= 0;
	important	= 0;
	description	= "I've been using the scroll.";
};

FUNC INT Info_Mod_Elena_Hexenparty_03_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Elena_Hexenparty_02))
	&& (Mod_WM_HexenHagel > 0)
	&& (Mod_TrfWoman == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Elena_Hexenparty_03_Info()
{
	AI_Output(hero, hero, "Info_Mod_Elena_Hexenparty_03_15_00"); //I've been using the scroll.

	if (Mod_WM_HexenHagel == 1)
	{
		AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_03_12_01"); //Excellent. This has again caused a magical restlessness on the farm.

		B_GivePlayerXP	(250);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_03_12_02"); //But without the desired effect. Very disappointing, my sister.
		AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_03_12_03"); //If you allow yourself to make more mistakes of this kind, we will have to punish you for your inability at some point.
	};

	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_03_12_04"); //So before we admit you to our sisterhood, you must learn the power of those spells that affect their victims.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_03_12_05"); //Take this role of influence, apply it and then speak to Torlof.

	B_GiveInvItems	(self, hero, ItSc_Beeinflussung, 1);

	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_03_12_06"); //Get him to behave impossible in front of the other mercenaries.

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Now I'm supposed to get Torlof to do impossible things with the role of influencing.");
};

INSTANCE Info_Mod_Elena_Hexenparty_04 (C_INFO)
{
	npc		= Mod_783_BAU_Elena_NW;
	nr		= 1;
	condition	= Info_Mod_Elena_Hexenparty_04_Condition;
	information	= Info_Mod_Elena_Hexenparty_04_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Elena_Hexenparty_04_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Elena_Hexenparty_03))
	&& (Npc_KnowsInfo(hero, Info_Mod_Torlof_Hexen))
	&& (Mod_TrfWoman == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Elena_Hexenparty_04_Info()
{
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_04_12_00"); //You did a great job. Any one of us would have done the honors. What fun!
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_04_12_01"); //In doing so, you have damaged the morale of the mercenaries and given a worthy testimony of your magical arts as well as your cunning mind.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_04_12_02"); //Now you're ready to become one of us. Come to our hiding place at night.

	B_GivePlayerXP	(250);

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Ververse. My sisters.... uh, the witches actually want to take me into their community. I'm supposed to go to the cave at night.");
};

INSTANCE Info_Mod_Elena_Hexenparty_05 (C_INFO)
{
	npc		= Mod_783_BAU_Elena_NW;
	nr		= 1;
	condition	= Info_Mod_Elena_Hexenparty_05_Condition;
	information	= Info_Mod_Elena_Hexenparty_05_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Elena_Hexenparty_05_Condition()
{
	if (Mod_TrfWoman == 1)
	&& (Npc_GetDistToWP(hero, "NW_BIGFARM_FOREST_08") < 1000)
	&& (Npc_KnowsInfo(hero, Info_Mod_Elena_Hexenparty_04))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Elena_Hexenparty_05_Info()
{
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_05_12_00"); //There you go, sisters. Now we have gathered here to give her demonic consecration to a new candidate.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_05_12_01"); //(to the hero) Yes, my sister, completely new doors will now open to you, the power to influence and devastate your surroundings.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_05_12_02"); //Without a doubt, you have already noticed the monsters that have sprung up in the surroundings. They are largely under our control.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_05_12_03"); //Our blood cult allies may have absorbed the power to create them. Without our influence, however, they could never keep these creatures under such control.
	
	Info_ClearChoices	(Info_Mod_Elena_Hexenparty_05);

	Info_AddChoice	(Info_Mod_Elena_Hexenparty_05, "Let's start the ritual.", Info_Mod_Elena_Hexenparty_05_B);
	Info_AddChoice	(Info_Mod_Elena_Hexenparty_05, "Blood cult?", Info_Mod_Elena_Hexenparty_05_A);
};

FUNC VOID Info_Mod_Elena_Hexenparty_05_C()
{
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_05_C_12_00"); //Sisters, let us now fall into meditation, gather our strength to welcome a new member into our community and give him the part of demonic power he deserves.
	
	Info_ClearChoices	(Info_Mod_Elena_Hexenparty_05);

	AI_StopProcessInfos	(self);

	Mod_WM_Hexenritual = 1;
};

FUNC VOID Info_Mod_Elena_Hexenparty_05_B()
{
	AI_Output(hero, self, "Info_Mod_Elena_Hexenparty_05_B_15_00"); //Let's start the ritual.
	
	Info_Mod_Elena_Hexenparty_05_C();
};

FUNC VOID Info_Mod_Elena_Hexenparty_05_A()
{
	AI_Output(hero, self, "Info_Mod_Elena_Hexenparty_05_A_15_00"); //Blood cult?
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_05_A_12_01"); //An ancient brotherhood. One of their clans contacted us some time ago and made the alliance with us, so that we could join forces and throw everything into chaos.
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_05_A_12_02"); //They have their refuge near the willow plateau.

	if (Npc_KnowsInfo(hero, Info_Mod_AttraktiveFrau_Sex))
	{
		AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_05_A_12_03"); //Yes, the tavern near the pasture plateau.... I sucked up the delicious life force of a man of a special kind.
		AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_05_A_12_04"); //Anyway, let's start the ritual.
	};

	Mod_WM_Blutkultinfos = 1;
	
	Info_Mod_Elena_Hexenparty_05_C();
};

INSTANCE Info_Mod_Elena_Hexenparty_06 (C_INFO)
{
	npc		= Mod_783_BAU_Elena_NW;
	nr		= 1;
	condition	= Info_Mod_Elena_Hexenparty_06_Condition;
	information	= Info_Mod_Elena_Hexenparty_06_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Elena_Hexenparty_06_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Elena_Hexenparty_05))
	&& (Mod_WM_Hexenritual == 2)
	&& (Mod_TrfWoman == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Elena_Hexenparty_06_Info()
{
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_06_12_00"); //What, how...? Sisters, we've been set up.

	Mod_HexenAttack = 1;

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Elena_Hexenparty_10 (C_INFO)
{
	npc		= Mod_783_BAU_Elena_NW;
	nr		= 1;
	condition	= Info_Mod_Elena_Hexenparty_10_Condition;
	information	= Info_Mod_Elena_Hexenparty_10_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Elena_Hexenparty_10_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Elena_Hexenparty_01))
	&& (Mod_WM_HexenVerwandlung < 2)
	&& (Mod_WM_IsWarg == 0)
	&& (Npc_RefuseTalk(self) == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Elena_Hexenparty_10_Info()
{
	AI_Output(self, hero, "Info_Mod_Elena_Hexenparty_10_12_00"); //What are you doing? Take your animal form again and do as you are told.

	AI_StopProcessInfos	(self);

	Npc_SetRefuseTalk (self, 10);
};

INSTANCE Info_Mod_Elena_Trade (C_INFO)
{
	npc		= Mod_783_BAU_Elena_NW;
	nr		= 1;
	condition	= Info_Mod_Elena_Trade_Condition;
	information	= Info_Mod_Elena_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Elena_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Elena_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Elena_Trade_Info()
{
	B_GiveTradeInv	(self);
	B_Say	(hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Elena_Pickpocket (C_INFO)
{
	npc		= Mod_783_BAU_Elena_NW;
	nr		= 1;
	condition	= Info_Mod_Elena_Pickpocket_Condition;
	information	= Info_Mod_Elena_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60_Female;
};

FUNC INT Info_Mod_Elena_Pickpocket_Condition()
{
	C_Beklauen	(34, ItFo_Apple, 2);
};

FUNC VOID Info_Mod_Elena_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Elena_Pickpocket);

	Info_AddChoice	(Info_Mod_Elena_Pickpocket, DIALOG_BACK, Info_Mod_Elena_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Elena_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Elena_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Elena_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Elena_Pickpocket);
};

FUNC VOID Info_Mod_Elena_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Elena_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Elena_Pickpocket);

		Info_AddChoice	(Info_Mod_Elena_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Elena_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Elena_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Elena_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Elena_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Elena_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Elena_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Elena_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Elena_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Elena_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Elena_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Elena_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Elena_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Elena_EXIT (C_INFO)
{
	npc		= Mod_783_BAU_Elena_NW;
	nr		= 1;
	condition	= Info_Mod_Elena_EXIT_Condition;
	information	= Info_Mod_Elena_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Elena_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Elena_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
