INSTANCE Info_Mod_Lester_Hi (C_INFO)
{
	npc		= Mod_557_PSINoV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Hi_Condition;
	information	= Info_Mod_Lester_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lester_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Lester_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Lester_Hi_13_00"); //By the sleeper! This is a surprise!
	AI_Output(hero, self, "Info_Mod_Lester_Hi_15_01"); //Lester! How did you get here?
	AI_Output(self, hero, "Info_Mod_Lester_Hi_13_02"); //I was just about to ask you the same thing. One minute I think you're still trapped in the temple of sleepers-the next you're already in front of me.
	AI_Output(self, hero, "Info_Mod_Lester_Hi_13_03"); //What's happening?
	AI_Output(hero, self, "Info_Mod_Lester_Hi_15_04"); //You've actually put it all together pretty well. I have to get used to the fresh air again.
	AI_Output(self, hero, "Info_Mod_Lester_Hi_13_05"); //Then surely Xardas has his finger in the pie. He does own the tower, doesn't he? His dark style is unmistakable.
	AI_Output(hero, self, "Info_Mod_Lester_Hi_15_06"); //That is also quite right. But what are you doing here?
	AI_Output(self, hero, "Info_Mod_Lester_Hi_13_07"); //I realize you still haven't become the great storyteller.
	AI_Output(self, hero, "Info_Mod_Lester_Hi_13_08"); //As far as I'm concerned, I landed Baal Namib's mission because of the dark tower.
	AI_Output(self, hero, "Info_Mod_Lester_Hi_13_09"); //There seems to be a connection between the growth of swampweed and the presence of black magic, which I try to fathom out.
	AI_Output(self, hero, "Info_Mod_Lester_Hi_13_10"); //But it's still too early to speculate more about it. I'm watching. And smoke one now and then.
};

INSTANCE Info_Mod_Lester_Goetterwaffen (C_INFO)
{
	npc		= Mod_557_PSINoV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Goetterwaffen_Condition;
	information	= Info_Mod_Lester_Goetterwaffen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lester_Goetterwaffen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Milten_Daemonisch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_Goetterwaffen_Info()
{
	AI_Output(self, hero, "Info_Mod_Lester_Goetterwaffen_13_00"); //Good to see you. I got something for you.
	AI_Output(hero, self, "Info_Mod_Lester_Goetterwaffen_15_01"); //Yeah, Milten sent me.
	AI_Output(self, hero, "Info_Mod_Lester_Goetterwaffen_13_02"); //Well, then you know I've changed a few spell roles for you.
	AI_Output(self, hero, "Info_Mod_Lester_Goetterwaffen_13_03"); //Here's five copies.

	B_GiveInvItems	(self, hero, ItSc_SumRabbit, 5);

	AI_Output(self, hero, "Info_Mod_Lester_Goetterwaffen_13_04"); //You can summon some bunnies with it. It's not very fine, but it's a good way to spot traps.
};

INSTANCE Info_Mod_Lester_Irdorath (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Irdorath_Condition;
	information	= Info_Mod_Lester_Irdorath_Info;
	permanent	= 0;
	important	= 0;
	description	= "The thing with Xeres leads me to an island this time and I am looking for experienced people for my crew.";
};

FUNC INT Info_Mod_Lester_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Irdorath))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUnc VOID Info_Mod_Lester_Irdorath_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_Irdorath_15_00"); //The thing with Xeres leads me to an island this time and I am looking for experienced people for my crew. Would you know anybody?
	AI_Output(self, hero, "Info_Mod_Lester_Irdorath_13_01"); //(amazed) Crew and island? Now even over the sea...
	AI_Output(self, hero, "Info_Mod_Lester_Irdorath_13_02"); //Well, I'm sure Cor Angar will be enthusiastic about it.
	AI_Output(self, hero, "Info_Mod_Lester_Irdorath_13_03"); //At the time of the barrier, you already had a not inconsiderable part in the further fate of the camp with him.

	if (Templer_Dabei == 1)
	|| (Guru_Dabei == 1)
	{
		AI_Output(self, hero, "Info_Mod_Lester_Irdorath_13_04"); //Well, and then maybe Baal Namib. Among the Baals, it is still the one with the greatest urge for something new and unknown.
		AI_Output(self, hero, "Info_Mod_Lester_Irdorath_13_05"); //It is not for nothing that he stands at the entrance of the camp.

		B_LogEntry	(TOPIC_MOD_HQ_CREW, "Cor Angar and Baal Namib could warm up for the voyage, as Lester told me.");
	}
	else
	{
		B_LogEntry	(TOPIC_MOD_HQ_CREW, "Cor Angar could warm up for the voyage, as Lester told me.");
	};

	AI_Output(self, hero, "Info_Mod_Lester_Irdorath_13_06"); //And then, well, I would consider myself fortunate if I were part of this adventure.
};

INSTANCE Info_Mod_Lester_Irdorath2 (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Irdorath2_Condition;
	information	= Info_Mod_Lester_Irdorath2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Then I welcome you aboard our ship.";
};

FUNC INT Info_Mod_Lester_Irdorath2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_Irdorath))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUnc VOID Info_Mod_Lester_Irdorath2_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_Irdorath2_15_00"); //Then I welcome you aboard our ship. The meeting point is the harbour in Khorinis.
	AI_Output(self, hero, "Info_Mod_Lester_Irdorath2_13_01"); //Great. Until then.

	B_LogEntry	(TOPIC_MOD_HQ_CREW, "Very good, my companion Lester is on board.");

	B_GivePlayerXP	(150);

	Mod_CrewCount += 1;

	if (CurrentLevel == NEWWORLD_ZEN)
	{
		Mod_LesterDabei = 2;

		AI_StopProcessInfos	(self);

		B_StartOtherRoutine	(self, "SCHIFF");
	}
	else
	{
		Mod_LesterDabei = 1;

		AI_StopProcessInfos	(self);

		B_StartOtherRoutine	(self, "TOT");
	};
};

INSTANCE Info_Mod_Lester_Irdorath3 (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Irdorath3_Condition;
	information	= Info_Mod_Lester_Irdorath3_Info;
	permanent	= 1;
	important	= 0;
	description	= "I'm sorry, but it seems we're too many.";
};

FUNC INT Info_Mod_Lester_Irdorath3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_Irdorath2))
	&& (Mod_Irdorath == 0)
	&& (Mod_LesterDabei == 1)
	&& (Mod_JackDabei == 1)
	&& (Mod_CrewCount > 15)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_Irdorath3_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_Irdorath3_15_00"); //I'm sorry, but it seems we're too many. I can't take you with me.
	AI_Output(self, hero, "Info_Mod_Lester_Irdorath3_13_01"); //Too bad. I'll go back to the Minental.

	Mod_LesterDabei = 3;

	Mod_CrewCount -= 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
};

INSTANCE Info_Mod_Lester_Fanatiker (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Fanatiker_Condition;
	information	= Info_Mod_Lester_Fanatiker_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hey, Lester!";
};

FUNC INT Info_Mod_Lester_Fanatiker_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Andre_Auftrag))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Andre_Erfahrung_Fanatiker))
	{
		return 1;
	};
};

FUnc VOID Info_Mod_Lester_Fanatiker_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_Fanatiker_15_00"); //Hey, Lester!
	AI_Output(self, hero, "Info_Mod_Lester_Fanatiker_13_01"); //Hello, my friend. What brings you to me?
	AI_Output(hero, self, "Info_Mod_Lester_Fanatiker_15_02"); //Do you know what happened to the rest of the brotherhood?
	AI_Output(self, hero, "Info_Mod_Lester_Fanatiker_13_03"); //After the fall of the barrier? They moved to Khorinis. Most of them still hold onto the sleeper.
	AI_Output(hero, self, "Info_Mod_Lester_Fanatiker_15_04"); //Do you have any idea how I could find out anything about her?
	AI_Output(self, hero, "Info_Mod_Lester_Fanatiker_13_05"); //Hmm... as far as I know, the former Templar Cor Gar in Khorinis. Go hunting in the forest and live him hotel. I'm sure you'll meet him at the hookahs in the evening.
	AI_Output(self, hero, "Info_Mod_Lester_Fanatiker_13_06"); //The best thing to do is to bring him some bogweed, and he will be happy to help you. Oh yes, he calls himself Josef since the fall of the sleeper.

	B_LogEntry	(TOPIC_MOD_MILIZ_SEKTENSPINNER, "Lester said the sleeper's trailers moved to khorinis. A former Templar named Cor Gar, who now calls himself Josef, will be able to tell me more about it - provided I have some bogweed for him.");
};

INSTANCE Info_Mod_Lester_Sekte (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Sekte_Condition;
	information	= Info_Mod_Lester_Sekte_Info;
	permanent	= 0;
	important	= 0;
	description	= "The brotherhood still exists?";
};

FUNC INT Info_Mod_Lester_Sekte_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_Hi))
	{
		return 1;
	};
};

FUnc VOID Info_Mod_Lester_Sekte_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_Sekte_15_00"); //The brotherhood still exists? I thought you were desperate to leave the colony?
	AI_Output(self, hero, "Info_Mod_Lester_Sekte_13_01"); //Originally we wanted to, that's right. But after the barrier has fallen and we have experienced what is going on on the mainland, we decided to stay in the Minental.
	AI_Output(self, hero, "Info_Mod_Lester_Sekte_13_02"); //We also have a few buyers for our herb here. That's very popular in Khorinis.
};

INSTANCE Info_Mod_Lester_Aufnehmen (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Aufnehmen_Condition;
	information	= Info_Mod_Lester_Aufnehmen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Can I join you guys?";
};

FUNC INT Info_Mod_Lester_Aufnehmen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_Sekte))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_Aufnehmen_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_Aufnehmen_15_00"); //Can I join you guys?
	AI_Output(self, hero, "Info_Mod_Lester_Aufnehmen_13_01"); //Of course, but you have to go to the Minental first. You should also know that we are not one of the big communities, like militia or mercenaries.
	AI_Output(self, hero, "Info_Mod_Lester_Aufnehmen_13_02"); //You can also join us if you are already in another community. Talk to Baal Namib as soon as you get to the swamp camp.

	Log_CreateTopic	(TOPIC_MOD_SEKTE_AUFNAHME, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SEKTE_AUFNAHME, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "I can join the Brotherhood in the Minental. I'm to speak to Baal Namib about this.");
};

INSTANCE Info_Mod_Lester_Namib (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Namib_Condition;
	information	= Info_Mod_Lester_Namib_Info;
	permanent	= 0;
	important	= 0;
	description	= "Baal Namib sent me.";
};

FUNC INT Info_Mod_Lester_Namib_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Namib_Aufnehmen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_Namib_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_Namib_15_00"); //Baal Namib sent me. I'm supposed to pick up a package at your place and take it to Constantino.
	AI_Output(self, hero, "Info_Mod_Lester_Namib_13_01"); //Very well, then I can continue to think... dedicate to research.

	B_GiveInvItems	(self, hero, ItMi_LesterPaket, 1);

	CreateInvItems	(self, ItMi_Joint, 1);

	B_UseItem	(self, ItMi_Joint);

	AI_Output(hero, self, "Info_Mod_Lester_Namib_15_02"); //I'm also supposed to pick up a progress report.
	AI_Output(self, hero, "Info_Mod_Lester_Namib_13_03"); //A status report? Well, in that case.... for this I need a bottle of magic water for.... for.... for the marsh weed!
	AI_Output(hero, self, "Info_Mod_Lester_Namib_15_04"); //Where do I get magic water from?
	AI_Output(self, hero, "Info_Mod_Lester_Namib_13_05"); //Constantino's brewing it. You'll get it from him. Tell him to put it on the bill.
	AI_Output(hero, self, "Info_Mod_Lester_Namib_15_06"); //All right, all right.

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "I got the package, but Lester needs a bottle of magic water for the situation report. He said Constantino produces and sells the magic water.");
};

INSTANCE Info_Mod_Lester_Zauberwasser (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Zauberwasser_Condition;
	information	= Info_Mod_Lester_Zauberwasser_Info;
	permanent	= 0;
	important	= 0;
	description	= "Here, magic water.";
};

FUNC INT Info_Mod_Lester_Zauberwasser_Condition()
{
	if (Npc_HasItems(hero, ItMi_Zauberwasser) > 0)	
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_Zauberwasser_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_Zauberwasser_15_00"); //Here, magic water.

	B_GiveInvItems	(hero, self, ItMi_Zauberwasser, 1);

	AI_Output(self, hero, "Info_Mod_Lester_Zauberwasser_13_01"); //Good, finally I have my magic water.

	if (Mod_ConstantinoZauberwasser == 1)
	{
		AI_Output(hero, self, "Info_Mod_Lester_Zauberwasser_15_02"); //I had to work to pay your debt!
	}
	else if (Mod_ConstantinoZauberwasser == 2)
	{
		AI_Output(hero, self, "Info_Mod_Lester_Zauberwasser_15_03"); //I had to steal Constantino's bottle of magic water from his chest.
	}
	else if (Mod_ConstantinoZauberwasser == 3)
	{
		AI_Output(hero, self, "Info_Mod_Lester_Zauberwasser_15_04"); //I had to pay your debt to Constantino.
	};

	AI_Output(self, hero, "Info_Mod_Lester_Zauberwasser_13_05"); //Thank you! I'll keep that in mind.
	AI_Output(hero, self, "Info_Mod_Lester_Zauberwasser_15_06"); //What do you need this magic water for?
	AI_Output(self, hero, "Info_Mod_Lester_Zauberwasser_13_07"); //Well, there's nothing like ending a hard day's work with a stem of swampweed and a bottle of magic water.

	CreateInvItems	(self, ItMi_Joint, 1);

	B_UseItem	(self, ItMi_Joint);
	B_UseItem	(self, ItMi_Zauberwasser);

	AI_Output(hero, self, "Info_Mod_Lester_Zauberwasser_15_08"); //Wait a minute.... which means magic water is a drink?
	AI_Output(self, hero, "Info_Mod_Lester_Zauberwasser_13_09"); //(laughs) What did you think? That it's like a miracle fertilizer?
	AI_Output(hero, self, "Info_Mod_Lester_Zauberwasser_15_10"); //You.... what about the progress report?
	AI_Output(self, hero, "Info_Mod_Lester_Zauberwasser_13_11"); //Ah yes. Tell Baal Namib that the bogweed grows very well according to the circumstances.
	AI_Output(self, hero, "Info_Mod_Lester_Zauberwasser_13_12"); //Although the air is not moist enough and there is no sunshine, it grows very well.

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "I gave Lester the magic water and it turned out to be a regular drink. Anyway, I've got the situation report now and should return to Baal Namib.");

	B_GivePlayerXP	(150);
};

INSTANCE Info_Mod_Lester_Zauberwasser_MIS (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Zauberwasser_MIS_Condition;
	information	= Info_Mod_Lester_Zauberwasser_MIS_Info;
	permanent	= 0;
	important	= 0;
	description	= "I've got lots of magic water here.";
};

FUNC INT Info_Mod_Lester_Zauberwasser_MIS_Condition()
{
	if (Npc_HasItems(hero, ItMi_Zauberwasser_MIS) > 0)	
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_Zauberwasser_MIS_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_Zauberwasser_MIS_15_00"); //I've got lots of magic water here.
	AI_Output(self, hero, "Info_Mod_Lester_Zauberwasser_MIS_13_01"); //Where did you get it?
	AI_Output(hero, self, "Info_Mod_Lester_Zauberwasser_MIS_15_02"); //Constantino wanted me to hand it out to various dealers to clear your debt.
	AI_Output(self, hero, "Info_Mod_Lester_Zauberwasser_MIS_13_03"); //Uh... and just bring me one when you're done with it.
	AI_Output(hero, self, "Info_Mod_Lester_Zauberwasser_MIS_15_04"); //You sure you don't want any of these?
	AI_Output(self, hero, "Info_Mod_Lester_Zauberwasser_MIS_13_05"); //Yeah, who knows what Constantino will do to us if we go wrong with his delivery.

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Lester didn't want magic water from the shipments I'm supposed to deliver for Constantino. So I really have to take them away and earn the bottle of magic water from Constantino.");
};

INSTANCE Info_Mod_Lester_Treffen (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Treffen_Condition;
	information	= Info_Mod_Lester_Treffen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Gorn sent me.";
};

FUNC INT Info_Mod_Lester_Treffen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gorn_AtCastlemine))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_Treffen_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_Treffen_15_00"); //Gorn sent me. I'm supposed to tell you to meet at the Dead Harpie tavern.
	AI_Output(self, hero, "Info_Mod_Lester_Treffen_13_01"); //Oh, thank you. Thank you. I'll be on my way right away. Why don't you come over? You're one of us, after all.

	B_LogEntry	(TOPIC_MOD_TREFFEN, "");

	AI_StopProcessInfos	(self);

	if (CurrentLevel == RELENDEL_ZEN) {
		B_StartOtherRoutine	(self, "TOT");
		Mod_LesterRELToMeeting = 1;
	} else {
		B_StartOtherRoutine	(self, "TREFFEN");
	};
};

INSTANCE Info_Mod_Lester_Karras (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Karras_Condition;
	information	= Info_Mod_Lester_Karras_Info;
	permanent	= 0;
	important	= 0;
	description	= "You want me to let you know you can go to the Minental.";
};

FUNC INT Info_Mod_Lester_Karras_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Karras_NamibHabBuch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_Karras_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_Karras_15_00"); //You want me to let you know you can go to the Minental.
	AI_Output(self, hero, "Info_Mod_Lester_Karras_13_01"); //It's about time, this cave life doesn't do me any good.

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Lester will now return to the Minental.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
};

INSTANCE Info_Mod_Lester_Crawlersekret (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Crawlersekret_Condition;
	information	= Info_Mod_Lester_Crawlersekret_Info;
	permanent	= 0;
	important	= 0;
	description	= "Do you know where there's a Minecrawler secretary?";
};

FUNC INT Info_Mod_Lester_Crawlersekret_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_Lehrling))
	&& (Mod_MinecrawlerEi >= 0)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Constantino_Stimme))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_Crawlersekret_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_Crawlersekret_15_00"); //Do you know where there's a Minecrawler secretary?
	AI_Output(self, hero, "Info_Mod_Lester_Crawlersekret_13_01"); //Minecrawler Secretariat? Cor Kalom used to extract it from the pliers of the minecrawlers.
	AI_Output(hero, self, "Info_Mod_Lester_Crawlersekret_15_02"); //I need stronger secretion than the forceps.
	AI_Output(self, hero, "Info_Mod_Lester_Crawlersekret_13_03"); //Like that from the queen's balls you brought us back then?
	AI_Output(hero, self, "Info_Mod_Lester_Crawlersekret_15_04"); //That's just it.
	AI_Output(self, hero, "Info_Mod_Lester_Crawlersekret_13_05"); //Then you should get some eggs and fill the secret. If you're lucky, there's also some stuffed secretion in the camp.
};

INSTANCE Info_Mod_Lester_ZeichenDerBruderschaft (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_ZeichenDerBruderschaft_Condition;
	information	= Info_Mod_Lester_ZeichenDerBruderschaft_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lester_ZeichenDerBruderschaft_Condition()
{
	if (Npc_HasItems(hero, ItMi_ZeichenDerBruderschaft) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_ZeichenDerBruderschaft_Info()
{
	AI_Output(self, hero, "Info_Mod_Lester_ZeichenDerBruderschaft_13_00"); //What am I looking at? You carry the mark of the old brotherhood with you? I think I'd better take it on myself.

	B_GiveInvItems	(hero, self, ItMi_ZeichenDerBruderschaft, 1);

	AI_Output(self, hero, "Info_Mod_Lester_ZeichenDerBruderschaft_13_01"); //Under the Brotherhood there are still a few fanatics who might see it as provocation if you carry this sign with you.

	B_GivePlayerXP	(150);
};

INSTANCE Info_Mod_Lester_WillstMitMir (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_WillstMitMir_Condition;
	information	= Info_Mod_Lester_WillstMitMir_Info;
	permanent	= 0;
	important	= 0;
	description	= "Don't you want to come with me?";
};

FUNC INT Info_Mod_Lester_WillstMitMir_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_WillstMitMir_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_WillstMitMir_15_00"); //Don't you want to come with me?
	AI_Output(self, hero, "Info_Mod_Lester_WillstMitMir_13_01"); //The assignment is extremely important for the swamp camp, I can't get rid of it without further ado. If there's anything urgent, I'll stand by you, of course.
};

INSTANCE Info_Mod_Lester_GornDiegoMilten (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_GornDiegoMilten_Condition;
	information	= Info_Mod_Lester_GornDiegoMilten_Info;
	permanent	= 0;
	important	= 0;
	description	= "What happened to Gorn, Diego and Milten?";
};

FUNC INT Info_Mod_Lester_GornDiegoMilten_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_GornDiegoMilten_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_GornDiegoMilten_15_00"); //What happened to Gorn, Diego and Milten?
	AI_Output(self, hero, "Info_Mod_Lester_GornDiegoMilten_13_01"); //After the fall of the barrier, we discussed what to do. Milten has suggested that we could start our own grouping that sees itself as an intermediary between the convicts from the Mine Valley and the guilds in Khorinis.
	AI_Output(self, hero, "Info_Mod_Lester_GornDiegoMilten_13_02"); //Well, sometimes he's a bit naive after all. Diego immediately talked him out of it, and we decided that everyone should seek his own happiness for the time being.
	AI_Output(self, hero, "Info_Mod_Lester_GornDiegoMilten_13_03"); //And that's how it happened: Milten wanted to join the Fire Magicians, Gorn joined some of his friends to serve as a mercenary, and Diego accompanied me to Khorinis.
	AI_Output(self, hero, "Info_Mod_Lester_GornDiegoMilten_13_04"); //Last time I checked, he stayed there.
};

INSTANCE Info_Mod_Lester_DefenseBreak (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_DefenseBreak_Condition;
	information	= Info_Mod_Lester_DefenseBreak_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lester_DefenseBreak_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_Hi))
	&& (hero.attribute[ATR_DEXTERITY] >= 50)
	&& ((hero.hitChance[NPC_TALENT_1H] >= 30)
	|| (hero.hitChance[NPC_TALENT_2H] >= 30))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_DefenseBreak_Info()
{
	AI_Output(self, hero, "Info_Mod_Lester_DefenseBreak_12_00"); //Hey! Yesterday evening I smoked too much swampweed, and there I had a system at night how to overcome blocking enemies.
	AI_Output(hero, self, "Info_Mod_Lester_DefenseBreak_15_01"); //You think about things...
	AI_Output(self, hero, "Info_Mod_Lester_DefenseBreak_12_02"); //I wasn't sane at the time!
	AI_Output(self, hero, "Info_Mod_Lester_DefenseBreak_12_03"); //I've been dreaming about other things, you don't want to know anything about them.
	AI_Output(self, hero, "Info_Mod_Lester_DefenseBreak_12_04"); //Anyway, if you want, I'll tell you how the technique works.
};

INSTANCE Info_Mod_Lester_DefenseBreak2 (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_DefenseBreak2_Condition;
	information	= Info_Mod_Lester_DefenseBreak2_Info;
	permanent	= 1;
	important	= 0;
};

FUNC INT Info_Mod_Lester_DefenseBreak2_Condition()
{
	if (Mod_Schwierigkeit == 4)
	{
		Info_Mod_Lester_DefenseBreak2.description = "How can I break a block? (500 Gold)";
	}
	else
	{
		Info_Mod_Lester_DefenseBreak2.description = "How can I break a block? (5 LP)";
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Lester_DefenseBreak))
	&& (DefenseBreak_Perk == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_DefenseBreak2_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_DefenseBreak2_15_00"); //How can I break a block?

	if ((Mod_Schwierigkeit == 4)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 500))
	|| ((Mod_Schwierigkeit != 4)
	&& (hero.lp >= 5))
	{
		AI_Output(self, hero, "Info_Mod_Lester_DefenseBreak2_12_01"); //You have to make the enemy believe you're aiming at his legs.
		AI_Output(self, hero, "Info_Mod_Lester_DefenseBreak2_12_02"); //Your gaze and your body position must be entirely focused on it.
		AI_Output(self, hero, "Info_Mod_Lester_DefenseBreak2_12_03"); //At the last moment, pull up the sword. If you do a trick, his torso's unprotected.
		AI_Output(hero, self, "Info_Mod_Lester_DefenseBreak2_15_04"); //It won't work every time, though.
		AI_Output(self, hero, "Info_Mod_Lester_DefenseBreak2_12_05"); //If you know a better recipe....
		AI_Output(hero, self, "Info_Mod_Lester_DefenseBreak2_15_06"); //All right, all right. Thanks for the advice.

		DefenseBreak_Perk = TRUE;

		if (Mod_Schwierigkeit == 4)
		{
			Npc_RemoveInvItems	(hero, ItMi_Gold, 500);
		}
		else
		{
			hero.lp -= 5;
		};
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Lester_DefenseBreak2_12_07"); //Come back when you're ready.
	};
};

INSTANCE Info_Mod_Lester_Pickpocket (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Pickpocket_Condition;
	information	= Info_Mod_Lester_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_210;
};

FUNC INT Info_Mod_Lester_Pickpocket_Condition()
{
	C_Beklauen	(185, ItMi_Traumruf, 3);
};

FUNC VOID Info_Mod_Lester_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Lester_Pickpocket);

	Info_AddChoice	(Info_Mod_Lester_Pickpocket, DIALOG_BACK, Info_Mod_Lester_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Lester_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Lester_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Lester_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Lester_Pickpocket);
};

FUNC VOID Info_Mod_Lester_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Lester_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Lester_Pickpocket);

		Info_AddChoice	(Info_Mod_Lester_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Lester_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Lester_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Lester_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Lester_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Lester_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Lester_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Lester_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Lester_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Lester_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Lester_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Lester_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Lester_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Lester_EXIT (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_EXIT_Condition;
	information	= Info_Mod_Lester_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Lester_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Lester_EXIT_Info()
{
	AI_StopProcessInfos	(self);

	AI_Output(self, hero, "Info_Mod_Lester_EXIT_13_00"); //Towards the goal!
};
