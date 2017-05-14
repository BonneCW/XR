instance Mod_1163_STT_Schatten_MT (Npc_Default)
{
	//-------- primary data --------
	name 		=		NAME_Schatten;
	npctype 		=		NPCTYPE_mt_schatten;
	guild 		=		GIL_out;
	level 		=		5;
	
	
	voice		= 0;
	id 			=		1163;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 3);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Psionic", 58,  1, STT_ARMOR_M);
        
        Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
        
    	//-------- Talente -------- 

	B_SetFightSkills	(self, 40);	
		
	//-------- inventory --------

	B_CreateAmbientInv	(self);
	
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1163;
};

FUNC VOID Rtn_start_1163 ()
{
	TA_Sleep		(23,00,07,30,"OCR_HUT_36");
	TA_Sit_Bench		(07,30,11,00,"OCR_OUTSIDE_HUT_36");
	TA_Roast_Scavenger	(11,00,18,00,"OCR_MARKETPLACE_HANGAROUND");
	TA_Stand_Drinking	(18,00,23,00,"OCR_ARENA_06");
};