instance Mod_1439_BUD_Buddler_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_mt_buddler;
	guild =							GIL_out;      
	level =							2;
	
	
	voice =							2;
	id =							1439;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 1);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Thief", 73,  1, VLK_ARMOR_M);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talents --------                                    
	B_SetFightSkills	(self, 10);
	//-------- inventory --------                                    
	B_CreateAmbientInv	(self);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1439;
};

FUNC VOID Rtn_start_1439 ()
{
	TA_Sleep 		(23,00,06,00,"OCR_HUT_56");
	TA_Rake_FP		(06,00,14,00,"OCC_CENTER_4_PATH2");
	TA_Sit_Bench		(14,00,18,00,"OCR_OUTSIDE_HUT_56");
	TA_Sit_Campfire		(18,00,23,00,"OCR_MARKETPLACE_HANGAROUND");
};



