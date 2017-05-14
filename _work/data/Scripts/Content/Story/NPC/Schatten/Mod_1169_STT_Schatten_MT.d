instance Mod_1169_STT_Schatten_MT (Npc_Default)
{
	//-------- primary data --------
	name 		=		NAME_Schatten;
	npctype 		=		NPCTYPE_mt_schatten;
	guild 		=		GIL_out;
	level 		=		5;
	
	
	voice		= 0;
	id 			=		1169;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 3);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_Bald", 10,  0, STT_ARMOR_M);
        
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente -------- 

	B_SetFightSkills	(self, 40);
		
	//-------- inventory --------
	B_CreateAmbientInv	(self);
	
	
	

	//------------- Daily Routine -------------
	daily_routine = Rtn_start_1169;
};

FUNC VOID Rtn_start_1169 () //Arenaplatz
{
	TA_Sleep		(23,05,07,00,"OCR_HUT_22");
	TA_Sit_Bench		(07,00,11,00,"OCR_OUTSIDE_ARENA_HANGAROUND");
	TA_Roast_Scavenger	(11,00,17,30,"OCR_OUTSIDE_ARENA_01");
	TA_Sit_Bench		(17,30,19,00,"OCR_OUTSIDE_ARENA_HANGAROUND");
	TA_Stand_Drinking	(19,00,23,05,"OCR_ARENA_09");
};