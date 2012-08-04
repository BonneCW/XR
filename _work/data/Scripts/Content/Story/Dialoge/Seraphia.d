INSTANCE Info_Mod_Seraphia_Hi (C_INFO)
{
	npc		= Mod_1622_EBR_Seraphia_MT;
	nr		= 1;
	condition	= Info_Mod_Seraphia_Hi_Condition;
	information	= Info_Mod_Seraphia_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hey, willst du diesen Ort verlassen? Dann zieh dir das hier über und folge mir.";
};

FUNC INT Info_Mod_Seraphia_Hi_Condition()
{
	if (Mod_SLD_Nebel == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Seraphia_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Seraphia_Hi_15_00"); //Hey, willst du diesen Ort verlassen? Dann zieh dir das hier über und folge mir.
	AI_Output(self, hero, "Info_Mod_Seraphia_Hi_16_01"); //Was willst du von mir? Geh weg, lass mich in Ruhe.
};

INSTANCE Info_Mod_Seraphia_Lagermusik (C_INFO)
{
	npc		= Mod_1622_EBR_Seraphia_MT;
	nr		= 1;
	condition	= Info_Mod_Seraphia_Lagermusik_Condition;
	information	= Info_Mod_Seraphia_Lagermusik_Info;
	permanent	= 0;
	important	= 0;
	description	= "Willst du Gravos neue Musikgruppe unterstützen?";
};

FUNC INT Info_Mod_Seraphia_Lagermusik_Condition()
{
	if (Mod_Gravo_Schatz == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Seraphia_Lagermusik_Info()
{
	AI_Output(hero, self, "Info_Mod_Seraphia_Lagermusik_15_00"); //Willst du Gravos neue Musikgruppe unterstützen?
	AI_Output(self, hero, "Info_Mod_Seraphia_Lagermusik_16_01"); //Wieso nicht? Thorus zeigt mir nur seine kalte Schulter, dieser verklemmte Typ, ich hab also nichts zu tun.
	AI_Output(self, hero, "Info_Mod_Seraphia_Lagermusik_16_02"); //Und ein wenig Musik ist doch eine willkommene Abwechslung.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ATGRAVO");

	B_GivePlayerXP	(50);
};

INSTANCE Info_Mod_Seraphia_EXIT (C_INFO)
{
	npc		= Mod_1622_EBR_Seraphia_MT;
	nr		= 1;
	condition	= Info_Mod_Seraphia_EXIT_Condition;
	information	= Info_Mod_Seraphia_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Seraphia_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Seraphia_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};