instance Mod_1108_GRD_Bullit_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Bullit";
	npctype		=	npctype_main;
	guild 		=	GIL_OUT;
	level 		=	10;
	voice 		=	6;
	id 			=	1108;
		
	//-------- abilities --------
	B_SetAttributesToChapter (self, 4);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	  
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_N_Bullit, BodyTex_N, GRD_ARMOR_M);

    	Mdl_SetModelFatness(self,0);
    	
    	//-------- Talente -------- 
	B_SetFightSkills	(self, 65);		
			
	//-------- inventory --------
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);

	B_CreateAmbientInv	(self);
	
	
	//------------- ai -------------
	daily_routine	=	Rtn_start_1108;
  	fight_tactic	=	FAI_HUMAN_STRONG;
};

FUNC VOID Rtn_start_1108 ()
{
	TA_Sit_Chair	(00,00,21,00,"OCC_MERCS_RIGHT_ROOM_BACK");
	TA_Sit_Chair	(21,00,24,00,"OCC_MERCS_RIGHT_ROOM_BACK");
};

FUNC VOID Rtn_Wache_1108 ()
{
	TA_Stand_Guarding	(08,00,20,00,"OW_PATH_187");
	TA_Stand_Guarding	(20,00,08,00,"OW_PATH_187");
};

FUNC VOID Rtn_Feuerregen_1108 ()
{
	TA_Stand_Guarding	(06,00,21,00,"LOCATION_11_08");
	TA_Stand_Guarding	(21,00,06,00,"LOCATION_11_08");	
};

FUNC VOID Rtn_Tot_1108 ()
{
	TA_Stand_Guarding	(06,00,21,00,"TOT");
	TA_Stand_Guarding	(21,00,06,00,"TOT");	
};