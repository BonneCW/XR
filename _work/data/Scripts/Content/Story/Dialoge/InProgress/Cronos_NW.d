INSTANCE Info_Mod_Cronos_Hi (C_INFO)
{
	npc		= Mod_758_KDW_Cronos_NW;
	nr		= 1;
	condition	= Info_Mod_Cronos_Hi_Condition;
	information	= Info_Mod_Cronos_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Cronos_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Cronos_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Cronos_Hi_03_00"); //You again? I didn't think I'd see you again.
	AI_Output(self, hero, "Info_Mod_Cronos_Hi_03_01"); //If you need anything, come to me. I can sell you a couple of spell rolls and potions.
	
	Log_CreateTopic	(TOPIC_MOD_HÄNDLER_WASSERMAGIER, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HÄNDLER_WASSERMAGIER, "Cronos sells magic accessories.");
};

INSTANCE Info_Mod_Cronos_Angriff_01 (C_INFO)
{
	npc		= Mod_758_KDW_Cronos_NW;
	nr		= 1;
	condition	= Info_Mod_Cronos_Angriff_01_Condition;
	information	= Info_Mod_Cronos_Angriff_01_Info;
	permanent	= 0;
	important	= 0;
	description	= "I think we can now launch the attack and clean the plateau.";
};

FUNC INT Info_Mod_Cronos_Angriff_01_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_25))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_26))
	&& (Mod_WM_CronosAttack < 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cronos_Angriff_01_Info()
{
	AI_Output(hero, self, "Info_Mod_Cronos_Angriff_01_15_00"); //I think we can now launch the attack and clean the plateau.
	AI_Output(self, hero, "Info_Mod_Cronos_Angriff_01_03_01"); //Well then... Adanos stand by us.

	if (Npc_IsDead(Mod_1538_WKR_Wasserkrieger_NW))
	{
		Mod_WM_Truppe_01 = 1;
	};

	if (Npc_IsDead(Mod_1530_WKR_Everaldo_NW))
	{
		Mod_WM_Truppe_02 = 1;
	};

	if (Npc_IsDead(Mod_1539_WKR_Wasserkrieger_NW))
	{
		Mod_WM_Truppe_03 = 1;
	};

	if (Npc_IsDead(Mod_1533_WKR_Salvador_NW))
	{
		Mod_WM_Truppe_04 = 1;
	};

	if (Npc_IsDead(Mod_1537_WKR_Vanas_NW))
	{
		Mod_WM_Truppe_05 = 1;
	};

	if (Npc_IsDead(Mod_1536_WKR_Roka_NW))
	{
		Mod_WM_Truppe_06 = 1;
	};

	if (Npc_IsDead(Mod_1535_WKR_Wasserkrieger_NW))
	{
		Mod_WM_Truppe_07 = 1;
	};

	if (Npc_IsDead(Mod_1534_WKR_Wasserkrieger_NW))
	{
		Mod_WM_Truppe_08 = 1;
	};

	if (Npc_IsDead(Mod_1532_HTR_Ethan_NW))
	{
		Mod_WM_Truppe_09 = 1;
	};

	Mod_WM_TruppenLeft = 10 - (Mod_WM_Truppe_01 + Mod_WM_Truppe_02 + Mod_WM_Truppe_03 + Mod_WM_Truppe_04 + Mod_WM_Truppe_05 + Mod_WM_Truppe_06 + Mod_WM_Truppe_07 + Mod_WM_Truppe_08 + Mod_WM_Truppe_09 + Mod_WM_Truppe_10);
	
	AI_StopProcessInfos	(self);	

	Mod_1538_WKR_Wasserkrieger_NW.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_1530_WKR_Everaldo_NW.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_1539_WKR_Wasserkrieger_NW.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_1533_WKR_Salvador_NW.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_1537_WKR_Vanas_NW.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_1536_WKR_Roka_NW.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_1535_WKR_Wasserkrieger_NW.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_1534_WKR_Wasserkrieger_NW.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_1532_HTR_Ethan_NW.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_758_KDW_Cronos_NW.aivar[AIV_PARTYMEMBER] = TRUE;

	if (Npc_KnowsInfo(hero, Info_Mod_Diego_PlateauAngriff))
	{
		Mod_538_RDW_Diego_NW.aivar[AIV_PARTYMEMBER] = TRUE;
	};

	Mod_588_WNOV_Joe_NW.aivar[AIV_PARTYMEMBER] = TRUE;
};

INSTANCE Info_Mod_Cronos_Angriff_02 (C_INFO)
{
	npc		= Mod_758_KDW_Cronos_NW;
	nr		= 1;
	condition	= Info_Mod_Cronos_Angriff_02_Condition;
	information	= Info_Mod_Cronos_Angriff_02_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Cronos_Angriff_02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cronos_Angriff_01))
	&& (Mod_WM_CronosAttack == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cronos_Angriff_02_Info()
{
	AI_Output(self, hero, "Info_Mod_Cronos_Angriff_02_03_00"); //With Adanos! We actually did it. Let's go back now.

	AI_StopProcessInfos	(self);	

	B_StartOtherRoutine	(self, "TOT");

	B_GivePlayerXP	(300);

	if (Mod_WM_BlutkultTot == FALSE)
	{
		B_KillNpc	(Mod_7203_BK_Straschiduo_NW);
		B_KillNpc	(Mod_7244_BlutkultKrieger_NW);
		B_KillNpc	(Mod_7525_BlutkultKrieger_NW);
		B_KillNpc	(Mod_7526_BlutkultMagier_NW);

		Mod_WM_BlutkultAttack = 1;
	};
};

INSTANCE Info_Mod_Cronos_Trade (C_INFO)
{
	npc		= Mod_758_KDW_Cronos_NW;
	nr		= 1;
	condition	= Info_Mod_Cronos_Trade_Condition;
	information	= Info_Mod_Cronos_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Cronos_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cronos_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cronos_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Cronos_EXIT (C_INFO)
{
	npc		= Mod_758_KDW_Cronos_NW;
	nr		= 1;
	condition	= Info_Mod_Cronos_EXIT_Condition;
	information	= Info_Mod_Cronos_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Cronos_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Cronos_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
