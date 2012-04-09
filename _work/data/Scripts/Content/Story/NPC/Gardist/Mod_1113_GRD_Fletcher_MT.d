instance Mod_1113_GRD_Fletcher_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Fletcher";
	npctype		=	npctype_main;
	guild 		=	GIL_OUT;
	level 		=	15;
	voice 		=	6;
	id 			=	1113;
		
	//-------- abilities --------
	B_SetAttributesToChapter (self, 4);
			
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	 
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_P_Normal_Fletcher, BodyTex_P, GRD_ARMOR_H);	

    	Mdl_SetModelFatness(self,0);
    	
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
	B_SetFightSkills	(self, 65);		
			
	//-------- inventory --------
	B_CreateAmbientInv	(self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_Start_1113;
};

FUNC VOID Rtn_Start_1113 ()
{
	TA_Stand_Guarding	(06,00,07,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Stand_Guarding	(07,00,08,00,"OCR_LADDER_TOP_01");
	TA_Stand_Guarding	(08,00,09,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Stand_Guarding	(09,00,10,00,"OCR_BEHIND_HUT_17");
	
	TA_Stand_Guarding	(10,00,11,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Stand_Guarding	(11,00,12,00,"OCR_LADDER_TOP_01");
	TA_Stand_Guarding	(12,00,13,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Stand_Guarding	(13,00,14,00,"OCR_BEHIND_HUT_17");
	
	TA_Stand_Guarding	(14,00,15,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Stand_Guarding	(15,00,16,00,"OCR_LADDER_TOP_01");
	TA_Stand_Guarding	(16,00,17,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Stand_Guarding	(17,00,18,00,"OCR_BEHIND_HUT_17");
	
	TA_Stand_Guarding	(18,00,19,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Stand_Guarding	(19,00,20,00,"OCR_LADDER_TOP_01");
	TA_Stand_Guarding	(20,00,21,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Stand_Guarding	(21,00,22,00,"OCR_BEHIND_HUT_17");
	
	TA_Stand_Guarding	(22,00,23,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Stand_Guarding	(23,00,00,00,"OCR_LADDER_TOP_01");
	TA_Stand_Guarding	(00,00,01,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Stand_Guarding	(01,00,02,00,"OCR_BEHIND_HUT_17");
	
	TA_Stand_Guarding	(02,00,03,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Stand_Guarding	(03,00,04,00,"OCR_LADDER_TOP_01");
	TA_Stand_Guarding	(04,00,05,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Stand_Guarding	(05,00,06,00,"OCR_BEHIND_HUT_17");
};

FUNC VOID Rtn_KillMission_1113()
{
	TA_Stand_Guarding	(07,00,22,00,"OCC_GATE_OUTSIDE");
	TA_Smoke_Joint	(22,00,22,15,"OCC_BARONS_ENTRANCE_DOWNSTAIRS");
	TA_Stand_ArmsCrossed	(22,15,07,00,"OCC_BARONS_GREATHALL_RIGHT_FRONT");
};