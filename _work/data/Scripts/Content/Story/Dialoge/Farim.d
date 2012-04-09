INSTANCE Info_Mod_Farim_Hi (C_INFO)
{
	npc		= Mod_762_NONE_Farim_NW;
	nr		= 1;
	condition	= Info_Mod_Farim_Hi_Condition;
	information	= Info_Mod_Farim_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Farim_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Farim_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Farim_Hi_11_01"); //Ich bin Farim, ein Fischer. Wenn du Fische kaufen willst musst du allerdings zu Halvor.
};

INSTANCE Info_Mod_Farim_Salzwasser (C_INFO)
{
	npc		= Mod_762_NONE_Farim_NW;
	nr		= 1;
	condition	= Info_Mod_Farim_Salzwasser_Condition;
	information	= Info_Mod_Farim_Salzwasser_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du Salzwasser?";
};

FUNC INT Info_Mod_Farim_Salzwasser_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Farim_Hi))
	&& (Mod_ConstantinoZauberwasser == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Farim_Salzwasser_Info()
{
	AI_Output(hero, self, "Info_Mod_Farim_Salzwasser_15_00"); //Hast du Salzwasser?
	AI_Output(self, hero, "Info_Mod_Farim_Salzwasser_11_01"); //Wofür brauchst du denn Salzwasser?
	AI_Output(hero, self, "Info_Mod_Farim_Salzwasser_15_02"); //Constantino braucht es für sein Zauberwasser.
	AI_Output(self, hero, "Info_Mod_Farim_Salzwasser_11_03"); //Na wenn das so ist. Wie viel brauchst du denn?
	AI_Output(hero, self, "Info_Mod_Farim_Salzwasser_15_04"); //Zwei Flaschen.
	AI_Output(self, hero, "Info_Mod_Farim_Salzwasser_11_05"); //Hier hast du zwei.

	CreateInvItems	(self, ItMi_Salzwasser, 2);
	B_GiveInvItems	(self, hero, ItMi_Salzwasser, 2);

	AI_Output(self, hero, "Info_Mod_Farim_Salzwasser_11_06"); //Und jetzt beeil dich, wird Zeit, dass Kardif wieder eine Lieferung bekommt.
};

INSTANCE Info_Mod_Farim_HalvorHolFische (C_INFO)
{
	npc		= Mod_762_NONE_Farim_NW;
	nr		= 1;
	condition	= Info_Mod_Farim_HalvorHolFische_Condition;
	information	= Info_Mod_Farim_HalvorHolFische_Info;
	permanent	= 0;
	important	= 0;
	description	= "Halvor schickt mich.";
};

FUNC INT Info_Mod_Farim_HalvorHolFische_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Farim_Hi))
	&& (Mod_HalvorHolFischeQuest > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Farim_HalvorHolFische_Info()
{
	AI_Output(hero, self, "Info_Mod_Farim_HalvorHolFische_15_00"); //Halvor schickt mich. Ich soll die Fische abholen.
	AI_Output(self, hero, "Info_Mod_Farim_HalvorHolFische_11_01"); //Dann hat also wieder einen Laufburschen gefunden? Naja, mir solls egal sein.
	AI_Output(self, hero, "Info_Mod_Farim_HalvorHolFische_11_02"); //Hier hast du zehn Fische.

	CreateInvItems	(self, ItFo_Fish, 10);
	B_GiveInvItems	(self, hero, ItFo_Fish, 10);

	B_LogEntry	(TOPIC_MOD_HALVOR_HOLFISCHE, "Farim hat mir zehn Fische gegeben.");
};

INSTANCE Info_Mod_Farim_Paddel (C_INFO)
{
	npc		= Mod_762_NONE_Farim_NW;
	nr		= 1;
	condition	= Info_Mod_Farim_Paddel_Condition;
	information	= Info_Mod_Farim_Paddel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du ein paar Paddel übrig?";
};

FUNC INT Info_Mod_Farim_Paddel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Farim_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Garvell_Paddel))
	&& (Npc_KnowsInfo(hero, Info_Mod_Skip_Francis))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Farim_Paddel_Info()
{
	AI_Output(hero, self, "Info_Mod_Farim_Paddel_15_00"); //Hast du ein paar Paddel übrig?
	AI_Output(self, hero, "Info_Mod_Farim_Paddel_11_01"); //Nein. Brauch selber ein paar neue. Die halten nicht ewig im Salzwasser.
	AI_Output(hero, self, "Info_Mod_Farim_Paddel_15_02"); //Und woher bekommst du die?
	AI_Output(self, hero, "Info_Mod_Farim_Paddel_11_03"); //Der Schiffsbauer verkauft welche.
	AI_Output(hero, self, "Info_Mod_Farim_Paddel_15_04"); //Danke Mann. Allzeit guten Fang!
	AI_Output(self, hero, "Info_Mod_Farim_Paddel_11_05"); //Naja, so toll ist es nicht.

	B_LogEntry	(TOPIC_MOD_SKIP_PADDEL, "Farim bezieht seine Paddel von Garvell, dem Schiffsbauer.");
};

INSTANCE Info_Mod_Farim_Flugblätter (C_INFO)
{
	npc		= Mod_762_NONE_Farim_NW;
	nr		= 1;
	condition	= Info_Mod_Farim_Flugblätter_Condition;
	information	= Info_Mod_Farim_Flugblätter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab hier ein Flugblatt für dich.";
};

FUNC INT Info_Mod_Farim_Flugblätter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Auftrag_2))
	&& (Npc_HasItems(hero, MatteoFlugblätter) >= 1)
	&& (Mod_Flugblätter	<	20)
	&&(!Npc_KnowsInfo(hero, Info_Mod_Matteo_Flugblätter))
	&& (Npc_KnowsInfo(hero, Info_Mod_Farim_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Farim_Flugblätter_Info()
{
	B_Say (hero, self, "$MATTEOPAPER");

	B_GiveInvItems	(hero, self, MatteoFlugblätter, 1);

	AI_Output(self, hero, "Info_Mod_Farim_Flugblätter_11_01"); //Oh danke. Mal sehen ...

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Farim_Flugblätter_11_02"); //Ah ja. Vielleicht werd ich mal bei Matteo vorbeischauen.

	Mod_Flugblätter	=	Mod_Flugblätter + 1;
};

INSTANCE Info_Mod_Farim_Pickpocket (C_INFO)
{
	npc		= Mod_762_NONE_Farim_NW;
	nr		= 1;
	condition	= Info_Mod_Farim_Pickpocket_Condition;
	information	= Info_Mod_Farim_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20;
};

FUNC INT Info_Mod_Farim_Pickpocket_Condition()
{
	C_Beklauen	(20, ItMi_Gold, 15);
};

FUNC VOID Info_Mod_Farim_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Farim_Pickpocket);

	Info_AddChoice	(Info_Mod_Farim_Pickpocket, DIALOG_BACK, Info_Mod_Farim_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Farim_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Farim_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Farim_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Farim_Pickpocket);
};

FUNC VOID Info_Mod_Farim_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Farim_Pickpocket);
};

INSTANCE Info_Mod_Farim_EXIT (C_INFO)
{
	npc		= Mod_762_NONE_Farim_NW;
	nr		= 1;
	condition	= Info_Mod_Farim_EXIT_Condition;
	information	= Info_Mod_Farim_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Farim_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Farim_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};