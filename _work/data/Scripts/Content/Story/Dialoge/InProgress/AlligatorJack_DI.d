INSTANCE Info_Mod_AlligatorJack_DI_KommMit (C_INFO)
{
	npc		= Mod_1542_PIR_AlligatorJack_DI;
	nr		= 1;
	condition	= Info_Mod_AlligatorJack_DI_KommMit_Condition;
	information	= Info_Mod_AlligatorJack_DI_KommMit_Info;
	permanent	= 0;
	important	= 0;
	description	= "Komm mit.";
};

FUNC INT Info_Mod_AlligatorJack_DI_KommMit_Condition()
{
	if (Mod_DI_InselErkunden == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_AlligatorJack_DI_KommMit_Info()
{
	AI_Output(hero, self, "Info_Mod_AlligatorJack_DI_KommMit_15_00"); //Komm mit.
	AI_Output(self, hero, "Info_Mod_AlligatorJack_DI_KommMit_03_01"); //Ich hoffe hier kann man was jagen. Also los.

	AI_StopProcessInfos	(self);

	Npc_ExchangeRoutine	(self, "SKELETT");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
};

INSTANCE Info_Mod_AlligatorJack_DI_Stollen_01 (C_INFO)
{
	npc		= Mod_1542_PIR_AlligatorJack_DI;
	nr		= 1;
	condition	= Info_Mod_AlligatorJack_DI_Stollen_01_Condition;
	information	= Info_Mod_AlligatorJack_DI_Stollen_01_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_AlligatorJack_DI_Stollen_01_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_AlligatorJack_DI_KommMit))
	&& (Npc_GetDistToWP(hero, "WP_DI_HOEHLE_01_TUNNEL_4") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_AlligatorJack_DI_Stollen_01_Info()
{
	AI_Output(self, hero, "Info_Mod_AlligatorJack_DI_Stollen_01_03_00"); //Hm ... hier geht’s nicht weiter. Aber das müsste man wegräumen können.

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_PIRATEN_DI, "Wir haben einen verschütteten Gang entdeckt.");
};

INSTANCE Info_Mod_AlligatorJack_DI_Stollen_02 (C_INFO)
{
	npc		= Mod_1542_PIR_AlligatorJack_DI;
	nr		= 1;
	condition	= Info_Mod_AlligatorJack_DI_Stollen_02_Condition;
	information	= Info_Mod_AlligatorJack_DI_Stollen_02_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_AlligatorJack_DI_Stollen_02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_AlligatorJack_DI_KommMit))
	&& (Npc_GetDistToWP(hero, "WP_DI_HOEHLE_02_TUNNEL_2") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_AlligatorJack_DI_Stollen_02_Info()
{
	AI_Output(self, hero, "Info_Mod_AlligatorJack_DI_Stollen_02_03_00"); //Warte mal. Ich glaub, hier ist was ...
	AI_Output(hero, self, "Info_Mod_AlligatorJack_DI_Stollen_02_15_01"); //Was denn?
	AI_Output(self, hero, "Info_Mod_AlligatorJack_DI_Stollen_02_03_02"); //Das könnte ein blockierter Stollen sein.
	AI_Output(hero, self, "Info_Mod_AlligatorJack_DI_Stollen_02_15_03"); //Tatsächlich. Bloß wie kommt man da rein?
	AI_Output(self, hero, "Info_Mod_AlligatorJack_DI_Stollen_02_03_04"); //Keine Ahnung. Wir werden es dem Käpt'n erzählen. Weiter.

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_PIRATEN_DI, "Es gibt eine Wand entdeckt, die zu öffnen sein sollte.");
};

INSTANCE Info_Mod_AlligatorJack_DI_Vorsicht (C_INFO)
{
	npc		= Mod_1542_PIR_AlligatorJack_DI;
	nr		= 1;
	condition	= Info_Mod_AlligatorJack_DI_Vorsicht_Condition;
	information	= Info_Mod_AlligatorJack_DI_Vorsicht_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_AlligatorJack_DI_Vorsicht_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_AlligatorJack_DI_Stollen_01))
	&& (Npc_KnowsInfo(hero, Info_Mod_AlligatorJack_DI_Stollen_02))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_AlligatorJack_DI_Vorsicht_Info()
{
	AI_Output(self, hero, "Info_Mod_AlligatorJack_DI_Vorsicht_03_00"); //Hier unten scheint es sonst nichts mehr zu geben, wo wir hinkönnen.
	AI_Output(self, hero, "Info_Mod_AlligatorJack_DI_Vorsicht_03_01"); //Wir sollten uns aber das Zelt oben etwas genauer ansehen.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_AlligatorJack_DI_EXIT (C_INFO)
{
	npc		= Mod_1542_PIR_AlligatorJack_DI;
	nr		= 1;
	condition	= Info_Mod_AlligatorJack_DI_EXIT_Condition;
	information	= Info_Mod_AlligatorJack_DI_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_AlligatorJack_DI_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_AlligatorJack_DI_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};