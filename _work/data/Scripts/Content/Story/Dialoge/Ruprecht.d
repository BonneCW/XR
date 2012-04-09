INSTANCE Info_Mod_Ruprecht_Hi (C_INFO)
{
	npc		= Mod_7418_OUT_Ruprecht_REL;
	nr		= 1;
	condition	= Info_Mod_Ruprecht_Hi_Condition;
	information	= Info_Mod_Ruprecht_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Ruprecht_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ruprecht_Hi_Info()
{
	B_Say	(hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Ruprecht_Hi_13_00"); //Mein Name ist Ruprecht. Ich ziehe von meinem Ersparten durch die Länder und lerne fremde Kulturen kennen. Die Wirtshauskultur, vor allem.
};

INSTANCE Info_Mod_Ruprecht_FrueherGemacht (C_INFO)
{
	npc		= Mod_7418_OUT_Ruprecht_REL;
	nr		= 1;
	condition	= Info_Mod_Ruprecht_FrueherGemacht_Condition;
	information	= Info_Mod_Ruprecht_FrueherGemacht_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was hast du früher gemacht?";
};

FUNC INT Info_Mod_Ruprecht_FrueherGemacht_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ruprecht_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ruprecht_FrueherGemacht_Info()
{
	AI_Output(hero, self, "Info_Mod_Ruprecht_FrueherGemacht_15_00"); //Was hast du früher gemacht?
	AI_Output(self, hero, "Info_Mod_Ruprecht_FrueherGemacht_13_01"); //(wortkarg) Ich war lange im Krieg.
};

INSTANCE Info_Mod_Ruprecht_Truhe (C_INFO)
{
	npc		= Mod_7418_OUT_Ruprecht_REL;
	nr		= 1;
	condition	= Info_Mod_Ruprecht_Truhe_Condition;
	information	= Info_Mod_Ruprecht_Truhe_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ruprecht_Truhe_Condition()
{
	if (Mod_LeonhardRuprecht == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ruprecht_Truhe_Info()
{
	AI_Output(self, hero, "Info_Mod_Ruprecht_Truhe_13_00"); //Warte mal einen Augenblick. Was hast du gerade da oben gesucht?
	AI_Output(hero, self, "Info_Mod_Ruprecht_Truhe_15_01"); //Nichts Besonderes.
	AI_Output(self, hero, "Info_Mod_Ruprecht_Truhe_13_02"); //Dann zeig mal her.

	if (Npc_HasItems(hero, ItRi_Ruprecht) == 1)
	{
		AI_Output(self, hero, "Info_Mod_Ruprecht_Truhe_13_03"); //So, du wolltest also meinen Ring stehlen.

		B_GiveInvItems	(hero, self, ItRi_Ruprecht, 1);

		if (Kapitel < 3)
		{
			AI_Output(self, hero, "Info_Mod_Ruprecht_Truhe_13_04"); //Mal sehen, was Anselm dazu sagen wird, wenn ich es ihm erzähle.
		};

		Mod_LeonhardRuprecht = 3;
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Ruprecht_Truhe_13_05"); //Tut mir Leid, dass ich so unfreundlich war, aber du wärst nicht der Erste, der hinter meinen Besitztümern her ist.
	};
};

INSTANCE Info_Mod_Ruprecht_Freudenspender (C_INFO)
{
	npc		= Mod_7418_OUT_Ruprecht_REL;
	nr		= 1;
	condition	= Info_Mod_Ruprecht_Freudenspender_Condition;
	information	= Info_Mod_Ruprecht_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Ich hab' hier Freudenspender ...";
};                       

FUNC INT Info_Mod_Ruprecht_Freudenspender_Condition()
{
	if (Npc_HasItems(hero, ItMi_Freudenspender) >= 1)
	&& (Mod_Freudenspender < 5)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Hi))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Ruprecht_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Ruprecht_Freudenspender_15_00"); //Ich hab' hier Freudenspender ...
	AI_Output(self, hero, "Info_Mod_Ruprecht_Freudenspender_13_01"); //Danke, aber ich möchte nichts.
};

INSTANCE Info_Mod_Ruprecht_Pickpocket (C_INFO)
{
	npc		= Mod_7418_OUT_Ruprecht_REL;
	nr		= 1;
	condition	= Info_Mod_Ruprecht_Pickpocket_Condition;
	information	= Info_Mod_Ruprecht_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Ruprecht_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Ruprecht_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Ruprecht_Pickpocket);

	Info_AddChoice	(Info_Mod_Ruprecht_Pickpocket, DIALOG_BACK, Info_Mod_Ruprecht_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Ruprecht_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Ruprecht_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Ruprecht_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Ruprecht_Pickpocket);
};

FUNC VOID Info_Mod_Ruprecht_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Ruprecht_Pickpocket);
};

INSTANCE Info_Mod_Ruprecht_EXIT (C_INFO)
{
	npc		= Mod_7418_OUT_Ruprecht_REL;
	nr		= 1;
	condition	= Info_Mod_Ruprecht_EXIT_Condition;
	information	= Info_Mod_Ruprecht_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Ruprecht_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ruprecht_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};