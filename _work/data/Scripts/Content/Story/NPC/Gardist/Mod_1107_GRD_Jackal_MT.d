instance Mod_1107_GRD_Jackal_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Jackal";
	npctype		=	npctype_main;
	guild 		=	GIL_OUT;
	level 		= 	50;		// wegen XP!
	voice		= 0;
	id 			=	1107;
		
	//-------- abilities --------
	B_SetAttributesToChapter (self, 5);

	aivar[AIV_IGNORE_Murder]		= TRUE;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	   
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_L_Jackal, BodyTex_L, GRD_ARMOR_H);

    	Mdl_SetModelFatness(self,0);
    	
    	
    	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
	B_SetFightSkills	(self, 80);

	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);		
			
	//-------- inventory --------
	B_CreateAmbientInv	(self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1107;
};

FUNC VOID Rtn_start_1107 () //MarktplatzPatrouille
{
	TA_Stand_Guarding	(06,00,07,00,"OCR_CAMPFIRE_F_1");
	TA_Stand_Guarding	(07,00,08,00,"OCR_OUTSIDE_HUT_42");
	TA_Stand_Guarding	(08,00,09,00,"OCR_CAMPFIRE_F_1");
	TA_Stand_Guarding	(09,00,10,00,"OCR_NORTHGATE_RAMP_BELOW");
	
	TA_Stand_Guarding	(10,00,11,00,"OCR_CAMPFIRE_F_1");
	TA_Stand_Guarding	(11,00,12,00,"OCR_OUTSIDE_HUT_42");
	TA_Stand_Guarding	(12,00,13,00,"OCR_CAMPFIRE_F_1");
	TA_Stand_Guarding	(13,00,14,00,"OCR_NORTHGATE_RAMP_BELOW");
	
	TA_Stand_Guarding	(14,00,15,00,"OCR_CAMPFIRE_F_1");
	TA_Stand_Guarding	(15,00,16,00,"OCR_OUTSIDE_HUT_42");
	TA_Stand_Guarding	(16,00,17,00,"OCR_CAMPFIRE_F_1");
	TA_Stand_Guarding	(17,00,18,00,"OCR_NORTHGATE_RAMP_BELOW");
	
	TA_Stand_Guarding	(18,00,19,00,"OCR_CAMPFIRE_F_1");
	TA_Stand_Guarding	(19,00,20,00,"OCR_OUTSIDE_HUT_42");
	TA_Stand_Guarding	(20,00,21,00,"OCR_CAMPFIRE_F_1");
	TA_Stand_Guarding	(21,00,22,00,"OCR_NORTHGATE_RAMP_BELOW");
	
	TA_Stand_Guarding	(22,00,23,00,"OCR_CAMPFIRE_F_1");
	TA_Stand_Guarding	(23,00,00,00,"OCR_OUTSIDE_HUT_42");
	TA_Stand_Guarding	(00,00,01,00,"OCR_CAMPFIRE_F_1");
	TA_Stand_Guarding	(01,00,02,00,"OCR_NORTHGATE_RAMP_BELOW");
	
	TA_Stand_Guarding	(02,00,03,00,"OCR_CAMPFIRE_F_1");
	TA_Stand_Guarding	(03,00,04,00,"OCR_OUTSIDE_HUT_42");
	TA_Stand_Guarding	(04,00,05,00,"OCR_CAMPFIRE_F_1");
	TA_Stand_Guarding	(05,00,06,00,"OCR_NORTHGATE_RAMP_BELOW");
};

FUNC VOID Rtn_Fluchthilfe_1107 ()
{
	TA_Stand_Guarding (00,00,12,00,"OCC_MERCS_HALLWAY_FRONT");
	TA_Stand_Guarding (12,00,00,00,"OCC_MERCS_HALLWAY_FRONT");
};

FUNC VOID Rtn_Wache_1107 ()
{
	TA_Stand_Guarding (00,00,12,00,"OCC_CHAPEL_ENTRANCE");
	TA_Stand_Guarding (12,00,00,00,"OCC_CHAPEL_ENTRANCE");
};

FUNC VOID Rtn_Gefangennahme_1107 ()
{
	TA_Follow_Player (00,00,12,00,"OCC_BARONS_DANCE2");
	TA_Follow_Player (12,00,00,00,"OCC_BARONS_DANCE2");
};

FUNC VOID Rtn_FOLLOWTOBERGKASTELL_1107 ()
{
	TA_Follow_Player (00,00,12,00,"CASTLE_MOVEMENT_STRAIGHT");
	TA_Follow_Player (12,00,00,00,"CASTLE_MOVEMENT_STRAIGHT");
};

FUNC VOID Rtn_WaitAtKastell_1107 ()
{
	TA_Stand_WP (00,00,12,00,"CASTLE_MOVEMENT_STRAIGHT");
	TA_Stand_WP (12,00,00,00,"CASTLE_MOVEMENT_STRAIGHT");
};

FUNC VOID Rtn_Zuflucht_1107 ()
{
	TA_Stand_WP (00,00,12,00,"LOCATION_29_04");
	TA_Stand_WP (12,00,00,00,"LOCATION_29_04");
};

FUNC VOID Rtn_AtTurm_1107 ()
{
	TA_Guide_Player (00,00,12,00,"MT09");
	TA_Guide_Player (12,00,00,00,"MT09");
};

FUNC VOID Rtn_ToOldcamp_1107 ()
{
	TA_Follow_Player (00,00,12,00,"OC_ROUND_1");
	TA_Follow_Player (12,00,00,00,"OC_ROUND_1");
};

FUNC VOID Rtn_AtOldcamp_1107 ()
{
	TA_Stand_ArmsCrossed (00,00,12,00,"OC_ROUND_1");
	TA_Stand_ArmsCrossed (12,00,00,00,"OC_ROUND_1");
};

FUNC VOID Rtn_InOldcamp_1107 ()
{
	TA_RunToWP (00,00,12,00,"OCR_MAINGATE_INSIDE");
	TA_RunToWP (12,00,00,00,"OCR_MAINGATE_INSIDE");
};

FUNC VOID Rtn_Befreiung_1107 ()
{
	TA_RunToWP (00,00,12,00,"WP_MT_JACKAL_BEFREIUNG");
	TA_RunToWP (12,00,00,00,"WP_MT_JACKAL_BEFREIUNG");
};

FUNC VOID Rtn_Abhauen_1107 ()
{
	TA_FleeToWP (00,00,12,00,"GOBBO_MASTERCAVE5");
	TA_FleeToWP (12,00,00,00,"GOBBO_MASTERCAVE5");
};

FUNC VOID Rtn_ALIWACHEZUFLUCHT_1107 ()
{
	TA_Stand_Guarding (00,00,12,00,"GOBBO_MASTERCAVE5");
	TA_Stand_Guarding (12,00,00,00,"GOBBO_MASTERCAVE5");
};

FUNC VOID Rtn_InPsicamp_1107 ()
{
	TA_Stand_WP (00,00,12,00,"PSI_TEMPLE_STAIRS_1");
	TA_Stand_WP (12,00,00,00,"PSI_TEMPLE_STAIRS_1");
};