instance Mod_1435_BUD_Buddler_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_mt_buddler;
	guild =							GIL_out;      
	level =							2;
	
	
	voice =							2;
	id =							1435;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 1);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,2,"Hum_Head_FatBald", 0,  2, VLK_ARMOR_L);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents  --------                                    
	B_SetFightSkills	(self, 15);
	//-------- inventory --------                                    
	B_CreateAmbientInv	(self);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1435;
};

FUNC VOID Rtn_start_1435 ()
{
	TA_Sleep		(22,00,07,00,"OCR_HUT_7");
	TA_Smalltalk		(07,00,11,00,"OCR_OUTSIDE_HUT_7");
	TA_Roast_Scavenger	(11,00,20,00,"OCR_COOK_AT_HUT_10");
	TA_Smalltalk		(20,00,22,00,"OCR_OUTSIDE_HUT_7");
};