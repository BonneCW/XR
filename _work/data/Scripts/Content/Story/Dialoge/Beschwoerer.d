INSTANCE Info_Mod_Beschwoerer_Hi (C_INFO)
{
	npc		= Mod_1775_DMB_Beschwoerer_PAT;
	nr		= 1;
	condition	= Info_Mod_Beschwoerer_Hi_Condition;
	information	= Info_Mod_Beschwoerer_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Beschwoerer_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Beschwoerer_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Beschwoerer_Hi_02_00"); //Du bist uns oft genug in die Quere gekommen. Jetzt wirst du sterben und Aaron hat freien Weg!

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_GuildEnemy, 0);
};

INSTANCE Info_Mod_Beschwoerer_EXIT (C_INFO)
{
	npc		= Mod_1775_DMB_Beschwoerer_PAT;
	nr		= 1;
	condition	= Info_Mod_Beschwoerer_EXIT_Condition;
	information	= Info_Mod_Beschwoerer_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Beschwoerer_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Beschwoerer_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};