instance Mod_1428_BUD_Kyle_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Kyle";
	npctype =						npctype_main;
	guild =							GIL_out;      
	level =							3;
	
	
	voice		= 0;
	id =							1428;


	//-------- abilities --------
	
	B_SetAttributesToChapter	(self, 1);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Bald", 72,  1, VLK_ARMOR_L);

	Mdl_SetModelFatness (self, 0);
    	
    	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talents  --------                                    

	B_SetFightSkills	(self, 15);
	
	//-------- inventory --------                                    
	B_CreateAmbientInv	(self);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1428;
};

FUNC VOID Rtn_start_1428 ()
{
	TA_Sleep		(22,00,06,00,"OCR_HUT_68");
	TA_Pick_FP		(06,00,14,00,"OCC_CENTER_4_PATH2");
	TA_Sit_Campfire		(14,00,22,00,"OCR_HUT_68_BACK");
};