INSTANCE Info_Mod_Jones_Hi (C_INFO)
{
	npc		= Mod_1554_KDW_Jones_DI;
	nr		= 1;
	condition	= Info_Mod_Jones_Hi_Condition;
	information	= Info_Mod_Jones_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Jones_Hi_Condition()
{
	if (Mod_DI_InselErkunden == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jones_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Jones_Hi_13_00"); //Nun, wenn diese Aufzeichnungen wahr sind, dann müsst ihr den Geist bannen, der sie zu Lebzeiten verflucht hat.
	AI_Output(hero, self, "Info_Mod_Jones_Hi_15_01"); //Einen Geist bannen? Wie soll ich das denn machen?
	AI_Output(self, hero, "Info_Mod_Jones_Hi_13_02"); //Nun, zuerst musst du seine sterblichen Überreste der Erde übergeben. Danach muss ihm eine Bestattungszeremonie gewährt werden.
	AI_Output(self, hero, "Info_Mod_Jones_Hi_13_03"); //Sind diese Bedingungen erfüllt, dann ist seine Seele nicht mehr an die sterbliche Hülle gebunden.
	AI_Output(hero, self, "Info_Mod_Jones_Hi_15_04"); //Und dann?
	AI_Output(self, hero, "Info_Mod_Jones_Hi_13_05"); //Nun ... entweder er fährt ein in Beliars Reich oder er bleibt in Adanos Reich und wird uns angreifen.
	AI_Output(hero, self, "Info_Mod_Jones_Hi_15_06"); //Und wie will ich gegen einen Geist kämpfen?
	AI_Output(self, hero, "Info_Mod_Jones_Hi_13_07"); //Mit deinem Schwert oder dem Bogen? Gar nicht. Auch mit irdischer Magie wirst du wenig Glück haben.
	AI_Output(self, hero, "Info_Mod_Jones_Hi_13_08"); //Ich habe hier eine leere Geister-Rune und ein Schwert, das mit einem ectoplasmatischen Überzug geschmiedet wurde.
	AI_Output(self, hero, "Info_Mod_Jones_Hi_13_09"); //Du musst entweder den Geist mit dem Schwert so schwer verletzen, bis seine Aura erlischt, oder den Zauber vorbereiten, der den Geist in dieser Rune fängt.

	Info_ClearChoices	(Info_Mod_Jones_Hi);
	
	Info_AddChoice	(Info_Mod_Jones_Hi, "Mit dem Geist werd ich schon fertig.", Info_Mod_Jones_Hi_Schwert);
	Info_AddChoice	(Info_Mod_Jones_Hi, "Ich will den Zauber vorbereiten.", Info_Mod_Jones_Hi_Zauber);
};

FUNC VOID Info_Mod_Jones_Hi_Schwert()
{
	AI_Output(hero, self, "Info_Mod_Jones_Hi_Schwert_15_00"); //Mit dem Geist werd ich schon fertig.
	AI_Output(self, hero, "Info_Mod_Jones_Hi_Schwert_13_01"); //Nun gut, hier ist das Schwert.

	CreateInvItems	(self, ItMw_Geisterschwert, 1);
	B_GiveInvItems	(self, hero, ItMw_Geisterschwert, 1);

	AI_Output(self, hero, "Info_Mod_Jones_Hi_Schwert_13_02"); //Sobald ich seinen Geist freigelassen habe musst du ihn vernichten.

	Info_ClearChoices	(Info_Mod_Jones_Hi);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Jones_Hi_Zauber()
{
	AI_Output(hero, self, "Info_Mod_Jones_Hi_Zauber_15_00"); //Ich will den Zauber vorbereiten.
	AI_Output(self, hero, "Info_Mod_Jones_Hi_Zauber_13_01"); //Gut, hier ist die Rune.

	CreateInvItems	(self, ItMi_Geisterrune, 1);
	B_GiveInvItems	(self, hero, ItMi_Geisterrune, 1);

	AI_Output(self, hero, "Info_Mod_Jones_Hi_Zauber_13_02"); //Darin wird der Geist gefangen. Dies geschieht durch einen Zauberspruch.
	AI_Output(self, hero, "Info_Mod_Jones_Hi_Zauber_13_03"); //Ich habe nur 5 Spruchrollen, also pass auf, dass du nicht zu viele verbrauchst. Wenn du den Zauber drei mal auf den Geist angewandt hast, sollte die Seele gefangen sein.

	CreateInvItems	(self, ItSc_Geisterspell, 5);
	B_GiveInvItems	(self, hero, ItSc_Geisterspell, 5);

	Info_ClearChoices	(Info_Mod_Jones_Hi);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Jones_Los (C_INFO)
{
	npc		= Mod_1554_KDW_Jones_DI;
	nr		= 1;
	condition	= Info_Mod_Jones_Los_Condition;
	information	= Info_Mod_Jones_Los_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Jones_Los_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jones_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jones_Los_Info()
{
	AI_Output(self, hero, "Info_Mod_Jones_Los_13_00"); //Also gut. Du weißt wo sich das Zentrum der Zombies befindet?
	AI_Output(hero, self, "Info_Mod_Jones_Los_15_01"); //Ja.
	AI_Output(self, hero, "Info_Mod_Jones_Los_13_02"); //Dann führe mich hin.

	AI_StopProcessInfos	(self);

	Npc_ExchangeRoutine	(self, "SKELETT");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
};

INSTANCE Info_Mod_Jones_Anfang (C_INFO)
{
	npc		= Mod_1554_KDW_Jones_DI;
	nr		= 1;
	condition	= Info_Mod_Jones_Anfang_Condition;
	information	= Info_Mod_Jones_Anfang_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Jones_Anfang_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jones_Los))
	&& (Npc_GetDistToWp(hero, "WP_DI_HOEHLE_RITUAL") < 1000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jones_Anfang_Info()
{
	AI_Output(self, hero, "Info_Mod_Jones_Anfang_13_00"); //Ah ja, halte dich bereit, ich werde jetzt beginnen.

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_PIRATEN_DI, "Jones beginnt jetzt damit, den Geist herbeizurufen. Ich sollte mich bereithalten.");

	Npc_ExchangeRoutine	(self, "CIRCLE");
	Npc_ExchangeRoutine	(Mod_1541_PIR_Greg_DI, "CIRCLE");
};

INSTANCE Info_Mod_Jones_Ende (C_INFO)
{
	npc		= Mod_1554_KDW_Jones_DI;
	nr		= 1;
	condition	= Info_Mod_Jones_Ende_Condition;
	information	= Info_Mod_Jones_Ende_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Jones_Ende_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jones_Anfang))
	&& (Mod_GeisterpiratWurdeGekillt == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jones_Ende_Info()
{
	AI_Output(self, hero, "Info_Mod_Jones_Ende_13_00"); //Wir haben es geschafft!

	if (Npc_HasItems(hero, ItMi_Geisterrune_Voll) == 1)
	{
		AI_Output(self, hero, "Info_Mod_Jones_Ende_13_01"); //Der Geist ist in der Rune gefangen. Mal sehen, was ich daraus machen kann.

		B_GiveInvItems	(hero, self, ItMi_Geisterrune_Voll, 1);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Jones_Ende_13_02"); //Du hast den Geist vernichtet und seine Seele befreit.
	};

	AI_Output(self, hero, "Info_Mod_Jones_Ende_13_03"); //Mir ist während des Rituals dort drüben die Wand aufgefallen. Ich halte es für möglich, dass dies noch nicht das Ende der Höhle ist.
	AI_Output(self, hero, "Info_Mod_Jones_Ende_13_04"); //Du solltest dich nach einem Schalter oder etwas ähnlichem umsehen, vielleicht kannst du dort noch etwas interessantes finden.
	AI_Output(self, hero, "Info_Mod_Jones_Ende_13_05"); //Ich werde zurück zum Strand gehen.

	AI_StopProcessInfos	(self);

	Npc_ExchangeRoutine	(self, "START");

	B_GivePlayerXP	(400);

	B_LogEntry	(TOPIC_MOD_PIRATEN_DI, "Der Geist wurde besiegt, allerdings ist Jones eine Wand aufgefallen, die seiner Meinung nach geöffnet werden kann. Ich sollte jetzt mit Greg sprechen.");

	self.aivar[AIV_PARTYMEMBER] = FALSE;
};

INSTANCE Info_Mod_Jones_Pickpocket (C_INFO)
{
	npc		= Mod_1554_KDW_Jones_DI;
	nr		= 1;
	condition	= Info_Mod_Jones_Pickpocket_Condition;
	information	= Info_Mod_Jones_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_100;
};

FUNC INT Info_Mod_Jones_Pickpocket_Condition()
{
	C_Beklauen	(97, ItMi_Gold, 600);
};

FUNC VOID Info_Mod_Jones_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Jones_Pickpocket);

	Info_AddChoice	(Info_Mod_Jones_Pickpocket, DIALOG_BACK, Info_Mod_Jones_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Jones_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Jones_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Jones_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Jones_Pickpocket);
};

FUNC VOID Info_Mod_Jones_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Jones_Pickpocket);
};

INSTANCE Info_Mod_Jones_EXIT (C_INFO)
{
	npc		= Mod_1554_KDW_Jones_DI;
	nr		= 1;	
	condition	= Info_Mod_Jones_EXIT_Condition;
	information	= Info_Mod_Jones_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Jones_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Jones_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};