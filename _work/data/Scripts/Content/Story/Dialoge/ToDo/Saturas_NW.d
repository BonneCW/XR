INSTANCE Info_Mod_Saturas_NW_Hi (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Hi_Condition;
	information	= Info_Mod_Saturas_NW_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_NW_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Saturas_NW_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Hi_14_00"); //What are you doing here? Wait a minute... you!?

	B_ReadySpell	(self, SPL_Icecube, SPL_Cost_IceCube);

	AI_Output(hero, self, "Info_Mod_Saturas_NW_Hi_15_01"); //Uh, I--
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Hi_14_02"); //After what you've achieved in the new camp, do you really dare to come here?!
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Hi_14_03"); //Be glad that Milten has vouched for you and that you are a confidant of Xardas, the highest priest of Beliar.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Hi_14_04"); //And would the circumstances of the fall of the barrier for us not lie in the dark and therefore your influence on it not completely exclude,...
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Hi_14_05"); //... you should freeze to ice and be blown to pieces by lightning.

	AI_RemoveWeapon	(self);

	AI_Output(self, hero, "Info_Mod_Saturas_NW_Hi_14_06"); //So from now on, take good care of what you're doing!
};

INSTANCE Info_Mod_Saturas_NW_Soeldner (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Soeldner_Condition;
	information	= Info_Mod_Saturas_NW_Soeldner_Info;
	permanent	= 0;
	important	= 0;
	description	= "I'm with the mercenaries.";
};

FUNC INT Info_Mod_Saturas_NW_Soeldner_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_NW_Hi))
	&& (Mod_Gilde == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Soeldner_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Soeldner_15_00"); //I'm with the mercenaries.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Soeldner_14_01"); //Then take a good look around, but don't do anything stupid.
};

INSTANCE Info_Mod_Saturas_NW_RDW (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_RDW_Condition;
	information	= Info_Mod_Saturas_NW_RDW_Info;
	permanent	= 0;
	important	= 0;
	description	= "I belong to the Ring of Water.";
};

FUNC INT Info_Mod_Saturas_NW_RDW_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_NW_Hi))
	&& (Mod_Gilde == 9)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_RDW_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_NW_RDW_15_00"); //I belong to the Ring of Water.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_RDW_14_01"); //So you joined us. I hope you're not fooling around.
};

INSTANCE Info_Mod_Saturas_NW_Brief (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Brief_Condition;
	information	= Info_Mod_Saturas_NW_Brief_Info;
	permanent	= 0;
	important	= 0;
	description	= "I got a letter for you from Xardas.";
};

FUNC INT Info_Mod_Saturas_NW_Brief_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_NW_Hi))
	&& (Mod_PortalLance == TRUE)
	&& (Npc_HasItems(hero, XardasLetterForSaturas_Geoeffnet) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Brief_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Brief_15_00"); //I got a letter from Xardas for you.

	B_GiveInvItems	(hero, self, XardasLetterForSaturas_Geoeffnet, 1);

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Saturas_NW_Brief_14_01"); //Very interesting. Well, you can stay here, but if you make mischief, I will kill you.
};

INSTANCE Info_Mod_Saturas_NW_Portal (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Portal_Condition;
	information	= Info_Mod_Saturas_NW_Portal_Info;
	permanent	= 0;
	important	= 0;
	description	= "I heard about a portal.";
};

FUNC INT Info_Mod_Saturas_NW_Portal_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_InGilde))
	&& (Mod_PortalLance == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Portal_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Portal_15_00"); //I heard about a portal.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Portal_14_01"); //That's right, we found a portal during our excavations.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Portal_14_02"); //However, it's locked and we haven't found a way to open it yet.

	Log_CreateTopic	(TOPIC_MOD_PORTAL, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_PORTAL, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_PORTAL, "Saturas has confirmed the rumor about a portal and said that they have not yet found a way to open the portal.");
};

INSTANCE Info_Mod_Saturas_NW_DurchsPortal (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_DurchsPortal_Condition;
	information	= Info_Mod_Saturas_NW_DurchsPortal_Info;
	permanent	= 0;
	important	= 0;
	description	= "Can I go through the portal when it is open?";
};

FUNC INT Info_Mod_Saturas_NW_DurchsPortal_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_NW_Portal))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_DurchsPortal_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_NW_DurchsPortal_15_00"); //Can I go through the portal when it is open?
	AI_Output(self, hero, "Info_Mod_Saturas_NW_DurchsPortal_14_01"); //You can come with me, but you should be careful. We don't know what awaits us there.

	B_LogEntry	(TOPIC_MOD_PORTAL, "Saturas allowed me to go through the portal as soon as it was opened.");
};

INSTANCE Info_Mod_Saturas_NW_WieOeffnen (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_WieOeffnen_Condition;
	information	= Info_Mod_Saturas_NW_WieOeffnen_Info;
	permanent	= 0;
	important	= 0;
	description	= "What can we do to open the gate?";
};

FUNC INT Info_Mod_Saturas_NW_WieOeffnen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_NW_Portal))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_WieOeffnen_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_NW_WieOeffnen_15_00"); //What can we do to open the gate?
	AI_Output(self, hero, "Info_Mod_Saturas_NW_WieOeffnen_14_01"); //Go to Nefarius, he's about to translate the inscriptions on the walls.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_WieOeffnen_14_02"); //Maybe he's come up with something new by now.

	B_LogEntry	(TOPIC_MOD_PORTAL, "Saturas sent me to Nefarius. I'm supposed to check with him to see if there's anything new.");
};

INSTANCE Info_Mod_Saturas_NW_Argez (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Argez_Condition;
	information	= Info_Mod_Saturas_NW_Argez_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_NW_Argez_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_NW_WieOeffnen))
	&& (Mod_Argez == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Argez_Info()
{
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_00"); //Ah, there's one more thing you can help us with.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez_15_01"); //For disappointing you so badly, you've got a lot of work to do for me now.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_02"); //Consider it restitution.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_03"); //But let's get to the point: A severe magical anomaly recently occurred outside the walls of Khorini's city walls.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_04"); //It was so strong that the mightiest of the magicians were haunted by sudden visions.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez_15_05"); //What triggered this anomaly?
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_06"); //Finding out will be your job. But I fear the worst.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_07"); //The kind of magic felt like.... even though I've never felt anything like it before.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_08"); //Together with the intensity, I suspect that at that time one of our strongest enemies was just outside the city.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_09"); //If it were true, the people there would no longer be safe.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez_15_10"); //How do you know the anomaly occurred outside the walls of Khorinis?
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_11"); //I was one of those surprised by the vision.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_12"); //It was too vague to be able to locate them precisely, but I clearly recognized the city walls only a few metres away.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_13"); //You need to find out who or what caused this anomaly!
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez_15_14"); //(ironic) No problem. Guess I'll just ask around who's been using black magic there lately.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_15"); //A little more serious, please.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_16"); //There's a simple means of detecting magical anomalies. I found it in this temple.

	B_GiveInvItems	(self, hero, ItAm_Anomalie, 1);

	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_17"); //I want the amulet back, so don't sell it and take care of it!
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_18"); //To use it, all you have to do is put it on. As soon as you approach the location where the anomaly was triggered, you will receive a vision of the process.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_19"); //This is hopefully more explicit than the ones we have experienced.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez_15_20"); //No problem. So I just walk this thing around the city walls of Khorinis?
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez_14_21"); //That should do it, yes. The sooner you take care of it, the better.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez_15_22"); //Roger that.

	Log_CreateTopic	(TOPIC_MOD_DUNKLEMAGIE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_DUNKLEMAGIE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_DUNKLEMAGIE, "Somewhere outside the walls of Khorinis there has been a severe magical anomaly. Satan told me to leave the city walls from the outside. To locate the anomaly, I have to wear the Invisible Man's amulet. As soon as I'm in the right place, it will make sure that I can take a quick look at the past.");
};

INSTANCE Info_Mod_Saturas_NW_Argez2 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Argez2_Condition;
	information	= Info_Mod_Saturas_NW_Argez2_Info;
	permanent	= 0;
	important	= 0;
	description	= "I found out who's responsible for the anomaly.";
};

FUNC INT Info_Mod_Saturas_NW_Argez2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_NW_Argez))
	&& (Mod_Argez == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Argez2_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez2_15_00"); //I found out who's responsible for the anomaly.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez2_14_01"); //Is that so? Who is it?
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez2_15_02"); //His name is Argez. I met him in front of Khorinis and helped him get into town.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez2_15_03"); //The anomaly was suddenly replaced by a zombie that attacked us and he defended us with this spell.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez2_14_04"); //You helped him into town?
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez2_15_05"); //He pretended to have lost his memory. I saw nothing evil in him, on the contrary.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez2_14_06"); //Hmm, a suspicious personality once and for all.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez2_14_07"); //Do you think you can bring him to me? I'd love to talk to him.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez2_15_08"); //I don't think that would be a problem.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez2_14_09"); //Very good. Very good. To save you and him a long way back, I made this scroll.

	B_GiveInvItems	(self, hero, ItSc_ArgezToSaturas, 1);

	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez2_14_10"); //Use it when you get him to come with you.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez2_14_11"); //Oh, before you go, I'd like my amulet back.

	if (Npc_HasItems(hero, ItAm_Anomalie) == 1)
	{
		AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez2_15_12"); //Here it is here.

		B_GiveInvItems	(hero, self, ItAm_Anomalie, 1);

		AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez2_14_13"); //Thanks. See you later.

		B_GivePlayerXP	(250);

		Mod_AnomalieAmulett = 0;
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez2_15_14"); //Sorry, I don't have it anymore.
		AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez2_14_15"); //By Beliar, how could I trust you? You can be sure this was the last time!

		B_GivePlayerXP	(200);
	};

	B_SetTopicStatus	(TOPIC_MOD_DUNKLEMAGIE, LOG_SUCCESS);

	B_LogEntry	(TOPIC_MOD_ARGEZ, "Saturnas wants to go after Argez because of the anomaly. I'm to ask him to see the Water Magician.");
};

INSTANCE Info_Mod_Saturas_NW_Argez3 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Argez3_Condition;
	information	= Info_Mod_Saturas_NW_Argez3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_NW_Argez3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Argez_NW_LosZuSaturas))
	&& (Npc_GetDistToNpc(PC_Friend_NW, hero) < 1500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Argez3_Info()
{
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez3_14_00"); //It's you again. But you bring this Argez.

	B_GivePlayerXP	(100);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TALKWITHARGEZ");
	B_StartOtherRoutine	(PC_Friend_NW, "ATSATURAS");

	B_SetTopicStatus	(TOPIC_MOD_ARGEZ, LOG_SUCCESS);
};

INSTANCE Info_Mod_Saturas_NW_Argez4 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Argez4_Condition;
	information	= Info_Mod_Saturas_NW_Argez4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_NW_Argez4_Condition()
{
	if (Mod_Argez == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Argez4_Info()
{
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Argez4_14_00"); //Nefarius asked for you. He said you might be able to help him.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Argez4_15_01"); //I'll go see him sometime.
};

INSTANCE Info_Mod_Saturas_NW_Gefangen (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Gefangen_Condition;
	information	= Info_Mod_Saturas_NW_Gefangen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Everything all right?";
};

FUNC INT Info_Mod_Saturas_NW_Gefangen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Riordian_TempelDicht4))
	&& (Npc_IsDead(GardeInnos_4098_Danae))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Gefangen_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Gefangen_15_00"); //Are you all right?
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Gefangen_14_01"); //Yeah, it's okay. Thank you for saving us. We are deeply indebted to you.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Gefangen_15_02"); //What about the guard Innos?
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Gefangen_14_03"); //When they overpowered us, four of the guards went through the portal to retrieve a powerful weapon.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Gefangen_15_04"); //How long ago was that?
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Gefangen_14_05"); //About two hours.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Gefangen_15_06"); //I must stop the guards before they retrieve the sword.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Gefangen_14_07"); //Then you better hurry, because the guardsmen were well organized.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Gefangen_15_08"); //I'm going to ducrh the portal immediately.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Gefangen_14_09"); //Good luck to you.
};

INSTANCE Info_Mod_Saturas_NW_Goetter (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Goetter_Condition;
	information	= Info_Mod_Saturas_NW_Goetter_Info;
	permanent	= 0;
	important	= 0;
	description	= "What do you know about the gods' weapons?";
};

FUNC INT Info_Mod_Saturas_NW_Goetter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_NW_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_UrizielKaputt))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Goetter_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Goetter_15_00"); //What do you know about the gods' weapons?
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Goetter_14_01"); //According to the old traditions, there are supposed to be three of these artifacts. One for each God.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Goetter_14_02"); //These weapons are said to have been distributed to the three territories of Khorinis. This part, the Minental and Jharkendar.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Goetter_14_03"); //We haven't done much research on Jharkendar yet, but the inscriptions mention a temple of Adanos. I'm sure you'll find one of those weapons there.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Goetter_14_04"); //The other weapon is probably the Sacred Hammer of Fire Magicians. Fortunately, this is already in our possession.

	B_LogEntry	(TOPIC_MOD_URIZIEL, "Each of the gods' weapons belongs to a god. I already have the weapon Beliars in my possession. The weapon Innos' is the holy hammer of fire magicians. And the weapon Adanos' is said to be found in Jharkendar in a temple of Adanos'.");
};

INSTANCE Info_Mod_Saturas_AW_Member_08 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_08_Condition;
	information	= Info_Mod_Saturas_AW_Member_08_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_AW_Member_08_Condition()
{
	if (Mod_WM_Boeden == 11)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_08_Info()
{
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_14_00"); //I feel a strong vibration of the balance of power and am plagued by bad premonitions.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_14_01"); //Please make your way and try to find out what happened on the pasture plateau and the surrounding area.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_14_02"); //And be sure to check around in the tavern as well, there will certainly be information there.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_14_03"); //But before you embark on this further mission, it seems to me to be the right time to welcome you into our ranks.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_14_04"); //You have done much for our fellowship and you have proven yourself worthy to become a magician of water.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_14_05"); //It should also help you to pass your further examinations in the sense of Adano.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_14_06"); //Of course, you are free to choose the path of the water warrior to fight with magic and sword...

	Mod_WM_Boeden = 12;

	Log_CreateTopic	(TOPIC_MOD_ADANOS_UNHEIL, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ADANOS_UNHEIL, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Satan is plagued by dark premonitions. I'm to explore the pasture plateau and the surrounding area to find out what happened. There may also be information in the tavern.");

	Info_ClearChoices	(Info_Mod_Saturas_AW_Member_08);

	Info_AddChoice	(Info_Mod_Saturas_AW_Member_08, "I choose the way of the warrior.", Info_Mod_Saturas_AW_Member_08_B);
	Info_AddChoice	(Info_Mod_Saturas_AW_Member_08, "I choose the way of the magicians.", Info_Mod_Saturas_AW_Member_08_A);
};

FUNC VOID Info_Mod_Saturas_AW_Member_08_B()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_08_B_15_00"); //I choose the way of the warrior.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_B_14_01"); //If that is your wish, contact Ethan. He will take the next steps with you.

	Info_ClearChoices	(Info_Mod_Saturas_AW_Member_08);
};

FUNC VOID Info_Mod_Saturas_AW_Member_08_A()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_08_A_15_00"); //I choose the way of the magicians.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_A_14_01"); //So be it. Then bear witness to your affection for water and say the words of the oath:
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_A_14_02"); //I swear by the powers of the gods... and the power of holy water....
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_08_A_15_03"); //I swear by the powers of the gods... and the power of holy water....
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_A_14_04"); //... that my knowledge and actions will be connected to the water from now on and forever...
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_08_A_15_05"); //... that my knowledge and actions will be connected to the water from now on and forever...
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_A_14_06"); //... and the fountain of life.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_08_A_15_07"); //... and the fountain of life.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_A_14_08"); //It is done. From now on, you will serve as a magician of the water of our community and follow Adano's will.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_A_14_09"); //Here, I give you your robe of water and the wand of a magician.

	CreateInvItems	(self, ItAr_KDW_L_Addon, 1);
	B_GiveInvItems	(self, hero, ItAr_KDW_L_Addon, 1);
	CreateInvItems	(hero, ItMW_Addon_Stab03, 1);

	Snd_Play ("LEVELUP");

	B_GivePlayerXP	(1000);

	B_Göttergefallen(2, 5);

	Mod_Gilde = 10;

	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_08_A_14_10"); //May Adanos guide you at all times and show you the right way to keep your balance.

	Info_ClearChoices	(Info_Mod_Saturas_AW_Member_08);
};

INSTANCE Info_Mod_Saturas_AW_Member_09 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_09_Condition;
	information	= Info_Mod_Saturas_AW_Member_09_Info;
	permanent	= 0;
	important	= 0;
	description	= "The dead rise from their graves.";
};

FUNC INT Info_Mod_Saturas_AW_Member_09_Condition()
{
	if (Mod_WM_Boeden == 12)
	&& (Mod_WM_SawGraveOne == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_09_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_09_15_00"); //The dead rise from their graves. Among them, creatures seem to move that lead them.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_09_14_01"); //What are you saying?! What evil demons are they doing? Try to find out more. We do research in the writings.

	Mod_WM_DaySave = Wld_GetDay();

	Npc_SetRefuseTalk	(self, 360);

	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_10))
	{
		Mod_WM_Boeden = 13;

		Wld_InsertItem	(ItMi_EffektMarker2, "FP_ITEM_ELENASTRUHE");

		Wld_InsertNpc	(Mod_7198_HEX_AttraktiveFrau_NW, "TAVERNE");
	};
};

INSTANCE Info_Mod_Saturas_AW_Member_10 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_10_Condition;
	information	= Info_Mod_Saturas_AW_Member_10_Info;
	permanent	= 0;
	important	= 0;
	description	= "On the pasture plateau are gigantic creatures (...) )";
};

FUNC INT Info_Mod_Saturas_AW_Member_10_Condition()
{
	if (Mod_WM_Boeden == 12)
	&& (Mod_WM_SawBigOne == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_10_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_10_15_00"); //On the pasture plateau are gigantic creatures surrounded by hordes of smaller demonic creatures that seem to be subdued.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_10_14_01"); //For Adano's sake! What you're reporting is extremely disturbing. Because also these creatures will probably have their master....
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_10_14_02"); //Try listening on the farms around the plateau. We really need more clues.

	Mod_WM_DaySave = Wld_GetDay();

	Npc_SetRefuseTalk	(self, 360);

	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_09))
	{
		Mod_WM_Boeden = 13;

		Wld_InsertItem	(ItMi_EffektMarker2, "FP_ITEM_ELENASTRUHE");

		Wld_InsertNpc	(Mod_7198_HEX_AttraktiveFrau_NW, "TAVERNE");
	};
};

INSTANCE Info_Mod_Saturas_AW_Member_11 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_11_Condition;
	information	= Info_Mod_Saturas_AW_Member_11_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_AW_Member_11_Condition()
{
	if (Mod_WM_Boeden == 13)
	&& (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_09))
	&& (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_10))
	&& ((Wld_GetDay() > Mod_WM_DaySave)
	|| (Npc_RefuseTalk(self) == FALSE))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_11_Info()
{
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_11_14_00"); //In our investigations, we found something very disturbing. It had surprised me already during the cleaning of the floors that so few creatures arose.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_11_14_01"); //It seems as if a power unknown to us so far, both the magic of Beliar and - and this would explain the strength of these creatures - the power of Inno have taken hold, united and used it for this abominable work.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_11_15_02"); //What should we do now?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_11_14_03"); //As mentioned above, these creatures have their masters as well, who called them here.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_11_14_04"); //In order to exercise control over such powerful creatures, the creators should not move too far away from them.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_11_14_05"); //Listen and take a close look around the pasture plateau and farms. There must be some sort of clue.

	Mod_WM_Boeden = 14;
};

INSTANCE Info_Mod_Saturas_AW_Member_12 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_12_Condition;
	information	= Info_Mod_Saturas_AW_Member_12_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_AW_Member_12_Condition()
{
	if (Mod_WM_Verflucht == 1)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_12_Info()
{
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_12_14_00"); //You don't look so good. There seems to be a black shadow on top of you.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_12_14_01"); //First go to the monastery, get yourself healed at Pyrokar and then come back to me to tell me what had happened.

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Saturas_AW_HexenTalk()
{
	AI_Output(self, hero, "Info_Mod_Saturas_AW_HexenTalk_14_00"); //Well, they're magically gifted women associated with the dark powers.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_HexenTalk_14_01"); //In contrast to ordinary demon magicians, who only use the power of their god Beliar, they are much more strongly connected to the demonic spheres.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_HexenTalk_14_02"); //They have left the existence of ordinary people behind them and entered into a firm, lasting bond with demonic powers.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_HexenTalk_14_03"); //The degree of this connection depends on the respective witch clan.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_HexenTalk_15_04"); //There are several clans?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_HexenTalk_14_05"); //Yes, some sources report on it.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_HexenTalk_14_06"); //While some only occasionally use the metamorphosis spell to transform their human form, or to inflict damage on animals, others spend much of their existence in a form that does not correspond to the human form.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_HexenTalk_14_07"); //What they all have in common, however, is that for a long time they can live undetectedly among normal people, influence them, exercise almost complete control over them for a short time, and cast damage spells in their surroundings.

	Mod_WM_Hexeninfos = 2;

	B_StartOtherRoutine	(Mod_7198_HEX_AttraktiveFrau_NW, "TOT");
};

INSTANCE Info_Mod_Saturas_AW_Member_13 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_13_Condition;
	information	= Info_Mod_Saturas_AW_Member_13_Info;
	permanent	= 0;
	important	= 0;
	description	= "I found out something.";
};

FUNC INT Info_Mod_Saturas_AW_Member_13_Condition()
{
	if (Mod_WM_Hexeninfos == 1)
	&& (Mod_WM_Verflucht == 0)
	&& (Mod_GenugBauernHinweise == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_13_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_13_15_00"); //I found out something.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_13_14_01"); //Yes? Reports.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_13_15_02"); //On Khorinis there seem to be women who are powerful of dark magic. I think they're witches. At least that's what Pyrokar meant...
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_13_14_03"); //Witches?! To khorinis?! That is very disturbing indeed.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_13_15_04"); //What kind of creatures are they exactly?

	Info_Mod_Saturas_AW_HexenTalk();

	B_GivePlayerXP	(250);
};

INSTANCE Info_Mod_Saturas_AW_Member_14 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_14_Condition;
	information	= Info_Mod_Saturas_AW_Member_14_Info;
	permanent	= 0;
	important	= 0;
	description	= "Could they be responsible for the recent disaster?";
};

FUNC INT Info_Mod_Saturas_AW_Member_14_Condition()
{
	if (Mod_WM_Hexeninfos == 2)
	&& (Mod_WM_HexenTot == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_14_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_14_15_00"); //Could they be responsible for the recent disaster?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_14_14_01"); //Hmm, hard to determine. On the one hand, they are masters at controlling other beings.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_14_14_02"); //But that they should also be able to create creatures of such power? i don't know.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_14_14_03"); //It would be very unusual in all circumstances, as they control the spherical manifestation in features, but normally within narrow limits.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_14_14_04"); //You need to keep investigating. There must still be some things that have remained hidden from us so far.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_14_14_05"); //However, if you run into the witches it would certainly not be a disadvantage to put an end to their activities.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_14_14_06"); //But beware. They are powerful magical beings.

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Saturas wasn't sure if the witches were responsible for the recent disaster. He refused to put an end to their existence, however, if I tracked them down.");
};

INSTANCE Info_Mod_Saturas_AW_Member_15 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_15_Condition;
	information	= Info_Mod_Saturas_AW_Member_15_Info;
	permanent	= 0;
	important	= 0;
	description	= "I have new information.";
};

FUNC INT Info_Mod_Saturas_AW_Member_15_Condition()
{
	if (Mod_WM_Hexeninfos == 1)
	&& (Mod_WM_Verflucht == 0)
	&& (Mod_GenugBauernHinweise == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_15_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_15_15_00"); //I have new information. Quite a lot of unusual things have happened on the farms lately.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_15_14_01"); //Yes? Reports.

	if (Npc_KnowsInfo(hero, Info_Mod_Rosi_Unheil))
	{
		AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_15_15_02"); //Rosi has complained about unfavourable weather conditions and hailstorms since the beginning of the season.
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Babera_Unheil))
	{
		AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_15_15_03"); //Babera has had severe back pain for some time.
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Balthasar_Unheil))
	{
		AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_15_15_04"); //Balthazar's sheep are lame.
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Bobo_Unheil))
	{
		AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_15_15_05"); //Bobo told me that a herd of black wolves has been living near the farm for some time.
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Gunnar_Unheil))
	{
		AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_15_15_06"); //Gunnar reported hail showers, acidic sheep's milk and health problems on the farm this season.
	};

	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_15_14_07"); //In fact, this accumulation of such events is very suspicious. Suspect for witchcraft.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_15_15_08"); //Witches?! What kind of creatures are they exactly?

	Info_Mod_Saturas_AW_HexenTalk();

	B_GivePlayerXP	(250);
};

INSTANCE Info_Mod_Saturas_AW_Member_16 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_16_Condition;
	information	= Info_Mod_Saturas_AW_Member_16_Info;
	permanent	= 0;
	important	= 0;
	description	= "I found this strange part of the saying.";
};

FUNC INT Info_Mod_Saturas_AW_Member_16_Condition()
{
	if (Mod_HasBerserkScroll == 1)
	&& (Npc_HasItems(hero, ItSc_AuraBerserker) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_16_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_16_15_00"); //I found this weird part of the saying.

	B_GiveInvItems	(hero, self, ItSc_AuraBerserker, 1);

	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_16_14_01"); //Let me have a look. Hmm, I'm not familiar with those kind of roles. But... for a moment...
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_16_14_02"); //The characters on it seem to correspond to those of the old culture.

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_16_14_03"); //Incredible.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_16_15_04"); //Yeah, what is it?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_16_14_05"); //If I am not misled, it is a role of the lost culture that can be used to cast a powerful Aura spell.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_16_14_06"); //It could greatly increase our fighting power....

	B_GivePlayerXP	(300);
};

INSTANCE Info_Mod_Saturas_AW_Member_17 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_17_Condition;
	information	= Info_Mod_Saturas_AW_Member_17_Info;
	permanent	= 0;
	important	= 0;
	description	= "I found these roles here.";
};

FUNC INT Info_Mod_Saturas_AW_Member_17_Condition()
{
	if (Mod_HasHexenScroll == 1)
	&& (Npc_HasItems(hero, ItSc_Verfluchen) > 0)
	&& (Npc_HasItems(hero, ItSc_TrfWoman) > 0)
	&& (Npc_HasItems(hero, ItSc_TrfWomanBack) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_17_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_17_15_00"); //I found these roles here.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_17_14_01"); //Let me see...

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_17_14_02"); //Hmm, interesting.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_17_15_03"); //What about it?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_17_14_04"); //They are typical witch roles, damage spells and transformation spells.

	if (Mod_WM_Hexeninfos < 2)
	{
		AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_17_14_05"); //So it's clear that witches are in the area.
		AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_17_15_06"); //Witches?! What kind of creatures are they exactly?
	
		Info_Mod_Saturas_AW_HexenTalk();

		B_GivePlayerXP	(250);
	};
};

INSTANCE Info_Mod_Saturas_AW_Member_18 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_18_Condition;
	information	= Info_Mod_Saturas_AW_Member_18_Info;
	permanent	= 0;
	important	= 0;
	description	= "Is there any way I can apply the metamorphosis?";
};

FUNC INT Info_Mod_Saturas_AW_Member_18_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_17))
	&& (Npc_HasItems(hero, ItSc_TrfWoman) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_18_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_18_15_00"); //Is there any way I can apply the metamorphosis?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_18_14_01"); //You apply?! I can't say what would happen if you applied the metamorphosis spell to yourself.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_18_14_02"); //You would have to modify the process of the application first, because it is especially tailored to female users.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_18_15_03"); //It would give me an edge over witches.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_18_14_04"); //Very well. Actually, you should be able to apply the effect to yourself by using a rune blank to transfer the spell to you.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_18_14_05"); //I just hope you're not doing anything stupid.
};

INSTANCE Info_Mod_Saturas_AW_Member_19 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_19_Condition;
	information	= Info_Mod_Saturas_AW_Member_19_Info;
	permanent	= 0;
	important	= 0;
	description	= "I could defeat the witches.";
};

FUNC INT Info_Mod_Saturas_AW_Member_19_Condition()
{
	if (Mod_WM_HexenTot == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_19_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_19_15_00"); //I could defeat the witches.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_19_14_01"); //That's good, one less worry. My spies told me that the creatures have scattered - except for the ones near Orlan - but have lost almost nothing in power.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_19_14_02"); //Thus it is clear that the witches only controlled the beings, but their actual creators still exist. Try to find out more.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_19_14_03"); //That you got rid of the witches might have lured the creators of the creatures a little bit out of their cover.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_19_14_04"); //So look around for clues.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_19_14_05"); //Maybe you will be able to find something near the creatures at Orlan's, as they remain unchanged where they were.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_19_14_06"); //You have to find the authors. If you don't succeed, we would probably all be doomed to doom, because only the power of long lost divine artifacts would be able to stop these monsters.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_19_15_07"); //Divine artifacts?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_19_14_08"); //Yes, objects of ancient power. One of them was the crystal of absorption, which was able to contain energies that have been released and which provide these beings with their power.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_19_14_09"); //There are said to have been other artifacts, as well as spells on Khornins, which were said to have been able to provide the carrier or magician with great power by creating an overpowering aura, or even giving a portion of divine power.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_19_14_10"); //But these objects, as well as the knowledge of magic, have long been considered lost.

	Mod_WM_ArtefaktSammler = 1;

	B_GivePlayerXP	(600);

	if (Npc_KnowsInfo(hero, Info_Mod_Albert_Amulett))
	{
		B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Hmm, maybe the extension's amulet will help us in our fight against the beasts.");
	};

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "The witches do not seem to have been the actual creature's creatures, but only to have exerted control over them, since the creatures have scattered after their demise, except for Orlan. So I might be able to find further information there. Saturas said that after the destruction of the witches I should now have a better chance to find the root of the evil.");
};

INSTANCE Info_Mod_Saturas_AW_Member_20 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_20_Condition;
	information	= Info_Mod_Saturas_AW_Member_20_Info;
	permanent	= 0;
	important	= 0;
	description	= "I have learned that the so-called blood cult (.... )";
};

FUNC INT Info_Mod_Saturas_AW_Member_20_Condition()
{
	if (Mod_WM_Blutkultinfos == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_20_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_20_15_00"); //I have learned that the so-called blood cult should be responsible for the appearance of these beings.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_01"); //By Adanos, the blood cult.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_20_15_02"); //What is the blood cult, exactly?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_03"); //That cannot be said in a few words. It is an ancient brotherhood that seems to exist for almost as long as the gods themselves.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_04"); //When Innos, Adanos and Beliar entered the world, she chose and created each deputy who was to act in their will, but possessed their own minds and will.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_05"); //But these too - endowed with great power - again chose servants, so that over the centuries whole networks of relationships of different creatures developed.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_06"); //Some of them were also not satisfied with the means given to them by their deity and began to use the power of the other gods.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_07"); //Others began to follow their own interests. The blood cult, however, it seems, has never stood in any kind of relationship with any of the three deities.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_20_15_08"); //Then where do they get their power from?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_09"); //They are parasitic creatures who do not serve God and can absorb and bundle any energy released.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_10"); //They seem to be related to creatures called vampires, but they absorb all the energy of dead beings.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_20_15_11"); //How is it possible that they remained undiscovered for so long?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_12"); //They can rest hidden under the earth for decades until they perceive a shock of equilibrium and see their chance come.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_13"); //They always strive for a disturbance of this equilibrium, because no matter whether Innos or Beliar triumphs, many creatures will always be destroyed as a result of this, which makes their power grow.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_14"); //They are thus our natural adversaries and would attack you immediately if they recognized you as Adanos' servant.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_15"); //The creatures they now sent out, endowed with the power of both deities, Innos and Beliar, we will not easily be able to banish.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_20_14_16"); //You must, if possible, find the root of the evil, the blood cult, and destroy them all.

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Saturas has confirmed that the blood cult is probably responsible for the appearance of the creatures. I'm supposed to track down and destroy his followers.");

	Info_ClearChoices	(Info_Mod_Saturas_AW_Member_20);

	Info_AddChoice	(Info_Mod_Saturas_AW_Member_20, "I'll be on my way to get rid of the fiends.", Info_Mod_Saturas_AW_Member_20_A);
};

FUNC VOID Info_Mod_Saturas_AW_Member_20_A()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_20_A_15_00"); //I'll be on my way to get rid of the fiends.

	Info_ClearChoices	(Info_Mod_Saturas_AW_Member_20);
};

INSTANCE Info_Mod_Saturas_AW_Member_21 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_21_Condition;
	information	= Info_Mod_Saturas_AW_Member_21_Info;
	permanent	= 0;
	important	= 0;
	description	= "Can't the power of the crystal be restored?";
};

FUNC INT Info_Mod_Saturas_AW_Member_21_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_19))
	&& (Mod_WM_ArtefaktSammler == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Cronos_AW_Artefakt_03))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_21_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_21_15_00"); //Can't the power of the crystal be restored?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_21_14_01"); //I'm afraid we're short of resources. Only a divine messenger would be able to do so.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_21_14_02"); //Check with Cronos about this. He can tell you more about it.

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "I have heard from Saturas that the crystal of absorption would be able to curb the power of creatures if you would give it back its power. Cronos can tell me more about it.");
};

INSTANCE Info_Mod_Saturas_AW_Member_22 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_22_Condition;
	information	= Info_Mod_Saturas_AW_Member_22_Info;
	permanent	= 0;
	important	= 0;
	description	= "I have this amulet here.";
};

FUNC INT Info_Mod_Saturas_AW_Member_22_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_21))
	&& (Mod_WM_ArtefaktSammler == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Albert_Hexen))
	&& (Npc_HasItems(hero, ItAm_MegaAmulett2) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_22_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_22_15_00"); //I have this amulet here.

	B_GiveInvItems	(hero, self, ItAm_MegaAmulett2, 1);

	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_22_14_01"); //Very interesting. This amulet seems to be of ancient power. It reminds me of an artifact from a book that was stolen from us some time ago.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_22_15_02"); //The artifact was stolen from you?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_22_14_03"); //No, I mean the book. Some wrong-doer has taken reckless advantage of our writings. May Adanos punish him. But... where I was just now.... Oh, the amulet. (look at it)
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_22_14_04"); //Indeed, fantastic, if my memory doesn't deceive me, this amulet has the power to extend the effect of every spell the wearer casts on him to all his friends. A powerful tool...

	B_GivePlayerXP	(300);
};

INSTANCE Info_Mod_Saturas_AW_Member_23 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_23_Condition;
	information	= Info_Mod_Saturas_AW_Member_23_Info;
	permanent	= 0;
	important	= 0;
	description	= "What can you tell me about this rune?";
};

FUNC INT Info_Mod_Saturas_AW_Member_23_Condition()
{
	if (Mod_WM_HasRune == 1)
	&& (Npc_HasItems(hero, ItRu_Kontrolle) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_23_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_23_15_00"); //What can you tell me about this rune?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_23_14_01"); //Hmm, let me see... With Adanos...
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_23_15_02"); //Yeah, what about that?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_23_14_03"); //This is a control rune that has the function of maintaining telepathic and energetic contact with mighty servant creatures over long distances - quite a few hundred meters.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_23_14_04"); //It is also used for the mutual recognition of creatures and prevents the creatures carrying this rune from attacking each other.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_23_14_05"); //I can safely assume that you have snatched her away from one of the higher creatures that ravaged the environment.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_23_15_06"); //Yeah, that's right.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_23_14_07"); //Excellent, maybe this item will help you in your search.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_23_14_08"); //Try to apply them before you hit the creatures.

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Saturas believes that the rune would stop the creatures from attacking each other. If I use her, she could help me find the culprits.");

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Saturas_AW_Member_24 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_24_Condition;
	information	= Info_Mod_Saturas_AW_Member_24_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_AW_Member_24_Condition()
{
	if (Mod_WM_HexenTot == 1)
	&& (Mod_WM_Hexeninfos < 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_24_Info()
{
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_24_14_01"); //My spies have made enquiries on the farms and the conclusion is obvious that there are witches in the area.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_24_15_00"); //Witches?! What kind of creatures are they exactly?
	
	Info_Mod_Saturas_AW_HexenTalk();
};

INSTANCE Info_Mod_Saturas_AW_Member_25 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_25_Condition;
	information	= Info_Mod_Saturas_AW_Member_25_Info;
	permanent	= 0;
	important	= 0;
	description	= "Blood cult was once upon a time. I destroyed them all.";
};

FUNC INT Info_Mod_Saturas_AW_Member_25_Condition()
{
	if (Mod_WM_BlutkultTot == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_25_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_25_15_00"); //Blood cult was once upon a time. I destroyed them all.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_25_14_01"); //Is that so? That's great news. May this evil be eradicated forever from the face of this earth. You have done us a service of inestimable value.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_25_14_02"); //Be that as it may, the creatures on the willow plateau should now be so weakened after the death of their creators that we can venture an attack with united forces.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_25_14_03"); //Cronos will leave with some water warriors and wait for you at Orlan's tavern.

	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_22))
	{
		AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_25_14_04"); //He has the amulet you gave us and will use it in battle.
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_16))
	{
		AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_25_14_05"); //He's got that spell you gave us, and he'll use it in battle.
	};

	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_25_14_06"); //You can still try to mobilize our confreres in the city. May Adanos keep you safe.
	
	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "The moment to strike out against the monsters on the pasture plateau seems to have come. Cronos and some water warriors will be waiting for me at Orlan.");

	B_GivePlayerXP	(1000);

	Mod_WM_HexenTot = 2;

	Mod_WM_CronosAttack = 1;

	B_StartOtherRoutine	(Mod_1538_WKR_Wasserkrieger_NW, "SAMMELN");
	B_StartOtherRoutine	(Mod_1530_WKR_Everaldo_NW, "SAMMELN");
	B_StartOtherRoutine	(Mod_1539_WKR_Wasserkrieger_NW, "SAMMELN");
	B_StartOtherRoutine	(Mod_1533_WKR_Salvador_NW, "SAMMELN");
	B_StartOtherRoutine	(Mod_1537_WKR_Vanas_NW, "SAMMELN");
	B_StartOtherRoutine	(Mod_1536_WKR_Roka_NW, "SAMMELN");
	B_StartOtherRoutine	(Mod_1535_WKR_Wasserkrieger_NW, "SAMMELN");
	B_StartOtherRoutine	(Mod_1534_WKR_Wasserkrieger_NW, "SAMMELN");
	B_StartOtherRoutine	(Mod_1532_HTR_Ethan_NW, "SAMMELN");
	B_StartOtherRoutine	(Mod_758_KDW_Cronos_NW, "SAMMELN");
	B_StartOtherRoutine	(Mod_588_WNOV_Joe_NW, "SAMMELN");
};

INSTANCE Info_Mod_Saturas_AW_Member_26 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_26_Condition;
	information	= Info_Mod_Saturas_AW_Member_26_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_AW_Member_26_Condition()
{
	if (Mod_WM_CronosAttack >= 3)
	&& (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_25))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_26_Info()
{			
	B_StartOtherRoutine	(Mod_763_NONE_Gaan_NW, "PRESTART");
	B_StartOtherRoutine	(Mod_4026_NONE_Kuno_NW, "START");
	
	if (Mod_WM_CronosAttack == 3)
	{
		AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_14_00"); //Incredible. The threat is indeed averted. You defied monsters and monsters and braved them.
		AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_14_01"); //Even your actions in the focus search fade against this achievement.
	}
	else if (Mod_WM_CronosAttack == 4)
	{
		AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_14_02"); //Unbelievable, I heard you defeated the creatures on the plateau alone.
		AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_14_03"); //Amazing though I must blame you for these unnecessary risks.
		AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_14_04"); //Blind vanity should not be the leitmotiv in view of the danger that hovers over everything.
		AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_14_05"); //There's too much at stake. Don't forget that...
	};

	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_14_06"); //Here, take this gold.

	B_GiveInvItems	(self, hero, ItMi_Gold, 1000);

	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_14_07"); //Of course, it can't outweigh your actions. Therefore the belt of our Mr. Adanos, which is described in this building instruction, should adorn your body.

	B_GiveInvItems	(self, hero, ItWr_Bauplan_AdanosBelt, 1);

	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_14_08"); //You can also choose one of the following items.

	Info_ClearChoices	(Info_Mod_Saturas_AW_Member_26);

	Info_AddChoice	(Info_Mod_Saturas_AW_Member_26, "Two rulers Ice rain", Info_Mod_Saturas_AW_Member_26_D);
	Info_AddChoice	(Info_Mod_Saturas_AW_Member_26, "maroon", Info_Mod_Saturas_AW_Member_26_C);
	Info_AddChoice	(Info_Mod_Saturas_AW_Member_26, "potion of the spirit", Info_Mod_Saturas_AW_Member_26_B);
	Info_AddChoice	(Info_Mod_Saturas_AW_Member_26, "potion of knowledge", Info_Mod_Saturas_AW_Member_26_A);
};

FUNC VOID Info_Mod_Saturas_AW_Member_26_E()
{
	var int Mod_WM_NewTruppen;
	Mod_WM_NewTruppen = 10 - (Mod_WM_Truppe_01 + Mod_WM_Truppe_02 + Mod_WM_Truppe_03 + Mod_WM_Truppe_04 + Mod_WM_Truppe_05 + Mod_WM_Truppe_06 + Mod_WM_Truppe_07 + Mod_WM_Truppe_08 + Mod_WM_Truppe_09 + Mod_WM_Truppe_10);

	if (Npc_KnowsInfo(hero, Info_Mod_Cronos_Angriff_01))
	{
		if (Mod_WM_NewTruppen == 0)
		{
			AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_00"); //Say,"Where are our confreres who stood by your side in battle?
			AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_26_E_15_01"); //Um, well.... I'm afraid they all fell.
			AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_02"); //What?! They're all dead?! Adanos is really putting us to the test.
			AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_03"); //Yes, the equilibrium is a great good, which unfortunately sometimes requires sacrifice.
			AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_04"); //But it will take a lot of time to recover from the loss of so many of our esteemed confreres.

			B_GivePlayerXP	(1000);
		}
		else if (Mod_WM_TruppenLeft == Mod_WM_NewTruppen)
		{
			AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_05"); //Just as pleasing as the destruction of the beasts, it is that each of your comrades-in-arms returned unharmed.

			B_GivePlayerXP	(4000);

			hero.attribute[ATR_MANA_MAX] += 10;
			hero.attribute[ATR_MANA] += 10;

			PrintScreen	("Mana + 10", -1, -1, FONT_SCREEN, 2);
		}
		else if ((Mod_WM_TruppenLeft-4) < Mod_WM_NewTruppen)
		{
			AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_06"); //On the other hand, I am saddened that there were dead among our confreres, albeit few.
			AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_07"); //Let us always be aware that the balance is a great good and, unfortunately, its preservation sometimes requires sacrifices.

			B_GivePlayerXP	(3000);

			hero.attribute[ATR_MANA_MAX] += 5;
			hero.attribute[ATR_MANA] += 5;

			PrintScreen	("Mana + 5", -1, -1, FONT_SCREEN, 2);
		}
		else
		{
			AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_08"); //However, the passing of many of our confreres in the fight against the monstrous monsters is extremely saddening. It will be a long time before our community recovers.
			AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_07"); //Let us always be aware that the balance is a great good and, unfortunately, its preservation sometimes requires sacrifices.

			B_GivePlayerXP	(2000);

			hero.attribute[ATR_MANA_MAX] += 2;
			hero.attribute[ATR_MANA] += 2;

			PrintScreen	("Mana + 2", -1, -1, FONT_SCREEN, 2);
		};
	};

	if (Mod_WM_NewTruppen > 0)
	{
		AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_09"); //May the blessing of our Lord Adanos be with you forever.
	};

	if (!Npc_KnowsInfo(hero, Info_Mod_Cronos_Angriff_01))
	{
		B_GivePlayerXP	(5000);

		hero.attribute[ATR_MANA_MAX] += 10;
		hero.attribute[ATR_MANA] += 10;

		if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_22))
		{
			AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_11"); //Ah yes, here you have the amulet back. It has been of great benefit to us. I looked into it a little bit more. A very interesting piece...

			B_GiveInvItems	(self, hero, ItAm_MegaAmulett2, 1);
		};
	}
	else
	{
		if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_22))
		{
			AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_12"); //Oh well, here you still have the amulet back which Cronos carried with him on the plateau. I looked into it a little bit more. A very interesting piece...

			B_GiveInvItems	(self, hero, ItAm_MegaAmulett2, 1);
		};
	};

	if (Mod_HSWM_RatProblem == 1)
	{
		AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_26_E_14_10"); //I shall now turn to the Council.

		B_StartOtherRoutine	(self, "RAT");
		B_StartOtherRoutine	(Mod_527_SLD_Torlof_NW, "RAT");

		Mod_HSWM_RatProblem = 0;
	};

	Mod_WM_UnheilFertig_Day = Wld_GetDay();
	Mod_WM_UnheilFertig = 1;

	Mod_BengarsHofLeer = 1;

	B_SetTopicStatus	(TOPIC_MOD_ADANOS_UNHEIL, LOG_SUCCESS);

	Mod_TillChange = 1;

	Mod_TillChange_Day = Wld_GetDay();

	B_Göttergefallen(2, 1);

	Info_ClearChoices	(Info_Mod_Saturas_AW_Member_26);
};

FUNC VOID Info_Mod_Saturas_AW_Member_26_D()
{
	B_GiveInvItems	(self, hero, ItSc_IceRain, 2);

	Info_Mod_Saturas_AW_Member_26_E();
};

FUNC VOID Info_Mod_Saturas_AW_Member_26_C()
{
	B_GiveInvItems	(self, hero, ItRu_Thunderball, 1);

	Info_Mod_Saturas_AW_Member_26_E();
};

FUNC VOID Info_Mod_Saturas_AW_Member_26_B()
{
	B_GiveInvItems	(self, hero, ItPo_Geist, 1);

	Info_Mod_Saturas_AW_Member_26_E();
};

FUNC VOID Info_Mod_Saturas_AW_Member_26_A()
{
	B_GiveInvItems	(self, hero, ItPo_Wissen, 1);

	Info_Mod_Saturas_AW_Member_26_E();
};

INSTANCE Info_Mod_Saturas_AW_Member_27 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_27_Condition;
	information	= Info_Mod_Saturas_AW_Member_27_Info;
	permanent	= 0;
	important	= 0;
	description	= "The crystal has regained its original power.";
};

FUNC INT Info_Mod_Saturas_AW_Member_27_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_AdanosDog_Kristall))
	&& (Npc_HasItems(hero, ItMi_AbsorbKristall2) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_27_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_27_15_00"); //The crystal has regained its original power.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_27_14_01"); //Incredible! Yes, I feel him being permeated by divine power.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_27_14_02"); //This is not only a great service to our community, but also a tool to help us maintain balance.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_27_14_03"); //He will also be able to stop the threat on the pasture plateau and save the whole of Khorinis from a hard fate.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_27_14_04"); //He should now weaken the monsters to such an extent that we can dare to attack with united forces.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_27_14_05"); //Yes, I can feel how the crystal even leaves its effect over this great distance.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_27_14_06"); //Cronos will take him and use him on the plateau where he'll be waiting for you with the warriors. It is time to eradicate this evil once and for all.

	B_GivePlayerXP	(1000);
};

INSTANCE Info_Mod_Saturas_AW_Member_28 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_Member_28_Condition;
	information	= Info_Mod_Saturas_AW_Member_28_Info;
	permanent	= 0;
	important	= 0;
	description	= "Here's the crystal.";
};

FUNC INT Info_Mod_Saturas_AW_Member_28_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_26))
	&& (Npc_HasItems(hero, ItMi_AbsorbKristall2) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_Member_28_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_Member_28_15_00"); //Here's the crystal.

	B_GiveInvItems	(hero, self, ItMi_AbsorbKristall2, 1);

	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_28_14_01"); //It is hard to believe that Adanos' tool is now in the hands of our community.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_Member_28_14_02"); //May the blessing of our Lord continue to accompany you on all your ways.

	B_GivePlayerXP	(1500);

	hero.attribute[ATR_MANA_MAX] += 5;
	hero.attribute[ATR_MANA] += 5;
};

INSTANCE Info_Mod_Saturas_AW_KhorataPlage_01 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_KhorataPlage_01_Condition;
	information	= Info_Mod_Saturas_AW_KhorataPlage_01_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_AW_KhorataPlage_01_Condition()
{
	if (Wld_GetDay()-2 > Mod_WM_UnheilFertig_Day)
	&& (Mod_WM_UnheilFertig == 1)
	&& (Kapitel >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_KhorataPlage_01_Info()
{
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_01_14_00"); //The great danger that Khorinis threatened is banished. However, there are still incidents and reports that require our attention.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_01_14_01"); //The request with which I entrust you now takes place in the north, the part of the island called Relendel. You've heard of it?
	AI_Output(hero, self, "Info_Mod_Saturas_AW_KhorataPlage_01_15_02"); //Yeah, last but not least in search of the fragments, I lost my way.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_01_14_03"); //Well, at least your knowledge of the area makes things a little easier.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_01_14_04"); //To put my request in concrete terms: I heard of plagues that have recently ravaged Relendel.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_01_14_05"); //As long as the causes, or the originators of the whole thing are not known, there is cause for concern.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_KhorataPlage_01_15_06"); //What kind of plagues are they?
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_01_14_07"); //Beings that many people would usually call pests, rabbits, rats, insects.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_01_14_08"); //As water magicians and balance maintainers, we know of course that they too have their place in the structure of the world.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_01_14_09"); //But the sudden outgrowths of the population are more than unusual.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_KhorataPlage_01_15_10"); //But that sounds more like a theme for the Rangers.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_01_14_11"); //No, there is reason to believe that they are not of natural origin, that there is magic behind it, so it is up to us to investigate the matter.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_KhorataPlage_01_15_12"); //All right, then I'll be on my way.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_01_14_13"); //Thanks. May Adanos go with you.

	Log_CreateTopic	(TOPIC_MOD_ADANOS_PLAGE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ADANOS_PLAGE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ADANOS_PLAGE, "Saturas gave me this time the task to investigate some plagues in Relendel. All kinds of sediments of animals - rats, rabbits, insects - are said to have reproduced there at an unnatural rate.");
};

INSTANCE Info_Mod_Saturas_AW_KhorataPlage_02 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_AW_KhorataPlage_02_Condition;
	information	= Info_Mod_Saturas_AW_KhorataPlage_02_Info;
	permanent	= 0;
	important	= 0;
	description	= "I've found out what the plagues are.";
};

FUNC INT Info_Mod_Saturas_AW_KhorataPlage_02_Condition()
{
	if (Mod_WM_UnheilFertig == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_AW_KhorataPlage_02_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_AW_KhorataPlage_02_15_00"); //I've found out what the plagues are.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_02_14_01"); //Yes, report.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_KhorataPlage_02_15_02"); //They all have different origins.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_KhorataPlage_02_15_03"); //The rats come from a race of rat people from the ice world.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_KhorataPlage_02_15_04"); //The demon magicians have their fingers in the rabbit plague. They're testing plague spells.
	AI_Output(hero, self, "Info_Mod_Saturas_AW_KhorataPlage_02_15_05"); //And the visitation by insects to the last resort is based on a divine curse.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_02_14_06"); //(amazed) Unbelievable! What you have to report not only shatters my worries about an evil power that could be behind all this.
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_02_14_07"); //It also represents a true treasure of knowledge, which expands our understanding by the creation of Adanos....
	AI_Output(self, hero, "Info_Mod_Saturas_AW_KhorataPlage_02_14_08"); //Here, take these magical artifacts as a thank you. May the blessing of Adano always rest on you.

	B_ShowGivenThings	("6 potions, rune stone, 5 rulers and heart of an ice-golem preserved");

	CreateInvItems	(hero, ItPo_Geist, 1);
	CreateInvItems	(hero, ItPo_Mana_03, 5);
	CreateInvItems	(hero, ItMi_Runeblank, 1);
	CreateInvItems	(hero, ItSc_Thunderstorm, 3);
	CreateInvItems	(hero, ItSc_IceRain, 2);
	CreateInvItems	(hero, ItAt_IceGolemHeart, 1);

	B_SetTopicStatus	(TOPIC_MOD_ADANOS_PLAGE, LOG_SUCCESS);

	B_GivePlayerXP	(800);

	B_Göttergefallen (2, 2);
};

INSTANCE Info_Mod_Saturas_NW_JGScroll (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_JGScroll_Condition;
	information	= Info_Mod_Saturas_NW_JGScroll_Info;
	permanent	= 0;
	important	= 0;
	description	= "I've got a part and a message here that I can't read.";
};

FUNC INT Info_Mod_Saturas_NW_JGScroll_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wulfgar_Key2))
	&& (Npc_HasItems(hero, ItWr_TruhenNotizJG) == 1)
	&& (Npc_HasItems(hero, ItWr_TruhenScrollJG) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_JGScroll_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_NW_JGScroll_15_00"); //I've got a part and a message here that I can't read.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_JGScroll_14_01"); //Let me see that.

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Saturas_NW_JGScroll_14_02"); //Ah yes. The old handwriting. Ask Riordian, he specializes in it.
};

INSTANCE Info_Mod_Saturas_NW_Rasend (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Rasend_Condition;
	information	= Info_Mod_Saturas_NW_Rasend_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_NW_Rasend_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Daron_Rasend))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Rasend_Info()
{
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend_14_00"); //
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Rasend_15_01"); //
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend_14_02"); //
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend_14_03"); //
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend_14_04"); //
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Rasend_15_05"); //
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Rasend_15_06"); //
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend_14_07"); //
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Rasend_15_08"); //
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend_14_09"); //
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend_14_10"); //
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend_14_11"); //
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend_14_12"); //

	B_LogEntry	(TOPIC_MOD_ADANOS_RASEND, "Also the excavation site was not spared from the attacks of the demon. He then went to Relendel. Saturas advised me to visit Xardas to find out more about this sinister creature.");
};

INSTANCE Info_Mod_Saturas_NW_Rasend02 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Rasend02_Condition;
	information	= Info_Mod_Saturas_NW_Rasend02_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_NW_Rasend02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Shivar_DemonsDead))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Rasend02_Info()
{
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend02_14_00"); //I can sense that the danger has been averted and that you appear here undamaged provides me with confirmation.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend02_14_01"); //How did you manage to do that again?
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Rasend02_15_02"); //I don't think you want to know...
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend02_14_03"); //In any case, you have once again rendered an invaluable service to the whole of Khorini.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend02_14_04"); //There is no question that you are chosen to be one of the highest dignitaries among the servants of Adano.

	if (Mod_Gilde == 10)
	{
		AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend02_14_05"); //Do you feel ready to serve the community as a judge of water?
		AI_Output(hero, self, "Info_Mod_Saturas_NW_Rasend02_15_06"); //Yeah, my wish is to be a judge of the water.
		AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend02_14_07"); //Then take this robe and Adano's blessing.
		AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend02_14_08"); //May the equilibrium continue to exist through your work.

		CreateInvItems	(self, ITAR_KDW_H, 1);
		B_GiveInvItems	(self, hero, ITAR_KDW_H, 1);

		Snd_Play ("LEVELUP");

		B_GivePlayerXP	(1000);

		B_Göttergefallen(2, 5);

		Mod_Gilde = 11;
	}
	else if (Mod_Gilde == 17)
	{
		AI_Output(self, hero, "Info_Mod_Saturas_NW_Rasend02_14_09"); //Why don't you go see Ethan right away?

		B_GivePlayerXP	(600);
	};

	B_SetTopicStatus	(TOPIC_MOD_ADANOS_RASEND, LOG_SUCCESS);
};

INSTANCE Info_Mod_Saturas_NW_Sweetwater (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Sweetwater_Condition;
	information	= Info_Mod_Saturas_NW_Sweetwater_Info;
	permanent	= 0;
	important	= 0;
	description	= "You need my help?";
};

FUNC INT Info_Mod_Saturas_NW_Sweetwater_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Vatras_Sweetwater))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Sweetwater_Info()
{
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Sweetwater_15_00"); //You need my help?
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Sweetwater_14_01"); //Yeah. I wouldn't know anyone else.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Sweetwater_15_02"); //All right, then. What's happening?
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Sweetwater_14_03"); //The pirates need support. A good hunter. Isn't that you?
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Sweetwater_15_04"); //True enough. I was even appointed ranger.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Sweetwater_14_05"); //Just the right man, it seems to me. Now, get on with it. Report to the pirates.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Sweetwater_15_06"); //I'm on my way.

	B_LogEntry	(TOPIC_MOD_JG_SWEETWATER, "Saturas sends me to the pirates. Let's see what they have to do for me....");
};

INSTANCE Info_Mod_Saturas_NW_Sweetwater2 (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_Sweetwater2_Condition;
	information	= Info_Mod_Saturas_NW_Sweetwater2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_NW_Sweetwater2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_AlligatorJack_Sweetwater2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Saturas_NW_Sweetwater2_Info()
{
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Sweetwater2_14_00"); //What was going on?
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Sweetwater2_15_01"); //They had an alligator plague on the lake. It's done now.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Sweetwater2_14_02"); //I didn't expect otherwise. I'll let Vatras know. I'm sure you're still busy in the Minental.
	AI_Output(hero, self, "Info_Mod_Saturas_NW_Sweetwater2_15_03"); //You could say that. See you later.
	AI_Output(self, hero, "Info_Mod_Saturas_NW_Sweetwater2_14_04"); //Adanos be with you.

	B_SetTopicStatus	(TOPIC_MOD_JG_SWEETWATER, LOG_SUCCESS);
};

INSTANCE Info_Mod_Saturas_PMSchulden (C_INFO)
{
	npc         	= Mod_774_KDW_Saturas_NW;
	nr          	= 1;
	condition   	= Info_Mod_Saturas_PMSchulden_Condition;
	information 	= Info_Mod_Saturas_PMSchulden_Info;
	permanent   	= 1;
	important 	= 1; 
};

FUNC INT Info_Mod_Saturas_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Saturas_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Saturas_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Saturas_PMSchulden_Info()
{
	AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_00"); //Did you come to pay your fine?

	if (B_GetTotalPetzCounter(self) > Saturas_LastPetzCounter)
	{
		AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_01"); //I was wondering if you'd even dare come here!
		AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_02"); //Apparently, it's not the latest accusations!

		if (Saturas_Schulden < 1000)
		{
			AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_03"); //I warned you! The fine you have to pay now is higher!
			AI_Output (hero, self, "Info_Mod_Saturas_PMAdd_15_00"); //How much?
			
			var int diff; diff = (B_GetTotalPetzCounter(self) - Saturas_LastPetzCounter);
		
			if (diff > 0)
			{
				Saturas_Schulden = Saturas_Schulden + (diff * 50);
			};
		
			if (Saturas_Schulden > 1000)	{	Saturas_Schulden = 1000;	};
		
			B_Say_Gold (self, hero, Saturas_Schulden);
		}
		else
		{
			AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_04"); //You let me down so badly!
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Saturas_LastPetzCrime)
	{
		AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_05"); //Some new things have come up.
		
		if (Saturas_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_06"); //Suddenly, there's no one left to accuse you of murder.
		};
		
		if (Saturas_LastPetzCrime == CRIME_THEFT)
		|| ( (Saturas_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_07"); //No one remembers seeing you at a theft.
		};
		
		if (Saturas_LastPetzCrime == CRIME_ATTACK)
		|| ( (Saturas_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_08"); //There's no more witnesses to the fact that you've ever been in a fight.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_09"); //Apparently all the charges against you have vanished.
		};
		
		AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_10"); //I don't know what happened, but I warn you: don't play games with me.
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_11"); //Anyway, I've decided to waive your debt.
			AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_12"); //Make sure you don't get in trouble again.
	
			Saturas_Schulden			= 0;
			Saturas_LastPetzCounter 	= 0;
			Saturas_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_13"); //One thing is clear: you still have to pay your penalty in full.
			B_Say_Gold (self, hero, Saturas_Schulden);
			AI_Output (self, hero, "Info_Mod_Saturas_PMSchulden_14_14"); //So, what is it?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(Info_Mod_Saturas_PMSchulden);
		Info_ClearChoices  	(Info_Mod_Saturas_PETZMASTER);
		Info_AddChoice		(Info_Mod_Saturas_PMSchulden,"I haven't got enough gold!",Info_Mod_Saturas_PETZMASTER_PayLater);
		Info_AddChoice		(Info_Mod_Saturas_PMSchulden,"How much was that again?",Info_Mod_Saturas_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(hero, itmi_gold) >= Saturas_Schulden)
		{
			Info_AddChoice 	(Info_Mod_Saturas_PMSchulden,"I want to pay the penalty!",Info_Mod_Saturas_PETZMASTER_PayNow);
		};
	};
};

func void Info_Mod_Saturas_PMSchulden_HowMuchAgain()
{
	AI_Output (hero, self, "Info_Mod_Saturas_PMSchulden_HowMuchAgain_15_00"); //How much was it again?
	B_Say_Gold (self, hero, Saturas_Schulden);

	Info_ClearChoices  	(Info_Mod_Saturas_PMSchulden);
	Info_ClearChoices  	(Info_Mod_Saturas_PETZMASTER);
	Info_AddChoice		(Info_Mod_Saturas_PMSchulden,"I haven't got enough gold!",Info_Mod_Saturas_PETZMASTER_PayLater);
	Info_AddChoice		(Info_Mod_Saturas_PMSchulden,"How much was that again?",Info_Mod_Saturas_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(hero, itmi_gold) >= Saturas_Schulden)
	{
		Info_AddChoice 	(Info_Mod_Saturas_PMSchulden,"I want to pay the penalty!",Info_Mod_Saturas_PETZMASTER_PayNow);
	};
};

INSTANCE Info_Mod_Saturas_PETZMASTER   (C_INFO)
{
	npc         	= Mod_774_KDW_Saturas_NW;
	nr          	= 1;
	condition   	= Info_Mod_Saturas_PETZMASTER_Condition;
	information 	= Info_Mod_Saturas_PETZMASTER_Info;
	permanent   	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Saturas_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Saturas_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Saturas_PETZMASTER_Info()
{
	Saturas_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_01"); //I'm glad you came to me before things got worse for you.
		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_02"); //Murder is a grave offence!

		Saturas_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50

		Saturas_Schulden = Saturas_Schulden + 500;						//PLUS Mörder-Malus

		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_03"); //Not to mention the other things you've done.
		};

		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_06"); //I have no interest in putting you on the gallows. We're at war, and we need every man we can get.
		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_07"); //But it won't be easy to make people gracious again.
		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_08"); //You could show your repentance by paying a fine - of course the penalty must be appropriate.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_09"); //Good of you to come! You're accused of stealing! There are witnesses!

		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_10"); //I don't even want to talk about the other things I've heard.
		};

		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_11"); //I will not tolerate such behaviour in our country!
		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_12"); //You'll have to pay a fine to make up for your crime!
		
		Saturas_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_13"); //If you fight with the riffraff in the harbour, that's one thing...
		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_14"); //But if you attack our people, I'll have to hold you accountable.

		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_15"); //And I don't think it had to be the case with the sheep.
		};

		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_16"); //If I let you get away with this, everybody's gonna do what they want.
		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_17"); //So you'll pay an appropriate fine - and the whole thing will be forgotten.
		
		Saturas_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_18"); //I've heard that you've been messing with our sheep.
		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_19"); //You do realize I can't let this go through.
		AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_14_20"); //You'll have to pay compensation!
		
		Saturas_Schulden = 100;
	};
	
	AI_Output (hero, self, "Info_Mod_Saturas_PETZMASTER_15_21"); //How much?
	
	if (Saturas_Schulden > 1000)	{	Saturas_Schulden = 1000;	};
		
	B_Say_Gold (self, hero, Saturas_Schulden);
	
	Info_ClearChoices  	(Info_Mod_Saturas_PMSchulden);
	Info_ClearChoices  	(Info_Mod_Saturas_PETZMASTER);
	Info_AddChoice		(Info_Mod_Saturas_PETZMASTER,"I haven't got enough gold!",Info_Mod_Saturas_PETZMASTER_PayLater);
	if (Npc_HasItems(hero, itmi_gold) >= Saturas_Schulden)
	{
		Info_AddChoice 	(Info_Mod_Saturas_PETZMASTER,"I want to pay the penalty!",Info_Mod_Saturas_PETZMASTER_PayNow);
	};
};

func void Info_Mod_Saturas_PETZMASTER_PayNow()
{
	AI_Output (hero, self, "Info_Mod_Saturas_PETZMASTER_PayNow_15_00"); //I want to pay the fine!
	B_GiveInvItems (hero, self, itmi_gold, Saturas_Schulden);
	AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_PayNow_14_01"); //Good! I will see to it that each one of us learns about it - so your reputation would be reasonably restored.

	B_GrantAbsolution (LOC_WMCAMP);
	
	Saturas_Schulden			= 0;
	Saturas_LastPetzCounter 	= 0;
	Saturas_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(Info_Mod_Saturas_PETZMASTER);
	Info_ClearChoices  	(Info_Mod_Saturas_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void Info_Mod_Saturas_PETZMASTER_PayLater()
{
	AI_Output (hero, self, "Info_Mod_Saturas_PETZMASTER_PayLater_15_00"); //I don't have enough gold.
	AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_PayLater_14_01"); //Then see to it that you acquire the gold as quickly as possible
	AI_Output (self, hero, "Info_Mod_Saturas_PETZMASTER_PayLater_14_02"); //And I'm warning you: if you add to your guilt, things will get worse for you.
	
	Saturas_LastPetzCounter 	= B_GetTotalPetzCounter(self);
	Saturas_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	AI_StopProcessInfos (self);
};

INSTANCE Info_Mod_Saturas_NW_EXIT (C_INFO)
{
	npc		= Mod_774_KDW_Saturas_NW;
	nr		= 1;
	condition	= Info_Mod_Saturas_NW_EXIT_Condition;
	information	= Info_Mod_Saturas_NW_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Saturas_NW_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Saturas_NW_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
