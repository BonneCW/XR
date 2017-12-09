INSTANCE Info_Mod_Lee_GDG_Hi (C_INFO)
{
	npc		= Mod_6006_SLD_Lee_GDG;
	nr		= 1;
	condition	= Info_Mod_Lee_GDG_Hi_Condition;
	information	= Info_Mod_Lee_GDG_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lee_GDG_Hi_Condition()
{
	if (hero.guild == GIL_MIL)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lee_GDG_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Lee_GDG_Hi_04_00"); //Thofeistos hat mir das hier noch für dich mitgegeben.

	B_GiveInvItems	(self, hero, ItAr_DJG_H, 1);

	AI_Output(self, hero, "Info_Mod_Lee_GDG_Hi_04_01"); //Hoffentlich hält die Rüstung, was sie verspricht.
};

INSTANCE Info_Mod_Lee_GDG_EXIT (C_INFO)
{
	npc		= Mod_6006_SLD_Lee_GDG;
	nr		= 999;
	condition	= Info_Mod_Lee_GDG_EXIT_Condition;
	information	= Info_Mod_Lee_GDG_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Lee_GDG_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Lee_GDG_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};