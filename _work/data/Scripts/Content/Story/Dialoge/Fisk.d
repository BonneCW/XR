INSTANCE Info_Mod_Fisk_Hi (C_INFO)
{
	npc		= Mod_950_STT_Fisk_MT;
	nr		= 1;
	condition	= Info_Mod_Fisk_Hi_Condition;
	information	= Info_Mod_Fisk_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Fisk_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fisk_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Fisk_Hi_37_00"); //Hey, I can sell you something. I have some weapons in stock.
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_OLDCAMP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_OLDCAMP, "Fisk sells weapons.");
};

INSTANCE Info_Mod_Fisk_Dieb (C_INFO)
{
	npc		= Mod_950_STT_Fisk_MT;
	nr		= 1;
	condition	= Info_Mod_Fisk_Dieb_Condition;
	information	= Info_Mod_Fisk_Dieb_Info;
	permanent	= 0;
	important	= 0;
	description	= "I hear you're dealing in hot stuff...";
};

FUNC INT Info_Mod_Fisk_Dieb_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_Dieb))
	&& (Mod_PDV_Genug_Infos >= 2)
	&& (Mod_PDV_Fisk_Infos == 0)
	&& (Npc_KnowsInfo(hero, Info_Mod_Fisk_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fisk_Dieb_Info()
{
	AI_Output(hero, self, "Info_Mod_Fisk_Dieb_15_00"); //Ich habe gehört, dass du mit "hot commodity" handelst, und ich würde dir vorschlagen, du verrätst mir, ob darunter das Zeug ist, das den Erzbaronen gestohlen wurde.
	AI_Output(self, hero, "Info_Mod_Fisk_Dieb_37_01"); //I can't help it, he came to me and he wanted me to keep the stuff for his contact man. He threatened to kill me.
	AI_Output(hero, self, "Info_Mod_Fisk_Dieb_15_02"); //Who is he? Can you at least give me proof against him?
	AI_Output(self, hero, "Info_Mod_Fisk_Dieb_37_03"); //If you make sure he doesn't hurt me, I'll give you proof against him.

	Mod_PDV_Fisk_Infos = 1;
};

INSTANCE Info_Mod_Fisk_Frage (C_INFO)
{
	npc		= Mod_950_STT_Fisk_MT;
	nr		= 1;
	condition	= Info_Mod_Fisk_Frage_Condition;
	information	= Info_Mod_Fisk_Frage_Info;
	permanent	= 0;
	important	= 0;
	description	= "I'd be interested...";
};

FUNC INT Info_Mod_Fisk_Frage_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_Dieb))
	&& (Mod_PDV_Genug_Infos >= 2)
	&& (Mod_PDV_Fisk_Infos == 0)
	&& (Npc_KnowsInfo(hero, Info_Mod_Fisk_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fisk_Frage_Info()
{
	AI_Output(hero, self, "Info_Mod_Fisk_Frage_15_00"); //I'd be interested in the baron's stuff, and I heard you were selling some of it.
	AI_Output(self, hero, "Info_Mod_Fisk_Frage_37_01"); //How do you know that? No, I can't sell any of that stuff, so please forget I got the stuff.
	AI_Output(hero, self, "Info_Mod_Fisk_Frage_15_02"); //Listen, I'm on Thorus' behalf, and I need to know what's going on.
	AI_Output(self, hero, "Info_Mod_Fisk_Frage_37_03"); //If you make sure he doesn't hurt me, I'll give you proof against him.

	Mod_PDV_Fisk_Infos = 1;
};

INSTANCE Info_Mod_Fisk_Hilfe (C_INFO)
{
	npc		= Mod_950_STT_Fisk_MT;
	nr		= 1;
	condition	= Info_Mod_Fisk_Hilfe_Condition;
	information	= Info_Mod_Fisk_Hilfe_Info;
	permanent	= 0;
	important	= 0;
	description	= "It's a deal.";
};

FUNC INT Info_Mod_Fisk_Hilfe_Condition()
{
	if (Mod_PDV_Fisk_Infos == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fisk_Hilfe_Info()
{
	AI_Output(hero, self, "Info_Mod_Fisk_Hilfe_15_00"); //Deal.
	AI_Output(self, hero, "Info_Mod_Fisk_Hilfe_37_01"); //All right, they always steal the stuff at 2:00 and then take it to my shop. At this time they expect me to be present.
	AI_Output(self, hero, "Info_Mod_Fisk_Hilfe_37_02"); //Lie in wait at the baron's house at this hour.
	AI_Output(hero, self, "Info_Mod_Fisk_Hilfe_15_03"); //All clear.

	Mod_PDV_Fisk_Infos = 2;

	B_LogEntry	(TOPIC_MOD_PDV, "I asked Fisk if he could give me more details. He said that if I report it to Thorus, he'll give me proof. He also told me to lie in wait for you at 2:00 in the House of the Archbarons.");

	B_StartOtherRoutine	(Mod_943_GRD_Bloodwyn_MT, "DIEB");
	B_StartOtherRoutine	(Mod_1110_GRD_Cutter_MT, "DIEB");
};

INSTANCE Info_Mod_Fisk_Zettel (C_INFO)
{
	npc		= Mod_950_STT_Fisk_MT;
	nr		= 1;
	condition	= Info_Mod_Fisk_Zettel_Condition;
	information	= Info_Mod_Fisk_Zettel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bloodwyn and Cutter have been captured, what about the evidence?";
};

FUNC INT Info_Mod_Fisk_Zettel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorus_Diebe))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fisk_Zettel_Info()
{
	AI_Output(hero, self, "Info_Mod_Fisk_Zettel_15_00"); //Bloodwyn and Cutter have been captured, what about the evidence?
	AI_Output(self, hero, "Info_Mod_Fisk_Zettel_37_01"); //Here, this writing came with every delivery.

	B_GiveInvItems	(self, hero, ItWr_FisksNotiz, 1);

	B_LogEntry	(TOPIC_MOD_PDV, "Fisk gave me a paper. That should prove it.");
};

INSTANCE Info_Mod_Fisk_SLDSpy (C_INFO)
{
	npc		= Mod_950_STT_Fisk_MT;
	nr		= 1;
	condition	= Info_Mod_Fisk_SLDSpy_Condition;
	information	= Info_Mod_Fisk_SLDSpy_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hello, what's new at the camp?";
};

FUNC INT Info_Mod_Fisk_SLDSpy_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fisk_Hi))
	&& (Mod_SLD_STT_Mordrag == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Lee_GotoSylvio))
	&& (Mod_SLD_Spy == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fisk_SLDSpy_Info()
{
	AI_Output(hero, self, "Info_Mod_Fisk_SLDSpy_15_00"); //Hello, what's new at the camp?
	AI_Output(self, hero, "Info_Mod_Fisk_SLDSpy_37_01"); //That's where you ask...
	AI_Output(hero, self, "Info_Mod_Fisk_SLDSpy_15_02"); //(anticipated) Yes?
	AI_Output(self, hero, "Info_Mod_Fisk_SLDSpy_37_03"); //My goods. Best and newest quality to have for a bargain price.
	AI_Output(hero, self, "Info_Mod_Fisk_SLDSpy_15_04"); //Uh, and other news?
	AI_Output(self, hero, "Info_Mod_Fisk_SLDSpy_37_05"); //Now I know what you mean...
	AI_Output(hero, self, "Info_Mod_Fisk_SLDSpy_15_06"); //I'm listening.
	AI_Output(self, hero, "Info_Mod_Fisk_SLDSpy_37_07"); //The thing with the rats in the stew of the ore barons. I'm not kidding, I'm telling you. In Gomez' time, the two chefs would have been quartered or wheeled.
	AI_Output(hero, self, "Info_Mod_Fisk_SLDSpy_15_08"); //Hmm...
	AI_Output(self, hero, "Info_Mod_Fisk_SLDSpy_37_09"); //Or, yes, the murder Cutter was watching. Seems like something important. That's all I can think of right now.

	B_LogEntry	(TOPIC_MOD_SLD_SPY, "Cutter witnessed an important murder, as I learned from Fisk.");
};

INSTANCE Info_Mod_Fisk_CutterBad (C_INFO)
{
	npc		= Mod_950_STT_Fisk_MT;
	nr		= 1;
	condition	= Info_Mod_Fisk_CutterBad_Condition;
	information	= Info_Mod_Fisk_CutterBad_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hey, you told me Cutter was watching a murder.";
};

FUNC INT Info_Mod_Fisk_CutterBad_Condition()
{
	if (Mod_SLD_Spy == 5)
	&& (Mob_HasItems("CUTTERSTRUHE", ItMw_BloodySword) == 1)
	&& (Mob_HasItems("CUTTERSTRUHE", ItWr_SentenzaForCutter) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fisk_CutterBad_Info()
{
	AI_Output(hero, self, "Info_Mod_Fisk_CutterBad_15_00"); //Hey, you told me Cutter was watching a murder.
	AI_Output(self, hero, "Info_Mod_Fisk_CutterBad_37_01"); //Yeah, and?
	AI_Output(hero, self, "Info_Mod_Fisk_CutterBad_15_02"); //Cutter's been acting pretty weird lately. I saw him sneak through the camp at night with a pile of junk, as if he wanted to hide the things that had to be hidden. Possibly... No, that would be absurd...
	AI_Output(self, hero, "Info_Mod_Fisk_CutterBad_37_03"); //Yeah, tell me, what do you think?
	AI_Output(hero, self, "Info_Mod_Fisk_CutterBad_15_04"); //Well, I was wondering if he might not have something to do with the murder himself.
	AI_Output(self, hero, "Info_Mod_Fisk_CutterBad_37_05"); //That's a dangerous assumption... (to itself) Hmm, but if there's any truth to it? Must definitely be addressed by some guards.

	Mod_SLD_Spy = 6;

	B_LogEntry	(TOPIC_MOD_SLD_SPY, "Well, that's done. Now the guards should be looking in Cutter's chest soon.");
};

INSTANCE Info_Mod_Fisk_WoherWaren (C_INFO)
{
	npc		= Mod_950_STT_Fisk_MT;
	nr		= 1;
	condition	= Info_Mod_Fisk_WoherWaren_Condition;
	information	= Info_Mod_Fisk_WoherWaren_Info;
	permanent	= 0;
	important	= 0;
	description	= "Where do you get your goods in these troubled times?";
};

FUNC INT Info_Mod_Fisk_WoherWaren_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fisk_WoherWaren_Info()
{
	AI_Output(hero, self, "Info_Mod_Fisk_WoherWaren_15_00"); //Where do you get your goods in these troubled times?
	AI_Output(self, hero, "Info_Mod_Fisk_WoherWaren_37_01"); //Getting guns isn't really the problem right now. We've got plenty of good blacksmiths.
	AI_Output(self, hero, "Info_Mod_Fisk_WoherWaren_37_02"); //But nobody wants all that stuff right now. What's the point of using scrap iron when you actually need something between your teeth?
	AI_Output(hero, self, "Info_Mod_Fisk_WoherWaren_15_03"); //Then why are you still here?
	AI_Output(self, hero, "Info_Mod_Fisk_WoherWaren_37_04"); //I've been wondering that for a long time....
};

INSTANCE Info_Mod_Fisk_Trade (C_INFO)
{
	npc		= Mod_950_STT_Fisk_MT;
	nr		= 1;
	condition	= Info_Mod_Fisk_Trade_Condition;
	information	= Info_Mod_Fisk_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Fisk_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fisk_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fisk_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Fisk_Pickpocket (C_INFO)
{
	npc		= Mod_950_STT_Fisk_MT;
	nr		= 1;
	condition	= Info_Mod_Fisk_Pickpocket_Condition;
	information	= Info_Mod_Fisk_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Fisk_Pickpocket_Condition()
{
	C_Beklauen	(59, ItMi_Nugget, 2);
};

FUNC VOID Info_Mod_Fisk_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Fisk_Pickpocket);

	Info_AddChoice	(Info_Mod_Fisk_Pickpocket, DIALOG_BACK, Info_Mod_Fisk_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Fisk_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Fisk_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Fisk_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Fisk_Pickpocket);
};

FUNC VOID Info_Mod_Fisk_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Fisk_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Fisk_Pickpocket);

		Info_AddChoice	(Info_Mod_Fisk_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Fisk_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Fisk_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Fisk_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Fisk_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Fisk_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Fisk_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Fisk_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Fisk_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Fisk_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Fisk_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Fisk_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Fisk_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Fisk_EXIT (C_INFO)
{
	npc		= Mod_950_STT_Fisk_MT;
	nr		= 1;
	condition	= Info_Mod_Fisk_EXIT_Condition;
	information	= Info_Mod_Fisk_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Fisk_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fisk_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
