FUNC VOID SOCKELWS_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	&& (FokusBlockade == FALSE)
	{	
		self.aivar[AIV_INVINCIBLE]=TRUE;
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_SOCKELWS;
		Ai_ProcessInfos (her);
	};
};

INSTANCE PC_SOCKELWS_Samen (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_SOCKELWS_Samen_Condition;
	information	= PC_SOCKELWS_Samen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Samen säen";
};

FUNC INT PC_SOCKELWS_Samen_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_SOCKELWS)
	&& (Npc_HasItems(hero, ItMi_MagicSamen) == 1)
	{
		return 1;
	};
};

FUNC VOID PC_SOCKELWS_Samen_Info()
{
	Npc_RemoveInvItems	(hero, ItMi_MagicSamen, 1);

	B_LogEntry	(TOPIC_MOD_TURENDIL_GOLEM, "Der Samen ist gesät, jetzt müsste ich den Aufladestein einsetzen können ...");
};

INSTANCE PC_SOCKELWS_Einsetzen (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_SOCKELWS_Einsetzen_Condition;
	information	= PC_SOCKELWS_Einsetzen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Aufladestein einsetzen";
};

FUNC INT PC_SOCKELWS_Einsetzen_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_SOCKELWS)
	&& (Npc_HasItems(hero, ItMi_TugettsoStein) == 1)
	&& (Npc_KnowsInfo(hero, PC_SOCKELWS_Samen))
	{
		return 1;
	};
};

FUNC VOID PC_SOCKELWS_Einsetzen_Info()
{
	Npc_RemoveInvItems	(hero, ItMi_TugettsoStein, 1);

	Wld_SendTrigger	("LEVELCHANGE_TO_TUGETTSO");
	Wld_SendTrigger	("PLATTFORM_WS_PFX");

	Mod_VMG_WSTrador = 1;

	B_LogEntry	(TOPIC_MOD_TURENDIL_GOLEM, "Das Portal ist aktiv. Nichts wie weg hier.");
};

INSTANCE PC_SOCKELWS_EXIT (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_SOCKELWS_EXIT_Condition;
	information	= PC_SOCKELWS_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT PC_SOCKELWS_EXIT_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_SOCKELWS)
	{
		return 1;
	};
};

FUNC VOID PC_SOCKELWS_EXIT_Info()
{
	B_ENDPRODUCTIONDIALOG();
};