INSTANCE Info_Mod_PlattformAWBeliar_Erzbrocken (C_INFO)
{
	npc		= Mod_7314_Ziel_AW;
	nr		= 1;
	condition	= Info_Mod_PlattformAWBeliar_Erzbrocken_Condition;
	information	= Info_Mod_PlattformAWBeliar_Erzbrocken_Info;
	permanent	= 0;
	important	= 0;
	description	= "(Erzbrocken auf Plattform legen)";
};

FUNC INT Info_Mod_PlattformAWBeliar_Erzbrocken_Condition()
{
	if (Npc_HasItems(hero, ItMi_Nugget) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_PlattformAWBeliar_Erzbrocken_Info()
{
	B_GiveInvItems	(hero, self, ItMi_Nugget, 1);
};

INSTANCE Info_Mod_PlattformAWBeliar_Weihwasser (C_INFO)
{
	npc		= Mod_7314_Ziel_AW;
	nr		= 1;
	condition	= Info_Mod_PlattformAWBeliar_Weihwasser_Condition;
	information	= Info_Mod_PlattformAWBeliar_Weihwasser_Info;
	permanent	= 0;
	important	= 0;
	description	= "(Weihwasser auf Plattform legen)";
};

FUNC INT Info_Mod_PlattformAWBeliar_Weihwasser_Condition()
{
	if (Npc_HasItems(hero, ItMi_HolyWater) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_PlattformAWBeliar_Weihwasser_Info()
{
	B_GiveInvItems	(hero, self, ItMi_HolyWater, 1);
};

INSTANCE Info_Mod_PlattformAWBeliar_EXIT (C_INFO)
{
	npc		= Mod_7314_Ziel_AW;
	nr		= 1;
	condition	= Info_Mod_PlattformAWBeliar_EXIT_Condition;
	information	= Info_Mod_PlattformAWBeliar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_PlattformAWBeliar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_PlattformAWBeliar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};