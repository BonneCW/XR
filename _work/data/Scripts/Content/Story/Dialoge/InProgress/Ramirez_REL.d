INSTANCE Info_Mod_Ramirez_REL_InHaus (C_INFO)
{
	npc		= Mod_7708_OUT_Ramirez_REL;
	nr		= 1;
	condition	= Info_Mod_Ramirez_REL_InHaus_Condition;
	information	= Info_Mod_Ramirez_REL_InHaus_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ramirez_REL_InHaus_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jesper_REL_InHaus))
	&& (Wld_GetDay() > Mod_Dieb_Haus_Day)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ramirez_REL_InHaus_Info()
{
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_InHaus_03_00"); //Das nenn ich doch mal ein gemütliches Zuhause, oder?
	AI_Output(hero, self, "Info_Mod_Ramirez_REL_InHaus_15_01"); //Sieht ok aus.
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_InHaus_03_02"); //Das will ich meinen. Hmm, was uns jetzt noch fehlt ist die passende Verpflegung.
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_InHaus_03_03"); //Ich hoffe, dass Attila bald zurückkommt von seinem Erkundungsgang ... ahh, da hör ich ihn schon die Treppe herunterkommen.

	AI_StopProcessInfos	(self);

	Wld_InsertNpc	(Mod_7709_OUT_Attila_REL, "REL_CITY_053");

	Mod_RemoveAttilaFromKhorinis = TRUE;
};

INSTANCE Info_Mod_Ramirez_REL_Lagerhaus (C_INFO)
{
	npc		= Mod_7708_OUT_Ramirez_REL;
	nr		= 1;
	condition	= Info_Mod_Ramirez_REL_Lagerhaus_Condition;
	information	= Info_Mod_Ramirez_REL_Lagerhaus_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ramirez_REL_Lagerhaus_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Attila_REL_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ramirez_REL_Lagerhaus_Info()
{
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Lagerhaus_03_00"); //Gut gemacht. Damit sollte sich sicher was anfangen lassen.
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Lagerhaus_03_01"); //(zum Helden) Wie wäre es, wenn du dich dorthin begibst und versuchst einen prall gefüllten Sack aus dem Lager mitzunehmen.
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Lagerhaus_03_02"); //Pass aber auf, dass dich die Wachen nicht dabei erwischen.
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Lagerhaus_03_03"); //Vielleicht wirst du dich auch im Lager verstecken müssen, bis sie abends endlich weg sind.
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Lagerhaus_03_04"); //Dir fällt schon was ein.

	Log_CreateTopic	(TOPIC_MOD_DIEB_LAGERHAUS, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_DIEB_LAGERHAUS, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_DIEB_LAGERHAUS, "In Khorata werden täglich von morgens bis abends Vorräte in einem Lagerhaus verstaut. Ich soll versuchen, mir einen großen Sack voll davon unter den Nagel zu reißen. Ich muss nur aufpassen, dass mich die beiden Wachen nicht erwischen. Vielleicht habe ich ja auch eine Chance, sobald sie abends das Lager verlassen haben ...");

	Wld_InsertItem	(ItMi_Fresssack, "FP_ITEM_JIM_DROGEN");
	Wld_InsertItem	(ItMi_Kiste, "FP_ITEM_LAGERKISTE");
};

INSTANCE Info_Mod_Ramirez_REL_Lagerhaus2 (C_INFO)
{
	npc		= Mod_7708_OUT_Ramirez_REL;
	nr		= 1;
	condition	= Info_Mod_Ramirez_REL_Lagerhaus2_Condition;
	information	= Info_Mod_Ramirez_REL_Lagerhaus2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ramirez_REL_Lagerhaus2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ramirez_REL_Lagerhaus))
	&& (Npc_HasItems(hero, ItMi_Fresssack) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ramirez_REL_Lagerhaus2_Info()
{
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Lagerhaus2_03_00"); //Was ist das? Ich rieche Schinken, Käse, Brot ...
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Lagerhaus2_03_01"); //Ahh, sehr schön, du warst im Lager, wie ich sehe.
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Lagerhaus2_03_02"); //Und ich hatte schon befürchtet, ich müsste auf den Markt gehen um mir etwas zu kaufen.

	B_GiveInvItems	(hero, self, ItMi_Fresssack, 1);

	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Lagerhaus2_03_03"); //Lass sehen ... ja, das reicht mindestens für die nächsten 4 Wochen. Gute Arbeit.
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Lagerhaus2_03_04"); //Hier hast du etwas Gold ... und paar Fressalien aus dem Sack.

	CreateInvItems	(hero, ItMi_Gold, 150);
	CreateInvItems	(hero, ItFo_Bacon, 1);
	CreateInvItems	(hero, ItFo_Cheese, 3);
	CreateInvItems	(hero, ItFo_Wine, 2);
	CreateInvItems	(hero, ItFo_Beer, 3);
	CreateInvItems	(hero, ItFo_Apple, 5);
	CreateInvItems	(hero, ItFo_Bread, 2);

	B_ShowGivenThings	("150 Gold, 1 Schinken, 3 Käse, 2 Wein, 3 Bier, 5 Äpfel und 2 Brote erhalten");

	B_GivePlayerXP	(400);

	B_SetTopicStatus	(TOPIC_MOD_DIEB_LAGERHAUS, LOG_SUCCESS);

	Mod_Dieb_Haus_Day = Wld_GetDay();
};

INSTANCE Info_Mod_Ramirez_REL_Glorie (C_INFO)
{
	npc		= Mod_7708_OUT_Ramirez_REL;
	nr		= 1;
	condition	= Info_Mod_Ramirez_REL_Glorie_Condition;
	information	= Info_Mod_Ramirez_REL_Glorie_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ramirez_REL_Glorie_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cassia_REL_Glorie))
	&& (Wld_GetDay() > Mod_Dieb_Haus_Day)
	&& (Wld_IsTime(09,00,11,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ramirez_REL_Glorie_Info()
{
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Glorie_03_00"); //Ahh, da bist du ja. Dann kann es also losgehen. Folge mir.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOSCHNEIDER");
};

INSTANCE Info_Mod_Ramirez_REL_Glorie2 (C_INFO)
{
	npc		= Mod_7708_OUT_Ramirez_REL;
	nr		= 1;
	condition	= Info_Mod_Ramirez_REL_Glorie2_Condition;
	information	= Info_Mod_Ramirez_REL_Glorie2_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Ramirez_REL_Glorie2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cassia_REL_Glorie))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Ramirez_REL_Glorie))
	&& (Wld_GetDay() > Mod_Dieb_Haus_Day)
	&& (Wld_IsTime(11,00,24,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ramirez_REL_Glorie2_Info()
{
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Glorie2_03_00"); //(verärgert) Du kommst viel zu spät. Jetzt lohnt es sich gar nicht erst anzufangen.
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Glorie2_03_01"); //Wir müssen es auf morgen verschieben ... du Arsch.

	Mod_Dieb_Haus_Day = Wld_GetDay();

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Ramirez_REL_Glorie3 (C_INFO)
{
	npc		= Mod_7708_OUT_Ramirez_REL;
	nr		= 1;
	condition	= Info_Mod_Ramirez_REL_Glorie3_Condition;
	information	= Info_Mod_Ramirez_REL_Glorie3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ramirez_REL_Glorie3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ramirez_REL_Glorie))
	&& (Npc_GetDistToWP(self, "REL_CITY_233") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ramirez_REL_Glorie3_Info()
{
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Glorie3_03_00"); //Also gut. Das was jetzt kommt, dient allein der Mission.
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Glorie3_03_01"); //Sobald ich sein Interesse erregt habe, solltest du dir das Kleid schnappen können.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SCHNEIDER");
	B_StartOtherRoutine	(Mod_7535_OUT_Schneider_REL, "ABGELENKT");
	B_StartOtherRoutine	(Mod_7705_OUT_Cassia_REL, "VORSCHNEIDER");
	B_StartOtherRoutine	(Mod_7704_OUT_Jesper_REL, "ATBIB");

	Wld_InsertItem	(ItAr_GelehrterNeu, "FP_ITEM_GELEHRTENKLEIDUNG");
};

INSTANCE Info_Mod_Ramirez_REL_Glorie4 (C_INFO)
{
	npc		= Mod_7708_OUT_Ramirez_REL;
	nr		= 1;
	condition	= Info_Mod_Ramirez_REL_Glorie4_Condition;
	information	= Info_Mod_Ramirez_REL_Glorie4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ramirez_REL_Glorie4_Condition()
{
	if (Mod_Diebe_Brunnen == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ramirez_REL_Glorie4_Info()
{
	if (Mod_Diebe_WandGehackt == 0)
	{
		AI_Output(self, hero, "Info_Mod_Ramirez_REL_Glorie4_03_00"); //Da bist du endlich. Während du mit deinem Arsch im Bett lagst, haben wir die Wand durchbrochen und einen Tunnel freigelegt.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Ramirez_REL_Glorie4_03_01"); //Super, wir sind durch. Gute Arbeit Jungs. Scheinbar geht es da tatsächlich weiter.
	};

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Ramirez_REL_Glorie5 (C_INFO)
{
	npc		= Mod_7708_OUT_Ramirez_REL;
	nr		= 1;
	condition	= Info_Mod_Ramirez_REL_Glorie5_Condition;
	information	= Info_Mod_Ramirez_REL_Glorie5_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ramirez_REL_Glorie5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Attila_REL_Glorie5))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ramirez_REL_Glorie5_Info()
{
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Glorie5_03_00"); //In Ordnung ... die drei Pfund Gold in meinen Taschen reichen auch fürs erste.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "INHAUS");
	B_StartOtherRoutine	(Mod_7709_OUT_Attila_REL, "INHAUS");
	B_StartOtherRoutine	(Mod_7705_OUT_Cassia_REL, "INHAUS");
	B_StartOtherRoutine	(Mod_7704_OUT_Jesper_REL, "GELEHRTER");
};

INSTANCE Info_Mod_Ramirez_REL_EXIT (C_INFO)
{
	npc		= Mod_7708_OUT_Ramirez_REL;
	nr		= 1;
	condition	= Info_Mod_Ramirez_REL_EXIT_Condition;
	information	= Info_Mod_Ramirez_REL_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Ramirez_REL_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ramirez_REL_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};