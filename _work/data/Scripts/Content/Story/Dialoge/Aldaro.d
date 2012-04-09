INSTANCE Info_Mod_Aldaro_Hi (C_INFO)
{
	npc		= Mod_7674_OUT_Aldaro_EIS;
	nr		= 1;
	condition	= Info_Mod_Aldaro_Hi_Condition;
	information	= Info_Mod_Aldaro_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Aldaro_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Aldaro_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Aldaro_Hi_09_00"); //Ahh, ein neues Gesicht. Sei gegrüßt. Kommst du von ... ahhh ...
	AI_Output(hero, self, "Info_Mod_Aldaro_Hi_15_01"); //Was ist los?
	AI_Output(self, hero, "Info_Mod_Aldaro_Hi_09_02"); //Ohh, entschuldige. Die Schmerzen sind einfach unerträglich.
	AI_Output(self, hero, "Info_Mod_Aldaro_Hi_09_03"); //Egal ob ich gehe, stehe, oder sitze ... mit den Gelenken wird es immer schlimmer.
	AI_Output(self, hero, "Info_Mod_Aldaro_Hi_09_04"); //Die letzten Tage konnte ich nicht mal mehr fischen gehen.
	AI_Output(hero, self, "Info_Mod_Aldaro_Hi_15_05"); //Gibt es denn kein Mittel zur Heilung, oder Linderung?
	AI_Output(self, hero, "Info_Mod_Aldaro_Hi_09_06"); //Nein, auch Thys konnte mir nicht helfen.
	AI_Output(self, hero, "Info_Mod_Aldaro_Hi_09_07"); //Ich habe zwar in einigen Büchern gelesen, dass es etwas gibt, was bei entzündlichen Gelenkbeschwerden helfen kann ... aber das gibt es hier bestimmt nicht mal innerhalb von 1000 Meilen.
	AI_Output(hero, self, "Info_Mod_Aldaro_Hi_15_08"); //Was soll das sein?
	AI_Output(self, hero, "Info_Mod_Aldaro_Hi_09_09"); //Das Gift verschiedener Tiere, vor allem Insekten,  wie man sie eben in wärmeren Gebieten findet ... aber leider nicht hier.
	AI_Output(self, hero, "Info_Mod_Aldaro_Hi_09_10"); //Ach, wie soll das nur weitergehen ...

	Log_CreateTopic	(TOPIC_MOD_ALDARO_TIERGIFT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ALDARO_TIERGIFT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ALDARO_TIERGIFT, "Aldaro leidet unter starken Gelenkbeschwerden. Er meint gelesen zu haben, dass Tiergift dagegen helfen könnte.");
};

INSTANCE Info_Mod_Aldaro_Aufgabe (C_INFO)
{
	npc		= Mod_7674_OUT_Aldaro_EIS;
	nr		= 1;
	condition	= Info_Mod_Aldaro_Gift_Condition;
	information	= Info_Mod_Aldaro_Gift_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe Tiergift bei mir.";
};

FUNC INT Info_Mod_Aldaro_Gift_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Aldaro_Hi))
	&& (Npc_HasItems(hero, ItPo_Tiergift) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Aldaro_Gift_Info()
{
	AI_Output(hero, self, "Info_Mod_Aldaro_Gift_15_00"); //Ich habe Tiergift bei mir.
	AI_Output(self, hero, "Info_Mod_Aldaro_Gift_09_01"); //Was? Ach, du willst mich doch auf den Arm nehmen.
	AI_Output(self, hero, "Info_Mod_Aldaro_Gift_09_02"); //Wie sollte das denn möglich sein, hier in der eisigen Welt?
	AI_Output(hero, self, "Info_Mod_Aldaro_Gift_15_03"); //Durch Hilfe von etwas Magie.
	AI_Output(self, hero, "Info_Mod_Aldaro_Gift_09_04"); //Magie? Aber… (in Gedanken versunken) dann stimmt es also vielleicht doch, was ich aus Gerüchten gehört habe ...
	AI_Output(self, hero, "Info_Mod_Aldaro_Gift_09_05"); //... dass einer durch die magischen Portale aus fernen Regionen der Welt zu uns kam ...
	AI_Output(hero, self, "Info_Mod_Aldaro_Gift_15_06"); //Hier, deine Medizin.

	B_GiveInvItems	(hero, self, ItPo_Tiergift, 1);

	AI_Output(self, hero, "Info_Mod_Aldaro_Gift_09_07"); //(wieder zum Helden) Was? Ahh, das Insektengift. Hab vielen Dank.
	AI_Output(self, hero, "Info_Mod_Aldaro_Gift_09_08"); //Ich trage es gleich auf die betroffenen Stellen auf ... und schaue, wie es mir morgen geht.

	AI_PlayAni	(self, "T_PLUNDER");

	B_LogEntry	(TOPIC_MOD_ALDARO_TIERGIFT, "Aldaro hat seine Gelenke mit dem Gift eingerieben und sich schlafen gelegt.");

	B_GivePlayerXP	(150);

	Mod_Aldaro_Gift_Tag = Wld_GetDay();

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ERHOLUNG");
};

INSTANCE Info_Mod_Aldaro_Gift2 (C_INFO)
{
	npc		= Mod_7674_OUT_Aldaro_EIS;
	nr		= 1;
	condition	= Info_Mod_Aldaro_Gift2_Condition;
	information	= Info_Mod_Aldaro_Gift2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Aldaro_Gift2_Condition()
{
	if (Mod_Aldaro_Gift == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Aldaro_Gift2_Info()
{
	AI_Output(self, hero, "Info_Mod_Aldaro_Gift2_09_00"); //(euphorisch) Es hat tatsächlich geholfen. Meinen Gelenken geht es schon viel besser.
	AI_Output(self, hero, "Info_Mod_Aldaro_Gift2_09_01"); //Wenn das so weitergeht, kann ich morgen vielleicht schon wieder fischen gehen.
	AI_Output(self, hero, "Info_Mod_Aldaro_Gift2_09_02"); //Hier, es ist zwar nicht viel, aber ich hoffe, du kannst was damit anfangen.

	CreateInvItems	(hero, ItMi_Gold, 54);
	CreateInvItems	(hero, ItMi_Nugget, 2);
	CreateInvItems	(hero, ItFo_Fish, 12);

	B_ShowGivenThings	("54 Gold, 2 Erzbrocken und 12 Fische erhalten");

	B_SetTopicStatus	(TOPIC_MOD_ALDARO_TIERGIFT, LOG_SUCCESS);

	B_GivePlayerXP	(150);

	CurrentNQ += 1;

	B_StartOtherRoutine	(self,	"FIT");
};

INSTANCE Info_Mod_Aldaro_Schneegeister (C_INFO)
{
	npc		= Mod_7674_OUT_Aldaro_EIS;
	nr		= 1;
	condition	= Info_Mod_Aldaro_Schneegeister_Condition;
	information	= Info_Mod_Aldaro_Schneegeister_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Aldaro_Schneegeister_Condition()
{
	if (Wld_GetDay()-1 > Mod_Thys_Schneegeister_Tag)
	&& (Mod_Aldaro_Gift == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Thys_Schneegeister))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Aldaro_Schneegeister_Info()
{
	AI_Output(self, hero, "Info_Mod_Aldaro_Schneegeister_09_00"); //(erfreut) Schön dich wieder zu sehen.
	AI_Output(self, hero, "Info_Mod_Aldaro_Schneegeister_09_01"); //Meine Beschwerden sind völlig verschwunden und das Fläschchen reicht mir noch für Jahre.
	AI_Output(self, hero, "Info_Mod_Aldaro_Schneegeister_09_02"); //Aber worum es mir eigentlich ging ... ich habe diesen goldenen Ring in einem Fisch gefunden, den ich im See fing.
	AI_Output(self, hero, "Info_Mod_Aldaro_Schneegeister_09_03"); //Und da ich ohne deine Hilfe gar nicht fischen könnte, steht er selbstverständlich dir zu. Hier, nimm.

	B_GiveInvItems	(self, hero, ItRi_Seering, 1);

	B_GivePlayerXP	(50);
};

INSTANCE Info_Mod_Aldaro_Pickpocket (C_INFO)
{
	npc		= Mod_7674_OUT_Aldaro_EIS;
	nr		= 1;
	condition	= Info_Mod_Aldaro_Pickpocket_Condition;
	information	= Info_Mod_Aldaro_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Aldaro_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Aldaro_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Aldaro_Pickpocket);

	Info_AddChoice	(Info_Mod_Aldaro_Pickpocket, DIALOG_BACK, Info_Mod_Aldaro_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Aldaro_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Aldaro_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Aldaro_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Aldaro_Pickpocket);
};

FUNC VOID Info_Mod_Aldaro_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Aldaro_Pickpocket);
};

INSTANCE Info_Mod_Aldaro_EXIT (C_INFO)
{
	npc		= Mod_7674_OUT_Aldaro_EIS;
	nr		= 1;
	condition	= Info_Mod_Aldaro_EXIT_Condition;
	information	= Info_Mod_Aldaro_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Aldaro_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Aldaro_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};