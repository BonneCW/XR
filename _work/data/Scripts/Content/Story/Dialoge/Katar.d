INSTANCE Info_Mod_Katar_Daron (C_INFO)
{
	npc		= Mod_1190_NOV_Katar_NW;
	nr		= 1;
	condition	= Info_Mod_Katar_Daron_Condition;
	information	= Info_Mod_Katar_Daron_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Katar_Daron_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Daron_Katar))
	&& (Mod_Sekte_Karras >= 1)
	&& (Mod_Sekte_Joseppe < 2)
	&& (Npc_HasItems(hero, ItWr_BeliarBook) == 0)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Karras_NamibHabBuch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Katar_Daron_Info()
{
	AI_Output(self, hero, "Info_Mod_Katar_Daron_03_00"); //Innos kann nicht immer vergeben ... Innos kann mich mal kreuzweise! Verdammter Prediger.
	AI_Output(hero, self, "Info_Mod_Katar_Daron_15_01"); //Du scheinst ja nicht so gut auf Innos zu sprechen zu sein.
	AI_Output(self, hero, "Info_Mod_Katar_Daron_03_02"); //Na und? Was geht’s dich an?
	AI_Output(hero, self, "Info_Mod_Katar_Daron_15_03"); //Ich hätte vielleicht etwas für jemanden zu tun, der Zugang zum Kloster hat.
	AI_Output(self, hero, "Info_Mod_Katar_Daron_03_04"); //Worum geht’s?
	AI_Output(hero, self, "Info_Mod_Katar_Daron_15_05"); //Die Feuermagier haben ein Buch im Kloster, das ich brauche.
	AI_Output(self, hero, "Info_Mod_Katar_Daron_03_06"); //Und das wäre?
	AI_Output(hero, self, "Info_Mod_Katar_Daron_15_07"); //Das Necronomicum.
	AI_Output(self, hero, "Info_Mod_Katar_Daron_03_08"); //Necronomi... was? Ist ja auch egal ... was springt für mich dabei raus?
	AI_Output(hero, self, "Info_Mod_Katar_Daron_15_09"); //Wie wäre es mit einem Paket Sumpfkraut?
	AI_Output(self, hero, "Info_Mod_Katar_Daron_03_10"); //Ein Paket Sumpfkraut, soso. Na gut, abgemacht. Triff mich morgen unter der Brücke in der Nähe der Taverne.

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Der Feuer Novize Katar wird mir das Buch für das Sumpfkrautpaket besorgen.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "BRIDGE");
	B_StartOtherRoutine	(Mod_523_KDF_Daron_NW, "LIFEKLOSTER");

	Mod_Sekte_KatarDay = Wld_GetDay();
};

INSTANCE Info_Mod_Katar_Necronomicum (C_INFO)
{
	npc		= Mod_1190_NOV_Katar_NW;
	nr		= 1;
	condition	= Info_Mod_Katar_Necronomicum_Condition;
	information	= Info_Mod_Katar_Necronomicum_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Katar_Necronomicum_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Katar_Daron))
	&& (Npc_HasItems(hero, ItMi_HerbPaket) >= 1)
	&& (Mod_Sekte_KatarDay < Wld_GetDay())
	&& (Npc_HasItems(hero, ItWr_BeliarBook) == 0)
	&& (!Npc_KnowsInfo(hero, ItWr_BeliarBook))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Katar_Necronomicum_Info()
{
	AI_Output(self, hero, "Info_Mod_Katar_Necronomicum_03_00"); //Da bist du ja endlich. Hier dein Buch.

	CreateInvItems	(self, ItWr_BeliarBook, 1);

	AI_Output(hero, self, "Info_Mod_Katar_Necronomicum_15_01"); //Hier, dein Sumpfkraut.

	B_GiveInvItems	(hero, self, ItMi_HerbPaket, 1);

	AI_Output(self, hero, "Info_Mod_Katar_Necronomicum_03_02"); //Ach ja ... wegen des Sumpfkrautes, ich hab's mir anders überlegt. Ich will noch 4.000 Goldstücke.

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Ich habe das Buch von Katar erhalten und sollte es nun zu Karras bringen.");

	B_StartOtherRoutine	(self, "START");

	Info_ClearChoices	(Info_Mod_Katar_Necronomicum);

	Info_AddChoice	(Info_Mod_Katar_Necronomicum, "Du kriegst ein paar auf's Maul, wenn du mir das Buch nicht sofort gibst.", Info_Mod_Katar_Necronomicum_B);

	if (Npc_HasItems(hero, ItMi_Gold) >= 4000)
	{
		Info_AddChoice	(Info_Mod_Katar_Necronomicum, "Na gut, hier.", Info_Mod_Katar_Necronomicum_A);
	};
};

FUNC VOID Info_Mod_Katar_Necronomicum_B()
{
	AI_Output(hero, self, "Info_Mod_Katar_Necronomicum_B_15_00"); //Du kriegst ein paar auf's Maul, wenn du mir das Buch nicht sofort gibst.
	AI_Output(self, hero, "Info_Mod_Katar_Necronomicum_B_03_01"); //Versuch's doch.

	Info_ClearChoices	(Info_Mod_Katar_Necronomicum);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_None, 0);
};

FUNC VOID Info_Mod_Katar_Necronomicum_A()
{
	AI_Output(hero, self, "Info_Mod_Katar_Necronomicum_A_15_00"); //Na gut, hier.

	B_GiveInvItems	(hero, self, ItMi_Gold, 4000);

	AI_Output(self, hero, "Info_Mod_Katar_Necronomicum_A_03_01"); //Da, nimm.

	B_GiveInvItems	(self, hero, ItWr_BeliarBook, 1);

	Info_ClearChoices	(Info_Mod_Katar_Necronomicum);
};

INSTANCE Info_Mod_Katar_Pickpocket (C_INFO)
{
	npc		= Mod_1190_NOV_Katar_NW;
	nr		= 1;
	condition	= Info_Mod_Katar_Pickpocket_Condition;
	information	= Info_Mod_Katar_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Katar_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 250);
};

FUNC VOID Info_Mod_Katar_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Katar_Pickpocket);

	Info_AddChoice	(Info_Mod_Katar_Pickpocket, DIALOG_BACK, Info_Mod_Katar_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Katar_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Katar_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Katar_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Katar_Pickpocket);
};

FUNC VOID Info_Mod_Katar_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Katar_Pickpocket);
};

INSTANCE Info_Mod_Katar_EXIT (C_INFO)
{
	npc		= Mod_1190_NOV_Katar_NW;
	nr		= 1;
	condition	= Info_Mod_Katar_EXIT_Condition;
	information	= Info_Mod_Katar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Katar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Katar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};