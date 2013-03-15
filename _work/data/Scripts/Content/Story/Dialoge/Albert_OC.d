INSTANCE Info_Mod_Albert_OC_Bridge (C_INFO)
{
	npc		= Mod_7178_VMG_Albert_OC;
	nr		= 1;
	condition	= Info_Mod_Albert_OC_Bridge_Condition;
	information	= Info_Mod_Albert_OC_Bridge_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Albert_OC_Bridge_Condition()
{
	if (Npc_GetDistToWP(self, "WP_OCC_203") < 1000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albert_OC_Bridge_Info()
{
	AI_Output(self, hero, "Info_Mod_Albert_OC_Bridge_32_00"); //Hier müssen wir nach links gehen ...

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Albert_OC_Tor (C_INFO)
{
	npc		= Mod_7178_VMG_Albert_OC;
	nr		= 1;
	condition	= Info_Mod_Albert_OC_Tor_Condition;
	information	= Info_Mod_Albert_OC_Tor_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Albert_OC_Tor_Condition()
{
	if (Npc_GetDistToWP(self, "WP_OCC_56") < 1000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albert_OC_Tor_Info()
{
	AI_Output(self, hero, "Info_Mod_Albert_OC_Tor_32_00"); //Hier müssen wir uns ebenfalls links halten.
	AI_Output(self, hero, "Info_Mod_Albert_OC_Tor_32_01"); //Irgendwann kommen wir dann an einer großen Orkstatue vorbei, von welcher es nur noch ein paar Meter bis zu der Grube mit den Banditen sind.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Albert_OC_Hi (C_INFO)
{
	npc		= Mod_7178_VMG_Albert_OC;
	nr		= 1;
	condition	= Info_Mod_Albert_OC_Hi_Condition;
	information	= Info_Mod_Albert_OC_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Albert_OC_Hi_Condition()
{
	if (Npc_GetDistToWP(self, "WP_OCC_258") < 1000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albert_OC_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Albert_OC_Hi_32_00"); //Da unten sind sie. Bei ihnen befindet sich eine Teleportplattform.
	AI_Output(self, hero, "Info_Mod_Albert_OC_Hi_32_01"); //Ich werde diese über das Amulett mit etwas magischer Energie speisen ... dann sollten sie im Nu hier oben stehen.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "RETTUNG");
};

INSTANCE Info_Mod_Albert_OC_Alarm (C_INFO)
{
	npc		= Mod_7178_VMG_Albert_OC;
	nr		= 1;
	condition	= Info_Mod_Albert_OC_Alarm_Condition;
	information	= Info_Mod_Albert_OC_Alarm_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Albert_OC_Alarm_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Esteban_OC_Hi))
	&& (Npc_GetDistToWP(hero, "WP_OCC_106") < 1000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albert_OC_Alarm_Info()
{
	AI_Output(self, hero, "Info_Mod_Albert_OC_Alarm_32_00"); //Verflucht, dank dieses Lärms wissen die Orks jetzt unzweifelhaft von unserer Anwesenheit. Die Verwandlungen vorher haben mich einiges an magischer Kraft gekostet.
	AI_Output(self, hero, "Info_Mod_Albert_OC_Alarm_32_01"); //Ich könnte aber doch noch den Versuch unternehmen, uns mithilfe des Amulettes hier herauszubringen, obwohl es eine große Herausforderung ist, den Zauber auf so viele Kampfgefährten gleichzeitig zu wirken.
	AI_Output(self, hero, "Info_Mod_Albert_OC_Alarm_32_02"); //Was meinst du?

	Mod_AlbertTransforms = 4;
};

INSTANCE Info_Mod_Albert_OC_You (C_INFO)
{
	npc		= Mod_7178_VMG_Albert_OC;
	nr		= 1;
	condition	= Info_Mod_Albert_OC_You_Condition;
	information	= Info_Mod_Albert_OC_You_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ja, benutze das Amulett.";
};

FUNC INT Info_Mod_Albert_OC_You_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Albert_OC_Alarm))
	&& (Mod_AlbertTransforms == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albert_OC_You_Info()
{
	AI_Output(hero, self, "Info_Mod_Albert_OC_You_15_00"); //Ja, benutze das Amulett.
	AI_Output(self, hero, "Info_Mod_Albert_OC_You_32_01"); //In Ordnung, ich hoffe meine magische Kraft reicht aus.

	Mod_AlbertTransforms = 5;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TRANSFORMTORABBIT");
};

INSTANCE Info_Mod_Albert_OC_Fight (C_INFO)
{
	npc		= Mod_7178_VMG_Albert_OC;
	nr		= 1;
	condition	= Info_Mod_Albert_OC_Fight_Condition;
	information	= Info_Mod_Albert_OC_Fight_Info;
	permanent	= 0;
	important	= 0;
	description	= "Nein, wir werden uns schon den Weg freikämpfen.";
};

FUNC INT Info_Mod_Albert_OC_Fight_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Albert_OC_Alarm))
	&& (Mod_AlbertTransforms == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albert_OC_Fight_Info()
{
	AI_Output(hero, self, "Info_Mod_Albert_OC_Fight_15_00"); //Nein, wir werden uns schon den Weg freikämpfen.
	AI_Output(self, hero, "Info_Mod_Albert_OC_Fight_32_01"); //Ein großes Wagnis, aber in Ordnung. Du hast bisher dein Kampfgeschick schon unter Beweis gestellt.

	Mod_AlbertTransforms = 5;

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Albert_OC_EXIT (C_INFO)
{
	npc		= Mod_7178_VMG_Albert_OC;
	nr		= 1;
	condition	= Info_Mod_Albert_OC_EXIT_Condition;
	information	= Info_Mod_Albert_OC_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Albert_OC_EXIT_Condition()
{
	if (Mod_AlbertTransforms != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Albert_OC_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};