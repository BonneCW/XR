instance Mod_1165_STT_Schatten_MT (Npc_Default)
{
	//-------- primary data --------
	name 		=		NAME_Schatten;
	npctype 		=		NPCTYPE_mt_schatten;
	guild 		=		GIL_out;
	level 		=		5;
	
	
	voice		= 0;
	id 			=		1165;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 3);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Pony", 56,  1, STT_ARMOR_M);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente -------- 

	B_SetFightSkills	(self, 45);
		
	//-------- inventory --------
	B_CreateAmbientInv	(self);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1165;
};

FUNC VOID Rtn_start_1165 ()
{
	TA_Sleep		(23,00,08,00,"OCR_HUT_18");
	TA_Smalltalk		(08,00,19,00,"OCR_OUTSIDE_HUT_18");
	TA_Stand_Drinking	(19,00,23,00,"OCR_ARENA_09");
};