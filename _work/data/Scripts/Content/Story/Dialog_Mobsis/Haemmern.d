FUNC VOID Haemmern_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION	= MOBSI_Haemmern;
		Ai_ProcessInfos (her);
	};
};

INSTANCE PC_Haemmern_CoragonStuhl (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Haemmern_CoragonStuhl_Condition;
	information	= PC_Haemmern_CoragonStuhl_Info;
	permanent	= 1;
	important	= 0;
	description	= "Stuhl anfertigen (5 zurechtgesägte Bretter)";
};

FUNC INT PC_Haemmern_CoragonStuhl_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_Haemmern)
	&& (Mod_LehrlingBei == 2)
	&& (Npc_HasItems(hero, ItMi_Brett_Saege) >= 5)
	&& (Npc_HasItems(hero, ItWr_Zeichnung_Stuhl) == 1)
	{
		return 1;
	};
};

FUNC VOID PC_Haemmern_CoragonStuhl_Info()
{
	Print	("Stuhl hergestellt!");

	Npc_RemoveInvItems	(hero, ItMi_Brett_Saege, 5);

	CreateInvItems	(hero, ItMi_CoragonStuhl, 1);

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_Haemmern_MatteoFesttisch (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Haemmern_MatteoFesttisch_Condition;
	information	= PC_Haemmern_MatteoFesttisch_Info;
	permanent	= 1;
	important	= 0;
	description	= "Tisch anfertigen (6 zurechtgesägte Bretter)";
};

FUNC INT PC_Haemmern_MatteoFesttisch_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_Haemmern)
	&& (Npc_KnowsInfo(hero, Info_Mod_Thorben_LehrlingQuest3))
	&& (Npc_HasItems(hero, ItMi_Brett_Saege) >= 6)
	&& (Npc_HasItems(hero, ItWr_Zeichnung_Tisch) == 1)
	{
		return 1;
	};
};

FUNC VOID PC_Haemmern_MatteoFesttisch_Info()
{
	Print	("Tisch hergestellt!");

	Npc_RemoveInvItems	(hero, ItMi_Brett_Saege, 5);

	CreateInvItems	(hero, ItMi_MatteoFesttisch, 1);

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_Haemmern_Schmuckkasten (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Haemmern_Schmuckkasten_Condition;
	information	= PC_Haemmern_Schmuckkasten_Info;
	permanent	= 1;
	important	= 0;
	description	= "Schmuckkästchen anfertigen (Rohfassung des Schmuckkästchens)";
};

FUNC INT PC_Haemmern_Schmuckkasten_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_Haemmern)
	&& (Npc_KnowsInfo(hero, Info_Mod_Brahim_ThorbenLehrling4))
	&& (Npc_HasItems(hero, ItMi_Schmuckkasten_Roh) >= 1)
	&& (Npc_HasItems(hero, ItWr_Zeichnung_Schmuckkasten) == 1)
	{
		return 1;
	};
};

FUNC VOID PC_Haemmern_Schmuckkasten_Info()
{
	Print	("Schmuckkästchen hergestellt!");

	Npc_RemoveInvItems	(hero, ItMi_Schmuckkasten_Roh, 1);

	CreateInvItems	(hero, ItMi_Schmuckkasten, 1);

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_Haemmern_Bierkrug (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Haemmern_Bierkrug_Condition;
	information	= PC_Haemmern_Bierkrug_Info;
	permanent	= 1;
	important	= 0;
	description	= "Bierkrug anfertigen (Rohfassung des Schmuckkästchens)";
};

FUNC INT PC_Haemmern_Bierkrug_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_Haemmern)
	&& (Npc_KnowsInfo(hero, Info_Mod_Brahim_ThorbenLehrling4))
	&& (Npc_HasItems(hero, ItMi_Bierkrug_Roh) >= 1)
	&& (Npc_HasItems(hero, ItWr_Zeichnung_Bierkrug) == 1)
	{
		return 1;
	};
};

FUNC VOID PC_Haemmern_Bierkrug_Info()
{
	Print	("Bierkrug hergestellt!");

	Npc_RemoveInvItems	(hero, ItMi_Bierkrug_Roh, 1);

	CreateInvItems	(hero, ItMi_Bierkrug, 1);

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_Haemmern_Karte (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Haemmern_Karte_Condition;
	information	= PC_Haemmern_Karte_Info;
	permanent	= 1;
	important	= 0;
	description	= "Karte anfertigen (Rohfassung der Karte)";
};

FUNC INT PC_Haemmern_Karte_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_Haemmern)
	&& (Npc_KnowsInfo(hero, Info_Mod_Brahim_ThorbenLehrling4))
	&& (Npc_HasItems(hero, ItMi_Karte_Roh) >= 1)
	&& (Npc_HasItems(hero, ItWr_Zeichnung_Karte) == 1)
	{
		return 1;
	};
};

FUNC VOID PC_Haemmern_Karte_Info()
{
	Print	("Karte hergestellt!");

	Npc_RemoveInvItems	(hero, ItMi_Karte_Roh, 1);

	CreateInvItems	(hero, ItMi_Karte, 1);

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_Haemmern_EXIT (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Haemmern_EXIT_Condition;
	information	= PC_Haemmern_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT PC_Haemmern_EXIT_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_Haemmern)
	&& (Saegen == FALSE)
	{
		return 1;
	};
};

FUNC VOID PC_Haemmern_EXIT_Info()
{
	B_ENDPRODUCTIONDIALOG();
};