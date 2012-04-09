instance Mod_1870_EBR_Alissandro_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Alissandro";
	npctype 	= 	npctype_main;
   	guild 		=	GIL_OUT;      
	level 		=	70;
	voice 		=	2;
	id 			=	1870;
	flags = 2;

	//-------- abilities --------
	B_SetAttributesToChapter (self, 6);

	//-------- visuals --------
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",DEFAULT,DEFAULT,"Hum_Head_Bald", 177,  DEFAULT, EBR_ARMOR_H2);

	Mdl_SetModelFatness(self,0);
	
	

	//-------- Talente --------  																	
	B_SetFightSkills (self, 65); 
			
	//-------- inventory --------                                    
	EquipItem(self,ItRw_Crossbow_M_02);                           
	EquipItem(self,ItMw_Schlachtklinge);
	

	//------------- ai -------------
	daily_routine	=	Rtn_start_1870;
	fight_tactic	=	FAI_HUMAN_MASTER;
	senses			=	SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
};

FUNC VOID Rtn_start_1870 ()
{
	TA_Sleep			(00,30,07,40,"OCC_BARONS_UPPER_RIGHT_ROOM_BED3");
	TA_Smalltalk		(07,40,21,05,"OCC_BARONS_GREATHALL_CENTER_FRONT");
	TA_Stand_Eating		(21,05,00,30,"OCC_BARONS_GREATHALL_CENTER_MOVEMENT2");
};

FUNC VOID Rtn_Unbekannter_1870 ()
{
	TA_RunToWP		(07,35,21,10,"OCC_BARONS_HALLWAY_FRONT");
	TA_RunToWP		(21,10,07,35,"OCC_BARONS_HALLWAY_FRONT");
};

FUNC VOID Rtn_Falle_1870 ()
{
	TA_Drained			(02,10,07,40,"WP_MT_FALLE_02");
	TA_Drained		(07,40,21,05,"WP_MT_FALLE_02");
	TA_Drained		(21,05,02,10,"WP_MT_FALLE_02");
};

FUNC VOID Rtn_ThorusTot_1870 ()
{
	TA_Stand_WP			(02,10,07,40,"WP_MT_FALLE_02");
	TA_Stand_WP		(07,40,21,05,"WP_MT_FALLE_02");
	TA_Stand_WP		(21,05,02,10,"WP_MT_FALLE_02");
};

FUNC VOID Rtn_GuideToKastellPartOne_1870 ()
{
	TA_Guide_Player		(07,35,21,10,"OC_ROUND_18");
	TA_Guide_Player		(21,10,07,35,"OC_ROUND_18");
};

FUNC VOID Rtn_GuideToKastellPartTwo_1870 ()
{
	TA_Guide_Player		(07,35,21,10,"OW_PATH_001");
	TA_Guide_Player		(21,10,07,35,"OW_PATH_001");
};

FUNC VOID Rtn_GuideToKastell_1870 ()
{
	TA_Guide_Player		(07,35,21,10,"CASTLE_01");
	TA_Guide_Player		(21,10,07,35,"CASTLE_01");
};

FUNC VOID Rtn_Kastell_1870 ()
{
	TA_Practice_Sword		(07,35,21,10,"CASTLE_MOVEMENT_STRAIGHT2");
	TA_Practice_Sword		(21,10,07,35,"CASTLE_MOVEMENT_STRAIGHT2");
};

FUNC VOID Rtn_Gefangen_1870 ()
{
	TA_Stand_WP			(02,10,07,40,"WP_MT_ALISSANDRO_GALGEN");
	TA_Stand_WP		(07,40,21,05,"WP_MT_ALISSANDRO_GALGEN");
	TA_Stand_WP		(21,05,02,10,"WP_MT_ALISSANDRO_GALGEN");
};

FUNC VOID Rtn_Flucht_1870 ()
{
	TA_FleeToWP		(07,35,21,10,"GOBBO_MASTERCAVE");
	TA_FleeToWP		(21,10,07,35,"GOBBO_MASTERCAVE");
};

FUNC VOID Rtn_AtZuflucht_1870 ()
{
	TA_Sit_Chair		(07,35,21,10,"GOBBO_MASTERCAVE9");
	TA_Sit_Chair		(21,10,07,35,"GOBBO_MASTERCAVE9");
};

FUNC VOID Rtn_InPsicamp_1870 ()
{
	TA_Stand_WP			(02,10,07,40,"PSI_TEMPLE_IN_05");
	TA_Stand_WP		(07,40,21,05,"PSI_TEMPLE_IN_05");
	TA_Stand_WP		(21,05,02,10,"PSI_TEMPLE_IN_05");
};

FUNC VOID Rtn_GotoTempelvorplatz_1870 ()
{
	TA_Guide_Player		(07,35,21,10,"PSI_TEMPLE_NOVIZE_PR2");
	TA_Guide_Player		(21,10,07,35,"PSI_TEMPLE_NOVIZE_PR2");
};

FUNC VOID Rtn_FollowToOc_1870 ()
{
    TA_Follow_Player	(06,00,18,00,"OCR_NORTHGATE_ADVANCE");	
    TA_Follow_Player	(18,00,06,00,"OCR_NORTHGATE_ADVANCE");	
};

FUNC VOID Rtn_FollowToBartholo_1870 ()
{
    TA_Follow_Player	(06,00,18,00,"OCC_BARONS_DANCE");	
    TA_Follow_Player	(18,00,06,00,"OCC_BARONS_DANCE");	
};

FUNC VOID Rtn_GotoMakanius_1870 ()
{
	TA_Guide_Player		(07,35,21,10,"OCC_BARONS_ENTRANCE_UPSTAIRS");
	TA_Guide_Player		(21,10,07,35,"OCC_BARONS_ENTRANCE_UPSTAIRS");
};

FUNC VOID Rtn_FollowToKerker_1870 ()
{
    TA_Follow_Player	(06,00,18,00,"WP_MT_OC_BARTHOLO_KERKER");	
    TA_Follow_Player	(18,00,06,00,"WP_MT_OC_BARTHOLO_KERKER");	
};

FUNC VOID Rtn_Boss_1870 ()
{
	TA_Sit_Throne		(07,35,21,10,"OCC_BARONS_GREATHALL_THRONE");
	TA_Sit_Throne		(21,10,07,35,"OCC_BARONS_GREATHALL_THRONE");
};

FUNC VOID Rtn_ToCavalorn_1870 ()
{
	TA_Guide_Player		(07,35,21,10,"OW_SAWHUT_GREENGOBBO_SPAWN");
	TA_Guide_Player		(21,10,07,35,"OW_SAWHUT_GREENGOBBO_SPAWN");
};

FUNC VOID Rtn_AtCavalorn_1870 ()
{
	TA_Sit_Campfire		(07,35,21,10,"OW_CAVALORN_01");
	TA_Sit_Campfire		(21,10,07,35,"OW_CAVALORN_01");
};

FUNC VOID Rtn_OricDa_1870 ()
{
	TA_Smalltalk		(07,35,21,10,"OW_SAWHUT_GREENGOBBO_SPAWN");
	TA_Smalltalk		(21,10,07,35,"OW_SAWHUT_GREENGOBBO_SPAWN");
};

FUNC VOID Rtn_ToVM_1870 ()
{	
	TA_Follow_Player		(08,00,21,00,"OW_PATH_1_16");
	TA_Follow_Player		(21,00,08,00,"OW_PATH_1_16");
};

FUNC VOID Rtn_ToAustausch_1870 ()
{	
	TA_Follow_Player		(08,00,21,00,"WP_INTRO_FALL3");
	TA_Follow_Player		(21,00,08,00,"WP_INTRO_FALL3");
};

FUNC VOID Rtn_AtAM_1870 ()
{	
	TA_Stand_Guarding		(08,00,21,00,"OW_OM_ENTRANCE03");
	TA_Stand_Guarding		(21,00,08,00,"OW_OM_ENTRANCE03");
};

FUNC VOID Rtn_Outdoor_1870()
{
	TA_RunToWP		(08,00,20,00,"OC_ROUND_20");
	TA_RunToWP		(20,00,08,00,"OC_ROUND_20");
};