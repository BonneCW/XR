instance Mod_1438_BUD_Buddler_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_mt_buddler;
	guild =							GIL_out;      
	level =							2;
	
	
	voice =							1;
	id =							1438;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 1);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_FatBald", 0,  1, VLK_ARMOR_L);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents  --------                                    
	B_SetFightSkills	(self, 10);
	//-------- inventory --------                                    
	B_CreateAmbientInv	(self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1438;
};

FUNC VOID Rtn_start_1438 ()
{
	TA_Sleep 		(22,30,08,00,"OCR_HUT_37");
	TA_Sit_Campfire		(08,00,12,00,"OCR_TO_LADDER_TOP_01");
	TA_Rake_FP 		(12,00,20,00,"OCC_CENTER_4_PATH2");
	TA_Sit_Campfire 	(20,00,22,30,"OCR_TO_LADDER_TOP_01");
};


