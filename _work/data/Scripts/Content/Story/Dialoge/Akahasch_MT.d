INSTANCE Info_Mod_Akahasch_MT_Hi (C_INFO)
{
	npc		= Mod_7760_NOV_Akahasch_MT;
	nr		= 1;
	condition	= Info_Mod_Akahasch_MT_Hi_Condition;
	information	= Info_Mod_Akahasch_MT_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Warst du nicht mal Novize im Innoskloster?";
};

FUNC INT Info_Mod_Akahasch_MT_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Akahasch_MT_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Akahasch_MT_Hi_15_00"); //Warst du nicht mal Novize im Innoskloster?
	AI_Output(self, hero, "Info_Mod_Akahasch_MT_Hi_24_01"); //Erinnere mich bloß nicht daran. Nach der Geschichte mit der Stadt haben die mir im Kloster das Leben nur noch zur Hölle gemacht.
	AI_Output(self, hero, "Info_Mod_Akahasch_MT_Hi_24_02"); //Irgendjemand muss mich verpfiffen haben. Ich habe diesen Ulf in Verdacht ...
	AI_Output(self, hero, "Info_Mod_Akahasch_MT_Hi_24_03"); //Egal, hier geht es mir jetzt tausendmal besser. Als ehemaligen Feuernovizen haben die mich hier mit offenen Armen aufgenommen.
};

INSTANCE Info_Mod_Akahasch_MT_EXIT (C_INFO)
{
	npc		= Mod_7760_NOV_Akahasch_MT;
	nr		= 1;
	condition	= Info_Mod_Akahasch_MT_EXIT_Condition;
	information	= Info_Mod_Akahasch_MT_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Akahasch_MT_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Akahasch_MT_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};