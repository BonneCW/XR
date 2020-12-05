INSTANCE Info_Mod_Ramirez_REL_InHaus (C_INFO)
{
	npc		= Mod_7708_OUT_Ramirez_REL;
	nr		= 1;
	condition	= Info_Mod_Ramirez_REL_InHaus_Condition;
	information	= Info_Mod_Ramirez_REL_InHaus_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ramirez_REL_InHaus_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jesper_REL_InHaus))
	&& (Wld_GetDay() > Mod_Dieb_Haus_Day)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ramirez_REL_InHaus_Info()
{
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_InHaus_03_00"); //That's what I call a comfortable home, isn't it?
	AI_Output(hero, self, "Info_Mod_Ramirez_REL_InHaus_15_01"); //Looks okay.
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_InHaus_03_02"); //That's what I mean. Hmm, what's missing is the right food.
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_InHaus_03_03"); //I hope that Attila will soon return from his exploration... I can hear him coming down the stairs.

	AI_StopProcessInfos	(self);

	Wld_InsertNpc	(Mod_7709_OUT_Attila_REL, "REL_CITY_053");

	Mod_RemoveAttilaFromKhorinis = TRUE;
};

INSTANCE Info_Mod_Ramirez_REL_Lagerhaus (C_INFO)
{
	npc		= Mod_7708_OUT_Ramirez_REL;
	nr		= 1;
	condition	= Info_Mod_Ramirez_REL_Lagerhaus_Condition;
	information	= Info_Mod_Ramirez_REL_Lagerhaus_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ramirez_REL_Lagerhaus_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Attila_REL_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ramirez_REL_Lagerhaus_Info()
{
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Lagerhaus_03_00"); //Well done. I'm sure that should make sense of that.
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Lagerhaus_03_01"); //(to the hero) How about you go there and try to take a full sack with you from the camp.
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Lagerhaus_03_02"); //Make sure the guards don't catch you doing it.
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Lagerhaus_03_03"); //Maybe you'll have to hide in the camp until they're finally gone by night.
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Lagerhaus_03_04"); //You'll think of something.

	Log_CreateTopic	(TOPIC_MOD_DIEB_LAGERHAUS, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_DIEB_LAGERHAUS, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_DIEB_LAGERHAUS, "In Khorata, supplies are stored in a warehouse every day from morning to night. I'm supposed to try and nail a big bag full of it. I just have to make sure the two guards don't catch me. Maybe I have a chance as soon as they leave the camp at night...");

	Wld_InsertItem	(ItMi_Fresssack, "FP_ITEM_JIM_DROGEN");
	Wld_InsertItem	(ItMi_Kiste, "FP_ITEM_LAGERKISTE");
};

INSTANCE Info_Mod_Ramirez_REL_Lagerhaus2 (C_INFO)
{
	npc		= Mod_7708_OUT_Ramirez_REL;
	nr		= 1;
	condition	= Info_Mod_Ramirez_REL_Lagerhaus2_Condition;
	information	= Info_Mod_Ramirez_REL_Lagerhaus2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ramirez_REL_Lagerhaus2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ramirez_REL_Lagerhaus))
	&& (Npc_HasItems(hero, ItMi_Fresssack) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ramirez_REL_Lagerhaus2_Info()
{
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Lagerhaus2_03_00"); //What's this? I smell ham, cheese, bread...
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Lagerhaus2_03_01"); //Ahh, very nice, you were in the camp, I see.
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Lagerhaus2_03_02"); //And I was afraid I'd have to go to the market to buy something.

	B_GiveInvItems	(hero, self, ItMi_Fresssack, 1);

	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Lagerhaus2_03_03"); //Let me see... at least for the next four weeks. Good work.
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Lagerhaus2_03_04"); //Here's some gold... and some food out of the bag.

	CreateInvItems	(hero, ItMi_Gold, 150);
	CreateInvItems	(hero, ItFo_Bacon, 1);
	CreateInvItems	(hero, ItFo_Cheese, 3);
	CreateInvItems	(hero, ItFo_Wine, 2);
	CreateInvItems	(hero, ItFo_Beer, 3);
	CreateInvItems	(hero, ItFo_Apple, 5);
	CreateInvItems	(hero, ItFo_Bread, 2);

	B_ShowGivenThings	("150 gold, 1 ham, 3 cheese, 2 wine, 3 beer, 5 apples and 2 breads preserved.");

	B_GivePlayerXP	(400);

	B_SetTopicStatus	(TOPIC_MOD_DIEB_LAGERHAUS, LOG_SUCCESS);

	Mod_Dieb_Haus_Day = Wld_GetDay();
};

INSTANCE Info_Mod_Ramirez_REL_Glorie (C_INFO)
{
	npc		= Mod_7708_OUT_Ramirez_REL;
	nr		= 1;
	condition	= Info_Mod_Ramirez_REL_Glorie_Condition;
	information	= Info_Mod_Ramirez_REL_Glorie_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ramirez_REL_Glorie_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cassia_REL_Glorie))
	&& (Wld_GetDay() > Mod_Dieb_Haus_Day)
	&& (Wld_IsTime(09,00,11,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ramirez_REL_Glorie_Info()
{
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Glorie_03_00"); //Ahh, there you are. So we're good to go. Follow me. Follow me.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOSCHNEIDER");
};

INSTANCE Info_Mod_Ramirez_REL_Glorie2 (C_INFO)
{
	npc		= Mod_7708_OUT_Ramirez_REL;
	nr		= 1;
	condition	= Info_Mod_Ramirez_REL_Glorie2_Condition;
	information	= Info_Mod_Ramirez_REL_Glorie2_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Ramirez_REL_Glorie2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cassia_REL_Glorie))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Ramirez_REL_Glorie))
	&& (Wld_GetDay() > Mod_Dieb_Haus_Day)
	&& (Wld_IsTime(11,00,24,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ramirez_REL_Glorie2_Info()
{
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Glorie2_03_00"); //You're much too late. It's not worth it to start now.
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Glorie2_03_01"); //We have to postpone it until tomorrow.... you asshole.

	Mod_Dieb_Haus_Day = Wld_GetDay();

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Ramirez_REL_Glorie3 (C_INFO)
{
	npc		= Mod_7708_OUT_Ramirez_REL;
	nr		= 1;
	condition	= Info_Mod_Ramirez_REL_Glorie3_Condition;
	information	= Info_Mod_Ramirez_REL_Glorie3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ramirez_REL_Glorie3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ramirez_REL_Glorie))
	&& (Npc_GetDistToWP(self, "REL_CITY_233") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ramirez_REL_Glorie3_Info()
{
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Glorie3_03_00"); //All right, then. What comes now is for the sole purpose of the mission.
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Glorie3_03_01"); //As soon as I get him interested, you should be able to grab that dress.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SCHNEIDER");
	B_StartOtherRoutine	(Mod_7535_OUT_Schneider_REL, "ABGELENKT");
	B_StartOtherRoutine	(Mod_7705_OUT_Cassia_REL, "VORSCHNEIDER");
	B_StartOtherRoutine	(Mod_7704_OUT_Jesper_REL, "ATBIB");

	Wld_InsertItem	(ItAr_GelehrterNeu, "FP_ITEM_GELEHRTENKLEIDUNG");
};

INSTANCE Info_Mod_Ramirez_REL_Glorie4 (C_INFO)
{
	npc		= Mod_7708_OUT_Ramirez_REL;
	nr		= 1;
	condition	= Info_Mod_Ramirez_REL_Glorie4_Condition;
	information	= Info_Mod_Ramirez_REL_Glorie4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ramirez_REL_Glorie4_Condition()
{
	if (Mod_Diebe_Brunnen == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ramirez_REL_Glorie4_Info()
{
	if (Mod_Diebe_WandGehackt == 0)
	{
		AI_Output(self, hero, "Info_Mod_Ramirez_REL_Glorie4_03_00"); //Here you are at last. While you were in bed with your ass, we broke through the wall and uncovered a tunnel.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Ramirez_REL_Glorie4_03_01"); //Great, we're through. Good job, guys. Looks like it's really moving on.
	};

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Ramirez_REL_Glorie5 (C_INFO)
{
	npc		= Mod_7708_OUT_Ramirez_REL;
	nr		= 1;
	condition	= Info_Mod_Ramirez_REL_Glorie5_Condition;
	information	= Info_Mod_Ramirez_REL_Glorie5_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ramirez_REL_Glorie5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Attila_REL_Glorie5))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ramirez_REL_Glorie5_Info()
{
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Glorie5_03_00"); //All right... the three pounds of gold in my pockets are enough for now.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "INHAUS");
	B_StartOtherRoutine	(Mod_7709_OUT_Attila_REL, "INHAUS");
	B_StartOtherRoutine	(Mod_7705_OUT_Cassia_REL, "INHAUS");
	B_StartOtherRoutine	(Mod_7704_OUT_Jesper_REL, "GELEHRTER");
};

INSTANCE Info_Mod_Ramirez_REL_EXIT (C_INFO)
{
	npc		= Mod_7708_OUT_Ramirez_REL;
	nr		= 1;
	condition	= Info_Mod_Ramirez_REL_EXIT_Condition;
	information	= Info_Mod_Ramirez_REL_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Ramirez_REL_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ramirez_REL_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
