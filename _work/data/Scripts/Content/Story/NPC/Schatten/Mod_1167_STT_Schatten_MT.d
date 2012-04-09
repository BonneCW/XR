instance Mod_1167_STT_Schatten_MT (Npc_Default)
{
	//-------- primary data --------
	name 		=		NAME_Schatten;
	npctype 		=		NPCTYPE_mt_schatten;
	guild 		=		GIL_out;
	level 		=		5;
	
	
	voice 		=		10;
	id 			=		1167;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 3);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Thief", 57,  1, STT_ARMOR_M);
        
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente -------- 

	B_SetFightSkills	(self, 45);	
		
	//-------- inventory --------
	
	B_CreateAmbientInv	(self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1167;
};

FUNC VOID Rtn_start_1167 ()
{
	TA_Sleep		(22,30,06,30,"OCR_HUT_9");
	TA_Sit_Bench		(06,30,10,30,"OCR_OUTSIDE_HUT_9");
	TA_Sit_Campfire		(10,30,19,30,"OCR_OUTSIDE_HUT_11");
	TA_Stand_Drinking	(19,30,22,30,"OCR_ARENA_05");
};