FUNC VOID FokusSchrein_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		B_SetAivar(self, AIV_INVINCIBLE, TRUE);
		PLAYER_MOBSI_PRODUCTION	= MOBSI_FokusSchrein;
		Ai_ProcessInfos (her);
	};
};

INSTANCE PC_FokusSchrein_Beliar (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_FokusSchrein_Beliar_Condition;
	information	= PC_FokusSchrein_Beliar_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich bete zu Beliar";
};

FUNC INT PC_FokusSchrein_Beliar_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	== MOBSI_FokusSchrein)
	&& (Npc_RefuseTalk(self) == FALSE)
	&& (!Npc_KnowsInfo(hero, PC_FokusSchrein_Innos))
	{
		return 1;
	};
};

FUNC VOID PC_FokusSchrein_Beliar_Info()
{
	Npc_SetRefuseTalk	(self, 120);

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_FokusSchrein_Innos (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_FokusSchrein_Innos_Condition;
	information	= PC_FokusSchrein_Innos_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich bete zu Innos";
};

FUNC INT PC_FokusSchrein_Innos_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	== MOBSI_FokusSchrein)
	&& (Npc_RefuseTalk(self) == FALSE)
	{
		return 1;
	};
};

FUNC VOID PC_FokusSchrein_Innos_Info()
{
	Mod_PAT_Focus_03 = 1;

	B_LogEntry	(TOPIC_MOD_FM_FOKI, "Man sollte als Feuermagier von seinem Glauben überzeugt sein. Oder wenigstens so tun ...");

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_FokusSchrein_EXIT (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_FokusSchrein_EXIT_Condition;
	information	= PC_FokusSchrein_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT PC_FokusSchrein_EXIT_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_FokusSchrein)
	{
		return 1;
	};
};

FUNC VOID PC_FokusSchrein_EXIT_Info()
{
	B_ENDPRODUCTIONDIALOG();
};