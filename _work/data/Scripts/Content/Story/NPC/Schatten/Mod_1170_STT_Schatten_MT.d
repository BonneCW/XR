instance Mod_1170_STT_Schatten_MT (Npc_Default)
{
	//-------- primary data --------
	name 		=		Name_Schatten;
	npctype 		=		NPCTYPE_mt_schatten;
	guild 		=		GIL_ouT;
	level 		=		7;
	
	
	voice		= 0;
	id 			=		1170;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 3);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 5, 0,"Hum_Head_FatBald", 2,  0, STT_ARMOR_M);
        
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente -------- 

	B_SetFightSkills	(self, 40);
		
	//-------- inventory --------
	B_CreateAmbientInv	(self);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_PreStart_1170;
};


FUNC VOID Rtn_PreStart_1170 () //Südtor Unten
{
	TA_Sit_Chair		(08,00,12,00,"OCR_HUT_Z5_SIT");
	TA_Stand_Eating		(12,00,14,00,"OCR_OUTSIDE_HUT_Z5");
	TA_Sit_Chair		(14,00,19,00,"OCR_HUT_Z5_SIT");
	TA_Stand_Drinking	(19,00,24,00,"OCR_ARENA_07");
	TA_Sleep		(24,00,08,00,"OCR_HUT_44");
};