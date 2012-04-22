INSTANCE Info_Mod_Abuyin_Hi (C_INFO)
{
	npc		= Mod_558_NONE_Abuyin_NW;
	nr		= 1;
	condition	= Info_Mod_Abuyin_Hi_Condition;
	information	= Info_Mod_Abuyin_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Abuyin_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Abuyin_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Abuyin_Hi_13_00"); //Fremder, komm zu Abuyin ins Reich der tausend Sinne.
	AI_Output(self, hero, "Info_Mod_Abuyin_Hi_13_01"); //Hier kannst du die verschiedensten Tabaksorten rauchen und ganz neue Erfahrungen sammeln.
	AI_Output(self, hero, "Info_Mod_Abuyin_Hi_13_02"); //Setz dich einfach an eine der Wasserpfeifen und wähle eine der unvergleichlichen Geschmacksrichtungen.
};

INSTANCE Info_Mod_Abuyin_NewTabak (C_INFO)
{
	npc		= Mod_558_NONE_Abuyin_NW;
	nr		= 1;
	condition	= Info_Mod_Abuyin_NewTabak_Condition;
	information	= Info_Mod_Abuyin_NewTabak_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Abuyin_NewTabak_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Abuyin_Hi))
	&& (Kapitel >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Abuyin_NewTabak_Info()
{
	AI_Output(self, hero, "Info_Mod_Abuyin_NewTabak_13_00"); //Sohn des Schicksals, du wirst interessiert sein zu hören, dass mein Angebot erweitert ist.
	AI_Output(self, hero, "Info_Mod_Abuyin_NewTabak_13_01"); //Mach eine Pause und genieße den neuen Tabak aus dem fernen Varant.
};

INSTANCE Info_Mod_Abuyin_Flugblaetter (C_INFO)
{
	npc		= Mod_558_NONE_Abuyin_NW;
	nr		= 1;
	condition	= Info_Mod_Abuyin_Flugblaetter_Condition;
	information	= Info_Mod_Abuyin_Flugblaetter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab hier ein Flugblatt für dich.";
};

FUNC INT Info_Mod_Abuyin_Flugblaetter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Auftrag_2))
	&& (Npc_HasItems(hero, MatteoFlugblaetter) >= 1)
	&& (Mod_Flugblaetter	<	20)
	&&(!Npc_KnowsInfo(hero, Info_Mod_Matteo_Flugblaetter))
	&& (Npc_KnowsInfo(hero, Info_Mod_Abuyin_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Abuyin_Flugblaetter_Info()
{
	B_Say (hero, self, "$MATTEOPAPER");

	B_GiveInvItems	(hero, self, MatteoFlugblaetter, 1);

	AI_Output(self, hero, "Info_Mod_Abuyin_Flugblaetter_13_01"); //Ich habe vorausgesehen, dass du kommen würdest.
	AI_Output(self, hero, "Info_Mod_Abuyin_Flugblaetter_13_02"); //Vielleicht werd ich mal bei Matteo vorbeischauen.

	Mod_Flugblaetter += 1;
};

INSTANCE Info_Mod_Abuyin_Plagenquest (C_INFO)
{
	npc		= Mod_558_NONE_Abuyin_NW;
	nr		= 1;
	condition	= Info_Mod_Abuyin_Plagenquest_Condition;
	information	= Info_Mod_Abuyin_Plagenquest_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du auch starken Tabak? Und ich meine keinen Apfeltabak ...";
};

FUNC INT Info_Mod_Abuyin_Plagenquest_Condition()
{
	if ((Npc_KnowsInfo(hero, Info_Mod_Lukas_Plagenquest_02))
	|| (Npc_KnowsInfo(hero, Info_Mod_Wendel_Plagenquest_02))
	|| (Npc_KnowsInfo(hero, Info_Mod_Theodorus_Plagenquest_02)))
	&& (Npc_KnowsInfo(hero, Info_Mod_Abuyin_Hi))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 100)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Abuyin_Plagenquest_Info()
{
	AI_Output(hero, self, "Info_Mod_Abuyin_Plagenquest_15_00"); //Hast du auch starken Tabak? Und ich meine keinen Apfeltabak ...
	AI_Output(self, hero, "Info_Mod_Abuyin_Plagenquest_13_01"); //Ja, ich bin auch im Besitz eines solchen, Sohn des Abendlandes, wenn du den Genuss danach verspürst ...
	AI_Output(hero, self, "Info_Mod_Abuyin_Plagenquest_15_02"); //Wie viel kosten zwei Portionen von diesem Tabak?
	AI_Output(self, hero, "Info_Mod_Abuyin_Plagenquest_13_03"); //100 Goldmünzen. Aber ich weiß, dass du diesen Betrag gerne bezahlen wirst.

	if (Mod_Verhandlungsgeschick > 0)
	{
		AI_Output(hero, self, "Info_Mod_Abuyin_Plagenquest_15_04"); //Diesmal trügt dich deine Voraussicht.

		if (self.aivar[AIV_Verhandlung] == TRUE)
		{
			AI_Output(self, hero, "Info_Mod_Abuyin_Plagenquest_13_05"); //Habe ich gesagt 100 Goldmünzen? Ich meinte natürlich 50.
			AI_Output(self, hero, "Info_Mod_Abuyin_Plagenquest_13_06"); //Abuyin irrt sich nie.

			B_GiveInvItems	(hero, self, ItMi_Gold, 50);

			B_RaiseHandelsgeschick (2);
		}
		else
		{
			AI_Output(self, hero, "Info_Mod_Abuyin_Plagenquest_13_07"); //Gewiss nicht.

			B_GiveInvItems	(hero, self, ItMi_Gold, 100);
		};
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Abuyin_Plagenquest_15_08"); //Dann hätte ich gerne zwei Portionen.

		B_GiveInvItems	(hero, self, ItMi_Gold, 100);
	};

	AI_Output(self, hero, "Info_Mod_Abuyin_Plagenquest_13_09"); //Bitte sehr.

	B_GiveInvItems	(self, hero, ItMi_StarkerTabak, 2);
};

INSTANCE Info_Mod_Abuyin_Pickpocket (C_INFO)
{
	npc		= Mod_558_NONE_Abuyin_NW;
	nr		= 1;
	condition	= Info_Mod_Abuyin_Pickpocket_Condition;
	information	= Info_Mod_Abuyin_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Abuyin_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_Abuyin_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Abuyin_Pickpocket);

	Info_AddChoice	(Info_Mod_Abuyin_Pickpocket, DIALOG_BACK, Info_Mod_Abuyin_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Abuyin_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Abuyin_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Abuyin_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Abuyin_Pickpocket);
};

FUNC VOID Info_Mod_Abuyin_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Abuyin_Pickpocket);
};

INSTANCE Info_Mod_Abuyin_EXIT (C_INFO)
{
	npc		= Mod_558_NONE_Abuyin_NW;
	nr		= 1;
	condition	= Info_Mod_Abuyin_EXIT_Condition;
	information	= Info_Mod_Abuyin_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Abuyin_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Abuyin_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};