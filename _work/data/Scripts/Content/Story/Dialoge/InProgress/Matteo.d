INSTANCE Info_Mod_Matteo_Hi (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_Hi_Condition;
	information	= Info_Mod_Matteo_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Matteo_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Matteo_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Matteo_Hi_23_00"); //A customer, a customer! Enter, stranger, and rummage in my exquisite merchandise!
	AI_Output(hero, self, "Info_Mod_Matteo_Hi_15_01"); //No prejudices against a former convict?
	AI_Output(self, hero, "Info_Mod_Matteo_Hi_23_02"); //No way! All customers! Interested paying customers!

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Matteo sells food.");
};

INSTANCE Info_Mod_Matteo_Angebot_Kissen (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_Angebot_Kissen_Condition;
	information	= Info_Mod_Matteo_Angebot_Kissen_Info;
	permanent	= 0;
	important	= 0;
	description	= "I'm looking for something soft for the head.";
};

FUNC INT Info_Mod_Matteo_Angebot_Kissen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Malik_Aufgabe))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Morpheus_Kissen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_Angebot_Kissen_Info()
{
	AI_Output(hero, self, "Info_Mod_Matteo_Angebot_Kissen_15_00"); //I'm looking for something soft for the head.
	AI_Output(self, hero, "Info_Mod_Matteo_Angebot_Kissen_23_01"); //What exactly? Maybe a fur hat? I would have there...
	AI_Output(hero, self, "Info_Mod_Matteo_Angebot_Kissen_15_02"); //No, no, no. What, to put your head on it while sleeping.
	AI_Output(self, hero, "Info_Mod_Matteo_Angebot_Kissen_23_03"); //Uh-huh. And what is that supposed to be?
	AI_Output(hero, self, "Info_Mod_Matteo_Angebot_Kissen_15_04"); //If I only knew. Maybe a sack of dry grass in it.
	AI_Output(self, hero, "Info_Mod_Matteo_Angebot_Kissen_23_05"); //I don't have that. Maybe the peasants...
	AI_Output(hero, self, "Info_Mod_Matteo_Angebot_Kissen_15_06"); //Thanks anyway. I'll keep looking.

	B_LogEntry	(TOPIC_MOD_ASS_KISSEN, "Matteo couldn't help me.");
};

INSTANCE Info_Mod_Matteo_ThorbenLehrling (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_ThorbenLehrling_Condition;
	information	= Info_Mod_Matteo_ThorbenLehrling_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Matteo_ThorbenLehrling_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_LehrlingQuest5))
	&& (Wld_IsTime(10,00,10,30))
	&& (Npc_HasItems(hero, ItMi_MatteoFesttisch) == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_ThorbenLehrling_Info()
{
	AI_Output(self, hero, "Info_Mod_Matteo_ThorbenLehrling_23_00"); //Oh, hello. Do you know where Thorben is?
	AI_Output(hero, self, "Info_Mod_Matteo_ThorbenLehrling_15_01"); //I'm his replacement. You want to pick up your tables?
	AI_Output(self, hero, "Info_Mod_Matteo_ThorbenLehrling_23_02"); //Right, right, right. Thorben and I had negotiated a price of 100 gold coins.

	Info_ClearChoices	(Info_Mod_Matteo_ThorbenLehrling);

	Info_AddChoice	(Info_Mod_Matteo_ThorbenLehrling, "I've heard of a very different price.", Info_Mod_Matteo_ThorbenLehrling_B);
	Info_AddChoice	(Info_Mod_Matteo_ThorbenLehrling, "Here are the tables.", Info_Mod_Matteo_ThorbenLehrling_A);
};

FUNC VOID Info_Mod_Matteo_ThorbenLehrling_B()
{
	AI_Output(hero, self, "Info_Mod_Matteo_ThorbenLehrling_B_15_00"); //I've heard of a very different price.
	AI_Output(self, hero, "Info_Mod_Matteo_ThorbenLehrling_B_23_01"); //I see you can't be deceived that easily. All right, here's the 150 gold coins.

	Info_ClearChoices	(Info_Mod_Matteo_ThorbenLehrling);

	if (Mod_Verhandlungsgeschick > 0)
	{
		Info_AddChoice	(Info_Mod_Matteo_ThorbenLehrling, "Another little bonus for the seriously ill master?", Info_Mod_Matteo_ThorbenLehrling_D);
	};

	Info_AddChoice	(Info_Mod_Matteo_ThorbenLehrling, "It's a deal.", Info_Mod_Matteo_ThorbenLehrling_C);
};

FUNC VOID Info_Mod_Matteo_ThorbenLehrling_A()
{
	AI_Output(hero, self, "Info_Mod_Matteo_ThorbenLehrling_A_15_00"); //Here are the tables.

	B_GiveInvItems	(hero, self, ItMi_MatteoFesttisch, 2);

	Npc_RemoveInvItems	(self, ItMi_MatteoFesttisch, 2);

	AI_Output(self, hero, "Info_Mod_Matteo_ThorbenLehrling_A_23_01"); //Well, that's what I call fast service. Have a wonderful day!

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	B_GivePlayerXP	(50);

	Info_ClearChoices	(Info_Mod_Matteo_ThorbenLehrling);
};

FUNC VOID Info_Mod_Matteo_ThorbenLehrling_D()
{
	AI_Output(hero, self, "Info_Mod_Matteo_ThorbenLehrling_D_15_00"); //Another little bonus for the seriously ill master?

	if (self.aivar[AIV_Verhandlung] == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_Matteo_ThorbenLehrling_D_23_01"); //Why not? I'm in a donor mood today anyway. Here you go, and have a nice day.

		Npc_RemoveInvItems	(hero, ItMi_MatteoFesttisch, 2);

		CreateInvItems	(hero, ItMi_Gold, 250);

		B_GivePlayerXP	(150);

		B_RaiseHandelsgeschick (2);

		Info_ClearChoices	(Info_Mod_Matteo_ThorbenLehrling);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Matteo_ThorbenLehrling_D_23_02"); //I've been in business too long to fall for that number.

		Info_ClearChoices	(Info_Mod_Matteo_ThorbenLehrling);

		Info_AddChoice	(Info_Mod_Matteo_ThorbenLehrling, "It's a deal.", Info_Mod_Matteo_ThorbenLehrling_C);
	};
};

FUNC VOID Info_Mod_Matteo_ThorbenLehrling_C()
{
	AI_Output(hero, self, "Info_Mod_Matteo_ThorbenLehrling_C_15_00"); //Deal.

	B_GiveInvItems	(hero, self, ItMi_MatteoFesttisch, 2);

	Npc_RemoveInvItems	(self, ItMi_MatteoFesttisch, 2);

	AI_Output(self, hero, "Info_Mod_Matteo_ThorbenLehrling_C_23_01"); //Good, good, that settles it. Say hello to Thorben for me!

	B_GiveInvItems	(self, hero, ItMi_Gold, 150);

	B_GivePlayerXP	(100);

	Info_ClearChoices	(Info_Mod_Matteo_ThorbenLehrling);
};

INSTANCE Info_Mod_Matteo_OberesViertel (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_OberesViertel_Condition;
	information	= Info_Mod_Matteo_OberesViertel_Info;
	permanent	= 0;
	important	= 0;
	description	= "I want to go to the upper quarter.";
};

FUNC INT Info_Mod_Matteo_OberesViertel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_OberesViertel_Info()
{
	AI_Output(hero, self, "Info_Mod_Matteo_OberesViertel_15_00"); //I want to go to the upper quarter.
	AI_Output(self, hero, "Info_Mod_Matteo_OberesViertel_23_01"); //No problem! Wait, maybe I will. Oh, no, we'll figure it out!
	AI_Output(hero, self, "Info_Mod_Matteo_OberesViertel_15_02"); //What's this about?
	AI_Output(self, hero, "Info_Mod_Matteo_OberesViertel_23_03"); //To enter the Upper Quarter, you must either be a citizen of the city or join the militia. (hasty) Which I would advise against.
	AI_Output(self, hero, "Info_Mod_Matteo_OberesViertel_23_04"); //The simplest way to achieve civic status is to be accepted as an apprentice by one of the masters.
	AI_Output(self, hero, "Info_Mod_Matteo_OberesViertel_23_05"); //Preferably with me, I urgently need an apprentice!
	AI_Output(self, hero, "Info_Mod_Matteo_OberesViertel_23_06"); //But before I can hire you, I need the approval of all the other master craftsmen: Bosper, Thorben, Harad and Constantino.
	AI_Output(self, hero, "Info_Mod_Matteo_OberesViertel_23_07"); //So it will be your job to convince them!

	Log_CreateTopic	(TOPIC_MOD_BÜRGER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BÜRGER, LOG_RUNNING);
	B_LogEntry_More	(TOPIC_MOD_OBERESVIERTEL, TOPIC_MOD_BÜRGER, "To get to the upper district, I have to be a citizen of the city or a member of the militia.", "To become a citizen of the city, I have to be the apprentice of one of the five masters.");
};

INSTANCE Info_Mod_Matteo_Miliz (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_Miliz_Condition;
	information	= Info_Mod_Matteo_Miliz_Info;
	permanent	= 0;
	important	= 0;
	description	= "What do I have to do to join the militia?";
};

FUNC INT Info_Mod_Matteo_Miliz_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_OberesViertel))
	&& (Mod_Gilde == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_Miliz_Info()
{
	AI_Output(hero, self, "Info_Mod_Matteo_Miliz_15_00"); //What do I have to do to join the militia?
	AI_Output(self, hero, "Info_Mod_Matteo_Miliz_23_01"); //If you want to join the militia, you should go to Lord Andre.
	AI_Output(self, hero, "Info_Mod_Matteo_Miliz_23_02"); //He decides who will be admitted to the militia.
};

INSTANCE Info_Mod_Matteo_Andre (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_Andre_Condition;
	information	= Info_Mod_Matteo_Andre_Info;
	permanent	= 0;
	important	= 0;
	description	= "Where can I find Lord Andre?";
};

FUNC INT Info_Mod_Matteo_Andre_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Miliz))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_Andre_Info()
{
	AI_Output(hero, self, "Info_Mod_Matteo_Andre_15_00"); //Where can I find Lord Andre?
	AI_Output(self, hero, "Info_Mod_Matteo_Andre_23_01"); //In the barracks near the other gate.
	AI_Output(self, hero, "Info_Mod_Matteo_Andre_23_02"); //A great man - and a good friend of mine!
};

INSTANCE Info_Mod_Matteo_Auftrag_2 (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_Auftrag_2_Condition;
	information	= Info_Mod_Matteo_Auftrag_2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Do you have a job for me?";
};

FUNC INT Info_Mod_Matteo_Auftrag_2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_OberesViertel))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_Auftrag_2_Info()
{
	AI_Output(hero, self, "Info_Mod_Matteo_Auftrag_2_15_00"); //Do you have a job for me?
	AI_Output(self, hero, "Info_Mod_Matteo_Auftrag_2_23_01"); //If you ask: yes!
	AI_Output(self, hero, "Info_Mod_Matteo_Auftrag_2_23_02"); //You have to know, I'm overjoyed right now and have to take care of certain preparations.
	AI_Output(self, hero, "Info_Mod_Matteo_Auftrag_2_23_03"); //There's not much time left to promote my business. So you'll take on that task!
	
	B_GiveInvItems	(self, hero, MatteoFlugblaetter, 20);

	AI_Output(self, hero, "Info_Mod_Matteo_Auftrag_2_23_04"); //Distribute the leaflets among the citizens of this city, and you can also inform the herald. He's got no sense in yakking anyway!

	Log_CreateTopic	(TOPIC_MOD_MATTEOFLUGBLATT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_MATTEOFLUGBLATT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_MATTEOFLUGBLATT, "To get Matteo's voice, I'm supposed to hand out leaflets for him.");
};

INSTANCE Info_Mod_Matteo_WieLehrling (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_WieLehrling_Condition;
	information	= Info_Mod_Matteo_WieLehrling_Info;
	permanent	= 0;
	important	= 0;
	description	= "Can I become an apprentice of another master?";
};

FUNC INT Info_Mod_Matteo_WieLehrling_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_OberesViertel))
	{
		return 1;	
	};
};

FUNC VOID Info_Mod_Matteo_WieLehrling_Info()
{
	AI_Output(hero, self, "Info_Mod_Matteo_WieLehrling_15_00"); //Can I become an apprentice of another master?
	AI_Output(self, hero, "Info_Mod_Matteo_WieLehrling_23_01"); //(pressing around) Well, they don't need any!
	AI_Output(self, hero, "Info_Mod_Matteo_WieLehrling_23_02"); //Harad and Thorben already have some, Constantino would prefer to rot in his house alone, and Bosper.... won't be good to talk about you.
	AI_Output(self, hero, "Info_Mod_Matteo_WieLehrling_23_03"); //Believe me, you're in good hands with me!
	AI_Output(hero, self, "Info_Mod_Matteo_WieLehrling_15_04"); //But is it possible?
	AI_Output(self, hero, "Info_Mod_Matteo_WieLehrling_23_05"); //Theoretically, yes. But certainly not useful.
};

INSTANCE Info_Mod_Matteo_Flugblaetter (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_Flugblaetter_Condition;
	information	= Info_Mod_Matteo_Flugblaetter_Info;
	permanent	= 0;
	important	= 0;
	description	= "I handed out the flyers.";
};

FUNC INT Info_Mod_Matteo_Flugblaetter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Auftrag_2))
	&& (Mod_Flugblaetter == 20)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_Flugblaetter_Info()
{
	AI_Output(hero, self, "Info_Mod_Matteo_Flugblaetter_15_00"); //I handed out the flyers.
	AI_Output(self, hero, "Info_Mod_Matteo_Flugblaetter_23_01"); //I noticed, the place was packed today.
	AI_Output(self, hero, "Info_Mod_Matteo_Flugblaetter_23_02"); //I love to watch people looking at and weighing up my food.
	AI_Output(self, hero, "Info_Mod_Matteo_Flugblaetter_23_03"); //With that, you have fulfilled my part of the condition. Come back when you have the consent of all the masters.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	B_LogEntry	(TOPIC_MOD_MATTEOFLUGBLATT, "Matteo was very satisfied with my work. He'll give me his vote.");
	B_SetTopicStatus	(TOPIC_MOD_MATTEOFLUGBLATT, LOG_SUCCESS);

	B_GivePlayerXP	(200);

	Mod_LehrlingsStimmen += 1;

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Matteo_Aufnahme (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_Aufnahme_Condition;
	information	= Info_Mod_Matteo_Aufnahme_Info;
	permanent	= 0;
	important	= 0;
	description	= "I'm ready to be an apprentice.";
};

FUNC INT Info_Mod_Matteo_Aufnahme_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Flugblaetter))
	&& (Mod_IstLehrling == 0)
	&& (Mod_LehrlingsStimmen == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_Aufnahme_Info()
{
	AI_Output(hero, self, "Info_Mod_Matteo_Aufnahme_15_00"); //I'm ready to be an apprentice.
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_23_01"); //Glad to welcome you?

	Info_ClearChoices	(Info_Mod_Matteo_Aufnahme);

	Info_AddChoice	(Info_Mod_Matteo_Aufnahme, "No, I chose another master.", Info_Mod_Matteo_Aufnahme_B);
	Info_AddChoice	(Info_Mod_Matteo_Aufnahme, "Yeah, I'll be your apprentice.", Info_Mod_Matteo_Aufnahme_A);
};

FUNC VOID Info_Mod_Matteo_Aufnahme_B()
{
	AI_Output(hero, self, "Info_Mod_Matteo_Aufnahme_B_15_00"); //No, I chose another master.
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_B_23_01"); //(insulted) That's my gratitude for coming?
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_B_23_02"); //No - don't say anything. I don't want to hear it!
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_B_23_03"); //Just make sure you get out and don't come back!

	Info_ClearChoices	(Info_Mod_Matteo_Aufnahme);
};

FUNC VOID Info_Mod_Matteo_Aufnahme_A()
{
	AI_Output(hero, self, "Info_Mod_Matteo_Aufnahme_A_15_00"); //Yeah, I'll be your apprentice.
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_A_23_01"); //And that's not to your disadvantage!
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_A_23_02"); //I want to tell you everything you need to know as a future merchant.

	CreateInvItems	(hero, ItAr_Vlk_H, 1);

	B_ShowGivenThings	("receive civilian clothes");

	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_A_23_03"); //Let's divide the lessons into theoretical and practical parts.
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_A_23_04"); //In the practical ones, you will give me a hand and learn that the job is not just for pleasure.
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_A_23_05"); //In addition, you will now of course be granted citizenship - that's what you wanted?
	AI_Output(hero, self, "Info_Mod_Matteo_Aufnahme_A_15_06"); //Can't hurt, anyway.
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_A_23_07"); //Fine, fine, fine. Then we start right here and now with our first lesson:
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_A_23_08"); //I'm sure you'll wonder why my fruit always looks so fresh and well-rounded.
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_A_23_09"); //Of course, not all my deliveries look so appetizing - unfortunately!
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_A_23_10"); //That's why the cunning retailer uses a trick: the damaged goods are simply not presented openly!
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_A_23_11"); //For example, in front of me on the table - take away the top layer of mushrooms and you wouldn't touch the one underneath with your sharp fingers.
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_A_23_12"); //Nevertheless, they are purchased because many customers do not look closely enough. That is our advantage!
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_A_23_13"); //What do we learn from this? Presentation is everything! So make sure that your business looks neat and tidy.
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_A_23_14"); //A tip from me: Grease the display surfaces with grease, which makes them shine and look polished in the sunlight.
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_A_23_15"); //It's faster than actually polishing them. (laughs)
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_A_23_16"); //After this introduction I have the first task for you.
	AI_Output(hero, self, "Info_Mod_Matteo_Aufnahme_A_15_17"); //I'm supposed to clean?
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_A_23_18"); //No, no, no, I'll manage on my own. But I got a basket of apples.
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_A_23_19"); //You will sort the apples according to suitability - best in two parts, the fit and the unsuitable.
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_A_23_20"); //You'll find the basket on the table back there. Let me know as soon as you're done.

	Mod_IstLehrling	= 1;

	Mod_LehrlingBei = 3;

	Log_CreateTopic	(TOPIC_MOD_LEHRLING_MATTEO_ONE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_MATTEO_ONE, LOG_RUNNING);

	if (Npc_KnowsInfo(hero, Info_Mod_Torlof_Auftrag))
	{
		B_LogEntry_NMore	(TOPIC_MOD_BÜRGER, TOPIC_MOD_LEHRLING_MATTEO_ONE, TOPIC_MOD_TORLOFSPIONAGE, "Matteo, the merchant, accepted me as his apprentice. That makes me a citizen of the city now.", "The first thing Matteo asked me to do was to sort the basket full of apples according to apples that are not fit for display. I should look at every apple individually.", "Since Matteo accepted me as his apprentice, I am now able to enter the upper quarter.");
	}
	else
	{
		B_LogEntry_More	(TOPIC_MOD_BÜRGER, TOPIC_MOD_LEHRLING_MATTEO_ONE, "Matteo, the merchant, accepted me as his apprentice. That makes me a citizen of the city now.", "The first thing Matteo asked me to do was to sort the basket full of apples according to apples that are not fit for display. I should look at every apple individually.");
	};

	Wld_SendTrigger	("EVT_MATTEO_APFELKORB");

	Wld_AssignRoomToGuild ("matteo",		GIL_NONE);

	B_SetTopicStatus	(TOPIC_MOD_BÜRGER, LOG_SUCCESS);

	CurrentNQ += 1;

	B_RaiseHandelsgeschick	(5);

	Info_ClearChoices	(Info_Mod_Matteo_Aufnahme);
};

INSTANCE Info_Mod_Matteo_GildenZeug (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_GildenZeug_Condition;
	information	= Info_Mod_Matteo_GildenZeug_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Matteo_GildenZeug_Condition()
{
	if (Mod_LehrlingBei == 3)
	&& (hero.guild > GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_GildenZeug_Info()
{
	if (hero.guild == GIL_PAL)
	{
		AI_Output(self, hero, "Info_Mod_Matteo_GildenZeug_23_00"); //Well, look who's gone to the militia.
	}
	else if (hero.guild == GIL_VLK)
	{
		AI_Output(self, hero, "Info_Mod_Matteo_GildenZeug_23_01"); //Guess you've lost your way to the Innos guys, huh? (laughs)
	}
	else if (hero.guild == GIL_NOV)
	{
		AI_Output(self, hero, "Info_Mod_Matteo_GildenZeug_23_02"); //I see you made a good choice with your faction.
	}
	else if (hero.guild == GIL_MIL)
	{
		AI_Output(self, hero, "Info_Mod_Matteo_GildenZeug_23_03"); //You want to be a mercenary? Don't you ever think of mugging my merchandise shipments!
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output(self, hero, "Info_Mod_Matteo_GildenZeug_23_04"); //You worship Beliar? I would have thought you'd be smarter...
	};
};

INSTANCE Info_Mod_Matteo_LehrlingQuest (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_LehrlingQuest_Condition;
	information	= Info_Mod_Matteo_LehrlingQuest_Info;
	permanent	= 0;
	important	= 0;
	description	= "Here are the sorted apples.";
};

FUNC INT Info_Mod_Matteo_LehrlingQuest_Condition()
{
	if (Mod_LehrlingBei == 3)
	&& (Npc_HasItems(hero, ItFo_Apple_Matteo_Gut) == 10)
	&& (Npc_HasItems(hero, ItFo_Apple_Matteo_Schlecht) == 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_LehrlingQuest_Info()
{
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest_15_00"); //Here are the sorted apples.

	Npc_RemoveInvItems	(hero, Itfo_Apple_Matteo_Gut, 10);
	Npc_RemoveInvItems	(hero, Itfo_Apple_Matteo_Schlecht, 10);

	B_ShowGivenThings	("10 crunchy apples and 10 rotten apples given");

	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest_23_01"); //(joyous) That was quick! Let me see... Yes, clean work, I call that! That helps me tremendously!
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest_23_02"); //Come back soon, then we can continue our work!

	B_GivePlayerXP	(100);

	CurrentNQ += 1;

	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_MATTEO_ONE, LOG_SUCCESS);
};

INSTANCE Info_Mod_Matteo_LehrlingQuest2 (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_LehrlingQuest2_Condition;
	information	= Info_Mod_Matteo_LehrlingQuest2_Info;
	permanent	= 0;
	important	= 0;
	description	= "I'm ready for some theory again.";
};

FUNC INT Info_Mod_Matteo_LehrlingQuest2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest))
	&& (Kapitel >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_LehrlingQuest2_Info()
{
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest2_15_00"); //I'm ready for some theory again.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest2_23_01"); //I've got a little time, too. Let me think briefly.... This time it will be about the competition.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest2_23_02"); //As you probably know, there are a lot of dealers in town.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest2_23_03"); //Now one can certainly ask oneself why this diversity exists and why one cannot outdo the other.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest2_23_04"); //The answer is: specialisation.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest2_23_05"); //Each retailer has its own offer, and certain goods are only available at certain retailers.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest2_23_06"); //So each of us has a right to exist.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest2_23_07"); //But there are also other ways to gain competitive advantages:
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest2_23_08"); //For example, you can offer goods of special quality - as I do - or be particularly cheap.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest2_23_09"); //The main thing is that there is demand for it.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest2_23_10"); //You make the customers attentive by advertising. You have already gained your first experiences in this.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest2_23_11"); //Today's practical exercise is supposed to be about, uh, enticing away.
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest2_15_12"); //Get away from your competitors?
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest2_23_13"); //Right! I've come up with something nice.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest2_23_14"); //You remember the apples you sorted last time?
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest2_23_15"); //A lot of them are really useless.
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest2_15_16"); //What am I supposed to do with it?
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest2_23_17"); //I'll give you five of the rotten apples, wait a minute, and you'll put them in their offer to five grocers in khorinis. To each one, fair and just.

	B_GiveInvItems	(self, hero, ItFo_Apple_Matteo_Schlecht, 5);

	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest2_23_18"); //It's best to get them involved in a conversation beforehand, and if they look the other way - whoops - you've prepared their booth.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest2_23_19"); //When someone comes to their booth and sees the apple.... I've already won! (laughs)

	Log_CreateTopic	(TOPIC_MOD_LEHRLING_MATTEO_TWO, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_MATTEO_TWO, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_LEHRLING_MATTEO_TWO, "Matteo gave me five rotten apples to distribute to the grocers in Khorinis. In order not to be discovered, I should involve the dealers in a conversation beforehand.");

	B_RaiseHandelsgeschick	(5);

	Info_ClearChoices	(Info_Mod_Matteo_LehrlingQuest2);

	Info_AddChoice	(Info_Mod_Matteo_LehrlingQuest2, "Is that all right, then?", Info_Mod_Matteo_LehrlingQuest2_B);
	Info_AddChoice	(Info_Mod_Matteo_LehrlingQuest2, "It's done.", Info_Mod_Matteo_LehrlingQuest2_A);
};

FUNC VOID Info_Mod_Matteo_LehrlingQuest2_B()
{
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest2_B_15_00"); //Is that all right, then?
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest2_B_23_01"); //You don't have to worry about that. We've been playing a lot worse tricks on each other.

	Info_ClearChoices	(Info_Mod_Matteo_LehrlingQuest2);
};

FUNC VOID Info_Mod_Matteo_LehrlingQuest2_A()
{
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest2_A_15_00"); //It's done.

	Info_ClearChoices	(Info_Mod_Matteo_LehrlingQuest2);
};

INSTANCE Info_Mod_Matteo_LehrlingQuest3 (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_LehrlingQuest3_Condition;
	information	= Info_Mod_Matteo_LehrlingQuest3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Matteo_LehrlingQuest3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest2))
	&& ((Mod_Baltram_Apfel+Mod_Jora_Apfel+Mod_Rupert_Apfel+Mod_Fenia_Apfel+Mod_Coragon_Apfel) == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_LehrlingQuest3_Info()
{
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest3_23_00"); //My idea is fruitful! Customers pour into my shop like smoke into the lungs of a sectarian spinner.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest3_23_01"); //I must thank you again for your help!
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest3_15_02"); //When do we continue the lessons?
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest3_23_03"); //In the near future, things will probably look bad.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest3_23_04"); //My engagement with Valentine is imminent, and we have... to do something else. If you understand what I mean... (laughs)
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest3_23_05"); //Of course, you are welcome to visit me anyway. I'll let you know when it starts. Have a good time!

	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_MATTEO_TWO, LOG_SUCCESS);

	B_GivePlayerXP	(200);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Matteo_LehrlingQuest4 (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_LehrlingQuest4_Condition;
	information	= Info_Mod_Matteo_LehrlingQuest4_Info;
	permanent	= 0;
	important	= 0;
	description	= "What about another lesson?";
};

FUNC INT Info_Mod_Matteo_LehrlingQuest4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest3))
	&& (Kapitel >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_LehrlingQuest4_Info()
{
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest4_15_00"); //What about another lesson?
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_23_01"); //It's about time, isn't it?
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_23_02"); //But I have to warn you: On the next topic I can only offer you a small practical exercise, there is not much more.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_23_03"); //Today we are talking about pricing policy.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_23_04"); //We distinguish the seller price from the buyer price.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_23_05"); //The seller's price is the price I would like to sell at, so that after deducting all purchase and ancillary costs, I have a decent profit.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_23_06"); //But first of all I have to adjust this price to the competition.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_23_07"); //I can simply sell cheaper or deliberately listen to the price so that the buyers think that I have good quality - which, as you know, is the case with me.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_23_08"); //The buyers are the next factor. I sell my goods directly next to the entrance to the Upper Quarter, so I also have customers from there.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_23_09"); //They're more likely to be willing to pull the trigger than the poor bastards from the docks.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_23_10"); //Last point to watch out for is the surrounding price.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_23_11"); //That means quite simply: if you sell only expensive things, you can raise the price even with the cheap ones.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_23_12"); //On the other hand, offering an expensive product at a lower price is of little use.
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest4_15_13"); //I think I get it.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_23_14"); //Fine! Then I'd like to check with the help of three questions whether you know the matter!
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_23_15"); //Here we go! Who will sell the more expensive bread - Fenia from the harbour quarter or me?

	Info_ClearChoices	(Info_Mod_Matteo_LehrlingQuest4);

	Info_AddChoice	(Info_Mod_Matteo_LehrlingQuest4, "You.", Info_Mod_Matteo_LehrlingQuest4_B);
	Info_AddChoice	(Info_Mod_Matteo_LehrlingQuest4, "Fenia.", Info_Mod_Matteo_LehrlingQuest4_A);
};

FUNC VOID Info_Mod_Matteo_LehrlingQuest4_C()
{
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_C_23_00"); //Next: I sell cheap craftsman accessories and found a gold box.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_C_23_01"); //Will I now sell them above or below the value of my other products?

	Info_ClearChoices	(Info_Mod_Matteo_LehrlingQuest4);

	Info_AddChoice	(Info_Mod_Matteo_LehrlingQuest4, "You're selling the box below its value.", Info_Mod_Matteo_LehrlingQuest4_E);
	Info_AddChoice	(Info_Mod_Matteo_LehrlingQuest4, "You're selling the box above its value.", Info_Mod_Matteo_LehrlingQuest4_D);
};

FUNC VOID Info_Mod_Matteo_LehrlingQuest4_B()
{
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest4_B_15_00"); //You.

	Mod_Matteo_Fragen += 1;

	Info_Mod_Matteo_LehrlingQuest4_C();
};

FUNC VOID Info_Mod_Matteo_LehrlingQuest4_A()
{
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest4_A_15_00"); //Fenia.

	Info_Mod_Matteo_LehrlingQuest4_C();
};

FUNC VOID Info_Mod_Matteo_LehrlingQuest4_F()
{
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_F_23_00"); //And thirdly: I get my goods, add a few gold coins to my purchase price and sell them on.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_F_23_01"); //What was the price I disregarded?

	Info_ClearChoices	(Info_Mod_Matteo_LehrlingQuest4);

	Info_AddChoice	(Info_Mod_Matteo_LehrlingQuest4, "The selling price.", Info_Mod_Matteo_LehrlingQuest4_H);
	Info_AddChoice	(Info_Mod_Matteo_LehrlingQuest4, "The buyer's price.", Info_Mod_Matteo_LehrlingQuest4_G);
};

FUNC VOID Info_Mod_Matteo_LehrlingQuest4_E()
{
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest4_E_15_00"); //You're selling the box below its value.

	Mod_Matteo_Fragen += 1;

	Info_Mod_Matteo_LehrlingQuest4_F();
};

FUNC VOID Info_Mod_Matteo_LehrlingQuest4_D()
{
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest4_D_15_00"); //You're selling the box above its value.

	Info_Mod_Matteo_LehrlingQuest4_F();
};

FUNC VOID Info_Mod_Matteo_LehrlingQuest4_I()
{
	if (Mod_Matteo_Fragen == 0)
	{
		AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_I_23_00"); //What am I gonna tell you about if you don't keep it anyway? Well, that's your problem.
	}
	else if (Mod_Matteo_Fragen == 1)
	{
		AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_I_23_01"); //There's not much stuck with you. Or you don't fit as a merchant. Always a hard work to learn!

		B_GivePlayerXP	(50);
	}
	else if (Mod_Matteo_Fragen == 2)
	{
		AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_I_23_02"); //That sounds like a good idea. Not completely error-free yet, but you can become something else!

		B_GivePlayerXP	(100);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_I_23_03"); //Very good, impeccable performance!

		B_GivePlayerXP	(200);
	};

	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_I_23_04"); //That's it again for this time. Come back soon!

	Info_ClearChoices	(Info_Mod_Matteo_LehrlingQuest4);
};

FUNC VOID Info_Mod_Matteo_LehrlingQuest4_H()
{
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest4_H_15_00"); //The selling price.

	Info_Mod_Matteo_LehrlingQuest4_I();
};

FUNC VOID Info_Mod_Matteo_LehrlingQuest4_G()
{
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest4_G_15_00"); //The buyer's price.

	Mod_Matteo_Fragen += 1;

	Info_Mod_Matteo_LehrlingQuest4_I();
};

INSTANCE Info_Mod_Matteo_LehrlingQuest5 (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_LehrlingQuest5_Condition;
	information	= Info_Mod_Matteo_LehrlingQuest5_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Matteo_LehrlingQuest5_Condition()
{
	if (Mod_LehrlingBei == 3)
	&& (Npc_KnowsInfo(hero, Info_Mod_Moe_Anschlaege))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_LehrlingQuest5_Info()
{
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest5_23_00"); //You, say - those posters of yours...
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest5_15_01"); //... It was a smear campaign.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest5_23_02"); //Well, I'm relieved.
};

INSTANCE Info_Mod_Matteo_LehrlingQuest6 (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_LehrlingQuest6_Condition;
	information	= Info_Mod_Matteo_LehrlingQuest6_Info;
	permanent	= 0;
	important	= 0;
	description	= "Here I am again.";
};

FUNC INT Info_Mod_Matteo_LehrlingQuest6_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest4))
	&& (Kapitel >= 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_LehrlingQuest6_Info()
{
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest6_15_00"); //Here I am again.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest6_23_01"); //And I'm still here, too. (laughs) Didn't you find time for old Matteo on all your hikes?
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest6_15_02"); //Exceptionally.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest6_23_03"); //Well, I'm glad! You're a little celebrity!
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest6_15_04"); //That's life...
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest6_23_05"); //Almost sounds like you're in a hurry. Then I don't want to bother you with today's topic for too long.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest6_23_06"); //Today I'll tell you how to get special goods here in Khorinis.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest6_23_07"); //By this I mean goods that other traders do not get, goods with which I have become so successful.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest6_23_08"); //My secret, so to speak.
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest6_15_09"); //That sounds exciting.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest6_23_10"); //I believe you! One word: Mystery - getting full attention!
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest6_23_11"); //And it's so secret, it doesn't even need to know the City Watch.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest6_23_12"); //The normal exchange of goods is controlled by the paladins.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest6_23_13"); //The two gates of the city offer food, mining products and occasionally handicraft products.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest6_23_14"); //In the city itself, mainly handicrafts are produced, and of course weapons.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest6_23_15"); //Shipments from Myrtana rarely arrive by sea, and if they do, Lord Hagen will immediately bag them.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest6_23_16"); //And then there's the pirates...
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest6_15_17"); //I understand.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest6_23_18"); //Isn't it? Jharkendar offers an abundance of exotic products, and the grog of pirates is not to be disdained either!
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest6_23_19"); //The transshipment point is a beach north of Khorinis. I meet them there every week and buy their property.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest6_23_20"); //Just today I'd have to see them again.
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest6_15_21"); //Work for me.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest6_23_22"); //Hehe, you saw it. You can then try out your trading skills on them right away, tough negotiating partners.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest6_23_23"); //Here's 300 gold coins for two crates of grog. Anything you can negotiate lower is yours.

	B_GiveInvItems	(self, hero, ItMi_Gold, 300);

	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest6_15_24"); //I'll be on my way, then.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest6_23_25"); //Do that. Good luck!

	Log_CreateTopic	(TOPIC_MOD_LEHRLING_MATTEO_THREE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_MATTEO_THREE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_LEHRLING_MATTEO_THREE, "I'm supposed to have two boxes of grog delivered to the pirates on the beach north of Khorinis and me. Since I only received 300 gold coins from Matteo, I should try to push the price.");

	B_RaiseHandelsgeschick	(5);

	Wld_InsertNpc	(Mod_7585_PIR_PIRAT_NW,	"NW_CITY_PIRATESCAMP_03");
};

INSTANCE Info_Mod_Matteo_LehrlingQuest7 (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_LehrlingQuest7_Condition;
	information	= Info_Mod_Matteo_LehrlingQuest7_Info;
	permanent	= 0;
	important	= 0;
	description	= "Here you go, two boxes of grog.";
};

FUNC INT Info_Mod_Matteo_LehrlingQuest7_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Pirat_Hi))
	&& (Npc_HasItems(hero, ItMi_GrogPaket_Matteo) == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_LehrlingQuest7_Info()
{
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest7_15_00"); //Here you go, two boxes of grog.

	B_GiveInvItems	(hero, self, ItMi_GrogPaket_Matteo, 2);

	Npc_RemoveInvItems	(self, ItMi_GrogPaket_Matteo, 2);

	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest7_23_01"); //Thanks, man. Frankly, I don't like the pirate socks. But the grog sells well!
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest7_23_02"); //That concludes your apprenticeship with me. I've told you everything you need to know to survive as a merchant.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest7_23_03"); //And you did a good job of helping me out. I don't want to leave that entirely unrewarded.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest7_23_04"); //I want you to have that shiny ring. He's gonna impress your negotiators!

	B_GiveInvItems	(self, hero, ItRi_Verhandlungsring, 1);

	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest7_15_05"); //Thank you very much.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest7_23_06"); //Don't mention it. And now take care!

	B_GivePlayerXP	(1000);

	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_MATTEO_THREE, LOG_SUCCESS);
	
	Spine_UnlockAchievement(SPINE_ACHIEVEMENT_46);
};

INSTANCE Info_Mod_Matteo_LehrlingQuest8 (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_LehrlingQuest8_Condition;
	information	= Info_Mod_Matteo_LehrlingQuest8_Info;
	permanent	= 0;
	important	= 0;
	description	= "How's it going with you?";
};

FUNC INT Info_Mod_Matteo_LehrlingQuest8_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest7))
	&& (Kapitel >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_LehrlingQuest8_Info()
{
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest8_15_00"); //How are things going with you?
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest8_23_01"); //That I'll see you again! Good, good, good, everything's fine. And you're still busy traveling?
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest8_15_02"); //Somebody's got to fix everything.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest8_23_03"); //Well, that's where you're going! (laughs)
};

INSTANCE Info_Mod_Matteo_Einschaetzung (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_Einschaetzung_Condition;
	information	= Info_Mod_Matteo_Einschaetzung_Info;
	permanent	= 1;
	important	= 0;
	description	= "Can you judge my negotiating skills?";
};

FUNC INT Info_Mod_Matteo_Einschaetzung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_Einschaetzung_Info()
{
	AI_Output(hero, self, "Info_Mod_Matteo_Einschaetzung_15_00"); //Can you judge my negotiating skills?
	AI_Output(self, hero, "Info_Mod_Matteo_Einschaetzung_23_01"); //Sure. Well, I would say....

	if (Mod_Verhandlungsgeschick	<	30)
	{
		AI_Output(self, hero, "Info_Mod_Matteo_Einschaetzung_23_02"); //... Trader Apprentice.
	}
	else if (Mod_Verhandlungsgeschick	<	50)
	{
		AI_Output(self, hero, "Info_Mod_Matteo_Einschaetzung_23_03"); //... Small trader.
	}
	else if (Mod_Verhandlungsgeschick	<	75)
	{
		AI_Output(self, hero, "Info_Mod_Matteo_Einschaetzung_23_04"); //... Dealer.
	}
	else if (Mod_Verhandlungsgeschick	<	100)
	{
		AI_Output(self, hero, "Info_Mod_Matteo_Einschaetzung_23_05"); //... Good dealer.
	}
	else if (Mod_Verhandlungsgeschick	==	100)
	{
		AI_Output(self, hero, "Info_Mod_Matteo_Einschaetzung_23_06"); //... Perfect dealer.
	};
};

INSTANCE Info_Mod_Matteo_Angebot_Kaese (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_Angebot_Kaese_Condition;
	information	= Info_Mod_Matteo_Angebot_Kaese_Info;
	permanent	= 0;
	important	= 0;
	description	= "I read something about your offer.";
};

FUNC INT Info_Mod_Matteo_Angebot_Kaese_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Hi))
	&& (Mod_AngebotMatteo == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_Angebot_Kaese_Info()
{
	AI_Output(hero, self, "Info_Mod_Matteo_Angebot_Kaese_15_00"); //I read something about your offer.
	AI_Output(self, hero, "Info_Mod_Matteo_Angebot_Kaese_23_01"); //You mean the cheese. Yes, it costs only 10 gold coins and is only available in the next few days.

	Mod_MatteosKaeseAngebot	= Wld_GetDay();
};

INSTANCE Info_Mod_Matteo_Angebot_Vorbei (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_Angebot_Vorbei_Condition;
	information	= Info_Mod_Matteo_Angebot_Vorbei_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Matteo_Angebot_Vorbei_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Angebot_Kaese))
	&& ((Wld_GetDay() - Mod_MatteosKaeseAngebot) >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_Angebot_Vorbei_Info()
{
	AI_Output(self, hero, "Info_Mod_Matteo_Angebot_Vorbei_23_00"); //The offer is no longer valid.
};

INSTANCE Info_Mod_Matteo_Kaese (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_Kaese_Condition;
	information	= Info_Mod_Matteo_Kaese_Info;
	permanent	= 1;
	important	= 0;
	description	= "Give me a piece of cheese.";
};

FUNC INT Info_Mod_Matteo_Kaese_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Angebot_Kaese))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Matteo_Angebot_Vorbei))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_Kaese_Info()
{
	AI_Output(hero, self, "Info_Mod_Matteo_Kaese_15_00"); //Give me a piece of cheese.

	if (Npc_HasItems(hero, ItMi_Gold) >= 10)
	{
		AI_Output(self, hero, "Info_Mod_Matteo_Kaese_23_01"); //Here's your cheese.

		B_GiveInvItems	(hero, self, ItMi_Gold, 10);

		CreateInvItems	(self, ItFo_Cheese, 1);
		B_GiveInvItems	(self, hero, ItFo_Cheese, 1);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Matteo_Kaese_23_02"); //Come back when you have enough gold.
	};
};

INSTANCE Info_Mod_Matteo_Trade (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_Trade_Condition;
	information	= Info_Mod_Matteo_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Matteo_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Hi))
	&& ((!Npc_KnowsInfo(hero, Info_Mod_Matteo_Aufnahme))
	|| (Mod_LehrlingBei == 3))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Matteo_Pickpocket (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_Pickpocket_Condition;
	information	= Info_Mod_Matteo_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Matteo_Pickpocket_Condition()
{
	C_Beklauen	(109, ItMi_Gold, 38);
};

FUNC VOID Info_Mod_Matteo_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Matteo_Pickpocket);

	Info_AddChoice	(Info_Mod_Matteo_Pickpocket, DIALOG_BACK, Info_Mod_Matteo_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Matteo_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Matteo_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Matteo_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Matteo_Pickpocket);
};

FUNC VOID Info_Mod_Matteo_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Matteo_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Matteo_Pickpocket);

		Info_AddChoice	(Info_Mod_Matteo_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Matteo_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Matteo_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Matteo_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Matteo_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Matteo_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Matteo_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Matteo_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Matteo_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Matteo_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Matteo_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Matteo_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Matteo_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Matteo_EXIT (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_EXIT_Condition;
	information	= Info_Mod_Matteo_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Matteo_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Matteo_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
