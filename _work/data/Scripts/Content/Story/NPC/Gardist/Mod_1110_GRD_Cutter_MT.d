instance Mod_1110_GRD_Cutter_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	"Cutter";
	npctype 	= 	npctype_main;
	guild 		=	GIL_OUT;
	level 		=	20;
	voice 		=	6;
	id 			=	1110;
	flags = 2;
		
	//-------- abilities --------
	B_SetAttributesToChapter (self, 5);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	  
    	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_Weak_Cutter, BodyTex_P, GRD_ARMOR_H);

    	Mdl_SetModelFatness(self,1);
	B_SetAttributesToChapter (self, 5);
    	
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
	B_SetFightSkills	(self, 75);

	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);		
			
	//-------- inventory --------
	B_CreateAmbientInv	(self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1110;
};

FUNC VOID Rtn_start_1110 ()
{
	TA_Sleep		(23,35,08,35,"OCC_MERCS_UPPER_RIGHT_ROOM_BED6");
	TA_Stand_Guarding	(08,35,23,35,"OCC_CENTER_4");	
};

FUNC VOID Rtn_Dieb_1110 ()
{
	TA_Sleep		(23,35,01,00,"OCC_MERCS_UPPER_RIGHT_ROOM_BED6");
	TA_Stand_Guarding	(01,00,02,00,"OCC_BARONS_HALLWAY_FRONT");
	TA_Stand_ArmsCrossed	(02,00,03,00,"OCC_BARONS_UPSTAIRS_PROMENADE_RIGHT_DOOR");
	TA_Sleep		(03,00,08,35,"OCC_MERCS_UPPER_RIGHT_ROOM_BED6");
	TA_Smalltalk		(08,35,23,35,"OCC_MERCS_ENTRANCE");	
};

FUNC VOID Rtn_Flucht_1110 ()
{
	TA_FleeToWP		(23,35,08,35,"TOT");
	TA_FleeToWP		(08,35,23,35,"TOT");	
};

FUNC VOID Rtn_knast_1110 ()
{
	TA_Sit_Campfire		(23,35,08,35,"OCC_CELLAR_BACK_LEFT_CELL");
	TA_Sit_Campfire		(08,35,23,35,"OCC_CELLAR_BACK_LEFT_CELL");	
};