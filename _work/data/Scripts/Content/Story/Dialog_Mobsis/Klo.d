FUNC VOID Klo_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		B_SetAivar(self, AIV_INVINCIBLE, TRUE);
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_Klo;
		Ai_ProcessInfos (her);
	};
}; 

INSTANCE PC_Klo_Trollfett (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Klo_Trollfett_Condition;
	information	= PC_Klo_Trollfett_Info;
	permanent	= 0;
	important	= 0;
	description	= "Trollfett ausschütten";
};

FUNC INT PC_Klo_Trollfett_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_Klo)
	&& (Npc_HasItems(hero, ItMi_Trollfett) >= 1)
	{
		return 1;
	};
};

FUNC VOID PC_Klo_Trollfett_Info()
{
	Npc_RemoveInvItems	(hero, ItMi_Trollfett, 1);

	Wld_PlayEffect("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE );

	B_LogEntry	(TOPIC_MOD_KHORATA_WASSERWERK, "Das Fett hat eine Wirkung erzielt. Mal sehen, was Wendel dazu sagt.");

	Wld_InsertNpc	(Mod_7483_OUT_Endres_REL, "REL_CITY_364");

	B_StartOtherRoutine	(Mod_7480_OUT_Wendel_REL, "ENDRES");
	B_StartOtherRoutine	(Mod_7481_OUT_Monteur_REL, "ENDRES");
	
	var int platformPtr; platformPtr = MEM_SearchVobByName ("ENDRESPLATFORM");
	var zCVob platform; platform = MEM_PtrToInst(platformPtr);
	platform.bitfield[0] = platform.bitfield[0] | zCVob_bitfield0_collDetectionDynamic;
};

INSTANCE PC_Klo_EXIT (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Klo_EXIT_Condition;
	information	= PC_Klo_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT PC_Klo_EXIT_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_Klo)
	{
		return 1;
	};
};

FUNC VOID PC_Klo_EXIT_Info()
{
	B_ENDPRODUCTIONDIALOG();
};