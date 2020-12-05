INSTANCE Info_Mod_Parlan_Hi (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_Hi_Condition;
	information	= Info_Mod_Parlan_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hi.";
};

FUNC INT Info_Mod_Parlan_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Parlan_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Parlan_Hi_15_00"); //Hi.
	AI_Output(self, hero, "Info_Mod_Parlan_Hi_05_01"); //Greetings, stranger. What brings you to our monastery?
};

INSTANCE Info_Mod_Parlan_Aufgabe (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_Aufgabe_Condition;
	information	= Info_Mod_Parlan_Aufgabe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Can I do anything for you?!";
};

FUNC INT Info_Mod_Parlan_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Parlan_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Pyrokar_Mitglied))
	&& (Mod_Gilde == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Parlan_Aufgabe_Info()
{
	AI_Output(hero, self, "Info_Mod_Parlan_Aufgabe_15_00"); //Is there anything I can do for you?
	AI_Output(self, hero, "Info_Mod_Parlan_Aufgabe_05_01"); //I don't need any help right now.
	AI_Output(hero, self, "Info_Mod_Parlan_Aufgabe_15_02"); //I want to become a novice and must help every fire magician.

	Log_CreateTopic	(TOPIC_MOD_PARLAN_MANA, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_PARLAN_MANA, LOG_RUNNING);
	
	AI_Output(self, hero, "Info_Mod_Parlan_Aufgabe_05_03"); //That's how it is. It's enough for me if you increase your magic power by 30.

	B_LogEntry	(TOPIC_MOD_PARLAN_MANA, "For Parlan, I'm to increase my mana by 30.");
};

INSTANCE Info_Mod_Parlan_Aufgabe_Fertig (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_Aufgabe_Fertig_Condition;
	information	= Info_Mod_Parlan_Aufgabe_Fertig_Info;
	permanent	= 0;
	important	= 0;
	description	= "I raised my MANA.";
};

FUNC INT Info_Mod_Parlan_Aufgabe_Fertig_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Parlan_Aufgabe))
	&& (Mod_RealMana >= 40) // 30 learned mana + 10 base mana
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Parlan_Aufgabe_Fertig_Info()
{
	AI_Output(hero, self, "Info_Mod_Parlan_Aufgabe_Fertig_15_00"); //I raised my MANA.
	AI_Output(self, hero, "Info_Mod_Parlan_Aufgabe_Fertig_05_01"); //Well, that's good enough for me.

	B_GivePlayerXP	(100);

	B_LogEntry_More	(TOPIC_MOD_FEUERMAGIER, TOPIC_MOD_PARLAN_MANA, "I convinced Parlan.", "Parlan is happy with me. I've done enough for him.");
	B_SetTopicStatus	(TOPIC_MOD_PARLAN_MANA, LOG_SUCCESS);

	B_Göttergefallen(1, 1);
};

INSTANCE Info_Mod_Parlan_Lehrer (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_Lehrer_Condition;
	information	= Info_Mod_Parlan_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Who can teach me how to increase my magical power?";
};

FUNC INT Info_Mod_Parlan_Lehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Parlan_Hi))
	&& ((Mod_Gilde == 0)
	|| (Mod_Gilde == 6)
	|| (Mod_Gilde == 7))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Parlan_Lehrer_Info()
{
	AI_Output(hero, self, "Info_Mod_Parlan_Lehrer_15_00"); //Who can teach me how to increase my magical power?
	AI_Output(self, hero, "Info_Mod_Parlan_Lehrer_05_01"); //I can teach you to increase your magic power.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_KLOSTER, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_KLOSTER, "Parlan can teach me how to raise my MANA.");
};

INSTANCE Info_Mod_Parlan_Ring (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_Ring_Condition;
	information	= Info_Mod_Parlan_Ring_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Parlan_Ring_Condition()
{
	if (hero.guild == GIL_PAL)
	|| (hero.guild == GIL_VLK)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Parlan_Ring_Info()
{
	AI_Output(self, hero, "Info_Mod_Parlan_Ring_05_00"); //You have to help me.
	AI_Output(hero, self, "Info_Mod_Parlan_Ring_15_01"); //What the hell happened?
	AI_Output(self, hero, "Info_Mod_Parlan_Ring_05_02"); //The novice Pedro stole my ring of fire and fled the monastery.
	AI_Output(self, hero, "Info_Mod_Parlan_Ring_05_03"); //I really need you to bring the ring back. You'd better ask some people if they saw him.

	Wld_InsertNpc	(Mod_7037_NOV_Pedro_NW, "NW_FARM4_WOOD_RANGERBANDITS_03");

	Log_CreateTopic	(TOPIC_MOD_PARLAN_FEUERRING, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_PARLAN_FEUERRING, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_PARLAN_FEUERRING, "The novice Pedro has stolen the ring of fire from the magician Parlan and I am to retrieve the ring for him. I'm supposed to ask some people where he ran off to.");
};

INSTANCE Info_Mod_Parlan_Ring_Zurueck (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_Ring_Zurueck_Condition;
	information	= Info_Mod_Parlan_Ring_Zurueck_Info;
	permanent	= 0;
	important	= 0;
	description	= "I got the ring.";
};

FUNC INT Info_Mod_Parlan_Ring_Zurueck_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Pedro_Niederlage))
	&& (Npc_HasItems(hero, ItRi_Feuerring_Parlan) == 1)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Parlan_Ring_Zurueck))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Parlan_Ring_Zurueck_Info()
{
	AI_Output(hero, self, "Info_Mod_Parlan_Ring_Zurueck_15_00"); //I got the ring.

	B_GiveInvItems	(hero, self, ItRi_Feuerring_Parlan, 1);

	AI_Output(self, hero, "Info_Mod_Parlan_Ring_Zurueck_05_01"); //Thank you very much. Here's your reward.

	B_GiveInvItems	(self, hero, ItMi_Gold, 250);

	B_GivePlayerXP	(250);

	B_LogEntry	(TOPIC_MOD_PARLAN_FEUERRING, "I gave Parlan his ring.");
	B_SetTopicStatus	(TOPIC_MOD_PARLAN_FEUERRING, LOG_SUCCESS);

	B_Göttergefallen(1, 1);
};

INSTANCE Info_Mod_Parlan_Patherion (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_Patherion_Condition;
	information	= Info_Mod_Parlan_Patherion_Info;
	permanent	= 0;
	important	= 0;
	description	= "Pyrokar told me to contact you for my next mission.";
};

FUNC INT Info_Mod_Parlan_Patherion_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Pyrokar_Befoerderung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Parlan_Patherion_Info()
{
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_00"); //Pyrokar told me to contact you for my next mission.
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_01"); //He mentioned something about a holy place...
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_02"); //Yes, brother. Now that you're one of us, it's time to tell you an old story.
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_03"); //I'm all ears.
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_04"); //Do you know the legend of Inno's tears?
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_05"); //Tears Innos'? No, let's hear it.
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_06"); //It began when Innos faced his two brothers and realized that he had to fight against Beliar. When Innos realized this, his heart filled with sadness and he began to cry.
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_07"); //For 13 years he cried and his tears fell down on the world. Despite this long time Innos shed only 6 tears.
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_08"); //And then what happened to them?
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_09"); //Well, a man, his name was Ragon, found one of the tears. He tasted of her and he was filled with supernatural power and wisdom.
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_10"); //He recognized the wisdom of Inno's creation. So he began to serve Innos. As a penance for his life so far, he decided to go on a course of penance.
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_11"); //He kept going straight ahead, neither lakes nor mountains could stop him. And at some point, in the middle of the mountains, he found a valley. Almost unattainable. There he began to build a temple.
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_12"); //When he had finished building it, he prayed to Innos for 13 days. He didn't stop praying until four voices interrupted him.
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_13"); //There were four men. They came from all parts of the earth, driven by the search for forgiveness of their sins and felt called to the place where Inno's power was so clearly felt.
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_14"); //The five men each spoke a different language and yet they understood each other without difficulty. They decided to build a large monastery together. They built for a long time, but time had lost the meaning for them, because of Inno's tears they did not age any more.
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_15"); //Then the tears are some kind of potion?
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_16"); //In a way, only much more powerful!
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_17"); //And what happened after they built the monastery?
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_18"); //Well, they went out to spread the Innos message and sought novices for their monastery. At least most of them. One, however, felt called to another. It was Ragon.
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_19"); //He knew, or rather, he felt that there was still a tear of Inno's. He wanted to find them and bring them to the monastery.
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_20"); //And did he find her?
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_21"); //No one knows. The remaining four-four met again in the monastery, where they still form the head of the Innoskirche, but Ragon has never been heard of again.
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_22"); //And why are you telling me this story?
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_23"); //Just to give you the necessary background information for your next job.
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_24"); //My next assignment?
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_25"); //Yeah. Patherion was besieged by black magicians and black warriors some time ago. At first we didn't understand their actions, a siege was virtually pointless, because we can teleport as we like, but we underestimate the black mages. They stole the focus and built a barrier.
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_26"); //What? You mean like you did back in the mining colony?
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_27"); //Yes and no. They have built a similar barrier, but you can go in or out.
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_28"); //Then what's the problem?
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_29"); //Tja, man kann eben nur rein "go". Die Barriere verhindert, dass wir uns dorthin teleportieren können! Die Nahrungs- und Trankvorräte von Patherion gehen zur Neige, deshalb sollst du ihnen dieses Paket voller Tränke und dieses Paket voll Nahrung bringen.

	CreateInvItems	(hero, ItMi_Pat_Nahrung, 1);
	CreateInvItems	(hero, ItMi_Pat_Trank, 1);

	AI_PrintScreen	("2 Packages received", -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);

	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_30"); //What? I don't think you can teleport there and as you said yourself, it's almost unattainable.
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_31"); //That's not quite true, you just can't teleport to the monastery. Remember the chapel that Ragon built himself? She lies outside the barrier and you can easily travel to her by magic.
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_32"); //From there, however, you will have to find your own way through the ranks of the black mages.
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_33"); //Sounds dangerous!
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_34"); //It is, too. For this reason, it is also given to you and not to any of the novices.
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_35"); //All right, I'll be right on my way.
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_36"); //Take this rune. With her you will come to the chapel of Patherion.

	B_GiveInvItems	(self, hero, ItRu_Teleport_Pat, 1);

	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_37"); //And how do I get back?
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_38"); //With this rune. However, you can only use it in the chapel.

	B_GiveInvItems	(self, hero, ItRu_TeleportPatBack, 1);

	B_LogEntry	(TOPIC_MOD_PATHERION, "Parlan told me about Patherion, a great temple of fire magicians. The latter is currently besieged by black mages and warriors and therefore needs food and water. I am to take these to the temple now.");
};

INSTANCE Info_Mod_Parlan_Lernen (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_Lernen_Condition;
	information	= Info_Mod_Parlan_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Teach me something.";
};

FUNC INT Info_Mod_Parlan_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Parlan_Lehrer))
	&& (Mod_RealMana < 100)
	&& ((Mod_Gilde == 0)
	|| (Mod_Gilde == 6)
	|| (Mod_Gilde == 7))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Parlan_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Parlan_Lernen_15_00"); //Teach me something.

	Info_ClearChoices	(Info_Mod_Parlan_Lernen);

	Info_AddChoice		(Info_Mod_Parlan_Lernen, DIALOG_BACK, INFO_MOD_Parlan_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Parlan_Lernen, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Parlan_Lernen_5);
	Info_AddChoice		(Info_Mod_Parlan_Lernen, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Parlan_Lernen_1);
};

FUNC VOID Info_Mod_Parlan_Lernen_BACK()
{
	if (Mod_RealMana	>=	100)
	{
		AI_Output(self, hero, "Info_Mod_Parlan_Lernen_BACK_05_01"); //Your magic skills are so good now, I can't teach you anything.
	};
	Info_ClearChoices	(Info_Mod_Parlan_Lernen);
};

FUNC VOID Info_Mod_Parlan_Lernen_5()
{
	B_TeachAttributePoints_New (self, hero, ATR_MANA_MAX, 5, 100);

	Info_ClearChoices	(Info_Mod_Parlan_Lernen);

	Info_AddChoice		(Info_Mod_Parlan_Lernen, DIALOG_BACK, INFO_MOD_Parlan_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Parlan_Lernen, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Parlan_Lernen_5);
	Info_AddChoice		(Info_Mod_Parlan_Lernen, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Parlan_Lernen_1);
};

FUNC VOID Info_Mod_Parlan_Lernen_1()
{
	B_TeachAttributePoints (self, hero, ATR_MANA_MAX, 1, 100);

	Info_ClearChoices	(Info_Mod_Parlan_Lernen);

	Info_AddChoice		(Info_Mod_Parlan_Lernen, DIALOG_BACK, INFO_MOD_Parlan_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Parlan_Lernen, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Parlan_Lernen_5);
	Info_AddChoice		(Info_Mod_Parlan_Lernen, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Parlan_Lernen_1);
};

INSTANCE Info_Mod_Parlan_Pickpocket (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_Pickpocket_Condition;
	information	= Info_Mod_Parlan_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Parlan_Pickpocket_Condition()
{
	C_Beklauen	(96, ItMi_Gold, 45);
};

FUNC VOID Info_Mod_Parlan_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Parlan_Pickpocket);

	Info_AddChoice	(Info_Mod_Parlan_Pickpocket, DIALOG_BACK, Info_Mod_Parlan_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Parlan_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Parlan_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Parlan_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Parlan_Pickpocket);
};

FUNC VOID Info_Mod_Parlan_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Parlan_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Parlan_Pickpocket);

		Info_AddChoice	(Info_Mod_Parlan_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Parlan_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Parlan_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Parlan_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Parlan_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Parlan_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Parlan_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Parlan_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Parlan_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Parlan_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Parlan_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Parlan_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Parlan_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Parlan_EXIT (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_EXIT_Condition;
	information	= Info_Mod_Parlan_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Parlan_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Parlan_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
