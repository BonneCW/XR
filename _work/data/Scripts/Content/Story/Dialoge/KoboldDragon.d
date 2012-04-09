INSTANCE Info_Mod_KoboldDragon_Hi (C_INFO)
{
	npc		= Kobold_11010_NW;
	nr		= 1;
	condition	= Info_Mod_KoboldDragon_Hi_Condition;
	information	= Info_Mod_KoboldDragon_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_KoboldDragon_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_KoboldDragon_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_KoboldDragon_Hi_20_00"); //Ahh, du bist es. Mein Meister erwartet dich bereits. Er weiß von deinen Taten und es wäre ihm eine Freude, dich zu sprechen.

	B_LogEntry	(TOPIC_MOD_NL_DRACHEN, "Der Meister des Kobolds, vermutlich ein Drache, weiß von meinen Taten? Fragt sich nur von welchen ...");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "DRAGON");
};

INSTANCE Info_Mod_KoboldDragon_Stab (C_INFO)
{
	npc		= Kobold_11010_NW;
	nr		= 1;
	condition	= Info_Mod_KoboldDragon_Stab_Condition;
	information	= Info_Mod_KoboldDragon_Stab_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_KoboldDragon_Stab_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragon_Snorre))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_KoboldDragon_Stab_Info()
{
	AI_Output(self, hero, "Info_Mod_KoboldDragon_Stab_20_00"); //Puhh, die ganzen Schätze wiegen gar nicht so wenig ...
	AI_Output(self, hero, "Info_Mod_KoboldDragon_Stab_20_01"); //Was?! Du hier, Mensch?! Was willst du?

	Info_ClearChoices	(Info_Mod_KoboldDragon_Stab);

	Info_AddChoice	(Info_Mod_KoboldDragon_Stab, "Einen goldenen Stab, den du vermutlich mitgenommen hast.", Info_Mod_KoboldDragon_Stab_B);
	Info_AddChoice	(Info_Mod_KoboldDragon_Stab, "Dich töten.", Info_Mod_KoboldDragon_Stab_A);
};

FUNC VOID Info_Mod_KoboldDragon_Stab_B()
{
	AI_Output(hero, self, "Info_Mod_KoboldDragon_Stab_B_15_00"); //Einen goldenen Stab, den du vermutlich mitgenommen hast.
	AI_Output(self, hero, "Info_Mod_KoboldDragon_Stab_B_20_01"); //Goldenen Stab? Sollst du haben.

	B_GiveInvItems	(self, hero, ItMw_PyrmansStab, 1);

	AI_Output(self, hero, "Info_Mod_KoboldDragon_Stab_B_20_02"); //So bin ich weniger beladen und weiß auf meiner Seite den vermeintlichen Diener meines einstigen Herrn.
	AI_Output(self, hero, "Info_Mod_KoboldDragon_Stab_B_20_03"); //Viel Glück noch, Mensch.

	B_GivePlayerXP	(200);

	Info_ClearChoices	(Info_Mod_KoboldDragon_Stab);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_KoboldDragon_Stab_A()
{
	AI_Output(hero, self, "Info_Mod_KoboldDragon_Stab_A_15_00"); //Dich töten.
	AI_Output(self, hero, "Info_Mod_KoboldDragon_Stab_A_20_01"); //Garstiger Mensch ... aber wie du willst. Du hast dein Los selbst gewählt.

	CreateInvItems	(self, ItMw_PyrmansStab, 1);
	CreateInvItems	(self, ItMi_Gold, 1436);
	CreateInvItems	(self, ItMi_GoldCup, 3);
	CreateInvItems	(self, ItMi_GoldPlate, 5);
	CreateInvItems	(self, ItMi_SilverCup, 15);

	Info_ClearChoices	(Info_Mod_KoboldDragon_Stab);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Kill, 0);
};

INSTANCE Info_Mod_KoboldDragon_EXIT (C_INFO)
{
	npc		= Kobold_11010_NW;
	nr		= 1;
	condition	= Info_Mod_KoboldDragon_EXIT_Condition;
	information	= Info_Mod_KoboldDragon_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_KoboldDragon_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_KoboldDragon_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};