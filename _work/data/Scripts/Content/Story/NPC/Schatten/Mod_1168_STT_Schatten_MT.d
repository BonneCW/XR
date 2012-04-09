instance Mod_1168_STT_Schatten_MT (Npc_Default)
{
	//-------- primary data --------
	name 		=		NAME_Schatten;
	npctype 	=		NPCTYPE_mt_schatten;
	guild 		=		GIL_out;
	level 		=		7;
	
	voice	 	=		12;
	id 			=		1168;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Psionic", 57,  1, STT_ARMOR_M);
        
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente -------- 

	B_SetFightSkills	(self, 50);
		
	//-------- inventory --------
	B_CreateAmbientInv	(self);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1168;
};

FUNC VOID Rtn_start_1168 ()
{
	TA_Sleep		(23,02,06,45,"OCR_HUT_3");
	TA_Sit_Campfire		(06,45,10,00,"OCR_CAMPFIRE_A_MOVEMENT3");
	TA_Wash_FP		(10,00,10,30,"OCR_LAKE_1");
	TA_Sit_Campfire		(10,30,12,30,"OCR_CAMPFIRE_A_MOVEMENT2");
	TA_Smalltalk		(12,30,15,30,"OCR_CAMPFIRE_A_MOVEMENT3"); //mit Grim
	TA_Sit_Chair		(15,30,16,00,"OCR_HUT_3");
	TA_Smalltalk		(16,00,18,01,"OCR_CAMPFIRE_A_MOVEMENT3"); //mit Diego
	TA_Sit_Campfire		(18,01,23,02,"OCR_CAMPFIRE_A_MOVEMENT3");	
};