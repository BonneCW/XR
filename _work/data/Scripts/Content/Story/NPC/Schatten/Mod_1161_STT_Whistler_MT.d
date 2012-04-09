instance Mod_1161_STT_Whistler_MT (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Whistler";
	npctype 		=		NPCTYPE_main;
	guild 		=		GIL_out;
	level 		=		5;
	
	
	voice 		=		11;
	id 			=		1161;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     57,headtex,teethtex,ruestung
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", FACE_N_Whistler, BodyTex_N, STT_ARMOR_M);
	
	Mdl_SetModelFatness(self,0);
    	
    	
	fight_tactic	=	FAI_HUMAN_STRONG; 

	//-------- Talente -------- 

	B_SetFightSkills	(self, 50);

	B_CreateAmbientInv	(self);	
		
	//-------- inventory --------
	
	EquipItem	(self, Whistlers_Schwert);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_309;

	// //MISSION[0] = Mis_1_OC_Whistler_StealAxe;
};

FUNC VOID Rtn_Start_1161 ()
{
	TA_Sleep		(23,30,08,00,"OCR_HUT_65");
	TA_Sit_Bench		(08,00,12,00,"OCR_OUTSIDE_HUT_65");
	TA_Stand_Eating		(12,00,14,00,"OCR_OUTSIDE_HUT_65_MOVEMENT");
	TA_Sit_Bench		(14,00,20,00,"OCR_OUTSIDE_HUT_65");
	TA_Sit_Campfire		(20,00,23,30,"OCR_MARKETPLACE_HANGAROUND");
};

FUNC VOID Rtn_Tot_1161 ()
{
	TA_Sleep	(20,00,08,00,"TOT");
	TA_Sleep	(08,00,20,00,"TOT");
};