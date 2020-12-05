INSTANCE Info_Mod_Kardif_Hi (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_Hi_Condition;
	information	= Info_Mod_Kardif_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Kardif_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Kardif_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Kardif_Hi_14_00"); //Welcome stranger, what can I do for you?
	AI_Output(self, hero, "Info_Mod_Kardif_Hi_14_01"); //If you're looking for something to drink, you've come to the right place.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Kardif sells something to drink.");
};

INSTANCE Info_Mod_Kardif_Daemonisch (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_Daemonisch_Condition;
	information	= Info_Mod_Kardif_Daemonisch_Info;
	permanent	= 0;
	important	= 0;
	description	= "So, how's it going in your pub?";
};

FUNC INT Info_Mod_Kardif_Daemonisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kardif_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Milten_Daemonisch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_Daemonisch_Info()
{
	AI_Output(hero, self, "Info_Mod_Kardif_Daemonisch_15_00"); //So, how's it going in your pub?
	AI_Output(self, hero, "Info_Mod_Kardif_Daemonisch_14_01"); //Oh, lousy. A large part of my clientele only hangs around in Coragon's pub.
	AI_Output(hero, self, "Info_Mod_Kardif_Daemonisch_15_02"); //Why is that? Does the beer taste better there?
	AI_Output(self, hero, "Info_Mod_Kardif_Daemonisch_14_03"); //I'll give you a beer. I hear they're going there to stuff themselves with meat.
	AI_Output(self, hero, "Info_Mod_Kardif_Daemonisch_14_04"); //My swill is a thousand times better than that of this boaster Coragon.
	AI_Output(self, hero, "Info_Mod_Kardif_Daemonisch_14_05"); //But nobody appreciates that anymore....

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Kardif is upset that a large part of his clientele is sitting in Coragon's pub and stuffing themselves with meat.");
};

INSTANCE Info_Mod_Kardif_WacholderDieb (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_WacholderDieb_Condition;
	information	= Info_Mod_Kardif_WacholderDieb_Info;
	permanent	= 0;
	important	= 0;
	description	= "I'm looking for the thief who committed a theft at Coragon.";
};

FUNC INT Info_Mod_Kardif_WacholderDieb_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kardif_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Meldor_WacholderDieb))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_WacholderDieb_Info()
{
	AI_Output(hero, self, "Info_Mod_Kardif_WacholderDieb_15_00"); //I'm looking for the thief who committed a theft at Coragon. You're a rival to him. Do you know anything about that?
	AI_Output(self, hero, "Info_Mod_Kardif_WacholderDieb_14_01"); //No! I hate Coragon, but I don't do that. I rely on fair means to make a profit.
	AI_Output(self, hero, "Info_Mod_Kardif_WacholderDieb_14_02"); //If you ask me, you should talk to the innkeeper of the beer stand. He seems suspicious to me.
	AI_Output(hero, self, "Info_Mod_Kardif_WacholderDieb_15_03"); //I'll be going, then.

	B_LogEntry	(TOPIC_MOD_CORAGON_WACHOLDER, "Kardif said he can only make a profit by fair means. I should go to the innkeeper of the beer stand.");
};

INSTANCE Info_Mod_Kardif_KnowsRukhar (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_KnowsRukhar_Condition;
	information	= Info_Mod_Kardif_KnowsRukhar_Info;
	permanent	= 0;
	important	= 0;
	description	= "Cardif, you betrayed yourself!";
};

FUNC INT Info_Mod_Kardif_KnowsRukhar_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kardif_WacholderDieb))
	&& (Npc_KnowsInfo(hero, Info_Mod_Rukhar_WacholderDieb))
	&& (Mod_KnowsRukharWacholder == 1)
	&& (Npc_HasItems(hero, ItWr_Rukhar_Wacholder) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_KnowsRukhar_Info()
{
	AI_Output(hero, self, "Info_Mod_Kardif_KnowsRukhar_15_00"); //Cardif, you betrayed yourself!
	AI_Output(self, hero, "Info_Mod_Kardif_KnowsRukhar_14_01"); //What? What?
	AI_Output(hero, self, "Info_Mod_Kardif_KnowsRukhar_15_02"); //By sending me to the host, I was able to track Rukhar and found a note saying that you ordered the theft.
	AI_Output(self, hero, "Info_Mod_Kardif_KnowsRukhar_14_03"); //Can't we talk about this again?

	Info_ClearChoices	(Info_Mod_Kardif_KnowsRukhar);

	Info_AddChoice	(Info_Mod_Kardif_KnowsRukhar, "All right, I won't tell on you.", Info_Mod_Kardif_KnowsRukhar_D);
	Info_AddChoice	(Info_Mod_Kardif_KnowsRukhar, "If you give me gold, I'll let you go.", Info_Mod_Kardif_KnowsRukhar_B);
	Info_AddChoice	(Info_Mod_Kardif_KnowsRukhar, "I will report you to Lord Andre.", Info_Mod_Kardif_KnowsRukhar_A);
};

FUNC VOID Info_Mod_Kardif_KnowsRukhar_D()
{
	AI_Output(hero, self, "Info_Mod_Kardif_KnowsRukhar_D_15_00"); //All right, I won't tell on you.
	AI_Output(self, hero, "Info_Mod_Kardif_KnowsRukhar_D_14_01"); //Thank you very much. Take this gold as a thank you from me.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	B_Göttergefallen(1, 1);

	Mod_KnowsRukharWacholder = 2;

	B_LogEntry	(TOPIC_MOD_CORAGON_WACHOLDER, "I ran Cardif. I should go to Coragon's now and come up with an excuse.");

	Info_ClearChoices	(Info_Mod_Kardif_KnowsRukhar);
};

FUNC VOID Info_Mod_Kardif_KnowsRukhar_B()
{
	AI_Output(hero, self, "Info_Mod_Kardif_KnowsRukhar_B_15_00"); //If you give me gold, I'll let you go.
	AI_Output(self, hero, "Info_Mod_Kardif_KnowsRukhar_B_14_01"); //All right, I'll give you 400 gold coins.

	B_GiveInvItems	(self, hero, ItMi_Gold, 400);

	AI_Output(hero, self, "Info_Mod_Kardif_KnowsRukhar_B_15_02"); //Thanks.

	B_LogEntry	(TOPIC_MOD_CORAGON_WACHOLDER, "Kardif paid me to let him go. Now I should go back to Coragon.");

	B_Göttergefallen(3, 1);

	Mod_KnowsRukharWacholder = 4;

	Info_ClearChoices	(Info_Mod_Kardif_KnowsRukhar);
};

FUNC VOID Info_Mod_Kardif_KnowsRukhar_A()
{
	AI_Output(hero, self, "Info_Mod_Kardif_KnowsRukhar_A_15_00"); //I will report you to Lord Andre.
	AI_Output(self, hero, "Info_Mod_Kardif_KnowsRukhar_A_14_01"); //(sighs) I'm ruined.

	B_Göttergefallen(2, 1);

	B_LogEntry	(TOPIC_MOD_CORAGON_WACHOLDER, "I'm going to rat out Cardif to Lord Andre.");

	Mod_KnowsRukharWacholder = 5;

	Info_ClearChoices	(Info_Mod_Kardif_KnowsRukhar);
};

INSTANCE Info_Mod_Kardif_Rum (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_Rum_Condition;
	information	= Info_Mod_Kardif_Rum_Info;
	permanent	= 0;
	important	= 0;
	description	= "I got a package of rum for you.";
};

FUNC INT Info_Mod_Kardif_Rum_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kardif_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Skip_Francis))
	&& (Npc_HasItems(hero, Mod_RumPaket) == 1)
	&& (Mod_KnowsRukharWacholder != 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_Rum_Info()
{
	AI_Output(hero, self, "Info_Mod_Kardif_Rum_15_00"); //I got a package of rum for you.
	
	B_GiveInvItems	(hero, self, Mod_RumPaket, 1);

	AI_Output(self, hero, "Info_Mod_Kardif_Rum_14_01"); //Finally, my customers have been waiting for the rum all along.
	AI_Output(self, hero, "Info_Mod_Kardif_Rum_14_02"); //Here's your gold.

	Npc_RemoveInvItems	(self, Mod_RumPaket, 1);

	CreateInvItems	(self, ItFo_Addon_Rum, 20);

	CreateInvItems	(self, ItMi_Gold, 500);
	B_GiveInvItems	(self, hero, ItMi_Gold, 500);
};

INSTANCE Info_Mod_Kardif_Melasse (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_Melasse_Condition;
	information	= Info_Mod_Kardif_Melasse_Info;
	permanent	= 0;
	important	= 0;
	description	= "You got any molasses?";
};

FUNC INT Info_Mod_Kardif_Melasse_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kardif_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Samuel_Auftrag))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Samuel_HabZeug))
	&& (Mod_KnowsRukharWacholder != 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_Melasse_Info()
{
	AI_Output(hero, self, "Info_Mod_Kardif_Melasse_15_00"); //You got any molasses?
	AI_Output(self, hero, "Info_Mod_Kardif_Melasse_14_01"); //Not any more. Yesterday a guy came in, bought everything.
	AI_Output(hero, self, "Info_Mod_Kardif_Melasse_15_02"); //Who was that?
	AI_Output(self, hero, "Info_Mod_Kardif_Melasse_14_03"); //He calls himself Alvro. Retreated to the forest outside the city.
	AI_Output(self, hero, "Info_Mod_Kardif_Melasse_14_04"); //He's said to be in a cave somewhere in there.

	B_LogEntry	(TOPIC_MOD_SAMUEL_RUM, "A certain Alvro bought the complete molasses supply from Kardif. It is said to be in a cave in the forest in front of the town of Khorinis.");
};

INSTANCE Info_Mod_Kardif_Zauberwasser (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_Zauberwasser_Condition;
	information	= Info_Mod_Kardif_Zauberwasser_Info;
	permanent	= 0;
	important	= 0;
	description	= "I've got a shipment of magic water.";
};

FUNC INT Info_Mod_Kardif_Zauberwasser_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kardif_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Constantino_Zauberwasser))
	&& (Npc_HasItems(hero, ItMi_Zauberwasser_MIS) > 7)
	&& (Mod_KnowsRukharWacholder != 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_Zauberwasser_Info()
{
	AI_Output(hero, self, "Info_Mod_Kardif_Zauberwasser_15_00"); //I've got a shipment of magic water.

	B_GiveInvItems	(hero, self, ItMi_Zauberwasser_MIS, 8);

	AI_Output(self, hero, "Info_Mod_Kardif_Zauberwasser_14_01"); //It's about time.
};

INSTANCE Info_Mod_Kardif_WoMoe (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_WoMoe_Condition;
	information	= Info_Mod_Kardif_WoMoe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Do you know where Moe is?";
};

FUNC INT Info_Mod_Kardif_WoMoe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kardif_Hi))
	&& (Mod_CantharQuest_Last == 1)
	&& (Mod_KnowsRukharWacholder != 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_WoMoe_Info()
{
	AI_Output(hero, self, "Info_Mod_Kardif_WoMoe_15_00"); //Do you know where Moe is?
	AI_Output(self, hero, "Info_Mod_Kardif_WoMoe_14_01"); //No, the kid's been missing for three days now. However, he hasn't been feeling very well lately, either... must be sick.
	AI_Output(hero, self, "Info_Mod_Kardif_WoMoe_15_02"); //He wasn't feeling well?
	AI_Output(self, hero, "Info_Mod_Kardif_WoMoe_14_03"); //Sah bedrückt aus, der Junge. Passte gar nicht zu ihm. Ein Mal hat er "dust particles" gesagt, völlig zusammenhangslos.
	AI_Output(hero, self, "Info_Mod_Kardif_WoMoe_15_04"); //Then I'll go find him.
	AI_Output(self, hero, "Info_Mod_Kardif_WoMoe_14_05"); //Do that. Maybe you can cheer him up enough to make him feel like coming back to work.
};

INSTANCE Info_Mod_Kardif_MoeTot (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_MoeTot_Condition;
	information	= Info_Mod_Kardif_MoeTot_Info;
	permanent	= 0;
	important	= 0;
	description	= "You can hire a new bouncer.";
};

FUNC INT Info_Mod_Kardif_MoeTot_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kardif_Hi))
	&& (Mod_CantharQuest_Last >= 2)
	&& (Mod_KnowsRukharWacholder != 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_MoeTot_Info()
{
	AI_Output(hero, self, "Info_Mod_Kardif_MoeTot_15_00"); //You can hire a new bouncer.
	AI_Output(self, hero, "Info_Mod_Kardif_MoeTot_14_01"); //Moe is...?
	AI_Output(hero, self, "Info_Mod_Kardif_MoeTot_15_02"); //Yeah.
	AI_Output(self, hero, "Info_Mod_Kardif_MoeTot_14_03"); //Oh. What the hell happened?
	AI_Output(hero, self, "Info_Mod_Kardif_MoeTot_15_04"); //Canthar had him killed.
	AI_Output(self, hero, "Info_Mod_Kardif_MoeTot_14_05"); //The guy's got to be dealt with. Wait, take this.

	B_GiveInvItems	(self, hero, ItFo_Addon_Rum, 1);

	AI_Output(self, hero, "Info_Mod_Kardif_MoeTot_14_06"); //To Moe, the best bouncer the whole fucking khorinis has ever seen!

	CreateInvItems	(self, ItFo_Addon_Rum, 2);

	B_UseItem	(self, ItFo_Addon_Rum);
	B_UseItem	(hero, ItFo_Addon_Rum);

	if (!Npc_KnowsInfo(hero, Info_Mod_Canthar_AtLager2))
	{
		AI_Output(self, hero, "Info_Mod_Kardif_MoeTot_14_07"); //Now go ahead and do the villain's job!
	};
};

INSTANCE Info_Mod_Kardif_Paddel (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_Paddel_Condition;
	information	= Info_Mod_Kardif_Paddel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Are you offering paddles?";
};

FUNC INT Info_Mod_Kardif_Paddel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kardif_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Garvell_Paddel))
	&& (Npc_KnowsInfo(hero, Info_Mod_Skip_Francis))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_Paddel_Info()
{
	AI_Output(hero, self, "Info_Mod_Kardif_Paddel_15_00"); //Are you offering paddles?
	AI_Output(self, hero, "Info_Mod_Kardif_Paddel_14_01"); //What makes you think that? I'm not dealing in remnants. Why don't you ask a fisherman?

	B_LogEntry	(TOPIC_MOD_SKIP_PADDEL, "Kardif has no paddles. He mentioned the fishermen... I should stop by Farim's.");
};

INSTANCE Info_Mod_Kardif_NagurFrei (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_NagurFrei_Condition;
	information	= Info_Mod_Kardif_NagurFrei_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Kardif_NagurFrei_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kardif_Hi))
	&& (Nagur_KillAkahasch == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_NagurFrei_Info()
{
	AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei_14_00"); //Hey, wait a minute. I have a message and a key for you here...

	B_ShowGivenThings	("Received message and key from Akahasch");

	CreateInvItems	(hero, ItKe_Akahasch, 1);
	CreateInvItems	(hero, ItWr_Akahasch, 1);

	AI_Output(hero, self, "Info_Mod_Kardif_NagurFrei_15_01"); //Who are these things from?
	AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei_14_02"); //A novice gave it to me.

	B_RemoveNpc	(Mod_4016_NOV_Akahasch_NW);
};

INSTANCE Info_Mod_Kardif_NagurFrei2 (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_NagurFrei2_Condition;
	information	= Info_Mod_Kardif_NagurFrei2_Info;
	permanent	= 0;
	important	= 0;
	description	= "So you pig helped me set a trap!";
};

FUNC INT Info_Mod_Kardif_NagurFrei2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Nagur_Rache))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_NagurFrei2_Info()
{
	AI_Output(hero, self, "Info_Mod_Kardif_NagurFrei2_15_00"); //So you pig helped me set a trap!
	AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei2_14_01"); //Hey, I don't know what you mean...
	AI_Output(hero, self, "Info_Mod_Kardif_NagurFrei2_15_02"); //The letter that was supposed to lure me into this cave....
	AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei2_14_03"); //Man-- they just gave me the things and told me to pass them on to you....
	AI_Output(hero, self, "Info_Mod_Kardif_NagurFrei2_15_04"); //You said a novice gave it to you...
	AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei2_14_05"); //Yeah, that's true, too. Such a dark novice.
	AI_Output(hero, self, "Info_Mod_Kardif_NagurFrei2_15_06"); //You knew it wasn't acahash... because he's dead.
	AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei2_14_07"); //But... but I couldn't have known what was going on. Hey, man, don't do anything stupid. I'm sure we can work something out...
	AI_Output(hero, self, "Info_Mod_Kardif_NagurFrei2_15_08"); //What do you think?
	AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei2_14_09"); //l-- as a host, I'm getting a lot of things. For example, I could tell you in which of the crates and barrels at the harbour you will find hot goods....

	Info_ClearChoices	(Info_Mod_Kardif_NagurFrei2);

	Info_AddChoice	(Info_Mod_Kardif_NagurFrei2, "Agreed.", Info_Mod_Kardif_NagurFrei2_B);
	Info_AddChoice	(Info_Mod_Kardif_NagurFrei2, "You'll go to jail for this.", Info_Mod_Kardif_NagurFrei2_A);
};

FUNC VOID Info_Mod_Kardif_NagurFrei2_B()
{
	AI_Output(hero, self, "Info_Mod_Kardif_NagurFrei2_B_15_00"); //Agreed.
	AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei2_B_14_01"); //(simplified) Whew... I knew we could work something out.

	Info_ClearChoices	(Info_Mod_Kardif_NagurFrei2);

	Nagur_KillAkahasch = 5;

	B_Göttergefallen(3, 1);
};

FUNC VOID Info_Mod_Kardif_NagurFrei2_A()
{
	AI_Output(hero, self, "Info_Mod_Kardif_NagurFrei2_A_15_00"); //You'll go to jail for this.
	AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei2_A_14_01"); //No... it's the end of me.

	Info_ClearChoices	(Info_Mod_Kardif_NagurFrei2);

	Nagur_KillAkahasch = 6;

	B_Göttergefallen(1, 1);
};

var int KardifInfos[14];

FUNC INT B_GetKardifInfoIndex()
{
	var int loop; loop = MEM_StackPos.position;

	var int rnd; rnd = r_max(13);

	if (MEM_ReadStatArr(KardifInfos, rnd) == 1)
	{
		MEM_StackPos.position = loop;
	};

	MEM_WriteStatArr(KardifInfos, rnd, 1);

	return rnd;
};

INSTANCE Info_Mod_Kardif_NagurFrei3 (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_NagurFrei3_Condition;
	information	= Info_Mod_Kardif_NagurFrei3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Where can I find hot products?";
};

FUNC INT Info_Mod_Kardif_NagurFrei3_Condition()
{
	if (Nagur_KillAkahasch == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_NagurFrei3_Info()
{
	AI_Output(hero, self, "Info_Mod_Kardif_NagurFrei3_15_00"); //Where can I find hot products?

	if (Mod_Kardif_Info < 2)
	&& (Mod_Kardif_InfoTruhe == 0)
	{
		var int nextIndex; nextIndex = B_GetKardifInfoIndex();

		var int ptr; ptr = MEM_SearchVobByName("KARDIFINFOTRUHE");

		var zCVob vob; vob = MEM_PtrToInst(ptr);

		AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_01"); //As far as I can tell, you should be in the....

		if (nextIndex == 0)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_02"); //... Boxes opposite Lehmar...

			vob.trafoObjToWorld[3] = mkf(3534);
			vob.trafoObjToWorld[7] = mkf(-154);
			vob.trafoObjToWorld[11] = mkf(-1211);
		}
		else if (nextIndex == 1)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_03"); //... Barrels behind the tavern....

			vob.trafoObjToWorld[3] = mkf(2581);
			vob.trafoObjToWorld[7] = mkf(-187);
			vob.trafoObjToWorld[11] = mkf(-1163);
		}
		else if (nextIndex == 2)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_04"); //... Boxes at the cartographer...

			vob.trafoObjToWorld[3] = mkf(1193);
			vob.trafoObjToWorld[7] = mkf(-86);
			vob.trafoObjToWorld[11] = mkf(572);
		}
		else if (nextIndex == 3)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_05"); //... Barrels at the shipbuilder...

			vob.trafoObjToWorld[3] = mkf(777);
			vob.trafoObjToWorld[7] = mkf(-190);
			vob.trafoObjToWorld[11] = mkf(883);
		}
		else if (nextIndex == 4)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_06"); //... Boxes at Alrik...

			vob.trafoObjToWorld[3] = mkf(3532);
			vob.trafoObjToWorld[7] = mkf(-188);
			vob.trafoObjToWorld[11] = mkf(3071);
		}
		else if (nextIndex == 5)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_07"); //... Barrels in the warehouse....

			vob.trafoObjToWorld[3] = mkf(2065);
			vob.trafoObjToWorld[7] = mkf(-189);
			vob.trafoObjToWorld[11] = mkf(2579);
		}
		else if (nextIndex == 6)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_08"); //... Boxes up in the warehouse...

			vob.trafoObjToWorld[3] = mkf(2790);
			vob.trafoObjToWorld[7] = mkf(109);
			vob.trafoObjToWorld[11] = mkf(2740);
		}
		else if (nextIndex == 7)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_09"); //... Boxes between warehouse and load crane....

			vob.trafoObjToWorld[3] = mkf(-289);
			vob.trafoObjToWorld[7] = mkf(-181);
			vob.trafoObjToWorld[11] = mkf(3551);
		}
		else if (nextIndex == 8)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_10"); //... Boxes by the tree over the warehouse....

			vob.trafoObjToWorld[3] = mkf(1138);
			vob.trafoObjToWorld[7] = mkf(299);
			vob.trafoObjToWorld[11] = mkf(3476);
		}
		else if (nextIndex == 9)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_11"); //... Barrels next to the red lantern...

			vob.trafoObjToWorld[3] = mkf(567);
			vob.trafoObjToWorld[7] = mkf(-192);
			vob.trafoObjToWorld[11] = mkf(-2433);
		}
		else if (nextIndex == 10)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_12"); //... Boxes next to the red lantern...

			vob.trafoObjToWorld[3] = mkf(1103);
			vob.trafoObjToWorld[7] = mkf(-194);
			vob.trafoObjToWorld[11] = mkf(-3766);
		}
		else if (nextIndex == 11)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_13"); //... Boxes opposite the shipbuilder...

			vob.trafoObjToWorld[3] = mkf(-142);
			vob.trafoObjToWorld[7] = mkf(-146);
			vob.trafoObjToWorld[11] = mkf(1253);
		}
		else if (nextIndex == 12)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_14"); //... Boxes next to dock for messenger...

			vob.trafoObjToWorld[3] = mkf(-1364);
			vob.trafoObjToWorld[7] = mkf(-82);
			vob.trafoObjToWorld[11] = mkf(-1676);
		}
		else if (nextIndex == 13)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_15"); //... Barrels at Diego's....

			vob.trafoObjToWorld[3] = mkf(-304);
			vob.trafoObjToWorld[7] = mkf(-173);
			vob.trafoObjToWorld[11] = mkf(-1182);
		};

		AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_16"); //... find something nice.

		Mob_CreateItems	("KARDIFINFOTRUHE", ItMi_Joint, r_max(9));
		Mob_CreateItems	("KARDIFINFOTRUHE", ItFo_Booze, r_max(9));
		Mob_CreateItems	("KARDIFINFOTRUHE", ItFo_Wine, r_max(9));
		Mob_CreateItems	("KARDIFINFOTRUHE", ItFo_Beer, r_max(9));
		Mob_CreateItems	("KARDIFINFOTRUHE", ItPo_Tiergift, r_max(3));
		Mob_CreateItems	("KARDIFINFOTRUHE", ItPo_Pflanzengift, r_max(3));

		VobPositionUpdated(ptr);

		Mod_Kardif_InfoTruhe = 1;
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_17"); //Right now, I don't know anything else. Ask again in a few days....
	};
};

INSTANCE Info_Mod_Kardif_Trade (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_Trade_Condition;
	information	= Info_Mod_Kardif_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Kardif_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kardif_Hi))
	&& (Mod_KnowsRukharWacholder < 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Kardif_Pickpocket (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_Pickpocket_Condition;
	information	= Info_Mod_Kardif_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Kardif_Pickpocket_Condition()
{
	C_Beklauen	(65, ItFo_Beer, 4);
};

FUNC VOID Info_Mod_Kardif_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Kardif_Pickpocket);

	Info_AddChoice	(Info_Mod_Kardif_Pickpocket, DIALOG_BACK, Info_Mod_Kardif_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Kardif_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Kardif_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Kardif_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Kardif_Pickpocket);
};

FUNC VOID Info_Mod_Kardif_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Kardif_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Kardif_Pickpocket);

		Info_AddChoice	(Info_Mod_Kardif_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Kardif_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Kardif_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Kardif_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Kardif_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Kardif_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Kardif_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Kardif_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Kardif_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Kardif_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Kardif_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Kardif_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Kardif_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Kardif_EXIT (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_EXIT_Condition;
	information	= Info_Mod_Kardif_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Kardif_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Kardif_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
