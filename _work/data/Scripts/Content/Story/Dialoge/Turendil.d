INSTANCE Info_Mod_Turendil_Hi (C_INFO)
{
	npc		= Mod_1955_VMG_Turendil_MT;
	nr		= 1;
	condition	= Info_Mod_Turendil_Hi_Condition;
	information	= Info_Mod_Turendil_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Turendil_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ferco_QuestThree))
	&& (Npc_KnowsInfo(hero, Info_Mod_Turendil_WerBistDu))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Turendil_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Turendil_Hi_05_00"); //Da bist du ja endlich, ich habe schon auf dich gewartet.
	AI_Output(hero, self, "Info_Mod_Turendil_Hi_15_01"); //Worum geht es?
	AI_Output(self, hero, "Info_Mod_Turendil_Hi_05_02"); //Wie du vielleicht schon gehört hast, kommen wir aus Tugettso, einem grünen Tal sehr weit im Westen.
	AI_Output(self, hero, "Info_Mod_Turendil_Hi_05_03"); //Überall wachsen armlange Pflanzen, du hörst das Summen der Honigbienen, das Fiepen einiger leckerer Fleischwanzen ... verdammt, ich schweife ab.
	AI_Output(self, hero, "Info_Mod_Turendil_Hi_05_04"); //Also seit kurzem wird Tugettso von einer Plage heimgesucht.

	Info_ClearChoices	(Info_Mod_Turendil_Hi);

	Info_AddChoice	(Info_Mod_Turendil_Hi, "Interessiert mich nicht.", Info_Mod_Turendil_Hi_B);
	Info_AddChoice	(Info_Mod_Turendil_Hi, "Was für eine Plage?", Info_Mod_Turendil_Hi_A);
};

FUNC VOID Info_Mod_Turendil_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Turendil_Hi_B_15_00"); //Interessiert mich nicht.
	AI_Output(self, hero, "Info_Mod_Turendil_Hi_B_05_01"); //Bitte! Du bist unsere letzte Hoffnung!

	Info_ClearChoices	(Info_Mod_Turendil_Hi);

	Info_AddChoice	(Info_Mod_Turendil_Hi, "Wie viel springt denn für mich dabei raus?", Info_Mod_Turendil_Hi_C);
};

FUNC VOID Info_Mod_Turendil_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_Turendil_Hi_C_15_00"); //Wie viel springt denn für mich dabei raus?
	AI_Output(self, hero, "Info_Mod_Turendil_Hi_C_05_01"); //Es soll dein Schaden nicht sein.

	Info_ClearChoices	(Info_Mod_Turendil_Hi);

	Info_AddChoice	(Info_Mod_Turendil_Hi, "Was für eine Plage?", Info_Mod_Turendil_Hi_A);
};

FUNC VOID Info_Mod_Turendil_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Turendil_Hi_A_15_00"); //Was für eine Plage?
	AI_Output(self, hero, "Info_Mod_Turendil_Hi_A_05_01"); //Eine Goblinplage. Sie fallen in unser Tal ein und knicken unsere Zweige um, machen Feuerholz aus den Bäumen, zerklatschen die Bienen, zertreten die leckeren Fleischwanzen ... ähm, sie sind eben eine Bedrohung.
	AI_Output(hero, self, "Info_Mod_Turendil_Hi_A_15_02"); //Und ich soll sie alle umbringen? Alleine?
	AI_Output(self, hero, "Info_Mod_Turendil_Hi_A_05_03"); //Wir können dir Verstärkung geben. Einen Kämpfer und einen Magier. Außerdem kann ich dir einige Heiltränke zur Verfügung stellen.
	AI_Output(hero, self, "Info_Mod_Turendil_Hi_A_15_04"); //Hm, na gut.
	AI_Output(self, hero, "Info_Mod_Turendil_Hi_A_05_05"); //Vielen Dank! Ich bin dir so unendlich dankbar!
	AI_Output(self, hero, "Info_Mod_Turendil_Hi_A_05_06"); //Jetzt wird unser geliebtes Tal gerettet, die Pflanzen werden wieder wachsen, die Bienen werden wieder summen, die Fleischwanzen wieder fiepen und ... ähm, danke.
	AI_Output(self, hero, "Info_Mod_Turendil_Hi_A_05_07"); //Hier sind die versprochenen Heiltränke.
	AI_Output(hero, self, "Info_Mod_Turendil_Hi_A_15_08"); //Danke, aber was ist mit der Verstärkung?
	AI_Output(self, hero, "Info_Mod_Turendil_Hi_A_05_09"); //Du kannst den Kämpfer Struk und den Magier Thorge mitnehmen. Sie werden am Tor auf dich warten.
	AI_Output(hero, self, "Info_Mod_Turendil_Hi_A_15_10"); //Gut, dann sehen wir uns später.

	CreateInvItems	(self, ItPo_Health_01, 3);
	B_GiveInvItems	(self, hero, ItPo_Health_01, 3);

	B_StartOtherRoutine	(Mod_1956_VMK_Struk_MT, "ATGATE");
	B_StartOtherRoutine	(Mod_1957_VMG_Thorge_MT, "ATGATE");

	B_LogEntry	(TOPIC_MOD_FERCO_GOBLIN, "Anscheinend leiden die Bewohner von diesem Ort, Tugettso, an einer Goblinplage. Ich habe mich bereit erklärt, ihnen zu helfen, sie zu beseitigen.");

	Info_ClearChoices	(Info_Mod_Turendil_Hi);
};

INSTANCE Info_Mod_Turendil_Wohin (C_INFO)
{
	npc		= Mod_1955_VMG_Turendil_MT;
	nr		= 1;
	condition	= Info_Mod_Turendil_Wohin_Condition;
	information	= Info_Mod_Turendil_Wohin_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Turendil_Wohin_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Turendil_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Turendil_Wohin_Info()
{
	AI_Output(self, hero, "Info_Mod_Turendil_Wohin_05_00"); //Warte! Du weißt doch gar nicht, wie man dort hin kommt. Die Plattform, auf der der Fokus damals lag, haben wir zu einem Teleporter umfunktioniert.
	AI_Output(self, hero, "Info_Mod_Turendil_Wohin_05_01"); //Dort oben steht Albert, er erklärt dir, wie du ihn nutzen kannst.
	AI_Output(hero, self, "Info_Mod_Turendil_Wohin_15_02"); //Danke für den Tipp.
	AI_Output(self, hero, "Info_Mod_Turendil_Wohin_05_03"); //Pass auf dich auf.

	B_LogEntry	(TOPIC_MOD_FERCO_GOBLIN, "Die alte Fokusplattform ist nun ein Teleporter. Ich sollte zu diesem Albert gehen und ihn fragen, wie er funktioniert. Vorher sollte ich jedoch Struk und Thorge beim Tor abholen, damit ich nicht alleine kämpfen muss.");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Turendil_Matronen (C_INFO)
{
	npc		= Mod_1955_VMG_Turendil_MT;
	nr		= 1;
	condition	= Info_Mod_Turendil_Matronen_Condition;
	information	= Info_Mod_Turendil_Matronen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Turendil_Matronen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Albert_Matronen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Turendil_Matronen_Info()
{
	AI_Output(self, hero, "Info_Mod_Turendil_Matronen_05_00"); //Ich sehe, du bist zurück. Dann erzähl doch mal. Summen die Bienen wieder ...?
	AI_Output(hero, self, "Info_Mod_Turendil_Matronen_15_01"); //(unterbricht) Ja, das tun sie. Ein von Menschenhand verursachter Erdrutsch hat das Tunnelsystem zusammenbrechen lassen.
	AI_Output(hero, self, "Info_Mod_Turendil_Matronen_15_02"); //Ich habe den Nachwuchs gestoppt und den Verantwortlichen zur Rechenschaft gezogen. Den Rest erledigen Genn und die anderen vor Ort.
	AI_Output(self, hero, "Info_Mod_Turendil_Matronen_05_03"); //Das freut mich zu hören. Hier hast du deine Entlohnung.

	CreateInvItems	(self, ItMi_Gold, 500);
	B_GiveInvItems	(self, hero, ItMi_Gold, 500);

	AI_Output(self, hero, "Info_Mod_Turendil_Matronen_05_04"); //Faice sucht schon wieder nach dir. Geh am besten gleich zu ihm.

	B_LogEntry	(TOPIC_MOD_FERCO_GOBLIN, "Ich habe meine Entlohnung erhalten.");
	B_SetTopicStatus	(TOPIC_MOD_FERCO_GOBLIN, LOG_SUCCESS);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Turendil_Faice (C_INFO)
{
	npc		= Mod_1955_VMG_Turendil_MT;
	nr		= 1;
	condition	= Info_Mod_Turendil_Faice_Condition;
	information	= Info_Mod_Turendil_Faice_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Turendil_Faice_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Faice_RitualRunning))
	&& (Npc_IsInState(Mod_4019_VMG_Faice_MT, ZS_Drained))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Turendil_Faice_Info()
{
	AI_GotoNpc	(self, Mod_4019_VMG_Faice_MT);

	AI_PlayAni	(self, "T_PLUNDER");

	AI_TurnToNpc	(self, hero);
	AI_TurnToNpc	(hero, self);

	AI_Output(self, hero, "Info_Mod_Turendil_Faice_05_00"); //Es ist schrecklich!

	B_StartOtherRoutine	(Mod_4020_VMG_Hermy_MT, "START");
	B_StartOtherRoutine	(Mod_1626_VMG_Furt_MT, "START");
	B_StartOtherRoutine	(Mod_1625_VMG_Neol_MT, "START");
	B_StartOtherRoutine	(Mod_1628_VMG_Anor_MT, "START");
	
	Info_ClearChoices	(Info_Mod_Turendil_Faice);

	Info_AddChoice	(Info_Mod_Turendil_Faice, "Er war sowieso hinfällig.", Info_Mod_Turendil_Faice_B);
	Info_AddChoice	(Info_Mod_Turendil_Faice, "Wie kann das sein?", Info_Mod_Turendil_Faice_A);
};

FUNC VOID Info_Mod_Turendil_Faice_B()
{
	AI_Output(hero, self, "Info_Mod_Turendil_Faice_B_15_00"); //Er war sowieso hinfällig.
	AI_Output(self, hero, "Info_Mod_Turendil_Faice_B_05_01"); //Er ist vielleicht senil, aber kein alter Greis! Wie kannst du nur so etwas sagen?
	
	Info_ClearChoices	(Info_Mod_Turendil_Faice);

	Info_AddChoice	(Info_Mod_Turendil_Faice, "Ist doch wahr.", Info_Mod_Turendil_Faice_D);
	Info_AddChoice	(Info_Mod_Turendil_Faice, "Es tut mir Leid.", Info_Mod_Turendil_Faice_C);
};

FUNC VOID Info_Mod_Turendil_Faice_E()
{
	AI_Output(self, hero, "Info_Mod_Turendil_Faice_E_05_00"); //Vielleicht war seine Schriftrolle mit der Rede vergiftet und das Gift ist so an seine Finger gelangt. Oder seine Beschwörungsspruchrollen wurden fehlerhaft beschrieben.
	AI_Output(hero, self, "Info_Mod_Turendil_Faice_E_15_01"); //Wie können wir das herausfinden?
	AI_Output(self, hero, "Info_Mod_Turendil_Faice_E_05_02"); //Komm morgen wieder, dann wissen wir wahrscheinlich genaueres.
	
	Info_ClearChoices	(Info_Mod_Turendil_Faice);

	AI_StopProcessInfos	(self);

	Mod_VMG_Faice_Gift = Wld_GetDay();

	//B_StartOtherRoutine	(Mod_4019_VMG_Faice_MT, "GIFT");
	//AI_Teleport	(Mod_4019_VMG_Faice_MT, "VMG_05");

	B_LogEntry	(TOPIC_MOD_FAICE_HEILUNG, "Morgen werde ich erfahren, was genau mit Faice geschehen ist, als er beim Ritual zusammengebrochen ist.");
};

FUNC VOID Info_Mod_Turendil_Faice_A()
{
	AI_Output(hero, self, "Info_Mod_Turendil_Faice_A_15_00"); //Wie kann das sein?

	Info_Mod_Turendil_Faice_E();
};

FUNC VOID Info_Mod_Turendil_Faice_D()
{
	AI_Output(hero, self, "Info_Mod_Turendil_Faice_D_15_00"); //Ist doch wahr.
	AI_Output(self, hero, "Info_Mod_Turendil_Faice_D_05_01"); //Verschwinde, Unwürdiger, und lass dich hier nicht mehr blicken!
	
	Info_ClearChoices	(Info_Mod_Turendil_Faice);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Turendil_Faice_C()
{
	AI_Output(hero, self, "Info_Mod_Turendil_Faice_C_15_00"); //Es tut mir Leid.
	AI_Output(self, hero, "Info_Mod_Turendil_Faice_C_05_01"); //Das will ich meinen.
	AI_Output(hero, self, "Info_Mod_Turendil_Faice_C_15_02"); //Aber was ist denn jetzt passiert?

	Info_Mod_Turendil_Faice_E();
};

INSTANCE Info_Mod_Turendil_FaiceGifty (C_INFO)
{
	npc		= Mod_1955_VMG_Turendil_MT;
	nr		= 1;
	condition	= Info_Mod_Turendil_FaiceGifty_Condition;
	information	= Info_Mod_Turendil_FaiceGifty_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Turendil_FaiceGifty_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Turendil_Faice))
	&& (Mod_VMG_Faice_Gift > 0)
	&& (Mod_VMG_Faice_Gift < Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Turendil_FaiceGifty_Info()
{
	AI_Output(self, hero, "Info_Mod_Turendil_FaiceGifty_05_00"); //Da bist du ja endlich. Wir haben schon auf dich gewartet.
	AI_Output(hero, self, "Info_Mod_Turendil_FaiceGifty_15_01"); //Was habt ihr herausgefunden?
	AI_Output(self, hero, "Info_Mod_Turendil_FaiceGifty_05_02"); //Scheinbar wurde Faice vergiftet. Es ist allerdings kein alltägliches Gift, sondern ein besonderes.
	AI_Output(self, hero, "Info_Mod_Turendil_FaiceGifty_05_03"); //Ich schätze, du wirst dich noch einmal nach Tugettso begeben müssen, denn ich weiß nur von dort, dass da die Pflanze wächst, die wir für das Gegenmittel benötigen.
	AI_Output(self, hero, "Info_Mod_Turendil_FaiceGifty_05_04"); //So eine schöne, große Pflanze. Sie hat lila Streben, weißt du. Ich ... ähm ... wo war ich stehen geblieben? Ach ja. Wir müssen außerdem noch den Schuldigen finden.
	
	Info_ClearChoices	(Info_Mod_Turendil_FaiceGifty);

	Info_AddChoice	(Info_Mod_Turendil_FaiceGifty, "Nicht schon wieder.", Info_Mod_Turendil_FaiceGifty_B);
	Info_AddChoice	(Info_Mod_Turendil_FaiceGifty, "Es wäre mir eine Ehre zu helfen.", Info_Mod_Turendil_FaiceGifty_A);
};

FUNC VOID Info_Mod_Turendil_FaiceGifty_B()
{
	AI_Output(hero, self, "Info_Mod_Turendil_FaiceGifty_B_15_00"); //Nicht schon wieder.
	AI_Output(self, hero, "Info_Mod_Turendil_FaiceGifty_B_05_01"); //Bitte! Du musst uns helfen!
	
	Info_ClearChoices	(Info_Mod_Turendil_FaiceGifty);

	Info_AddChoice	(Info_Mod_Turendil_FaiceGifty, "Nein, nicht schon wieder.", Info_Mod_Turendil_FaiceGifty_D);
	Info_AddChoice	(Info_Mod_Turendil_FaiceGifty, "Okay, was soll ich tun?", Info_Mod_Turendil_FaiceGifty_C);
};

FUNC VOID Info_Mod_Turendil_FaiceGifty_E()
{
	AI_Output(self, hero, "Info_Mod_Turendil_FaiceGifty_E_05_00"); //Gut, begib dich gleich zu Albert. Er wird dir einen Aufladestein geben.
	AI_Output(hero, self, "Info_Mod_Turendil_FaiceGifty_E_15_01"); //Das werde ich, danke.
	
	Info_ClearChoices	(Info_Mod_Turendil_FaiceGifty);

	AI_StopProcessInfos	(self);

	Mod_VMG_FaiceGifty_Gift = 1;

	B_LogEntry	(TOPIC_MOD_FAICE_HEILUNG, "Faice ist vergiftet worden und ich soll in Tugettso das Gegengift suchen. Dazu soll ich mir von Albert einen weiteren Aufladestein besorgen.");
};

FUNC VOID Info_Mod_Turendil_FaiceGifty_A()
{
	AI_Output(hero, self, "Info_Mod_Turendil_FaiceGifty_A_15_00"); //Es wäre mir eine Ehre zu helfen.

	Info_Mod_Turendil_FaiceGifty_E();
};

FUNC VOID Info_Mod_Turendil_FaiceGifty_D()
{
	AI_Output(hero, self, "Info_Mod_Turendil_FaiceGifty_D_15_00"); //Nein, nicht schon wieder.
	AI_Output(self, hero, "Info_Mod_Turendil_FaiceGifty_D_05_01"); //Dann geh, aber überlege es dir. Unser Schicksal hängt vielleicht davon ab.
	
	Info_ClearChoices	(Info_Mod_Turendil_FaiceGifty);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Turendil_FaiceGifty_C()
{
	AI_Output(hero, self, "Info_Mod_Turendil_FaiceGifty_C_15_00"); //Okay, was soll ich tun?

	Info_Mod_Turendil_FaiceGifty_E();
};

INSTANCE Info_Mod_Turendil_Mendulus (C_INFO)
{
	npc		= Mod_1955_VMG_Turendil_MT;
	nr		= 1;
	condition	= Info_Mod_Turendil_Mendulus_Condition;
	information	= Info_Mod_Turendil_Mendulus_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Turendil_Mendulus_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Albert_Mendulus))
	&& (Mod_VMG_FaiceGifty_Gift == 9)
	&& (Npc_HasItems(hero, ItPl_Mendulus) > 0)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Turendil_Mendulus_Info()
{
	AI_Output(self, hero, "Info_Mod_Turendil_Mendulus_05_00"); //Hast du das Kraut?
		
	Info_ClearChoices	(Info_Mod_Turendil_Mendulus);

	Info_AddChoice	(Info_Mod_Turendil_Mendulus, "Nein, ich konnte leider nichts finden.", Info_Mod_Turendil_Mendulus_B);
	Info_AddChoice	(Info_Mod_Turendil_Mendulus, "Ja hier ist die Pflanze.", Info_Mod_Turendil_Mendulus_A);
};

FUNC VOID Info_Mod_Turendil_Mendulus_B()
{
	AI_Output(hero, self, "Info_Mod_Turendil_Mendulus_B_15_00"); //Nein, ich konnte leider nichts finden.
	AI_Output(self, hero, "Info_Mod_Turendil_Mendulus_B_05_01"); //Ist das dein Ernst? Das kann nicht dein Ernst sein!
	
	Info_ClearChoices	(Info_Mod_Turendil_Mendulus);

	Info_AddChoice	(Info_Mod_Turendil_Mendulus, "Das ist mein voller Ernst.", Info_Mod_Turendil_Mendulus_D);
	Info_AddChoice	(Info_Mod_Turendil_Mendulus, "Nein, das war nur ein Scherz. Hier ist die Pflanze.", Info_Mod_Turendil_Mendulus_C);
};

FUNC VOID Info_Mod_Turendil_Mendulus_E()
{
	AI_Output(self, hero, "Info_Mod_Turendil_Mendulus_E_05_00"); //Danke. Du bist unser Held. Ich werde alles Nötige für seine Heilung veranlassen. Du könntest solange nach dem Schuldigen suchen. Sprich einfach mal mit den anderen.
	AI_Output(hero, self, "Info_Mod_Turendil_Mendulus_E_15_01"); //Das werde ich.
	AI_Output(self, hero, "Info_Mod_Turendil_Mendulus_E_05_02"); //Pass auf dich auf.
	
	Info_ClearChoices	(Info_Mod_Turendil_Mendulus);

	AI_StopProcessInfos	(self);

	Mod_VMG_FaiceGifty_Gift = 10;

	B_LogEntry	(TOPIC_MOD_FAICE_HEILUNG, "Ich habe Turendil das Mendulus-Kraut übergeben. Er sagte, ich solle mich umhören, wer der Schuldige sein könnte.");
};

FUNC VOID Info_Mod_Turendil_Mendulus_A()
{
	AI_Output(hero, self, "Info_Mod_Turendil_Mendulus_A_15_00"); //Ja hier ist die Pflanze.

	B_GiveInvItems	(hero, self, ItPl_Mendulus, 1);

	Info_Mod_Turendil_Mendulus_E();
};

FUNC VOID Info_Mod_Turendil_Mendulus_D()
{
	AI_Output(hero, self, "Info_Mod_Turendil_Mendulus_D_15_00"); //Das ist mein voller Ernst.
	AI_Output(self, hero, "Info_Mod_Turendil_Mendulus_D_05_01"); //Du warst unsere letzte Hoffnung. Ich fürchte, das ist das Ende der Verwandlungsmagier.
	AI_Output(hero, self, "Info_Mod_Turendil_Mendulus_D_15_02"); //Da fällt mir ein ... brauchst du vielleicht diese Pflanze?

	B_GiveInvItems	(hero, self, ItPl_Mendulus, 1);

	AI_Output(self, hero, "Info_Mod_Turendil_Mendulus_D_05_03"); //Ja genau!

	Info_Mod_Turendil_Mendulus_E();
};

FUNC VOID Info_Mod_Turendil_Mendulus_C()
{
	AI_Output(hero, self, "Info_Mod_Turendil_Mendulus_C_15_00"); //Nein, das war nur ein Scherz. Hier ist die Pflanze.

	B_GiveInvItems	(hero, self, ItPl_Mendulus, 1);

	Info_Mod_Turendil_Mendulus_E();
};

INSTANCE Info_Mod_Turendil_Furt (C_INFO)
{
	npc		= Mod_1955_VMG_Turendil_MT;
	nr		= 1;
	condition	= Info_Mod_Turendil_Furt_Condition;
	information	= Info_Mod_Turendil_Furt_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Turendil_Furt_Condition()
{
	if (Mod_VMG_FaiceGifty_Gift == 12)
	|| (Mod_VMG_FaiceGifty_Gift == 13)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Turendil_Furt_Info()
{
	AI_Output(self, hero, "Info_Mod_Turendil_Furt_05_00"); //Und? Was hast du herausgefunden?

	if (Mod_VMG_FaiceGifty_Gift == 12)
	{
		AI_Output(hero, self, "Info_Mod_Turendil_Furt_15_01"); //Furt hat die Spruchrolle von Faice vergiftet. Ich habe ihn weggeschickt.
		AI_Output(self, hero, "Info_Mod_Turendil_Furt_05_02"); //Das hättest du vielleicht nicht tun sollen. Aber es ist gut zu wissen, wer es war, und, dass er nun nicht mehr unter uns ist.
		AI_Output(self, hero, "Info_Mod_Turendil_Furt_05_03"); //Hier ist deine Belohnung.

		B_GiveInvItems	(self, hero, ItMi_Gold, 250);
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Turendil_Furt_15_04"); //Furt hat die Spruchrolle von Faice vergiftet. Ich überlasse sein Schicksal deinen Händen.
		AI_Output(self, hero, "Info_Mod_Turendil_Furt_05_05"); //Gut gemacht. Wir werden über sein Schicksal entscheiden. Hier, deine Belohnung und einige Spruchrollen.

		CreateInvItems	(hero, ItMi_Gold, 1000);
		CreateInvItems	(hero, ItSc_TrfBloodfly, 3);

		B_ShowGivenThings	("1000 Gold und 3 Spruchrollen erhalten");
	};

	B_GivePlayerXP	(500);

	AI_Output(hero, self, "Info_Mod_Turendil_Furt_15_06"); //Danke.
	AI_Output(self, hero, "Info_Mod_Turendil_Furt_05_07"); //Ich glaube Anor hat noch etwas zu tun für dich. Komm dann in ein paar Tagen wieder zu mir.

	B_LogEntry	(TOPIC_MOD_FAICE_HEILUNG, "Ich habe meine Belohnung von Turendil erhalten. Der Fall liegt nun nicht mehr in meiner Hand.");
	B_SetTopicStatus	(TOPIC_MOD_FAICE_HEILUNG, LOG_SUCCESS);
};

INSTANCE Info_Mod_Turendil_FurtNextDay (C_INFO)
{
	npc		= Mod_1955_VMG_Turendil_MT;
	nr		= 1;
	condition	= Info_Mod_Turendil_FurtNextDay_Condition;
	information	= Info_Mod_Turendil_FurtNextDay_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Turendil_FurtNextDay_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Anor_NickTot))
	&& ((Mod_VMG_FaiceGifty_Gift == 12)
	|| (Mod_VMG_FaiceGifty_Gift == 13))
	&& (Kapitel >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Turendil_FurtNextDay_Info()
{
	AI_Output(self, hero, "Info_Mod_Turendil_FurtNextDay_05_00"); //Da bist du ja, ich habe dich schon gesucht.
	AI_Output(hero, self, "Info_Mod_Turendil_FurtNextDay_15_01"); //Was gibt’s?

	if (Mod_VMG_FaiceGifty_Gift == 12)
	{
		AI_Output(self, hero, "Info_Mod_Turendil_FurtNextDay_05_02"); //Ich will, dass du nach Tugettso gehst und herausfindest, mit welchem Gift Faice vergiftet wurde, damit wir schnellstmöglich ein Gegenmittel herstellen können.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Turendil_FurtNextDay_05_03"); //Wir haben Furt verhört und er hat uns verraten, dass wir seinen Meister in Tugettso finden. Er meinte, es wäre einer von uns! Unglaublich!
		AI_Output(self, hero, "Info_Mod_Turendil_FurtNextDay_05_04"); //Ich will, dass du dieser Sache nachgehst und wenn möglich auch das Gift findest, mit dem Faice vergiftet wurde.
		AI_Output(self, hero, "Info_Mod_Turendil_FurtNextDay_05_05"); //So könnten wir seine Heilung beschleunigen, indem wir ein Gegenmittel herstellen.
	};

	Info_ClearChoices	(Info_Mod_Turendil_FurtNextDay);

	Info_AddChoice	(Info_Mod_Turendil_FurtNextDay, "Ich werde mich sofort auf den Weg machen.", Info_Mod_Turendil_FurtNextDay_B);
	Info_AddChoice	(Info_Mod_Turendil_FurtNextDay, "Was passiert jetzt mit Furt?", Info_Mod_Turendil_FurtNextDay_A);
};

FUNC VOID Info_Mod_Turendil_FurtNextDay_B()
{
	AI_Output(hero, self, "Info_Mod_Turendil_FurtNextDay_B_15_00"); //Ich werde mich sofort auf den Weg machen.
	AI_Output(self, hero, "Info_Mod_Turendil_FurtNextDay_B_05_01"); //Vielen Dank. Falls du in einen Hinterhalt gerätst, was ich nicht hoffe, hast du hier ein paar Tränke.

	B_GiveInvItems	(self, hero, ItPo_Health_01, 5);

	Log_CreateTopic	(TOPIC_MOD_FAICE_GIFT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_FAICE_GIFT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_FAICE_GIFT, "Mir wurde aufgetragen, mich erneut nach Tugettso zu begeben und das Gift zu finden, mit dem Faice vergiftet wurde. Auf zu Albert.");

	Info_ClearChoices	(Info_Mod_Turendil_FurtNextDay);
};

FUNC VOID Info_Mod_Turendil_FurtNextDay_A()
{
	AI_Output(hero, self, "Info_Mod_Turendil_FurtNextDay_A_15_00"); //Was passiert jetzt mit Furt?
	AI_Output(self, hero, "Info_Mod_Turendil_FurtNextDay_A_05_01"); //Wir sind uns noch nicht einig, aber du wirst schon noch früh genug erfahren, wie es mit ihm weitergeht.

	Info_Mod_Turendil_FurtNextDay_B();
};

INSTANCE Info_Mod_Turendil_Trador (C_INFO)
{
	npc		= Mod_1955_VMG_Turendil_MT;
	nr		= 1;
	condition	= Info_Mod_Turendil_Trador_Condition;
	information	= Info_Mod_Turendil_Trador_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Turendil_Trador_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Genn_Dean))
	&& (Npc_HasItems(hero, ItPl_Venena) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Turendil_Trador_Info()
{
	AI_Output(self, hero, "Info_Mod_Turendil_Trador_05_00"); //Da bist du ja endlich wieder. Was kannst du mir berichten?
	AI_Output(hero, self, "Info_Mod_Turendil_Trador_15_01"); //Wo soll ich anfangen?
	AI_Output(self, hero, "Info_Mod_Turendil_Trador_05_02"); //Das Gift. Hast du herausfinden können, woher es stammt?
	AI_Output(hero, self, "Info_Mod_Turendil_Trador_15_03"); //Ja, das Gift stammt aus der Venena-Pflanze. Hier hast du ein Exemplar.

	B_GiveInvItems	(hero, self, ItPl_Venena, 1);

	AI_Output(self, hero, "Info_Mod_Turendil_Trador_05_04"); //Danke. Und hast du herausgefunden, wer von den Magiern dahinter steckt?
	AI_Output(hero, self, "Info_Mod_Turendil_Trador_15_05"); //Kein Magier. Es war ein Mann namens Trador, ein Komplize von Furt.
	AI_Output(hero, self, "Info_Mod_Turendil_Trador_15_06"); //Er hat den Magier Dean umbringen lassen und sich seine Robe übergezogen.
	AI_Output(self, hero, "Info_Mod_Turendil_Trador_05_07"); //Das ist schrecklich! Vielen Dank für deine Mühen. Darf ich noch erfahren, wie er ihn hat unmrbinge lassen?

	Info_ClearChoices	(Info_Mod_Turendil_Trador);

	Info_AddChoice	(Info_Mod_Turendil_Trador, "Er hat einen beschworenen Golem damit beauftragt.", Info_Mod_Turendil_Trador_B);
	Info_AddChoice	(Info_Mod_Turendil_Trador, "Ich möchte nicht darüber sprechen.", Info_Mod_Turendil_Trador_A);
};

FUNC VOID Info_Mod_Turendil_Trador_C()
{
	AI_Output(hero, self, "Info_Mod_Turendil_Trador_C_15_00"); //Wie geht es jetzt weiter?
	AI_Output(self, hero, "Info_Mod_Turendil_Trador_C_05_01"); //Wir werden uns besprechen. Komm morgen wieder.

	B_GivePlayerXP	(500);

	Mod_VMG_Turendil_Trador_Day = Wld_GetDay();

	Info_ClearChoices	(Info_Mod_Turendil_Trador);

	B_LogEntry	(TOPIC_MOD_FAICE_GIFT, "Ich habe Turendil Bericht erstattet und meine Belohnung erhalten. Ich soll einen Tag warten, damit sich die Magier besprechen können.");
	B_SetTopicStatus	(TOPIC_MOD_FAICE_GIFT, LOG_SUCCESS);

	B_StartOtherRoutine	(Mod_1626_VMG_Furt_MT, "INSEL");
};

FUNC VOID Info_Mod_Turendil_Trador_B()
{
	AI_Output(hero, self, "Info_Mod_Turendil_Trador_B_15_00"); //Er hat einen beschworenen Golem damit beauftragt.
	AI_Output(self, hero, "Info_Mod_Turendil_Trador_B_05_01"); //Ah, er kennt unsere Magie. Das ist schlecht. Hier, das ist für deine Mühen.

	CreateInvItems	(hero, ItMi_Gold, 300);
	CreateInvItems	(hero, ItSc_TrfBloodfly, 1);

	B_ShowGivenThings	("300 Gold und Spruchrolle erhalten");

	Info_Mod_Turendil_Trador_C();
};

FUNC VOID Info_Mod_Turendil_Trador_A()
{
	AI_Output(hero, self, "Info_Mod_Turendil_Trador_A_15_00"); //Ich möchte nicht darüber sprechen.
	AI_Output(self, hero, "Info_Mod_Turendil_Trador_A_05_01"); //Okay. Hier ist dein Lohn.

	B_GiveInvItems	(self, hero, ItMi_Gold, 200);

	Info_Mod_Turendil_Trador_C();
};

INSTANCE Info_Mod_Turendil_TradorBesprochen (C_INFO)
{
	npc		= Mod_1955_VMG_Turendil_MT;
	nr		= 1;
	condition	= Info_Mod_Turendil_TradorBesprochen_Condition;
	information	= Info_Mod_Turendil_TradorBesprochen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Gibt's was Neues?";
};

FUNC INT Info_Mod_Turendil_TradorBesprochen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Turendil_Trador))
	&& (Wld_GetDay() > Mod_VMG_Turendil_Trador_Day)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Turendil_TradorBesprochen_Info()
{
	AI_Output(hero, self, "Info_Mod_Turendil_TradorBesprochen_15_00"); //Gibt's was Neues?
	AI_Output(self, hero, "Info_Mod_Turendil_TradorBesprochen_05_01"); //Du musst unbedingt zurück nach Tugettso! Sämtliche Runen "Golem beschwören" wurden dort entwendet!
	AI_Output(self, hero, "Info_Mod_Turendil_TradorBesprochen_05_02"); //Wir vermuten, dass Trador dahinter steckt.

	if (Mod_VMG_FaiceGifty_Gift == 13)
	{
		AI_Output(self, hero, "Info_Mod_Turendil_TradorBesprochen_05_03"); //Außerdem ist Furt uns durch eine List entkommen.
	};

	AI_Output(hero, self, "Info_Mod_Turendil_TradorBesprochen_15_04"); //Ich werde mich sofort auf den Weg machen.
	AI_Output(self, hero, "Info_Mod_Turendil_TradorBesprochen_05_05"); //Ach ja, eins noch. Der Teleporter hatte in letzter Zeit hin und wieder Aussetzer.
	AI_Output(self, hero, "Info_Mod_Turendil_TradorBesprochen_05_06"); //Falls du nicht in Tugettso ankommen solltest, was ich natürlich nicht hoffe, gebe ich dir zur Sicherheit einige Verwandlungsrollen mit.

	B_GiveInvItems	(self, hero, ItSc_TrfBloodfly, 3);

	AI_Output(self, hero, "Info_Mod_Turendil_TradorBesprochen_05_07"); //So wirst du von Monstern, die eine Nummer zu groß für dich sind, ignoriert.
	AI_Output(hero, self, "Info_Mod_Turendil_TradorBesprochen_15_08"); //Ich glaube nicht, dass ich das nötig habe, aber trotzdem danke.
	AI_Output(self, hero, "Info_Mod_Turendil_TradorBesprochen_05_09"); //Pass auf dich auf.

	Log_CreateTopic	(TOPIC_MOD_TURENDIL_GOLEM, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_TURENDIL_GOLEM, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_TURENDIL_GOLEM, "Ich habe den neuen Auftrag, zurück nach Tugettso zu reisen und herauszufinden, wohin die Golem-Runen verschwunden sind.");
};

INSTANCE Info_Mod_Turendil_TradorTot (C_INFO)
{
	npc		= Mod_1955_VMG_Turendil_MT;
	nr		= 1;
	condition	= Info_Mod_Turendil_TradorTot_Condition;
	information	= Info_Mod_Turendil_TradorTot_Info;
	permanent	= 0;
	important	= 0;
	description	= "Da bin ich wieder.";
};

FUNC INT Info_Mod_Turendil_TradorTot_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Genn_TradorTot))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Turendil_TradorTot_Info()
{
	AI_Output(hero, self, "Info_Mod_Turendil_TradorTot_15_00"); //Da bin ich wieder.
	AI_Output(self, hero, "Info_Mod_Turendil_TradorTot_05_01"); //Und ich sehe, du lebst. Wie ist es dir ergangen?
	AI_Output(hero, self, "Info_Mod_Turendil_TradorTot_15_02"); //Zuerst bin ich in einem abgelegenen Tal herausgekommen, da Trador den Teleporter manipuliert hatte.
	AI_Output(self, hero, "Info_Mod_Turendil_TradorTot_05_03"); //Also steckt er doch dahinter!
	AI_Output(hero, self, "Info_Mod_Turendil_TradorTot_15_04"); //Ja, danach habe ich mit Hilfe zweier Einsiedler den Teleporter im Tal aktiviert und bin endlich in Tugettso herausgekommen.
	AI_Output(hero, self, "Info_Mod_Turendil_TradorTot_15_05"); //Dort traf ich dann auf Trador. Er hat mich nicht erwartet, aber war trotzdem eine harte Nuss.
	AI_Output(hero, self, "Info_Mod_Turendil_TradorTot_15_06"); //Mit vereinten Kräften haben wir ihn besiegt und ich habe ihn getötet.
	AI_Output(self, hero, "Info_Mod_Turendil_TradorTot_05_07"); //Das sind gute Neuigkeiten. Hatte er die Runen dabei?

	Info_ClearChoices	(Info_Mod_Turendil_TradorTot);

	Info_AddChoice	(Info_Mod_Turendil_TradorTot, "[Lügen] Nein, leider nicht.", Info_Mod_Turendil_TradorTot_B);

	if (Npc_HasItems(hero, ItRu_SumGol) >= 2)
	&& (Npc_HasItems(hero, ItSc_SumGol) >= 5)
	{
		Info_AddChoice	(Info_Mod_Turendil_TradorTot, "Ja, hier sind sie.", Info_Mod_Turendil_TradorTot_A);
	};
};

FUNC VOID Info_Mod_Turendil_TradorTot_B()
{
	AI_Output(hero, self, "Info_Mod_Turendil_TradorTot_B_15_00"); //Nein, leider nicht.
	AI_Output(self, hero, "Info_Mod_Turendil_TradorTot_B_05_01"); //Wie schade. Wir werden weiterhin danach suchen.

	Info_ClearChoices	(Info_Mod_Turendil_TradorTot);

	Info_AddChoice	(Info_Mod_Turendil_TradorTot, "Viel Glück dabei.", Info_Mod_Turendil_TradorTot_D);
	
	if (Npc_HasItems(hero, ItRu_SumGol) >= 2)
	&& (Npc_HasItems(hero, ItSc_SumGol) >= 5)
	{
		Info_AddChoice	(Info_Mod_Turendil_TradorTot, "Das war nur ein Scherz. Hier sind die Runen.", Info_Mod_Turendil_TradorTot_C);
	};
};

FUNC VOID Info_Mod_Turendil_TradorTot_A()
{
	AI_Output(hero, self, "Info_Mod_Turendil_TradorTot_A_15_00"); //Ja, hier sind sie.

	Npc_RemoveInvItems	(hero, ItSc_SumGol, 5);
	Npc_RemoveInvItems	(hero, ItRu_SumGol, 2);

	B_ShowGivenThings	("2 Runen und 5 Spruchrolle gegeben");

	AI_Output(self, hero, "Info_Mod_Turendil_TradorTot_A_05_01"); //Vielen Dank. Hier ist deine Belohnung.

	CreateInvItems	(hero, ItSc_TrfBloodfly, 1);
	CreateInvItems	(hero, ItMi_Gold, 500);

	B_ShowGivenThings	("500 Gold und Spruchrolle erhalten");

	AI_Output(hero, self, "Info_Mod_Turendil_TradorTot_A_15_02"); //Danke. Ich werde mich nun auf den Weg machen.
	AI_Output(self, hero, "Info_Mod_Turendil_TradorTot_A_05_03"); //Tu das. Sprich beizeiten noch mal mit Faice. Er wollte irgendwas von dir.

	B_GivePlayerXP	(750);

	Info_ClearChoices	(Info_Mod_Turendil_TradorTot);

	B_LogEntry	(TOPIC_MOD_TURENDIL_GOLEM, "Der Auftrag ist beendet. Turendil sagte mir, dass Faice etwas von mir wollte.");
	B_SetTopicStatus	(TOPIC_MOD_TURENDIL_GOLEM, LOG_SUCCESS);
};

FUNC VOID Info_Mod_Turendil_TradorTot_D()
{
	AI_Output(hero, self, "Info_Mod_Turendil_TradorTot_D_15_00"); //Viel Glück dabei.
	AI_Output(self, hero, "Info_Mod_Turendil_TradorTot_D_05_01"); //Sprich beizeiten noch mal mit Faice. Er wollte irgendwas von dir.

	B_GivePlayerXP	(250);

	Info_ClearChoices	(Info_Mod_Turendil_TradorTot);

	B_LogEntry	(TOPIC_MOD_TURENDIL_GOLEM, "Der Auftrag ist beendet. Turendil sagte mir, dass Faice etwas von mir wollte.");
	B_SetTopicStatus	(TOPIC_MOD_TURENDIL_GOLEM, LOG_SUCCESS);
};

FUNC VOID Info_Mod_Turendil_TradorTot_C()
{
	AI_Output(hero, self, "Info_Mod_Turendil_TradorTot_C_15_00"); //Das war nur ein Scherz. Hier sind die Runen.

	Npc_RemoveInvItems	(hero, ItSc_SumGol, 5);
	Npc_RemoveInvItems	(hero, ItRu_SumGol, 2);

	B_ShowGivenThings	("2 Runen und 5 Spruchrolle gegeben");

	AI_Output(self, hero, "Info_Mod_Turendil_TradorTot_C_05_01"); //Mach das nicht noch mal! Trotzdem danke. Hier hast du eine Belohnung.

	B_GiveInvItems	(self, hero, ItMi_Gold, 350);

	AI_Output(hero, self, "Info_Mod_Turendil_TradorTot_C_15_02"); //Danke. Ich werde mich nun auf den Weg machen.
	AI_Output(self, hero, "Info_Mod_Turendil_TradorTot_C_05_03"); //Tu das. Sprich beizeiten noch mal mit Faice. Er wollte irgendwas von dir.

	B_GivePlayerXP	(500);

	Info_ClearChoices	(Info_Mod_Turendil_TradorTot);

	B_LogEntry	(TOPIC_MOD_TURENDIL_GOLEM, "Der Auftrag ist beendet. Turendil sagte mir, dass Faice etwas von mir wollte.");
	B_SetTopicStatus	(TOPIC_MOD_TURENDIL_GOLEM, LOG_SUCCESS);
};

INSTANCE Info_Mod_Turendil_WerBistDu (C_INFO)
{
	npc		= Mod_1955_VMG_Turendil_MT;
	nr		= 1;
	condition	= Info_Mod_Turendil_WerBistDu_Condition;
	information	= Info_Mod_Turendil_WerBistDu_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Turendil_WerBistDu_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Turendil_WerBistDu_Info()
{
	B_Say	(hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Turendil_WerBistDu_05_00"); //Mein Name ist Turendil. Ich bin der Stellvertreter von Faice, unserem Oberhaupt. Er ist zur Zeit sehr beschäftigt.
	AI_Output(self, hero, "Info_Mod_Turendil_WerBistDu_05_01"); //Wie kann ich dir helfen?
};

INSTANCE Info_Mod_Turendil_Woher (C_INFO)
{
	npc		= Mod_1955_VMG_Turendil_MT;
	nr		= 1;
	condition	= Info_Mod_Turendil_Woher_Condition;
	information	= Info_Mod_Turendil_Woher_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wo kommt ihr her?";
};

FUNC INT Info_Mod_Turendil_Woher_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Turendil_WerBistDu))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Turendil_Woher_Info()
{
	AI_Output(hero, self, "Info_Mod_Turendil_Woher_15_00"); //Wo kommt ihr her?
	AI_Output(self, hero, "Info_Mod_Turendil_Woher_05_01"); //Wir kommen aus einem kleinen Tal namens Tugettso. Dieses Tal ist Natur pur.
	AI_Output(self, hero, "Info_Mod_Turendil_Woher_05_02"); //Wenn es soweit ist, wirst du vielleicht mal dort hin gelangen.
};

INSTANCE Info_Mod_Turendil_WasHier (C_INFO)
{
	npc		= Mod_1955_VMG_Turendil_MT;
	nr		= 1;
	condition	= Info_Mod_Turendil_WasHier_Condition;
	information	= Info_Mod_Turendil_WasHier_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was macht ihr hier?";
};

FUNC INT Info_Mod_Turendil_WasHier_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Turendil_WerBistDu))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Turendil_WasHier_Info()
{
	AI_Output(hero, self, "Info_Mod_Turendil_WasHier_15_00"); //Was macht ihr hier?
	AI_Output(self, hero, "Info_Mod_Turendil_WasHier_05_01"); //Wir erforschen dieses Tal und das alte Wissen, das sich hier finden lässt.
};

INSTANCE Info_Mod_Turendil_BACK (C_INFO)
{
	npc		= Mod_1955_VMG_Turendil_MT;
	nr		= 1;
	condition	= Info_Mod_Turendil_BACK_Condition;
	information	= Info_Mod_Turendil_BACK_Info;
	permanent	= 1;
	important	= 0;
	description	= "(Raum verlassen)";
};

FUNC INT Info_Mod_Turendil_BACK_Condition()
{
	if (Npc_GetDistToWP(self, "OW_PATH_TEMPELRUIN07") < 1000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Turendil_BACK_Info()
{
	AI_StopProcessInfos	(self);

	AI_Teleport	(hero, "LOCATION_28_01");
};

INSTANCE Info_Mod_Turendil_Pickpocket (C_INFO)
{
	npc		= Mod_1955_VMG_Turendil_MT;
	nr		= 1;
	condition	= Info_Mod_Turendil_Pickpocket_Condition;
	information	= Info_Mod_Turendil_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_100;
};

FUNC INT Info_Mod_Turendil_Pickpocket_Condition()
{
	C_Beklauen	(93, ItMi_Gold, 850);
};

FUNC VOID Info_Mod_Turendil_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Turendil_Pickpocket);

	Info_AddChoice	(Info_Mod_Turendil_Pickpocket, DIALOG_BACK, Info_Mod_Turendil_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Turendil_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Turendil_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Turendil_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Turendil_Pickpocket);
};

FUNC VOID Info_Mod_Turendil_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Turendil_Pickpocket);
};

INSTANCE Info_Mod_Turendil_EXIT (C_INFO)
{
	npc		= Mod_1955_VMG_Turendil_MT;
	nr		= 1;
	condition	= Info_Mod_Turendil_EXIT_Condition;
	information	= Info_Mod_Turendil_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Turendil_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Turendil_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};