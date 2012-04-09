instance Mod_1162_STT_Schatten_MT (Npc_Default)
{
	//-------- primary data --------
	name 		=		NAME_Schatten;
	npctype 		=		NPCTYPE_mt_schatten;
	guild 		=		GIL_out;
	level 		=		5;
	
	voice 		=		12;
	id 			=		1162;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 3);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 3,"Hum_Head_Psionic", 10,  3, STT_ARMOR_M);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente -------- 

	B_SetFightSkills	(self, 40);	
		
	//-------- inventory --------
	B_CreateAmbientInv	(self);
	
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1162;
};

FUNC VOID Rtn_start_1162 ()
{
	TA_Sleep		(22,00,07,00,"OCR_HUT_8");
	TA_Smalltalk		(07,00,11,00,"OCR_OUTSIDE_HUT_7");	// mit ???
	TA_Cook_Cauldron	(11,00,20,05,"OCR_COOK_AT_HUT_10");
	TA_Smalltalk		(20,05,22,00,"OCR_OUTSIDE_HUT_7");	// mit ???
};