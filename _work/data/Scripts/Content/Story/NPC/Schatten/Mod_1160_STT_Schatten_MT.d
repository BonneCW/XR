instance Mod_1160_STT_Schatten_MT (Npc_Default)
{
	//-------- primary data --------
	name 		=		NAME_Schatten;
	npctype 		=		NPCTYPE_mt_schatten;
	guild 		=		GIL_out;
	level 		=		7;
	
	
	voice 		=		12;
	id 			=		1160;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 3);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 2,"Hum_Head_Bald", 12,  2, STT_ARMOR_M);
        
        Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente -------- 

	B_SetFightSkills	(self, 45);	
		
	//-------- inventory --------
	B_CreateAmbientInv	(self);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1160;
};

FUNC VOID Rtn_Start_1160 () //Arenaplatz
{
	TA_Sleep		(23,00,08,05,"OCR_HUT_27");
	TA_Smalltalk		(08,05,17,00,"OCR_OUTSIDE_HUT_27_MOVEMENT");	// mit ???
	TA_Sit_Bench		(17,00,19,05,"OCR_OUTSIDE_ARENA_HANGAROUND");
	TA_Stand_Drinking	(19,05,23,00,"OCR_ARENA_03");
};