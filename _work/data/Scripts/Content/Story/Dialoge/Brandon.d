INSTANCE Info_Mod_Brandon_Hi (C_INFO)
{
	npc		= Mod_931_PIR_Brandon_AW;
	nr		= 1;
	condition	= Info_Mod_Brandon_Hi_Condition;
	information	= Info_Mod_Brandon_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brandon_Hi_Condition()
{
	if (hero.guild != GIL_KDF)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brandon_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Brandon_Hi_04_00"); //Hey, was machst du hier?
	AI_Output(hero, self, "Info_Mod_Brandon_Hi_15_01"); //Ich will zu Greg.
	AI_Output(self, hero, "Info_Mod_Brandon_Hi_04_02"); //Soso zu Greg also? Und was willst du beim Käpt'n?
	AI_Output(hero, self, "Info_Mod_Brandon_Hi_15_03"); //Ich will Pirat werden.
	AI_Output(self, hero, "Info_Mod_Brandon_Hi_04_04"); //Du willst Pirat werden? Mit deinen mickrigen Ärmchen?
	AI_Output(self, hero, "Info_Mod_Brandon_Hi_04_05"); //Ich mach dir 'n Vorschlag. Du erlegst 'n größeren Strandwaran, der in der Nähe des Lagers rumstreunt.
	AI_Output(self, hero, "Info_Mod_Brandon_Hi_04_06"); //Er macht 'n paar der Waschweiber Angst. (lacht)
	AI_Output(hero, self, "Info_Mod_Brandon_Hi_15_07"); //Waschweiber? Ich sehe hier aber gar keine Frauen.
	AI_Output(self, hero, "Info_Mod_Brandon_Hi_04_08"); //(lacht hämisch) Die Waschweiber sind die "Jungs" aus Henrys Entertrupp.
	AI_Output(self, hero, "Info_Mod_Brandon_Hi_04_09"); //Aber die wirst du noch früh genug sehen, Jungchen.
	AI_Output(self, hero, "Info_Mod_Brandon_Hi_04_10"); //Wenn ich mich richtig erinnere, dann solltest du noch 'n Waran erledigen.
	AI_Output(hero, self, "Info_Mod_Brandon_Hi_15_11"); //Ich geh ja schon ...

	Log_CreateTopic	(TOPIC_MOD_BRANDON_WARAN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BRANDON_WARAN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BRANDON_WARAN, "Ich soll für Brandon einen großen Strandwaran töten.");
};

INSTANCE Info_Mod_Brandon_Waran (C_INFO)
{
	npc		= Mod_931_PIR_Brandon_AW;
	nr		= 1;
	condition	= Info_Mod_Brandon_Waran_Condition;
	information	= Info_Mod_Brandon_Waran_Info;
	permanent	= 0;
	important	= 0;
	description	= "Der Waran ist tot.";
};

FUNC INT Info_Mod_Brandon_Waran_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brandon_Hi))
	&& (Npc_IsDead(BrandonWaran))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brandon_Waran_Info()
{
	AI_Output(hero, self, "Info_Mod_Brandon_Waran_15_00"); //Der Waran ist tot.
	AI_Output(self, hero, "Info_Mod_Brandon_Waran_04_01"); //Gut so. Damit dürften die Waschweiber zufrieden sein.
	AI_Output(self, hero, "Info_Mod_Brandon_Waran_04_02"); //Jetzt geh zu Greg.

	B_LogEntry	(TOPIC_MOD_BRANDON_WARAN, "Ich kann jetzt endlich zu Greg.");
	B_SetTopicStatus	(TOPIC_MOD_BRANDON_WARAN, LOG_SUCCESS);

	B_Göttergefallen(2, 1);

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Brandon_Schatzsuche (C_INFO)
{
	npc		= Mod_931_PIR_Brandon_AW;
	nr		= 1;
	condition	= Info_Mod_Brandon_Schatzsuche_Condition;
	information	= Info_Mod_Brandon_Schatzsuche_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du siehst so froh aus.";
};

FUNC INT Info_Mod_Brandon_Schatzsuche_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Greg_Karte))
	&& (Npc_KnowsInfo(hero, Info_Mod_Brandon_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brandon_Schatzsuche_Info()
{
	AI_Output(hero, self, "Info_Mod_Brandon_Schatzsuche_15_00"); //Du siehst so froh aus.
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_01"); //Bin ich auch. Hab mitgekriegt, dass Greg auslaufen will. Endlich passiert hier was.
	AI_Output(hero, self, "Info_Mod_Brandon_Schatzsuche_15_02"); //Stimmt. Und ich soll bei den Vorbereitungen helfen.
	AI_Output(hero, self, "Info_Mod_Brandon_Schatzsuche_15_03"); //Kann ich dich da unterstützen?
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_04"); //Aber ja ... Aber das bleibt unter uns!
	AI_Output(hero, self, "Info_Mod_Brandon_Schatzsuche_15_05"); //Wo drückt der Stiefel?
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_06"); //'ne ganz komische Sache.
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_07"); //Bin neulich in den Felsen über dem Ausweichlager rumgeklettert. Nur so aus Neugier.
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_08"); //Plötzlich ein Riesengekreische über mir.
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_09"); //Zwei seltsame Wesen, sahen aus wie kleine Menschen, aber mit Flügel und mächtigen Krallen.
	AI_Output(hero, self, "Info_Mod_Brandon_Schatzsuche_15_10"); //Die kenne ich. Das sind Harpien.
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_11"); //Jedenfalls haben die mich angegriffen.
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_12"); //Ich hatte nur mein kleines Beil dabei und konnte nicht gegen die ankommen.
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_13"); //Ich bin also geflüchtet und hab dabei meinen Enterhaken verloren.
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_14"); //Und den werden wir vielleicht brauchen, wenn wir auslaufen.
	AI_Output(hero, self, "Info_Mod_Brandon_Schatzsuche_15_15"); //Kann schon sein. Ich soll dir also das Teil zurückbringen.
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_16"); //Du sagst es. Mir sind die Viecher nicht geheuer.
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_17"); //Es soll dein Schaden nicht sein.
	AI_Output(hero, self, "Info_Mod_Brandon_Schatzsuche_15_18"); //Aha. Du bist abergläubig.
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_19"); //Sind wir Piraten das nicht alle?

	Log_CreateTopic	(TOPIC_MOD_PIR_ENTERHAKEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_PIR_ENTERHAKEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_PIR_ENTERHAKEN, "Ich muss Brandons Enterhaken in den Felsen über dem Ausweichlager finden und zurückbringen.");

	Wld_InsertItem	(ItMi_Enterhaken, "FP_ITEM_ENTERHAKEN");

	Wld_InsertNpc	(Harpie, "FP_ROAM_HARPIE_PIRATEN_01");
	Wld_InsertNpc	(Harpie, "FP_ROAM_HARPIE_PIRATEN_02");
	Wld_InsertNpc	(Harpie, "FP_ROAM_HARPIE_PIRATEN_03");
	Wld_InsertNpc	(Harpie, "FP_ROAM_HARPIE_PIRATEN_04");
};

INSTANCE Info_Mod_Brandon_Schatzsuche2 (C_INFO)
{
	npc		= Mod_931_PIR_Brandon_AW;
	nr		= 1;
	condition	= Info_Mod_Brandon_Schatzsuche2_Condition;
	information	= Info_Mod_Brandon_Schatzsuche2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier, ich hab deinen Haken.";
};

FUNC INT Info_Mod_Brandon_Schatzsuche2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brandon_Schatzsuche))
	&& (Npc_HasItems(hero, ItMi_Enterhaken) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brandon_Schatzsuche2_Info()
{
	AI_Output(hero, self, "Info_Mod_Brandon_Schatzsuche2_15_00"); //Hier, ich hab deinen Haken.

	B_GiveInvItems	(hero, self, ItMi_Enterhaken, 1);

	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche2_04_01"); //Adanosseidank! Hier hast du 300 Gold.

	B_GiveInvItems	(self, hero, ItMi_Gold, 300);

	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche2_04_02"); //Und kein Wort zu den Anderen!
	AI_Output(hero, self, "Info_Mod_Brandon_Schatzsuche2_15_03"); //Hab verstanden. Bis dann.

	B_SetTopicStatus	(TOPIC_MOD_PIR_ENTERHAKEN, LOG_SUCCESS);

	Mod_PiratenVorbereitungen += 1;

	B_GivePlayerXP	(150);

	B_Göttergefallen(2, 1);
};

INSTANCE Info_Mod_Brandon_Befreiung (C_INFO)
{
	npc		= Mod_931_PIR_Brandon_AW;
	nr		= 1;
	condition	= Info_Mod_Brandon_Befreiung_Condition;
	information	= Info_Mod_Brandon_Befreiung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hi.";
};

FUNC INT Info_Mod_Brandon_Befreiung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Greg_Befreiung2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brandon_Befreiung_Info()
{
	AI_Output(hero, self, "Info_Mod_Brandon_Befreiung_15_00"); //Hi.
	AI_Output(self, hero, "Info_Mod_Brandon_Befreiung_04_01"); //(genervt) Was willst du von mir?
	AI_Output(hero, self, "Info_Mod_Brandon_Befreiung_15_02"); //Sag mal, was ist denn mit dir los?
	AI_Output(self, hero, "Info_Mod_Brandon_Befreiung_04_03"); //Ich habe seit drei Wochen keinen Alkohol mehr getrunken. Ich werde noch wahnsinnig, Mann!
	AI_Output(hero, self, "Info_Mod_Brandon_Befreiung_15_04"); //Wie kann ich dir helfen?
	AI_Output(self, hero, "Info_Mod_Brandon_Befreiung_04_05"); //Besorg mir Alkohol. 20 Flaschen Grog sollten erstmal reichen.
	AI_Output(hero, self, "Info_Mod_Brandon_Befreiung_15_06"); //Ok, ich geh dann mal.
	AI_Output(self, hero, "Info_Mod_Brandon_Befreiung_04_07"); //Beeil dich.

	Log_CreateTopic	(TOPIC_MOD_BEL_PIRBRANDON, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_PIRBRANDON, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BEL_PIRBRANDON, "Der Pirat Brandon hat seit drei Wochen keinen Alkohol mehr getrunken. Ich soll ihm 20 Flaschen Grog besorgen.");
};

INSTANCE Info_Mod_Brandon_Befreiung2 (C_INFO)
{
	npc		= Mod_931_PIR_Brandon_AW;
	nr		= 1;
	condition	= Info_Mod_Brandon_Befreiung2_Condition;
	information	= Info_Mod_Brandon_Befreiung2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier hast du den versprochenen Alkohol.";
};

FUNC INT Info_Mod_Brandon_Befreiung2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brandon_Befreiung))
	&& (Npc_HasItems(hero, ItFo_Addon_Grog) >= 20)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brandon_Befreiung2_Info()
{
	AI_Output(hero, self, "Info_Mod_Brandon_Befreiung2_15_00"); //Hier hast du den versprochenen Alkohol.

	B_GiveInvItems	(hero, self, ItFo_Addon_Grog, 20);
	B_UseItem	(self, ItFo_Addon_Grog);

	AI_Output(self, hero, "Info_Mod_Brandon_Befreiung2_04_01"); //Danke Mann. Du bist mein Lebensretter. Nimm das.

	B_GiveInvItems	(self, hero, ItMi_Gold, 200);

	B_LogEntry_More	(TOPIC_MOD_BEL_PIRBRANDON, TOPIC_MOD_BEL_PIRATENLAGER, "Brandon's Leben habe ich gerettet.", "Ich habe Brandon das Leben gerettet.");
	B_SetTopicStatus	(TOPIC_MOD_BEL_PIRBRANDON, LOG_SUCCESS);

	B_GivePlayerXP	(185);

	Mod_Piratenbefreiung += 1;
};

INSTANCE Info_Mod_Brandon_Lehrer (C_INFO)
{
	npc		= Mod_931_PIR_Brandon_AW;
	nr		= 1;
	condition	= Info_Mod_Brandon_Lehrer_Condition;
	information	= Info_Mod_Brandon_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir was beibringen?";
};

FUNC INT Info_Mod_Brandon_Lehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brandon_Hi))
	&& (Piraten_Dabei == TRUE)
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brandon_Lehrer_Info()
{
	B_Say	(hero, self, "$KANNSTDUMIRWASBEIBRINGEN");

	AI_Output(self, hero, "Info_Mod_Brandon_Lehrer_04_00"); //Ich kann dir helfen stärker zu werden.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_PIRATEN, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_PIRATEN, "Brandon kann dafür sorgen, dass ich stärker werde.");
};

INSTANCE Info_Mod_Brandon_Lernen(C_INFO)
{
	npc		= Mod_931_PIR_Brandon_AW;
	nr		= 1;
	condition	= Info_Mod_Brandon_Lernen_Condition;
	information	= Info_Mod_Brandon_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description 	= "Ich will stärker werden!";
};   
                    
FUNC INT Info_Mod_Brandon_Lernen_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Mod_Brandon_Lehrer))
	&& (hero.attribute[ATR_STRENGTH] < 200)
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};	
};

func VOID Info_Mod_Brandon_Lernen_Info()
{	
	AI_Output (hero, self, "Info_Mod_Brandon_Lernen_15_00"); //Bring mir was bei!
	
	Info_ClearChoices (Info_Mod_Brandon_Lernen);

	Info_AddChoice (Info_Mod_Brandon_Lernen, DIALOG_BACK,Info_Mod_Brandon_Lernen_Back);
	Info_AddChoice (Info_Mod_Brandon_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Brandon_Lernen_5);
	Info_AddChoice (Info_Mod_Brandon_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Brandon_Lernen_1);
};

FUNC VOID Info_Mod_Brandon_Lernen_Back()
{
	Info_ClearChoices (Info_Mod_Brandon_Lernen);
};

FUNC VOID Info_Mod_Brandon_Lernen_1()
{
	B_TeachAttributePoints (self, hero, ATR_STRENGTH, 1, 200);
	
	Info_ClearChoices (Info_Mod_Brandon_Lernen);

	Info_AddChoice (Info_Mod_Brandon_Lernen,DIALOG_BACK,Info_Mod_Brandon_Lernen_Back);
	Info_AddChoice (Info_Mod_Brandon_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Brandon_Lernen_5);
	Info_AddChoice (Info_Mod_Brandon_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Brandon_Lernen_1);
};

FUNC VOID Info_Mod_Brandon_Lernen_5()
{
	B_TeachAttributePoints_New (self, hero, ATR_STRENGTH, 5, 200);

	Info_ClearChoices (Info_Mod_Brandon_Lernen);

	Info_AddChoice (Info_Mod_Brandon_Lernen,DIALOG_BACK,Info_Mod_Brandon_Lernen_Back);
	Info_AddChoice (Info_Mod_Brandon_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Brandon_Lernen_5);
	Info_AddChoice (Info_Mod_Brandon_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Brandon_Lernen_1);	
};

INSTANCE Info_Mod_Brandon_Pickpocket (C_INFO)
{
	npc		= Mod_931_PIR_Brandon_AW;
	nr		= 1;
	condition	= Info_Mod_Brandon_Pickpocket_Condition;
	information	= Info_Mod_Brandon_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Brandon_Pickpocket_Condition()
{
	C_Beklauen	(61, ItMi_Gold, 26);
};

FUNC VOID Info_Mod_Brandon_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Brandon_Pickpocket);

	Info_AddChoice	(Info_Mod_Brandon_Pickpocket, DIALOG_BACK, Info_Mod_Brandon_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Brandon_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Brandon_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Brandon_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Brandon_Pickpocket);
};

FUNC VOID Info_Mod_Brandon_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Brandon_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Brandon_Pickpocket);

		Info_AddChoice	(Info_Mod_Brandon_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Brandon_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Brandon_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Brandon_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Brandon_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Brandon_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Brandon_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Brandon_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Brandon_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Brandon_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Brandon_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Brandon_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Brandon_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Brandon_EXIT (C_INFO)
{
	npc		= Mod_931_PIR_Brandon_AW;
	nr		= 1;
	condition	= Info_Mod_Brandon_EXIT_Condition;
	information	= Info_Mod_Brandon_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Brandon_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Brandon_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};