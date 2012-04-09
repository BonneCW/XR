FUNC VOID Buchschreiben_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		self.aivar[AIV_INVINCIBLE]=TRUE;
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_Buchschreiben;
		Ai_ProcessInfos (her);
	};
}; 

INSTANCE PC_Buchschreiben_EXIT (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Buchschreiben_EXIT_Condition;
	information	= PC_Buchschreiben_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT PC_Buchschreiben_EXIT_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Buchschreiben)
	{
		return 1;
	};
};

FUNC VOID PC_Buchschreiben_EXIT_Info()
{
	B_ENDPRODUCTIONDIALOG();
};