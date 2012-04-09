FUNC VOID HOCHOFEN_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		self.aivar[AIV_INVINCIBLE]=TRUE;
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_Hochofen;
		Ai_ProcessInfos (her);
	};
};

INSTANCE PC_Hochofen_ReinerErzrohling_Small (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Hochofen_ReinerErzrohling_Small_Condition;
	information	= PC_Hochofen_ReinerErzrohling_Small_Info;
	permanent	= 1;
	important	= 0;
	description	= "Kleinen reinen Erzrohling herstellen";
};

FUNC INT PC_Hochofen_ReinerErzrohling_Small_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Hochofen)
	&& (Waffe_ErzEisen == 2)
	&& (Npc_HasItems(hero, ItAt_DragonElixier) >= 2)
	&& (Npc_HasItems(hero, ItMi_Nugget) >= 60)
	{
		return 1;
	};
};

FUNC VOID PC_Hochofen_ReinerErzrohling_Small_Info()
{
	CreateInvItems	(hero, ItMi_ReinerErzrohling_Small, 1);
	
	Npc_RemoveInvItems	(hero, ItAt_DragonElixier, 2);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 60);

	Print	("Kleinen reinen Erzrohling erhalten!");
};

INSTANCE PC_Hochofen_ReinerErzrohling_Big (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Hochofen_ReinerErzrohling_Big_Condition;
	information	= PC_Hochofen_ReinerErzrohling_Big_Info;
	permanent	= 1;
	important	= 0;
	description	= "Groﬂen reinen Erzrohling herstellen";
};

FUNC INT PC_Hochofen_ReinerErzrohling_Big_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Hochofen)
	&& (Waffe_ErzEisen == 2)
	&& (Npc_HasItems(hero, ItAt_DragonElixier) >= 2)
	&& (Npc_HasItems(hero, ItMi_Nugget) >= 80)
	{
		return 1;
	};
};

FUNC VOID PC_Hochofen_ReinerErzrohling_Big_Info()
{
	CreateInvItems	(hero, ItMi_ReinerErzrohling_Big, 1);
	
	Npc_RemoveInvItems	(hero, ItAt_DragonElixier, 2);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 80);

	Print	("Groﬂen reinen Erzrohling erhalten!");
};

INSTANCE PC_Hochofen_EXIT (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Hochofen_EXIT_Condition;
	information	= PC_Hochofen_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT PC_Hochofen_EXIT_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Hochofen)
	{
		return 1;
	};
};

FUNC VOID PC_Hochofen_EXIT_Info()
{
	B_ENDPRODUCTIONDIALOG();
};