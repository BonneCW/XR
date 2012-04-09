INSTANCE Info_Mod_Juan_Quest (C_INFO)
{
	npc		= Mod_955_BDT_Juan_MT;
	nr		= 1;
	condition	= Info_Mod_Juan_Quest_Condition;
	information	= Info_Mod_Juan_Quest_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Juan_Quest_Condition()
{
	if ((Npc_KnowsInfo(hero, Info_Mod_Dexter_AngriffVorbei))
	&& (Mod_AlbertTransforms >= 8)
	&& (Mod_Dexter_BanditenParty+2 <= Wld_GetDay()))
	|| ((Npc_KnowsInfo(hero, Info_Mod_Dexter_Hi))
	&& (Banditen_Dabei == FALSE))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Juan_Quest_Info()
{
	AI_Output(self, hero, "Info_Mod_Juan_Quest_13_00"); //Hey, du bist doch ein zäher Bursche ...? Natürlich bist du das, das hast du mehr als bewiesen.
	AI_Output(self, hero, "Info_Mod_Juan_Quest_13_01"); //Und du magst bestimmt Herausforderungen. Dann habe ich die richtige Aufgabe für dich, bei welcher noch gut was für dich rausspringen wird.
	AI_Output(hero, self, "Info_Mod_Juan_Quest_15_02"); //Worum geht es?
	AI_Output(self, hero, "Info_Mod_Juan_Quest_13_03"); //Es gibt da einen Händler, der etwas besitzt, was ich gerne hätte. Und da du so ein smarter Bursche bist, wirst du es mir besorgen.
	AI_Output(self, hero, "Info_Mod_Juan_Quest_13_04"); //Dafür lasse ich auch 300 Goldmünzen springen. Was sagst du?

	Info_ClearChoices	(Info_Mod_Juan_Quest);

	Info_AddChoice	(Info_Mod_Juan_Quest, "Nein, da solltest du dir jemand anderen suchen.", Info_Mod_Juan_Quest_B);
	Info_AddChoice	(Info_Mod_Juan_Quest, "Ja, ich bin dabei.", Info_Mod_Juan_Quest_A);
};

FUNC VOID Info_Mod_Juan_Quest_B()
{
	AI_Output(hero, self, "Info_Mod_Juan_Quest_B_15_00"); //Nein, da solltest du dir jemand anderen suchen.
	AI_Output(self, hero, "Info_Mod_Juan_Quest_B_13_01"); //(ärgerlich) Pah, dann eben nicht.
	
	Info_ClearChoices	(Info_Mod_Juan_Quest);
};

FUNC VOID Info_Mod_Juan_Quest_A()
{
	AI_Output(hero, self, "Info_Mod_Juan_Quest_A_15_00"); //Ja, ich bin dabei.
	AI_Output(self, hero, "Info_Mod_Juan_Quest_A_13_01"); //Großartig! Der Händler heißt Antonius. Er müsste zurzeit vor dem Alten Lager herumgammeln. Schlag ihn nieder und bring mir einfach alles, was er bei sich hat, ok?

	Mod_JuanQuest = 1;

	Log_CreateTopic	(TOPIC_MOD_BDT_JUAN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BDT_JUAN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BDT_JUAN, "Ich soll für Juan den Händler Antonius ausrauben, welcher vor dem Alten Lager steht.");

	Wld_InsertNpc	(Mod_7189_OUT_Antonius_MT, "OC1");
	
	Info_ClearChoices	(Info_Mod_Juan_Quest);

	Info_AddChoice	(Info_Mod_Juan_Quest, "Was genau soll ich denn beschaffen?", Info_Mod_Juan_Quest_D);
	Info_AddChoice	(Info_Mod_Juan_Quest, "Das sollte ich wohl hinbekommen.", Info_Mod_Juan_Quest_C);
};

FUNC VOID Info_Mod_Juan_Quest_D()
{
	AI_Output(hero, self, "Info_Mod_Juan_Quest_D_15_00"); //Was genau soll ich denn beschaffen?
	AI_Output(self, hero, "Info_Mod_Juan_Quest_D_13_01"); //Bring mir einfach alles, was er bei sich hat. Er wird es bei sich haben.
	
	Info_ClearChoices	(Info_Mod_Juan_Quest);
};

FUNC VOID Info_Mod_Juan_Quest_C()
{
	AI_Output(hero, self, "Info_Mod_Juan_Quest_C_15_00"); //Das sollte ich wohl hinbekommen.
	
	Info_ClearChoices	(Info_Mod_Juan_Quest);
};

INSTANCE Info_Mod_Juan_Antonius (C_INFO)
{
	npc		= Mod_955_BDT_Juan_MT;
	nr		= 1;
	condition	= Info_Mod_Juan_Antonius_Condition;
	information	= Info_Mod_Juan_Antonius_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ähh, ich habe alles, was der Händler bei sich hatte.";
};

FUNC INT Info_Mod_Juan_Antonius_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Juan_Quest))
	&& (Mod_JuanQuest == 1)
	&& (Npc_IsDead(Mod_7189_OUT_Antonius_MT))
	&& (Npc_HasItems(hero, ItMi_Stuff_Barbknife_01) >= 10)
	&& (Npc_HasItems(hero, ItMi_Pan) >= 3)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 150)
	&& (Npc_HasItems(hero, ItFo_Addon_Grog) >= 10)
	&& (Npc_HasItems(hero, ItFo_Cheese) >= 1)
	&& (Npc_HasItems(hero, ItFo_Bread) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Juan_Antonius_Info()
{
	AI_Output(hero, self, "Info_Mod_Juan_Antonius_15_00"); //Ähh, ich habe alles, was der Händler bei sich hatte.
	AI_Output(self, hero, "Info_Mod_Juan_Antonius_13_01"); //Ja, zeig her.
	AI_Output(hero, self, "Info_Mod_Juan_Antonius_15_02"); //Da wären Rasiermesser, Pfannen, als Wegzehrung einige Flaschen Grog, 1 Stück Käse ...
	AI_Output(self, hero, "Info_Mod_Juan_Antonius_13_03"); //Ach, verdammt, behalt den Dreck. Obwohl ... den Grog nehm ich an mich.

	B_GiveInvItems	(hero, self, ItFo_Addon_Grog, 10);

	AI_TurnAway	(self, hero);

	AI_Output(self, hero, "Info_Mod_Juan_Antonius_13_04"); //(zu sich selbst) Dann muss er es schon an Hortensius weiterverkauft haben ...
	AI_Output(hero, self, "Info_Mod_Juan_Antonius_15_05"); //Was ist jetzt mit meinem Gold?

	AI_TurnToNpc	(self, hero);

	AI_Output(self, hero, "Info_Mod_Juan_Antonius_13_06"); //Sehr witzig. Ich mach dir ein Angebot. Wenn du einen weiteren Händler beraubst, der die Ware bei sich haben muss, lege ich noch 50 Gold drauf.

	B_GivePlayerXP	(100);

	Info_ClearChoices	(Info_Mod_Juan_Antonius);

	Info_AddChoice	(Info_Mod_Juan_Antonius, "Vergiss es. Gib mir einfach mein Gold.", Info_Mod_Juan_Antonius_C);
	Info_AddChoice	(Info_Mod_Juan_Antonius, "Ich will erst wissen, was ich dir überhaupt besorgen soll.", Info_Mod_Juan_Antonius_B);
	Info_AddChoice	(Info_Mod_Juan_Antonius, "Na gut, ich machs.", Info_Mod_Juan_Antonius_A);
};

FUNC VOID Info_Mod_Juan_Antonius_C()
{
	AI_Output(hero, self, "Info_Mod_Juan_Antonius_C_15_00"); //Vergiss es. Gib mir einfach mein Gold.
	AI_Output(self, hero, "Info_Mod_Juan_Antonius_C_13_01"); //Ich geb dir 100 Gold und keine Münze mehr.
	
	Info_ClearChoices	(Info_Mod_Juan_Antonius);

	Info_AddChoice	(Info_Mod_Juan_Antonius, "Du gibst mir die vereinbarte Summe oder ich hol sie mir!", Info_Mod_Juan_Antonius_E);
	Info_AddChoice	(Info_Mod_Juan_Antonius, "Ok, dann eben nur 100 ...", Info_Mod_Juan_Antonius_D);
};

FUNC VOID Info_Mod_Juan_Antonius_B()
{
	AI_Output(hero, self, "Info_Mod_Juan_Antonius_B_15_00"); //Ich will erst wissen, was ich dir überhaupt besorgen soll.
	AI_Output(self, hero, "Info_Mod_Juan_Antonius_B_13_01"); //Ok, es ist ein Buch. Der Händler heißt Hortensius. Er muss sich irgendwo bei den Sumpfspinnern aufhalten. Wie gehabt, niederschlagen und mir alles bringen.
	
	Info_ClearChoices	(Info_Mod_Juan_Antonius);

	Info_AddChoice	(Info_Mod_Juan_Antonius, "Vergiss es. Gib mir einfach mein Gold.", Info_Mod_Juan_Antonius_C);
	Info_AddChoice	(Info_Mod_Juan_Antonius, "Na gut, ich breche auf.", Info_Mod_Juan_Antonius_F);
};

FUNC VOID Info_Mod_Juan_Antonius_A()
{
	AI_Output(hero, self, "Info_Mod_Juan_Antonius_A_15_00"); //Na gut, ich machs.
	AI_Output(self, hero, "Info_Mod_Juan_Antonius_A_13_01"); //Ok, der Händler heißt Hortensius. Er muss sich irgendwo bei den Sumpfspinnern aufhalten. Wie gehabt, niederschlagen und mir alles bringen.

	Mod_JuanQuest = 2;

	B_LogEntry	(TOPIC_MOD_BDT_JUAN, "Verdammt! Antonius hatte nicht den Gegenstand bei sich, den Juan haben wollte. Jetzt darf ich zum Sumpflager rennen und Hortensius zu berauben.");

	Wld_InsertNpc	(Mod_7190_OUT_Hortensius_MT, "OC1");
	
	Info_ClearChoices	(Info_Mod_Juan_Antonius);
};

FUNC VOID Info_Mod_Juan_Antonius_E()
{
	AI_Output(hero, self, "Info_Mod_Juan_Antonius_E_15_00"); //Du gibst mir die vereinbarte Summe oder ich hol sie mir!
	AI_Output(self, hero, "Info_Mod_Juan_Antonius_E_13_01"); //Du willst mir drohen?
	
	Info_ClearChoices	(Info_Mod_Juan_Antonius);

	AI_StopProcessInfos	(self);

	CreateInvItems	(self, ItMi_Gold, 340);

	B_Attack	(self, hero, AR_None, 0);
};

FUNC VOID Info_Mod_Juan_Antonius_D()
{
	AI_Output(hero, self, "Info_Mod_Juan_Antonius_D_15_00"); //Ok, dann eben nur 100 ...

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	B_SetTopicStatus	(TOPIC_MOD_BDT_JUAN, LOG_FAILED);
	
	Info_ClearChoices	(Info_Mod_Juan_Antonius);
};

FUNC VOID Info_Mod_Juan_Antonius_F()
{
	AI_Output(hero, self, "Info_Mod_Juan_Antonius_F_15_00"); //Na gut, ich breche auf.
	
	Mod_JuanQuest = 2;

	B_LogEntry	(TOPIC_MOD_BDT_JUAN, "Verdammt! Antonius hatte nicht den Gegenstand bei sich, den Juan haben wollte. Jetzt darf ich zum Sumpflager rennen und Hortensius zu berauben.");

	Wld_InsertNpc	(Mod_7190_OUT_Hortensius_MT, "OC1");
	
	Info_ClearChoices	(Info_Mod_Juan_Antonius);
};

INSTANCE Info_Mod_Juan_Hortensius (C_INFO)
{
	npc		= Mod_955_BDT_Juan_MT;
	nr		= 1;
	condition	= Info_Mod_Juan_Hortensius_Condition;
	information	= Info_Mod_Juan_Hortensius_Info;
	permanent	= 0;
	important	= 0;
	description	= "So, hier ist der Krempel.";
};

FUNC INT Info_Mod_Juan_Hortensius_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Juan_Quest))
	&& (Mod_JuanQuest == 2)
	&& (Npc_IsDead(Mod_7190_OUT_Hortensius_MT))
	&& (Npc_HasItems(hero, ItMi_Scoop) >= 7)
	&& (Npc_HasItems(hero, ItMi_Stomper) >= 4)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 140)
	&& (Npc_HasItems(hero, ItFo_Booze) >= 12)
	&& (Npc_HasItems(hero, ItFo_Honey) >= 6)
	&& (Npc_HasItems(hero, ItMi_Lute) >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Juan_Hortensius_Info()
{
	AI_Output(hero, self, "Info_Mod_Juan_Hortensius_15_00"); //So, hier ist der Krempel.
	AI_Output(self, hero, "Info_Mod_Juan_Hortensius_13_01"); //Verflucht, das kann nicht sein ... es sei denn ...
	
	AI_TurnAway	(self, hero);

	AI_Output(self, hero, "Info_Mod_Juan_Hortensius_13_02"); //(zu sich selbst) dann muss es Florentius haben.
	
	AI_TurnToNpc	(self, hero);

	AI_Output(self, hero, "Info_Mod_Juan_Hortensius_13_03"); //Ich schlage noch mal 50 Gold drauf, wenn du zum Neuen Lager gehst und mir das Buch bringst, was Florentius bei sich haben MUSS.
	AI_Output(self, hero, "Info_Mod_Juan_Hortensius_13_04"); //Ach, und den Wacholder behalte ich mal.

	B_GiveInvItems	(hero, self, ItFo_Booze, 12);

	B_GivePlayerXP	(100);

	Info_ClearChoices	(Info_Mod_Juan_Hortensius);

	Info_AddChoice	(Info_Mod_Juan_Hortensius, "Jetzt ist aber mal genug! Gib mir einfach mein Gold.", Info_Mod_Juan_Hortensius_B);
	Info_AddChoice	(Info_Mod_Juan_Hortensius, "(leicht resignativ) Ok, dann eben auf ein Drittes.", Info_Mod_Juan_Hortensius_A);
};

FUNC VOID Info_Mod_Juan_Hortensius_B()
{
	AI_Output(hero, self, "Info_Mod_Juan_Hortensius_B_15_00"); //Jetzt ist aber mal genug! Gib mir einfach mein Gold.
	AI_Output(self, hero, "Info_Mod_Juan_Hortensius_B_13_01"); //(trotzig) Dann geb dir eben 150.
	
	Info_ClearChoices	(Info_Mod_Juan_Hortensius);

	Info_AddChoice	(Info_Mod_Juan_Hortensius, "Willst du mich verarschen?! Gib mir die vereinbarte Summe oder ich hol sie mir.", Info_Mod_Juan_Hortensius_D);
	Info_AddChoice	(Info_Mod_Juan_Hortensius, "Na gut, das lässt sich wohl nicht ändern.", Info_Mod_Juan_Hortensius_c);
};

FUNC VOID Info_Mod_Juan_Hortensius_A()
{
	AI_Output(hero, self, "Info_Mod_Juan_Hortensius_A_15_00"); //(leicht resignativ) Ok, dann eben auf ein Drittes.
	
	Mod_JuanQuest = 3;

	B_LogEntry	(TOPIC_MOD_BDT_JUAN, "Langsam recht es mir aber! Da Hortensius ebenfalls nicht im Besitzt des Artefaktes war, soll ich diesmal ins Neue Lager rennen, um Florentius auszunehmen.");

	Wld_InsertNpc	(Mod_7191_OUT_Florentius_MT, "OC1");
	
	Info_ClearChoices	(Info_Mod_Juan_Hortensius);
};

FUNC VOID Info_Mod_Juan_Hortensius_D()
{
	AI_Output(hero, self, "Info_Mod_Juan_Hortensius_D_15_00"); //Willst du mich verarschen?! Gib mir die vereinbarte Summe, oder ich hol sie mir.
	AI_Output(self, hero, "Info_Mod_Juan_Antonius_E_13_01"); //Du willst mir drohen?

	AI_StopProcessInfos	(self);

	CreateInvItems	(self, ItMi_Gold, 290);

	B_Attack	(self, hero, AR_None, 0);
};

FUNC VOID Info_Mod_Juan_Hortensius_C()
{
	AI_Output(hero, self, "Info_Mod_Juan_Hortensius_C_15_00"); //Na gut, das lässt sich wohl nicht ändern.

	B_GiveInvItems	(self, hero, ItMi_Gold, 150);

	B_SetTopicStatus	(TOPIC_MOD_BDT_JUAN, LOG_FAILED);
	
	Info_ClearChoices	(Info_Mod_Juan_Antonius);
};

INSTANCE Info_Mod_Juan_Florentius (C_INFO)
{
	npc		= Mod_955_BDT_Juan_MT;
	nr		= 1;
	condition	= Info_Mod_Juan_Florentius_Condition;
	information	= Info_Mod_Juan_Florentius_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe das Buch.";
};

FUNC INT Info_Mod_Juan_Florentius_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Juan_Quest))
	&& ((Mod_JuanQuest == 3)
	|| (Mod_JuanQuest == 4))
	&& (Npc_IsDead(Mod_7191_OUT_Florentius_MT))
	&& (Npc_HasItems(hero, ItWr_JuanBook) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Juan_Florentius_Info()
{
	AI_Output(hero, self, "Info_Mod_Juan_Florentius_15_00"); //Ich habe das Buch.
	AI_Output(self, hero, "Info_Mod_Juan_Florentius_13_01"); //Ja?! Gib schon her.
	
	B_GivePlayerXP	(500);

	CurrentNQ += 1;

	Info_ClearChoices	(Info_Mod_Juan_Florentius);

	if (Mod_JuanQuest == 4)
	{
		Info_AddChoice	(Info_Mod_Juan_Florentius, "Der Preis ist gestiegen.", Info_Mod_Juan_Florentius_B);
	};
	Info_AddChoice	(Info_Mod_Juan_Florentius, "Hier hast du es.", Info_Mod_Juan_Florentius_A);
};

FUNC VOID Info_Mod_Juan_Florentius_B()
{
	AI_Output(hero, self, "Info_Mod_Juan_Florentius_B_15_00"); //Der Preis ist gestiegen.
	AI_Output(self, hero, "Info_Mod_Juan_Florentius_B_13_01"); //Was soll das heißen?!
	AI_Output(hero, self, "Info_Mod_Juan_Florentius_B_15_02"); //Dass es jetzt mehr kostet. Die Händler würde es bestimmt interessieren zu erfahren, dass ich sie in deinem Auftrag überfallen habe.
	AI_Output(self, hero, "Info_Mod_Juan_Florentius_B_13_03"); //Du dreckiger Bastard ... Wie viel willst du?
	
	Info_ClearChoices	(Info_Mod_Juan_Florentius);

	Info_AddChoice	(Info_Mod_Juan_Florentius, "1000 Gold.", Info_Mod_Juan_Florentius_E);
	Info_AddChoice	(Info_Mod_Juan_Florentius, "700 Gold.", Info_Mod_Juan_Florentius_D);
	Info_AddChoice	(Info_Mod_Juan_Florentius, "500 Gold.", Info_Mod_Juan_Florentius_c);
};

FUNC VOID Info_Mod_Juan_Florentius_A()
{
	AI_Output(hero, self, "Info_Mod_Juan_Florentius_A_15_00"); //Hier hast du es.

	B_GiveInvItems	(hero, self, ItWr_JuanBook, 1);

	AI_Output(self, hero, "Info_Mod_Juan_Florentius_A_13_01"); //Sehr gut. Hier hast du dein Gold.

	B_GiveInvItems	(self, hero, ItMi_Gold, 400);

	B_GivePlayerXP	(300);
	
	Mod_JuanQuest = 5;

	B_SetTopicStatus	(TOPIC_MOD_BDT_JUAN, LOG_SUCCESS);

	B_Göttergefallen(3, 1);
	
	Info_ClearChoices	(Info_Mod_Juan_Florentius);
};

FUNC VOID Info_Mod_Juan_Florentius_E()
{
	AI_Output(hero, self, "Info_Mod_Juan_Florentius_E_15_00"); //1000 Gold.
	AI_Output(self, hero, "Info_Mod_Juan_Florentius_D_13_01"); //Halt mal kurz still. Auf deiner Schulter sitzt ein großes, hässliches Vieh.
	
	Info_ClearChoices	(Info_Mod_Juan_Florentius);

	AI_StopProcessInfos	(self);

	CreateInvItems	(self, ItMi_Gold, 723);

	B_Attack	(self, hero, AR_None, 0);
};

FUNC VOID Info_Mod_Juan_Florentius_F(var int Goldi)
{
	AI_Output(self, hero, "Info_Mod_Juan_Florentius_F_13_00"); //Na gut. Hier hast du dein Gold.

	B_GiveInvItems	(self, hero, ItMi_Gold, Goldi);

	AI_Output(self, hero, "Info_Mod_Juan_Florentius_F_13_01"); //Und jetzt her mit dem Buch.

	B_GiveInvItems	(hero, self, ItWr_JuanBook, 1);

	B_GivePlayerXP	(300);
	
	Mod_JuanQuest = 5;

	B_Göttergefallen(3, 1);

	B_SetTopicStatus	(TOPIC_MOD_BDT_JUAN, LOG_SUCCESS);
	
	Info_ClearChoices	(Info_Mod_Juan_Florentius);
};

FUNC VOID Info_Mod_Juan_Florentius_D()
{
	AI_Output(hero, self, "Info_Mod_Juan_Florentius_D_15_00"); //700 Gold.

	Info_Mod_Juan_Florentius_F(700);
};

FUNC VOID Info_Mod_Juan_Florentius_C()
{
	AI_Output(hero, self, "Info_Mod_Juan_Florentius_C_15_00"); //500 Gold.

	Info_Mod_Juan_Florentius_F(500);
};

INSTANCE Info_Mod_Juan_Pickpocket (C_INFO)
{
	npc		= Mod_955_BDT_Juan_MT;
	nr		= 1;
	condition	= Info_Mod_Juan_Pickpocket_Condition;
	information	= Info_Mod_Juan_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Juan_Pickpocket_Condition()
{
	C_Beklauen	(59, ItMi_Gold, 130);
};

FUNC VOID Info_Mod_Juan_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Juan_Pickpocket);

	Info_AddChoice	(Info_Mod_Juan_Pickpocket, DIALOG_BACK, Info_Mod_Juan_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Juan_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Juan_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Juan_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Juan_Pickpocket);
};

FUNC VOID Info_Mod_Juan_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Juan_Pickpocket);
};

INSTANCE Info_Mod_Juan_EXIT (C_INFO)
{
	npc		= Mod_955_BDT_Juan_MT;
	nr		= 1;
	condition	= Info_Mod_Juan_EXIT_Condition;
	information	= Info_Mod_Juan_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Juan_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Juan_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};