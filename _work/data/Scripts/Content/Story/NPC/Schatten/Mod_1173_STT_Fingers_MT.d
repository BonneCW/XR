instance Mod_1173_STT_Fingers_MT (Npc_Default)
{
	//-------- primary data --------
	name 			=		"Fingers";
	npctype			=		npctype_main;
	guild 			=		GIL_out;
	level 			=		7;
	
	
	voice 			=		5;
	id 				=		1173;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
        
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", FACE_N_Fingers, BodyTex_N, STT_ARMOR_M);

	Mdl_SetModelFatness(self,0);
	
	
	fight_tactic	=	FAI_HUMAN_STRONG; 

	//-------- Talente -------- 

	B_SetFightSkills	(self, 50);
		
	//-------- inventory --------
	B_CreateAmbientInv	(self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1173;
};

FUNC VOID Rtn_start_1173 ()
{
	TA_Sleep			(23,00,07,00,"OCR_HUT_20");             
	TA_Stand_ArmsCrossed		(07,00,23,00,"OCR_OUTSIDE_HUT_20");
};

FUNC VOID Rtn_Sumpflager_1173 ()
{
	TA_Stand_Drinking		(23,00,07,00,"LOCATION_11_01");             
	TA_Stand_Drinking		(07,00,23,00,"LOCATION_11_01");
};